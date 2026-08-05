.PHONY: clean clean-artifacts clean-docker

clean: clean-artifacts clean-docker
	@echo "Cleanup complete!"

clean-artifacts:
	@echo "Cleaning Node.js and Python artifacts to free up space..."
	@find . -type d -name "node_modules" -prune -exec rm -rf {} +
	@find . -type d -name ".next" -prune -exec rm -rf {} +
	@find . -type d -name "dist" -prune -exec rm -rf {} +
	@find . -type d -name "build" -prune -exec rm -rf {} +
	@find . -type d -name ".venv" -prune -exec rm -rf {} +
	@find . -type d -name "venv" -prune -exec rm -rf {} +
	@find . -type d -name "__pycache__" -prune -exec rm -rf {} +
	@find . -type d -name ".pytest_cache" -prune -exec rm -rf {} +
	@find . -type f -name "*.pyc" -delete
	@echo "Artifacts cleaned."

clean-docker:
	@echo "Stopping and removing Docker containers..."
	@find . -name "docker-compose.yaml" -execdir docker compose down \;
	@find . -name "docker-compose.yml" -execdir docker compose down \;
	@echo "Docker containers cleaned."
