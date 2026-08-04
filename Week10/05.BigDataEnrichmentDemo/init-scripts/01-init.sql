-- 01-init.sql
-- DDL and DML for Operational Source Database

DROP TABLE IF EXISTS OperationalSales;

-- Simulate an operational (OLTP) database for an e-commerce platform
CREATE TABLE OperationalSales (
    TransactionID SERIAL PRIMARY KEY,
    SaleDate DATE NOT NULL,
    ProductID VARCHAR(50) NOT NULL,
    CustomerID VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);

-- Insert operational data (to be extracted by Apache Spark)
INSERT INTO OperationalSales (SaleDate, ProductID, CustomerID, Quantity, Price) VALUES
('2023-10-01', 'P1', 'C1', 2, 50.00),
('2023-10-01', 'P2', 'C2', 1, 100.00),
('2023-10-02', 'P1', 'C3', 5, 50.00),
('2023-10-03', 'P3', 'C1', 1, 200.00),
('2023-10-03', 'P2', 'C2', 3, 100.00),
('2023-10-04', 'P3', 'C2', 2, 200.00),
('2023-10-04', 'P1', 'C1', 1, 50.00);
