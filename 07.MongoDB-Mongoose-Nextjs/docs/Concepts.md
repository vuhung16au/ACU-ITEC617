# NoSQL and Document Stores

## What is a NoSQL Database?

NoSQL databases are non-tabular databases and store data differently than relational tables. NoSQL databases come in a variety of types based on their data model. The main types are document, key-value, wide-column, and graph. They provide flexible schemas and scale easily with large amounts of data and high user loads.

## Document Stores (e.g., MongoDB)

A document database stores data in documents similar to JSON (JavaScript Object Notation) objects. Each document contains pairs of fields and values. The values can typically be a variety of types including things like strings, numbers, booleans, arrays, or objects.

### Advantages over Relational DBs:
- **Flexible Schema:** You can store documents with different structures in the same collection. You don't need to define columns or migrate schemas as strictly.
- **Hierarchical Data:** Nested objects and arrays allow you to store complex, hierarchical data in a single document without complex `JOIN`s.
- **Developer Friendly:** For JavaScript/Node.js developers, the data maps perfectly to JSON objects.

### When to use a Document Store:
- Your data structure is subject to frequent change.
- You are building content management systems, user profiles, or catalogs where items have varying attributes.
- You need high read/write performance for unstructured or semi-structured data.

### When to stick to Relational DBs (PostgreSQL/SQLite):
- Your data has rigid structure and highly relational data points (many complex JOINs required).
- You require strict ACID compliance across multiple tables (though MongoDB does support multi-document transactions now).
- You have highly normalized data.
