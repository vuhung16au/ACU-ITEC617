# Quickstart Guide

Follow these steps to run and interact with the MySQL environment.

## 1. Start the Environment

Open your terminal in this folder and run:

```bash
make up
```

This command uses `docker compose` to download and start both the MySQL database and Adminer in the background.

## 2. Access the Database via Web UI

1. Open your web browser and click this exact link to pre-fill the correct details: [http://localhost:5050/?server=mysql&username=root&db=itec617](http://localhost:5050/?server=mysql&username=root&db=itec617)
2. You will see the Adminer login screen.
3. Ensure the following credentials are used:
   - **System**: MySQL
   - **Server**: `mysql` *(Important: Do not use the long container name here)*
   - **Username**: `root` (or `user`)
   - **Password**: `root` (or `password` if using user)
   - **Database**: `itec617`
4. Click **Login**.

You can now explore the `students` table that was automatically created and populated by the init script.

## 3. Stop the Environment

When you are finished, you can stop the containers by running:

```bash
make down
```
