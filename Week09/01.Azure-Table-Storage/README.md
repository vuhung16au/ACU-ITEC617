# Topic 1: Azure Table Storage - Key-Value Queries & Partition Design

## Overview
This example demonstrates how to use Azure Table Storage (via the local Azurite emulator) as a schema-less NoSQL data store. You will explore key-value querying capabilities and learn about the importance of partition design when dealing with massive datasets.

## Key Concepts Covered
- **Azure Table Storage:** A service that stores structured NoSQL data in the cloud, providing a key/attribute store with a schemaless design.
- **PartitionKey & RowKey:** The combination of `PartitionKey` and `RowKey` forms the unique primary key for each entity. The `PartitionKey` is crucial for load balancing and querying performance.
- **Schema-less Nature:** Entities within the same table (and even the same partition) can have varying sets of properties (e.g., some have email, some have phone, some have age).
- **Partition Design & "Hot Partitions":** Understanding how to choose a `PartitionKey` to evenly distribute workload and avoid throttling.

## Lab Objectives
- Query an Azure Table for a student enrollment system.
- Understand the difference between partition queries (fast) and cross-partition queries (slower).
- Perform a point query to find a specific entity.
- Observe the schema-less nature of the entities.

## Getting Started
Please refer to [QUICKSTART.md](QUICKSTART.md) for step-by-step instructions on bringing up the environment and using Azure Storage Explorer to run your queries.
