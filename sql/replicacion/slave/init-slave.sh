#!/bin/bash

# Esperar a que MySQL esté listo
while ! mysqladmin ping -h"mysql_master" --silent; do
    sleep 10
done

# Configurar la replicación
mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
SET GLOBAL server_id = 2;
CHANGE MASTER TO
  MASTER_HOST='mysql_master',
  MASTER_USER='replica',
  MASTER_PASSWORD='replica_pass',
  MASTER_PORT=3306,
  MASTER_AUTO_POSITION=1;
START SLAVE;
EOSQL


