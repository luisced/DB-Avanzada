#!/bin/bash

# Esperar a que MySQL esté listo
while ! mysqladmin ping -h"mysql_master" --silent; do
    sleep 10
done

# Configurar la replicación
mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
CHANGE MASTER TO
  MASTER_HOST='mysql_master',
  MASTER_USER='replica',
  MASTER_PASSWORD='root',
  MASTER_PORT=3306,
  MASTER_AUTO_POSITION=1;
START SLAVE;
EOSQL

# Verificar el estado de la replicación
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "SHOW SLAVE STATUS\G"
