-- 01-init.sql
-- DDL for Star Schema and DML for sample data

-- Drop tables if they exist
DROP TABLE IF EXISTS FactSales;
DROP TABLE IF EXISTS DimTime;
DROP TABLE IF EXISTS DimProduct;
DROP TABLE IF EXISTS DimCustomer;
DROP TABLE IF EXISTS DimStore;

-- ==========================================
-- DDL: Dimension Tables
-- ==========================================

CREATE TABLE DimTime (
    TimeKey SERIAL PRIMARY KEY,
    SaleDate DATE NOT NULL,
    DayOfWeek VARCHAR(10) NOT NULL,
    IsWeekend BOOLEAN NOT NULL,
    Month INT NOT NULL,
    Quarter INT NOT NULL,
    Year INT NOT NULL
);

CREATE TABLE DimProduct (
    ProductKey SERIAL PRIMARY KEY,
    ProductID VARCHAR(50) NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Brand VARCHAR(50) NOT NULL
);

CREATE TABLE DimCustomer (
    CustomerKey SERIAL PRIMARY KEY,
    CustomerID VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    AgeGroup VARCHAR(20) NOT NULL,
    City VARCHAR(50) NOT NULL
);

CREATE TABLE DimStore (
    StoreKey SERIAL PRIMARY KEY,
    StoreID VARCHAR(50) NOT NULL,
    StoreName VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Region VARCHAR(50) NOT NULL
);

-- ==========================================
-- DDL: Fact Table
-- ==========================================

CREATE TABLE FactSales (
    SalesKey SERIAL PRIMARY KEY,
    TimeKey INT NOT NULL,
    ProductKey INT NOT NULL,
    CustomerKey INT NOT NULL,
    StoreKey INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (TimeKey) REFERENCES DimTime(TimeKey),
    FOREIGN KEY (ProductKey) REFERENCES DimProduct(ProductKey),
    FOREIGN KEY (CustomerKey) REFERENCES DimCustomer(CustomerKey),
    FOREIGN KEY (StoreKey) REFERENCES DimStore(StoreKey)
);

-- ==========================================
-- DML: Sample Data Insertion
-- ==========================================

-- Insert into DimTime
INSERT INTO DimTime (SaleDate, DayOfWeek, IsWeekend, Month, Quarter, Year) VALUES
('2023-01-15', 'Sunday', TRUE, 1, 1, 2023),
('2023-02-20', 'Monday', FALSE, 2, 1, 2023),
('2023-05-10', 'Wednesday', FALSE, 5, 2, 2023),
('2023-08-12', 'Saturday', TRUE, 8, 3, 2023),
('2023-11-25', 'Saturday', TRUE, 11, 4, 2023);

-- Insert into DimProduct
INSERT INTO DimProduct (ProductID, ProductName, Category, Brand) VALUES
('P001', 'Ultra HD TV', 'Electronics', 'TechVision'),
('P002', 'Wireless Earbuds', 'Electronics', 'SoundMax'),
('P003', 'Running Shoes', 'Clothing', 'Speedster'),
('P004', 'Winter Jacket', 'Clothing', 'ArcticWear');

-- Insert into DimCustomer
INSERT INTO DimCustomer (CustomerID, FirstName, LastName, AgeGroup, City) VALUES
('C001', 'Alice', 'Smith', '26-35', 'Sydney'),
('C002', 'Bob', 'Jones', '36-50', 'Melbourne'),
('C003', 'Charlie', 'Brown', '18-25', 'Brisbane'),
('C004', 'Diana', 'Prince', '50+', 'Sydney');

-- Insert into DimStore
INSERT INTO DimStore (StoreID, StoreName, City, Region) VALUES
('S001', 'Sydney Central', 'Sydney', 'NSW'),
('S002', 'Melbourne CBD', 'Melbourne', 'VIC'),
('S003', 'Brisbane North', 'Brisbane', 'QLD');

-- Insert into FactSales
-- Fact records linking dimensions and measures
INSERT INTO FactSales (TimeKey, ProductKey, CustomerKey, StoreKey, Quantity, UnitPrice, TotalAmount) VALUES
(1, 1, 1, 1, 1, 1200.00, 1200.00), -- Alice bought TV in Sydney on Sunday (Q1)
(1, 2, 2, 2, 2, 150.00, 300.00),   -- Bob bought Earbuds in Melbourne on Sunday (Q1)
(2, 3, 3, 3, 1, 80.00, 80.00),     -- Charlie bought Shoes in Brisbane on Monday (Q1)
(3, 4, 1, 1, 1, 200.00, 200.00),   -- Alice bought Jacket in Sydney on Wednesday (Q2)
(4, 1, 4, 1, 2, 1200.00, 2400.00), -- Diana bought 2 TVs in Sydney on Saturday (Q3)
(5, 2, 1, 1, 1, 150.00, 150.00);   -- Alice bought Earbuds in Sydney on Saturday (Q4)

-- ==========================================
-- Example Queries (For Students to Practice)
-- ==========================================

-- Q1. What was the total revenue by product category per quarter?
-- SELECT p.Category, t.Quarter, SUM(f.TotalAmount) AS TotalRevenue
-- FROM FactSales f
-- JOIN DimProduct p ON f.ProductKey = p.ProductKey
-- JOIN DimTime t ON f.TimeKey = t.TimeKey
-- GROUP BY p.Category, t.Quarter
-- ORDER BY t.Quarter, p.Category;

-- Q2. Which store had the highest sales on weekends?
-- SELECT s.StoreName, SUM(f.TotalAmount) AS WeekendSales
-- FROM FactSales f
-- JOIN DimStore s ON f.StoreKey = s.StoreKey
-- JOIN DimTime t ON f.TimeKey = t.TimeKey
-- WHERE t.IsWeekend = TRUE
-- GROUP BY s.StoreName
-- ORDER BY WeekendSales DESC;

-- Q3. What's the average order value by customer age group?
-- SELECT c.AgeGroup, AVG(f.TotalAmount) AS AvgOrderValue
-- FROM FactSales f
-- JOIN DimCustomer c ON f.CustomerKey = c.CustomerKey
-- GROUP BY c.AgeGroup
-- ORDER BY c.AgeGroup;
