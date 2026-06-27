Set-Location $PSScriptRoot

Write-Host "=== AI Tavern Setup ===" -ForegroundColor Cyan

if (-not (Test-Path "SillyTavern")) {
    Write-Host "[1/3] Cloning SillyTavern..." -ForegroundColor Yellow
    git clone https://github.com/SillyTavern/SillyTavern.git
} else {
    Write-Host "[1/3] SillyTavern exists, skipping." -ForegroundColor Green
}

if (-not (Test-Path "bridge")) {
    Write-Host "[2/3] Cloning bridge..." -ForegroundColor Yellow
    git clone https://github.com/MissSinful/claude-code-sillytavern-bridge.git bridge
} else {
    Write-Host "[2/3] bridge exists, skipping." -ForegroundColor Green
}

Write-Host "[3/3] Installing dependencies..." -ForegroundColor Yellow

Set-Location "$PSScriptRoot\SillyTavern"
npm install

Set-Location "$PSScriptRoot\bridge"
python -m pip install -r requirements.txt

Set-Location $PSScriptRoot
Write-Host "=== Setup complete. Run start.ps1 to launch. ===" -ForegroundColor Green
