# Week 10 - Topic 03: Real-Time Analytics with KQL vs SQL

## Overview
This exercise introduces students to log analysis, stream processing, and time-series queries. We will compare **KQL (Kusto Query Language)**—the language used by Azure Data Explorer and Azure Log Analytics—with traditional **SQL**.

While KQL is highly optimized for searching massive amounts of telemetry and log data in real-time, it is very important to understand how similar time-based aggregation and log filtering can be achieved in standard relational databases using SQL.

## Learning Objectives
* Understand the use-cases for KQL (telemetry, IoT, logs, anomaly detection).
* Write queries to filter log events and find errors.
* Perform time-based aggregation (binning data by hour/minute).
* **Compare KQL syntax directly to SQL** to understand when each is appropriate.

## Business Scenario
You are monitoring a set of IoT Temperature Sensors and a Web Server for a manufacturing plant. 
* The **IoT Sensors** continuously send temperature readings and status events (`Info`, `Warning`, `Error`).
* The **Web Server** logs incoming HTTP requests, response times, and status codes.

You need to analyze this log data to detect sudden spikes in error rates or overheating sensors.

## KQL vs SQL Examples

In this local environment, we have provided a PostgreSQL database loaded with sample telemetry data. You will practice the **SQL equivalents** of common KQL operations. 

### 1. Filtering Events (Find all Errors)
**KQL (Azure):**
```kusto
SensorLogs
| where EventType == 'Error'
```

**SQL Equivalent (PostgreSQL):**
```sql
SELECT * 
FROM SensorLogs 
WHERE EventType = 'Error';
```

### 2. Time-Based Aggregation (Binning by Hour)
**KQL (Azure):**
```kusto
WebLogs
| summarize RequestCount = count() by bin(Timestamp, 1h)
```

**SQL Equivalent (PostgreSQL):**
```sql
SELECT DATE_TRUNC('hour', Timestamp) AS HourBucket, COUNT(*) AS RequestCount
FROM WebLogs
GROUP BY DATE_TRUNC('hour', Timestamp)
ORDER BY HourBucket;
```

### 3. Detecting Anomalies (Spike in HTTP Errors)
**KQL (Azure):**
```kusto
WebLogs
| where StatusCode >= 400
| summarize ErrorCount = count() by bin(Timestamp, 5m)
| render timechart
```

**SQL Equivalent (PostgreSQL):**
```sql
SELECT DATE_TRUNC('minute', Timestamp) AS MinuteBucket, COUNT(*) AS ErrorCount
FROM WebLogs
WHERE StatusCode >= 400
GROUP BY DATE_TRUNC('minute', Timestamp)
ORDER BY MinuteBucket;
```

*(Note: KQL has built-in charting capabilities like `| render timechart` which SQL databases typically leave to a BI visualization layer like Power BI or Grafana).*

## Explore KQL Online
If you want to try writing actual KQL without installing anything, Microsoft provides a free, public playground with massive sample datasets!
* Navigate to the **[Azure Data Explorer Help Cluster](https://dataexplorer.azure.com/clusters/help/databases/Samples)** and log in with a Microsoft account to run KQL natively in your browser against live sample data (like the famous `StormEvents` dataset).
