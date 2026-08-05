# Document Databases & Schema-less API

## The Product Catalog Problem
In a standard relational database (SQL), every row in a table must adhere to the table's defined columns. This is known as **Schema-on-Write** (the database enforces the structure when you save data).

If you are building an e-commerce platform, products are highly heterogeneous:
* A **Laptop** needs columns for `CPU`, `RAM`, `Storage`.
* A **T-Shirt** needs columns for `Size`, `Color`, `Material`.
* A **Coffee Mug** needs columns for `Volume`, `Microwave_Safe`.

In SQL, you either create a massive table with hundreds of empty (NULL) columns, or you use a complex and slow Entity-Attribute-Value (EAV) structure.

## The NoSQL Solution: Schema-on-Read
Document databases like **MongoDB** store data as JSON (technically BSON) documents. A collection (equivalent to a table) does not enforce a strict schema. 

```json
{
  "name": "MacBook Pro",
  "attributes": {
    "cpu": "M2 Max",
    "ram": "32GB"
  }
}
```
```json
{
  "name": "Graphic T-Shirt",
  "attributes": {
    "size": "L",
    "color": "Blue"
  }
}
```

Because MongoDB doesn't care if one document has a `cpu` field and another has a `size` field, you can store all products in a single `products` collection. The application code (the API) handles the logic of what to do with the fields when it reads them—this is known as **Schema-on-Read**.

## MongoDB Queries
MongoDB uses a rich query language implemented as JSON objects passed to methods like `find()`.

In SQL, you would write:
```sql
SELECT * FROM Products WHERE Category = 'Electronics';
```
In MongoDB, via Python's PyMongo, you write:
```python
collection.find({"category": "Electronics"})
```

You can even query deep into nested objects using dot notation:
```python
collection.find({"attributes.ram": "32GB"})
```
