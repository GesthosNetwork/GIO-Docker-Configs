SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET @base_url = '127.0.0.1:21000';


USE `hk4e_db_config`;

CREATE TABLE `t_account_cancellation_config` (
  `uid` int(11) unsigned NOT NULL COMMENT '游戏uid',
  `account_uid` bigint(20) unsigned NOT NULL COMMENT '通行证aid',
  `cancellation_time` varchar(50) NOT NULL COMMENT '账号注销时间',
  `create_timestamp` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='米哈游通行证注销名单';


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


CREATE TABLE `t_activity_schedule_config` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '排期ID',
  `begin_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `desc` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`schedule_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='活动排期表';

INSERT INTO `t_activity_schedule_config` (`schedule_id`, `begin_time`, `end_time`, `desc`) VALUES
(2001001, '2020-11-16 10:00:00', '2020-11-30 03:59:59', 'Unreconciled Stars'),
(5007001, '2020-12-04 10:00:00', '2020-12-14 03:59:00', 'Gliding Challenge'),
(5006001, '2020-12-11 10:00:00', '2020-12-18 03:59:00', 'While It\'s Warm');


CREATE TABLE `t_announce_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `begin_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `center_system_text` varchar(200) NOT NULL DEFAULT '' COMMENT '中央系统提示文本',
  `count_down_text` varchar(200) NOT NULL DEFAULT '' COMMENT '倒计时提示文本',
  `dungeon_confirm_text` varchar(200) NOT NULL DEFAULT '' COMMENT '地下城确认框文本',
  `center_system_frequency` int(11) NOT NULL COMMENT '跑马灯频率',
  `count_down_frequency` int(11) NOT NULL COMMENT '倒计时频率',
  `channel_config_str` varchar(50) NOT NULL COMMENT '渠道配置',
  `is_center_system_last_5_every_minutes` tinyint(4) NOT NULL DEFAULT 1 COMMENT '跑马灯最后5分钟每分钟通知',
  `channel_id_list` varchar(50) NOT NULL COMMENT '渠道ID列表',
  `platform_type_list` varchar(50) NOT NULL COMMENT '客户端平台类型',
  `enable` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否有效',
  `server_version` varchar(64) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='预告功能配置表';


CREATE TABLE `t_anti_offline_whitelist` (
  `uid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='反脱机挂强对抗白名单';


CREATE TABLE `t_battle_pass_schedule_config` (
  `schedule_id` int(11) NOT NULL COMMENT '排期ID, 与Excel中配置一致',
  `begin_date` date NOT NULL COMMENT '开始日期',
  `end_date` date NOT NULL COMMENT '结束日期',
  PRIMARY KEY (`schedule_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='战令(BattlePass)排期配置表';


CREATE TABLE `t_chat_block_config` (
  `uid` int(10) unsigned NOT NULL,
  `end_time` datetime NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='玩家禁言配置';


CREATE TABLE `t_client_watchdog_uid_list_config` (
  `uid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='watchdog开启名单';


CREATE TABLE `t_cmd_frequency_config` (
  `cmd_id` int(7) unsigned NOT NULL,
  `frequency_limit` float NOT NULL COMMENT '单位时间内最大收包量',
  `discard_packet_freq_limit` float NOT NULL COMMENT '超过此频率时丢弃本次协议包',
  `disconnect_freq_limit` float NOT NULL COMMENT '超过此频率时踢玩家下线'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='协议频率限制配置';


CREATE TABLE `t_cmd_str_frequency_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cmd_str` varchar(200) NOT NULL COMMENT '通信包名',
  `frequency_limit` float NOT NULL COMMENT '单位时间内最大收包量',
  `discard_packet_freq_limit` float NOT NULL COMMENT '超过此频率时丢弃本次协议包',
  `disconnect_freq_limit` float NOT NULL COMMENT '超过此频率时踢玩家下线',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='协议频率限制配置';


CREATE TABLE `t_feature_block_config` (
  `uid` int(10) unsigned NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `end_time` datetime NOT NULL,
  `begin_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`uid`,`type`) USING BTREE,
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='玩家玩法封禁配置';


CREATE TABLE `t_feature_switch_off_config` (
  `id` int(11) unsigned NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `msg` varchar(1000) NOT NULL DEFAULT '',
  `desc` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='关闭系统开关表';

INSERT INTO `t_feature_switch_off_config` (`id`, `type`, `msg`, `desc`) VALUES
(900, 9, '{\"config_id\": 0}', 'FEATURE_SWITCH_RECHARGE');


CREATE TABLE `t_gacha_newbie_url_config` (
  `priority` int(11) unsigned NOT NULL COMMENT '优先级',
  `gacha_prob_url` varchar(512) NOT NULL DEFAULT '' COMMENT '扭蛋概率展示url',
  `gacha_record_url` varchar(512) NOT NULL DEFAULT '' COMMENT '扭蛋记录url',
  PRIMARY KEY (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='新手扭蛋url配置';

INSERT INTO `t_gacha_newbie_url_config` (`priority`, `gacha_prob_url`, `gacha_record_url`) VALUES
(9999, CONCAT('http://', @base_url, '/gacha/info/16?authkey_ver=1&sign_type=2&auth_appid=webview_gacha'), CONCAT('http://', @base_url, '/gacha/log/100?authkey_ver=1&sign_type=2&auth_appid=webview_gacha'));


CREATE TABLE `t_gacha_schedule_config` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `gacha_type` int(11) NOT NULL DEFAULT 0 COMMENT '扭蛋类型',
  `begin_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `cost_item_id` int(11) unsigned NOT NULL COMMENT '消耗材料ID',
  `cost_item_num` int(11) unsigned NOT NULL COMMENT '消耗材料数量',
  `gacha_pool_id` int(11) unsigned NOT NULL COMMENT 'Gacha根ID',
  `gacha_prob_rule_id` int(11) unsigned NOT NULL COMMENT 'Gacha概率配置ID',
  `gacha_up_config` varchar(512) NOT NULL DEFAULT '' COMMENT 'UP配置',
  `gacha_rule_config` varchar(512) NOT NULL DEFAULT '' COMMENT '保底规则配置',
  `gacha_prefab_path` varchar(512) NOT NULL DEFAULT '' COMMENT '扭蛋Prefab路径',
  `gacha_preview_prefab_path` varchar(512) NOT NULL DEFAULT '' COMMENT '扭蛋预览Prefab路径',
  `gacha_prob_url` varchar(512) NOT NULL DEFAULT '' COMMENT '扭蛋概率展示url',
  `gacha_record_url` varchar(512) NOT NULL DEFAULT '' COMMENT '扭蛋记录url',
  `gacha_prob_url_oversea` varchar(512) NOT NULL DEFAULT '' COMMENT '海外扭蛋概率展示url',
  `gacha_record_url_oversea` varchar(512) NOT NULL DEFAULT '' COMMENT '海外扭蛋记录url',
  `gacha_sort_id` int(11) unsigned NOT NULL COMMENT '扭蛋排序权重',
  `enabled` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0不生效，1生效',
  `title_textmap` varchar(256) NOT NULL DEFAULT '' COMMENT 'Gacha显示多语言文本',
  `display_up4_item_list` varchar(512) NOT NULL DEFAULT '' COMMENT '显示up4星物品',
  `desc` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`schedule_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='扭蛋活动配置';

INSERT INTO `t_gacha_schedule_config` (`schedule_id`, `gacha_type`, `begin_time`, `end_time`, `cost_item_id`, `cost_item_num`, `gacha_pool_id`, `gacha_prob_rule_id`, `gacha_up_config`, `gacha_rule_config`, `gacha_prefab_path`, `gacha_preview_prefab_path`, `gacha_prob_url`, `gacha_record_url`, `gacha_prob_url_oversea`, `gacha_record_url_oversea`, `gacha_sort_id`, `enabled`, `title_textmap`, `display_up4_item_list`, `desc`) VALUES
(22, 200, '2020-09-28 00:00:00', '2106-02-07 06:28:15', 224, 1, 101, 3, '{}', '{}', 'GachaShowPanel_A022', 'UI_Tab_GachaShowPanel_A022', CONCAT('http://', @base_url, '/gacha/info/22?authkey_ver=1&sign_type=2&auth_appid=webview_gacha'), CONCAT('http://', @base_url, '/gacha/record/200?authkey_ver=1&sign_type=2&auth_appid=webview_gacha'), '', '', 1000, 1, 'UI_GACHA_SHOW_PANEL_A022_TITLE', '', 'Wanderlust Invocation; new prefab (1.1+)'),
(23, 301, '2020-11-11 11:00:00', '2020-12-01 17:59:59', 223, 1, 201, 1, '{"gacha_up_list":[{"item_parent_type":1,"prob":500,"item_list":[1033]},{"item_parent_type":2,"prob":500,"item_list":[1039,1024,1027]}]}', '{}', 'GachaShowPanel_A023', 'UI_Tab_GachaShowPanel_A023', CONCAT('http://', @base_url, '/gacha/info/23?authkey_ver=1&sign_type=2&auth_appid=webview_gacha'), CONCAT('http://', @base_url, '/gacha/record/301?authkey_ver=1&sign_type=2&auth_appid=webview_gacha'), '', '', 9998, 1, 'UI_GACHA_SHOW_PANEL_A023_TITLE', '1039,1024,1027', 'Farewell of Snezhnaya'),
(24, 301, '2020-12-01 18:00:00', '2020-12-22 14:59:59', 223, 1, 201, 1, '{"gacha_up_list":[{"item_parent_type":1,"prob":500,"item_list":[1030]},{"item_parent_type":2,"prob":500,"item_list":[1044,1020,1036]}]}', '{}', 'GachaShowPanel_A024', 'UI_Tab_GachaShowPanel_A024', CONCAT('http://', @base_url, '/gacha/info/24?authkey_ver=1&sign_type=2&auth_appid=webview_gacha'), CONCAT('http://', @base_url, '/gacha/record/301?authkey_ver=1&sign_type=2&auth_appid=webview_gacha'), '', '', 9998, 0, 'UI_GACHA_SHOW_PANEL_A024_TITLE', '1044,1020,1036', 'Gentry of Hermitage'),
(25, 302, '2020-11-11 11:00:00', '2020-12-01 17:59:59', 223, 1, 201, 2, '{"gacha_up_list":[{"item_parent_type":1,"prob":500,"item_list":[14504,15501]},{"item_parent_type":2,"prob":500,"item_list":[11402,12405,14409,15405,13407]}]}', '{}', 'GachaShowPanel_A025', 'UI_Tab_GachaShowPanel_A025', CONCAT('http://', @base_url, '/gacha/info/25?authkey_ver=1&sign_type=2&auth_appid=webview_gacha'), CONCAT('http://', @base_url, '/gacha/record/302?authkey_ver=1&sign_type=2&auth_appid=webview_gacha'), '', '', 9997, 1, 'UI_GACHA_SHOW_PANEL_A025_TITLE', '11402,12405,14409,15405,13407', 'Epitome Invocation'),
(26, 302, '2020-12-01 18:00:00', '2020-12-22 14:59:59', 223, 1, 201, 2, '{"gacha_up_list":[{"item_parent_type":1,"prob":500,"item_list":[13504,12504]},{"item_parent_type":2,"prob":500,"item_list":[11403,12402,13401,14409,15401]}]}', '{}', 'GachaShowPanel_A026', 'UI_Tab_GachaShowPanel_A026', CONCAT('http://', @base_url, '/gacha/info/26?authkey_ver=1&sign_type=2&auth_appid=webview_gacha'), CONCAT('http://', @base_url, '/gacha/record/302?authkey_ver=1&sign_type=2&auth_appid=webview_gacha'), '', '', 9997, 0, 'UI_GACHA_SHOW_PANEL_A026_TITLE', '11403,12402,13401,14409,15401', 'Epitome Invocation');


CREATE TABLE `t_gameplay_recommendation_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '条目ID',
  `begin_time` datetime NOT NULL COMMENT '生效时间',
  `json_str` mediumtext NOT NULL COMMENT '定义为proto::GameplayRecommendationConfig',
  `enabled` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0不生效，1生效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `begin_time` (`begin_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='养成推荐数据';


CREATE TABLE `t_h5_activity_schedule_config` (
  `schedule_id` int(11) NOT NULL COMMENT '排期ID',
  `activity_id` int(11) NOT NULL COMMENT '活动ID',
  `begin_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `content_close_time` datetime NOT NULL COMMENT '玩法结束时间',
  `prefab_path` varchar(512) NOT NULL DEFAULT '' COMMENT '活动底图文件',
  `url_cn` varchar(512) NOT NULL DEFAULT '' COMMENT '活动链接（国内）',
  `url_os` varchar(512) NOT NULL DEFAULT '' COMMENT '活动链接（海外）',
  `is_entrance_open` tinyint(4) NOT NULL DEFAULT 1 COMMENT '入口开关：0关闭，1开放',
  PRIMARY KEY (`schedule_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='H5活动排期配置';


CREATE TABLE `t_inject_fix_config` (
  `config_id` int(11) unsigned NOT NULL,
  `inject_fix` blob NOT NULL COMMENT 'inject_fix',
  `uid_list` varchar(4096) NOT NULL DEFAULT '' COMMENT '白名单多个,隔开，空表示不开启白名单',
  `platform_type_list` varchar(4096) NOT NULL DEFAULT '' COMMENT '(如安卓 ios) 多个,隔开，空表示对平台不做要求',
  `percent` tinyint(3) NOT NULL DEFAULT 0 COMMENT '灰度百分比',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='inject_fix 配置表';


CREATE TABLE `t_live_schedule_config` (
  `live_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '直播ID',
  `begin_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `live_url` varchar(512) NOT NULL DEFAULT '' COMMENT '直播地址',
  `spare_live_url` varchar(512) NOT NULL DEFAULT '' COMMENT '备用直播地址',
  PRIMARY KEY (`live_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='直播排期表';


CREATE TABLE `t_login_black_ip_config` (
  `ip` int(10) unsigned NOT NULL,
  `ip_str` varchar(64) NOT NULL COMMENT '对应的字符串',
  PRIMARY KEY (`ip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='注册&登录ip黑名单';


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
  `importance` int(11) NOT NULL DEFAULT 0,
  `is_collectible` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0不可收藏，1可收藏',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='每日登入奖励配置';

INSERT INTO `t_login_reward_config` VALUES
("1010", "0", "MATH_EXPR_LEVEL >= 5", "30", "Reward - Wings of Companionship", "P • A • I • M • O • N", "Dear Travelers,\nThe special stylized wind glider \"Wings of Companionship\" has been sent to all Travelers who have joined us on our journey as thank for supporting and encouraging us all this while. Spread your wings and soar across the skies of Teyvat to your heart's content! Note: The Dressing Room feature is unlocked by progressing in the game. You can equip this once that feature is unlocked.", "{\n  ""item_list"": [\n    {\n      ""item_id"": 140002,\n      ""item_num"": 1\n    }\n  ]\n}", "1", "2020-08-28 02:00:00", "2099-12-31 23:59:59", "1", "", "0", "1"),
("1011", "0", "MATH_EXPR_LEVEL >= 5", "30", "Genshin Impact Release Exclusive Rewards", "P • A • I • M • O • N", "Dear Traveler,\nThank you for supporting Genshin Impact! Please take these exclusive rewards to celebrate the game going live.", "{\n  ""item_list"": [\n    {\n      ""item_id"": 202,\n      ""item_num"": 2500\n    },\n    {\n      ""item_id"": 104002,\n      ""item_num"": 3\n    },\n    {\n      ""item_id"": 108020,\n      ""item_num"": 3\n    },\n    {\n      ""item_id"": 100002,\n      ""item_num"": 12\n    }\n  ]\n}", "1", "2020-08-28 02:00:00", "2099-12-31 23:59:59", "1", "", "0", "1"),
("1012", "0", "MATH_EXPR_LEVEL >= 5", "30", "3M Pre-Registrations Milestone Reward", "P • A • I • M • O • N", "Dear Travelers,\nThanks to your support, we reached 3 million official website pre-registrations for Genshin Impact! We also hit all our social media targets! To thank you for the love you've shown us, we would like to present these gifts to all of you: Acquaint Fate x10, Adventurer's Experience x10, Fine Enhancement Ore x10, Mondstadt Hash Brown x5, Cream Stew x5, Fisherman's Toast x5, and Mora x10,000. May you have a wonderful journey ahead!", "{\n  ""item_list"": [\n    {\n      ""item_id"": 202,\n      ""item_num"": 10000\n    },\n    {\n      ""item_id"": 224,\n      ""item_num"": 10\n    },\n    {\n      ""item_id"": 104002,\n      ""item_num"": 10\n    },\n    {\n      ""item_id"": 108046,\n      ""item_num"": 5\n    },\n    {\n      ""item_id"": 108038,\n      ""item_num"": 5\n    },\n    {\n      ""item_id"": 104012,\n      ""item_num"": 10\n    },\n    {\n      ""item_id"": 108002,\n      ""item_num"": 5\n    }\n  ]\n}", "1", "2020-08-28 02:00:00", "2099-12-31 23:59:59", "1", "", "0", "1"),
("1013", "0", "MATH_EXPR_LEVEL >= 10", "30", "10M Global Pre-Registrations Milestone Reward", "P • A • I • M • O • N", "Dear Travelers,\nThanks to your support\n Genshin Impact reached 10 million pre-registrations across all platforms and regions. To celebrate our encounter\n we would like to present all of you with this\n pre-registration milestone reward: Acquaint Fate x10. The journey has begun\nand we hope that you will enjoy yours!", "{\n  ""item_list"": [\n    {\n      ""item_id"": 224,\n      ""item_num"": 10\n    }\n  ]\n}", "1", "2020-08-28 02:00:00", "2099-12-31 23:59:59", "1", "", "0", "1"),
("1014", "0", "MATH_EXPR_LEVEL >= 5", "30", "PS Exclusive Rewards", "P • A • I • M • O • N", "Dear Traveler, thank you for your support thus far. Here are your PS exclusive rewards!", "{\n  ""item_list"": [\n    {\n      ""item_id"": 11412,\n      ""item_num"": 1,\n      ""item_level"": 1\n    },\n    {\n      ""item_id"": 140003,\n      ""item_num"": 1\n    }\n  ]\n}", "1", "2020-08-28 02:00:00", "2099-12-31 23:59:59", "1", "", "0", "1");


CREATE TABLE `t_luashell_config` (
  `luashell_config_id` int(11) unsigned NOT NULL,
  `lua_shell` mediumblob NOT NULL COMMENT 'lua脚本',
  `uid_list` varchar(4096) NOT NULL DEFAULT '' COMMENT '白名单多个,隔开，空表示不开启白名单',
  `platform_type_list` varchar(4096) NOT NULL DEFAULT '' COMMENT '(如安卓 ios) 多个,隔开，空表示对平台不做要求',
  `percent` tinyint(3) NOT NULL DEFAULT 0 COMMENT '灰度百分比',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '创建时间',
  `protocol_type` int(2) unsigned NOT NULL DEFAULT 0 COMMENT '协议类型',
  `use_type` int(11) unsigned NOT NULL DEFAULT 1 COMMENT '用于标识luashell的用途：1.普通luashell；2.安全库lua',
  `is_check_client_report` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否检查客户端回复上报',
  `is_kick` tinyint(1) NOT NULL DEFAULT 0 COMMENT '检查客户端回复失败后是否踢下线',
  `check_json_key` varchar(32) NOT NULL DEFAULT '' COMMENT '检查客户端回复的key的字符串',
  `channel` int(11) NOT NULL DEFAULT 0 COMMENT '下发通道',
  PRIMARY KEY (`luashell_config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='luashell 配置表';


CREATE TABLE `t_mail_block_tag_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='邮件屏蔽标签配置';


CREATE TABLE `t_mtp_blacklist_config` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '默认主键',
  `type` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '对抗类型',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MTP要踢下线的黑名单ID';


CREATE TABLE `t_mtp_whitelist_config` (
  `id` int(11) NOT NULL COMMENT 'mtp上报id',
  `reason` varchar(512) NOT NULL COMMENT 'mtp上报id对应的reason',
  `match_type` int(11) NOT NULL COMMENT '匹配类型：1、2、3分别表示包含、开头、单一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MTP白名单';


CREATE TABLE `t_op_activity_schedule_config` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '排期ID',
  `config_id` int(11) NOT NULL DEFAULT 0 COMMENT '活动配置ID',
  `begin_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`schedule_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='运营活动配置';


CREATE TABLE `t_questionnaire_mail_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_valid_days` int(11) NOT NULL,
  `email_title` varchar(200) NOT NULL,
  `email_sender` varchar(200) NOT NULL,
  `email_content` text NOT NULL,
  `item_list` varchar(1024) NOT NULL COMMENT '奖励列表，proto3的json格式',
  `begin_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0不生效，1生效',
  `tag` varchar(200) NOT NULL DEFAULT '' COMMENT '标签',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='邮件配置';


CREATE TABLE `t_rebate_config` (
  `account_type` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '账号类型',
  `account_uid` varchar(128) NOT NULL DEFAULT '' COMMENT '绑定的账号UID',
  `item_list` varchar(128) NOT NULL DEFAULT '' COMMENT '充值返利道具列表，先逗号再冒号分隔',
  PRIMARY KEY (`account_type`,`account_uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='充值返利名单';


CREATE TABLE `t_red_point_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '条目ID',
  `content_id` int(11) unsigned NOT NULL COMMENT '活动ID或调查问卷ID等二级ID',
  `trigger_time` datetime NOT NULL COMMENT '触发时间',
  `expire_time` datetime NOT NULL COMMENT '失效时间',
  `red_point_type` int(11) unsigned NOT NULL COMMENT '红点类型（红点ID/红点位key）',
  `is_daily_refresh` int(11) unsigned NOT NULL COMMENT '是否进行每日刷新',
  `daily_refresh_second` int(11) unsigned NOT NULL COMMENT '每天0点开始的第几秒进行每日刷新',
  `player_level` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '最小玩家等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='全服红点配置';


CREATE TABLE `t_register_black_ip_config` (
  `ip` varchar(64) NOT NULL,
  `ip_desc` varchar(256) NOT NULL DEFAULT '' COMMENT 'IP地址备注信息',
  PRIMARY KEY (`ip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='注册ip黑名单';


CREATE TABLE `t_security_library_config` (
  `platform_type_str` varchar(64) NOT NULL DEFAULT '' COMMENT '平台类型，定义在define.proto的PlatformType',
  `version_str` varchar(64) NOT NULL DEFAULT '' COMMENT '版本号',
  `md5_list` text NOT NULL COMMENT 'md5校验值，逗号分隔',
  `is_forbid_login` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'MD5不一致时是否禁止登录',
  `enabled` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0不生效，1生效',
  PRIMARY KEY (`platform_type_str`,`version_str`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='安全库配置';


CREATE TABLE `t_sign_in_schedule_config` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '排期ID',
  `config_id` int(11) NOT NULL DEFAULT 0 COMMENT '签到配置ID',
  `begin_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`schedule_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='签到活动配置';


CREATE TABLE `t_stop_server_login_white_ip_config` (
  `ip` varchar(32) NOT NULL,
  `desc` varchar(32) NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='停服时二级dispatch登录白名单';


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
  `tr` text NOT NULL COMMENT '土耳其语',
  `it` text NOT NULL COMMENT '意大利语',
  PRIMARY KEY (`text_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='服务端的textmap一般用于邮件，需要控制条目，因为全部加载到内存中';


SET foreign_key_checks = 1;