# AI 酒馆一键启动脚本

Set-Location $PSScriptRoot

# 启动 bridge（后台）
Write-Host "启动 bridge 服务..." -ForegroundColor Cyan
$bridge = Start-Process -FilePath "python" -ArgumentList "app.py" -WorkingDirectory "$PSScriptRoot\bridge" -PassThru -WindowStyle Minimized

Start-Sleep -Seconds 2

# 启动 SillyTavern（后台）
Write-Host "启动 SillyTavern..." -ForegroundColor Cyan
$st = Start-Process -FilePath "node" -ArgumentList "server.js" -WorkingDirectory "$PSScriptRoot\SillyTavern" -PassThru -WindowStyle Minimized

Start-Sleep -Seconds 3

# 打开浏览器
Start-Process "http://localhost:8000"

Write-Host "已启动，在浏览器里操作 SillyTavern" -ForegroundColor Green
Write-Host "关闭此窗口前请先停止服务（Ctrl+C）" -ForegroundColor Yellow

# 等待退出
try {
    Wait-Process -Id $bridge.Id
} catch {
    $bridge | Stop-Process -Force -ErrorAction SilentlyContinue
    $st | Stop-Process -Force -ErrorAction SilentlyContinue
}
