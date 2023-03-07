
## ====
## Dist
## ====

update:
	@bash contrib/update.sh
	@docker compose build mysql

release:
	@bash contrib/update.sh --release

## ====
## Test
## ====

test-up: update
	@docker compose down -v
	@docker compose up mysql

test-dataset: update
	@docker compose down -v
	@docker compose up -d mysql
	@docker compose exec mysql dataset load sample
	@rm -f tests/fixtures/dataset/sample-clone.sql && true
	@docker compose exec mysql dataset save sample-clone

test-my-cnf: update
	@docker compose up -d --force-recreate mysql
	@docker compose exec mysql sh -c "cat /etc/mysql/my.cnf"
	@docker compose exec mysql execute "SHOW VARIABLES LIKE 'delayed_insert_timeout'"

test-execute: update
	@docker compose up -d --force-recreate mysql
	@docker compose exec mysql execute "SHOW DATABASES"

