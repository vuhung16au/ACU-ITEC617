# Understanding SQL Injection

SQL Injection (SQLi) is a code injection technique where malicious SQL statements are inserted into entry fields for execution.

## The Vulnerability: String Concatenation
When applications build SQL queries by directly combining strings (concatenation) with user input, they are vulnerable to SQL injection.

**Vulnerable Example:**
```sql
SELECT * FROM Users 
WHERE Username = '[user_input]' AND Password = '[password_input]'
```

If a user inputs `admin' OR '1'='1` for both the username and password, the resulting query executed by the database becomes:

```sql
SELECT * FROM Users 
WHERE Username = 'admin' OR '1'='1' AND Password = 'admin' OR '1'='1'
```
Because `'1'='1'` is always true, the `WHERE` clause evaluates to true for the entire table. The query returns all users, often logging the attacker in as the first user returned (usually the administrator).

## The Solution: Parameterized Queries
Parameterized queries (or prepared statements) solve this problem. Instead of concatenating strings, the database engine compiles the SQL statement with placeholders, and the user input is treated strictly as data (not executable code).

**Python (psycopg2) Example:**
```python
# SECURE: Using parameterized queries
cursor.execute("SELECT * FROM Users WHERE Username = %s AND Password = %s", (username_input, password_input))
```

**C# (ADO.NET) Example:**
```csharp
// SECURE: Using parameterized queries
SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE Username = @username AND Password = @password", conn);
cmd.Parameters.AddWithValue("@username", usernameInput);
cmd.Parameters.AddWithValue("@password", passwordInput);
```

**Java (JDBC) Example:**
```java
// SECURE: Using prepared statements
PreparedStatement pstmt = con.prepareStatement("SELECT * FROM Users WHERE Username = ? AND Password = ?");
pstmt.setString(1, usernameInput);
pstmt.setString(2, passwordInput);
```

By using parameters, if an attacker enters `admin' OR '1'='1`, the database searches for a literal username matching that exact, weird string, preventing the injection.
