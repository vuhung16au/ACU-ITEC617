# Stream Processing vs Batch Processing

In the world of Big Data, pipelines generally fall into two categories:

## 1. Batch Processing
Data is collected over time and stored in a static location (like a CSV file or a Data Lake). At a scheduled time (e.g., midnight), an ETL pipeline reads the entire chunk of data, transforms it, and loads it into a Data Warehouse. 
* **Pros:** Highly accurate, handles massive historical datasets easily.
* **Cons:** High latency. The insights are always hours or days old.

## 2. Stream Processing (Real-Time)
Data arrives continuously and infinitely (like the output of our `sensor_simulator.py`). The pipeline processes this data *in-flight*, before it ever hits a permanent storage drive.
* **Pros:** Low latency. You can trigger an alert the exact second a machine overheats.
* **Cons:** Complex to manage. You are querying data that is constantly moving.

Because a stream is infinite, you cannot write a standard SQL query like `SELECT AVG(Temp) FROM Stream`. The query would never finish because the stream never ends! To solve this, stream processing engines use **Windowing Functions** to slice the infinite stream into manageable chunks (e.g., "Give me the average temperature over a 10-second window").
