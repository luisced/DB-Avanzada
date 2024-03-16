-- master/replica_user_setup.sql
ALTER USER 'replica' @'%' IDENTIFIED
WITH
    mysql_native_password BY 'replica_pass';
GRANT REPLICATION SLAVE ON *.* TO `replica` @`%`;