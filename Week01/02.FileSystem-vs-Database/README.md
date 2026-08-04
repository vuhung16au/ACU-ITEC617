# Week 01: File System vs Database

This example demonstrates the problems associated with storing data in flat files (like CSVs or Spreadsheets) compared to relational databases. It highlights the concepts of redundancy, data anomalies, and how Primary and Foreign Keys resolve these issues.

## Folder Structure

*   `docs/`: Contains explanations of the theoretical concepts (Anomalies and Keys).
*   `init-scripts/`: Contains the SQL script that creates both a "flat" representation of data and a "normalized" (relational) representation of the same data.
*   `docker-compose.yaml`: Runs the PostgreSQL database and pgAdmin interface.
*   `QUICKSTART.md`: Instructions on how to run the example.
