#!/usr/bin/env bash

release=0.$(date +%y.%W)

versions=(
  "5.7.28"
  "8.0.31"
)

for version in "${versions[@]}"; do
  mkdir -p "versions/${version}"
  sed -e 's!%{version}!'"${version}"'!' versions/Dockerfile.template > "versions/${version}/Dockerfile"

  cp versions/dataset "versions/${version}/dataset"
  chmod +x "versions/${version}/dataset"

  cp versions/execute "versions/${version}/execute"
  chmod +x "versions/${version}/execute"

  cp versions/docker-entrypoint.sh "versions/${version}/docker-entrypoint.sh"
  chmod +x "versions/${version}/docker-entrypoint.sh"

  if [[ $@ != *'--no-push'* ]]; then
    docker build -t "javanile/mysql:${version}" "versions/${version}"
    docker push "javanile/mysql:${version}"
  fi
done

if [[ $@ != *'--no-push'* ]]; then
    git add .
    git commit -am "Release ${release}" && true
    git push
fi
