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

*   **`docs/`**: Create this folder and populate it with 1-2 markdown files that briefly describe the key theoretical concepts covered by the topic based on the user's prompt. There is a file named `Schema-Overview.md` under `docs/` folder to describe all the tables (with fields) briefly.
*   **`README.md`**: Create an overview file explaining the example folder and its purpose.
*   **`QUICKSTART.md`**: Create a step-by-step guide on how to start the environment with `make up` (and stop with `make down`), how to open pgAdmin at `localhost:5050`, and how to interact with the example. Document the **seamless student flow**:
    1. Go to `http://localhost:5050` — there is **no** pgAdmin email/password login screen.
    2. On the left, under **Servers**, expand the pre-loaded server (e.g. `ITEC617 - Week XX DB`).
    3. When prompted, enter the database password only (e.g. `password`) once per session.
    4. Open **Tools → Query Tool** to practice SQL.
*   **`Makefile`**: Create a `Makefile` in the topic folder with these targets (use EXACTLY this template):
    ```makefile
    .PHONY: up down

    up:
    	docker compose up -d

    down:
    	docker compose down
    ```
    - `make up` — bring up the Docker Compose stack (detached).
    - `make down` — bring down the Docker Compose stack.
*   **`docker-compose.yaml`**: Create a `docker-compose.yaml` file using EXACTLY the following template (replace placeholders for week, topic number, and topic name):
    ```yaml
    version: '3.8'

    services:
      postgres:
        image: postgres:18.4
        # Naming convention: postgres-db-<WeekXX>-<topic number>-<topic name>
        container_name: postgres-db-<WeekXX>-<topic number>-<topic name>
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
        image: dpage/pgadmin4:9.17
        # Naming convention: pgadmin-web-<WeekXX>-<topic number>-<topic name>
        container_name: pgadmin-web-<WeekXX>-<topic number>-<topic name>
        environment:
          PGADMIN_DEFAULT_EMAIL: admin@admin.com
          PGADMIN_DEFAULT_PASSWORD: root
          # Bypasses the email/password login screen entirely (desktop/single-user mode)
          PGADMIN_CONFIG_SERVER_MODE: 'False'
          # Disables the Master Password popup
          PGADMIN_CONFIG_MASTER_PASSWORD_REQUIRED: 'False'
        ports:
          - "5050:80"
        volumes:
          # Auto-loads the Postgres connection so students do not "Add New Server"
          - ./servers.json:/pgadmin4/servers.json
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
*   **`servers.json`**: Create this file in the **same folder** as `docker-compose.yaml`. It pre-registers the Postgres connection in pgAdmin. Replace the week number in `Name` as appropriate. Ensure `"Host"` matches the Postgres **`container_name`** in docker-compose (e.g. `postgres-db-W01-01-postgres-pgadmin`) — **not** the service key `postgres`:
    ```json
    {
      "Servers": {
        "1": {
          "Name": "ITEC617 - Week XX DB",
          "Group": "Servers",
          "Host": "postgres-db-<WeekXX>-<topic number>-<topic name>",
          "Port": 5432,
          "MaintenanceDB": "itec617",
          "Username": "user",
          "SSLMode": "prefer"
        }
      }
    }
    ```
    **Why students still type the DB password once:** pgAdmin strips passwords from `servers.json` for security. Removing the web login, master-password popup, and manual server setup still removes most of the friction.
*   **`init-scripts/`**: Create this folder and add a SQL script (e.g., `01-init.sql`). This file must contain the SQL DDL (schema creation) and DML (sample data insertion) relevant to the topic. It will be executed automatically when the database container starts for the first time.

### 3. Student UX goals (pgAdmin)
Always configure new topics so that:
1. **No pgAdmin web login** — `PGADMIN_CONFIG_SERVER_MODE: 'False'` runs desktop/single-user mode.
2. **No Master Password popup** — `PGADMIN_CONFIG_MASTER_PASSWORD_REQUIRED: 'False'`.
3. **Pre-loaded DB connection** — mount `./servers.json` to `/pgadmin4/servers.json`.

Students go to `localhost:5050`, open the pre-loaded server, type the database password once, and are ready to use the Query Tool.

### 4. Optional alternative: Adminer (simpler SQL UI)
If the user explicitly asks for a lighter client instead of (or in addition to) pgAdmin, you may use **Adminer**. Students go to `localhost:5050`, type the server name (`postgres`) and password on one simple screen, then get an easy SQL query box. Example service block (no `servers.json` needed):

```yaml
  adminer:
    image: adminer:latest
    # Naming convention: adminer-web-<WeekXX>-<topic number>-<topic name>
    container_name: adminer-web-<WeekXX>-<topic number>-<topic name>
    ports:
      - "5050:8080"
    environment:
      ADMINER_DEFAULT_SERVER: postgres
    depends_on:
      - postgres
    networks:
      - db-network
```

**Default for new topics remains pgAdmin** with the seamless setup above, unless the user requests Adminer.

### 5. Finalize
Once the files are created, provide the user with a summary of the created files and clickable links to the newly created markdown files.
