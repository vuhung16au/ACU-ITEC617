# Schema Overview

## 1. Operational Database (PostgreSQL)

The source database contains highly normalized transaction tables.

### `OperationalSales`
* `TransactionID` (Primary Key)
* `SaleDate`
* `ProductID`
* `CustomerID`
* `Quantity`
* `Price`

## 2. Analytical Data Store (Parquet Data Lake)

Apache Spark reads the operational data, transforms it, and saves it into a columnar Parquet file.

### `sales_data.parquet`
* `transactionid`
* `saledate`
* `productid`
* `customerid`
* `quantity`
* `price`
* `TotalAmount` (Derived during the Spark Transformation)
