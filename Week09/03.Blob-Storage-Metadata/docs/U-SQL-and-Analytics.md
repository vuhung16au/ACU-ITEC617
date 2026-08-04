# Data Lakes & U-SQL Analytics

Azure Data Lake Storage (ADLS) Gen2 is built on top of Azure Blob Storage. It adds a hierarchical namespace (true folders) and Hadoop-compatible access, making it optimized for big data analytics.

## Querying Files Directly
When you store raw data (CSV, JSON, Parquet) in a Data Lake, you don't always want to import it into a SQL database before analyzing it. 

### Azure Data Lake Analytics (U-SQL)
U-SQL is a language that combines the declarative nature of SQL with the expressive power of C#. It allows you to run distributed queries directly against files sitting in blob storage.

**Example: Querying a CSV**
```sql
-- 1. Extract data from the file
@salesData =
    EXTRACT Date string,
            Region string,
            Revenue int
    FROM "/marketing-assets/sales-data-2025.csv"
    USING Extractors.Csv(skipFirstNRows: 1);

-- 2. Transform / Query the data
@filteredSales =
    SELECT Region, SUM(Revenue) AS TotalRevenue
    FROM @salesData
    GROUP BY Region;

-- 3. Output the result to a new file
OUTPUT @filteredSales
    TO "/marketing-assets/revenue-summary.csv"
    USING Outputters.Csv();
```

### Modern Alternatives
While U-SQL was popular for Data Lake Analytics, modern architectures heavily utilize:
- **Azure Synapse Analytics (Serverless SQL Pools):** Allows you to write standard T-SQL queries (`OPENROWSET`) over CSV and Parquet files in Blob/ADLS.
- **Azure Databricks (PySpark / Spark SQL):** The industry standard for processing big data using distributed Spark clusters.

In all cases, the underlying paradigm is the same: Schema-on-Read. The data is stored raw (unstructured), and the schema is applied at the exact moment the query runs.
