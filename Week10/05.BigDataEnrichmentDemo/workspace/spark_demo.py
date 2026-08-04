from pyspark.sql import SparkSession
from pyspark.sql.functions import col

# ==========================================
# 1. Initialize Distributed Spark Session
# ==========================================
# We load the PostgreSQL JDBC driver so Spark can connect to our database.
print("Initializing Apache Spark...")
spark = SparkSession.builder \
    .appName("BigDataEnrichmentDemo") \
    .config("spark.jars.packages", "org.postgresql:postgresql:42.6.0") \
    .getOrCreate()

# Hide excessive logging
spark.sparkContext.setLogLevel("WARN")

# ==========================================
# 2. Extract: Data Ingestion Pipeline
# ==========================================
print("\n[EXTRACT] Pulling data from Operational PostgreSQL Database...")

# In a real Big Data environment, this could be reading from a database,
# an API, or thousands of JSON files in an S3 bucket simultaneously.
sales_df = spark.read \
    .format("jdbc") \
    .option("url", "jdbc:postgresql://postgres:5432/itec617") \
    .option("dbtable", "OperationalSales") \
    .option("user", "user") \
    .option("password", "password") \
    .option("driver", "org.postgresql.Driver") \
    .load()

print("Raw Operational Data:")
sales_df.show()

# ==========================================
# 3. Transform: Analytical Data Modelling
# ==========================================
print("\n[TRANSFORM] Processing data in-memory across the cluster...")

# Calculate Total Amount for each transaction
# In big data, we often pre-calculate metrics so dashboards don't have to.
enriched_df = sales_df.withColumn("TotalAmount", col("quantity") * col("price"))

print("Enriched Analytical Data:")
enriched_df.show()


# ==========================================
# 4. Load: Analytical Data Stores
# ==========================================
print("\n[LOAD] Saving to Analytical Data Store (Parquet)...")

# We write the processed data to Parquet. 
# Parquet is a columnar storage format optimized for fast analytics.
output_path = "/home/jovyan/work/analytical_store/sales_data.parquet"

enriched_df.write \
    .mode("overwrite") \
    .parquet(output_path)

print(f"Data successfully saved to Data Lake at: {output_path}")

# ==========================================
# 5. Querying the Analytical Store
# ==========================================
print("\n[ANALYTICS] Reading from Parquet for lightning-fast queries...")

analytics_df = spark.read.parquet(output_path)

# Let's find the total revenue per product!
print("Total Revenue by Product:")
analytics_df.groupBy("productid").sum("TotalAmount").show()

print("\nDemo Complete! Spark session stopping.")
spark.stop()
