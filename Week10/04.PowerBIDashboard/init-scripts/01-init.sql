-- 01-init.sql
-- DDL and DML for Power BI Data Warehouse

-- Drop tables if they exist
DROP TABLE IF EXISTS FactSales;
DROP TABLE IF EXISTS DimDate;
DROP TABLE IF EXISTS DimLocation;
DROP TABLE IF EXISTS DimProduct;

-- ==========================================
-- DDL: Dimension Tables
-- ==========================================

CREATE TABLE DimDate (
    DateKey INT PRIMARY KEY, -- Format YYYYMMDD
    FullDate DATE NOT NULL,
    Year INT NOT NULL,
    Month INT NOT NULL,
    MonthName VARCHAR(20) NOT NULL,
    Quarter INT NOT NULL
);

CREATE TABLE DimLocation (
    LocationKey SERIAL PRIMARY KEY,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL
);

CREATE TABLE DimProduct (
    ProductKey SERIAL PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL
);

-- ==========================================
-- DDL: Fact Table
-- ==========================================

CREATE TABLE FactSales (
    SalesKey SERIAL PRIMARY KEY,
    DateKey INT NOT NULL,
    LocationKey INT NOT NULL,
    ProductKey INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    SalesAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (DateKey) REFERENCES DimDate(DateKey),
    FOREIGN KEY (LocationKey) REFERENCES DimLocation(LocationKey),
    FOREIGN KEY (ProductKey) REFERENCES DimProduct(ProductKey)
);

-- ==========================================
-- DML: Sample Data Insertion
-- ==========================================

-- Insert into DimDate (Sample data across a few months)
INSERT INTO DimDate (DateKey, FullDate, Year, Month, MonthName, Quarter) VALUES
(20230115, '2023-01-15', 2023, 1, 'January', 1),
(20230220, '2023-02-20', 2023, 2, 'February', 1),
(20230310, '2023-03-10', 2023, 3, 'March', 1),
(20230405, '2023-04-05', 2023, 4, 'April', 2),
(20230512, '2023-05-12', 2023, 5, 'May', 2),
(20230618, '2023-06-18', 2023, 6, 'June', 2);

-- Insert into DimLocation (Mix of US and International cities for maps)
INSERT INTO DimLocation (City, State, Country) VALUES
('Seattle', 'WA', 'USA'),
('New York', 'NY', 'USA'),
('Austin', 'TX', 'USA'),
('London', 'England', 'UK'),
('Sydney', 'NSW', 'Australia');

-- Insert into DimProduct
INSERT INTO DimProduct (ProductName, Category) VALUES
('Surface Pro 9', 'Computers'),
('MacBook Air M2', 'Computers'),
('Dell XPS 13', 'Computers'),
('Logitech MX Master 3', 'Accessories'),
('Keychron K2', 'Accessories'),
('AirPods Pro', 'Audio'),
('Sony WH-1000XM5', 'Audio');

-- Insert into FactSales (Randomized sales to show variation in BI)
INSERT INTO FactSales (DateKey, LocationKey, ProductKey, Quantity, UnitPrice, SalesAmount) VALUES
(20230115, 1, 1, 2, 999.00, 1998.00),
(20230115, 2, 4, 5, 99.00, 495.00),
(20230220, 3, 2, 1, 1199.00, 1199.00),
(20230220, 4, 6, 3, 249.00, 747.00),
(20230310, 5, 7, 2, 348.00, 696.00),
(20230310, 1, 3, 1, 1400.00, 1400.00),
(20230405, 2, 1, 4, 999.00, 3996.00),
(20230405, 3, 5, 10, 89.00, 890.00),
(20230512, 4, 2, 2, 1199.00, 2398.00),
(20230512, 5, 6, 5, 249.00, 1245.00),
(20230618, 1, 7, 10, 348.00, 3480.00),
(20230618, 2, 3, 2, 1400.00, 2800.00),
(20230618, 3, 4, 15, 99.00, 1485.00);
