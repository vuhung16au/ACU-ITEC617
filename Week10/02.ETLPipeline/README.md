# Week 10 - Topic 02: ETL Pipeline (SQL Scripts)

## Overview
This exercise introduces students to the core concepts of **Extract, Transform, Load (ETL)** and Data Integration. Using a pure SQL approach, students will act as Data Engineers to move data from raw staging tables into a clean, structured Data Warehouse (Star Schema).

## Learning Objectives
* Understand how data is staged before being transformed.
* Write SQL to **Transform** data:
  * Clean `NULL` values and filter out invalid records.
  * Calculate derived columns (e.g., `TotalPrice = Quantity * UnitPrice`).
* Write SQL to **Load** data:
  * Populate Dimension tables.
  * Populate Fact tables using `INSERT INTO ... SELECT` statements.
* Aggregate data to create summary tables.

## Business Scenario
You receive raw sales data from various stores and a product catalog from the company's central ERP system. This data is dumped into "Staging Tables" in your database. The raw data is messy: it contains missing dates, `NULL` prices, and strings that should be dates.

Your goal is to build an ETL process using SQL to:
1. **Extract** the raw data from `Stg_RawSales` and `Stg_ProductCatalog`.
2. **Transform** it by cleaning missing data and calculating totals.
3. **Load** it into the target Data Warehouse tables (`DimProduct`, `FactSales`, and `FactDailySalesSummary`).
