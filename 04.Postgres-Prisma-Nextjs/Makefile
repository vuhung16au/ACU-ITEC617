.PHONY: up down test deploy-vercel deploy

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
