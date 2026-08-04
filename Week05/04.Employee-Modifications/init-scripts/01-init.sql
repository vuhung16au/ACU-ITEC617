CREATE TABLE "Employees" (
    "EmpID" SERIAL PRIMARY KEY,
    "FirstName" VARCHAR(100) NOT NULL,
    "LastName" VARCHAR(100) NOT NULL,
    "Department" VARCHAR(100),
    "Salary" DECIMAL(10,2),
    "HireDate" DATE
);

INSERT INTO "Employees" ("FirstName", "LastName", "Department", "Salary", "HireDate") VALUES
('John', 'Doe', 'IT', 85000.00, '2020-05-15'),
('Jane', 'Smith', 'Marketing', 72000.00, '2019-08-22'),
('Michael', 'Johnson', 'Sales', 68000.00, '2021-01-10'),
('Sarah', 'Williams', 'IT', 92000.00, '2018-03-12'),
('David', 'Brown', 'HR', 65000.00, '2022-07-01'),
('Emily', 'Jones', 'Marketing', 75000.00, '2017-11-30');
