# Quickstart Guide: Azure Table Storage

This guide will walk you through setting up the local Azure Table Storage emulator (Azurite) and querying it using Azure Storage Explorer.

## 1. Prerequisites
- **Docker & Docker Compose** installed.
- **Azure Storage Explorer** installed on your local machine. If you don't have it, download it from [Microsoft's official site](https://azure.microsoft.com/en-us/products/storage/storage-explorer/).

## 2. Start the Environment

1. Open your terminal and navigate to this folder.
2. Run the following command:
   ```bash
   make up
   ```
3. Docker will start the **Azurite emulator** and a temporary Python container that automatically creates a `Students` table and populates it with 20+ records.

## 3. Connect Azure Storage Explorer

1. Open **Microsoft Azure Storage Explorer**.
2. In the left-hand Explorer pane, expand **Local and Attached** -> **Storage Accounts** -> **(Emulator - Default Ports)** -> **Tables**.
3. You should see the **Students** table listed here.
   *(Note: If you do not see the table right away, give it 10-15 seconds for the initialization script to finish, then right-click on "Tables" and select "Refresh".)*

## 4. Hands-on Activities

Double-click the **Students** table to open it.

### A. Observe Schema-less Data
Notice the columns. You'll see `PartitionKey`, `RowKey`, and `Timestamp` (mandatory fields). Beyond that, some students have an `Email`, some have a `Phone`, some have an `Age`, and some have a `Major`. There are no `NULL` values; properties simply do not exist if they weren't provided.

### B. Query by Partition (Efficient)
1. Click the **Query** button in the Table view toolbar.
2. In the query builder, set the condition to: `PartitionKey` `Equals` `ITEC617`.
3. Click the run icon (Execute Query).
4. **Why it matters:** Querying by `PartitionKey` allows Azure to locate the exact storage node holding the data. It is highly efficient.

### C. Point Query (Most Efficient)
1. In the query builder, add a second condition: `And` `RowKey` `Equals` `S005`.
2. Execute the query. It returns exactly one student (Evan Wright).
3. **Why it matters:** Using both `PartitionKey` and `RowKey` points directly to the single entity, making it the fastest possible operation.

### D. Cross-Partition Query (Inefficient)
1. Clear the query builder and add a single condition: `Major` `Equals` `Data Science`.
2. Execute the query.
3. **Why it matters:** Because we didn't specify a `PartitionKey`, the database has to scan *every single partition* to find matching records. In a table with billions of rows, this query will be incredibly slow and expensive.

## 5. Stop the Environment
When you are finished, you can stop and remove the containers by running:
```bash
make down
```
