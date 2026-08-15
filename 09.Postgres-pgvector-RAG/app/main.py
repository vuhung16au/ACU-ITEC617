from fastapi import FastAPI, Request, Form, Depends
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles
from sqlalchemy.orm import Session
from sqlalchemy import text
from contextlib import asynccontextmanager

from .db import get_db, engine
from .ai import get_embedding, generate_answer

templates = Jinja2Templates(directory="templates")

@asynccontextmanager
async def lifespan(app: FastAPI):
    # On Startup: Ensure all mock documents have an embedding!
    print("Checking and computing initial embeddings...")
    with Session(engine) as db:
        # Register the vector type with psycopg2/SQLAlchemy for this session
        db.execute(text("CREATE EXTENSION IF NOT EXISTS vector;"))
        db.commit()
        
        # Find documents missing embeddings
        docs_missing_vectors = db.execute(
            text("SELECT id, content FROM documents WHERE embedding IS NULL")
        ).fetchall()
        
        for doc in docs_missing_vectors:
            print(f"Generating embedding for doc ID {doc.id}...")
            emb = get_embedding(doc.content)
            
            # Update the row with the vector (cast list to string format for pgvector)
            db.execute(
                text("UPDATE documents SET embedding = :emb WHERE id = :id"),
                {"emb": str(emb), "id": doc.id}
            )
        db.commit()
    print("Startup complete.")
    yield
    print("Shutting down.")

app = FastAPI(lifespan=lifespan)
# app.mount("/static", StaticFiles(directory="static"), name="static")

@app.get("/")
def read_root(request: Request):
    return templates.TemplateResponse(
        name="index.html",
        request=request,
        context={"query": "", "answer": "", "sources": []}
    )

@app.post("/")
def process_rag(request: Request, query: str = Form(...), db: Session = Depends(get_db)):
    """
    RAG Endpoint:
    1. Embeds the user's query.
    2. Searches the DB for the closest documents.
    3. Prompts the LLM with the context to get an answer.
    """
    
    # 1. Embed Query
    query_vector = get_embedding(query)
    
    # 2. Vector Search (Cosine distance `<=>`, L2 distance `<->`, Inner product `<#>`)
    # We use Cosine Distance: ORDER BY embedding <=> '[...]' LIMIT 3
    sql = text("""
        SELECT content, 1 - (embedding <=> :vector) as similarity
        FROM documents
        WHERE embedding IS NOT NULL
        ORDER BY embedding <=> :vector
        LIMIT 3
    """)
    
    results = db.execute(sql, {"vector": str(query_vector)}).fetchall()
    
    # 3. Compile Context
    context_blocks = []
    sources = []
    for row in results:
        context_blocks.append(row.content)
        sim = row.similarity if row.similarity is not None else 0.0
        sources.append({"content": row.content, "score": round(sim, 4)})
        
    context_str = "\n".join(context_blocks)
    
    # 4. Generate Answer
    answer = generate_answer(query, context_str)
    
    return templates.TemplateResponse(
        name="index.html",
        request=request,
        context={
            "query": query,
            "answer": answer,
            "sources": sources
        }
    )
