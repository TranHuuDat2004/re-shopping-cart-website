# Script để thiết lập JAVA_HOME vĩnh viễn trên Windows

$javaPath = "C:\Program Files\Java\jdk-21"

# Thiết lập JAVA_HOME cho User Environment Variables
[System.Environment]::SetEnvironmentVariable("JAVA_HOME", $javaPath, [System.EnvironmentVariableTarget]::User)

# Thêm Java bin vào PATH nếu chưa có
$currentPath = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::User)
$javaBinPath = "$javaPath\bin"

if ($currentPath -notlike "*$javaBinPath*") {
    $newPath = "$currentPath;$javaBinPath"
    [System.Environment]::SetEnvironmentVariable("Path", $newPath, [System.EnvironmentVariableTarget]::User)
    Write-Host "Đã thêm Java bin vào PATH" -ForegroundColor Green
} else {
    Write-Host "Java bin đã có trong PATH" -ForegroundColor Yellow
}

# Thiết lập cho session hiện tại
$env:JAVA_HOME = $javaPath
$env:PATH = "$javaBinPath;$env:PATH"

Write-Host "`nJAVA_HOME đã được thiết lập thành công!" -ForegroundColor Green
Write-Host "JAVA_HOME = $javaPath" -ForegroundColor Cyan
Write-Host "`nĐể áp dụng thay đổi, vui lòng:" -ForegroundColor Yellow
Write-Host "1. Đóng và mở lại PowerShell/Command Prompt" -ForegroundColor Yellow
Write-Host "2. Hoặc chạy: refreshenv (nếu có Chocolatey)" -ForegroundColor Yellow
Write-Host "`nKiểm tra Java version:" -ForegroundColor Cyan
java -version
