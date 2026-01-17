# Hướng dẫn chạy ứng dụng Shopping Cart

## Yêu cầu hệ thống
- Java 21 hoặc cao hơn
- MySQL Server
- Gradle (hoặc sử dụng Gradle Wrapper có sẵn)

## Các bước chạy ứng dụng

### Bước 1: Tạo Database
1. Đảm bảo MySQL Server đang chạy
2. Tạo database và import dữ liệu bằng một trong các cách sau:

**Cách 1: Sử dụng MySQL Command Line**
```bash
mysql -u root -proot < shop.sql
```

**Cách 2: Sử dụng MySQL Workbench**
- Mở MySQL Workbench
- Kết nối đến MySQL server (localhost:3306, user: root, password: root)
- Mở file `shop.sql` và chạy script

**Cách 3: Sử dụng phpMyAdmin**
- Mở phpMyAdmin
- Tạo database mới tên `defaultdb`
- Import file `shop.sql`

### Bước 2: Chạy ứng dụng Spring Boot

**Cách 1: Sử dụng Gradle Wrapper (Khuyến nghị)**

Trên Windows:
```bash
.\gradlew.bat bootRun
```

Trên Linux/Mac:
```bash
./gradlew bootRun
```

**Cách 2: Build và chạy JAR file**

Trên Windows:
```bash
.\gradlew.bat build
.\gradlew.bat bootRun
```

Hoặc:
```bash
.\gradlew.bat build
java -jar build\libs\re-shopping-cart-web-app-0.0.1-SNAPSHOT.jar
```

**Cách 3: Sử dụng IDE (IntelliJ IDEA, Eclipse, VS Code)**
1. Mở project trong IDE
2. Tìm file `ReShoppingCartWebAppApplication.java`
3. Click chuột phải và chọn "Run" hoặc nhấn Shift+F10

### Bước 3: Truy cập ứng dụng
Sau khi ứng dụng khởi động thành công, mở trình duyệt và truy cập:
```
http://localhost:8080
```

## Kiểm tra cấu hình

File `application.yaml` đã được cấu hình với:
- Database: `defaultdb`
- Username: `root`
- Password: `root`
- Port: `8080`

Nếu MySQL của bạn có cấu hình khác, hãy cập nhật file `src/main/resources/application.yaml`.

## Xử lý lỗi thường gặp

1. **Lỗi kết nối database**: 
   - Kiểm tra MySQL Server đang chạy
   - Kiểm tra username/password trong `application.yaml`
   - Đảm bảo database `defaultdb` đã được tạo

2. **Lỗi Java version**:
   - Kiểm tra Java version: `java -version`
   - Cần Java 21 hoặc cao hơn

3. **Lỗi port đã được sử dụng**:
   - Thay đổi port trong `application.yaml` (ví dụ: 8081)
   - Hoặc tắt ứng dụng đang chạy trên port 8080
