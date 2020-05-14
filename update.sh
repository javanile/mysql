#!/usr/bin/env bash

versions=(
  5.7.28
)

for version in "${versions[@]}"; do
  mkdir -p ${version}
  sed -e 's!%{version}!'"${version}"'!' Dockerfile.template > ${version}/Dockerfile
  cp dataset.sh ${version}/dataset.sh
  chmod +x ${version}/dataset.sh
  docker build -t javanile/mysql:${version} ${version}
  docker push javanile/mysql:${version}
done

git add .
git commit -am "new release"
git push
