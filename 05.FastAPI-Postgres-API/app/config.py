import os

# Configuration switch for the students:
# Set to False to use Raw SQL with psycopg
# Set to True to use SQLAlchemy ORM
USE_ORM = False

# Fetch database URL from environment variable, fallback to default
DATABASE_URL = os.getenv("DATABASE_URL", "postgresql://postgres:postgres@localhost:5432/student_db")
