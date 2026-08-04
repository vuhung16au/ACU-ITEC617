-- 01-init.sql
-- DDL for Staging and Target Data Warehouse Tables

-- Drop tables if they exist
DROP TABLE IF EXISTS FactDailySalesSummary;
DROP TABLE IF EXISTS FactSales;
DROP TABLE IF EXISTS DimProduct;
DROP TABLE IF EXISTS Stg_RawSales;
DROP TABLE IF EXISTS Stg_ProductCatalog;

-- ==========================================
-- 1. STAGING TABLES (RAW DATA)
-- ==========================================

CREATE TABLE Stg_ProductCatalog (
    ProductCode VARCHAR(50) PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);

CREATE TABLE Stg_RawSales (
    RawID SERIAL PRIMARY KEY,
    SaleDate VARCHAR(50), -- String to simulate raw CSV imports
    ProductCode VARCHAR(50),
    StoreCode VARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10,2) -- Will contain NULLs to practice cleaning
);

-- Load Raw Data
INSERT INTO Stg_ProductCatalog (ProductCode, ProductName, Category) VALUES
('P01', 'Laptop Pro', 'Electronics'),
('P02', 'Wireless Mouse', 'Electronics'),
('P03', 'Office Chair', 'Furniture');

INSERT INTO Stg_RawSales (SaleDate, ProductCode, StoreCode, Quantity, UnitPrice) VALUES
('2023-10-01', 'P01', 'S1', 1, 1200.00),
('2023-10-01', 'P02', 'S1', 2, NULL),        -- Needs cleaning: NULL price
('2023-10-02', 'P01', 'S2', 1, 1200.00),
('2023-10-02', 'P03', 'S1', 1, 250.00),
('2023-10-03', 'P02', 'S2', 5, 25.00),
(NULL,         'P01', 'S1', 1, 1200.00);      -- Needs cleaning: NULL date

-- ==========================================
-- 2. TARGET TABLES (DATA WAREHOUSE)
-- ==========================================

CREATE TABLE DimProduct (
    ProductKey SERIAL PRIMARY KEY,
    ProductCode VARCHAR(50) NOT NULL,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);

CREATE TABLE FactSales (
    SalesKey SERIAL PRIMARY KEY,
    SaleDate DATE NOT NULL,
    ProductKey INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    TotalPrice DECIMAL(10,2) NOT NULL, -- Derived: Quantity * UnitPrice
    FOREIGN KEY (ProductKey) REFERENCES DimProduct(ProductKey)
);

CREATE TABLE FactDailySalesSummary (
    SummaryKey SERIAL PRIMARY KEY,
    SaleDate DATE NOT NULL,
    TotalRevenue DECIMAL(10,2) NOT NULL,
    TotalItemsSold INT NOT NULL
);


-- ==========================================
-- ETL EXERCISE SOLUTIONS (COMMENTED OUT)
-- ==========================================

/*
-- Step 1: Load Dimension Table
INSERT INTO DimProduct (ProductCode, ProductName, Category)
SELECT ProductCode, ProductName, Category 
FROM Stg_ProductCatalog;

-- Step 2: Transform and Load Fact Table
-- Actions: Filter NULL dates, COALESCE NULL prices to 0, CAST string to DATE, Calculate TotalPrice
INSERT INTO FactSales (SaleDate, ProductKey, Quantity, UnitPrice, TotalPrice)
SELECT 
    CAST(s.SaleDate AS DATE) AS SaleDate,
    p.ProductKey,
    s.Quantity,
    COALESCE(s.UnitPrice, 0) AS UnitPrice,
    s.Quantity * COALESCE(s.UnitPrice, 0) AS TotalPrice
FROM Stg_RawSales s
JOIN DimProduct p ON s.ProductCode = p.ProductCode
WHERE s.SaleDate IS NOT NULL;

-- Step 3: Transform and Load Aggregate Fact Table
INSERT INTO FactDailySalesSummary (SaleDate, TotalRevenue, TotalItemsSold)
SELECT 
    SaleDate,
    SUM(TotalPrice) AS TotalRevenue,
    SUM(Quantity) AS TotalItemsSold
FROM FactSales
GROUP BY SaleDate;
*/
