CREATE SCHEMA sales;

CREATE TABLE sales.customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    credit_card VARCHAR(20) NOT NULL,
    salary DECIMAL(10, 2)
);

INSERT INTO sales.customers (first_name, last_name, email, phone, credit_card, salary) VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234', '1111-2222-3333-4444', 60000.00),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678', '5555-6666-7777-8888', 85000.00),
('Alice', 'Johnson', 'alice.j@example.com', '555-9012', '9999-0000-1111-2222', 120000.00);

-- Create roles for testing
CREATE ROLE FinanceManager;
CREATE ROLE RegularUser;

-- Create actual users that can login
CREATE USER bob_finance WITH PASSWORD 'password';
CREATE USER charlie_regular WITH PASSWORD 'password';

GRANT FinanceManager TO bob_finance;
GRANT RegularUser TO charlie_regular;

-- Grant basic schema access
GRANT USAGE ON SCHEMA sales TO FinanceManager;
GRANT USAGE ON SCHEMA sales TO RegularUser;

-- The FinanceManager gets full access to the base table (simulating UNMASK)
GRANT SELECT ON sales.customers TO FinanceManager;

-- (The RegularUser will get access to the Masked View in the exercise)
