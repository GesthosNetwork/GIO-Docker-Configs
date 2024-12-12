SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET @version = '2.3.0';
SET @region = 'dev_gio';
SET @base_url = '127.0.0.1:21000';
SET @res = '2.3_live';


USE `hk4e_db_deploy_config`;

CREATE TABLE `t_anti_cheat_client_channel_id_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(64) NOT NULL DEFAULT '' COMMENT '版本号',
  `channel_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '渠道类型',
  `is_forbid_login` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁止登录',
  `checksum` mediumtext NOT NULL COMMENT 'checksum校验值',
  `anti_cheat_config_str` varchar(512) NOT NULL DEFAULT '' COMMENT '其他配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户端渠道配置';


CREATE TABLE `t_area_config` (
  `area_type` varchar(64) NOT NULL COMMENT '地区类型',
  `business` varchar(128) NOT NULL COMMENT '业务英文标识',
  `business_cn` varchar(128) NOT NULL COMMENT '业务中文标识',
  PRIMARY KEY (`area_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地区信息';

INSERT INTO `t_area_config` (`area_type`, `business`, `business_cn`) VALUES
('global', 'hk4e_global', ''),
('cn', 'hk4e_cn', '');


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

INSERT INTO `t_bind_config` (`id`, `client_version`, `region_name`, `channel_id`) VALUES
(1, CONCAT('OSRELAndroid', @version), @region, '1'),
(2,	CONCAT('OSRELWin', @version), @region, '1'),
(3, CONCAT('OSRELiOS', @version), @region, '1'),
(4, CONCAT('CNRELAndroid', @version), @region, '1'),
(5, CONCAT('CNRELWin', @version), @region, '1'),
(6, CONCAT('CNRELiOS', @version), @region, '1');


CREATE TABLE `t_channel_id_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '渠道类型',
  `enable_login_pc` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否可以登陆PC',
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='渠道配置';

INSERT INTO `t_channel_id_config` (`id`, `channel_id`, `enable_login_pc`) VALUES
(1,	1, 1);


CREATE TABLE `t_client_channel_id_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(64) NOT NULL DEFAULT '' COMMENT '版本号',
  `channel_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '渠道类型',
  `sub_channel_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '子渠道类型',
  `force_update_config_str` varchar(512) NOT NULL DEFAULT '' COMMENT '强更配置',
  `stop_server_config_str` varchar(512) NOT NULL DEFAULT '' COMMENT '停服配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户端渠道配置';


CREATE TABLE `t_client_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(64) NOT NULL DEFAULT '' COMMENT '版本号',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '版本名',
  `stop_server_config_str` varchar(512) NOT NULL DEFAULT '' COMMENT '停服配置',
  `client_custom_config_str` varchar(512) NOT NULL DEFAULT '' COMMENT '客户端自定义配置，服务器直接转发回客户端',
  `dispatch_seed` varchar(512) NOT NULL DEFAULT '' COMMENT '二级dispatch版本校验码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `version` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户端配置';

INSERT INTO `t_client_config` (`id`, `version`, `name`, `stop_server_config_str`, `client_custom_config_str`, `dispatch_seed`) VALUES
(1,	CONCAT('OSRELAndroid', @version), '', '', '{\"sdkenv\":2,\"checkdevice\":false,\"loadPatch\":false,\"showexception\":false,\"regionConfig\":\"pm|fk|add\",\"downloadMode\":0,\"cah\":false}', ''),
(2, CONCAT('OSRELWin', @version), '', '', '{\"sdkenv\":2,\"checkdevice\":false,\"loadPatch\":false,\"showexception\":false,\"regionConfig\":\"pm|fk|add\",\"downloadMode\":0,\"cah\":false}', ''),
(3, CONCAT('OSRELiOS', @version), '', '', '{\"sdkenv\":2,\"checkdevice\":false,\"loadPatch\":false,\"showexception\":false,\"regionConfig\":\"pm|fk|add\",\"downloadMode\":0,\"cah\":false}', ''),
(4, CONCAT('CNRELAndroid', @version), '', '', '{\"sdkenv\":0,\"checkdevice\":false,\"loadPatch\":false,\"showexception\":false,\"regionConfig\":\"pm|fk|add\",\"downloadMode\":0,\"cah\":false}', ''),
(5, CONCAT('CNRELWin', @version), '', '', '{\"sdkenv\":0,\"checkdevice\":false,\"loadPatch\":false,\"showexception\":false,\"regionConfig\":\"pm|fk|add\",\"downloadMode\":0,\"cah\":false}', ''),
(6, CONCAT('CNRELiOS', @version), '', '', '{\"sdkenv\":0,\"checkdevice\":false,\"loadPatch\":false,\"showexception\":false,\"regionConfig\":\"pm|fk|add\",\"downloadMode\":0,\"cah\":false}', '');


CREATE TABLE `t_client_region_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_version` varchar(64) NOT NULL DEFAULT '' COMMENT '版本号',
  `region_name` varchar(64) NOT NULL DEFAULT '' COMMENT '版本名',
  `client_region_custom_config_str` varchar(512) NOT NULL DEFAULT '' COMMENT '客户端区服自定义配置',
  PRIMARY KEY (`id`),
  KEY `client_version` (`client_version`),
  KEY `region_name` (`region_name`),
  CONSTRAINT `client_version` FOREIGN KEY (`client_version`) REFERENCES `t_client_config` (`version`),
  CONSTRAINT `region_name` FOREIGN KEY (`region_name`) REFERENCES `t_region_config` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户端对应分区配置';

INSERT INTO `t_client_region_config` (`id`, `client_version`, `region_name`, `client_region_custom_config_str`) VALUES
(1, CONCAT('OSRELAndroid', @version), @region, '{\"coverSwitch\":[4,7,8,9,18,19,21,22,27,28,29,31,32,36,37,38,40,42]}'),
(2,	CONCAT('OSRELWin', @version), @region, '{\"coverSwitch\":[4,7,8,9,18,19,21,22,27,28,29,31,32,36,37,38,40,42]}'),
(3, CONCAT('OSRELiOS', @version), @region, '{\"coverSwitch\":[4,7,8,9,18,19,21,22,27,28,29,31,32,36,37,38,40,42]}'),
(4, CONCAT('CNRELAndroid', @version), @region, '{\"coverSwitch\":[4,7,8,9,18,19,21,22,27,28,29,31,32,36,37,38,40,42]}'),
(5, CONCAT('CNRELWin', @version), @region, '{\"coverSwitch\":[4,7,8,9,18,19,21,22,27,28,29,31,32,36,37,38,40,42]}'),
(6, CONCAT('CNRELiOS', @version), @region, '{\"coverSwitch\":[4,7,8,9,18,19,21,22,27,28,29,31,32,36,37,38,40,42]}');


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
  `tr` varchar(512) NOT NULL DEFAULT '' COMMENT '土耳其语',
  `it` varchar(512) NOT NULL DEFAULT '' COMMENT '意大利语',
  PRIMARY KEY (`text_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='服务端的textmap一般用于停服强更等多文本，需要控制条目，因为全部加载到内存中';


CREATE TABLE `t_login_white_ip_config` (
  `ip` varchar(32) NOT NULL,
  `desc` varchar(32) NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='登入IP白名单列表';


CREATE TABLE `t_psn_region_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `psn_region` varchar(64) NOT NULL DEFAULT '' COMMENT 'psn地区',
  `region_name` varchar(64) NOT NULL DEFAULT '' COMMENT '区服名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `psn_region` (`psn_region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='psn对应区服配置';


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
  `client_secret_key` varbinary(4096) NOT NULL DEFAULT '' COMMENT '客户端首包加密密钥',
  `server_secret_key` varbinary(4096) NOT NULL DEFAULT '' COMMENT '服务端首包加密密钥',
  `official_community_url` varchar(128) NOT NULL DEFAULT '' COMMENT '官方社区URL',
  `psn_region` varchar(512) NOT NULL DEFAULT '' COMMENT '支持psn地区',
  `user_center_url` varchar(128) NOT NULL DEFAULT '' COMMENT '用户中心URL',
  `account_bind_url` varchar(128) NOT NULL DEFAULT '' COMMENT '帐户绑定URL',
  `cdkey_url` varchar(128) NOT NULL DEFAULT '' COMMENT '兑换码URL',
  `privacy_policy_url` varchar(128) NOT NULL DEFAULT '' COMMENT '隐私政策URL',
  `rsa_key_list` varchar(128) NOT NULL DEFAULT '' COMMENT '该区服允许的key_id_list，包含0时表示全部允许，以逗号隔开',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO `t_region_config` (`id`, `name`, `title`, `region_type`, `area_type`, `dispatch_url`, `muipserver_url`, `account_url`, `account_url_bak`, `sdk_env`, `account_inner_url`, `pay_callback_url`, `resource_url`, `resource_url_bak`, `data_url`, `data_url_bak`, `feedback_url`, `bulletin_url`, `handbook_url`, `stop_server_config_str`, `stop_register_config_str`, `region_custom_config_str`, `client_secret_key`, `server_secret_key`, `official_community_url`, `psn_region`, `user_center_url`, `account_bind_url`, `cdkey_url`, `privacy_policy_url`, `rsa_key_list`) VALUES
(1,	@region, @region, 'DEV_PUBLIC', 'global', CONCAT('http://', @base_url, '/query_region/', @region),	'http://172.10.3.6:21051/api',	'',	'',	2,	'',	'http://172.10.3.9:21091/recharge',	'https://autopatchhk.yuanshen.com/client_game_res',	'',	CONCAT('https://autopatchhk.yuanshen.com/client_design_data/', @res),	'',	'',	'',	'',	'',	'',	'',	UNHEX('45633262100000008816A7B400B7F1936C9B0D273AC9FA4000080000941546038F8DDF7AA6142650684D45D56DBBC2488E2655565540F7DEB3883CF7F16FE234E9B9AA2776276623295354463EDBAAB7CEC1722D461298B117C642A4AFE85F03A9F783EA408BF2570A3BFB31E3BF87892652F11F245A1828CE4BB34EB5C9E5F9350D12CDEC89F07471CFE19D43AF8044009F7934D8619FCB40DF38FEEB5A9B9CF6C3FED763698900C8D5AF9248F2BD72C372B3754A6C5423D64A79BB39E2AA7754E3EF108B73E48576160C19D9D2679AD79147E962C65FB7F6531D8D87AB3A0FB8338F814DEF2A8AE35AA138DE95A645A4C4DC9909B6E90F09C4CD7CBDFB72EE887D833192248298776915F94084A1FA92D51A8B25831AB478633091C31B7A9B2E877628405B15369A0A1164E5E78141098AABC99F76192DAAF9EFD381537B9E101A0E6F40DC0AECB4073D80B6066DA271AD345B60D70F02064DB14BE0EA9D8098FDF30D7BEF8A422D2640559B288EA6320460474FEE23BCF6291FFFC62A07C82CFACE0AD8DCBDC16D30C3EB7D970CD4B458D49753027EE2E053E0F91C59E2FE36D7476F3EEACAF0DCEC6D4B42990EB55F703B53565C47FC2E949D41CBC055AA1D5D05439762DA57E324E77CD477BCCF9C163B813F45A79347B4FEDDBAA789554954B18ECA8C147FE89ED88619793FADD1107C2BF603C62E937BAAD7D055A5862284F259BFB0A1EF5523E972FBE6BFD46827A75862DECB557AB14A37F714D2C610B471AB5E16A82F907BC247610863CEC72364116D20DE90641D8503162A389C7BAED68C8F0652C8036E0A0D3225542158CC5A5DFE0F2968B988044514E0FE90CB38C8043AC7C74114C469CC5886BA5881EA3244FEF5D164E1BA6F04DB7E4D2A681BEF1C47A22E222D44898DBA73BCF8AC4494CE5318010D457B6D49524C4CF3BA1FF4DB9EDFAFF4B5B80F574033828B40A32604E6C1DFE94B93A61B619224722A0B7F4A27C6743E14E6A633D2103599A5CF93ED9F3793825CC9C382F097FC2F1EA9376FCB9EA288B196F4285850FDA84290819166C44660E1E66C86E7A4FDB3FFBFC55470B1645BF692A13EBA3C014281AE99F924AE200940B348302E014E853616D001FF45E03D4AA1567DE01C6AEEC9F0822CBF3E4807E3F50087AEF6192E2976017C61A33EB9158ABBEEB3385F35831FE43221BCE7E230773B934DCB833442A600CF7C13A754C016779819D7099D15036914307024209100A25DF4C7B621E87074023ADC4398B10D3384FB4390B0E864B7D9D6A1284B6D57DDEC8C33DA7C829A061B8248390C513796B842C21BF6640A7689FA991AEA2B459349FB5716CE7AED5D243B9DB238085B493ED49DD2F6F1BD4F2D849E238635926C7A2B7B939E373122244F24D5A53F43F31E9B1CDE38F844E9CC5BF96BA6F206128902E77974212EFC24A525CBDA5CB53D5E7E866744DF68EE6E69F219D2CA682A7D6AE2EFD8A0AB942B25E8BB5FC97ACE08642594A310F1031B95D0569325825F5F4AB61D531C729141B7B4CEBDEC5A5023373F8EDCF1A7D2DCC7DD496F6B1A563689A92C6CFD499C6E43D32B7B2F1C68B8DE1D7D77EC5103B8E75F1BF004F9BA0A110444ACABF95DBBB18BFC21F98AC0CE410788FC68B93EB8DE9FF39E59E731E4C90F8C9A8F4A7B2FE9256638B16A006D4844D7F4CDA52AE392E5FA00D0AC63CB99112DBE0F039FD3D4E89347C185D09DDB1E93E782DE6F41EC79579ED20FFAC769544FA094EE70AD581EABD690A3D667E2DBE45BF12CB6DAD4A23300C8D99BE0211E18C987D197C85E0DD56D868CBDD245C4F1DA8156A7B733A9B6AF18D2F01FAAB8B3C04E75BB29CFFF3A950B072BE7EC21E3EB9A26E9DFEFD607322CC2A18BEA6A460D53A285DA913A02D587DDC9ADBF3AE117A462255AF2714F116A71562CCA7BFA39FC1F9CE28E0754B662D63E2CA75614E407D3023122C2B5D53CA7B60B3235F6CBB3B6AA49ACAD58BF04BA326C8ABFA4DC2C41296B69116205092B692F0BDE634BDF2D5417D5763878D6514F7652BBB88779744110AEA57E2938C618A13BBF6841E74D4455F0A819693E633A51E593786C5733F329D9C730C933406B67AC202E3635DE220BE58C261BA5B79E052D8F0D132F47E7BCD1BFA06E6161098B4449DCB230A8953F9C6A84157416219B10F69F046779C4D480D5F79F2AF09B14ED819B3B407246FBFC8A5EDF11486B1A781255C8698F3276CD515DE5F6B7C80B8E11935BCD06DD46EF33DA02E615258A4C2958E69B51DBACA07AF9C72D7C39770F41EB993F2A01295DAE20055945F7F37484D0E66789647DE199F4CD370895605759CC7DFFA75AAA2C445970D49F885ED76BE45134FD78F278F6757F7D2385CF50A15D90734591D4453AADCCBEEC81D25F25BCAD6976BD114ED9A5666594B1CAE161C75904CB4EAC90DB439F7FF48958F3FC818570BCDBE4498AAC095825C05CF2E031611A03383CF56E44747F7F49F77B365B5EB0977B735250B1F0BF9C5B8A6C67C42E1EB3F88B5D3AD7D0255569B7E01C71C291CF45C45275DCA400C2295E353EA74A76A436A1AE88253DDB3D90A008F6EC387B2BE0E22F3F56AC855FD3DF36AD033D8C9E9987D2A05642090166BBDC0CF349D675F5D2D3F74790B43B001557FC008DC769C944AFCA91681567950F44A5AF7B0A732B9D24E4D7D9F71D59098172C5C48ECC6FE02F4EFE356838C2A4290B48597FEE2B4C0C502C0EB5CF85C29A587B694B9033643973C6336A3B97837184E5689EAD9CE7728171B755172D488BF64905657DBCD7B48311EA833ABCB30659AE32CD7A27743DC0CC5D41BEF9A43D94581F445BB3418AC406E11CFBD93CCED2CC3E751B74FD57556587E08C90DD977AD03F50F2BFAAA27FCEA09B489527B3366714FF592A89A78865BD9A489BFB'),	UNHEX('7B29A3FE7A61D1BAF5887CE4A9BA9F38ACCF351ACA1550C95DF9D47BF102DA504C678B2BF37E93E578C11D66A18572606B2BB23B0A5EC61330FAE8BEF1B526D72FA8EF1177F2B2AEEF81FE13E7C14E4DA3FDE5968E7E160C497ECD3CC20C94F999A54B23520E0219EC1A512078207FB1BEE182361170277E4A30B05A47E2B36257FF7FF6BB1754D553B8F14988218F4132EFAB1DA5E446A221664EB4F0BC5E03D98B27EACDCB05BC957D0E2FF50B83BF753F98C6316E9125A0AD984C624B4D110BFB8CA045716653F46681A44FF1762825676EB74BA5CF2813E3CEDD50C6A1042EC9D7976EA17D0A1F52DA962AFCD30C174EB99B57DC89A6BCBFB0AACA19B4AF9A9190A6182C900EE585D1A41A07D8709F7265C170F256198DD07396AD52E4F6ED3D06F03CAF1EB6DC14B9AEB765AEEB634F0EEA16A6BE2FEC9E56559D9F5520B251DB0823D0BF1ED2AEF21C66D0B74C32EFDE76DD0EE30B19F26D51B6FA2955546AE21C45F30028FF1D9292FC603E09725A2A6950EBEAA27787DFC850CA4D9F2C15CC619ED954CC994A1896C69134ADB8F9F28D397FA4B30A521781A8FB69D651106C4D7B74F4330613563E48017B26B4D856E2001984E679084DAA1510EB5BEFEA48F3FA727833E73514987174DDBEE4B18AF788075430DD9D4291CB363AAC1624D125C58089E910BB1DBAA18C7E1301288695CAEE7CBA09A036FECAA4286691D84DF76F05429916916A4C1262D938E2B629251F27A5A3891CAE7BC8DE3B325DC3F1938AE2D98642D52ABA83C2EEC6BB0C28B2A8EAA516190D1DB6DCDB09B495E0446C2611C77BC657FA31DB37DC41D40B853A2DE04D246C346922AD92B9CC3BCA265F2D15A4651E339F44BCAFE091DBF1683392F607610673D463248F4F345617BD0FDAFA7FA89906043B1BF941211CF8FD36D6D31689DB19C28BA073C0AEF8939BA4393A8D8D6EFCEC66D22D94926DD2E7F2556AE5A7E43DB8B92B21F838E36591B9EF876911D4BF2BFD07E9EF08B50547135BAAF4E489BCCB67F2DD49A57CED26312D7D98F1562AC9D4B0A3E22A2F47629363FBF6412C6FF7E225EC52EF7EA985953EA79C91E8AC8735EB97D982F250676ECBD9CB7AE2F48616CAD3242895F9D240F9FCB0EE4389E3C121D44C0342E12063D51DA4289F2AE857CFC577D4892E8B526E6EBA658C2138BDC3092CA7C8EF400FC483C2A628CD048AE08ECD8A62AE370307938FA4DBDFD37F89A31B631F51D20CEE9F708AEC5F7DA0AAB855695F619B1BEA44262A013FE00B2DC029E8CB04AD2BF97F74AF8A876DDB32403C4F43654FF200D80941D1030677881AF5789C3098810F1077F017CE41FEF7C73941B49A1EFCCD45CC864182FA63D0709D36257F42E6AAA2E49D8DA2B2E11C3C4C7E5B80B10DCDBBF0CDCFD592F32CB6B3BAE1A865044B020EA7D0D3D6047F255AD5796E55C86FD21E232E365B110445CFE0EE933470B3D3FE80785D5DB3F31D12EC7DE9359EADCBBEF85BF7228FA3FECD05DE155B38471259DE7B3282A1173F6B1A4159864E05E7486D7B9308DF9B57AFCECCC946D02374B7AA8926E5BC7D2DF6B1C9B51981A6FF79E3BB3BBE514596A04DF7CAD24002A41019E54F8A374713B0ED14CD02AC57BEB24AA88B9B403E868A65AC22E2D2C63141268873E6D143E7720964113D034C76C850AC6E42D7B11C3263C049087E43F07619D02C37FFEAD0066D57B2DE8776F2B4D5C50B4D39D3B80C74FB7441C57E35CBD72B3C9B10314D94995C9605D7FDE1C0F57AD9A3D803A550B0C6466FE1433D4D6ACFD6CF0B2FD401B4067CA20823394EDA97A50577B0B3F800E85539FE39434195F824968B56D428DB44E2685A577CD44EC50756E2F85EDB9C6FE7A67E45EA3B7E8DCB7EDC2E20021DB6B0998DCD1E5160C6A42F0A5649ABDF968F5FB7A4AB87499176446472ED3A6A0EDF6F9FD5903FBC1DF77FEEE31AA9CAC49EE13E750EB5C4120519401DE0290FDA274902B27EC658B4857247B750971F0007651E5EBF9E66293B04DD907AC5EAFA56FDFECA2137A4B6C0B7F535B996579A193F96636E0ECADBA36240624D787793D503B13CC29C910A47A407770305E5BDF014912C7538931869521201B2C39319F1F3516F2125B2C3D19B0A640D7184E87FBBEB665815B545A7C664419BEB7FCFAF9CF6B343E25231352764F4075A72FC170157BE7C68C0BAFB4401B6A4771A844D2E1D00BAC1AD10D46420F5780693C9C7BE59701255EFA3E1495E4B46879264BF01D0B66C89E83CE71B629EB3F9BBA1AEB78DBC107D6AA20145A495D6C221266AE7ED380BBDB32C292576A30E1386DDA2D7B707EBBF196DEA284B5184312263766327054EFC07CFD9D3412DC1AE7EBA5E27CA3E0E716FBE8624ABA84E0EB370A15F867D38CD6AFAB0846E345DA0078C42A509ABBB108B5C1B3172A9FA26651A3883DF304B03E3B3EEF4B1F77CE5CC282493A29FADB325EC333980E05609D91F861BE3E78BBF6D82725F1D5DCEE07F5FD4EE28CF61AACDE885096C1A9E138D71664026CA205A721A497474106B02F056F4958795770B62F9CEFAF24E8550A6BB3AC0B94CFF3CBE9C438B945CB3AA36A68B649D34DA462344B6277D9A8DFD87109D10D89772DD0861C45E83E70A195421ABDC6525DDA1B8F8E0FD72D198EF57C3B05F6036F47D3868EFF8D1FF86452786FF8A1E24FFE50913E6FDB0739BF600FB21820A294C7A7C9079D1FC0B0EF4EBB849BACEFB5EF40E578A16661A0DF601A01E77ADCDB225688BB15A59091252825531F72AC091577BBC6DAED1F71A02C1F4F9CE632289E3C8069AE1E3A4EF6D0B6A19B44CF85539B77BC07872094FD49945BD52EAFFAE6A3B58AED3BF1BAD0857DD790DDAF41D2F40465323F63B5B4AC8ABBC00C9EB02AD66BE4FC03F31ABACAC7B9CEA3CDAD7BF61B8C1AA1B2D16DF91CE5CA014794226313FCD43AA9B0A89379453B2BEC3F5506E8B9055E4284F7F0883AAEC64A240E998195C13D4C9D0DAE1C156F63DAD96BA5ECE42A2DE1227A597985DBB8C97237FCEA7ED5375BAB6E470EB8E519D783A3FDDE149A68E0E9ABBD27EE055F2913994194D3D6C84DFEBFDD0A7134AA1837291CB0BD2879EC0B6FAD82AC4A6493799CBE374D3B64718721D4DBE687A714AA05F234D93AFEAC3D516F8140F25CAAEDBE44EE2F24BC282421C3A62E6597B2C878C44181C17F4A176366E26219EA8E354C85FB5C469716F9283C2D60BB964441F74A2E8C8BAB2FB5A959E6D3A202ACC6000AA6AE99070A6C3F0571888F87EC778FC1F69C451C6FD8EB4E3B2A7C49CB9A3EC817EDF2940CB0EF2A4492C5DE95EC10C156FD7A7F45A2BD5818B04D65090595F555920C64EDFB3D94D68FD6AAE7367A4B558E03A88E2A23AA491B62F2CD45794FD6043024128732EF742BBD105DDF0323E31444C087A720E4751BCB3D3786A0AE9B86A2E6FA06C2261428F58A0E35F8E57DABB892773DBAFF37AA5A52381EF4B68046A9881A1F8C8CDAB5DE21215209809A9DCF0A4232C45DABF3323C85129612DE56B1AE194B71194E2F55F8A61F5A34B128ABA039E424A4081B679ACA2BED9A7D9F4CCD5AA91D9097250F361EB34EF5C602D73753A096348A5F510DCC9601A6CF0E530DF11692A8CF83C9E2D28C355D6FDCAAAC44BC0CB99C10FC7E5ADE64A13E8C7A1D19EDE2114CA1ED5A9924709CD7306195993CCD536654DBFF77111954C3178A6556328C58F19720C7C57C2BF7C070B693692394428C987209339BFBCA6128414B7CE9CAE746DDE384BA6DA441A5D6F36FA909C2BE8003C64A7097CA4512146B8F8118DC1475088911FC61942D56E9416155878AEC4FFE3E9180F829794F9727F05F4DE487A0D2A608C29222C178C7491A1C80331DFD5AEDA850F28CFB5AED74038ACCE12E228664634CCFDD5BCB92B1EE56798F7107FA8FEBDE00369C2D4C18CDFC2A805F73C0C9DF5E5A437A5A44C44E55D364495CBA8BE7DAEAB545B2AC3F18BF7CB1C6734F04D6D5D92E7BD491E7CFE2E4103E9D68176F1C8E1E894B3E4F51B66FEC3E3FD528491B44D8CED4D7B6A78141E770A29085E145539C6189F26AC8684B7F44EDF5EE170ECDF69BAB56ED65833870B80DE51E439ACA214936E63C54271031E6AF26814378E492C33C27AFE9A02F8388125B4F8880837BB7FB4089174B32C251B820B8FFE6B1591442F9CE5846E7B91F65DA11C911F5220F40126D9D49A9B194277E828F61344A4BD8C0C6B890016220D80DE4D8C243541BD2369F3D1178EE455565FC737B87E0D210ABEF22484102AB95F5AA9DEFDA989FD570FB41BA61D9C4AFDD6A69CA3B4B18351F42B67A3F6C8C352AF8ECA3602E8486431F45F1CF3DEC95C5BD3FB4818116B2B8415261E267DA154E8C976A8D0F576B1E7D023CA8193EA378A873E40C880733D6489F18BFF5E5793CC980184C458C94EA55BDD48FB45D169EDCA49DBF78527D730F83BFA757142013889048D7F4EB0D44CBA3DB49314076D3BC0B31D252671C302498150652FEFFBC255192036A3B738B14A7345E5C938BC43D0319716DE5843E60002445BE53D8A0AC369C813A30C420EDA7A582A799251254FE592F1979E83C6AE24C7D006FE69F2BB6858BCF77F3E96BC665856002AEC77A4711F8161894B925ED904789958D7974111E32FC8F3CB0B186231BD80A5593F20C4B3F228B8419FFE28E2A7BE493E318291ABB6148D6A970ABEC3A6EF1B78707876622BE8503C322410B57AD94E5FE1EA66C814F957A666C2AB057E61BB0B2AC67A2720085C2C3BCE477568DC6EC6A49890B27B6324E173BE7B6BE7D14A1D492FB67540F4968B23D45AE38967E80AD4C9BF46953AAD9650E2B913F714C1DB914FD7AE82F7692E0DA8AF8922A25758E7CAFB2643E80A8378DABE16A1010DC83968D59534786E38D68CD0A50B287ED5826653EAC3A65BA1A2996D6AA60E488AF43E4A4FA0309263469B64FF730AF640138CE86F196408378495C8E95E777EF46A8DB4A1C1EF0073D4A516E6F769FAA80B32FAC8B8DBFE318DE993A2994149BE930122D1182DA8513D423369E22217B96DEF60865CD0BE375F97832F95FA23F2063900DA573121D9F3AB71EA8070DA5ADA7D7786D49B6CBF813E4DE05B49A0F5C4ECE82C439A89ABC0181F706C78ABAC7BAE5809B9BBAD8DDFF31FDB5F2911C55A7E3CF8548D9988B1287607F22F9B25E1F80D3E84379677E203B054134C2CE5751BF563FCFC37B5E4288F053ED14DF564260FFD17A84B96687A78AA6AC830611AA1481B747977F97A9C48F77F9710070D88E469BA085F8B38C70B939EC39D114C4163EA837243FAF6E1C04481B40D14F113BD6BB2394BE313D01DD322B03B70DB472E932638C073C183ADFE9D354BA1AE3EBC28858F69FED5E514955CE433328EBC017276D7E3B1EC411F9D0839E5F9717CBEDC440D04A2889E3A6C5BC5D009D0C485EC4AF45C536D53CCFE7D7E424AC32DEE32821DF172EBD13DB26A3A8A2B5BC21E1CF0E260B2C42D5D4F0D5D0662EE97CB2B6E7A1FD441496BB7EC3DCC19D504424A8AD4204EC51335307F6323F75E8384B2D6F0FE9A4FF2AC95E055FDC0745F8563A7A1837EE6F0226C9E2047D043BFD7EEAE436C457653D47D427A17D70031990EA61349AD562DBDD6749E6E238EC3826D0737B42FE8A7810CA4345AFC848CB47D5A208572376417AADB1C83F0088392E589438930BA2E32C5C8ED722FBD26A91DE9D3879FD9E93F5350909049880A128C23500C62EB54B43C8E85790EB90ED18EC1B15300A98E50F4B57AFF'),	'',	'',	'',	'',	'',	'',	'0');


CREATE TABLE `t_sdk_config` (
  `sdkenv` int(10) unsigned NOT NULL COMMENT 'sdk环境编号',
  `app_id` int(10) unsigned NOT NULL,
  `account_key` varchar(512) NOT NULL COMMENT '账号校验key',
  `account_url` varchar(512) NOT NULL COMMENT '账号校验url',
  `recharge_key` varchar(512) NOT NULL COMMENT '支付校验key',
  `desc` varchar(512) DEFAULT NULL COMMENT '描述文本',
  PRIMARY KEY (`sdkenv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='配置sdk环境相关的配置';

INSERT INTO `t_sdk_config` (`sdkenv`, `app_id`, `account_key`, `account_url`, `recharge_key`, `desc`) VALUES
(2,	9,	'74vnFBaTeUostnTxXLn4dP8CD5bnWURqNHX7',	'http://172.10.3.253/inner/account/verify',	'-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqOp7Fg6qLvkv8lw7OBD0\nHxbPnegrGuElTiUgT0Cd9cTEpNPYkgbDNwsK8ee+RRKiaAzHb53E3ouxorG90SSe\nRJh0TsZOs1zCwxfmXjwhJ49tzMS75QOoD/Xjah9B6gKueT1FR5ANj8wJdpKe/q3W\n5MMggN80wC5Q6THDsHCQz3oHwFFQGKof98twrDq1Rx8+bQKeBt00xG7IiPJ881Zg\nJMzhr+ISQhUhTU344BK7slHukn6poTN6Zd+DG8K/iUR4Xb67ubyDdhqCD4QASJju\ni+Un+Os0NUR73iRYicB5LF9s1Oqg4WJcQj8loF4wh2BTEeXNl5AYB6jxLCNO4112\nhQIDAQAB\n-----END PUBLIC KEY-----',	NULL);


CREATE TABLE `t_security_file_config` (
  `file_key` varchar(64) NOT NULL,
  `file_data` blob NOT NULL COMMENT '安全dispatch文件内容',
  PRIMARY KEY (`file_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='安全dispatch文件配置';


SET foreign_key_checks = 1;