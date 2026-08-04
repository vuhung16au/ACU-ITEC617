# Data Types

Data can be categorized into three main types:

## 1. Structured Data
Data that follows a strict predefined model or schema. It is organized in rows and columns.
*   **Example:** A relational database table (like our `employees` table).
*   **Pros:** Easy to query, highly organized, enforces data integrity.

## 2. Semi-structured Data
Data that doesn't reside in a relational database but has some organizational properties that make it easier to analyze. It contains tags or markers to separate semantic elements.
*   **Example:** JSON or XML documents (like our `api_logs` table using the JSONB data type).
*   **Pros:** Flexible schema. You can add new fields without altering a strict table definition.

## 3. Unstructured Data
Data that has no predefined data model or is not organized in a pre-defined manner.
*   **Example:** Text documents, emails, images, videos (like our `document_store` table).
*   **Pros:** Can store anything.
*   **Cons:** Very difficult to search and analyze using traditional database methods.
