-- Part A: Normalized Schema (3NF)

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE OrderHeader (
    OrderID INT PRIMARY KEY,
    CustomerID INT REFERENCES Customer(CustomerID),
    OrderDate DATE,
    Status VARCHAR(50)
);

CREATE TABLE OrderLine (
    OrderID INT REFERENCES OrderHeader(OrderID),
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    PRIMARY KEY (OrderID, ProductID)
);

-- Part B: Denormalized Schema

CREATE TABLE CustomerSummary (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    TotalOrders INT,
    TotalRevenue DECIMAL(10,2),
    LastOrderDate DATE
);

-- ----------------------------------------------------------------------------------
-- Data Generation Script using PostgreSQL generate_series()
-- This will populate the 3NF schema with a large dataset for performance testing.
-- ----------------------------------------------------------------------------------

-- 1. Generate 1,000 Customers
INSERT INTO Customer (CustomerID, Name, Email)
SELECT 
    i, 
    'Customer ' || i, 
    'customer' || i || '@example.com'
FROM generate_series(1, 1000) AS i;

-- 2. Generate 5,000 Orders (randomly assigned to customers)
INSERT INTO OrderHeader (OrderID, CustomerID, OrderDate, Status)
SELECT 
    i, 
    (random() * 999 + 1)::INT, -- Random CustomerID between 1 and 1000
    CURRENT_DATE - (random() * 365)::INT, -- Random date in the last year
    CASE (random() * 2)::INT 
        WHEN 0 THEN 'Pending' 
        WHEN 1 THEN 'Shipped' 
        ELSE 'Delivered' 
    END
FROM generate_series(1, 5000) AS i;

-- 3. Generate 20,000 Order Lines (roughly 4 per order)
INSERT INTO OrderLine (OrderID, ProductID, Quantity, UnitPrice)
SELECT 
    (random() * 4999 + 1)::INT, -- Random OrderID between 1 and 5000
    (random() * 500 + 1)::INT,  -- Random ProductID between 1 and 500
    (random() * 10 + 1)::INT,   -- Random Quantity between 1 and 10
    (random() * 100 + 10)::DECIMAL(10,2) -- Random UnitPrice between 10 and 110
FROM generate_series(1, 20000) AS i
ON CONFLICT (OrderID, ProductID) DO NOTHING; -- Ignore duplicates for the composite PK

-- ----------------------------------------------------------------------------------
-- Tasks 3, 4, 5, 6, & 7 (JOIN Query, Population, EXPLAIN ANALYZE, Triggers) 
-- will be completed by students.
-- ----------------------------------------------------------------------------------
