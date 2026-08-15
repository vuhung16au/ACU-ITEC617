from sentence_transformers import SentenceTransformer
from transformers import pipeline
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# 1. Embedding Model (Converts text to vector)
# all-MiniLM-L6-v2 produces 384-dimensional vectors. It is fast and runs locally.
logger.info("Loading Embedding Model...")
embedding_model = SentenceTransformer('all-MiniLM-L6-v2')

# 2. LLM / Generator Model (Generates answer based on context)
# google/flan-t5-small is a tiny text-to-text model perfect for simple local RAG generation.
logger.info("Loading LLM Model...")
llm_pipeline = pipeline("text-generation", model="google/flan-t5-small")

logger.info("AI Models Loaded Successfully.")

def get_embedding(text: str) -> list[float]:
    """Returns the vector embedding for a given string."""
    vector = embedding_model.encode(text)
    return vector.tolist()

def generate_answer(query: str, context: str) -> str:
    """Generates an answer using the local LLM given the context."""
    prompt = f"Answer the question based only on the context below.\n\nContext:\n{context}\n\nQuestion: {query}\n\nAnswer:"
    
    result = llm_pipeline(prompt, max_length=150)
    return result[0]['generated_text']
