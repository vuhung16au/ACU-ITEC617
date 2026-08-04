-- Schema and Sample Data for Practice

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    registration_date TIMESTAMP DEFAULT NOW()
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    region VARCHAR(50),
    amount DECIMAL(10, 2)
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100)
);

CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(id),
    quantity INT,
    sale_date TIMESTAMP DEFAULT NOW()
);

-- Insert dummy data for tables to allow querying
INSERT INTO customers (name, registration_date) VALUES 
('Alice', NOW() - INTERVAL '40 days'),
('Bob', NOW() - INTERVAL '10 days'),
('Charlie', NOW() - INTERVAL '5 days');

INSERT INTO orders (customer_id, region, amount) VALUES 
(1, 'North', 15000),
(2, 'South', 5000),
(3, 'North', 12000),
(1, 'East', 8000);

INSERT INTO products (product_name) VALUES 
('Widget A'), ('Widget B'), ('Widget C');

-- Create roles for security testing (as per Lab 2)
CREATE USER readonly_user WITH PASSWORD 'SecurePass123!';
GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonly_user;
