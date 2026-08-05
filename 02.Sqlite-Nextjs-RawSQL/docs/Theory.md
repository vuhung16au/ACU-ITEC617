# Theory: SQLite and Next.js (Raw SQL)

SQLite is a lightweight, serverless database engine that stores data in a single file. It is perfect for small-scale applications and local development.

In Next.js, Server Components and API Routes execute on the server, meaning they can securely connect to a database and retrieve data without exposing credentials or database structure to the client. This project bypasses ORMs like Prisma to demonstrate writing and executing Raw SQL directly via the `sqlite3` driver. This helps understand the underlying database interactions and allows writing highly optimized queries.
