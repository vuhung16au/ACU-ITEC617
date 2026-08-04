# Querying JSON & Partitioning Strategies

When working with Document databases, querying requires addressing nested structures.

## Querying Nested Properties & Arrays

### Cosmos DB SQL API Syntax
Cosmos DB provides a SQL-like dialect adapted for JSON:

- **Nested Objects:** Accessed using dot notation.
  `SELECT * FROM c WHERE c.specs.cpu = "i7"`

- **Arrays:** Arrays require special functions.
  `SELECT * FROM c WHERE ARRAY_CONTAINS(c.tags, "gaming")`

- **Unnesting Arrays:** You can use `JOIN` to flatten an array inside a document, creating a row for each item in the array.
  `SELECT c.name, tag FROM c JOIN tag IN c.tags`

## Partitioning Strategies

As data grows, Cosmos DB splits collections into logical partitions based on a **Partition Key**.

### Choosing a Partition Key
Choosing the right key is critical for performance:

1. **Read-Heavy Workloads:** If your most frequent query is fetching products by `category`, then `category` is an excellent partition key. This makes the query a "single-partition" query, which is extremely fast.
2. **Write-Heavy Workloads:** If you are ingesting massive amounts of data, choose a partition key with high cardinality (many distinct values, like `id`) to distribute the write load evenly across all physical partitions.

### The Challenge: Cross-Partition Queries
If you partition your products by `category`, but then run:
`SELECT * FROM products p WHERE p.price < 500`

The database has to scan *every* category partition to find products matching the price. This is called a **cross-partition query** and is expensive in both time and Request Units (RUs). A good partition design minimizes cross-partition queries for the most common application operations.
