# 同步大文件资源到服务器 (Videos & Zips)
# 依赖：需要在 Windows 上安装 Git Bash (自带 rsync) 或 WSL
# 或者在 PowerShell 中确保 rsync 命令可用

# --- 请填写以下服务器信息 ---
$SERVER_USER = "root"          # 服务器用户名
$SERVER_IP   = "154.92.15.62"       # 服务器 IP 或 域名
$DEST_PATH   = "/var/www/jlu-biomod" # 服务器上的项目路径
# ---------------------------

Write-Host "🚀 开始增量同步大文件到服务器..." -ForegroundColor Cyan

# 解释参数：
# -a: 归档模式 (保持权限/时间)
# -v: 详细输出
# -z: 传输时压缩数据
# -P: 显示进度
# --include='*/': 包含所有文件夹
# --include='*.mp4': 包含所有 mp4 视频
# --include='*.zip': 包含所有 zip 压缩包
# --include='*.psd': 包含所有 psd 源文件
# --exclude='*': 排除其他所有文件 (其他文件建议走 Git 同步)

rsync -avzP `
    --include='*/' `
    --include='*.mp4' `
    --include='*.zip' `
    --include='*.psd' `
    --exclude='*' `
    ./public/archive/ `
    "${SERVER_USER}@${SERVER_IP}:${DEST_PATH}/public/archive/"

Write-Host "✅ 大文件同步完成！" -ForegroundColor Green
