-- DDL
CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    UnitPrice DECIMAL(10, 2)
);

CREATE TABLE OrderDetails (
    OrderDetailID SERIAL PRIMARY KEY,
    OrderID INT,
    ProductID INT REFERENCES Products(ProductID),
    Quantity INT,
    Discount DECIMAL(5, 2)
);

-- DML (Sample Data)
INSERT INTO Products (ProductName, Category, UnitPrice) VALUES
('Laptop Pro', 'Electronics', 1500.00),
('Smartphone X', 'Electronics', 800.00),
('Wireless Mouse', 'Accessories', 50.00),
('Ergonomic Chair', 'Furniture', 300.00),
('Standing Desk', 'Furniture', 500.00),
('Mechanical Keyboard', 'Accessories', 120.00);

-- Make sure we have a mix.
-- Laptop Pro: Let's sell 10 of them (Revenue = $15,000) -> > $10,000
-- Smartphone X: Sell 15 of them (Revenue = $12,000) -> > $10,000
-- Standing Desk: Sell 25 of them (Revenue = $12,500) -> > $10,000
-- Others: < $10,000
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Discount) VALUES
(1001, 1, 5, 0.00),
(1002, 1, 5, 0.00),
(1003, 2, 10, 0.10),
(1004, 2, 5, 0.00),
(1005, 3, 20, 0.00),
(1006, 4, 10, 0.00),
(1007, 5, 15, 0.05),
(1008, 5, 10, 0.00),
(1009, 6, 30, 0.00);
