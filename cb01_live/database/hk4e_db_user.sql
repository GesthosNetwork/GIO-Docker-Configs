SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';


USE `hk4e_db_user`;


CREATE TABLE `t_player_data_0` (
  `uid` int(10) unsigned NOT NULL DEFAULT 0,
  `nickname` varchar(128) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT 0,
  `exp` int(10) unsigned NOT NULL DEFAULT 0,
  `vip_point` int(10) unsigned NOT NULL DEFAULT 0,
  `json_data` varchar(512) NOT NULL DEFAULT '',
  `bin_data` mediumblob NOT NULL,
  `data_version` int(10) unsigned NOT NULL DEFAULT 0,
  `tag_list` varchar(128) NOT NULL DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_save_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='玩家核心数据包';


CREATE TABLE `t_player_data_1` (
  `uid` int(10) unsigned NOT NULL DEFAULT 0,
  `nickname` varchar(128) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT 0,
  `exp` int(10) unsigned NOT NULL DEFAULT 0,
  `vip_point` int(10) unsigned NOT NULL DEFAULT 0,
  `json_data` varchar(512) NOT NULL DEFAULT '',
  `bin_data` mediumblob NOT NULL,
  `data_version` int(10) unsigned NOT NULL DEFAULT 0,
  `tag_list` varchar(128) NOT NULL DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_save_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='玩家核心数据包';


CREATE TABLE `t_player_data_2` (
  `uid` int(10) unsigned NOT NULL DEFAULT 0,
  `nickname` varchar(128) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT 0,
  `exp` int(10) unsigned NOT NULL DEFAULT 0,
  `vip_point` int(10) unsigned NOT NULL DEFAULT 0,
  `json_data` varchar(512) NOT NULL DEFAULT '',
  `bin_data` mediumblob NOT NULL,
  `data_version` int(10) unsigned NOT NULL DEFAULT 0,
  `tag_list` varchar(128) NOT NULL DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_save_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='玩家核心数据包';


CREATE TABLE `t_player_data_3` (
  `uid` int(10) unsigned NOT NULL DEFAULT 0,
  `nickname` varchar(128) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT 0,
  `exp` int(10) unsigned NOT NULL DEFAULT 0,
  `vip_point` int(10) unsigned NOT NULL DEFAULT 0,
  `json_data` varchar(512) NOT NULL DEFAULT '',
  `bin_data` mediumblob NOT NULL,
  `data_version` int(10) unsigned NOT NULL DEFAULT 0,
  `tag_list` varchar(128) NOT NULL DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_save_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='玩家核心数据包';


CREATE TABLE `t_player_data_4` (
  `uid` int(10) unsigned NOT NULL DEFAULT 0,
  `nickname` varchar(128) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT 0,
  `exp` int(10) unsigned NOT NULL DEFAULT 0,
  `vip_point` int(10) unsigned NOT NULL DEFAULT 0,
  `json_data` varchar(512) NOT NULL DEFAULT '',
  `bin_data` mediumblob NOT NULL,
  `data_version` int(10) unsigned NOT NULL DEFAULT 0,
  `tag_list` varchar(128) NOT NULL DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_save_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='玩家核心数据包';


CREATE TABLE `t_player_data_5` (
  `uid` int(10) unsigned NOT NULL DEFAULT 0,
  `nickname` varchar(128) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT 0,
  `exp` int(10) unsigned NOT NULL DEFAULT 0,
  `vip_point` int(10) unsigned NOT NULL DEFAULT 0,
  `json_data` varchar(512) NOT NULL DEFAULT '',
  `bin_data` mediumblob NOT NULL,
  `data_version` int(10) unsigned NOT NULL DEFAULT 0,
  `tag_list` varchar(128) NOT NULL DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_save_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='玩家核心数据包';


CREATE TABLE `t_player_data_6` (
  `uid` int(10) unsigned NOT NULL DEFAULT 0,
  `nickname` varchar(128) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT 0,
  `exp` int(10) unsigned NOT NULL DEFAULT 0,
  `vip_point` int(10) unsigned NOT NULL DEFAULT 0,
  `json_data` varchar(512) NOT NULL DEFAULT '',
  `bin_data` mediumblob NOT NULL,
  `data_version` int(10) unsigned NOT NULL DEFAULT 0,
  `tag_list` varchar(128) NOT NULL DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_save_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='玩家核心数据包';


CREATE TABLE `t_player_data_7` (
  `uid` int(10) unsigned NOT NULL DEFAULT 0,
  `nickname` varchar(128) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT 0,
  `exp` int(10) unsigned NOT NULL DEFAULT 0,
  `vip_point` int(10) unsigned NOT NULL DEFAULT 0,
  `json_data` varchar(512) NOT NULL DEFAULT '',
  `bin_data` mediumblob NOT NULL,
  `data_version` int(10) unsigned NOT NULL DEFAULT 0,
  `tag_list` varchar(128) NOT NULL DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_save_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='玩家核心数据包';


CREATE TABLE `t_player_data_8` (
  `uid` int(10) unsigned NOT NULL DEFAULT 0,
  `nickname` varchar(128) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT 0,
  `exp` int(10) unsigned NOT NULL DEFAULT 0,
  `vip_point` int(10) unsigned NOT NULL DEFAULT 0,
  `json_data` varchar(512) NOT NULL DEFAULT '',
  `bin_data` mediumblob NOT NULL,
  `data_version` int(10) unsigned NOT NULL DEFAULT 0,
  `tag_list` varchar(128) NOT NULL DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_save_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='玩家核心数据包';


CREATE TABLE `t_player_data_9` (
  `uid` int(10) unsigned NOT NULL DEFAULT 0,
  `nickname` varchar(128) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT 0,
  `exp` int(10) unsigned NOT NULL DEFAULT 0,
  `vip_point` int(10) unsigned NOT NULL DEFAULT 0,
  `json_data` varchar(512) NOT NULL DEFAULT '',
  `bin_data` mediumblob NOT NULL,
  `data_version` int(10) unsigned NOT NULL DEFAULT 0,
  `tag_list` varchar(128) NOT NULL DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_save_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='玩家核心数据包';


CREATE TABLE `t_player_uid` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_type` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '账号类型',
  `account_uid` varchar(128) NOT NULL DEFAULT '' COMMENT '绑定的账号UID',
  `create_time` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `ext` varchar(512) NOT NULL DEFAULT '' COMMENT '自定义信息，Json格式',
  `tag` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'TAG，由MUIP设置',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE KEY `account_type_account_uid` (`account_type`,`account_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=100000001 DEFAULT CHARSET=utf8mb4 COMMENT='玩家身份信息表';


SET foreign_key_checks = 1;
