# Schema Overview: Telemetry & Log Data

This document outlines the structure of the mock telemetry tables provided in the local PostgreSQL database for this exercise.

These tables simulate the kind of fast-moving log data that is typically ingested into Azure Data Explorer (ADX) or Azure Log Analytics.

## 1. `SensorLogs`
Simulates telemetry coming from IoT (Internet of Things) devices deployed in a facility.

* `LogID` (INT, Primary Key): Unique auto-incrementing ID for the log entry.
* `Timestamp` (TIMESTAMP): The exact date and time the sensor reading was recorded.
* `DeviceID` (VARCHAR): The unique identifier of the sensor (e.g., `Sensor-A1`).
* `EventType` (VARCHAR): The severity or type of the event (e.g., `Info`, `Warning`, `Error`).
* `Temperature` (DECIMAL): The temperature reading at that time.
* `Message` (TEXT): A descriptive log message.

## 2. `WebLogs`
Simulates HTTP access logs from a web server or application proxy.

* `LogID` (INT, Primary Key): Unique auto-incrementing ID for the log entry.
* `Timestamp` (TIMESTAMP): The exact date and time the HTTP request was received.
* `ClientIP` (VARCHAR): The IP address of the user making the request.
* `HttpMethod` (VARCHAR): The HTTP verb used (e.g., `GET`, `POST`).
* `RequestUrl` (VARCHAR): The URL path requested.
* `StatusCode` (INT): The HTTP response status code (e.g., 200 for OK, 404 for Not Found, 500 for Server Error).
* `ResponseTimeMs` (INT): How long the server took to respond to the request, measured in milliseconds. High values can indicate performance bottlenecks.
