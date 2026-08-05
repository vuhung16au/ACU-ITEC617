.PHONY: up down test logs

up:
	docker compose up -d

down:
	docker compose down -v

logs:
	docker compose logs -f

test:
	docker compose exec api pytest /app/tests/
