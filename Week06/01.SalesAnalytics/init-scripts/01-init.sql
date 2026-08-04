-- DDL
CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    Region VARCHAR(50)
);

-- DML (Sample Data)
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, Region) VALUES
(101, '2023-01-15', 150.00, 'North'),
(102, '2023-01-16', 800.00, 'North'),
(103, '2023-01-17', 200.00, 'South'),
(104, '2023-01-18', 450.00, 'East'),
(105, '2023-01-19', 1200.00, 'West'),
(106, '2023-01-20', 300.00, 'West'),
(107, '2023-01-21', 600.00, 'North'),
(108, '2023-01-22', 150.00, 'South'),
(109, '2023-01-23', 900.00, 'East'),
(110, '2023-01-24', 550.00, 'North'),
(111, '2023-01-25', 100.00, 'West'),
(112, '2023-01-26', 750.00, 'East'),
(113, '2023-01-27', 400.00, 'South'),
(114, '2023-01-28', 1100.00, 'North'),
(115, '2023-01-29', 250.00, 'West'),
(116, '2023-01-30', 500.00, 'East'),
(117, '2023-01-31', 850.00, 'North'),
(118, '2023-02-01', 350.00, 'South'),
(119, '2023-02-02', 650.00, 'West'),
(120, '2023-02-03', 950.00, 'East');

-- For the task "Regions with at least 10 orders", let's make sure at least one region has 10 orders.
-- Adding more to 'North' to hit 10.
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, Region) VALUES
(121, '2023-02-04', 100.00, 'North'),
(122, '2023-02-05', 200.00, 'North'),
(123, '2023-02-06', 300.00, 'North'),
(124, '2023-02-07', 400.00, 'North');
