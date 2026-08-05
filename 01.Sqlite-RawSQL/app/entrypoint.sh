#!/bin/sh
# Initialize the database if it doesn't exist
if [ ! -f /data/database.sqlite ]; then
    echo "Initializing database..."
    # Give the volume a moment if needed
    touch /data/database.sqlite
    sqlite3 /data/database.sqlite < /docker-entrypoint-initdb.d/01-init.sql
fi

exec uvicorn main:app --host 0.0.0.0 --port 8000
