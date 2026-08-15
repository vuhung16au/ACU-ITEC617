.PHONY: up down clean

up:
	docker compose up -d

down:
	docker compose down

clean:
	@echo "Cleaning up generated files and caches..."
	rm -rf node_modules .next .venv
	find . -type d -name "__pycache__" -exec rm -rf {} +
	rm -rf .pytest_cache
