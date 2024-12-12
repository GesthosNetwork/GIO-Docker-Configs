#!/bin/bash

if [ -f .bootstrap.lock ]; then
  echo 'Error: Installation already finished, dont start this container' >&2
  exit 1
fi

sed -i $'s/\r$//' ".env"
source .env

echo "Using mysqladmin to ping..."

while ! mysqladmin ping --host 172.10.3.100 -u root -p"$MYSQL_PASSWORD" --connect-timeout 3; do
  echo "Waiting for MySQL to start up..."
  sleep 3
done

echo "Importing..."
mysql -h172.10.3.100 -u root -p"$MYSQL_PASSWORD" < database/hk4e_db_setup.sql

for sql_file in hk4e_db_config.sql hk4e_db_deploy_config.sql hk4e_db_user.sql; do
  mysql -h172.10.3.100 -u hk4e_work -pGenshinImpactOffline < database/$sql_file
done

echo "Database imported"
