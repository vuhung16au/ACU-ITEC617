# Quickstart Guide

## Azure CLI Practice
Follow the labs described in the module to provision databases using the Azure CLI:
```bash
az postgres server create --resource-group <group> --name <name>
az sql db create --resource-group <group> --name <name>
az mysql server create --resource-group <group> --name <name>
```

## Local Sandbox Environment

If you'd like to practice the SQL commands locally before running them against Azure databases, you can use the provided Docker environment.

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

### Bonus Challenge
Try connecting to your Azure provisioned databases using pgAdmin by adding a new server connection using the credentials provided by the Azure CLI.
