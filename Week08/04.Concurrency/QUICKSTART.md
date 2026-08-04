# Quickstart Guide

## Environment Setup
1. Open a terminal and navigate to this folder.
2. Run `make up` to start the PostgreSQL and pgAdmin containers.
3. Wait a few moments for the containers to fully initialize.

## Connecting to pgAdmin & Simulating Concurrency
1. Go to `http://localhost:5050` in your web browser. There is **no** pgAdmin email/password login screen.
2. On the left sidebar, under **Servers**, expand **ITEC617 - Week 08 DB (Concurrency)**. Enter password: `password`.
3. To simulate multi-user concurrency:
   - Open **Tools → Query Tool**. This will be **Session 1**.
   - Open **Tools → Query Tool** AGAIN in a new tab. This will be **Session 2**.
   - You can now execute SQL statements alternately between Session 1 and Session 2 to observe how they block and interact with each other.

## Cleanup
When you are finished practicing, return to your terminal and run `make down`.
