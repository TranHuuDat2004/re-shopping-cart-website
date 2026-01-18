# Script to start ngrok tunnel for Spring Boot application
# Make sure your Spring Boot app is running on port 8080 before running this script

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Starting Ngrok Tunnel" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$ngrokPath = ".\tools\ngrok\ngrok.exe"
$configPath = ".\tools\ngrok\ngrok.yml"

# Check if ngrok exists
if (-not (Test-Path $ngrokPath)) {
    Write-Host "Error: ngrok.exe not found at $ngrokPath" -ForegroundColor Red
    Write-Host "Please make sure ngrok is installed." -ForegroundColor Yellow
    exit 1
}

# Check if config file exists
if (-not (Test-Path $configPath)) {
    Write-Host "Warning: ngrok.yml not found. Creating default config..." -ForegroundColor Yellow
    # Config will be created by ngrok.yml file
}

# Check if Spring Boot app is running on port 8080
$portCheck = Test-NetConnection -ComputerName localhost -Port 8080 -InformationLevel Quiet -WarningAction SilentlyContinue
if (-not $portCheck) {
    Write-Host "Warning: No service detected on port 8080" -ForegroundColor Yellow
    Write-Host "Make sure your Spring Boot application is running before starting ngrok!" -ForegroundColor Yellow
    Write-Host ""
    $continue = Read-Host "Do you want to continue anyway? (y/n)"
    if ($continue -ne "y" -and $continue -ne "Y") {
        exit 0
    }
}

Write-Host "Starting ngrok tunnel on port 8080..." -ForegroundColor Green
Write-Host "Public URL will be displayed below." -ForegroundColor Cyan
Write-Host ""
Write-Host "Press Ctrl+C to stop ngrok" -ForegroundColor Yellow
Write-Host ""

# Start ngrok
if (Test-Path $configPath) {
    & $ngrokPath start --config $configPath spring-boot-app
} else {
    & $ngrokPath http 8080
}
