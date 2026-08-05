# SQL Injection Types

SQL injection (SQLi) occurs when untrusted input is interpreted as part of a SQL statement.
Attackers change the intended query structure to read, modify, or destroy data.

Attacks are commonly grouped by how the attacker delivers the payload and receives the result.

## 1. In-band SQL Injection

The attacker uses the **same communication channel** to send the payload and receive the data.
This is the most common and easiest category to demonstrate.

### Error-based

The attacker crafts input that forces the database to raise an error. If the application
returns the raw error text, that message can reveal table names, column types, or even
data values.

Example (against the vulnerable Search form):

```text
' AND 1=CAST((SELECT password FROM users WHERE username='admin') AS int)--
```

PostgreSQL will complain that it cannot cast the password string to an integer — and the
error text includes the password value.

### Union-based

The attacker appends a `UNION SELECT` so that results from a second query appear in the
same response as the legitimate query. Column count and types must align.

Against Search (which selects `username, email`):

```text
' UNION SELECT username, password FROM users--
```

The application still renders two columns, but the second column now contains **passwords**.

Auth bypass on Login is also in-band (the response channel shows "Welcome…"):

```text
username: admin'--
password: anything
```

which turns the query into:

```sql
SELECT id, username, email FROM users
WHERE username = 'admin'--' AND password = 'anything'
```

## 2. Inferential (Blind) SQL Injection

The application does **not** return query data or useful errors. The attacker infers
truth by observing behaviour after each probe.

### Boolean-based

The payload forces a true or false condition. The page content (or HTTP status) changes
accordingly. Against the Existence check endpoint:

```text
admin' AND (SELECT SUBSTRING(password,1,1) FROM users WHERE username='admin')='A'--
```

- If the response says **User found**, the first character of `admin`'s password is `A`.
- If it says **User not found**, try the next character.

Repeating this reconstructs the password one character at a time.

### Time-based

The payload asks the database to pause when a condition is true. A delayed HTTP response
proves the condition held — even when the page content never changes.

```text
admin' AND pg_sleep(5)--
```

If the response takes roughly five seconds, the injected statement executed.
Combine with a character check:

```text
admin' AND (SELECT CASE WHEN SUBSTRING(password,1,1)='A' THEN pg_sleep(5) ELSE pg_sleep(0) END FROM users WHERE username='admin')--
```

## 3. Out-of-band SQL Injection

When the attacker cannot use the same channel for the reply (no data in the page, no
useful timing, filtered errors), they coerce the database into making an **external**
request — typically DNS or HTTP — to a host they control. The stolen data is encoded in
the request (for example, as a subdomain or query string).

PostgreSQL techniques that enable OOB often require elevated privileges and are disabled
in hardened environments. Examples include:

| Technique | Idea |
|-----------|------|
| `COPY … TO PROGRAM` | Ask the server OS to run `curl`/`nslookup` with stolen data |
| `dblink` / FDW | Open a network connection from inside the database |
| Large-object / file functions | Write data somewhere the attacker can later retrieve |

This lab ships an HTTP **listener** on port `9999` so you can practise observing
exfiltration traffic. See [03-Exploitation-Walkthrough.md](03-Exploitation-Walkthrough.md)
for a safe exercise that contacts the listener from inside the Docker network.

## Summary

| Category | How results return | Lab surface |
|----------|--------------------|-------------|
| In-band (error) | Error message | Vulnerable Search |
| In-band (UNION) | Query result table | Vulnerable Search |
| Blind (boolean) | Different page text | Vulnerable Check |
| Blind (time) | Response latency | Vulnerable Check + `pg_sleep` |
| Out-of-band | External DNS/HTTP | Listener + docs exercise |
