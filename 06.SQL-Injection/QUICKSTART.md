# Quick start — 06.SQL-Injection

## Prerequisites

- Docker and Docker Compose
- `make`

## 1. Start the stack

```bash
cd 06.SQL-Injection
make up
```

Wait about 10–15 seconds for Postgres to initialise and the web app to become ready.

## 2. Open the services

| Service | URL | Credentials |
|---------|-----|-------------|
| Vulnerable / secure web UI | [http://localhost:8000](http://localhost:8000) | — |
| pgAdmin | [http://localhost:5050](http://localhost:5050) | `admin@admin.com` / `admin` |
| OOB listener | [http://localhost:9999](http://localhost:9999) | — |
| Postgres | `localhost:5432` | user `postgres`, password `postgres`, database `sqli_demo` |

### Connect pgAdmin to Postgres

1. Open pgAdmin and log in with the credentials above.
2. Right-click **Servers** → **Register** → **Server**.
3. **General** tab: Name = `SQLi Demo`.
4. **Connection** tab:
   - Host: `db` (the Docker Compose service name; use `host.docker.internal` or `postgres-db-06-SQL-Injection` if needed from some setups — from the pgAdmin container, use **`db`**)
   - Port: `5432`
   - Maintenance database: `sqli_demo`
   - Username: `postgres`
   - Password: `postgres`
5. Save, then browse **Databases → sqli_demo → Schemas → public → Tables → users**.

## 3. Steal a password (happy-path demo)

1. Open [http://localhost:8000](http://localhost:8000).
2. Under **Vulnerable → Search user**, enter:

   ```text
   ' UNION SELECT username, password FROM users--
   ```

3. Submit. The result table lists usernames with **passwords** in the second column.
4. Repeat the payload under **Secure → Search** and confirm it does not leak data.

More attacks (error-based, blind, OOB) are documented in
[docs/03-Exploitation-Walkthrough.md](docs/03-Exploitation-Walkthrough.md).

## 4. Run tests

```bash
make test
```

Tests verify health, legitimate login/search, successful UNION password extraction on the
vulnerable path, and rejection of the same payload on the secure path.

## 5. Inspect logs (optional)

```bash
make logs
# or only the OOB listener:
docker compose logs -f listener
```

## 6. Tear down

```bash
make down
```

This stops containers and removes the Postgres volume so the next `make up` reseeds clean data.

## Further reading

- [docs/01-SQL-Injection-Types.md](docs/01-SQL-Injection-Types.md)
- [docs/02-Why-Vulnerable-And-Prevention.md](docs/02-Why-Vulnerable-And-Prevention.md)
- [docs/03-Exploitation-Walkthrough.md](docs/03-Exploitation-Walkthrough.md)
