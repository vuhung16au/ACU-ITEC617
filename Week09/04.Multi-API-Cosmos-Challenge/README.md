# Topic 4: Multi-API Cosmos DB Challenge - Compare Query Patterns

## Overview
Azure Cosmos DB is a **multi-model database**, meaning it allows you to store and query the same underlying data using entirely different API interfaces. The core API is the SQL API (for querying JSON documents), but it also supports MongoDB (for NoSQL Document querying), Gremlin (for Graph database relationships), Cassandra (Wide-column), and Table API (Key-Value).

In this lab, we will simulate the Cosmos DB multi-model experience by comparing how three different paradigms (SQL, Document/Mongo, and Graph/Gremlin) handle exactly the same dataset: an Employee hierarchy.

## Key Concepts Covered
- **Cosmos DB Multi-Model:** The concept of abstracting the backend storage engine away from the frontend query API.
- **SQL API (Core):** Writing `SELECT ... FROM ... WHERE` syntax over JSON documents.
- **MongoDB API:** Using JSON-based filtering (e.g., `{ $gt: 50000 }`) over documents.
- **Gremlin API (Graph):** Modeling data as Vertices (nodes) and Edges (relationships) for powerful relational traversal.

## Lab Objectives
- Compare how simple queries (e.g., finding employees by salary) look across SQL, MongoDB, and Gremlin.
- Complete the **Challenge**: Find employees who work in the same department as their manager. You will observe how much easier this complex relationship traversal is in a Graph database compared to writing complex `JOIN` statements in SQL.

## Getting Started
Please refer to [QUICKSTART.md](QUICKSTART.md) for step-by-step instructions on setting up the environments and executing the multi-model comparison queries.
