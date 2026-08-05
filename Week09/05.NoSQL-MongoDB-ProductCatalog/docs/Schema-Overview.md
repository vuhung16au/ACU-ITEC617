# Schema Overview

Because MongoDB is a schema-less document database, there is no strict schema definition (DDL like `CREATE TABLE`). 

However, within the `catalog` database, we use a single collection called `products`.

## The `products` Collection
Documents in this collection generally share a few top-level properties but diverge completely within their `attributes` sub-document.

### Common Top-Level Fields
* `_id`: The MongoDB generated unique ObjectId (automatically handled).
* `name`: The product title.
* `category`: Broad classification (e.g., Electronics, Apparel, Home).
* `price`: Numeric price.

### The Flexible `attributes` Field
This is an embedded JSON object that holds key-value pairs specific to the product type.

* **Electronics Example:**
  ```json
  "attributes": {
    "cpu": "M2 Max",
    "ram": "32GB",
    "storage": "1TB SSD"
  }
  ```
* **Apparel Example:**
  ```json
  "attributes": {
    "size": "L",
    "color": "Blue",
    "material": "Cotton"
  }
  ```

Because of this flexibility, adding a brand new product type (like a Car with "horsepower" and "doors" attributes) requires absolutely zero changes to the database schema.
