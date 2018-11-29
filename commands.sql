CREATE USER 'lamp_minion'@'localhost';
CREATE DATABASE lamp_database;
GRANT USAGE ON lamp_database.* TO 'lamp_minion';
