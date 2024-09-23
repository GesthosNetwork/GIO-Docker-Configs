SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET @version = '1.0.0';
SET @region = 'dev_gio';
SET @base_url = '127.0.0.1:21000';


USE `hk4e_db_deploy_config`;

CREATE TABLE `t_area_config` (
  `area_type` varchar(64) NOT NULL COMMENT '地区类型',
  `business` varchar(128) NOT NULL COMMENT '业务英文标识',
  `business_cn` varchar(128) NOT NULL COMMENT '业务中文标识',
  PRIMARY KEY (`area_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地区信息';

INSERT INTO `t_area_config` (`area_type`, `business`, `business_cn`) VALUES
('global', 'hk4e_global', ''),
('cn', 'hk4e_cn',  '');


CREATE TABLE `t_authkey_config` (
  `version` int(10) unsigned NOT NULL COMMENT '密钥版本',
  `private_key` varchar(4096) NOT NULL DEFAULT '' COMMENT '密钥',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='密钥管理';

INSERT INTO `t_authkey_config` (`version`, `private_key`) VALUES
(1,	'-----BEGIN RSA PRIVATE KEY-----\nMIIEoQIBAAKCAQB62b+/gK3AIdJA/Dti7lgC/PjaqWYAQwSZ8sMqT8m2ksOj/1p7\nvwEiN5aQnZZx03V0hVgxHtdr6q5NRZ7rOF6g5hn9OVbvMacMiqvUQr9tL0XF67Ew\nIqaymsujkTyXwvpgLYvNHZ1YJbs3wcbg56WjV7BuhPcsoFeXvpvlbTQvemr+jGIk\nr2qhfaa2k0IFPugiT4/7Zqroy1NECCroz0SVeX8goiPeVMde7JHbCnZGN2ar1drH\nv3Jk7pPHiVMAgKk+JS5T7BU09qxX7HlhOzCwLD/d9fTP8lQdC+Rzd+KToKHeGed8\n/ZucnwKyB0C2C4k/wXg0FLezica4HRG/oFsbAgMBAAECggEAS5+1aNZ2ntpzCmv6\nxri/1v8Q1dIHp0uaDoahW2+IVWpdIpwzgA+hTAX6GoXXsbQhDpxzILHCnHz31Ttx\nS40Eu3lKMFZWzKG9GnxWsDBylGzQP7kJ9v6trS6bAtKKAUYWSJRhBeAgFr4LVJRl\nr9cJYNa/Fhml6oO9x/yfDQk/YaXYzg0b4YzuLUfc/7lMXC/xBTPsfLQylzCdYhxq\nOQlKwCUYTsvGz3dZdBPmUYGR6qFRvbkHKT8sOBuwDvrUotejQroj28kwPa08c45j\nlafeYo3Mu4dN42o7jOuYkoMcN0YWUE7n6Nh3ybsfS9EIQgLS8nuxiBfKUJpftApR\nRDPLiQKBgQC0knh1MGg3whw1AlMRbwr1Dh//cvVOVzDiiUeiHc5vJWC2dle4awf9\nO1hMFXRWOUvyGf/417jzfDZAjmTuPTBWpDMpTA2ZA7/gc3EVBstJ9m+Pfj8F5/fX\nhZXTaLD9eT9OprIFv/DTHysXuei4fkMJjz0bRPuzR/WKJCPuODZcvwKBgQCuKs7D\n9sEMZEAo52AQKf7+ib6W+EKpnUphe5iCt6b86TdMAcBa3io7Z62DRUrEx9cXCrOK\nfmFRMZSkjoQyA1UoR8LbBF9TZBcF9liI6O/kOQJjFsJXBr24uLEtzlMVVvqF2Gk0\n5iKdQz0snvywzDMZO1KbcHnRDNqm023OigpspQKBgFN32UKia6pKiete9bL7V19L\ndjMImqfp2ej9eCVSDdiGuJvfPFE8+GZwBjK1QB+TQK3aot4OKaozYoiYycLueeey\n4wtV4ns2pn1EH6OOjm3UAmGcA9nhDkmLsGQW4qloYIEkwOmzfci5gZvoDdEqXCaR\nFbgDPS30N2XxqsI1LbvVAoGAVsroXQmTbGxs+LVMzuFOvGPCQZOYDNRgY7Hm74U7\nxx8lOlBJHj9GRnJFKnyWZPe9fTMNA8A1GPQfQd3vjMjSYA9a0DAenPzs6EC6IAgM\nu+uY/+4wjJPEadBIIy6FgsXkdFzDGORybXI7gwf7ntMzx6gjY2iqm/3O3IHSX7G0\nvi0CgYBTMExLuWbvJ0mILunOANEQXFyj4avmYlSdKgKb1tTGPgZBRlLYDYo9eYc6\nIgVxfnz5N3KfqqgGSiDlbPGvgWFZSlSLB9Jmxqj/M3y000yDko7w6wXMevwSdaau\nusXcSSEObTBQHadCOPabjMWL7kKdy7jlLl/KAz/SDXbmf6AtZw==\n-----END RSA PRIVATE KEY-----');


CREATE TABLE `t_bind_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_version` varchar(64) NOT NULL COMMENT '客户端版本号',
  `region_name` varchar(64) NOT NULL COMMENT '绑定的服务器分区',
  `channel_id` varchar(64) NOT NULL COMMENT '渠道类型',
  PRIMARY KEY (`id`),
  KEY `FK_t_bind_config_t_client_config` (`client_version`),
  KEY `FK_t_bind_config_t_region_config` (`region_name`),
  CONSTRAINT `FK_t_bind_config_t_client_config` FOREIGN KEY (`client_version`) REFERENCES `t_client_config` (`version`),
  CONSTRAINT `FK_t_bind_config_t_region_config` FOREIGN KEY (`region_name`) REFERENCES `t_region_config` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户端、服务器绑定关系';

INSERT INTO `t_bind_config` (`id`, `client_version`, `region_name`) VALUES
(1, CONCAT('CHNWINCB', @version), @region),
(2, CONCAT('CHNiOSCB', @version), @region);


CREATE TABLE `t_client_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(64) NOT NULL DEFAULT '' COMMENT '版本号',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '版本名',
  `stop_server_config_str` varchar(512) NOT NULL DEFAULT '' COMMENT '停服配置',
  `force_update_config_str` varchar(512) NOT NULL,
  `client_custom_config_str` varchar(512) NOT NULL DEFAULT '' COMMENT '客户端自定义配置，服务器直接转发回客户端',
  PRIMARY KEY (`id`),
  UNIQUE KEY `version` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户端配置';

INSERT INTO `t_client_config` (`id`, `version`, `name`, `stop_server_config_str`, `force_update_config_str`, `client_custom_config_str`) VALUES
(1, CONCAT('CHNWINCB', @version),  '', '', '', '{\"visitor\": false, \"sdkenv\": \"2\", \"checkdevice\": false}'),
(2, CONCAT('CHNiOSCB', @version),  '',  '', '', '{\"visitor\": false, \"sdkenv\": \"2\", \"checkdevice\": true, \"devicelist\": {\"ios\": \"38;39;40;41;42;43;44;10002\", \"android\": \"\"}}');


CREATE TABLE `t_deploy_textmap_config` (
  `text_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'textmap的key',
  `en` varchar(512) NOT NULL DEFAULT '' COMMENT '英文',
  `sc` varchar(512) NOT NULL DEFAULT '' COMMENT '简体中文',
  `tc` varchar(512) NOT NULL DEFAULT '' COMMENT '繁体中文',
  `fr` varchar(512) NOT NULL DEFAULT '' COMMENT '法语',
  `de` varchar(512) NOT NULL DEFAULT '' COMMENT '德语',
  `es` varchar(512) NOT NULL DEFAULT '' COMMENT '西班牙语',
  `pt` varchar(512) NOT NULL DEFAULT '' COMMENT '葡萄牙语',
  `ru` varchar(512) NOT NULL DEFAULT '' COMMENT '俄语',
  `jp` varchar(512) NOT NULL DEFAULT '' COMMENT '日语',
  `kr` varchar(512) NOT NULL DEFAULT '' COMMENT '韩语',
  `th` varchar(512) NOT NULL DEFAULT '' COMMENT '泰文',
  `vn` varchar(512) NOT NULL DEFAULT '' COMMENT '越南语',
  `id` varchar(512) NOT NULL DEFAULT '' COMMENT '印尼语',
  PRIMARY KEY (`text_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='服务端的textmap一般用于停服强更等多文本，需要控制条目，因为全部加载到内存中';


CREATE TABLE `t_login_white_ip_config` (
  `ip` varchar(32) NOT NULL,
  `desc` varchar(32) NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='登入IP白名单列表';


CREATE TABLE `t_region_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '分区名称',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '显示名称',
  `region_type` varchar(64) NOT NULL DEFAULT '' COMMENT '分区类型，线上、审核等',
  `area_type` varchar(64) NOT NULL DEFAULT '' COMMENT '地区类型',
  `dispatch_url` varchar(128) NOT NULL DEFAULT '' COMMENT 'dispatch的URL',
  `muipserver_url` varchar(128) NOT NULL DEFAULT '' COMMENT 'muipserver的URL',
  `account_url` varchar(128) NOT NULL DEFAULT '' COMMENT '通行证URL, CB2后废弃',
  `account_url_bak` varchar(128) NOT NULL DEFAULT '' COMMENT '通行证URL备份, CB2后废弃',
  `sdk_env` int(4) NOT NULL COMMENT 'CB2启用，0:国内正式环境 1:国内测试环境 2: 海外正式环境  3:海外测试环境',
  `account_inner_url` varchar(128) NOT NULL DEFAULT '' COMMENT '通行证玩家信息URL',
  `pay_callback_url` varchar(128) NOT NULL DEFAULT '' COMMENT '支付回调URL',
  `resource_url` varchar(128) NOT NULL DEFAULT '' COMMENT '资源URL',
  `resource_url_bak` varchar(128) NOT NULL DEFAULT '' COMMENT '资源url备份',
  `data_url` varchar(128) NOT NULL DEFAULT '' COMMENT '数据URL',
  `data_url_bak` varchar(128) NOT NULL DEFAULT '' COMMENT '数据url备份',
  `feedback_url` varchar(128) NOT NULL DEFAULT '' COMMENT '反馈URL运营方的需求',
  `bulletin_url` varchar(128) NOT NULL DEFAULT '' COMMENT '公告URL运营方的需求',
  `handbook_url` varchar(128) NOT NULL DEFAULT '' COMMENT '游戏指南url',
  `stop_server_config_str` varchar(512) NOT NULL DEFAULT '' COMMENT '停服配置',
  `stop_register_config_str` varchar(512) NOT NULL DEFAULT '' COMMENT '注册配置',
  `region_custom_config_str` varchar(512) NOT NULL DEFAULT '' COMMENT '客户端自定义配置，如果和client_config有字段冲突，则以client表为准',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `t_region_config` (`id`, `name`, `title`, `region_type`, `area_type`, `dispatch_url`, `muipserver_url`, `account_url`, `account_url_bak`, `sdk_env`, `account_inner_url`, `pay_callback_url`, `resource_url`, `resource_url_bak`, `data_url`, `data_url_bak`, `feedback_url`, `bulletin_url`, `handbook_url`, `stop_server_config_str`, `stop_register_config_str`, `region_custom_config_str`) VALUES
(2,	@region, @region, 'DEV_PUBLIC', 'global', CONCAT('http://', @base_url, '/query_region/', @region), 'http://172.10.3.6:21051/api',	'',	'',	2,	'',	'http://172.10.3.9:21091/recharge',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'');


SET foreign_key_checks = 1;