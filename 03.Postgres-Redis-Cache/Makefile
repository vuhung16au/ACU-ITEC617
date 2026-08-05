.PHONY: up down build test test-e2e logs

# Bring up all containers in the background
up:
	docker compose up -d

# Bring down all containers
down:
	docker compose down

# Rebuild images and bring up containers
build:
	docker compose up -d --build

# View logs
logs:
	docker compose logs -f

# Run tests by hitting the local endpoint twice to see miss then hit
test:
	@echo "First request (should be a Cache Miss):"
	curl -s http://localhost:3000/api/users | grep -o '"cacheStatus":"[^"]*"'
	@echo ""
	@echo "Second request (should be a Cache Hit):"
	curl -s http://localhost:3000/api/users | grep -o '"cacheStatus":"[^"]*"'

test-e2e: test
