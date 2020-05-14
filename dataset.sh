#!/bin/sh
set -e

MYSQL_HOST=0.0.0.0

export MYSQL_PWD=${MYSQL_ROOT_PASSWORD}

dataset_help () {
    echo "Usage: ... dataset [load|save] DATASET_NAME"
    exit
}

dataset_file () {
    echo /dataset/$1.sql
    return 0
}

dataset_load () {
    if [ ! -f "$(dataset_file $1)" ]; then
        echo "Error: Dataset '$1' not found."
        exit 1
    fi
    echo "Load '$1' dataset..."
    mysql -uroot -h${MYSQL_HOST} ${MYSQL_DATABASE} < $(dataset_file $1)
    echo "Done."
    return 0
}

dataset_save () {
    echo "Save '$1' dataset..."
    mysqldump -uroot -h${MYSQL_HOST} ${MYSQL_DATABASE} > $(dataset_file $1)
    chmod 777 $(dataset_file $1)
    echo "Done."
    exit
}

[ -z $2 ] && dataset_help

case $1 in
    load) dataset_load $2 ;;
    save) dataset_save $2 ;;
    *)    dataset_help ;;
esac
