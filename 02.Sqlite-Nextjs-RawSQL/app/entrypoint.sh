#!/bin/sh
# Initialize the database if it doesn't exist
if [ ! -f /data/database.sqlite ]; then
    echo "Initializing database..."
    touch /data/database.sqlite
    sqlite3 /data/database.sqlite < /docker-entrypoint-initdb.d/01-init.sql
fi

exec npm start -- -p 3000
