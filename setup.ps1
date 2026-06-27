Set-Location $PSScriptRoot

Write-Host "=== AI Tavern Setup ===" -ForegroundColor Cyan

if (-not (Test-Path "SillyTavern")) {
    Write-Host "[1/4] Cloning SillyTavern..." -ForegroundColor Yellow
    git clone https://github.com/SillyTavern/SillyTavern.git
} else {
    Write-Host "[1/4] SillyTavern exists, skipping." -ForegroundColor Green
}

if (-not (Test-Path "bridge")) {
    Write-Host "[2/4] Cloning bridge..." -ForegroundColor Yellow
    git clone https://github.com/MissSinful/claude-code-sillytavern-bridge.git bridge
} else {
    Write-Host "[2/4] bridge exists, skipping." -ForegroundColor Green
}

Write-Host "[3/4] Installing dependencies..." -ForegroundColor Yellow

Set-Location "$PSScriptRoot\SillyTavern"
npm install

Set-Location "$PSScriptRoot\bridge"
python3.13.exe -m venv .venv
.\.venv\Scripts\python.exe -m pip install flask flask-cors

Write-Host "[4/4] Configuring SillyTavern..." -ForegroundColor Yellow
$configPath = "$PSScriptRoot\SillyTavern\config.yaml"
if (Test-Path $configPath) {
    $content = [IO.File]::ReadAllText($configPath, [Text.Encoding]::UTF8)
    $content = [regex]::Replace($content, '(?m)^port: \d+', 'port: 4000')
    $content = $content -replace 'listen: false', 'listen: true'
    [IO.File]::WriteAllText($configPath, $content, [Text.Encoding]::UTF8)
    Write-Host "    SillyTavern port set to 4000." -ForegroundColor Green
}

Set-Location $PSScriptRoot
Write-Host "=== Setup complete. Run start.ps1 to launch. ===" -ForegroundColor Green
