.PHONY: up down test e2e deploy deploy-vercel clean

clean:
	@echo "Cleaning up generated files and caches..."
	rm -rf node_modules .next .venv app/node_modules app/.next
	find . -type d -name "__pycache__" -exec rm -rf {} +
	rm -rf .pytest_cache

up:
	docker compose up -d

down:
	docker compose down -v

test: e2e

e2e:
	bash tests/test_e2e.sh

deploy: deploy-vercel

deploy-vercel:
	cd app && npx vercel --prod
