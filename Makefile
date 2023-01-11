
update:
	@bash contrib/release.sh --no-push

release:
	@bash release.sh

test-dataset: update
	@docker compose down -v
	@docker compose build mysql
	@docker compose up -d mysql
	@docker compose exec mysql dataset load sample

test-my-cnf: update
	@docker compose build mysql
	@docker compose up -d --force-recreate mysql
	@docker compose exec -T mysql sh -c "cat /etc/mysql/my.cnf"
