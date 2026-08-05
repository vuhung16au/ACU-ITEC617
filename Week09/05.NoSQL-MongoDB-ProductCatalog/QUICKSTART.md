# Quickstart Guide

This tutorial provides a MongoDB database and a Python FastAPI Web API to explore NoSQL concepts.

## Part 1: Start the Database

1. Open your terminal and navigate to this directory (`Week09/05.NoSQL-MongoDB-ProductCatalog/`).
2. Start the Docker environment:
   ```bash
   make up
   ```
3. Open **Mongo Express** (the Web UI) in your browser at http://localhost:8081.
   * Username: `admin`
   * Password: `password`
4. Click on the `catalog` database, and then the `products` collection to view the raw JSON documents.

## Part 2: Run the Web API

1. Ensure you have Python installed. Install the required API frameworks and MongoDB drivers:
   ```bash
   pip install -r requirements.txt
   ```
2. Start the FastAPI server:
   ```bash
   uvicorn api:app --reload
   ```
3. Open your browser to the automatic API documentation at http://127.0.0.1:8000/docs.

## Part 3: Test the Schema-less Queries

Using the FastAPI Swagger UI (at `/docs`), try out the following endpoints:

* **`GET /products`**: Fetch all products. Notice how different products return completely different nested JSON `attributes`.
* **`GET /products/search`**: Try querying deep into the document structure.
  * *Example 1:* `key = attributes.cpu`, `value = M2 Max` (Finds the laptop)
  * *Example 2:* `key = attributes.size`, `value = L` (Finds the shirt)

## Cleanup
When finished, stop the API (`Ctrl+C`) and bring down the database:
```bash
make down
```
