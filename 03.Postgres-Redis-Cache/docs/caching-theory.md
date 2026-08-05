# Caching Theory

This document outlines the fundamental concepts of caching demonstrated in this sample project.

## What is Caching?

Caching is the process of storing copies of frequently accessed data in a temporary, high-speed storage layer (the cache). The primary goal is to retrieve this data faster than querying the original, slower storage (like a relational database), thereby improving application performance and reducing the load on the primary database.

In this project, we use **Redis**, an in-memory data structure store, as our cache, and **PostgreSQL** as our primary database.

## Cache Hit vs. Cache Miss

When an application needs data, it first checks the cache. This leads to two possible outcomes:

### 1. Cache Hit
A **Cache Hit** occurs when the requested data is found in the cache. 
*   **Result**: The data is returned immediately to the application.
*   **Benefit**: High speed, low latency, no database query needed.

### 2. Cache Miss
A **Cache Miss** occurs when the requested data is *not* found in the cache.
*   **Result**: 
    1. The application must fetch the data from the primary database (PostgreSQL).
    2. The application then writes this data into the cache (Redis) for future requests.
    3. The application returns the data.
*   **Benefit**: While this initial request is slower, subsequent requests for the same data will result in a Cache Hit.

## The Cache-Aside Pattern

This project implements the **Cache-Aside** (or Lazy Loading) pattern. It is the most common caching strategy.

**How it works:**
1.  **Read**: The application code always asks the cache first.
    *   If a cache hit occurs, return the data.
    *   If a cache miss occurs, query the database, store the result in the cache, and return the data.
2.  **Write/Update**: When data is updated in the database, the corresponding cache entry is invalidated (deleted) or updated so that the cache doesn't serve stale data.

## Expiration (TTL)

To prevent the cache from holding stale data indefinitely, cache entries are usually assigned a **Time-To-Live (TTL)**. After this time period expires, the data is automatically removed from the cache, forcing a Cache Miss and a fresh database query on the next request.
