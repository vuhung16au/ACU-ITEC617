-- 01-init.sql
-- Reference Implementation for "Time-Variant Data" (Solution A: The Snapshot)

-- 1. Products Table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    current_price DECIMAL(10, 2) NOT NULL
);

-- 2. Orders Table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. OrderDetails Table (The Snapshot implementation)
CREATE TABLE order_details (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    
    -- Crucial for Time-Variant Data: Storing the price AT THE MOMENT OF PURCHASE
    price_at_purchase DECIMAL(10, 2) NOT NULL,
    
    PRIMARY KEY (order_id, product_id),
    CONSTRAINT fk_order_detail_order FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    CONSTRAINT fk_order_detail_product FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Sample Data showing the process

-- Initial Products
INSERT INTO products (product_name, current_price) VALUES
('Wireless Mouse', 25.00),
('Mechanical Keyboard', 120.00);

-- Day 1: Customer buys a Wireless Mouse
INSERT INTO orders (customer_name, order_date) VALUES ('Alice', '2023-01-10 10:00:00');

-- *The Application Logic fetches the CurrentPrice (25.00) and inserts it here*
INSERT INTO order_details (order_id, product_id, quantity, price_at_purchase) 
VALUES (1, 1, 2, 25.00);


-- Day 2: The price of the Wireless Mouse increases to $30.00
UPDATE products SET current_price = 30.00 WHERE product_id = 1;


-- Day 3: A new customer buys the same Wireless Mouse
INSERT INTO orders (customer_name, order_date) VALUES ('Bob', '2023-01-12 14:30:00');

-- *The Application Logic fetches the NEW CurrentPrice (30.00) and inserts it here*
INSERT INTO order_details (order_id, product_id, quantity, price_at_purchase) 
VALUES (2, 1, 1, 30.00);

-- Notice that Alice's historical order detail still correctly reflects 25.00, 
-- while Bob's new order reflects the 30.00 price change.
