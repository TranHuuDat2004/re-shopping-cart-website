# Hướng dẫn cài đặt và sử dụng Ngrok

## Ngrok là gì?
Ngrok là công cụ tạo tunnel công khai đến localhost, cho phép bạn chia sẻ ứng dụng local với internet hoặc test webhook.

## Đã cài đặt
Ngrok đã được tải và đặt trong thư mục `tools/ngrok/`

## Cấu hình Authtoken (Khuyến nghị)

### Bước 1: Đăng ký tài khoản Ngrok
1. Truy cập: https://dashboard.ngrok.com/signup
2. Đăng ký tài khoản miễn phí

### Bước 2: Lấy Authtoken
1. Đăng nhập vào: https://dashboard.ngrok.com/get-started/your-authtoken
2. Copy authtoken của bạn

### Bước 3: Cấu hình Authtoken
Mở file `tools/ngrok/ngrok.yml` và thay thế `YOUR_NGROK_AUTHTOKEN_HERE` bằng authtoken của bạn:

```yaml
authtoken: your-actual-authtoken-here
```

Hoặc chạy lệnh:
```powershell
.\tools\ngrok\ngrok.exe config add-authtoken YOUR_AUTHTOKEN
```

## Cách sử dụng

### Cách 1: Sử dụng script với config (Khuyến nghị)
```powershell
.\start-ngrok.ps1
```

### Cách 2: Sử dụng script đơn giản (không cần config)
```powershell
.\start-ngrok-simple.ps1
```

### Cách 3: Chạy trực tiếp
```powershell
# Với config file
.\tools\ngrok\ngrok.exe start --config .\tools\ngrok\ngrok.yml spring-boot-app

# Hoặc đơn giản
.\tools\ngrok\ngrok.exe http 8080
```

## Lưu ý

1. **Đảm bảo Spring Boot app đang chạy** trên port 8080 trước khi start ngrok
2. **Authtoken** cho phép bạn:
   - Sử dụng custom domain
   - Tăng thời gian session
   - Xem request logs trên dashboard
   - Nhiều tính năng khác

3. **URL công khai** sẽ được hiển thị trong terminal sau khi start ngrok
   - Ví dụ: `https://abc123.ngrok-free.app` -> `http://localhost:8080`

## Xem Dashboard
Truy cập https://dashboard.ngrok.com để xem:
- Request logs
- Traffic statistics
- Tunnel status

## Troubleshooting

### Lỗi: "authtoken is required"
- Cấu hình authtoken trong `tools/ngrok/ngrok.yml` hoặc chạy lệnh config

### Lỗi: "port 8080 is already in use"
- Kiểm tra xem có ứng dụng khác đang dùng port 8080 không
- Hoặc đổi port trong script

### Ngrok không kết nối được
- Kiểm tra firewall
- Đảm bảo Spring Boot app đang chạy
- Kiểm tra kết nối internet

## Ví dụ sử dụng với Spring Boot

1. **Start Spring Boot app:**
   ```powershell
   .\gradlew.bat bootRun
   ```

2. **Trong terminal khác, start ngrok:**
   ```powershell
   .\start-ngrok.ps1
   ```

3. **Copy URL công khai** từ ngrok và chia sẻ với người khác hoặc dùng để test webhook
