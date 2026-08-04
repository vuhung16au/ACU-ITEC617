import time
from azure.data.tables import TableServiceClient
from azure.core.exceptions import ResourceExistsError

# Default connection string for Azurite (local emulator)
connection_string = "DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;TableEndpoint=http://azurite:10002/devstoreaccount1;"

print("Waiting for Azurite to start...")
time.sleep(10) # Give Azurite time to fully boot up

print("Connecting to Azurite Table Storage...")
service = TableServiceClient.from_connection_string(conn_str=connection_string)
table_name = "Students"

try:
    service.create_table(table_name)
    print(f"Table '{table_name}' created successfully.")
except ResourceExistsError:
    print(f"Table '{table_name}' already exists.")
except Exception as e:
    print(f"Error creating table: {e}")

table_client = service.get_table_client(table_name)

# 20+ Student records demonstrating schema-less nature
students = [
    {"PartitionKey": "ITEC617", "RowKey": "S001", "Name": "Alice Smith", "Email": "alice@example.com"},
    {"PartitionKey": "ITEC617", "RowKey": "S002", "Name": "Bob Johnson", "Phone": "555-1234"},
    {"PartitionKey": "ITEC617", "RowKey": "S003", "Name": "Charlie Brown", "Email": "charlie@example.com", "Age": 22},
    {"PartitionKey": "ITEC617", "RowKey": "S004", "Name": "Diana Prince"},
    {"PartitionKey": "ITEC617", "RowKey": "S005", "Name": "Evan Wright", "Phone": "555-5678", "EnrollmentYear": 2023},
    {"PartitionKey": "ITEC617", "RowKey": "S006", "Name": "Fiona Gallagher", "Email": "fiona@example.com"},
    {"PartitionKey": "ITEC617", "RowKey": "S007", "Name": "George Costanza", "Phone": "555-9999", "Major": "Computer Science"},
    {"PartitionKey": "ITEC617", "RowKey": "S008", "Name": "Hannah Abbott", "Age": 21},
    {"PartitionKey": "ITEC617", "RowKey": "S009", "Name": "Ian Malcolm", "Email": "ian@chaos.org", "Phone": "555-0000"},
    {"PartitionKey": "ITEC617", "RowKey": "S010", "Name": "Jane Doe", "Major": "Data Science"},
    
    {"PartitionKey": "COMP201", "RowKey": "S011", "Name": "Kevin Mitnick", "Email": "kevin@example.com"},
    {"PartitionKey": "COMP201", "RowKey": "S012", "Name": "Linda Hamilton", "Phone": "555-1111"},
    {"PartitionKey": "COMP201", "RowKey": "S013", "Name": "Mike Ehrmantraut", "Age": 60, "Email": "mike@example.com"},
    {"PartitionKey": "COMP201", "RowKey": "S014", "Name": "Nina Williams"},
    {"PartitionKey": "COMP201", "RowKey": "S015", "Name": "Oscar Martinez", "Major": "Accounting"},
    
    {"PartitionKey": "INFO101", "RowKey": "S016", "Name": "Pam Beesly", "Email": "pam@example.com", "Phone": "555-2222"},
    {"PartitionKey": "INFO101", "RowKey": "S017", "Name": "Quinn Fabray"},
    {"PartitionKey": "INFO101", "RowKey": "S018", "Name": "Ryan Howard", "EnrollmentYear": 2024},
    {"PartitionKey": "INFO101", "RowKey": "S019", "Name": "Steve Harrington", "Phone": "555-3333"},
    {"PartitionKey": "INFO101", "RowKey": "S020", "Name": "Tony Stark", "Email": "tony@stark.com", "Major": "Engineering", "Age": 45},
    {"PartitionKey": "INFO101", "RowKey": "S021", "Name": "Uma Thurman", "Phone": "555-4444"}
]

print(f"Inserting {len(students)} student records...")
for student in students:
    try:
        table_client.upsert_entity(entity=student)
    except Exception as e:
        print(f"Failed to insert {student['RowKey']}: {e}")

print("Data initialization complete.")
