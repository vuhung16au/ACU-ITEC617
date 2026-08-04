-- 1. Create the Flat Table (Unnormalized)
CREATE TABLE OrderFlat (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    CustomerEmail VARCHAR(100),
    Products VARCHAR(500),    -- "Laptop, Mouse, Keyboard"
    Quantities VARCHAR(100),  -- "1, 2, 1"
    UnitPrices VARCHAR(100)   -- "1200.00, 25.00, 45.00"
);

-- Task 1: Insert 5 sample orders with multiple products (comma-separated)
INSERT INTO OrderFlat (OrderID, CustomerName, CustomerEmail, Products, Quantities, UnitPrices) VALUES
(1, 'Alice Smith', 'alice@example.com', 'Laptop, Mouse, Keyboard', '1, 2, 1', '1200.00, 25.00, 45.00'),
(2, 'Bob Jones', 'bob@example.com', 'Monitor, HDMI Cable', '2, 3', '250.00, 15.00'),
(3, 'Charlie Brown', 'charlie@example.com', 'Tablet', '1', '400.00'),
(4, 'Diana Prince', 'diana@example.com', 'Desk, Chair, Lamp', '1, 1, 2', '300.00, 150.00, 35.00'),
(5, 'Alice Smith', 'alice@example.com', 'Headphones', '1', '120.00');

-- ----------------------------------------------------------------------------------
-- The following schema is provided as the target normalized state (1NF/2NF/3NF).
-- Students will practice designing these and migrating the data in the exercise.
-- ----------------------------------------------------------------------------------

-- CREATE TABLE Customer (
--     CustomerID SERIAL PRIMARY KEY,
--     Name VARCHAR(100),
--     Email VARCHAR(100)
-- );

-- CREATE TABLE Product (
--     ProductID SERIAL PRIMARY KEY,
--     Name VARCHAR(100),
--     UnitPrice DECIMAL(10, 2)
-- );

-- CREATE TABLE OrderHeader (
--     OrderID INT PRIMARY KEY,
--     CustomerID INT REFERENCES Customer(CustomerID)
-- );

-- CREATE TABLE OrderLine (
--     OrderID INT REFERENCES OrderHeader(OrderID),
--     ProductID INT REFERENCES Product(ProductID),
--     Quantity INT,
--     PRIMARY KEY (OrderID, ProductID)
-- );

-- ----------------------------------------------------------------------------------
-- Task 5 & 6 (Migration and Join) will be completed by students.
-- ----------------------------------------------------------------------------------
