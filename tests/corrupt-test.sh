#!/usr/bin/env bash

echo "==> Prepare dataset..."
docker compose down -v || true
docker compose up -d --force-recreate mysql

sleep 10

echo "==> Corrupt dataset..."
docker compose exec mysql bash -c ">/var/lib/mysql/ibdata1"

sleep 5

echo "==> Creating new table..."
docker compose exec mysql execute "CREATE TABLE test (id INT)"
docker compose exec mysql execute "FLUSH TABLES WITH READ LOCK; UNLOCK TABLES"

echo "==> Logging..."
docker compose logs mysql
docker compose ps
