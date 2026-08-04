# Translating Business Rules to Data Models

When designing a database, we often start with raw, unstructured "business rules" — descriptions of how the business operates and what data it needs to track. Translating these rules into a robust data model involves several key steps:

## 1. Attribute Classification
Identifying the data points (attributes) described in the rules and classifying them helps determine how they should be stored:
* **Single-valued Attributes:** Attributes that hold a single value for an entity (e.g., `FirstName`, `Weight`).
* **Multi-valued Attributes:** Attributes that can hold multiple values for a single entity. Sometimes handled by creating a separate table, or if there's a strict limit, as multiple optional columns (e.g., `BackupPhoneNumber`).
* **Derived Attributes:** Attributes whose values can be calculated from other related attributes (e.g., calculating `Age` from `Birthdate`). We usually do *not* store derived attributes directly in the database to avoid data inconsistency.

## 2. Key Selection
Every entity needs a way to be uniquely identified. We must choose a Primary Key:
* **Natural Keys:** Using an existing attribute that is naturally unique (e.g., a Phone Number, Email, or SSN). While tempting, these can sometimes change or be shared (e.g., a family sharing a phone number), making them risky as primary keys.
* **Surrogate Keys:** Creating an artificial, system-generated unique identifier (e.g., `OwnerID` or `PetID`). This is the most robust and common approach in modern database design.

## 3. SQL Translation
Once the attributes and keys are defined, they are translated into SQL `CREATE TABLE` statements. This requires selecting appropriate data types (e.g., `VARCHAR` for text, `DATE` for dates, `DECIMAL` or `INT` for numbers) and establishing relationships using Foreign Keys.
