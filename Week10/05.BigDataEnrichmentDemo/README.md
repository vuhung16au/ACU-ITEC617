# Week 10 - Topic 05: Big Data Processing Demo

## Overview
This enrichment topic provides a showcase of **Big Data Processing** using Apache Spark. While traditional relational databases (like PostgreSQL or Azure SQL) are excellent for operational workloads, massive scale data warehouses and data lakes require distributed computing frameworks.

This demo simulates a modern data architecture:
1. An **Operational Database** (PostgreSQL) storing daily transactions.
2. A **Data Ingestion Pipeline** (Apache Spark) pulling data from the database.
3. **Data Transformation & Analytical Data Modelling** occurring in-memory.
4. Saving the results into an **Analytical Data Store** (Columnar Parquet files, simulating a Data Lake).

## Key Concepts

### 1. Data Ingestion Pipelines (ETL vs ELT)
* **ETL (Extract, Transform, Load)**: Data is extracted from the source, transformed in a processing engine (like Spark), and then loaded into the target data warehouse. 
* **ELT (Extract, Load, Transform)**: Data is extracted and immediately loaded into the target Data Lake (e.g., as raw files), and transformed later using tools like Snowflake or Databricks.

### 2. Analytical Data Stores
Unlike operational databases (OLTP) which store data row-by-row, analytical stores (OLAP) often use **columnar storage formats** like Apache Parquet or Delta Lake. This makes aggregations (e.g., `SUM(sales)`) exponentially faster on large datasets.

### 3. Analytical Data Modelling
In big data, we often flatten or denormalize data to avoid expensive joins during query time. A Star Schema is a classic example of analytical data modelling.

## Environment Architecture
* **PostgreSQL Container**: Acts as our operational source system.
* **Jupyter + Spark Container**: Acts as our big data compute cluster. It runs PySpark (Python API for Apache Spark) allowing us to execute distributed data processing jobs.
