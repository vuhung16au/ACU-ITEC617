# Quickstart

Follow these instructions to get the PostgreSQL database and Next.js web application running locally.

## 1. Start the Database

From the root of this project folder (`04.Postgres-Prisma-Nextjs`), run:
```bash
make up
```

This command uses Docker Compose to start two containers:
- **PostgreSQL Database** on port `5432`
- **pgAdmin (Web UI)** on port `5050`

During startup, the database is automatically seeded with sample data using the script in `init-scripts/01-init.sql`.

## 2. Connect to the Database using pgAdmin

1. Open your browser and go to: http://localhost:5050
2. Login with:
   - Email: `admin@admin.com`
   - Password: `root`
3. Add a new server connection:
   - **Name**: `Local Postgres`
   - **Host name/address**: `postgres` (or `host.docker.internal` / `localhost` if connecting from outside)
   - **Port**: `5432`
   - **Maintenance database**: `appdb`
   - **Username**: `user`
   - **Password**: `password`

## 3. Run the Next.js Web App

Navigate to the `webapp` directory:
```bash
cd webapp
```

Configure your environment variables by creating a `.env` file (if not created already) based on `.env.example`:
```bash
# In webapp/.env
DATABASE_URL="postgresql://user:password@localhost:5432/appdb?schema=public"
```

Install dependencies and generate the Prisma Client:
```bash
npm install
npx prisma generate
```

Start the development server:
```bash
npm run dev
```

Open http://localhost:3000 in your browser to see the dashboard fetching data via Prisma.

## 4. Teardown

To stop and remove the Docker containers, run:
```bash
make down
```
