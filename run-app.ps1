# Script để chạy ứng dụng Spring Boot và hiển thị log

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Starting Spring Boot Application" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Thiết lập JAVA_HOME
$env:JAVA_HOME = "C:\Program Files\Java\jdk-21"
$env:PATH = "C:\Program Files\Java\jdk-21\bin;$env:PATH"

Write-Host "JAVA_HOME: $env:JAVA_HOME" -ForegroundColor Green
Write-Host "Java Version:" -ForegroundColor Yellow
java -version
Write-Host ""

# Kiểm tra database connection (optional)
Write-Host "Luu y: Dam bao database 'defaultdb' da duoc tao!" -ForegroundColor Yellow
Write-Host "Neu chua tao, hay chay file shop.sql trong MySQL truoc." -ForegroundColor Yellow
Write-Host ""

# Chạy ứng dụng
Write-Host "Dang khoi dong ung dung..." -ForegroundColor Cyan
Write-Host "Truy cap: http://localhost:8080 sau khi khoi dong xong" -ForegroundColor Green
Write-Host ""

cmd /c "gradlew.bat bootRun"
