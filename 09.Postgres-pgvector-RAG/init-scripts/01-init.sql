CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE IF NOT EXISTS documents (
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    embedding vector(384) -- 384 dimensions for standard MiniLM embedding models
);

-- We insert some mock data, but we leave the embeddings NULL initially. 
-- The application will compute and update the embeddings on startup!
INSERT INTO documents (content) VALUES
('The Master of Computer Science at ACU focuses on modern software engineering, data science, and artificial intelligence.'),
('Our main campus for IT students is located in North Sydney.'),
('RAG (Retrieval-Augmented Generation) is a technique that grounds AI models on external knowledge bases.'),
('PostgreSQL with the pgvector extension is the industry standard for combining relational data with vector search.'),
('To connect to the campus Wi-Fi, use your ACU student ID and password on the eduroam network.'),
('Classes for ITEC617 are typically held in the evening to accommodate working professionals.');
