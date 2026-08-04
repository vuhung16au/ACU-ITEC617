# Agent Guidelines for ACU-ITEC617

When creating new example projects or folders in this repository (e.g., `WeekXX/<topic number>.<topic name>`), you MUST adhere to the following structure and components:

1.  **`docs/` folder**: Must contain files that briefly describe the key theoretical concepts covered in the example.
2.  **`README.md`**: An overview of the example folder and its purpose.
3.  **`QUICKSTART.md`**: Step-by-step instructions on how to run, connect to, and interact with the example.
4.  **`docker-compose.yaml`**: Must be used to define the environment (typically using PostgreSQL and any necessary tools like pgAdmin).
5.  **`init-scripts/` folder**: Must contain SQL scripts (e.g., `01-init.sql`) with DDL (schema) and sample data (DML) that will automatically run when the database container starts for the first time.
