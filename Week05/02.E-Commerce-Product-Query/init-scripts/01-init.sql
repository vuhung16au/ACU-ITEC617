CREATE TABLE "Products" (
    "ProductID" SERIAL PRIMARY KEY,
    "ProductName" VARCHAR(255) NOT NULL,
    "Category" VARCHAR(100),
    "UnitPrice" DECIMAL(10, 2) NOT NULL,
    "StockQuantity" INT
);

INSERT INTO "Products" ("ProductName", "Category", "UnitPrice", "StockQuantity") VALUES
('Gaming Laptop 15"', 'Electronics', 1200.00, 10),
('Wireless Mouse', 'Accessories', 25.50, 150),
('Mechanical Keyboard', 'Accessories', 85.00, 45),
('Ultra-Thin Laptop 13"', 'Electronics', 950.00, 20),
('Noise Cancelling Headphones', 'Audio', 150.00, 0),
('Smartphone Stand', 'Accessories', 15.00, 300),
('Bluetooth Speaker', 'Audio', 45.00, NULL), -- Unknown stock
('4K Monitor', 'Electronics', 350.00, 15),
('USB-C Hub', 'Accessories', 40.00, 80),
('Office Chair', 'Furniture', 120.00, 5),
('Laptop Backpack', 'Accessories', 60.00, 25),
('Desk Lamp', 'Furniture', 35.00, 0);
