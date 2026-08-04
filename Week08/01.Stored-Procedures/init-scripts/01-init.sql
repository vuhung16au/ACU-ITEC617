-- DDL

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary NUMERIC(10, 2),
    hire_date DATE
);

CREATE TABLE promotion_history (
    promotion_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(employee_id),
    old_salary NUMERIC(10, 2),
    new_salary NUMERIC(10, 2),
    old_department VARCHAR(50),
    new_department VARCHAR(50),
    promotion_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    total_amount NUMERIC(10, 2)
);

CREATE TABLE orders_archive (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    total_amount NUMERIC(10, 2),
    archived_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- DML
INSERT INTO employees (first_name, last_name, department, salary, hire_date) VALUES
('John', 'Doe', 'Sales', 50000, '2020-01-15'),
('Jane', 'Smith', 'Marketing', 60000, '2019-03-22'),
('Alice', 'Johnson', 'IT', 75000, '2021-07-10'),
('Bob', 'Williams', 'Sales', 48000, '2022-11-01');

INSERT INTO orders (order_date, customer_id, total_amount) VALUES
('2021-05-15', 101, 250.00),
('2022-08-20', 102, 450.50),
('2023-01-10', 103, 120.00),
('2024-02-05', 101, 300.00),
('2024-03-12', 104, 85.00);

-- Example Procedure 1: ProcessEmployeePromotion
CREATE OR REPLACE PROCEDURE ProcessEmployeePromotion(
    p_employee_id INT,
    p_new_salary NUMERIC,
    p_new_department VARCHAR
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_old_salary NUMERIC;
    v_old_department VARCHAR;
BEGIN
    -- Get current details
    SELECT salary, department INTO v_old_salary, v_old_department
    FROM employees WHERE employee_id = p_employee_id;

    -- Update employee table
    UPDATE employees 
    SET salary = p_new_salary, department = p_new_department
    WHERE employee_id = p_employee_id;

    -- Insert into history table
    INSERT INTO promotion_history (employee_id, old_salary, new_salary, old_department, new_department)
    VALUES (p_employee_id, v_old_salary, p_new_salary, v_old_department, p_new_department);
    
    COMMIT;
END;
$$;

-- Example Procedure 2: CalculateMonthlyBonus
CREATE OR REPLACE PROCEDURE CalculateMonthlyBonus(
    p_department VARCHAR
)
LANGUAGE plpgsql
AS $$
DECLARE
    emp_record RECORD;
    bonus_amount NUMERIC;
BEGIN
    FOR emp_record IN SELECT * FROM employees WHERE department = p_department LOOP
        IF emp_record.salary > 70000 THEN
            bonus_amount := emp_record.salary * 0.05; -- 5% bonus for high earners
        ELSE
            bonus_amount := emp_record.salary * 0.10; -- 10% bonus for others
        END IF;
        
        -- We could insert this into a bonuses table, but for demonstration, we'll just raise a notice.
        RAISE NOTICE 'Employee % % receives a bonus of %', emp_record.first_name, emp_record.last_name, bonus_amount;
    END LOOP;
END;
$$;

-- Example Procedure 3: ArchiveOldOrders
CREATE OR REPLACE PROCEDURE ArchiveOldOrders()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Insert into archive table
    INSERT INTO orders_archive (order_id, order_date, customer_id, total_amount)
    SELECT order_id, order_date, customer_id, total_amount
    FROM orders
    WHERE order_date < (CURRENT_DATE - INTERVAL '2 years');

    -- Delete from main table
    DELETE FROM orders
    WHERE order_date < (CURRENT_DATE - INTERVAL '2 years');

    COMMIT;
END;
$$;
