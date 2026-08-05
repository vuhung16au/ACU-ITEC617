.PHONY: up down test e2e

up:
	docker compose up -d

down:
	docker compose down -v

test: e2e

e2e:
	bash tests/test_e2e.sh
