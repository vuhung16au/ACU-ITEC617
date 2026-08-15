.PHONY: up down test e2e clean

clean:
	@echo "Cleaning up generated files and caches..."
	rm -rf node_modules .next .venv
	find . -type d -name "__pycache__" -exec rm -rf {} +
	rm -rf .pytest_cache

up:
	docker compose up -d

down:
	docker compose down -v

test: e2e

e2e:
	bash tests/test_e2e.sh
