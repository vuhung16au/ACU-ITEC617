# Quickstart Guide: Multi-API Query Comparison

In this challenge, we will run simulated backends for the MongoDB and Gremlin APIs. You will execute queries to compare how different paradigms handle the exact same Employee data.

## 1. Start the Environment
1. Open your terminal in this folder.
2. Run:
   ```bash
   make up
   ```
3. Docker will launch:
   - A **MongoDB** database + **Mongo Express UI** (simulating Document querying).
   - A **Gremlin Server** + an automated Python script to seed the graph (simulating Graph querying).

## 2. Compare Query Patterns

We are looking for employees with a salary > 50,000.

### Part A: Cosmos DB SQL API (Conceptual)
If you were using the Cosmos DB Core (SQL) API, you would query the JSON like this:
```sql
SELECT e.name, e.department 
FROM employees e 
WHERE e.salary > 50000
```
*This provides a familiar relational syntax but operates over schema-less JSON documents.*

### Part B: MongoDB API (Hands-on)
1. Go to **[http://localhost:5050](http://localhost:5050)** to open Mongo Express.
2. Navigate to `itec617` -> `employees`.
3. In the "Advanced" search, execute:
   ```json
   {"salary": {"$gt": 50000}}
   ```

### Part C: Gremlin API (Graph traversal)
1. To query the Gremlin server, we will use a temporary gremlin-console container:
   ```bash
   docker run -it --rm --network db-network tinkerpop/gremlin-console
   ```
2. Once the console loads (`gremlin>`), connect to the server:
   ```groovy
   :remote connect tinkerpop.server conf/remote.yaml
   :remote console
   ```
3. Run the equivalent graph query (find Vertices labelled 'employee' with salary > 50000):
   ```groovy
   g.V().hasLabel('employee').has('salary', gt(50000)).values('name', 'department')
   ```

## 3. The Challenge: Complex Relationships

**Challenge Goal:** Find "employees who work in the same department as their manager."

In our data, **Frank** is an Intern in Sales, but he reports to **Alice**, who is in Engineering. He does *not* work in the same department as his manager. **Bob** is in Engineering, and reports to Alice in Engineering.

**How to do this in SQL?**
In SQL, you must perform self-joins:
```sql
SELECT e1.name 
FROM employees e1
JOIN employees e2 ON e1.managerId = e2.id
WHERE e1.department = e2.department
```

**How to do this in Gremlin (Graph)?**
Graph databases excel at relationships. Paste this into your gremlin console:
```groovy
g.V().hasLabel('employee').as('emp')
  .out('reports_to').as('mgr')
  .where('emp', eq('mgr')).by('department')
  .select('emp').values('name')
```
*Notice how Graph APIs traverse relationships directly (`out('reports_to')`) without needing expensive `JOIN` clauses.*

## 4. Stop the Environment
Exit the gremlin console (`:exit`), then run:
```bash
make down
```
