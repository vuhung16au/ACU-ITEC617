CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);

CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT REFERENCES Customers(CustomerID),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);

-- Generate mock data
-- Insert 100,000 customers
INSERT INTO Customers (FirstName, LastName, Email, RegistrationDate)
SELECT 
    'First' || g, 
    'Last' || g, 
    'user' || g || '@example.com',
    CURRENT_DATE - (random() * 3650)::int
FROM generate_series(1, 100000) AS g;

-- Insert 500,000 orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
SELECT 
    (random() * 99999 + 1)::int,
    CURRENT_DATE - (random() * 3650)::int,
    (random() * 1000)::decimal(10,2)
FROM generate_series(1, 500000);
