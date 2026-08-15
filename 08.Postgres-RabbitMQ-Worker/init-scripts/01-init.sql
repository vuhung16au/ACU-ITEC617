CREATE TABLE IF NOT EXISTS "Order" (
    id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    quantity INTEGER NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO "Order" (customer_name, item_name, quantity, status) VALUES
('Hung Vu', 'Laptop', 1, 'processed'),
('Sarah Smith', 'Monitor', 2, 'processed');
