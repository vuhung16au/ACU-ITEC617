import time
import os
from azure.storage.blob import BlobServiceClient

# Default connection string for Azurite (local emulator)
connection_string = "DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;BlobEndpoint=http://azurite:10000/devstoreaccount1;"

print("Waiting for Azurite Blob Service to start...")
time.sleep(10)

blob_service_client = BlobServiceClient.from_connection_string(connection_string)

container_name = "marketing-assets"
print(f"Creating container '{container_name}'...")
try:
    container_client = blob_service_client.create_container(container_name)
except Exception as e:
    print(e)
    container_client = blob_service_client.get_container_client(container_name)

# Create dummy files
files_to_upload = [
    {"name": "sales-data-2025.csv", "content": "Date,Region,Revenue\n2025-01-01,NA,1000\n2025-01-02,EU,1500", "metadata": {"category": "marketing", "year": "2025", "type": "data"}},
    {"name": "campaign-launch.json", "content": '{"campaign": "summer_sale", "budget": 50000}', "metadata": {"category": "marketing", "year": "2025", "type": "config"}},
    {"name": "logo_v1.jpg", "content": "fake image data 1010101", "metadata": {"category": "branding", "year": "2024", "type": "image"}},
    {"name": "annual_report.pdf", "content": "fake pdf content", "metadata": {"category": "finance", "year": "2024", "type": "document"}},
]

print("Uploading files and setting metadata...")
for file_info in files_to_upload:
    file_name = file_info["name"]
    # Write temp file locally
    with open(file_name, "w") as f:
        f.write(file_info["content"])
    
    blob_client = blob_service_client.get_blob_client(container=container_name, blob=file_name)
    with open(file_name, "rb") as data:
        blob_client.upload_blob(data, overwrite=True)
    
    # Set metadata
    blob_client.set_blob_metadata(metadata=file_info["metadata"])
    print(f"Uploaded {file_name} with metadata: {file_info['metadata']}")
    
    os.remove(file_name)

print("Data initialization complete.")
