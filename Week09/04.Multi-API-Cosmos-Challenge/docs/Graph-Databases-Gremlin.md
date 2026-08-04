# Graph Databases & The Gremlin API

While relational databases focus on tables, and document databases focus on JSON objects, **Graph Databases** focus on the relationships between data points.

## The Graph Data Model
In a graph database, data is represented by:
1. **Vertices (Nodes):** The entities in your data (e.g., an Employee, a Department, a Product).
2. **Edges (Relationships):** The connections between the vertices (e.g., `reports_to`, `works_in`, `purchased`).
3. **Properties:** Both vertices and edges can contain metadata (e.g., a `name` property on an Employee vertex, or a `since_date` property on a `reports_to` edge).

## Why Graph Databases?
Relational databases calculate relationships at query time using `JOIN` statements. If you have to join 5 tables together (e.g., "Find all friends of friends who bought product X"), the query becomes incredibly slow and complex.

Graph databases store the relationships persistently. Traversing from one node to another (e.g., `employee -> reports_to -> manager`) is an O(1) direct memory pointer operation. This makes relationship queries lightning-fast, regardless of how large the dataset grows.

## The Gremlin Query Language
Gremlin is a graph traversal language used by Apache TinkerPop (and supported by Azure Cosmos DB). It reads sequentially from left to right, defining the path to traverse through the graph.

**Example Translation:**
- *SQL:* `SELECT name FROM employee WHERE salary > 50000`
- *Gremlin:* `g.V().hasLabel('employee').has('salary', gt(50000)).values('name')`
  - `g.V()`: Get all Vertices.
  - `hasLabel('employee')`: Filter to only employee nodes.
  - `has('salary', gt(50000))`: Filter by salary property.
  - `values('name')`: Select the name property.
