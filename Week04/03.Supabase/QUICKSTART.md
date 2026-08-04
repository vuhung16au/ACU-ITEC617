# Quickstart Guide

## Part 1: Supabase CLI Lab (Recommended)

Follow these steps to use the Supabase CLI to create a local Supabase stack.

1. **Install Supabase CLI**
   ```bash
   npm install -g supabase
   # Or using Homebrew (macOS)
   # brew install supabase/tap/supabase
   ```

2. **Login to Supabase**
   ```bash
   supabase login
   ```

3. **Initialize a local project**
   ```bash
   mkdir company-database-lab
   cd company-database-lab
   supabase init
   ```

4. **Start local Supabase stack**
   ```bash
   supabase start
   ```
   *This outputs connection credentials including API URL, Database URL, anon key, and service_role key.*

5. **Link to cloud project (optional)**
   ```bash
   supabase link --project-ref <your-project-id>
   ```

### Using Supabase Studio
Once the local stack is running, you can access Supabase Studio via the URL provided in the terminal to execute SQL and test RLS policies.

---

## Part 2: Local Sandbox Environment (Alternative)

If you just want to practice the SQL and RLS queries without installing the Supabase CLI, a standard PostgreSQL environment is provided.

### 1. Start the Environment
Run the following command to bring up the local PostgreSQL database and pgAdmin:
```bash
make up
```

### 2. Access pgAdmin
1. Open your browser and navigate to `http://localhost:5050`.
   *(There is no email/password login screen for pgAdmin!)*
2. On the left side, under **Servers**, expand the pre-loaded server: **ITEC617 - Week 04 DB**.
3. When prompted, enter the database password: `password`.
4. Right-click the `itec617` database and select **Query Tool** to start practicing SQL.

### 3. Stop the Environment
When you are finished, stop the environment by running:
```bash
make down
```
