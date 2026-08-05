# Why the Code Is Vulnerable — and How to Prevent SQLi

## Root cause

SQL injection happens when **data** and **code** share the same string.

Vulnerable helper (simplified from `app/database.py`):

```python
query = f"SELECT username, email FROM users WHERE username = '{username}'"
cur.execute(query)
```

If `username` is:

```text
' UNION SELECT username, password FROM users--
```

the database receives:

```sql
SELECT username, email FROM users WHERE username = ''
UNION SELECT username, password FROM users--'
```

The quote closed the string early; `UNION SELECT` became SQL **structure**, not a username.
That is why the attacker can pull passwords even though the original query never selected
the `password` column.

The secure version keeps structure and data apart:

```python
query = "SELECT username, email FROM users WHERE username = %s"
cur.execute(query, (username,))
```

Here `%s` is a placeholder. The driver sends the username as a bound parameter. Quotes,
semicolons, and `UNION` remain ordinary characters inside a value — they never alter the
statement plan.

## Other contributing mistakes in this demo

1. **Raw errors returned to the browser** — enables error-based in-band attacks.
2. **Overly informative boolean responses** — "User found" / "User not found" enables blind probing.
3. **Plaintext passwords** — makes stolen rows immediately useful (never store plaintext in production; use a slow hash such as Argon2 or bcrypt).
4. **Excessive database privileges** — a web app role that can run `COPY TO PROGRAM` or load `dblink` enables out-of-band exfiltration.

## Prevention checklist

### 1. Parameterised queries / prepared statements (primary defence)

Use placeholders for every untrusted value:

| Stack | Pattern |
|-------|---------|
| Python `psycopg` | `cur.execute("… WHERE id = %s", (user_id,))` |
| Python SQLAlchemy Core | `text("… WHERE id = :id")` with `{"id": user_id}` |
| Node `pg` | `client.query("… WHERE id = $1", [userId])` |
| Java JDBC | `PreparedStatement` with `?` placeholders |

Never build SQL with f-strings, `+`, or `.format()` for user input.

### 2. Libraries and wrappers

- Prefer a well-tested driver API (parameter binding) over hand-rolled string builders.
- ORMs (SQLAlchemy, Django ORM, Prisma) parameterise by default **when you use their
  query APIs**. Raw SQL escape hatches (`text()`, `raw()`, `$queryRaw`) are still dangerous
  if you concatenate.
- Query builders (e.g. SQLAlchemy Core, Knex) also bind parameters when used correctly.

### 3. Least privilege

Connect the application as a database role that can only `SELECT`/`INSERT`/`UPDATE`/`DELETE`
on the tables it needs. Deny superuser, `COPY PROGRAM`, file access, and unused extensions.

### 4. Input handling (defence in depth — not a substitute)

Allow-lists for known-safe shapes (e.g. numeric IDs) help, but **escaping alone is fragile**.
Parameter binding is the reliable fix.

### 5. Error handling and observability

- Return generic errors to clients; log details server-side.
- Alert on anomalous query shapes and sudden latency (possible time-based blind probes).

### 6. Secure password storage

Even if a `SELECT` leaks rows, salted slow hashes limit reuse of stolen credentials.

## Quick comparison in this project

| Endpoint family | Construction | Injection works? |
|-----------------|--------------|------------------|
| `/vulnerable/*` | String concatenation | Yes — by design |
| `/secure/*` | `%s` placeholders | No — payloads are literal data |

Read the side-by-side implementations in `app/database.py` and try the same payload on both
forms in the web UI.
