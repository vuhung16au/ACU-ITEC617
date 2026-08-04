# Quickstart Guide

This guide provides step-by-step instructions on how to start the lab environment, connect to the database, and practice writing ETL scripts.

## Prerequisites
* Docker and Docker Compose installed on your machine.

## Starting the Environment

1. Open your terminal and navigate to this topic's folder (`Week10/02.ETLPipeline`).
2. Run the following command to start the PostgreSQL database and pgAdmin containers in the background:
   ```bash
   make up
   ```

## Connecting to the Database via pgAdmin

We have configured pgAdmin for a seamless experience. 

1. Open your web browser and go to: [http://localhost:5050](http://localhost:5050)
2. In the pgAdmin interface, look at the left sidebar under **Servers**.
3. Expand the **ITEC617 - Week 10 DB 02** server.
4. You will be prompted for a password. Enter: `password`.
5. Expand **Databases** -> **itec617** -> **Schemas** -> **public** -> **Tables** to see both the `Stg_` (Staging) tables and the empty Target Fact/Dim tables.

## Running the ETL Exercise

1. Right-click on the **itec617** database and select **Query Tool**.
2. **Step 1:** Load the `DimProduct` table by writing an `INSERT INTO DimProduct SELECT ... FROM Stg_ProductCatalog` query.
3. **Step 2:** Load the `FactSales` table. You will need to join `Stg_RawSales` with `DimProduct`, filter out rows with `NULL` dates, replace `NULL` unit prices with a default value (like `0` or `COALESCE`), and calculate the `TotalPrice`.
4. **Step 3:** Load the `FactDailySalesSummary` table by aggregating the data you just loaded into `FactSales`.

*Check `init-scripts/01-init.sql` for hints and commented-out solutions!*

## Stopping the Environment

When you are finished with the exercise, you can stop and clean up the containers by running:
```bash
make down
```
