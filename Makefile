
update:
	@bash update.sh

test-dataset: update
	@docker-compose down -v
	@docker-compose up -d mysql
	@docker-compose exec mysql dataset load sample
