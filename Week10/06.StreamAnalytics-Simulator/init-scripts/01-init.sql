-- This table simulates the final "Sink" or "Destination" in an Azure Stream Analytics pipeline.
-- Stream Analytics would aggregate incoming raw telemetry (e.g., millions of temp readings) 
-- into 10-second averages and write them here.

CREATE TABLE ProcessedTelemetry_Averages (
    RecordID SERIAL PRIMARY KEY,
    DeviceID VARCHAR(50) NOT NULL,
    WindowStartTime TIMESTAMP NOT NULL,
    WindowEndTime TIMESTAMP NOT NULL,
    AverageTemperature NUMERIC(5, 2) NOT NULL,
    AlertTriggered BOOLEAN DEFAULT FALSE
);

-- Mock some historical aggregated data to simulate an active pipeline sink
INSERT INTO ProcessedTelemetry_Averages (DeviceID, WindowStartTime, WindowEndTime, AverageTemperature, AlertTriggered) VALUES
('Sensor-101', CURRENT_TIMESTAMP - interval '30 seconds', CURRENT_TIMESTAMP - interval '20 seconds', 22.4, FALSE),
('Sensor-101', CURRENT_TIMESTAMP - interval '20 seconds', CURRENT_TIMESTAMP - interval '10 seconds', 23.1, FALSE),
('Sensor-101', CURRENT_TIMESTAMP - interval '10 seconds', CURRENT_TIMESTAMP, 45.8, TRUE);
