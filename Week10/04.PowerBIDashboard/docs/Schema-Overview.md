# Schema Overview: BI Data Warehouse

This document outlines the Star Schema that Power BI will ingest.

## Dimension Tables

### `DimDate`
Used for time-series analysis and line charts.
* `DateKey` (INT): YYYYMMDD format (e.g., 20230101).
* `FullDate` (DATE): The actual date.
* `Year` (INT): e.g., 2023.
* `Month` (INT): 1-12.
* `MonthName` (VARCHAR): e.g., 'January'.
* `Quarter` (INT): 1-4.

### `DimLocation`
Provides geographic data for the Map visual in Power BI.
* `LocationKey` (INT, Primary Key).
* `City` (VARCHAR): e.g., 'Seattle'.
* `State` (VARCHAR): e.g., 'WA'.
* `Country` (VARCHAR): e.g., 'USA'.

### `DimProduct`
Provides product details for categorical analysis (e.g., Bar Charts).
* `ProductKey` (INT, Primary Key).
* `ProductName` (VARCHAR).
* `Category` (VARCHAR).

## Fact Table

### `FactSales`
The central transaction table containing the measurable data.
* `SalesKey` (INT, Primary Key).
* `DateKey` (INT, Foreign Key).
* `LocationKey` (INT, Foreign Key).
* `ProductKey` (INT, Foreign Key).
* `Quantity` (INT): Number of units sold.
* `UnitPrice` (DECIMAL): Price per unit.
* `SalesAmount` (DECIMAL): `Quantity` * `UnitPrice`. (This column will be used to create the `Total Revenue` DAX Measure).
