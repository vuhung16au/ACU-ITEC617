from fastapi import FastAPI, HTTPException
import sqlite3
import os

app = FastAPI()

DB_PATH = os.getenv("DB_PATH", "/data/database.sqlite")

def get_db_connection():
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn

@app.get("/")
def read_root():
    return {"message": "Welcome to the SQLite Raw SQL API"}

@app.get("/users")
def get_users():
    """Retrieve all users using a RAW SQL query."""
    conn = get_db_connection()
    try:
        users = conn.execute("SELECT * FROM users").fetchall()
        return [dict(u) for u in users]
    except sqlite3.Error as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        conn.close()
