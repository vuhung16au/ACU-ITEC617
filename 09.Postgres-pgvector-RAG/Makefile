.PHONY: up down e2e run

up:
	docker compose up -d

down:
	docker compose down

run:
	uv run uvicorn app.main:app --reload

e2e:
	PYTHONPATH=. uv run pytest tests/e2e.py
