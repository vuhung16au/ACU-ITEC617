-- 1. Structured Data Example
CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC
);

INSERT INTO employees (name, department, salary) VALUES
('John Doe', 'IT', 75000),
('Jane Smith', 'HR', 65000),
('Mike Brown', 'IT', 80000);

-- 2. Semi-structured Data Example (JSONB in Postgres)
CREATE TABLE api_logs (
    log_id SERIAL PRIMARY KEY,
    payload JSONB
);

INSERT INTO api_logs (payload) VALUES
('{"event": "login", "user": "johndoe", "metadata": {"ip": "192.168.1.1", "browser": "Chrome"}}'),
('{"event": "purchase", "item": "Laptop", "price": 1200}');

-- 3. Unstructured Data Example (Stored as raw text)
CREATE TABLE document_store (
    doc_id SERIAL PRIMARY KEY,
    content TEXT
);

INSERT INTO document_store (content) VALUES
('This is a raw text document. It does not have a predefined schema. It can contain anything.');


-- 4. Key Database Objects: INDEX
-- Creates an index on department to speed up lookups
CREATE INDEX idx_emp_department ON employees(department);

-- 5. Key Database Objects: VIEW
-- Creates a virtual table of high earners
CREATE VIEW high_earners AS
SELECT name, department, salary
FROM employees
WHERE salary > 70000;

-- 6. Key Database Objects: STORED PROCEDURE (Function in Postgres)
-- A function to give a raise to a specific employee
CREATE OR REPLACE FUNCTION give_raise(p_emp_id INT, p_amount NUMERIC)
RETURNS VOID AS $$
BEGIN
    UPDATE employees
    SET salary = salary + p_amount
    WHERE emp_id = p_emp_id;
END;
$$ LANGUAGE plpgsql;
