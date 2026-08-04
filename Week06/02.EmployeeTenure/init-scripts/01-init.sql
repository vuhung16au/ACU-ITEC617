-- DDL
CREATE TABLE Employees (
    EmpID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    HireDate DATE,
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- DML (Sample Data)
INSERT INTO Employees (FirstName, LastName, HireDate, Department, Salary) VALUES
('John', 'Smith', '2015-02-15', 'Sales', 65000.00),
('Jane', 'Doe', '2018-05-20', 'Marketing', 72000.00),
('Michael', 'Johnson', '2012-11-10', 'IT', 85000.00),
('Emily', 'Williams', '2020-01-25', 'HR', 55000.00),
('David', 'Brown', '2019-08-05', 'Finance', 90000.00),
('Sarah', 'Jones', '2016-03-12', 'Sales', 68000.00),
('Robert', 'Garcia', '2021-07-22', 'IT', 75000.00),
('Linda', 'Martinez', '2014-09-30', 'Marketing', 80000.00),
('William', 'Robinson', '2022-02-18', 'HR', 58000.00),
('Elizabeth', 'Clark', '2017-12-05', 'Finance', 95000.00),
('James', 'Rodriguez', '2013-04-14', 'Sales', 70000.00),
('Mary', 'Lewis', '2019-10-28', 'IT', 82000.00),
('Richard', 'Lee', '2023-01-15', 'Marketing', 60000.00),
('Patricia', 'Walker', '2011-06-20', 'Finance', 105000.00),
('Joseph', 'Hall', '2020-03-08', 'Sales', 62000.00);
