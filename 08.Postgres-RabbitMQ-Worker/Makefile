.PHONY: up down e2e deploy clean

up:
	docker compose up -d --build

down:
	docker compose down

e2e:
	npx playwright test

deploy:
	echo "Not implemented yet"

clean:
	@echo "Cleaning up node_modules, .next, .venv, and caches..."
	rm -rf node_modules .next .venv
	find . -type d -name "__pycache__" -exec rm -rf {} +
	rm -rf .pytest_cache
