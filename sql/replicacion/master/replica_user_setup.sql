CREATE USER 'replica' @'%' IDENTIFIED
WITH
    mysql_native_password BY 'root';

GRANT REPLICATION SLAVE ON *.* TO 'replica' @'%';

FLUSH PRIVILEGES;