from fastapi import FastAPI, Query
from typing import List, Dict, Any

from config import USE_ORM
from database_raw import get_students_raw
from database_orm import get_students_orm

app = FastAPI(
    title="Student API",
    description="A pure backend API demonstrating Raw SQL vs ORM with FastAPI and PostgreSQL.",
    version="1.0.0"
)

@app.get("/")
def read_root():
    return {"message": "Welcome to the Student API! Go to /docs to view the interactive documentation."}

@app.get("/students", response_model=List[Dict[str, Any]])
def get_students(
    limit: int = Query(10, description="The maximum number of students to return (Pagination)"),
    offset: int = Query(0, description="The number of students to skip (Pagination)")
):
    """
    Fetch a list of students from the database.
    
    This endpoint implements **Pagination** via the `limit` and `offset` query parameters.
    In a real-world application, you would also likely require an API token here (API Security) 
    to restrict access to authorized users only.
    """
    
    if USE_ORM:
        # Fetch data using SQLAlchemy ORM
        students = get_students_orm(limit=limit, offset=offset)
        # ORM returns model objects, FastAPI can serialize them automatically if configured, 
        # but to keep the response consistent with raw SQL (list of dicts), we convert them:
        return [
            {
                "id": s.id,
                "first_name": s.first_name,
                "last_name": s.last_name,
                "email": s.email,
                "city": s.city,
                "state": s.state,
                "created_at": s.created_at
            } for s in students
        ]
    else:
        # Fetch data using Raw SQL and psycopg
        students = get_students_raw(limit=limit, offset=offset)
        # psycopg dict_row already returns a list of dictionaries
        return students
