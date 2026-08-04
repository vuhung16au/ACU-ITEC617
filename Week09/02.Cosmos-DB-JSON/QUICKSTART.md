# Quickstart Guide: Querying JSON Documents

This guide will walk you through interacting with a local NoSQL Document Store (MongoDB) using the Mongo Express web UI. We will write queries equivalent to Cosmos DB SQL API operations.

## 1. Start the Environment
1. Open your terminal in this folder.
2. Run the command:
   ```bash
   make up
   ```
3. Docker will start the MongoDB container and seed it with nested JSON documents (the `products` collection), along with the Mongo Express UI.

## 2. Connect to the UI
1. Open your browser and navigate to: [http://localhost:5050](http://localhost:5050)
2. You will see the Mongo Express dashboard.
3. Click on the **`itec617`** database, then click on the **`products`** collection to view the data.

## 3. Hands-on Queries

*In Cosmos DB SQL API, you would use SQL syntax. In MongoDB, we use JSON-based query filters. Both achieve the same document retrieval.*

### A. Basic Filtering (Price < 1000)
- **Cosmos DB SQL:** `SELECT * FROM products p WHERE p.price < 1000`
- **MongoDB Filter:** In the "Advanced" search box in Mongo Express, enter:
  ```json
  {"price": {"$lt": 1000}}
  ```
  Click **Find**.

### B. Query Nested Properties (RAM = 16GB)
- **Cosmos DB SQL:** `SELECT * FROM products p WHERE p.specs.ram = "16GB"`
- **MongoDB Filter:**
  ```json
  {"specs.ram": "16GB"}
  ```

### C. Query Arrays (Tags contains "gaming")
- **Cosmos DB SQL:** `SELECT * FROM products p WHERE ARRAY_CONTAINS(p.tags, "gaming")`
- **MongoDB Filter:**
  ```json
  {"tags": "gaming"}
  ```

### D. Aggregation (Average Price)
While Mongo Express doesn't run full aggregation pipelines from the basic UI, conceptually in Cosmos DB this is:
- **Cosmos DB SQL:** `SELECT AVG(p.price) FROM products p`
- **MongoDB Shell:** `db.products.aggregate([{ $group: { _id: null, avgPrice: { $avg: "$price" } } }])`

## 4. Stop the Environment
When you are finished, you can tear down the environment by running:
```bash
make down
```
