CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Category VARCHAR(100),
    BasePrice DECIMAL(10, 2) NOT NULL,
    StockQuantity INT
);

INSERT INTO Products (ProductName, Category, BasePrice, StockQuantity) VALUES
('Gaming Mouse', 'Electronics', 49.99, 150),
('Mechanical Keyboard', 'Electronics', 89.99, 85),
('Samsonite Laptop Backpack', 'Accessories', 65.00, 40),
('Dell XPS 15 Laptop', 'Electronics', 1499.00, 10),
('MacBook Air M2 Laptop', 'Electronics', 1199.00, 25),
('Samsung 4K Monitor', 'Electronics', 350.00, 0),
('Samsung Galaxy S23', 'Electronics', 799.00, NULL),
('Samurai Sword Replica', 'Collectibles', 250.00, 5),
('Basic T-Shirt', 'Clothing', 15.50, 200),
('Wireless Earbuds', 'Electronics', 120.00, 60),
('Ergonomic Chair', 'Furniture', 299.99, 0),
('HDMI Cable', 'Electronics', 9.99, NULL),
('Coffee Mug', 'Kitchen', 12.00, 300),
('Desk Lamp', 'Furniture', 35.00, 45),
('Lenovo ThinkPad Laptop', 'Electronics', 1050.00, 15);
