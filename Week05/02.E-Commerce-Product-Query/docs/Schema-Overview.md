# E-Commerce Product Schema Overview

This example focuses on SQL querying operations (`SELECT`, `WHERE`, Computed Columns, `ORDER BY`) using a pre-populated `Products` table.

## Tables

### 1. `Products`
Stores information about e-commerce products.
*   `ProductID`: Primary key.
*   `ProductName`: The name of the product.
*   `Category`: The category the product belongs to (e.g., Electronics, Accessories, Clothing).
*   `UnitPrice`: The price of a single unit of the product.
*   `StockQuantity`: The number of items currently in stock. Nullable to represent unknown inventory.
