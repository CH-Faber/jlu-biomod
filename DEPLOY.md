# 部署指南

本项目采用 **Next.js 静态导出 + Nginx + 阿里云 OSS** 的方案，不需要在生产服务器安装 Node.js、PM2 或运行常驻应用进程。

## 架构

- Next.js 主页、历年作品索引和资源页导出为纯静态文件。
- Nginx 从 `/var/www/jlu-biomod/current` 直接提供静态文件。
- `/archive/<年份>/...` 保持原 URL，由 Nginx 反向代理到 `jlu-biomod-assets.oss-cn-guangzhou.aliyuncs.com`。
- 每次部署进入独立的 `releases/<时间戳>` 目录，然后原子切换 `current` 软链接，便于回滚。
- BioMod 使用独立子域名 `biomod.faberhu.top`，不覆盖主站和其他子域名配置。

## 1. 构建

`public/archive` 中的历年站点已上传到 OSS，不应再复制进静态导出目录。构建时可将该目录临时移出项目，并在构建结束后立即恢复。

```powershell
npm ci
npm run lint
npm run build
```

成功后应生成 `out` 目录，至少包含：

```text
out/index.html
out/archive/index.html
out/resources/index.html
```

## 2. 发布目录

生产服务器目录结构：

```text
/var/www/jlu-biomod/
├── current -> releases/<当前版本>
└── releases/
    └── <时间戳>/
```

将 `out` 打包上传后，解压到新 release，检查入口文件，最后切换软链接。不要直接覆盖 `current` 指向的目录。

## 3. Nginx

HTTP 初始配置位于 `deployment/nginx.static-http.conf`，签发证书后使用最终配置 `deployment/nginx.conf`。生产位置是：

```text
/etc/nginx/sites-available/biomod
/etc/nginx/sites-enabled/biomod
```

启用或修改后必须先执行 `nginx -t`。只有验证成功后才可执行 `systemctl reload nginx`。

不需要重启 Nginx，也不需要重启 CopyBlog、gosync、tender-api 或其他服务。

## 4. DNS 和 HTTPS

Cloudflare 中 `biomod.faberhu.top` 的 A 记录应指向生产服务器。切换 DNS 前，先在服务器本机使用 Host 头验证：

```bash
curl -I -H 'Host: biomod.faberhu.top' http://127.0.0.1/
curl -I -H 'Host: biomod.faberhu.top' http://127.0.0.1/archive/
curl -I -H 'Host: biomod.faberhu.top' http://127.0.0.1/archive/2025/index.html
```

DNS 生效后，使用 Certbot webroot 模式签发证书，避免 Certbot 自动改写其他 Nginx 站点。签发成功后安装 `deployment/nginx.conf`，再执行 `nginx -t` 和 reload。Certbot 定时器应保持启用，并用 `certbot renew --dry-run --cert-name biomod.faberhu.top` 验证自动续期。

## 5. 回滚

回滚只需将 `current` 指回已验证的上一个 release：

```bash
ln -sfn releases/<上一版本> /var/www/jlu-biomod/current.new
mv -Tf /var/www/jlu-biomod/current.new /var/www/jlu-biomod/current
nginx -t
systemctl reload nginx
```

回滚不需要修改 DNS、OSS 或其他服务。
