# Switching from MySQL to MariaDB

This project uses MySQL by default. However, since MariaDB is a fork and a drop-in replacement for MySQL, switching over is incredibly straightforward.

## How to Switch

To switch to MariaDB, you simply need to change the image definition in your `docker-compose.yaml` file.

**From MySQL:**
```yaml
  mysql:
    image: mysql:9.7.2
```

**To MariaDB:**
```yaml
  mysql:
    image: mariadb:12.3.2
```
*(You can leave the service name as `mysql` to prevent having to change other connections, or rename the service entirely to `mariadb` as demonstrated in the example file below).*

> **Note**: If you are switching databases on an environment that you have already run, you must wipe your existing database volume first because the physical database files created by MySQL cannot always be read directly by MariaDB. You would need to run `make down`, remove the volume, and run `make up` to initialize a fresh MariaDB instance.

## Example Configuration

We have provided a complete example of a MariaDB setup in the `docker-compose-mariadb.yaml` file located in the root of this project folder.

## Useful Links
- [Docker Hub - MariaDB](https://hub.docker.com/_/mariadb)
- [MariaDB Downloads](https://mariadb.org/download/)
