// This script runs automatically when the MongoDB container starts for the first time.
// It initializes the database with some sample Australian data.

db = db.getSiblingDB('itec617');

db.users.insertMany([
  {
    firstName: "Hung",
    lastName: "Vu",
    email: "hung.vu@example.com.au",
    role: "admin",
    address: {
      street: "123 George St",
      city: "Sydney",
      state: "NSW",
      postcode: "2000"
    },
    preferences: {
      newsletter: true,
      theme: "dark"
    },
    createdAt: new Date()
  },
  {
    firstName: "Minh",
    lastName: "Nguyen",
    email: "minh.nguyen@example.com.au",
    role: "user",
    address: {
      street: "45 Collins St",
      city: "Melbourne",
      state: "VIC",
      postcode: "3000"
    },
    preferences: {
      newsletter: false,
      theme: "light"
    },
    createdAt: new Date()
  },
  {
    firstName: "Sarah",
    lastName: "Smith",
    email: "sarah.smith@example.com.au",
    role: "user",
    address: {
      street: "88 Queen St",
      city: "Brisbane",
      state: "QLD",
      postcode: "4000"
    },
    createdAt: new Date()
  }
]);

print("Database 'itec617' initialized with mock data.");
