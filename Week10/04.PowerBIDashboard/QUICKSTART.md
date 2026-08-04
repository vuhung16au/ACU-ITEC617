# Quickstart Guide

Follow these instructions to spin up the local Data Warehouse and connect Power BI Desktop to it.

## 1. Starting the Data Warehouse

1. Open your terminal and navigate to `Week10/04.PowerBIDashboard`.
2. Run the following command to start PostgreSQL and pgAdmin:
   ```bash
   make up
   ```
3. *(Optional)* Verify the data by going to `http://localhost:5050` and opening the `ITEC617 - Week 10 DB 04` server. Check that `DimDate`, `DimLocation`, `DimProduct`, and `FactSales` contain data.

## 2. Connecting Power BI to PostgreSQL

1. Open **Power BI Desktop**.
2. Click **Get Data** -> **More...**
3. Search for **PostgreSQL database** and click **Connect**.
4. Enter the connection details:
   * **Server**: `localhost` (or `127.0.0.1`)
   * **Database**: `itec617`
   * **Data Connectivity mode**: **Import** (DirectQuery is also fine, but Import is faster for small datasets).
   * Click **OK**.
5. When prompted for credentials, use:
   * **Username**: `user`
   * **Password**: `password`
6. The Navigator window will appear. Select the following tables under `public`:
   * `dimdate`
   * `dimlocation`
   * `dimproduct`
   * `factsales`
7. Click **Load**.

## 3. Building the Data Model

1. Go to the **Model view** (the relationship icon on the left panel).
2. Ensure there is a **1-to-Many (*)** relationship between each Dimension table and the `factsales` table.
   * `dimdate.datekey` -> `factsales.datekey`
   * `dimlocation.locationkey` -> `factsales.locationkey`
   * `dimproduct.productkey` -> `factsales.productkey`
   *(Power BI might auto-detect these based on column names).*

## 4. Creating the Dashboard

Go to the **Report view** (the chart icon) to build your visuals.

**A. Create DAX Measures:**
1. Right-click the `factsales` table and select **New measure**.
2. Type: `Total Revenue = SUM(factsales[salesamount])`

**B. Build Visualizations:**
1. **Line Chart**: Drag `dimdate[monthname]` to the X-axis and your new `Total Revenue` measure to the Y-axis.
2. **Bar Chart**: Create a Clustered Bar Chart. Drag `dimproduct[productname]` to the Y-axis and `Total Revenue` to the X-axis. Filter it to show the Top 10.
3. **Map**: Create a Map visual. Drag `dimlocation[city]` or `dimlocation[state]` to the Location well, and `Total Revenue` to the Bubble size.

## 5. Clean Up

When finished, close Power BI and stop the database by running:
```bash
make down
```
