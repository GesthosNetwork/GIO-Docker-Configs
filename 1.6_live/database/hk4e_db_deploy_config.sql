SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET @version = '1.6.1';
SET @region = 'dev_gio';
SET @base_url = '127.0.0.1:21000';


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `t_region_config` (`id`, `name`, `title`, `region_type`, `area_type`, `dispatch_url`, `muipserver_url`, `account_url`, `account_url_bak`, `sdk_env`, `account_inner_url`, `pay_callback_url`, `resource_url`, `resource_url_bak`, `data_url`, `data_url_bak`, `feedback_url`, `bulletin_url`, `handbook_url`, `stop_server_config_str`, `stop_register_config_str`, `region_custom_config_str`, `client_secret_key`, `server_secret_key`, `official_community_url`, `psn_region`, `user_center_url`, `account_bind_url`, `cdkey_url`, `privacy_policy_url`, `rsa_key_list`) VALUES
(1,	'',	'',	'DEV_PUBLIC',	'',	'',	'',	'',	'',	2,	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	UNHEX('4563326210000000004FBF41742000ABFB852672346C00810008000075A1B0BC1DDCA52B26FECA5BFA98FD0188ADC3E196B93AEE59F14FB343CD30F11CC4058A5456DB9D9850E0F3A34CD69A5777C2CF0C97E422284CECD4EF956B849D97880AB29AF4A48E5520503D6BAD78943524D47DC2E78D8F1C679EE2CD988021A2A206E0AFDA863093F03971FE69E4687050B892432977B7EB27D9C17D9F2ECF6EBB44869D738BA794B977E70BF426FBAEB043F221942AC740944D37AB68D6D0823C8E4B6DA9FD1BE0E4D3469D3586747AAB3D45640FEDE8A416C1EA61DAC04B668BAAD7266222B3FDD71237B9144CFB59A96D35158107429E15FF82A6DF3369A31260D3D088449875FCFF616979BFBAD5129C683AD4C1FCB6F9CDA8835E7952C0387AE77402A9F2D0BA616DB44C28D6754F9286DEEF633F742AF404FE40D82D4564BEBA19B899E89478FF02A375CF7AC1C6173806BA353261113C3D226B9922BB00F6F5C7925EA24BA0A2C93CDDFCCC42E0F326BC1D7EFE04146CFBF4C8035BA973E83F86783F497C991269896AF7F47F05EDF7070088CAE59C4EE87E3F60FD97255D415F528305B0CB178B9205071B019ECF53F04B99BF8D12A8AAC7B9F6330D7E1CA3590873FD6E9E79D75E9776694E115FE47DE6FA0583DC43E9D71C0F2394E6EF0C7D82575A3E7AFFF4F5068A05F0C8664FB8B9F3C34F64E74EB752F1F5B3C59C24D2A97743A8C7738B5F3C8C186F29AB3FA9ADCB217A105B806E41E4D2F383EC9460631AE135ED9B43A41FC3C9519EF85A57A8CC488B4A692804D332E2DB88A7042F99895C6C543FC5CD997941208E1348CA933C600A79D7EE82EE214CF33C951B48340DDBD66429B9E291F4A76361C5B20A57649080046E79EF7CFB39C3087D82B21AEC86F98620C5E9EE7E24A37ED64020DA8C017455F672536406D0D45229E175356E865F20EB94EC9A5DE0674F0E991306FCDB6ED33780B68E8B3AAD835FDF9A6BDD03909C53CCF27CD902373B3566EBC2FB45F6E6F94C21E2D19ED604E82427A67F2413602016047C3CB39BAA124EB0F5D26795F6037E9B482225D83C8C5927CD9E126FD61A192982CC1A1C046EFA6B89CA6AD26B1EBD2DA8C4F63A9212269FC880F52F64087E6976D36041B211112465297636AE12B1DEEA003B84704432997F6DF4D874B4ECCC4097AC931AC33CE17137B24825A703B6F61E193F3DE8261CDAAF37F46DE40C5BC9612799A54C23AC953E479039A45BBDB466BAF260C7A931C18DE70AB761861DF778F8DBBB736D8CB9845D9652D360FC0D20462543A964DF1C4E2CA3BAF3011BB32649E1C501C38AC5521AE3D9FABB7AE793E4604D56FE2ED33B2D46DD61255BE6B13F3429BFCCACA1F0A9FE34E2143F2C08BD2CE6952026CE9C137B8B759BE77662045B517231FC36A6306FCD531154C2C7F910762F72D0F5B905CB29F50BC74D81C0DEA3E599826ABCD8BF0B155DC09318BF9565ED9B3331D92CBC20AA1C0151569A4689DFAD452679C87555EF9E8B854337411C9544576845B0D8D85C779F6C28BB196A27154D5327291915AA7DBE828F8B9F01EF14458346B8A7B9D3C4A885414BE2AE8678A2D70C2233B20EA1607146E0347DC5B4046B226CB02CD6AA2583E77126BCC47E4D9C70DC4C94E3B37939AE618AF9DDCB9C0621F57B972FD11D5063556FFEA9D055889D7EEB23F15A12C40F3328DB0002163E8D7B9063A4E298D3FD2044DBFC16C285DA3199C7003F31F9B381968CF60179FAAC2578F9FE859FF4FCFA2EBB87F79C7A6E1DDDE8D709E1C0E1715D75876FCD22C81CBABF0461389BAA0AB406101CEC4EA2693FEE3F612701E02B04FD7BF51B9D2788DE1F801F6EB04D795E25602DBAEBBE3E474100EF0DA4F9D8138B993A6A5511906C803866461B2E6EB47E3FD10C380AC37E49E25A9A9274A01289AAE7C231D05CED4AF6DFCAC495123F7A75B0EC1DCD216B6EAD4BD6B199AA8A5E76A32B19AB15E9E480320194C98D8681C9736182517F97192869CAEAAF1F0372C517AEF5E9E3E6B89E06F371140611FC04C2734FDC0688B01C5D7D260026032D5FEA52ADD3ED6E2D1A03A944BCA56951EE442B6CB7DDC89D51CEF74BD2E814F70CC5202AB15C08ABBBD22AF60A9415EA4FA290C22A2EDF468F6541426E8DBD3893501E52CB573D9A481B7E6D46F89D2DEF84AB377C1E53159ECA62F41C3C8758BD32560E680793638A85AE93B8FC8A84969082B4F7D7AE7045A46248241DF8BF5214D047D194946C49B9C14FA8C563560B712022E18177C14D9B4A25CD599AD51A9D93E34F25C81E4C5FBF885D7EB00B17CD8A678343376F7F5821756018F503DC76A7CC28E2B6E15D1EB128204DFA0B824DCA6D254675E2A183EF1F25818FAF624614E8A4F4E61E429E9E16395AC7BD1498E61A0FB2B9827BC4BD0B64BDF24372B6E2210D83E03BC4888E3AF0CEA28B9457E95888AE8CB7D7C1922165F3A625D56E1A5DA9B62DA2AB84897C8CD110DCCC31D80ED96274E97B2576496F4C31BF5315C486C2B654B9BF3998C4578A9B1982CFBD244BF7FB803096716BCCF01D77B353E6839EABDDEAC850C2FA9722CAA87FD89F812495A9E4BEBC8C6FC206F2B7BFD28A3C85BC519C8D70100695C125F28BF5870FAC63057DED41CE3D9AB736E63D37B799C1113636D74288D0998D355F6DCE7CB52D8A97B485CA40BD9C2A736BF62D768299D317226E6E3541EBB18158EF0A865BED32E7EF4D02E8D80F8830B0B25ACEDF542A79C71A9B1C3FD2539243D751ADE935817E970E8ED0743DF8F61C3866C7983B3DE68DA37147B3989CEE89EE4DFA484DA2E3159019007A6CA34C1752FA69959635E5DCD09ABD8683B31F93FCA4745E7DBB9ECF9B497ED3E5B0BA09C6BEBDBFAD39FF1C6ABB869EDCC0ADC8C9FE24140DF5382FF7C65465F0'),	UNHEX('638CA78EB46BFBECDC15D3EFF1835DE3EBBF8E00680CB2B760335376095F572F36BC39F8208B65777EB2E5F04329A13CE917FF75082E70BDFDAACDEEDF3F7B2EEC34D876D2F903A4D55B55901BCCE75AB490A6C6A16B808157561EF06E587E7BF5D0F1C6CE554277D05E8A1EA46C78215082CE6534BC36AA8F4FA0DB226ABD2A5373BF50A703568C81C59DBC2DA3D87940E99808EA9BCC95EB9AE09174EB2FAD2AE96F389D7D0E4E50461643A928FB11A051F0291C89D30A544F1EDFAF5B92E8CB3651D36AA071985F0A608298FD2D9B55DBEC5D17386834C1BFF290DAA11424CD66988DDB46A5970C98E7AA508349B50B9050AD36833783D323CD3C4856005EACB061BE1BE66C21AA4E63AF7FE73EDF2DBAFC1055B8918B951CB77E3326A722D0A521C585CC17A6131B5743C172EB2FEDB75E8C0BCACEF54B56E3589A96A811C7357266388CC0041B9F5372FFB7CCD91BBCA40D91791D4CA4D0EA1DC9BA7DB1725708F0FB00DDB4BC7B360B579F031EEE2AF6C4CAA366E5F82518A13CD1E6B092759D338A32A129E402E6A33380B3BAA46B5E1667155A536CC99CA02818A814B6F990150F059A2DA438B544916CF95170C11CD66E7035C598D9ED47C0A7B41795193C234CE4A9E4382283A1DD8275D2E3CB167ED59A26B79DE5EF002BE48D98B149862BD5F0F7A44BBF93DD0B791C95742DB7BF8F361609842778E375DBDFA50190D93240BA8C2114002B727694AF689DA3F6EEA0AE33A2DCA3A0826BA1153BD3199D71BC9BD4E9F65929DEB6043C9DF82DDEB5FA4466CB537C8901011DDC2606C8AF404163B647A07AE4E080013D1F3F612349815908611F93E82B3FEFC7AF9F3DED2E5DFB67C2338DAFC98387F0E2E20A4C29B7A3466892076BEA4DE420A33FCD9E63AC614761A5F63789797B889FC369A8622C3E162E658FECB1D44296A4033B62261B77F4218890665BBC9341EB31D53A41887C69130045E4C3065C29B2FE91FBAF500B3C283970379CC35F38AD940DED7AD0C7A94C4418020B056D05A9E9DAB6BC8A1782018F18AE2E2BFD110C778BDC6296E1582B91C28BC75867F551FE6CC190D2DCDD74C4738606276A67FDD91C70627C2421F785AA94C6439D25D2E4044330A98FDEB2D74D746DAD77F0BED6BD0777B842E6EE17D0578C112D5DA8967EE8C8D8A01C31A17A35C53547353D5F56E2306E274C23CA77217EF1CC533AC7E287D9CAEB41F0B1278632055580A078F924B48F04CF2DBB917E8BEE469AB650F84EF262E380A48AE042C4E6B8C45B246EA9112B39C32FBFE77AAD86709A0EA0F850A12777CFC993D94EEA161C998E3B39BCD4BD9689735AB096681BFAD39D9E0A89A1DABF7F55DB0F84FA72049D84F945E799A8D22980783A225C07D2E43049A4C9F9A09A9C914643D1506E04A93CD1F6EE85E967FBAA6210218B3B5E941E3264A4541603C235E87A6B484F2FA76BA8940EA1F3EA826140182491D3E7F3609AD4A5DD4FD122610E4DD6F7809C54556EB3BFE6B9365040F193D409175CDFF5DD75E612A65880377FA9CDF0AC40BDAAA40D1517BD791A95B72D8283E0F1EB1D2192503D35EA275C6FE46F54EACBA3A081D375766CD380B711DF1BD9FE864E0BAB9B699C10F2D485F146F2B977DDE7577AC3EF61660BCAFFC811A3A76F67316A168279A1B653F29BA430AAE3FB70DDEECB0DB18CAAEDA0CDB7DF512B116A315D71E11C7845FDEB851D1EA53AF0516B59A868774E3A42A82C90C0A34FE6E8AFECBBCCBD1A80F34D73E4E898030CCC05BF98A3AEA6D8C784E3A05E299DBA83792080524BDB32C26F86992D396B47E79955D5237D715771CE6517154F447B9C33AB346FF296FFABAFF131317790DD286D0602E055C42DFDD45BA56EE2D2A2CE0C13330D5DE8F48E6D0085201AE255F71F9C287F80D1D11ABCF9D5D22E74BB9B295C17EA145894E53390C06DDB90D7E3F06B8CE0D4D3038D5FFB4F26FD94B02141CE1BF1B3C85D71F6ACC363557D83395DF0CC434537E89B812FC6AFB9D0C6AAB9088A1E138738129070800100AEC29C01DDE4708228BC2FA83FDDA104963D01E80BAB27352473418AEAF11592130989BEA803211C92FB35FC8D6C09D6A43247F40E668EFF98DF5B40E9C0D0EEEDCF6EACE37E0B457B5044E86C72A05A02B06C711622E0D273F26E72A772614C51D6E9D15E8D13FFFC2452948328BA61FDC6DB0135D9A5D0EF61D71FA7E7995E854587ACFA5E193199E07364837CDA705E8F380EE561FE02497734DBBDF123DCDFB57FBCF8C9B7BB1347CB0FAC62B2D2BE55233E492EF1479D576C78218C09FF134563813404F2DA6168CAFA3710D707A4563E5A7B6B80D50A0E632D412419C46427D797BF4145FAAB604DD1A7FD57BA91F4449BACFF4ABC62FE45CC14914C5BE086664C139910B307CE0FE5552D7A7AAC3A934E8960F3D8FB2A8812E037F6AF52904CC96297EF172EEF6BCAB413425A25912230BADC07C3FA6716E05A61487C31972B7FFF7AA708E3158E46B122D6125A12DB3BC7EA4BF4D1F80AEEE793E875D33F820AA98D47DBF7E0DD840E0AA8724F6A78018E71F24E54FB847E6FF825867ADEAFA9E440418A0D237BEE8CCA6DA208896D163A7B8A0BB04BF501A3E9EA7BA4D29C02B4AE0E629CF02413ED76DAD5F4E59DCC75D6BA0AC056EA5E0A937BD0CF9E539433458833FA91252F7A18A63DF51C113AB9CFCAD43EA585BAFD963D6207532177896C4E3F4AF5314C257928428EBA4E9E10A4D05BFB9FD3E62FFE62326494BE4F1DD9E900155B0180DC1805623CB248462E1A89EA2715FCD328EBE2612F0003AEADA5CFA611F08FA14196EA71D6AE67DD86099446BF04A04C52EECBCE35034376679DDE2DDF69F043FA298F29040D87B5EC291E0773120979DEE680E9637525298DD93F2EE35AEE490E17939011C133A5E0ED848F9FDE885C91B6F5427804F7990F13C5A5FCC4B624D0C9CFE8450B10FBA78792767215BCC8D98ADC6D9CE02B8675399D0B2AD62BBE6F17A90E93275A8C8F38733DD0531849B2189E9CB15B5FB0FCB0E47D89CF9ABB52ADFF3B9DF92BCF2A3F3E4633E544A948611FB1A2F1BDA6D087B6A5ABC02E8191C3C0B07A5D640D2FBC2F8B5688E8E17EB5500787183D5AB3BFFE95802B6F8009BB67691755C0234F848E0FE0CE5D1422540AD7CACC0487CDEF5B3A1D4B9EF71BEC888377D3A61C2E50B3E101B1ECF80BF22E1F3E4A17D5EC19FB092FE8F83FC5B9CBA0E17CD3211C122D12D9BC24FA7B15AE980D79561CD4A03EEFC5438CA6C571DFD0342FF2248C9B9820F0829B76FE85D34257FE6F7DFABCE974BC1B5CF602B18E619AD03086D9FD2A1C38DD62FAF79A6C9425069738ABE31F5C99319109BDD1808F75757BAB3EF0C48CC9336762C0F3DF347E079EB89566703AD4BAA7BB1A1ADA3139867676F18A68E24F14B35B23440B0EE00A6F87250911E1E69FFA531FEA8586C899841BFD326F9CBA4A8D85B82C94ED1D0327BD49B9A64D3605364FF2AB2B92207CF01C808E2983FE61A408A207A95A8534CE442161273CF0FA78BB8ED2530F46AA2721908FBBF52F5B85CB22F0E47B86333954E6B3B220E46BAFD422323E26B39A73F998C20808E9997E00723B307F93A3EAFFA85E8067918A71219569A2164EB6CE99FAC1EE3752CD7636114FF36FD385E79CC3D6AE7E09C530B24871652AF8C28C02F86627B99946DAB04F9B4FB7419005F9736E9BE2BE4BFC5BBA4BD60E89DEBF347B751A1E7FC866477B8A361C6054F6812BE2F7CFFED596360D9D988F0A9C58004A0BCD0B460B74DE62FE818EE805948D8A8C5CCD953EE966D1C5E6F4866704B640A988C69B48F03A4DF3EE38575D53EBAD397FF560889A548DB8689FF0379A1EAED3FE3D9F0636EFCA961E2AC1C9662E6142537353405D2C29202C8B3F8E591172B26FFA7AAAEC826C39A13F65BE3ECAF183CFF7ED5EBD3972537EAB72CC315A6E574A1ED8A9D0C271D66265DF3AFBAF1AB5CE4802AFD6E6D91D4EBAD1CE73E0F7C1ED142B470BD1ECE12EDBDBD261C64E71F87D39013951881FB992CA4006832CAA5D73D74138240B299C7D82971FCD66BDF442EB555F66CE44C8CCB9D25F54C3F192F594291E9B661D1F2EB5ACA084E92BAD29D6B1E4971400452E8E610F3968C29503B4F1A41F67B32FB4B8C1759CD96D8E7FC8C2D7D49C9FDCF3116FE8009F911360915BCDB83A8A0C1A5B1AF75AA9338F96B78BE51B1DBE9DFEBF4D36422D9BEFD39C7ED30BEE88142678150BEC2D818E8E788F7B80B6674CE9F23CBF1C00ABE3E66E0F507B845A63B24274CFB1534E3E49B39368B6AEDC70EF6AC343DB9A5364713830489283DE6FE6990795F18898AE2986836B8175A5DAE2C4EFC49C91163B53DD9ABDF54C5EB756CBA5BBFFD77C4BE14F10A1195383F4B81989CC72E45E18E705B89BB1B5DC03A95DDC3449C607560EB4ACD99C644A65F0AC645A928C994D71BC14EF053078266C0C7F6C290C6263CD178978B26DD19B7D14D920F79F2C84BEF7DD56627D9641BC0CB0C607503C09EDC600CEE7E9F6BF524126DFAAEEFDBC371861A8129A92B652B8F2700F2DB82511E492D47CC4B932390A9F2956549927657F849C6029EF619E046541AAF4AF959613A2FD5A3A09AB3F29F2683BE2B908EFB8A966E659EB9AC5734D48F06FF27968667F1FCA4C34C170A804422E2326BFA2977650DEC241609E5198A37F979687B824893D3B6AD8FD3F986BF756202C6ABBF24F66354FB78CCCA99448D9550E7CEA0E96F0710B3EB9C6CE822F03BF3F1E07913D6C9BEB1E18E6C695AB9A394CA3FCACA5C378022E97FCC89EE964677FF12EC39E7D2BDAF937BADDF23652B7920383C8FE36FF8EC6EBEE5427D077E000760AC979597E1985E04379A43F5AFC479A0A7C86C63C8FE2987AEBAA15279DA285213BE76F5ABD34B7727D786F92CF262753CB85DF1C7047ED2D041DAEA68809FAA662051A29954CD4D1904AEC3345D52BF608E91E4318402622AA69FBE9A08A966F151E9ACB9C816CE9F6F20097E42975AE9BACCEC1443E17CC6D5B3DC48021C5DC1CBC76B1F18657FABB41D5B8D01BFB2B98CBBA3AB185BBFDA53006DC16BFA25C990C510D42C07EDF6AA4E15657AE0A93E958228DD9B85A7A55CCD019D31E82824A8AE96CECDE94A29EC7199955572075DB2C77B1D07A77BA06CBCB1A44A80CF3EE0FE3CAF45B380A1AFD5B1B87190B190E1109DA2540CF039CB551AE3D60E5D0039927B57C7AAF069FEDA5EDF435E1D22C9CB469D85D2FC2C25A7BA028961485C6939A1017E7C98B56F9CC507DC7226990ED688B785C5ED2A628E70D66E891FBBE29C6D7D258000ECBF651E5BC103A35F6F0B532AB5B9C9D8BAED5A99ED593514C6A36D32AA28D8A2D3169773831228DF79889B06A7A174841A2C8DED29721D1E67FD144C31C1095C2C0D431341B0E59AE4F504EC2CA0566D086AA6D3B32A8D36B5E9997E57A8B5D89C30198F079D20D3514834D284EC33A40A6AED8DA656DEA08B2AD693C7F9B7E2C0EECFE26F8E90CF004D07CF5A4F940F90AC4F97C77A4D69AE8CD82BB32CE0BE4B11B7E56AE5F7F7047C63E32E10C12A78DBEBABFE2A57C848CC09086EA36526725B3118C6FB1E1F813BE50E18A13128BEE03647ACCCCA9B74FA359AAB619771F4634CF8F3AFCC9E80F315EBA454FA73A4C2A03F2A1F575B4EEE86999445B79676F06DFCA45FC7A9B70B7E440BB6D5F65FFF9EDD721A8D7C3B69C68815480E9A403233DA542044EC7265D5221163909B01CC65F3B'),	'',	'',	'',	'',	'',	'',	'0'),
(2,	@region, @region, 'DEV_PUBLIC', 'global', CONCAT('http://', @base_url, '/query_region/', @region),	'http://172.10.3.6:21051/api',	'',	'',	2,	'',	'http://172.10.3.9:21091/recharge',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	UNHEX('45633262100000008816A7B400B7F1936C9B0D273AC9FA4000080000941546038F8DDF7AA6142650684D45D56DBBC2488E2655565540F7DEB3883CF7F16FE234E9B9AA2776276623295354463EDBAAB7CEC1722D461298B117C642A4AFE85F03A9F783EA408BF2570A3BFB31E3BF87892652F11F245A1828CE4BB34EB5C9E5F9350D12CDEC89F07471CFE19D43AF8044009F7934D8619FCB40DF38FEEB5A9B9CF6C3FED763698900C8D5AF9248F2BD72C372B3754A6C5423D64A79BB39E2AA7754E3EF108B73E48576160C19D9D2679AD79147E962C65FB7F6531D8D87AB3A0FB8338F814DEF2A8AE35AA138DE95A645A4C4DC9909B6E90F09C4CD7CBDFB72EE887D833192248298776915F94084A1FA92D51A8B25831AB478633091C31B7A9B2E877628405B15369A0A1164E5E78141098AABC99F76192DAAF9EFD381537B9E101A0E6F40DC0AECB4073D80B6066DA271AD345B60D70F02064DB14BE0EA9D8098FDF30D7BEF8A422D2640559B288EA6320460474FEE23BCF6291FFFC62A07C82CFACE0AD8DCBDC16D30C3EB7D970CD4B458D49753027EE2E053E0F91C59E2FE36D7476F3EEACAF0DCEC6D4B42990EB55F703B53565C47FC2E949D41CBC055AA1D5D05439762DA57E324E77CD477BCCF9C163B813F45A79347B4FEDDBAA789554954B18ECA8C147FE89ED88619793FADD1107C2BF603C62E937BAAD7D055A5862284F259BFB0A1EF5523E972FBE6BFD46827A75862DECB557AB14A37F714D2C610B471AB5E16A82F907BC247610863CEC72364116D20DE90641D8503162A389C7BAED68C8F0652C8036E0A0D3225542158CC5A5DFE0F2968B988044514E0FE90CB38C8043AC7C74114C469CC5886BA5881EA3244FEF5D164E1BA6F04DB7E4D2A681BEF1C47A22E222D44898DBA73BCF8AC4494CE5318010D457B6D49524C4CF3BA1FF4DB9EDFAFF4B5B80F574033828B40A32604E6C1DFE94B93A61B619224722A0B7F4A27C6743E14E6A633D2103599A5CF93ED9F3793825CC9C382F097FC2F1EA9376FCB9EA288B196F4285850FDA84290819166C44660E1E66C86E7A4FDB3FFBFC55470B1645BF692A13EBA3C014281AE99F924AE200940B348302E014E853616D001FF45E03D4AA1567DE01C6AEEC9F0822CBF3E4807E3F50087AEF6192E2976017C61A33EB9158ABBEEB3385F35831FE43221BCE7E230773B934DCB833442A600CF7C13A754C016779819D7099D15036914307024209100A25DF4C7B621E87074023ADC4398B10D3384FB4390B0E864B7D9D6A1284B6D57DDEC8C33DA7C829A061B8248390C513796B842C21BF6640A7689FA991AEA2B459349FB5716CE7AED5D243B9DB238085B493ED49DD2F6F1BD4F2D849E238635926C7A2B7B939E373122244F24D5A53F43F31E9B1CDE38F844E9CC5BF96BA6F206128902E77974212EFC24A525CBDA5CB53D5E7E866744DF68EE6E69F219D2CA682A7D6AE2EFD8A0AB942B25E8BB5FC97ACE08642594A310F1031B95D0569325825F5F4AB61D531C729141B7B4CEBDEC5A5023373F8EDCF1A7D2DCC7DD496F6B1A563689A92C6CFD499C6E43D32B7B2F1C68B8DE1D7D77EC5103B8E75F1BF004F9BA0A110444ACABF95DBBB18BFC21F98AC0CE410788FC68B93EB8DE9FF39E59E731E4C90F8C9A8F4A7B2FE9256638B16A006D4844D7F4CDA52AE392E5FA00D0AC63CB99112DBE0F039FD3D4E89347C185D09DDB1E93E782DE6F41EC79579ED20FFAC769544FA094EE70AD581EABD690A3D667E2DBE45BF12CB6DAD4A23300C8D99BE0211E18C987D197C85E0DD56D868CBDD245C4F1DA8156A7B733A9B6AF18D2F01FAAB8B3C04E75BB29CFFF3A950B072BE7EC21E3EB9A26E9DFEFD607322CC2A18BEA6A460D53A285DA913A02D587DDC9ADBF3AE117A462255AF2714F116A71562CCA7BFA39FC1F9CE28E0754B662D63E2CA75614E407D3023122C2B5D53CA7B60B3235F6CBB3B6AA49ACAD58BF04BA326C8ABFA4DC2C41296B69116205092B692F0BDE634BDF2D5417D5763878D6514F7652BBB88779744110AEA57E2938C618A13BBF6841E74D4455F0A819693E633A51E593786C5733F329D9C730C933406B67AC202E3635DE220BE58C261BA5B79E052D8F0D132F47E7BCD1BFA06E6161098B4449DCB230A8953F9C6A84157416219B10F69F046779C4D480D5F79F2AF09B14ED819B3B407246FBFC8A5EDF11486B1A781255C8698F3276CD515DE5F6B7C80B8E11935BCD06DD46EF33DA02E615258A4C2958E69B51DBACA07AF9C72D7C39770F41EB993F2A01295DAE20055945F7F37484D0E66789647DE199F4CD370895605759CC7DFFA75AAA2C445970D49F885ED76BE45134FD78F278F6757F7D2385CF50A15D90734591D4453AADCCBEEC81D25F25BCAD6976BD114ED9A5666594B1CAE161C75904CB4EAC90DB439F7FF48958F3FC818570BCDBE4498AAC095825C05CF2E031611A03383CF56E44747F7F49F77B365B5EB0977B735250B1F0BF9C5B8A6C67C42E1EB3F88B5D3AD7D0255569B7E01C71C291CF45C45275DCA400C2295E353EA74A76A436A1AE88253DDB3D90A008F6EC387B2BE0E22F3F56AC855FD3DF36AD033D8C9E9987D2A05642090166BBDC0CF349D675F5D2D3F74790B43B001557FC008DC769C944AFCA91681567950F44A5AF7B0A732B9D24E4D7D9F71D59098172C5C48ECC6FE02F4EFE356838C2A4290B48597FEE2B4C0C502C0EB5CF85C29A587B694B9033643973C6336A3B97837184E5689EAD9CE7728171B755172D488BF64905657DBCD7B48311EA833ABCB30659AE32CD7A27743DC0CC5D41BEF9A43D94581F445BB3418AC406E11CFBD93CCED2CC3E751B74FD57556587E08C90DD977AD03F50F2BFAAA27FCEA09B489527B3366714FF592A89A78865BD9A489BFB'),	UNHEX('7B29A3FE7A61D1BAF5887CE4A9BA9F38ACCF351ACA1550C95DF9D47BF102DA504C678B2BF37E93E578C11D66A18572606B2BB23B0A5EC61330FAE8BEF1B526D72FA8EF1177F2B2AEEF81FE13E7C14E4DA3FDE5968E7E160C497ECD3CC20C94F999A54B23520E0219EC1A512078207FB1BEE182361170277E4A30B05A47E2B36257FF7FF6BB1754D553B8F14988218F4132EFAB1DA5E446A221664EB4F0BC5E03D98B27EACDCB05BC957D0E2FF50B83BF753F98C6316E9125A0AD984C624B4D110BFB8CA045716653F46681A44FF1762825676EB74BA5CF2813E3CEDD50C6A1042EC9D7976EA17D0A1F52DA962AFCD30C174EB99B57DC89A6BCBFB0AACA19B4AF9A9190A6182C900EE585D1A41A07D8709F7265C170F256198DD07396AD52E4F6ED3D06F03CAF1EB6DC14B9AEB765AEEB634F0EEA16A6BE2FEC9E56559D9F5520B251DB0823D0BF1ED2AEF21C66D0B74C32EFDE76DD0EE30B19F26D51B6FA2955546AE21C45F30028FF1D9292FC603E09725A2A6950EBEAA27787DFC850CA4D9F2C15CC619ED954CC994A1896C69134ADB8F9F28D397FA4B30A521781A8FB69D651106C4D7B74F4330613563E48017B26B4D856E2001984E679084DAA1510EB5BEFEA48F3FA727833E73514987174DDBEE4B18AF788075430DD9D4291CB363AAC1624D125C58089E910BB1DBAA18C7E1301288695CAEE7CBA09A036FECAA4286691D84DF76F05429916916A4C1262D938E2B629251F27A5A3891CAE7BC8DE3B325DC3F1938AE2D98642D52ABA83C2EEC6BB0C28B2A8EAA516190D1DB6DCDB09B495E0446C2611C77BC657FA31DB37DC41D40B853A2DE04D246C346922AD92B9CC3BCA265F2D15A4651E339F44BCAFE091DBF1683392F607610673D463248F4F345617BD0FDAFA7FA89906043B1BF941211CF8FD36D6D31689DB19C28BA073C0AEF8939BA4393A8D8D6EFCEC66D22D94926DD2E7F2556AE5A7E43DB8B92B21F838E36591B9EF876911D4BF2BFD07E9EF08B50547135BAAF4E489BCCB67F2DD49A57CED26312D7D98F1562AC9D4B0A3E22A2F47629363FBF6412C6FF7E225EC52EF7EA985953EA79C91E8AC8735EB97D982F250676ECBD9CB7AE2F48616CAD3242895F9D240F9FCB0EE4389E3C121D44C0342E12063D51DA4289F2AE857CFC577D4892E8B526E6EBA658C2138BDC3092CA7C8EF400FC483C2A628CD048AE08ECD8A62AE370307938FA4DBDFD37F89A31B631F51D20CEE9F708AEC5F7DA0AAB855695F619B1BEA44262A013FE00B2DC029E8CB04AD2BF97F74AF8A876DDB32403C4F43654FF200D80941D1030677881AF5789C3098810F1077F017CE41FEF7C73941B49A1EFCCD45CC864182FA63D0709D36257F42E6AAA2E49D8DA2B2E11C3C4C7E5B80B10DCDBBF0CDCFD592F32CB6B3BAE1A865044B020EA7D0D3D6047F255AD5796E55C86FD21E232E365B110445CFE0EE933470B3D3FE80785D5DB3F31D12EC7DE9359EADCBBEF85BF7228FA3FECD05DE155B38471259DE7B3282A1173F6B1A4159864E05E7486D7B9308DF9B57AFCECCC946D02374B7AA8926E5BC7D2DF6B1C9B51981A6FF79E3BB3BBE514596A04DF7CAD24002A41019E54F8A374713B0ED14CD02AC57BEB24AA88B9B403E868A65AC22E2D2C63141268873E6D143E7720964113D034C76C850AC6E42D7B11C3263C049087E43F07619D02C37FFEAD0066D57B2DE8776F2B4D5C50B4D39D3B80C74FB7441C57E35CBD72B3C9B10314D94995C9605D7FDE1C0F57AD9A3D803A550B0C6466FE1433D4D6ACFD6CF0B2FD401B4067CA20823394EDA97A50577B0B3F800E85539FE39434195F824968B56D428DB44E2685A577CD44EC50756E2F85EDB9C6FE7A67E45EA3B7E8DCB7EDC2E20021DB6B0998DCD1E5160C6A42F0A5649ABDF968F5FB7A4AB87499176446472ED3A6A0EDF6F9FD5903FBC1DF77FEEE31AA9CAC49EE13E750EB5C4120519401DE0290FDA274902B27EC658B4857247B750971F0007651E5EBF9E66293B04DD907AC5EAFA56FDFECA2137A4B6C0B7F535B996579A193F96636E0ECADBA36240624D787793D503B13CC29C910A47A407770305E5BDF014912C7538931869521201B2C39319F1F3516F2125B2C3D19B0A640D7184E87FBBEB665815B545A7C664419BEB7FCFAF9CF6B343E25231352764F4075A72FC170157BE7C68C0BAFB4401B6A4771A844D2E1D00BAC1AD10D46420F5780693C9C7BE59701255EFA3E1495E4B46879264BF01D0B66C89E83CE71B629EB3F9BBA1AEB78DBC107D6AA20145A495D6C221266AE7ED380BBDB32C292576A30E1386DDA2D7B707EBBF196DEA284B5184312263766327054EFC07CFD9D3412DC1AE7EBA5E27CA3E0E716FBE8624ABA84E0EB370A15F867D38CD6AFAB0846E345DA0078C42A509ABBB108B5C1B3172A9FA26651A3883DF304B03E3B3EEF4B1F77CE5CC282493A29FADB325EC333980E05609D91F861BE3E78BBF6D82725F1D5DCEE07F5FD4EE28CF61AACDE885096C1A9E138D71664026CA205A721A497474106B02F056F4958795770B62F9CEFAF24E8550A6BB3AC0B94CFF3CBE9C438B945CB3AA36A68B649D34DA462344B6277D9A8DFD87109D10D89772DD0861C45E83E70A195421ABDC6525DDA1B8F8E0FD72D198EF57C3B05F6036F47D3868EFF8D1FF86452786FF8A1E24FFE50913E6FDB0739BF600FB21820A294C7A7C9079D1FC0B0EF4EBB849BACEFB5EF40E578A16661A0DF601A01E77ADCDB225688BB15A59091252825531F72AC091577BBC6DAED1F71A02C1F4F9CE632289E3C8069AE1E3A4EF6D0B6A19B44CF85539B77BC07872094FD49945BD52EAFFAE6A3B58AED3BF1BAD0857DD790DDAF41D2F40465323F63B5B4AC8ABBC00C9EB02AD66BE4FC03F31ABACAC7B9CEA3CDAD7BF61B8C1AA1B2D16DF91CE5CA014794226313FCD43AA9B0A89379453B2BEC3F5506E8B9055E4284F7F0883AAEC64A240E998195C13D4C9D0DAE1C156F63DAD96BA5ECE42A2DE1227A597985DBB8C97237FCEA7ED5375BAB6E470EB8E519D783A3FDDE149A68E0E9ABBD27EE055F2913994194D3D6C84DFEBFDD0A7134AA1837291CB0BD2879EC0B6FAD82AC4A6493799CBE374D3B64718721D4DBE687A714AA05F234D93AFEAC3D516F8140F25CAAEDBE44EE2F24BC282421C3A62E6597B2C878C44181C17F4A176366E26219EA8E354C85FB5C469716F9283C2D60BB964441F74A2E8C8BAB2FB5A959E6D3A202ACC6000AA6AE99070A6C3F0571888F87EC778FC1F69C451C6FD8EB4E3B2A7C49CB9A3EC817EDF2940CB0EF2A4492C5DE95EC10C156FD7A7F45A2BD5818B04D65090595F555920C64EDFB3D94D68FD6AAE7367A4B558E03A88E2A23AA491B62F2CD45794FD6043024128732EF742BBD105DDF0323E31444C087A720E4751BCB3D3786A0AE9B86A2E6FA06C2261428F58A0E35F8E57DABB892773DBAFF37AA5A52381EF4B68046A9881A1F8C8CDAB5DE21215209809A9DCF0A4232C45DABF3323C85129612DE56B1AE194B71194E2F55F8A61F5A34B128ABA039E424A4081B679ACA2BED9A7D9F4CCD5AA91D9097250F361EB34EF5C602D73753A096348A5F510DCC9601A6CF0E530DF11692A8CF83C9E2D28C355D6FDCAAAC44BC0CB99C10FC7E5ADE64A13E8C7A1D19EDE2114CA1ED5A9924709CD7306195993CCD536654DBFF77111954C3178A6556328C58F19720C7C57C2BF7C070B693692394428C987209339BFBCA6128414B7CE9CAE746DDE384BA6DA441A5D6F36FA909C2BE8003C64A7097CA4512146B8F8118DC1475088911FC61942D56E9416155878AEC4FFE3E9180F829794F9727F05F4DE487A0D2A608C29222C178C7491A1C80331DFD5AEDA850F28CFB5AED74038ACCE12E228664634CCFDD5BCB92B1EE56798F7107FA8FEBDE00369C2D4C18CDFC2A805F73C0C9DF5E5A437A5A44C44E55D364495CBA8BE7DAEAB545B2AC3F18BF7CB1C6734F04D6D5D92E7BD491E7CFE2E4103E9D68176F1C8E1E894B3E4F51B66FEC3E3FD528491B44D8CED4D7B6A78141E770A29085E145539C6189F26AC8684B7F44EDF5EE170ECDF69BAB56ED65833870B80DE51E439ACA214936E63C54271031E6AF26814378E492C33C27AFE9A02F8388125B4F8880837BB7FB4089174B32C251B820B8FFE6B1591442F9CE5846E7B91F65DA11C911F5220F40126D9D49A9B194277E828F61344A4BD8C0C6B890016220D80DE4D8C243541BD2369F3D1178EE455565FC737B87E0D210ABEF22484102AB95F5AA9DEFDA989FD570FB41BA61D9C4AFDD6A69CA3B4B18351F42B67A3F6C8C352AF8ECA3602E8486431F45F1CF3DEC95C5BD3FB4818116B2B8415261E267DA154E8C976A8D0F576B1E7D023CA8193EA378A873E40C880733D6489F18BFF5E5793CC980184C458C94EA55BDD48FB45D169EDCA49DBF78527D730F83BFA757142013889048D7F4EB0D44CBA3DB49314076D3BC0B31D252671C302498150652FEFFBC255192036A3B738B14A7345E5C938BC43D0319716DE5843E60002445BE53D8A0AC369C813A30C420EDA7A582A799251254FE592F1979E83C6AE24C7D006FE69F2BB6858BCF77F3E96BC665856002AEC77A4711F8161894B925ED904789958D7974111E32FC8F3CB0B186231BD80A5593F20C4B3F228B8419FFE28E2A7BE493E318291ABB6148D6A970ABEC3A6EF1B78707876622BE8503C322410B57AD94E5FE1EA66C814F957A666C2AB057E61BB0B2AC67A2720085C2C3BCE477568DC6EC6A49890B27B6324E173BE7B6BE7D14A1D492FB67540F4968B23D45AE38967E80AD4C9BF46953AAD9650E2B913F714C1DB914FD7AE82F7692E0DA8AF8922A25758E7CAFB2643E80A8378DABE16A1010DC83968D59534786E38D68CD0A50B287ED5826653EAC3A65BA1A2996D6AA60E488AF43E4A4FA0309263469B64FF730AF640138CE86F196408378495C8E95E777EF46A8DB4A1C1EF0073D4A516E6F769FAA80B32FAC8B8DBFE318DE993A2994149BE930122D1182DA8513D423369E22217B96DEF60865CD0BE375F97832F95FA23F2063900DA573121D9F3AB71EA8070DA5ADA7D7786D49B6CBF813E4DE05B49A0F5C4ECE82C439A89ABC0181F706C78ABAC7BAE5809B9BBAD8DDFF31FDB5F2911C55A7E3CF8548D9988B1287607F22F9B25E1F80D3E84379677E203B054134C2CE5751BF563FCFC37B5E4288F053ED14DF564260FFD17A84B96687A78AA6AC830611AA1481B747977F97A9C48F77F9710070D88E469BA085F8B38C70B939EC39D114C4163EA837243FAF6E1C04481B40D14F113BD6BB2394BE313D01DD322B03B70DB472E932638C073C183ADFE9D354BA1AE3EBC28858F69FED5E514955CE433328EBC017276D7E3B1EC411F9D0839E5F9717CBEDC440D04A2889E3A6C5BC5D009D0C485EC4AF45C536D53CCFE7D7E424AC32DEE32821DF172EBD13DB26A3A8A2B5BC21E1CF0E260B2C42D5D4F0D5D0662EE97CB2B6E7A1FD441496BB7EC3DCC19D504424A8AD4204EC51335307F6323F75E8384B2D6F0FE9A4FF2AC95E055FDC0745F8563A7A1837EE6F0226C9E2047D043BFD7EEAE436C457653D47D427A17D70031990EA61349AD562DBDD6749E6E238EC3826D0737B42FE8A7810CA4345AFC848CB47D5A208572376417AADB1C83F0088392E589438930BA2E32C5C8ED722FBD26A91DE9D3879FD9E93F5350909049880A128C23500C62EB54B43C8E85790EB90ED18EC1B15300A98E50F4B57AFF'),	'',	'',	'',	'',	'',	'',	'0');


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