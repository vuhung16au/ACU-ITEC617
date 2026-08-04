# Quickstart Guide

## Environment Setup
1. Open a terminal and navigate to this folder.
2. Run `make up` to start the PostgreSQL and pgAdmin containers.
3. Wait a few moments for the containers to fully initialize.

## Connecting to pgAdmin
1. Go to `http://localhost:5050` in your web browser. There is **no** pgAdmin email/password login screen.
2. On the left sidebar, under **Servers**, expand the pre-loaded server named **ITEC617 - Week 08 DB (Functions)**.
3. When prompted, enter the database password: `password` (you only need to do this once per session).
4. Expand **Databases** -> **itec617** -> **Schemas** -> **public** to view the tables and functions.
5. Open **Tools → Query Tool** from the top menu to practice your SQL.

## Cleanup
When you are finished practicing, return to your terminal and run `make down` to stop and remove the containers.
