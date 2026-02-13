# 重新加载 .gitignore 规则
# 这个脚本会把 Git 缓存清空并重新按照当前的 .gitignore 规则添加文件
# 这样可以解决“明明在 .gitignore 里写了，但大文件还是被 Git 跟踪”的问题

Write-Host "🧹 正在清理 Git 缓存..." -ForegroundColor Cyan

# 1. 强制移除所有文件的缓存 (针对已修改的 staged 文件需要 -f)
git rm -r -f --cached . --ignore-unmatch

# 2. 重新添加所有文件 (Git 会根据最新的 .gitignore 自动忽略大文件)
git add .

Write-Host "✨ 完成！" -ForegroundColor Green
Write-Host "现在你可以运行 git commit 来提交这些更改了。" -ForegroundColor Yellow
