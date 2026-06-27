$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

Write-Host "Starting bridge..." -ForegroundColor Cyan
$bridge = Start-Process -FilePath "$PSScriptRoot\bridge\.venv\Scripts\python.exe" -ArgumentList "claude_bridge.py" -WorkingDirectory "$PSScriptRoot\bridge" -PassThru -WindowStyle Minimized

Start-Sleep -Seconds 2

Write-Host "Starting SillyTavern..." -ForegroundColor Cyan
$st = Start-Process -FilePath "node" -ArgumentList "server.js" -WorkingDirectory "$PSScriptRoot\SillyTavern" -PassThru -WindowStyle Minimized

Start-Sleep -Seconds 3

Start-Process "http://localhost:8000"

Write-Host "Done. Close this window to stop." -ForegroundColor Green

try {
    Wait-Process -Id $bridge.Id
} catch {
    $bridge | Stop-Process -Force -ErrorAction SilentlyContinue
    $st | Stop-Process -Force -ErrorAction SilentlyContinue
}
