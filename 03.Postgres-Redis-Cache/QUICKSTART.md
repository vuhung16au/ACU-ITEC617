# Quickstart Guide

This guide will help you spin up the multi-container environment and interact with the Next.js application to observe caching in action.

## 1. Start the Environment

Make sure you have Docker and Docker Compose installed. Open a terminal in this directory (`03.Postgres-Redis-Cache`) and run:

```bash
make up
```

This will download the required images and start the following services:
*   **PostgreSQL**: The primary relational database (port `5432`).
*   **pgAdmin**: A web-based UI to manage PostgreSQL (port `5050`).
*   **Redis**: The in-memory data store used as a cache (port `6379`).
*   **RedisInsight**: A web-based UI to inspect Redis (port `8001`).
*   **Next.js WebApp**: The application demonstrating the Cache Hit/Miss logic (port `3000`).

## 2. Access the Application

Once the containers are running, open your web browser and navigate to:

**[http://localhost:3000](http://localhost:3000)**

You will see the sample application interface.

## 3. Observe Cache Hit and Miss

1.  Click the **"Fetch Users"** button.
2.  **First Request (Cache Miss)**: The application will query Redis first. Since the data is not there, it will query PostgreSQL, store the result in Redis, and return it to you. The UI will show a **Cache Miss** badge. Notice the longer response time.
3.  Click the **"Fetch Users"** button again.
4.  **Second Request (Cache Hit)**: The application will query Redis. The data is found and returned immediately without hitting PostgreSQL. The UI will show a **Cache Hit** badge. Notice the faster response time.

## 4. Explore the Database and Cache

### Accessing PostgreSQL (via pgAdmin)
1. Navigate to **[http://localhost:5050](http://localhost:5050)**
2. Login with credentials:
   * **Email**: `admin@admin.com`
   * **Password**: `admin`
3. Expand **Servers** -> **PostgresServer** -> **Databases** -> **mydb** -> **Schemas** -> **public** -> **Tables** to view the `users` table.

### Accessing Redis (via RedisInsight)
1. Navigate to **[http://localhost:8001](http://localhost:8001)**
2. Accept the terms and add a Redis database connection.
3. Use `redis-03-Postgres-Redis-Cache` as the host and `6379` as the port.
4. Browse the keys to see the cached user data. You can delete the key here to force a Cache Miss on the next request.

## 5. Stop the Environment

When you are done, run the following command to stop and remove the containers:

```bash
make down
```
