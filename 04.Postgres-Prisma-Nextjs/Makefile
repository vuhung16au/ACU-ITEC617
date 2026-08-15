.PHONY: up down test deploy-vercel deploy clean

clean:
	@echo "Cleaning up generated files and caches..."
	rm -rf node_modules .next .venv webapp/node_modules webapp/.next
	find . -type d -name "__pycache__" -exec rm -rf {} +
	rm -rf .pytest_cache

up:
	docker compose up -d

down:
	docker compose down

test:
	@echo "Running simple test script..."
	cd webapp && npm run test

deploy-vercel:
	@echo "Deploying to Vercel..."
	cd webapp && npx vercel --prod

deploy: deploy-vercel
