# Quickstart Guide

This guide explains how to start the environment and connect to the database.

## 1. Start the Environment

Run the following command in your terminal from this directory:

```bash
make up
```

This will start the PostgreSQL database and pgAdmin in detached mode.

## 2. Connect to pgAdmin

We have set up a seamless flow for you:
1. Go to [http://localhost:5050](http://localhost:5050) in your web browser. There is **no** email/password login screen.
2. On the left, under **Servers**, expand the pre-loaded server: **ITEC617 - Week 06 DB 5**.
3. When prompted, enter the database password: `password`. You only need to do this once per session.
4. Right-click the database `itec617` (or server) and open **Query Tool** to practice your SQL.

## 3. Stop the Environment

When you are done, run the following command to stop the containers:

```bash
make down
```
