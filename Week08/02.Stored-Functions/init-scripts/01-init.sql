-- DDL

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone_number VARCHAR(20),
    salary NUMERIC(10, 2)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE,
    customer_name VARCHAR(100),
    subtotal NUMERIC(10, 2),
    tax_rate NUMERIC(4, 2)
);

-- DML
INSERT INTO employees (first_name, last_name, phone_number, salary) VALUES
('John', 'Doe', '0412345678', 50000),
('Jane', 'Smith', '0498765432', 85000),
('Alice', 'Johnson', '0455555555', 120000),
('Bob', 'Williams', '0411112222', 45000);

INSERT INTO orders (order_date, customer_name, subtotal, tax_rate) VALUES
('2024-05-15', 'Acme Corp', 1000.00, 0.10),
('2024-05-16', 'Globex', 550.50, 0.15),
('2024-05-17', 'Initech', 300.00, 0.10);


-- Example Function 1: CalculateTax
-- Returns the tax amount given a subtotal and tax rate
CREATE OR REPLACE FUNCTION CalculateTax(p_amount NUMERIC, p_tax_rate NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN round((p_amount * p_tax_rate), 2);
END;
$$;

-- Example Function 2: FormatPhoneNumber
-- Formats a 10-digit raw phone number like '0412345678' to '(04) 1234 5678'
CREATE OR REPLACE FUNCTION FormatPhoneNumber(p_raw_number VARCHAR)
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
BEGIN
    -- Check if it is a 10 digit number starting with 0
    IF length(p_raw_number) = 10 THEN
        RETURN '(' || substring(p_raw_number from 1 for 2) || ') ' ||
               substring(p_raw_number from 3 for 4) || ' ' ||
               substring(p_raw_number from 7 for 4);
    END IF;
    -- Return raw if it doesn't match standard pattern
    RETURN p_raw_number;
END;
$$;

-- Example Function 3: GetEmployeeGrade
-- Returns a grade based on salary
CREATE OR REPLACE FUNCTION GetEmployeeGrade(p_employee_id INT)
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
DECLARE
    v_salary NUMERIC;
BEGIN
    SELECT salary INTO v_salary FROM employees WHERE employee_id = p_employee_id;
    
    IF v_salary >= 100000 THEN
        RETURN 'A';
    ELSIF v_salary >= 60000 THEN
        RETURN 'B';
    ELSE
        RETURN 'C';
    END IF;
END;
$$;
