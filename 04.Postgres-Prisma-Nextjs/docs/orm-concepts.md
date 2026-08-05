# Understanding Object-Relational Mapping (ORM)

An **Object-Relational Mapper (ORM)** is a tool that allows developers to interact with a relational database using their preferred programming language instead of writing raw SQL queries.

## Why Use an ORM?

1. **Abstraction**: ORMs abstract away the complexity of SQL, allowing developers to manipulate database records as objects or models in code.
2. **Type Safety**: In languages like TypeScript, ORMs provide autocomplete and compile-time checks, ensuring that database queries align with the schema structure.
3. **Productivity**: ORMs often generate a lot of boilerplate code for Create, Read, Update, and Delete (CRUD) operations, speeding up development.
4. **Database Agnosticism**: Many ORMs allow you to switch the underlying database (e.g., from SQLite to PostgreSQL) with minimal code changes.

## Prisma in this Project

This project uses **Prisma**, a modern ORM for Node.js and TypeScript.
In a typical Prisma workflow:
- The database schema is defined in a `schema.prisma` file (or introspected from an existing database using `prisma db pull`).
- The **Prisma Client** is generated (`npx prisma generate`), which exposes a type-safe query builder tailored to the schema.
- We then use Prisma Client in our Next.js application to query data efficiently.
