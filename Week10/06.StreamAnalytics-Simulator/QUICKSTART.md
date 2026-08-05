# Quickstart Guide

This tutorial provides a Python IoT sensor simulator and a PostgreSQL "Sink" database.

## Part 1: Start the Destination Database (The Sink)

In a real Azure architecture, Stream Analytics processes incoming streams and outputs the processed data to a persistent store (a "Sink"), like Azure SQL. We simulate that Sink using PostgreSQL.

1. Open your terminal and navigate to this directory (`Week10/06.StreamAnalytics-Simulator/`).
2. Start the Docker environment:
   ```bash
   make up
   ```
3. (Optional) Open pgAdmin at http://localhost:5050 (Password: `password`) to view the `ProcessedTelemetry_Averages` table, which represents the final output of a data pipeline.

## Part 2: Start the IoT Sensor (The Source)

1. Ensure you have Python installed. No external packages are required for the simulator.
2. Run the simulator to start the infinite telemetry stream:
   ```bash
   python3 sensor_simulator.py
   ```
3. Watch the continuous JSON output. This represents raw, high-velocity data ("Big Data" velocity) that is too fast to write directly to a traditional relational database without processing first.
4. Press `Ctrl+C` to stop the simulator.

## Part 3: Read the Theory
After observing the high-speed JSON stream, read `docs/Azure-Guide.md` to understand how Azure Stream Analytics handles this data in the real world.

## Cleanup
When finished, stop the database:
```bash
make down
```
