.PHONY: up down test logs clean

clean:
	@echo "Cleaning up generated files and caches..."
	rm -rf node_modules .next .venv
	find . -type d -name "__pycache__" -exec rm -rf {} +
	rm -rf .pytest_cache

up:
	docker compose up -d --build

down:
	docker compose down -v

logs:
	docker compose logs -f

test:
	docker compose exec webapp pytest /app/tests/ -v
