# Cosmos DB Multi-Model Architecture

Azure Cosmos DB is uniquely designed as a globally distributed, **multi-model database**. This means the underlying storage engine is separated from the API layer that you use to query it.

## One Database, Multiple APIs
When you provision a Cosmos DB account, you select an API to interact with the data:

1. **Core (SQL) API:** The default API. Data is stored as JSON documents, but queried using a familiar SQL dialect (`SELECT`, `FROM`, `WHERE`, `JOIN`).
2. **MongoDB API:** Provides wire-protocol compatibility with MongoDB. You can use standard MongoDB drivers and tools to query your Cosmos DB data.
3. **Gremlin API:** Built for Graph databases (nodes and edges). Excellent for highly interconnected data like social networks or recommendation engines.
4. **Cassandra API:** Wide-column store compatibility for migrating Cassandra workloads.
5. **Table API:** Key-Value store compatibility for migrating Azure Table Storage workloads.

## Why Multi-Model?
Multi-model architecture prevents vendor lock-in and reduces the learning curve. If your development team already knows MongoDB, they can point their application at Cosmos DB using the MongoDB API and instantly gain Cosmos DB's global distribution, single-digit millisecond latency, and SLA guarantees—without changing their code.

## The Right Tool for the Job
The API you choose depends on how your data is structured and queried:
- If your data has deep, complex relationships, a **Graph (Gremlin)** approach will drastically outperform SQL JOINs.
- If your data is semi-structured but you want standard analytic querying, **Core (SQL)** is best.
- If you are migrating a MEAN stack application, **MongoDB** is the seamless choice.
