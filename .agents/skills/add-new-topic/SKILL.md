---
name: add-new-topic
description: Creates a new topic example folder in the repository for a given week and topic description, automatically adhering to the ACU-ITEC617 structural guidelines.
---

# Add New Topic Skill

This skill automates the creation of a new example project folder for the ACU-ITEC617 unit.

## Inputs Required from User
When the user invokes this skill, ensure you have the following information:
1. **Week**: The week number (1-12).
2. **Topic**: A description of the topic (e.g., "Translating Business Rules into Data Model Components").

If the user does not provide both, ask them for the missing information before proceeding.

## Execution Steps

### 1. Determine Folder Name
*   Format the week number to two digits (e.g., Week 1 becomes `Week01`, Week 10 becomes `Week10`).
*   Analyze the existing contents of the `WeekXX` folder (using the `list_dir` or `run_command` tools) to determine the next available topic number. For example, if `01.Postgres-PgAdmin`, `02.FileSystem-vs-Database`, and `03.Data-Types-and-Objects` exist, the new topic number will be `04`. If the week folder does not exist, create it and start with `01`.
*   Generate a concise, short name for the topic based on the user's description. **Do not make the topic name too long.** (e.g., "Translating Business Rules into Data Model Components (Entities and Relationships)" becomes `DataModelling` or `Data-Modelling`).
*   Combine them to form the new folder path: `WeekXX/<topic number>.<TopicShortName>` (e.g., `Week01/04.DataModelling`).

### 2. Scaffold the Project Structure
You MUST adhere to the structural guidelines defined in `<root>/AGENTS.md`. Create the following files and directories within the new topic folder:

*   **`docs/`**: Create this folder and populate it with 1-2 markdown files that briefly describe the key theoretical concepts covered by the topic based on the user's prompt.
*   **`README.md`**: Create an overview file explaining the example folder and its purpose.
*   **`QUICKSTART.md`**: Create a step-by-step guide on how to start the environment (e.g. `docker compose up -d`), how to connect to pgAdmin, and how to interact with the example.
*   **`docker-compose.yaml`**: Create a `docker-compose.yaml` file using EXACTLY the following template:
    ```yaml
    version: '3.8'

    services:
      postgres:
        image: postgres:18.4
        container_name: postgres-db
        environment:
          POSTGRES_USER: user
          POSTGRES_PASSWORD: password
          POSTGRES_DB: itec617
        ports:
          - "5432:5432"
        volumes:
          - postgres_data:/var/lib/postgresql
          - ./init-scripts:/docker-entrypoint-initdb.d
        networks:
          - db-network

      pgadmin:
        image: dpage/pgadmin4
        container_name: pgadmin-web
        environment:
          PGADMIN_DEFAULT_EMAIL: admin@admin.com
          PGADMIN_DEFAULT_PASSWORD: root
        ports:
          - "5050:80"
        depends_on:
          - postgres
        networks:
          - db-network

    volumes:
      postgres_data:

    networks:
      db-network:
        driver: bridge
    ```
*   **`init-scripts/`**: Create this folder and add a SQL script (e.g., `01-init.sql`). This file must contain the SQL DDL (schema creation) and DML (sample data insertion) relevant to the topic. It will be executed automatically when the database container starts for the first time.

### 3. Finalize
Once the files are created, provide the user with a summary of the created files and clickable links to the newly created markdown files.
