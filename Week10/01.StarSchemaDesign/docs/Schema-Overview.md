# Schema Overview: Retail Sales Star Schema

This document outlines the structure of the star schema designed for the retail sales business scenario.

## Dimension Tables

Dimension tables contain descriptive attributes (context) about the facts.

### 1. DimTime
Stores information about when a sale occurred.
* `TimeKey` (INT, Primary Key): Surrogate key for the time dimension.
* `SaleDate` (DATE): The actual date.
* `DayOfWeek` (VARCHAR): e.g., 'Monday', 'Tuesday'.
* `IsWeekend` (BOOLEAN): True if Saturday or Sunday.
* `Month` (INT): 1-12.
* `Quarter` (INT): 1-4.
* `Year` (INT): e.g., 2023.

### 2. DimProduct
Stores details about the products sold.
* `ProductKey` (INT, Primary Key): Surrogate key for the product.
* `ProductID` (VARCHAR): Original business key/SKU.
* `ProductName` (VARCHAR): Name of the product.
* `Category` (VARCHAR): Product category (e.g., 'Electronics', 'Clothing').
* `Brand` (VARCHAR): Brand of the product.

### 3. DimCustomer
Stores information about the customers who made purchases.
* `CustomerKey` (INT, Primary Key): Surrogate key for the customer.
* `CustomerID` (VARCHAR): Original business key.
* `FirstName` (VARCHAR): Customer's first name.
* `LastName` (VARCHAR): Customer's last name.
* `AgeGroup` (VARCHAR): e.g., '18-25', '26-35', '36-50', '50+'.
* `City` (VARCHAR): Customer's city.

### 4. DimStore
Stores information about where the sale took place.
* `StoreKey` (INT, Primary Key): Surrogate key for the store.
* `StoreID` (VARCHAR): Original business key.
* `StoreName` (VARCHAR): Name of the store.
* `City` (VARCHAR): Store's city.
* `Region` (VARCHAR): Store's region (e.g., 'North', 'South').

## Fact Table

The fact table contains the measurable, quantitative data about the business event (a sale) and foreign keys to the dimension tables.

### FactSales
* `SalesKey` (INT, Primary Key): Surrogate key for the sales record.
* `TimeKey` (INT, Foreign Key referencing `DimTime`)
* `ProductKey` (INT, Foreign Key referencing `DimProduct`)
* `CustomerKey` (INT, Foreign Key referencing `DimCustomer`)
* `StoreKey` (INT, Foreign Key referencing `DimStore`)
* `Quantity` (INT): Number of items sold in this transaction.
* `UnitPrice` (DECIMAL): Price per unit at the time of sale.
* `TotalAmount` (DECIMAL): `Quantity` * `UnitPrice`.
