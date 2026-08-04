# Schema Overview: ETL Pipeline

This document outlines the structure of the Staging (Source) tables and the Target Data Warehouse tables.

## 1. Staging Tables (Raw Source Data)

These tables simulate data that has been extracted exactly as it exists in the source systems (e.g., CSV files or APIs). It is often messy.

### `Stg_RawSales`
Contains raw transaction data with potential quality issues.
* `RawID`: Auto-incrementing identifier for the raw row.
* `SaleDate`: Stored as `VARCHAR` (text) to simulate raw CSV imports. Some rows might be `NULL`.
* `ProductCode`: The business key for the product.
* `StoreCode`: The business key for the store.
* `Quantity`: Number of items sold.
* `UnitPrice`: The price. Some values are intentionally `NULL` to require data cleaning.

### `Stg_ProductCatalog`
Simulates a clean product reference feed from an ERP system.
* `ProductCode`: Business key.
* `ProductName`: Name of the product.
* `Category`: Product category.

---

## 2. Target Tables (Data Warehouse)

These are the clean, structured tables that will power analytics and reporting.

### `DimProduct`
The dimension table for products.
* `ProductKey`: Surrogate Key (Integer, Auto-increment).
* `ProductCode`: Original business key.
* `ProductName`: Name.
* `Category`: Category.

### `FactSales`
The detailed transaction fact table.
* `SalesKey`: Surrogate Key.
* `SaleDate`: Cleaned `DATE` type.
* `ProductKey`: Foreign key linking to `DimProduct`.
* `Quantity`: Number of items sold.
* `UnitPrice`: Cleaned price (no NULLs).
* `TotalPrice`: **Derived Column** (`Quantity` * `UnitPrice`).

### `FactDailySalesSummary`
An aggregate fact table for faster reporting.
* `SummaryKey`: Surrogate Key.
* `SaleDate`: The date of sales.
* `TotalRevenue`: Sum of `TotalPrice` for that day.
* `TotalItemsSold`: Sum of `Quantity` for that day.
