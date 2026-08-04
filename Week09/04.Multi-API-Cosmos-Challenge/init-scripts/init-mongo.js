db = db.getSiblingDB('itec617');

db.employees.insertMany([
  { _id: "1", name: "Alice", department: "Engineering", salary: 120000, title: "VP of Engineering" },
  { _id: "2", name: "Bob", department: "Engineering", salary: 90000, title: "Senior Developer", managerId: "1" },
  { _id: "3", name: "Charlie", department: "Sales", salary: 60000, title: "Account Executive", managerId: "4" },
  { _id: "4", name: "Diana", department: "Sales", salary: 110000, title: "VP of Sales" },
  { _id: "5", name: "Eve", department: "Engineering", salary: 85000, title: "Developer", managerId: "2" },
  { _id: "6", name: "Frank", department: "Sales", salary: 40000, title: "Intern", managerId: "1" } // Frank is an intern in Sales but reports to Alice in Engineering
]);

print("Initialized MongoDB employees collection.");
