USE companydb;

-- Connect as root
-- 1. Create different user roles (simulating RBAC)

-- Admin user (full access)
CREATE USER IF NOT EXISTS 'admin_user'@'%' IDENTIFIED BY 'Admin123!';
GRANT ALL PRIVILEGES ON companydb.* TO 'admin_user'@'%';

-- Application user (read/write, no DROP)
CREATE USER IF NOT EXISTS 'app_user'@'%' IDENTIFIED BY 'App123!';
GRANT SELECT, INSERT, UPDATE ON companydb.* TO 'app_user'@'%';

-- Read-only analyst user
CREATE USER IF NOT EXISTS 'analyst_user'@'%' IDENTIFIED BY 'Analyst123!';
GRANT SELECT ON companydb.* TO 'analyst_user'@'%';

-- Flush privileges to apply changes
FLUSH PRIVILEGES;

-- Create tables (DDL practice)
CREATE TABLE IF NOT EXISTS departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dept_id INT,
    hire_date DATE,
    salary DECIMAL(10,2),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Insert sample data
INSERT INTO departments (dept_name, location) VALUES 
('Engineering', 'Sydney'),
('Marketing', 'Melbourne'),
('Finance', 'Brisbane'),
('HR', 'Perth');

INSERT INTO employees (first_name, last_name, dept_id, hire_date, salary) VALUES
('Alice', 'Smith', 1, '2023-01-15', 95000),
('Bob', 'Johnson', 1, '2023-03-20', 87000),
('Carol', 'Williams', 2, '2022-11-10', 72000),
('David', 'Brown', 3, '2024-02-01', 68000),
('Emma', 'Davis', 2, '2023-06-15', 75000),
('Frank', 'Wilson', 4, '2023-09-01', 65000);
