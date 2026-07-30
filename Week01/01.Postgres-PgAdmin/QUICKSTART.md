# Quickstart Guide

Follow these steps to get your PostgreSQL database and pgAdmin interface up and running.

## 1. Start the Environment

Make sure you have Docker and Docker Compose installed. Open your terminal, navigate to this directory (`Week01/01.Postgres-PgAdmin`), and run:

```bash
docker compose up -d
```
*(The `-d` flag runs the containers in detached mode, in the background.)*

This will download the necessary images and start both `postgres` and `pgadmin`. Upon the first startup, the database will automatically execute the script in the `init-scripts` folder to create and seed the `Students` table with 100 sample records.

## 2. Access pgAdmin

1. Open your web browser and navigate to [http://localhost:5050](http://localhost:5050).
2. Log in using the default credentials defined in `docker-compose.yaml`:
   - **Email:** `admin@admin.com`
   - **Password:** `root`

## 3. Connect pgAdmin to the PostgreSQL Database

Once logged into pgAdmin:
1. Click on **Add New Server** in the dashboard.
2. Under the **General** tab, name your server (e.g., `Local Postgres`).
3. Switch to the **Connection** tab and enter the following details:
   - **Host name/address:** `postgres` *(This is the service name from `docker-compose.yaml`)*
   - **Port:** `5432`
   - **Maintenance database:** `itec617`
   - **Username:** `user`
   - **Password:** `password`
4. Click **Save**.

You should now see the `itec617` database listed on the left panel. Navigate to **Schemas > public > Tables** to find your `Students` table. You can right-click it and select **View/Edit Data > All Rows** to see the 100 seeded records.

## 4. Stop the Environment

When you are done, you can stop the containers by running:

```bash
docker compose down
```
*(Note: Because we mapped a volume `postgres_data`, your database data will be preserved even after taking the containers down. If you ever want to wipe the data and start completely fresh, you can run `docker compose down -v` to remove the volumes as well.)*
