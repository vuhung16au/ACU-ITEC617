# Week 3, Topic 5: Normalisation in Code

## Overview
This example demonstrates the practical application of database normalisation using a Python console utility. It bridges the gap between theoretical database design and practical data engineering.

You are provided with a flat, redundant CSV file (`data.csv`) that resembles typical messy spreadsheet data. The provided Python script (`normalise.py`) programmatically ingests this flat file, applies normalization logic (1NF, 2NF, 3NF), and inserts the separated entities into a local relational SQLite database (`university.db`).

## Why this helps
Students see the mathematical concept of normalisation translated into executable code that actively "cleanses" data. Instead of just drawing ER diagrams, you'll witness how data pipelines separate entities to eliminate anomalies.

## Structure
* `data.csv`: The raw, unnormalised dataset.
* `normalise.py`: The Python utility that performs the normalisation logic.
* `docs/`: Theoretical explanations of the normalisation process and the schema structure.
* Docker files (`docker-compose.yaml`, `init-scripts/`, `servers.json`): A supplemental PostgreSQL environment for practice, matching the standard ACU-ITEC617 setup.

Please read the `QUICKSTART.md` for instructions on running the Python script and using the database environment.
