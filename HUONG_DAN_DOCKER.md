# Hướng dẫn chạy Docker và kết nối MySQL Workbench

## 1. Chuẩn bị môi trường

**QUAN TRỌNG:** Bạn cần đảm bảo **Docker Desktop** đã được cài đặt và **đang chạy** trên máy tính của bạn.
Nếu bạn gặp lỗi liên quan đến `//./pipe/dockerDesktopLinuxEngine`, hãy mở Docker Desktop lên và đợi nó khởi động xong.

## 2. Các lệnh Docker

Tại thư mục gốc của dự án, mở Terminal (PowerShell hoặc CMD) và chạy:

### Khởi động ứng dụng
Lệnh này sẽ build ứng dụng và khởi chạy cả MySQL và Web App dưới nền.
```powershell
docker compose up -d --build
```

### Xem log
Để xem ứng dụng đang chạy như thế nào:
```powershell
docker compose logs -f
```

### Dừng ứng dụng
```powershell
docker compose down
```

## 3. Cấu hình MySQL Workbench

Sau khi chạy lệnh khởi động thành công, bạn cấu hình MySQL Workbench như sau:

1.  Mở MySQL Workbench.
2.  Bấm vào dấu `+` cạnh **MySQL Connections**.
3.  Điền thông tin:
    *   **Connection Name:** `Docker Shop DB` (hoặc tên tùy ý)
    *   **Hostname:** `localhost`
    *   **Port:** `3306`
    *   **Username:** `root`
4.  Bấm **Store in Vault...** (hoặc Test Connection) và nhập password: `root`
5.  Bấm **OK** để lưu và kết nối.

## 4. Thông tin Database

*   **Database Name:** `shop_db`
*   **Dữ liệu khởi tạo:** Hệ thống sẽ tự động chạy file `shop.sql` khi khởi tạo lần đầu để tạo bảng và dữ liệu mẫu.

## 5. Truy cập Website

Sau khi khởi động xong, truy cập: [http://localhost:8080](http://localhost:8080)
