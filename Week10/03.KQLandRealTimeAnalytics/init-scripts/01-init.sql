-- 01-init.sql
-- DDL and DML for Telemetry and Log Analysis Simulation

-- Drop tables if they exist
DROP TABLE IF EXISTS SensorLogs;
DROP TABLE IF EXISTS WebLogs;

-- ==========================================
-- 1. IoT Sensor Telemetry Logs
-- ==========================================

CREATE TABLE SensorLogs (
    LogID SERIAL PRIMARY KEY,
    Timestamp TIMESTAMP NOT NULL,
    DeviceID VARCHAR(50) NOT NULL,
    EventType VARCHAR(50) NOT NULL,
    Temperature DECIMAL(5,2),
    Message TEXT
);

-- Insert sample IoT telemetry data
INSERT INTO SensorLogs (Timestamp, DeviceID, EventType, Temperature, Message) VALUES
('2023-11-01 10:00:00', 'Sensor-A1', 'Info', 22.5, 'Normal operation'),
('2023-11-01 10:05:00', 'Sensor-A1', 'Info', 22.6, 'Normal operation'),
('2023-11-01 10:10:00', 'Sensor-A1', 'Warning', 25.1, 'Temperature rising'),
('2023-11-01 10:15:00', 'Sensor-A1', 'Error', 30.5, 'Overheating detected'),
('2023-11-01 10:00:00', 'Sensor-B2', 'Info', 18.0, 'Normal operation'),
('2023-11-01 10:15:00', 'Sensor-B2', 'Info', 18.2, 'Normal operation'),
('2023-11-01 11:00:00', 'Sensor-A1', 'Error', 35.0, 'Critical failure'),
('2023-11-01 11:05:00', 'Sensor-B2', 'Warning', 20.1, 'Slight anomaly detected');

-- ==========================================
-- 2. Web Server Logs
-- ==========================================

CREATE TABLE WebLogs (
    LogID SERIAL PRIMARY KEY,
    Timestamp TIMESTAMP NOT NULL,
    ClientIP VARCHAR(50),
    HttpMethod VARCHAR(10),
    RequestUrl VARCHAR(255),
    StatusCode INT,
    ResponseTimeMs INT
);

-- Insert sample Web Server traffic logs (including a spike in errors/attacks)
INSERT INTO WebLogs (Timestamp, ClientIP, HttpMethod, RequestUrl, StatusCode, ResponseTimeMs) VALUES
('2023-11-01 10:00:01', '192.168.1.10', 'GET', '/api/data', 200, 45),
('2023-11-01 10:00:02', '192.168.1.11', 'GET', '/api/data', 200, 50),
('2023-11-01 10:02:15', '192.168.1.15', 'GET', '/api/status', 200, 20),
-- Simulated brute force or error spike around 10:05
('2023-11-01 10:05:00', '192.168.1.12', 'POST', '/api/login', 401, 120),
('2023-11-01 10:05:05', '192.168.1.12', 'POST', '/api/login', 401, 115),
('2023-11-01 10:05:10', '192.168.1.12', 'POST', '/api/login', 401, 130),
('2023-11-01 10:05:15', '192.168.1.12', 'POST', '/api/login', 401, 125),
('2023-11-01 10:06:00', '192.168.1.10', 'GET', '/api/data', 200, 48),
-- Simulated slow query / server error at 10:15
('2023-11-01 10:15:00', '192.168.1.15', 'GET', '/api/heavy-report', 500, 4500),
('2023-11-01 10:15:30', '192.168.1.11', 'GET', '/api/data', 200, 55);

-- ==========================================
-- Example Queries (For Students to Practice)
-- ==========================================

/*
-- Q1: Find all Sensor errors
SELECT * 
FROM SensorLogs 
WHERE EventType = 'Error';

-- Q2: Time-based aggregation: Count web requests per hour
SELECT DATE_TRUNC('hour', Timestamp) AS HourBucket, COUNT(*) AS RequestCount
FROM WebLogs
GROUP BY DATE_TRUNC('hour', Timestamp)
ORDER BY HourBucket;

-- Q3: Detect anomalies: Count HTTP errors (4xx, 5xx) per minute
SELECT DATE_TRUNC('minute', Timestamp) AS MinuteBucket, COUNT(*) AS ErrorCount
FROM WebLogs
WHERE StatusCode >= 400
GROUP BY DATE_TRUNC('minute', Timestamp)
ORDER BY MinuteBucket;
*/
