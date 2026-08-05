.PHONY: up down test logs

up:
	docker compose up -d --build

down:
	docker compose down -v

logs:
	docker compose logs -f

test:
	docker compose exec webapp pytest /app/tests/ -v
