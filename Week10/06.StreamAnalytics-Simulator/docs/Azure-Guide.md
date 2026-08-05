# Azure Stream Analytics Guide

Azure Stream Analytics is a fully managed, real-time analytics engine designed to process high volumes of fast-moving streaming data from sources like IoT devices.

If we were to deploy our `sensor_simulator.py` into a real Azure environment, the architecture would look like this:

## 1. The Source (Ingestion)
The Python simulator would send its JSON output directly to an **Azure IoT Hub** or **Azure Event Hub**. These services act as massive shock absorbers, capable of catching millions of JSON messages per second without dropping any data.

## 2. The Processor (Stream Analytics)
Azure Stream Analytics connects to the Event Hub and runs continuous SQL-like queries on the data *in motion*. 

To handle the infinite stream of temperatures, we write a **Temporal Query** using a "Tumbling Window".

```sql
-- This Azure Stream Analytics SQL query processes the live stream
SELECT
    deviceId AS DeviceID,
    System.Timestamp() AS WindowEndTime,
    AVG(temperature_celsius) AS AverageTemperature,
    CASE 
        WHEN AVG(temperature_celsius) > 40.0 THEN 1 
        ELSE 0 
    END AS AlertTriggered
INTO
    [MyPostgresDatabaseSink]
FROM
    [MyIoTHubInput] TIMESTAMP BY timestamp
GROUP BY
    deviceId, 
    TumblingWindow(second, 10)
```
* **TumblingWindow(second, 10)**: This tells the engine to wait for 10 seconds of data, calculate the average temperature of all readings that arrived in that 10-second block, spit out one single row, and then repeat for the next 10 seconds.

## 3. The Sink (Destination)
The resulting aggregated row (1 row every 10 seconds instead of 10 raw rows per second) is written into our Destination database (the `ProcessedTelemetry_Averages` PostgreSQL table we created). A dashboard tool like **Power BI** can then connect to this Postgres table to show a live-updating graph of the machine's average temperature!
