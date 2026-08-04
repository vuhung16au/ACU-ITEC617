# Quickstart Guide

Follow these steps to run the PostgreSQL database and pgAdmin for this example.

## Prerequisites
* Docker
* Docker Compose

## Starting the Environment

1. Open your terminal and navigate to this folder:
   ```bash
   cd path/to/Week02/03.Identifying-the-Weak-Link
   ```

2. Start the database and pgAdmin containers in the background:
   ```bash
   docker compose up -d
   ```

3. The initialization script (`init-scripts/01-init.sql`) will automatically execute, creating the tables and inserting sample data.

## Accessing pgAdmin

1. Open your web browser and go to `http://localhost:5050`
2. Log in with the default credentials:
   * **Email:** `admin@admin.com`
   * **Password:** `root`
3. Connect to the database server using these details:
   * **Host name/address:** `postgres`
   * **Port:** `5432`
   * **Username:** `user`
   * **Password:** `password`
   * **Database:** `itec617`

## Cleaning Up

To stop and remove the containers, run:
```bash
docker compose down -v
```
*(The `-v` flag also removes the database volume, ensuring a clean slate next time you start it).*
