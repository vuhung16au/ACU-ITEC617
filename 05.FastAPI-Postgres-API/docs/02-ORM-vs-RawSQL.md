# ORM vs Raw SQL

In this project, we provide a toggle in `app/config.py` that allows you to switch the backend implementation between using **Raw SQL** and an **ORM** (Object-Relational Mapper).

Both approaches accomplish the same goal: querying the PostgreSQL database and returning data to the client. However, they go about it very differently.

## 1. Raw SQL (psycopg)

When using raw SQL, you write the exact SQL query strings (e.g., `SELECT * FROM students`) within your Python code. You execute these strings using a database driver (in our case, `psycopg`).

**Pros:**
- **Maximum Control**: You have full control over the exact SQL being executed, allowing for highly optimized and complex queries.
- **Transparency**: There is no "magic" happening under the hood. You know exactly what the database is doing.
- **No Extra Abstractions**: You don't need to learn a specific ORM's syntax; if you know SQL, you can write the query.

**Cons:**
- **Boilerplate**: You often have to manually map the rows returned by the database (usually tuples or dictionaries) into Python objects or Pydantic models.
- **Security Risks**: If you don't use parameterized queries (prepared statements), you are vulnerable to SQL Injection attacks.
- **Database Coupling**: Your SQL might be specific to PostgreSQL. If you want to switch to MySQL later, you might have to rewrite many queries.

## 2. ORM (SQLAlchemy)

An ORM maps database tables to Python Classes, and rows to Python Objects. Instead of writing SQL strings, you call methods on these Python objects (e.g., `session.query(Student).all()`), and the ORM translates that into SQL for you.

**Pros:**
- **Developer Productivity**: It is often much faster to write code using an ORM because you deal directly with Python objects and let the ORM handle the SQL generation and data mapping.
- **Security**: ORMs inherently use parameterized queries, significantly reducing the risk of SQL injection.
- **Database Agnostic**: ORMs can often translate your Python code into the correct SQL dialect for various databases (Postgres, MySQL, SQLite) without changing the Python code.

**Cons:**
- **Learning Curve**: You have to learn the specific ORM's syntax and idiosyncrasies.
- **The N+1 Problem**: ORMs can sometimes generate inefficient SQL if you aren't careful, leading to performance issues when fetching related data.
- **Less Control**: It can be difficult to perform highly complex or specialized queries that the ORM wasn't designed to handle gracefully.

## Which should you use?

For simple applications or when developer speed is the top priority, an ORM is usually the preferred choice. For applications where performance is critical and queries are highly complex, raw SQL (or a hybrid approach, using a query builder) might be necessary.
