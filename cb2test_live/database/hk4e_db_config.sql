SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET @base_url = '127.0.0.1:21000';


USE `hk4e_db_config`;


CREATE TABLE `t_activity_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(4) unsigned NOT NULL,
  `schedule_id` int(4) unsigned NOT NULL,
  `activity_type` int(4) unsigned NOT NULL COMMENT '活动类型，避免策划activity_id做新的活动',
  `bin_data` blob NOT NULL COMMENT '使用protobuf序列化后的二进制字段',
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `activity_schedule_id` (`activity_id`,`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='全服活动存档数据';


CREATE TABLE `t_announce_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `begin_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `center_system_text` varchar(200) NOT NULL DEFAULT '' COMMENT '中央系统提示文本',
  `count_down_text` varchar(200) NOT NULL DEFAULT '' COMMENT '倒计时提示文本',
  `dungeon_confirm_text` varchar(200) NOT NULL DEFAULT '' COMMENT '地下城确认框文本',
  `count_down_frequency` int(11) NOT NULL COMMENT '倒计时频率',
  `center_system_frequency` int(11) NOT NULL COMMENT '跑马灯频率',
  `enable` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否有效',
  `server_version` varchar(64) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='预告功能配置表';


CREATE TABLE `t_gacha_schedule_config` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `gacha_type` int(11) NOT NULL DEFAULT 0 COMMENT '扭蛋类型',
  `begin_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `cost_item_id` int(11) unsigned NOT NULL COMMENT '消耗材料ID',
  `cost_item_num` int(11) unsigned NOT NULL COMMENT '消耗材料数量',
  `gacha_pool_id` int(11) unsigned NOT NULL COMMENT 'Gacha根ID',
  `gacha_prob_rule_id` int(11) unsigned NOT NULL COMMENT 'Gacha概率配置ID',
  `item_type_weight` varchar(512) NOT NULL DEFAULT '' COMMENT '',
  `gacha_up_config` varchar(512) NOT NULL DEFAULT '' COMMENT 'UP配置',
  `gacha_rule_config` varchar(512) NOT NULL DEFAULT '' COMMENT '保底规则配置',
  `gacha_prefab_path` varchar(512) NOT NULL DEFAULT '' COMMENT '扭蛋Prefab路径',
  `gacha_preview_prefab_path` varchar(512) NOT NULL DEFAULT '' COMMENT '扭蛋预览Prefab路径',
  `gacha_prob_url` varchar(512) NOT NULL DEFAULT '' COMMENT '扭蛋概率展示url',
  `gacha_record_url` varchar(512) NOT NULL DEFAULT '' COMMENT '扭蛋记录url',
  `enabled` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0不生效，1生效',
  `desc` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`schedule_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='扭蛋活动配置';

INSERT INTO `t_gacha_schedule_config` (`schedule_id`, `gacha_type`, `begin_time`, `end_time`, `cost_item_id`, `cost_item_num`, `gacha_pool_id`, `gacha_prob_rule_id`, `item_type_weight`, `gacha_up_config`, `gacha_rule_config`, `gacha_prefab_path`, `gacha_preview_prefab_path`, `gacha_prob_url`, `gacha_record_url`, `enabled`, `desc`) VALUES
(1, 200, '2020-06-01 12:00:00', '2106-02-07 06:28:15', 224, 1, 10001, 4, '{\"item_type_weight_list\":[{\"item_type\": 11, \"weight\": 20},{\"item_type\": 12, \"weight\": 50},{\"item_type\": 21, \"weight\": 20},{\"item_type\": 22, \"weight\": 50},{\"item_type\": 23, \"weight\": 75}]}', '{\"gacha_up_list\":[{\"item_type\": 11, \"item_list\": 1003, \"prob\": 500},{\"item_type\": 11, \"item_list\": 1016, \"prob\": 500}]}', '{\"gacha_rule_list\":[]}', 'GachaShowPanel_A001', 'UI_Tab_GachaShowPanel_Qin', CONCAT('http://', @base_url, '/gacha/info/8?authkey_ver=1&sign_type=2&auth_appid=webview_gacha'), CONCAT('http://', @base_url, '/gacha/record/200?authkey_ver=1&sign_type=2&auth_appid=webview_gacha'), 1, 'Jean & Diluc'),
(2, 300, '2020-06-01 12:00:00', '2106-02-07 06:28:15', 223, 1, 10001, 102, '{\"item_type_weight_list\":[{\"item_type\": 11, \"weight\": 20},{\"item_type\": 12, \"weight\": 50},{\"item_type\": 21, \"weight\": 20},{\"item_type\": 22, \"weight\": 50},{\"item_type\": 23, \"weight\": 75}]}', '{\"gacha_up_list\":[{\"item_type\": 11, \"item_list\": 1022, \"prob\": 500},{\"item_type\": 12, \"item_list\": 1020, \"prob\": 500}]}', '{\"gacha_rule_list\":[]}', 'GachaShowPanel_A002', 'UI_Tab_GachaShowPanel_Venti', CONCAT('http://', @base_url, '/gacha/info/8?authkey_ver=1&sign_type=2&auth_appid=webview_gacha'), CONCAT('http://', @base_url, '/gacha/record/300?authkey_ver=1&sign_type=2&auth_appid=webview_gacha'), 1, 'Venti & Razor'),
(3, 301, '2020-06-01 12:00:00', '2106-02-07 06:28:15', 223, 1, 10001, 103, '{\"item_type_weight_list\":[{\"item_type\": 11, \"weight\": 20},{\"item_type\": 12, \"weight\": 50},{\"item_type\": 21, \"weight\": 20},{\"item_type\": 22, \"weight\": 50},{\"item_type\": 23, \"weight\": 75}]}', '{\"gacha_up_list\":[{\"item_type\": 11, \"item_list\": 1026, \"prob\": 500},{\"item_type\": 12, \"item_list\": 1024, \"prob\": 500}]}', '{\"gacha_rule_list\":[]}', 'GachaShowPanel_A003', 'UI_Tab_GachaShowPanel_Xiao', CONCAT('http://', @base_url, '/gacha/info/8?authkey_ver=1&sign_type=2&auth_appid=webview_gacha'), CONCAT('http://', @base_url, '/gacha/record/301?authkey_ver=1&sign_type=2&auth_appid=webview_gacha'), 1, 'Xiao & Beidou'),
(4, 302, '2020-06-01 12:00:00', '2106-02-07 06:28:15', 223, 1, 10001, 104, '{\"item_type_weight_list\":[{\"item_type\": 11, \"weight\": 20},{\"item_type\": 12, \"weight\": 50},{\"item_type\": 21, \"weight\": 20},{\"item_type\": 22, \"weight\": 50},{\"item_type\": 23, \"weight\": 75}]}', '{\"gacha_up_list\":[{\"item_type\": 11, \"item_list\": 1030, \"prob\": 500},{\"item_type\": 12, \"item_list\": 1027, \"prob\": 500}]}', '{\"gacha_rule_list\":[]}', 'GachaShowPanel_A004', 'UI_Tab_GachaShowPanel_Zhongli', CONCAT('http://', @base_url, '/gacha/info/8?authkey_ver=1&sign_type=2&auth_appid=webview_gacha'), CONCAT('http://', @base_url, '/gacha/record/302?authkey_ver=1&sign_type=2&auth_appid=webview_gacha'), 1, 'Zhongli & Ningguang');

CREATE TABLE `t_login_black_uid_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `begin_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `msg` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='登入黑名单配置';


CREATE TABLE `t_login_reward_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_type` tinyint(4) NOT NULL DEFAULT 0,
  `reward_rules` varchar(1024) NOT NULL,
  `email_valid_days` int(11) NOT NULL,
  `email_title` varchar(200) NOT NULL,
  `email_sender` varchar(200) NOT NULL,
  `email_content` text NOT NULL,
  `item_list` varchar(1024) NOT NULL COMMENT '奖励列表，proto3的json格式',
  `effective_account_type_list` varchar(100) NOT NULL,
  `begin_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0不生效，1生效',
  `tag` varchar(200) NOT NULL DEFAULT '' COMMENT '标签',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='每日登入奖励配置';


CREATE TABLE `t_luashell_config` (
  `luashell_config_id` int(11) unsigned NOT NULL,
  `lua_shell` mediumblob NOT NULL COMMENT 'lua脚本',
  `uid_list` varchar(4096) NOT NULL DEFAULT '' COMMENT '白名单多个,隔开，空表示不开启白名单',
  `platform_type_list` varchar(4096) NOT NULL DEFAULT '' COMMENT '(如安卓 ios) 多个,隔开，空表示对平台不做要求',
  `percent` tinyint(3) NOT NULL DEFAULT 0 COMMENT '灰度百分比',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`luashell_config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='luashell 配置表';


CREATE TABLE `t_mtp_blacklist_config` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '默认主键',
  `type` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '对抗类型',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MTP要踢下线的黑名单ID';


CREATE TABLE `t_sign_in_schedule_config` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '排期ID',
  `config_id` int(11) NOT NULL DEFAULT 0 COMMENT '签到配置ID',
  `begin_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`schedule_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='签到活动配置';


CREATE TABLE `t_textmap_config` (
  `text_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'textmap的key',
  `delete_time` datetime NOT NULL COMMENT '失效时间，时间一到就会删除这条记录',
  `en` text NOT NULL COMMENT '英文',
  `sc` text NOT NULL COMMENT '简体中文',
  `tc` text NOT NULL COMMENT '繁体中文',
  `fr` text NOT NULL COMMENT '法语',
  `de` text NOT NULL COMMENT '德语',
  `es` text NOT NULL COMMENT '西班牙语',
  `pt` text NOT NULL COMMENT '葡萄牙语',
  `ru` text NOT NULL COMMENT '俄语',
  `jp` text NOT NULL COMMENT '日语',
  `kr` text NOT NULL COMMENT '韩语',
  `th` text NOT NULL COMMENT '泰文',
  `vn` text NOT NULL COMMENT '越南语',
  `id` text NOT NULL COMMENT '印尼语',
  PRIMARY KEY (`text_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='服务端的textmap一般用于邮件，需要控制条目，因为全部加载到内存中';


SET foreign_key_checks = 1;