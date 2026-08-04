-- 1. Table simulating a flat file (Redundant)
CREATE TABLE flat_orders (
    order_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    customer_name VARCHAR(100),
    customer_address VARCHAR(200),
    customer_phone VARCHAR(20)
);

INSERT INTO flat_orders (product_name, customer_name, customer_address, customer_phone) VALUES
('Laptop', 'Alice Smith', '123 Apple St', '555-0100'),
('Mouse', 'Alice Smith', '123 Apple St', '555-0100'),
('Keyboard', 'Bob Jones', '456 Orange Ave', '555-0200');

-- 2. Normalized Tables (Solving the issue with Relations)
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(200),
    phone VARCHAR(20)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    customer_id INTEGER REFERENCES customers(customer_id)
);

INSERT INTO customers (name, address, phone) VALUES
('Alice Smith', '123 Apple St', '555-0100'),
('Bob Jones', '456 Orange Ave', '555-0200');

INSERT INTO orders (product_name, customer_id) VALUES
('Laptop', 1),
('Mouse', 1),
('Keyboard', 2);
