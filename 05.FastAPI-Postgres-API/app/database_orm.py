from sqlalchemy import create_engine, Column, Integer, String, DateTime
from sqlalchemy.orm import declarative_base, sessionmaker
from config import DATABASE_URL

# SQLAlchemy Setup
# We replace postgresql:// with postgresql+psycopg:// to explicitly tell
# SQLAlchemy to use the psycopg driver.
SQLALCHEMY_DATABASE_URL = DATABASE_URL.replace("postgresql://", "postgresql+psycopg://")

engine = create_engine(SQLALCHEMY_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

# Define the ORM Model
class Student(Base):
    __tablename__ = "australian_students"

    id = Column(Integer, primary_key=True, index=True)
    first_name = Column(String(50), nullable=False)
    last_name = Column(String(50), nullable=False)
    email = Column(String(100), unique=True, nullable=False)
    city = Column(String(50), nullable=False)
    state = Column(String(10), nullable=False)
    created_at = Column(DateTime)

def get_students_orm(limit: int = 100, offset: int = 0):
    """
    Fetches students using the SQLAlchemy ORM.
    """
    session = SessionLocal()
    try:
        # Instead of writing SQL strings, we use Python methods to query the database.
        # The ORM handles translating this to the appropriate SQL query.
        students = session.query(Student).offset(offset).limit(limit).all()
        return students
    finally:
        session.close()
