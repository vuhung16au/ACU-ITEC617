# Postgres and Redis Caching Project

This project demonstrates how to implement a caching layer using Redis in front of a PostgreSQL database. It illustrates the concepts of Cache Hits and Cache Misses, showing how caching can significantly improve read performance for data that is frequently accessed but infrequently updated.

## Learning Objectives
* Understand the role of a caching layer in a web application architecture.
* Differentiate between a Cache Hit (data found in cache) and a Cache Miss (data retrieved from the primary database).
* Implement the Cache-Aside pattern using Next.js, Prisma, and Redis.
* Utilize Docker and Docker Compose to orchestrate a multi-container environment containing a web app, Postgres, Redis, and their respective management UIs.

## Directory Structure
* `docs/`: Contains documentation on caching theory.
* `images/`: Contains screenshots and visual assets.
* `init-scripts/`: SQL scripts to populate the database with mock Australian user data.
* `webapp/`: The Next.js application that serves the frontend and API.

## Next Steps
Please refer to [QUICKSTART.md](QUICKSTART.md) to launch the environment and interact with the application.
