# Cosmos DB & JSON Document Stores

Azure Cosmos DB is a globally distributed, multi-model database service. Its core API is the **SQL API**, which allows you to run SQL-like queries over schema-less JSON documents. Because Cosmos DB is a multi-model service, it also natively supports a **MongoDB API**.

## The JSON Document Model

In a relational database, you store data in tables, rows, and columns. In a Document Store (like Cosmos DB or MongoDB), data is stored as JSON objects.

### Example JSON Document:
```json
{
  "id": "123",
  "name": "Gaming Laptop",
  "price": 1299.99,
  "specs": {
    "cpu": "i7",
    "ram": "16GB"
  },
  "tags": ["gaming", "portable", "high-performance"],
  "category": "Electronics"
}
```

### Advantages of the Document Model
1. **Schema Flexibility:** Documents in the same collection don't need identical structures.
2. **Nested Data:** You can embed objects (`specs`) and arrays (`tags`) directly inside the document, reducing the need for expensive `JOIN` operations that are standard in SQL.
3. **Impedance Mismatch:** JSON maps directly to objects in modern object-oriented programming languages.
