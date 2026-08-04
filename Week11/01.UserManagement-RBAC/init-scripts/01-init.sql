-- Create schema and tables for RBAC exercises
CREATE SCHEMA company;

-- 1. Departments Table
CREATE TABLE company.departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- 2. Employees Table
CREATE TABLE company.employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id INT REFERENCES company.departments(department_id),
    job_title VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- 3. Financial Records Table
CREATE TABLE company.financial_records (
    record_id SERIAL PRIMARY KEY,
    description VARCHAR(255),
    amount DECIMAL(15, 2),
    record_date DATE
);

-- Insert sample data
INSERT INTO company.departments (department_name) VALUES
('Human Resources'),
('Engineering'),
('Finance'),
('Marketing');

INSERT INTO company.employees (first_name, last_name, department_id, job_title, salary) VALUES
('Alice', 'Smith', 1, 'HR Manager', 85000.00),
('Bob', 'Jones', 2, 'Software Engineer', 95000.00),
('Charlie', 'Brown', 3, 'Financial Analyst', 80000.00),
('Diana', 'Prince', 4, 'Marketing Director', 105000.00);

INSERT INTO company.financial_records (description, amount, record_date) VALUES
('Q1 Revenue', 1500000.00, '2023-03-31'),
('Office Supplies', -5000.00, '2023-04-15'),
('Software Licenses', -15000.00, '2023-04-20');
