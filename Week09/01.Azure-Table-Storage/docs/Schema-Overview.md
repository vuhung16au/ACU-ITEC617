# Schema Overview

In Azure Table Storage, tables do not have a fixed schema. However, every entity in an Azure Table MUST have three system properties:

1. **`PartitionKey` (String):**
   - The first part of the primary key.
   - Determines the partition in which the entity is stored.
   - Entities with the same `PartitionKey` are stored together and can be queried efficiently in a single operation.
   - In our scenario, we use `CourseCode` (e.g., "ITEC617", "COMP201") as the `PartitionKey`.

2. **`RowKey` (String):**
   - The second part of the primary key.
   - A unique identifier for an entity within a given partition.
   - In our scenario, we use `StudentID` (e.g., "S001", "S011") as the `RowKey`.

3. **`Timestamp` (DateTime):**
   - Maintained automatically by Azure Table Storage.
   - Used to record the time the entity was last modified (optimistic concurrency control).

## The `Students` Table

For this lab, we have initialized a `Students` table. Because it is schema-less, different entities can have entirely different properties.

### Common Custom Properties Added:
- `Name` (String): The student's full name.
- `Email` (String): The student's email address (not all students have one).
- `Phone` (String): The student's phone number (not all students have one).
- `Age` (Int32): The student's age.
- `Major` (String): The student's degree major.
- `EnrollmentYear` (Int32): The year the student enrolled.

This flexibility allows developers to ingest varying data structures into a single table without needing complex ALTER TABLE statements or storing large numbers of NULL values.
