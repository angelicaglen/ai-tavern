# AI 酒馆一键安装脚本
# 运行前确保已安装：Git、Node.js 18+、Python 3.10+、Claude Code

Set-Location $PSScriptRoot

Write-Host "=== AI 酒馆安装开始 ===" -ForegroundColor Cyan

# 1. 克隆 SillyTavern
if (-not (Test-Path "SillyTavern")) {
    Write-Host "[1/3] 克隆 SillyTavern..." -ForegroundColor Yellow
    git clone https://github.com/SillyTavern/SillyTavern.git
} else {
    Write-Host "[1/3] SillyTavern 已存在，跳过" -ForegroundColor Green
}

# 2. 克隆 bridge
if (-not (Test-Path "bridge")) {
    Write-Host "[2/3] 克隆 claude-code-sillytavern-bridge..." -ForegroundColor Yellow
    git clone https://github.com/MissSinful/claude-code-sillytavern-bridge.git bridge
} else {
    Write-Host "[2/3] bridge 已存在，跳过" -ForegroundColor Green
}

# 3. 安装依赖
Write-Host "[3/3] 安装依赖..." -ForegroundColor Yellow

Set-Location "$PSScriptRoot\SillyTavern"
npm install

Set-Location "$PSScriptRoot\bridge"
pip install -r requirements.txt

Set-Location $PSScriptRoot
Write-Host "=== 安装完成，运行 start.ps1 启动 ===" -ForegroundColor Green
