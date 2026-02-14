# 部署指南 (Deployment Guide)

本项目采用 **Nginx + PM2** 的方案进行部署。

## 1. 准备工作

在服务器上安装必要的软件：

```bash
# 安装 PM2
npm install -g pm2

# 安装 Nginx
sudo apt update
sudo apt install nginx -y
```

## 2. 部署步骤

### 第一步：代码同步与构建
在服务器的项目目录下执行：

```bash
# 安装依赖
npm install

# 构建生产环境代码
npm run build
```

### 第二步：使用 PM2 启动服务
```bash
# 启动服务
pm2 start npm --name "jlu-biomod" -- start

# 设置开机自启
pm2 save
pm2 startup
```

### 第三步：配置 Nginx
1. 将本地的 `nginx.conf` (位于 `deployment/nginx.conf`) 拷贝并修改后放入服务器的 `/etc/nginx/sites-available/jlu-biomod`。
2. 启用并重启 Nginx：

```bash
sudo ln -s /etc/nginx/sites-available/jlu-biomod /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

## 3. 常用维护命令

- **查看状态**: `pm2 list`
- **查看日志**: `pm2 logs jlu-biomod`
- **重启服务**: `pm2 restart jlu-biomod`
- **更新代码**: `git pull && npm install && npm run build && pm2 restart jlu-biomod`
