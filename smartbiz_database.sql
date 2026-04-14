-- Create Database
CREATE DATABASE smartbiz;
USE smartbiz;

-- USERS TABLE
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    role ENUM('admin', 'accountant', 'staff') DEFAULT 'staff',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CUSTOMERS TABLE
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- PRODUCTS TABLE
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    gst_percentage DECIMAL(5,2),
    stock INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- INVOICES TABLE
CREATE TABLE invoices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10,2),
    gst_amount DECIMAL(10,2),
    final_amount DECIMAL(10,2),
    invoice_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- INVOICE ITEMS TABLE
CREATE TABLE invoice_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    gst DECIMAL(10,2),
    total DECIMAL(10,2),
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- EXPENSES TABLE
CREATE TABLE expenses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    category VARCHAR(50),
    amount DECIMAL(10,2),
    expense_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- INCOME TABLE
CREATE TABLE income (
    id INT AUTO_INCREMENT PRIMARY KEY,
    source VARCHAR(100),
    amount DECIMAL(10,2),
    income_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- SAMPLE DATA
INSERT INTO users (name, email, password, role) VALUES
('Admin User', 'admin@smartbiz.com', 'admin123', 'admin');

INSERT INTO customers (name, email, phone, address) VALUES
('Rahul Sharma', 'rahul@gmail.com', '9876543210', 'Mumbai'),
('Priya Patel', 'priya@gmail.com', '9123456780', 'Surat');

INSERT INTO products (name, price, gst_percentage, stock) VALUES
('Laptop', 50000, 18, 10),
('Mobile', 20000, 12, 20),
('Keyboard', 1000, 18, 50);

INSERT INTO expenses (title, category, amount, expense_date) VALUES
('Office Rent', 'Rent', 20000, '2026-04-01'),
('Electricity Bill', 'Utilities', 5000, '2026-04-05');

INSERT INTO income (source, amount, income_date) VALUES
('Sales', 80000, '2026-04-10');
