SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';


CREATE USER IF NOT EXISTS 'hk4e_work'@'172.10.%' IDENTIFIED BY 'GenshinImpactOffline';
CREATE USER IF NOT EXISTS 'hk4e_readonly'@'172.10.%' IDENTIFIED BY 'GenshinImpactOffline';

DROP DATABASE IF EXISTS `hk4e_db_config`; CREATE DATABASE `hk4e_db_config`;
DROP DATABASE IF EXISTS `hk4e_db_deploy_config`; CREATE DATABASE `hk4e_db_deploy_config`;
DROP DATABASE IF EXISTS `hk4e_db_order`; CREATE DATABASE `hk4e_db_order`;
DROP DATABASE IF EXISTS `hk4e_db_user`; CREATE DATABASE `hk4e_db_user`;

GRANT ALL PRIVILEGES ON hk4e_db_user . * TO 'hk4e_work'@'172.10.%';
GRANT ALL PRIVILEGES ON hk4e_db_config . * TO 'hk4e_work'@'172.10.%';
GRANT ALL PRIVILEGES ON hk4e_db_deploy_config . * TO 'hk4e_work'@'172.10.%';
GRANT ALL PRIVILEGES ON hk4e_db_order . * TO 'hk4e_work'@'172.10.%';

GRANT SELECT ON hk4e_db_user . * TO 'hk4e_readonly'@'172.10.%';
GRANT SELECT ON hk4e_db_config . * TO 'hk4e_readonly'@'172.10.%';
GRANT SELECT ON hk4e_db_deploy_config . * TO 'hk4e_readonly'@'172.10.%';
GRANT SELECT ON hk4e_db_order . * TO 'hk4e_readonly'@'172.10.%';


FLUSH PRIVILEGES;
