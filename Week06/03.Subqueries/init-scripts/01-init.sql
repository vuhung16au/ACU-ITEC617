-- DDL
CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT REFERENCES Customers(CustomerID),
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);

-- DML (Sample Data)
INSERT INTO Customers (CustomerName, City) VALUES
('Alice Johnson', 'New York'),
('Bob Smith', 'Los Angeles'),
('Charlie Brown', 'Chicago'),
('Diana Prince', 'Houston'),
('Ethan Hunt', 'Miami'),
('Fiona Gallagher', 'Seattle'),
('George Costanza', 'New York'),
('Hannah Abbott', 'Boston');

-- Note: Customer 7 (George) and 8 (Hannah) will have NO orders to test the NOT IN subquery.
-- We will use CURRENT_DATE in some inserts to make sure the "last 30 days" query always works.
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, CURRENT_DATE - INTERVAL '10 days', 250.00),
(1, CURRENT_DATE - INTERVAL '40 days', 150.00),
(2, CURRENT_DATE - INTERVAL '5 days', 800.00),
(2, CURRENT_DATE - INTERVAL '2 months', 1200.00),
(3, CURRENT_DATE - INTERVAL '15 days', 50.00),
(3, CURRENT_DATE - INTERVAL '20 days', 75.00),
(3, CURRENT_DATE - INTERVAL '3 months', 300.00),
(4, CURRENT_DATE - INTERVAL '100 days', 5000.00), -- Top spender, but not in last 30 days
(5, CURRENT_DATE - INTERVAL '2 days', 450.00),
(6, CURRENT_DATE - INTERVAL '60 days', 600.00);
