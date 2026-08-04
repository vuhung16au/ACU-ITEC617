# Quickstart Guide

This guide explains how to spin up the Big Data environment and run the PySpark demo script.

## Prerequisites
* Docker and Docker Compose installed on your machine.

## Starting the Environment

1. Open your terminal and navigate to this folder (`Week10/05.BigDataEnrichmentDemo`).
2. Start the PostgreSQL and Jupyter/Spark containers by running:
   ```bash
   make up
   ```
   *(Note: The Jupyter Spark image is quite large and may take a few minutes to download the first time).*

## Accessing Jupyter Lab and Spark

1. Open your web browser and navigate to: **[http://localhost:8888](http://localhost:8888)**
2. You will be prompted for a password. Enter: `password`
3. You are now inside the Jupyter Lab environment, running on top of Apache Spark!

## Running the Demo

1. In the file browser on the left of Jupyter Lab, double-click the `work` folder. This is mounted to your local `workspace` directory.
2. Double-click the `spark_demo.py` file to view the Python code.
3. To run it, you can either:
   * Open a **Terminal** inside Jupyter (File -> New -> Terminal), navigate to the folder (`cd work`), and run: `python spark_demo.py`
   * **OR** create a new Jupyter Notebook (`.ipynb`), copy the contents of `spark_demo.py` into a cell, and press `Shift + Enter` to run it interactively!

When the script runs, it will:
1. Connect to PostgreSQL and extract the raw data.
2. Transform the data in Spark.
3. Write a highly-optimized `.parquet` file to the `analytical_store/` directory.

## Stopping the Environment

When you are finished, stop and clean up the containers by running:
```bash
make down
```
