import psycopg
from psycopg.rows import dict_row
from config import DATABASE_URL

def get_students_raw(limit: int = 100, offset: int = 0):
    """
    Fetches students using Raw SQL and the psycopg database driver.
    """
    # Connect to the database
    with psycopg.connect(DATABASE_URL) as conn:
        # Use dict_row to return rows as dictionaries instead of tuples
        with conn.cursor(row_factory=dict_row) as cur:
            # Note: We use parameterized queries (%s) to prevent SQL Injection,
            # even though limit and offset are integers.
            cur.execute(
                "SELECT id, first_name, last_name, email, city, state, created_at FROM australian_students LIMIT %s OFFSET %s;",
                (limit, offset)
            )
            
            # Fetch all rows from the executed query
            records = cur.fetchall()
            return records
