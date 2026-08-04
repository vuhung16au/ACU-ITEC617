# Quickstart Guide

This guide provides step-by-step instructions on how to start the local log analysis environment.

## Prerequisites
* Docker and Docker Compose installed on your machine.

## Starting the Environment

1. Open your terminal and navigate to this topic's folder (`Week10/03.KQLandRealTimeAnalytics`).
2. Run the following command to start the PostgreSQL database and pgAdmin containers:
   ```bash
   make up
   ```

## Connecting to the Database via pgAdmin

1. Open your web browser and go to: [http://localhost:5050](http://localhost:5050)
2. In the pgAdmin interface, expand the **ITEC617 - Week 10 DB 03** server on the left.
3. Enter the password: `password`.
4. Navigate to **Databases** -> **itec617** -> **Schemas** -> **public** -> **Tables** to see the `SensorLogs` and `WebLogs` tables.

## Running the Log Analysis Exercises

1. Right-click on the **itec617** database and select **Query Tool**.
2. Practice writing the **SQL Equivalent** queries provided in the `README.md` to analyze the telemetry data.
3. Try modifying the `DATE_TRUNC` functions in PostgreSQL to bin the data by different time intervals (e.g., `'day'`, `'minute'`).
4. Try writing a query to find which `DeviceID` in `SensorLogs` has the highest average temperature!

## Stopping the Environment

When you are finished, stop and clean up the containers by running:
```bash
make down
```
