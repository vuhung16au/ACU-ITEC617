# Topic 2: Cosmos DB (NoSQL Document API) - Querying JSON Documents

## Overview
This example demonstrates how to query semi-structured, nested JSON documents. Azure Cosmos DB offers multiple APIs, including a Core SQL API and a MongoDB API. For local development and to avoid emulator constraints on varying OS architectures (like Mac ARM64), we use **MongoDB** in this lab to simulate the NoSQL document data store experience.

You will learn how to interact with JSON documents, querying nested properties, arrays, and calculating aggregates.

## Key Concepts Covered
- **Document Store (JSON):** Data is stored as JSON objects. Documents can have varying structures, embedded objects, and arrays.
- **Querying Nested Properties:** Accessing data inside an embedded JSON object (e.g., `specs.ram`).
- **Querying Arrays:** Finding documents where an array contains a specific value (e.g., tags containing "gaming").
- **Aggregations:** Calculating averages and grouping data across documents.
- **Partitioning Strategies:** Understanding how to shard/partition JSON collections (e.g., by `category`).

## Lab Objectives
- Load a JSON dataset of products with nested structures and arrays.
- Write queries against nested structures (SQL vs. NoSQL syntaxes).
- Compare the conceptual performance of different partition key strategies.

## Getting Started
Refer to [QUICKSTART.md](QUICKSTART.md) for step-by-step instructions on starting the local MongoDB environment and running the hands-on querying activities.
