# E-Commerce Queries Schema Overview

This topic focuses on writing `SELECT` statements with a pre-populated table.

## Tables

### 1. Products
Stores information about e-commerce products.
*   **ProductID**: Primary Key.
*   **ProductName**: The name of the product.
*   **Category**: The category the product belongs to (e.g., 'Electronics', 'Clothing').
*   **BasePrice**: The price of the product without tax.
*   **StockQuantity**: The number of items in stock (can be NULL).
