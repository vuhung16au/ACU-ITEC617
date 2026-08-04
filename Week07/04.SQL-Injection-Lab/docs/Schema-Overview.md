# SQL Injection Security Lab Schema Overview

This lab uses a simplified `Users` table to simulate a login process and demonstrate SQL injection vulnerabilities.

## Tables

### 1. Users
Stores user credentials for a simulated application.
*   **UserID**: Primary Key.
*   **Username**: The user's login name.
*   **Password**: The user's password (stored in plaintext for this demonstration, though real systems should use hashing).
*   **Role**: The role of the user (e.g., 'Admin', 'User').
