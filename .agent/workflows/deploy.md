---
description: 如何将 jlu-biomod 部署到 Linux 服务器
---

1. 确保服务器已安装 Node.js 18+ 或 20+。
2. 在服务器上安装 PM2:
```bash
npm install -g pm2
```
3. 安装 Nginx:
```bash
sudo apt update && sudo apt install nginx -y
```
4. 进入项目目录并构建:
```bash
npm install
npm run build
```
5. 使用 PM2 启动项目:
```bash
pm2 start npm --name "jlu-biomod" -- start
```
6. 配置 Nginx 反向代理:
   - 参考 `deployment/nginx.conf` 修改 `/etc/nginx/sites-available/jlu-biomod`
   - 运行 `sudo ln -s /etc/nginx/sites-available/jlu-biomod /etc/nginx/sites-enabled/`
   - 运行 `sudo systemctl restart nginx`
