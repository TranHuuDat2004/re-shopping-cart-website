# Simple script to start ngrok without config file
# This will start ngrok on port 8080 without authentication (limited features)

Write-Host "Starting ngrok on port 8080..." -ForegroundColor Green
Write-Host "Note: For full features, configure authtoken in tools/ngrok/ngrok.yml" -ForegroundColor Yellow
Write-Host ""

$ngrokPath = ".\tools\ngrok\ngrok.exe"

if (-not (Test-Path $ngrokPath)) {
    Write-Host "Error: ngrok.exe not found!" -ForegroundColor Red
    exit 1
}

& $ngrokPath http 8080
