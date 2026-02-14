# 自动同步静态资源到阿里云 OSS
# 依赖：需在 D:\Coding\ossutil-v1.7.19-windows-amd64\ 路径下存在 ossutil64.exe
# 且已通过 ossutil64.exe config 完成配置

$OSSUTIL_PATH = "D:\Coding\ossutil-v1.7.19-windows-amd64\ossutil64.exe"
$BUCKET_NAME  = "jlu-biomod-assets"

Write-Host "🚀 正在同步本地 archive 目录到 OSS..." -ForegroundColor Cyan

# 执行同步
# 仅同步 archive 目录到 OSS 的 archive/ 路径下
& $OSSUTIL_PATH cp -r ./public/archive/ oss://$BUCKET_NAME/archive/ -u

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ 同步成功！" -ForegroundColor Green
} else {
    Write-Host "❌ 同步失败，请检查配置或权限。" -ForegroundColor Red
}
