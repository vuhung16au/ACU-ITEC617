from fastapi import FastAPI
from pymongo import MongoClient
import os

app = FastAPI(
    title="NoSQL Product Catalog API",
    description="A Web API demonstrating MongoDB's Schema-on-Read capabilities."
)

# Connect to MongoDB
MONGO_URI = os.getenv("MONGO_URI", "mongodb://localhost:27017/")
client = MongoClient(MONGO_URI)
db = client.catalog
collection = db.products

@app.get("/")
def read_root():
    return {"message": "Welcome to the MongoDB Product Catalog API! See /docs for endpoints."}

@app.get("/products")
def get_products(category: str = None):
    """
    Retrieve products. Optionally filter by category.
    MongoDB's find() method easily returns JSON documents.
    """
    query = {}
    if category:
        query["category"] = category
        
    # Exclude the MongoDB '_id' (ObjectId) from the JSON response to simplify parsing
    products = list(collection.find(query, {"_id": 0}))
    return {"products": products}

@app.get("/products/search")
def search_attributes(key: str, value: str):
    """
    Query deeply nested, flexible 'attributes' objects.
    Example: 
      - key="attributes.size", value="L"
      - key="attributes.cpu", value="M2 Max"
    This demonstrates the power of NoSQL for heterogeneous data.
    """
    # In MongoDB, we can query nested fields using dot notation!
    query = {key: value}
    
    # Optional: If the value is "true" or "false", convert it to boolean for the query
    if value.lower() == "true":
        query[key] = True
    elif value.lower() == "false":
        query[key] = False
        
    products = list(collection.find(query, {"_id": 0}))
    return {"products": products}
