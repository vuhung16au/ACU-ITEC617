# AI & Vector Databases

## What are Vector Embeddings?
Vector embeddings are arrays of numbers (vectors) that represent the semantic meaning of data (text, images, audio). 
Unlike traditional keyword search (which looks for exact word matches like "campus"), a vector search looks for contextual similarity (e.g., matching "university grounds" with "campus").

## What is pgvector?
`pgvector` is an open-source extension for PostgreSQL that enables vector similarity search. It allows you to store vector arrays alongside your traditional relational data in the same database table, and run queries using operators like `<=>` (Cosine Distance) or `<->` (L2 distance).

## Retrieval-Augmented Generation (RAG)
RAG is an architecture used to solve the "hallucination" and "outdated information" problems of Large Language Models (LLMs).

**The RAG Pipeline:**
1. **Query**: The user asks a question.
2. **Embed**: The application converts the user's question into a vector embedding.
3. **Retrieve (Search)**: The application queries the Vector Database (Postgres `pgvector`) to find the documents with embeddings most mathematically similar (closest distance) to the query's embedding.
4. **Augment**: The application takes the retrieved text documents and bundles them together as "context".
5. **Generate**: The application sends a prompt to the LLM that basically says: *"Answer the user's query using ONLY the following context..."*
