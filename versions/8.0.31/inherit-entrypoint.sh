#!/bin/bash

docker_hook() {
  hook_file="/etc/docker.d/$1.sh"
  if [ -f "${hook_file}" ]; then
    chmod +x "${hook_file}"
    ${hook_file}
  fi
}

docker_hook init

chmod 755 /etc/mysql/docker.conf.d
chmod 644 /etc/mysql/docker.conf.d/*.cnf

docker-entrypoint.sh "$@"
