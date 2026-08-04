# Quickstart Guide: Blob Storage & Metadata

This guide will walk you through setting up the local Azure Blob Storage emulator (Azurite) and exploring metadata filtering using Azure Storage Explorer.

## 1. Start the Environment

1. Open your terminal in this folder.
2. Run:
   ```bash
   make up
   ```
3. Docker will launch the **Azurite emulator** and a Python script that automatically creates a `marketing-assets` container, uploads dummy files (CSV, JSON, images, PDFs), and attaches custom metadata (e.g., `category: marketing`, `year: 2025`).

## 2. Connect Azure Storage Explorer

1. Open **Microsoft Azure Storage Explorer**.
2. In the left-hand Explorer pane, expand **Local and Attached** -> **Storage Accounts** -> **(Emulator - Default Ports)** -> **Blob Containers**.
3. You should see the **marketing-assets** container. *(If you don't see it, wait a few seconds and click Refresh).*

## 3. Hands-on Activities

Double-click the **marketing-assets** container to view the blobs.

### A. View Custom Metadata
1. Right-click on `sales-data-2025.csv` and select **Properties**.
2. In the properties pane, find the **Metadata** section. You will see tags like `category: marketing`, `year: 2025`, and `type: data`.
3. Check the properties of other files like `logo_v1.jpg` or `annual_report.pdf` to see their distinct metadata.

### B. Filter by Metadata
In a massive data lake, browsing by folder path isn't always enough. You can filter by metadata.
*Note: In the Azure Cloud, you would use Blob Index Tags for robust filtering. Locally in Storage Explorer, you can visually observe the metadata differences, and programmatically query them via the SDK or Data Lake Analytics.*

### C. Conceptual Activity: Storage Tiers & Lifecycle Management
Azure Storage Explorer allows you to move blobs between tiers (Hot, Cool, Archive) when connected to real Azure Cloud storage.
1. Right-click any blob.
2. Look for the **Change Access Tier...** option (this is active in cloud accounts).
3. **Challenge:** In the Azure Portal, you can set up **Lifecycle Management Rules** (e.g., "If blob has not been modified in 90 days, move to Cool tier. If not modified in 365 days, move to Archive tier.").

### D. Conceptual Activity: U-SQL Queries
If this storage account were an Azure Data Lake Storage Gen2 account, you could use U-SQL (or Azure Synapse / Databricks) to query the files directly:
```sql
@data =
    EXTRACT Date string,
            Region string,
            Revenue int
    FROM "/marketing-assets/sales-data-2025.csv"
    USING Extractors.Csv(skipFirstNRows: 1);

SELECT * FROM @data WHERE Revenue > 1000;
```
*Note: U-SQL and Data Lake Analytics require Azure Cloud infrastructure and cannot be executed locally in Azurite, but the concepts of querying underlying flat files are identical.*

## 4. Stop the Environment
Run:
```bash
make down
```
