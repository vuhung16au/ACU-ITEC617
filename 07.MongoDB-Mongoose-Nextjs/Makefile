.PHONY: up down e2e deploy-vercel deploy clean

up:
	docker compose up -d

down:
	docker compose down

e2e:
	npx playwright test

deploy-vercel:
	npx vercel --prod

deploy: deploy-vercel

clean:
	@echo "Cleaning up node_modules, .next, and caches..."
	rm -rf node_modules .next .venv
	find . -type d -name "__pycache__" -exec rm -rf {} +
	rm -rf .pytest_cache
