db = db.getSiblingDB('itec617');

db.products.insertMany([
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
  },
  {
    "id": "124",
    "name": "Wireless Mouse",
    "price": 49.99,
    "specs": {
      "sensor": "optical",
      "buttons": 5
    },
    "tags": ["accessory", "wireless", "gaming"],
    "category": "Accessories"
  },
  {
    "id": "125",
    "name": "Mechanical Keyboard",
    "price": 109.50,
    "specs": {
      "switches": "cherry-mx-red",
      "layout": "TKL"
    },
    "tags": ["gaming", "mechanical", "wired"],
    "category": "Accessories"
  },
  {
    "id": "126",
    "name": "4K Monitor",
    "price": 399.00,
    "specs": {
      "resolution": "3840x2160",
      "refreshRate": "144Hz",
      "panel": "IPS"
    },
    "tags": ["display", "4k", "gaming"],
    "category": "Electronics"
  },
  {
    "id": "127",
    "name": "Office Chair",
    "price": 199.99,
    "specs": {
      "material": "mesh",
      "ergonomic": true
    },
    "tags": ["furniture", "office"],
    "category": "Furniture"
  }
]);

print("Initialized products collection with nested JSON structures.");
