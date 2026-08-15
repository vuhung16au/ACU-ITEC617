.PHONY: up down e2e deploy-vercel deploy

up:
	docker compose up -d

down:
	docker compose down

e2e:
	npx playwright test

deploy-vercel:
	npx vercel --prod

deploy: deploy-vercel
