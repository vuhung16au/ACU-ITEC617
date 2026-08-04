# Topic 3: Blob Storage + Metadata Querying

## Overview
This example demonstrates working with unstructured data using Azure Blob Storage (via the local Azurite emulator). You will explore how to organize files in containers, attach custom metadata tags to blobs, and interact with the data using Azure Storage Explorer.

## Key Concepts Covered
- **Blob Storage:** A massively scalable object storage for unstructured data (images, documents, logs).
- **Storage Tiers:** (Conceptual) Hot, Cool, and Archive tiers for lifecycle management based on data access patterns.
- **Blob Metadata:** Key-value pairs attached to a blob that provide context (e.g., `category`, `year`, `department`) and enable robust filtering.
- **Data Lake Analytics (U-SQL):** Querying massive unstructured files directly from data lakes.

## Lab Objectives
- Connect to a local Blob Storage emulator.
- Explore uploaded files of varying types (CSV, JSON, JPG, PDF).
- Use Azure Storage Explorer to filter blobs by their custom metadata properties.
- Review concepts related to storage tiers, lifecycle management, and U-SQL data lake querying.

## Getting Started
Please refer to [QUICKSTART.md](QUICKSTART.md) for instructions on starting the emulator and using Azure Storage Explorer.
