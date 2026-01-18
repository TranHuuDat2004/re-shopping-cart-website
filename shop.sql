CREATE DATABASE IF NOT EXISTS shop_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE shop_db;

-- =====================
-- USERS
-- =====================
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- =====================
-- PRODUCTS
-- =====================
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    image_url VARCHAR(255),
    price DECIMAL(10,2) NOT NULL
);

-- =====================
-- CARTS
-- =====================
CREATE TABLE carts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- =====================
-- CART ITEMS
-- =====================
CREATE TABLE cart_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,

    FOREIGN KEY (cart_id) REFERENCES carts(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

ALTER TABLE cart_items
ADD CONSTRAINT uk_cart_product UNIQUE (cart_id, product_id);

-- =====================
-- USERS
-- =====================
INSERT INTO users (name) VALUES
('Nguyen Van A');

-- =====================
-- PRODUCTS (CHỈ 2 SẢN PHẨM)
-- =====================
INSERT INTO products (name, image_url, price) VALUES
('Phone Case', 'op-dien-thoai.jpg', 155000),
('Phone Charger', 'cong-chuyen-usb.jpg', 150000);

-- =====================
-- CARTS
-- =====================
INSERT INTO carts (user_id) VALUES
(1);
-- cart_id = 1

-- =====================
-- CART ITEMS (CHỈ 2 SẢN PHẨM)
-- =====================
INSERT INTO cart_items (cart_id, product_id, quantity) VALUES
(1, 1, 4), -- Phone Case x4
(1, 2, 1); -- Phone Charger x1