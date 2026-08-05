# Week 9, Topic 5: Document Databases & Schema-less API

## Overview
This topic explores the shift from highly rigid relational SQL tables to flexible Document Databases (NoSQL). It demonstrates how to handle heterogeneous data—specifically a Product Catalog—where items have wildly varying attributes (e.g., a laptop has CPU and RAM, while a shirt has size and color).

Instead of using complex Entity-Attribute-Value (EAV) models or sparsely populated wide tables in SQL, this example uses **MongoDB** to store schema-less JSON/BSON documents.

We provide a Python Web API using **FastAPI** to query the MongoDB database, showing how "Schema-on-Read" simplifies application code for certain domains.

## Structure
* `init-scripts/01-init.js`: Seeds the MongoDB database with flexible JSON product documents on startup.
* `api.py`: The Python FastAPI application that connects to MongoDB.
* `docs/`: Theoretical explanations of "Schema-on-Write" vs "Schema-on-Read".
* `docker-compose.yaml`: Configures the MongoDB container along with **Mongo Express**, a web-based UI for exploring the database.

Read the `QUICKSTART.md` for instructions on running the environment.
