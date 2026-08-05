FROM python:3.11-slim

WORKDIR /app

# Install dependencies first for better caching
COPY ./app/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the app code
COPY ./app /app

# Command to run the application
# We use uvicorn with --reload for development purposes
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
