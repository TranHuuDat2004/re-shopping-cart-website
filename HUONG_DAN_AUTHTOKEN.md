# Hướng dẫn lấy và cấu hình Ngrok Authtoken

## Lỗi: "authentication failed: Usage of ngrok requires a verified account and authtoken"

Ngrok yêu cầu authtoken để sử dụng. Làm theo các bước sau:

## Bước 1: Đăng ký tài khoản Ngrok (MIỄN PHÍ)

1. Truy cập: https://dashboard.ngrok.com/signup
2. Đăng ký bằng email hoặc tài khoản GitHub/Google
3. Xác thực email nếu cần

## Bước 2: Lấy Authtoken

1. Đăng nhập vào: https://dashboard.ngrok.com/get-started/your-authtoken
2. Copy authtoken của bạn (chuỗi dài như: `2abc123def456ghi789jkl012mno345pqr678stu901vwx234yz`)

## Bước 3: Cấu hình Authtoken

### Cách 1: Sử dụng lệnh (Khuyến nghị)
```powershell
.\tools\ngrok\ngrok.exe config add-authtoken YOUR_AUTHTOKEN_HERE
```

### Cách 2: Sửa file config
1. Mở file: `tools/ngrok/ngrok.yml`
2. Thay thế `YOUR_NGROK_AUTHTOKEN_HERE` bằng authtoken của bạn
3. Lưu file

## Bước 4: Chạy lại ngrok

Sau khi cấu hình authtoken, chạy lại:
```powershell
.\start-ngrok.ps1
```

Hoặc:
```powershell
.\tools\ngrok\ngrok.exe http 8080
```

## Lưu ý

- Authtoken được lưu trong file config, không cần nhập lại mỗi lần
- File `ngrok.yml` đã được thêm vào `.gitignore` để không commit lên Git
- Một authtoken có thể dùng cho nhiều tunnel
