-- DDL
CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- DML (Sample Data)
INSERT INTO Products (ProductName, Category, Price) VALUES
('Laptop Pro', 'Electronics', 1500.00),
('Standard Laptop', 'Electronics', 900.00),
('Budget Laptop', 'Electronics', 400.00),
('Smartphone X', 'Electronics', 800.00),
('Smartphone Y', 'Electronics', 500.00),

('Ergonomic Chair', 'Furniture', 300.00),
('Basic Office Chair', 'Furniture', 80.00),
('Standing Desk', 'Furniture', 500.00),
('Standard Desk', 'Furniture', 150.00),

('Wireless Mouse', 'Accessories', 50.00),
('Wired Mouse', 'Accessories', 15.00),
('Mechanical Keyboard', 'Accessories', 120.00),
('Basic Keyboard', 'Accessories', 25.00);

-- Averages:
-- Electronics: (1500 + 900 + 400 + 800 + 500) / 5 = 820 -> Laptop Pro, Standard Laptop
-- Furniture: (300 + 80 + 500 + 150) / 4 = 257.5 -> Ergonomic Chair, Standing Desk
-- Accessories: (50 + 15 + 120 + 25) / 4 = 52.5 -> Mechanical Keyboard
