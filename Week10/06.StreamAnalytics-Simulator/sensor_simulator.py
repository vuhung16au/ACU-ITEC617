import json
import time
import random
from datetime import datetime

# Simulates an IoT Hub Input Source for Stream Analytics
def generate_telemetry(device_id):
    # Base temperature
    temp = 22.0
    print(f"[{datetime.now().strftime('%H:%M:%S')}] Started IoT Sensor Simulator for {device_id}...")
    print("Sending continuous JSON telemetry stream (Press Ctrl+C to stop)...\n")
    
    try:
        while True:
            # Simulate slight temperature fluctuations
            temp += random.uniform(-0.5, 0.6)
            
            # Occasionally simulate a massive temperature spike (e.g., machine overheating)
            if random.random() > 0.95:
                temp += random.uniform(15.0, 30.0)
                
            telemetry = {
                "deviceId": device_id,
                "timestamp": datetime.utcnow().isoformat() + "Z",
                "temperature_celsius": round(temp, 2),
                "humidity": random.randint(30, 60)
            }
            
            # In a real architecture, this JSON string would be sent to an Azure Event Hub or IoT Hub
            # For our simulation, we just print the raw stream to standard output
            print(json.dumps(telemetry))
            
            # Bring temp back down if it spiked
            if temp > 30.0:
                temp -= random.uniform(10.0, 20.0)
                
            time.sleep(1) # Send data every second
            
    except KeyboardInterrupt:
        print("\nSimulator stopped.")

if __name__ == "__main__":
    generate_telemetry("Sensor-101")
