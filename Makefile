
update:
	@bash release.sh --no-push

release:
	@bash release.sh

test-dataset: update
	@docker-compose down -v
	@docker-compose build mysql
	@docker-compose up -d mysql
	sleep 10
	@docker-compose exec mysql dataset load sample
