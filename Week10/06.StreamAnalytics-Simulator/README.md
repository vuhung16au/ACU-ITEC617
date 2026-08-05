# Week 10, Topic 6: Modern Data Pipelines

## Overview
This topic demystifies the difference between traditional "Batch Processing" (loading a static CSV file once a night) and modern "Stream Processing" (analyzing live data as it arrives). 

You are provided with a Python script (`sensor_simulator.py`) that acts as an IoT Smart Device, generating an infinite, continuous stream of temperature telemetry in JSON format. 

You are also provided with a guide (`docs/Azure-Guide.md`) explaining how a cloud service like **Azure Stream Analytics** would ingest this never-ending stream, apply real-time temporal logic (e.g., "average the temperature over a 10-second tumbling window"), and sink the aggregated results into a database.

## Structure
* `sensor_simulator.py`: An infinite loop generating simulated JSON IoT data.
* `docs/`: Guides explaining Stream Processing vs Batch Processing, and the architecture of Azure Stream Analytics.
* `init-scripts/01-init.sql`: Creates the destination (sink) database table that a Stream Analytics job would write its aggregated results to.
* `docker-compose.yaml`: A PostgreSQL environment to simulate the "Data Sink" of a modern pipeline.

Read the `QUICKSTART.md` for instructions on running the simulator.
