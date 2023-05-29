#!/usr/bin/env bash

echo "==> Prepare dataset..."
docker compose down -v || true
docker compose up -d --force-recreate mysql && sleep 10

echo "==> Killing main process..."
docker compose exec mysql bash -c 'kill -11 $(pidof mysqld)' && sleep 5

echo "==> Logging..."
docker compose logs mysql
docker compose ps
