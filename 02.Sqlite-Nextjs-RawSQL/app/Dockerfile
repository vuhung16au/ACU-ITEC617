FROM node:22-slim

# Install build tools and sqlite3 CLI for database initialization
RUN apt-get update && apt-get install -y python3 make g++ sqlite3 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY package*.json ./
RUN npm install --build-from-source=sqlite3

COPY . .

# Build Next.js app
RUN npm run build

RUN chmod +x /app/entrypoint.sh
CMD ["/app/entrypoint.sh"]
