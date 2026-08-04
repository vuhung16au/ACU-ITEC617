# Quickstart Guide

## Part 1: Manual Docker Lab (Recommended for the Exercise)

In this lab, you simulate cloud provisioning using direct Docker commands.

1. **Pull MariaDB image**
   ```bash
   docker pull mariadb:latest
   ```

2. **Create a MariaDB container (simulating Azure provisioning)**
   ```bash
   docker run --name student-mariadb \
     -e MYSQL_ROOT_PASSWORD=SecureRootPass123! \
     -e MYSQL_DATABASE=companydb \
     -e MYSQL_USER=dbadmin \
     -e MYSQL_PASSWORD=AdminPass456! \
     -p 3306:3306 \
     -d mariadb:latest
   ```

3. **Verify container is running**
   ```bash
   docker ps
   ```

4. **Connect to the database**
   ```bash
   docker exec -it student-mariadb mysql -u dbadmin -p
   ```
   *(Enter `AdminPass456!` when prompted)*

### Cleanup
When finished with the manual exercise, be sure to clean up the container:
```bash
docker stop student-mariadb && docker rm student-mariadb
```

---

## Part 2: Local Docker Compose Environment (Alternative)

If you prefer to start the entire environment with a single command (which also includes a web UI for the database), use the provided Docker Compose configuration.

### 1. Start the Environment
Run the following command:
```bash
make up
```

### 2. Access Adminer (Web UI)
1. Open your browser and navigate to `http://localhost:5050`.
2. Select **System**: `MySQL`
3. Enter **Server**: `mariadb`
4. Enter **Username**: `root`
5. Enter **Password**: `SecureRootPass123!`
6. Enter **Database**: `companydb`
7. Click **Login** and you can now practice your SQL queries!

### 3. Stop the Environment
When you are finished, stop the environment by running:
```bash
make down
```
