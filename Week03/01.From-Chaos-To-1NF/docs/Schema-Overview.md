# Schema Overview: From Chaos to 1NF

This exercise demonstrates the normalization process from a flat, unnormalized table to First Normal Form (1NF).

## Unnormalized (Flat) Schema
*   **OrderFlat**: The original table containing repeating groups.
    *   `OrderID` (INT, PRIMARY KEY)
    *   `CustomerName` (VARCHAR)
    *   `CustomerEmail` (VARCHAR)
    *   `Products` (VARCHAR) - Comma-separated list of products.
    *   `Quantities` (VARCHAR) - Comma-separated list of quantities.
    *   `UnitPrices` (VARCHAR) - Comma-separated list of prices.

## Normalized Schema (1NF)
To eliminate repeating groups and adhere to 1NF, the data is separated into related tables:
*   **Customer**: Stores unique customer information.
    *   `CustomerID` (INT, PRIMARY KEY)
    *   `Name` (VARCHAR)
    *   `Email` (VARCHAR)
*   **Product**: Stores unique product details.
    *   `ProductID` (INT, PRIMARY KEY)
    *   `Name` (VARCHAR)
    *   `UnitPrice` (DECIMAL)
*   **OrderHeader**: Stores order-level information.
    *   `OrderID` (INT, PRIMARY KEY)
    *   `CustomerID` (INT, FOREIGN KEY)
*   **OrderLine**: Stores line-item details, linking orders to products and resolving the repeating groups.
    *   `OrderID` (INT, FOREIGN KEY)
    *   `ProductID` (INT, FOREIGN KEY)
    *   `Quantity` (INT)
    *   *(PRIMARY KEY is composite: OrderID, ProductID)*
