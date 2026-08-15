.PHONY: up down e2e run clean

up:
	docker compose up -d

down:
	docker compose down

run:
	uv run uvicorn app.main:app --reload

e2e:
	PYTHONPATH=. uv run pytest tests/e2e.py

clean:
	@echo "Cleaning up python environment, caches, and downloaded huggingface models..."
	rm -rf .venv
	find . -type d -name "__pycache__" -exec rm -rf {} +
	rm -rf .pytest_cache
	rm -rf ~/.cache/huggingface/hub/models--google--flan-t5-small
	rm -rf ~/.cache/huggingface/hub/models--sentence-transformers--all-MiniLM-L6-v2
