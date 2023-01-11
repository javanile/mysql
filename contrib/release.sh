#!/usr/bin/env bash

versions=(
  "5.7.28"
)

for version in "${versions[@]}"; do
  mkdir -p "versions/${version}"
  sed -e 's!%{version}!'"${version}"'!' versions/Dockerfile.template > "versions/${version}/Dockerfile"

  cp versions/dataset "versions/${version}/dataset"
  chmod +x "versions/${version}/dataset"

  cp versions/execute "versions/${version}/execute"
  chmod +x "versions/${version}/execute"

  cp versions/inherit-entrypoint.sh "versions/${version}/inherit-entrypoint.sh"
  chmod +x "versions/${version}/inherit-entrypoint.sh"

  docker build -t "javanile/mysql:${version}" "${version}"
  [[ $@ != *'--no-push'* ]] && docker push "javanile/mysql:${version}"
done

if [[ $@ != *'--no-push'* ]]; then
    git add .
    git commit -am "new release" && true
    git push
fi
