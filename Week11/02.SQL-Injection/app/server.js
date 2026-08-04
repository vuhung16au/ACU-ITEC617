const express = require('express');
const bodyParser = require('body-parser');
const { Pool } = require('pg');
const path = require('path');

const app = express();
const port = 3000;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));

// Database connection
const pool = new Pool({
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'user',
  password: process.env.DB_PASSWORD || 'password',
  database: process.env.DB_NAME || 'itec617',
  port: process.env.DB_PORT || 5432,
});

// Serve the login page
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// VULNERABLE ENDPOINT: Uses string concatenation
app.post('/login-vulnerable', async (req, res) => {
  const { username, password } = req.body;
  
  // WARNING: Intentional SQL Injection vulnerability!
  const query = `SELECT * FROM app.users WHERE username = '${username}' AND password = '${password}'`;
  
  try {
    console.log(`[VULNERABLE] Executing: ${query}`);
    const result = await pool.query(query);
    
    if (result.rows.length > 0) {
      res.send(`<h1>Login Successful (Vulnerable Endpoint)!</h1><p>Welcome, ${result.rows[0].username} (Role: ${result.rows[0].role}).</p><br><p><strong>Query executed:</strong> <code>${query}</code></p><br><a href="/">Go back</a>`);
    } else {
      res.send(`<h1>Login Failed</h1><p>Invalid username or password.</p><br><a href="/">Go back</a>`);
    }
  } catch (err) {
    res.status(500).send(`<h1>Database Error</h1><p>${err.message}</p><br><p><strong>Query executed:</strong> <code>${query}</code></p><br><a href="/">Go back</a>`);
  }
});

// SECURE ENDPOINT: Uses parameterized queries
app.post('/login-secure', async (req, res) => {
  const { username, password } = req.body;
  
  // SAFE: Parameterized query prevents injection
  const query = 'SELECT * FROM app.users WHERE username = $1 AND password = $2';
  const values = [username, password];
  
  try {
    console.log(`[SECURE] Executing: ${query} with values: [${values}]`);
    const result = await pool.query(query, values);
    
    if (result.rows.length > 0) {
      res.send(`<h1>Login Successful (Secure Endpoint)!</h1><p>Welcome, ${result.rows[0].username} (Role: ${result.rows[0].role}).</p><br><a href="/">Go back</a>`);
    } else {
      res.send(`<h1>Login Failed</h1><p>Invalid username or password.</p><br><a href="/">Go back</a>`);
    }
  } catch (err) {
    res.status(500).send(`<h1>Database Error</h1><p>${err.message}</p><br><a href="/">Go back</a>`);
  }
});

// ANOTHER VULNERABLE ENDPOINT: Multi-query / Stacked queries
app.post('/search-user', async (req, res) => {
    const { username } = req.body;
    
    // WARNING: Allows stacked queries / returning multiple record sets
    const query = `SELECT id, username, role FROM app.users WHERE username = '${username}'`;
    
    try {
      const result = await pool.query(query);
      // In pg, if multiple queries are executed (e.g. SELECT ...; SELECT ...), result is an array
      const rows = Array.isArray(result) ? result[result.length - 1].rows : result.rows;
      
      let html = `<h1>Search Results</h1><p><strong>Query executed:</strong> <code>${query}</code></p><table border="1"><tr><th>ID</th><th>Username</th><th>Role</th></tr>`;
      rows.forEach(r => {
          html += `<tr><td>${r.id}</td><td>${r.username}</td><td>${r.role}</td></tr>`;
      });
      html += `</table><br><a href="/">Go back</a>`;
      res.send(html);
    } catch (err) {
      res.status(500).send(`<h1>Database Error</h1><p>${err.message}</p><br><p><strong>Query executed:</strong> <code>${query}</code></p><br><a href="/">Go back</a>`);
    }
});

app.listen(port, () => {
  console.log(`Vulnerable web app listening at http://localhost:${port}`);
});
