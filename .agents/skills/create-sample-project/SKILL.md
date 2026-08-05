---
name: create-sample-project
description: Creates a new sample project in the repository based on a project number and learning objective, automatically adhering to the ACU-ITEC617 structural guidelines. It scaffolds the database, mock data, backend/frontend, and dockerizes the environment.
---

# Create New Sample Project Skill

This skill automates the creation of a new, standalone example project for the ACU-ITEC617 unit. These projects are intended for Master of Computer Science students to learn database concepts (e.g., using RAW SQL, integrating with a web browser, etc.).

## Inputs Required from User

When the user invokes this skill, ensure you have the following information:
1. **Project Number**: The numeric prefix for the project folder (e.g., `01`, `02`). If the user does not provide one, you should analyze the root directory to find the next available project number, or default to `01` if none exist.
2. **Objective (Learning Outcome)**: A description of what the project will showcase (e.g., "how to use RAW SQL, querying a sqlite database and show it on a web browser").

If the user does not provide the objective, ask them for the missing information before proceeding.

## Tech Stack Preferences

When scaffolding the project environment, prioritize the following technologies:
*   **Databases**:
    *   **PostgreSQL**: Prefer when using a relational db.
    *   **SQLite**: Prefer for very simple DB setups.
    *   **MongoDB**: Prefer for a NoSQL database.
*   **Caching**: Redis (mention and utilize as a caching layer where applicable).
*   **Web Applications**: We favor web applications such as Next.js (Node.js) or Django (Python).
*   **Interactive Data Apps**: We also may use [Streamlit](https://streamlit.io/) (mainly for local deployment but ready to deploy to the cloud).
*   **Backend (Python)**: Favor FastAPI for pure backend APIs, or Django for full-stack apps.
*   **Python Package Management**: Prefer using `uv` (and `pyproject.toml`).
*   **ORM**: 
    *   For Next.js projects, use **Prisma**.
    *   For Python projects, use **Django ORM** (if using Django).
*   **Frontend**: Use **Tailwind CSS 4**.
*   **Infrastructure**: Docker (using Docker Compose to spin up the database, web app, Redis, etc.).

## Execution Steps

### 1. Determine Folder Name

*   Generate a concise, short name for the project based on the user's objective. (e.g., "querying a sqlite database and show it on a web browser" becomes `Sqlite-RawQuery` or `Sqlite-WebBrowser`).
*   Combine the project number and short name to form the new folder path at the root of the workspace: `<Project Number>.<ProjectShortName>` (e.g., `01.Sqlite-RawQuery`).

### 2. Scaffold the Project Structure

You MUST adhere to the structural guidelines defined in `<root>/AGENTS.md` and keep the project simple, educational, and engaging. Make sure to provide comprehensive documentation and comments (inline or files).

Create the following files and directories within the new project folder:

*   **`docs/`**: Create this folder and populate it with 1-2 markdown files that briefly describe the key theoretical concepts covered in the example.
*   **`README.md`**: An overview of the example folder, its purpose, and the learning outcomes.
*   **`QUICKSTART.md`**: Step-by-step instructions on how to run, connect to, and interact with the example. **Important:** Always include documentation on how to access and use the database Web UI.
*   **`docker-compose.yaml`**: Must be used to define the environment. 
    *   **Web UI**: When spinning up a database, ALWAYS provide a Web UI service alongside it (e.g., `postgres` + `pgadmin`, `mongodb` + `mongo-express`).
    *   **Container Names**: Container names MUST be unique across the repository to prevent conflicts. Always add `<Project Number>-<ProjectShortName>` as a suffix to all `container_name` fields (e.g., `postgres-db-01-Sqlite-RawQuery`).
*   **`Makefile`**: Create a `Makefile` to manage the project lifecycle. It MUST include:
    *   `make up`: to bring up the Docker containers (e.g., `docker compose up -d`).
    *   `make down`: to bring down the Docker containers (e.g., `docker compose down`).
    *   `make test` or `make e2e`: to run the minimum e2e tests.
    *   *If Next.js*: Implement `make deploy` (alias to `make deploy-vercel`) to easily deploy the project on Vercel. Make sure the Next.js setup is Vercel-friendly.
*   **`init-scripts/`**: SQL/NoSQL scripts with DDL and DML that automatically run on database startup. **Always initialize the database with synthetic sample/mock data.**
*   **Tests**: Implement minimum end-to-end (e2e) tests to verify the core functionality.
*   **`.gitignore`**: Check and update `<root>/.gitignore` if needed (e.g., to ignore `node_modules`, `__pycache__`, `.env`, etc.).

### 3. Application Code Guidelines

*   **Engaging & Educational**: Structure the code so that it clearly illustrates the learning outcome (e.g., separating the database connection logic from the routing logic).
*   **Keep It Simple**: Avoid overly complex frameworks or design patterns unless they are the focus of the objective. For instance, if demonstrating RAW SQL, don't use an ORM.

### 4. Verification

*   Once the files are created, you MUST verify that everything works fine and is in place.
*   Run `make up` to ensure the environment starts correctly.
*   Run `make test` or `make e2e` to ensure the end-to-end tests pass.
*   Bring down the environment with `make down`.

### 5. Finalize

Once verified, provide the user with a summary of the created project structure, the test results, and clickable links to the newly created markdown files (`README.md` and `QUICKSTART.md`).
