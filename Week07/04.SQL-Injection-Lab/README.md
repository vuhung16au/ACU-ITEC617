# Week 07, Topic 04: SQL Injection Security Lab

## Overview
This lab provides a safe environment to experience SQL injection firsthand. You will manipulate a vulnerable SQL query to bypass authentication and learn how parameterized queries protect against such attacks.

## Learning Objectives
*   Understand how SQL injection works by exploiting a `WHERE` clause vulnerability.
*   Recognize the danger of building SQL queries using string concatenation.
*   Learn how parameterized queries (prepared statements) prevent SQL injection in application code.

## Lab Scenarios (Challenge)

In this lab, imagine an application that builds a login query like this:
```sql
SELECT * FROM Users WHERE Username = '[username_input]' AND Password = '[password_input]';
```

**Task 1: Normal Login**
Write the query as if a user successfully logged in with the username `john_doe` and password `password123`.

**Task 2: SQL Injection (Bypass Authentication)**
Assume you don't know the password for the `admin` user. Replace `[username_input]` and `[password_input]` with a malicious string such as `admin' OR '1'='1` to successfully bypass the `WHERE` clause. 

**Task 3: Reflection**
Review `docs/Injection-Explanation.md` to see examples of how to rewrite this vulnerable query using proper parameterized syntax in Python, C#, and Java.
