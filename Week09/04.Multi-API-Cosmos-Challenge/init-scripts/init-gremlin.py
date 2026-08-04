import time
from gremlin_python.driver import client, serializer

# Wait for gremlin server to be fully ready
time.sleep(10)

print("Connecting to Gremlin Server...")
c = client.Client('ws://gremlin-server:8182/gremlin', 'g')

print("Seeding Graph Database...")

# Drop existing graph
c.submit("g.V().drop()").all().result()

# Create nodes (Vertices)
queries = [
    "g.addV('employee').property('id', '1').property('name', 'Alice').property('department', 'Engineering').property('salary', 120000).property('title', 'VP of Engineering')",
    "g.addV('employee').property('id', '2').property('name', 'Bob').property('department', 'Engineering').property('salary', 90000).property('title', 'Senior Developer')",
    "g.addV('employee').property('id', '3').property('name', 'Charlie').property('department', 'Sales').property('salary', 60000).property('title', 'Account Executive')",
    "g.addV('employee').property('id', '4').property('name', 'Diana').property('department', 'Sales').property('salary', 110000).property('title', 'VP of Sales')",
    "g.addV('employee').property('id', '5').property('name', 'Eve').property('department', 'Engineering').property('salary', 85000).property('title', 'Developer')",
    "g.addV('employee').property('id', '6').property('name', 'Frank').property('department', 'Sales').property('salary', 40000).property('title', 'Intern')",
    
    "g.addV('department').property('id', 'd1').property('name', 'Engineering')",
    "g.addV('department').property('id', 'd2').property('name', 'Sales')"
]

for q in queries:
    c.submit(q).all().result()

# Create edges (Relationships)
edges = [
    # Manager relationships
    "g.V().has('employee', 'id', '2').addE('reports_to').to(g.V().has('employee', 'id', '1'))",
    "g.V().has('employee', 'id', '5').addE('reports_to').to(g.V().has('employee', 'id', '2'))",
    "g.V().has('employee', 'id', '3').addE('reports_to').to(g.V().has('employee', 'id', '4'))",
    "g.V().has('employee', 'id', '6').addE('reports_to').to(g.V().has('employee', 'id', '1'))",
    
    # Department relationships
    "g.V().has('employee', 'id', '1').addE('works_in').to(g.V().has('department', 'id', 'd1'))",
    "g.V().has('employee', 'id', '2').addE('works_in').to(g.V().has('department', 'id', 'd1'))",
    "g.V().has('employee', 'id', '5').addE('works_in').to(g.V().has('department', 'id', 'd1'))",
    
    "g.V().has('employee', 'id', '3').addE('works_in').to(g.V().has('department', 'id', 'd2'))",
    "g.V().has('employee', 'id', '4').addE('works_in').to(g.V().has('department', 'id', 'd2'))",
    "g.V().has('employee', 'id', '6').addE('works_in').to(g.V().has('department', 'id', 'd2'))",
]

for e in edges:
    c.submit(e).all().result()

print("Graph data initialized successfully.")
c.close()
