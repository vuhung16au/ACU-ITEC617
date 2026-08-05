# Quickstart Guide

This tutorial includes a standalone Python script that normalises CSV data into an SQLite database, as well as a standard PostgreSQL environment for SQL practice.

## Part 1: Running the Python Normalisation Utility

1. Ensure you have Python installed on your system.
2. Open your terminal and navigate to this directory (`Week03/05.Normalisation-in-Code/`).
3. Run the script:
   ```bash
   python3 normalise.py
   ```
4. Observe the console output. The script will:
   * Read the redundant data from `data.csv`.
   * Create normalized tables in a local `university.db` SQLite file.
   * Filter and map the unique Entities (Students, Instructors, Courses, Enrollments).
   * Verify the data by performing a relational JOIN that rebuilds the flat data without duplication.

## Part 2: (Optional) Using PostgreSQL and pgAdmin

If you wish to practice querying the unnormalised data using standard PostgreSQL:

1. In the same terminal, start the Docker environment:
   ```bash
   make up
   ```
2. Open your web browser and navigate to http://localhost:5050.
3. On the left side, under **Servers**, expand **ITEC617 - Week 03 DB**.
4. When prompted for a password, enter `password`.
5. Open **Tools → Query Tool** to write SQL queries against the pre-loaded `UnnormalisedData` table.
6. When finished, bring the environment down:
   ```bash
   make down
   ```
