// Switch to the 'catalog' database
db = db.getSiblingDB('catalog');

// Insert a mix of products with highly varied attributes
db.products.insertMany([
  {
    name: "MacBook Pro",
    category: "Electronics",
    price: 1999.99,
    attributes: {
      cpu: "M2 Max",
      ram: "32GB",
      storage: "1TB SSD"
    }
  },
  {
    name: "Graphic T-Shirt",
    category: "Apparel",
    price: 24.99,
    attributes: {
      size: "L",
      color: "Blue",
      material: "Cotton"
    }
  },
  {
    name: "Coffee Mug",
    category: "Home",
    price: 12.50,
    attributes: {
      volume: "12oz",
      microwave_safe: true,
      dishwasher_safe: true
    }
  },
  {
    name: "Mechanical Keyboard",
    category: "Electronics",
    price: 120.00,
    attributes: {
      switches: "Cherry MX Red",
      layout: "Tenkeyless",
      rgb: true
    }
  }
]);

print("Successfully seeded the MongoDB 'catalog' database with flexible documents!");
