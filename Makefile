
update:
	@bash contrib/release.sh --no-push
	@docker compose build mysql

release:
	@bash release.sh

test-dataset: update
	@docker compose down -v
	@docker compose build mysql
	@docker compose up -d mysql
	@docker compose exec mysql dataset load sample

test-my-cnf: update
	@docker compose up -d --force-recreate mysql
	@docker compose exec mysql sh -c "cat /etc/mysql/my.cnf"
	@docker compose exec mysql execute "SHOW VARIABLES LIKE 'delayed_insert_timeout'"

test-entrypoint: update
	@docker compose build mysql
	@docker compose up -d --force-recreate mysql
