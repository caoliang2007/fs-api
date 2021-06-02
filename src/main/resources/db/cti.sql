/*
 Navicat Premium Data Transfer

 Source Server         : tencent
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : 115.159.101.178:3306
 Source Schema         : cti

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 02/06/2021 12:02:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cc_admin_account
-- ----------------------------
DROP TABLE IF EXISTS `cc_admin_account`;
CREATE TABLE `cc_admin_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `passwd` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `user_type` int(11) NOT NULL COMMENT '类型',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='企业管理员表';

-- ----------------------------
-- Table structure for cc_admin_account_role
-- ----------------------------
DROP TABLE IF EXISTS `cc_admin_account_role`;
CREATE TABLE `cc_admin_account_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `account_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '账号ID',
  `role_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='账号角色表';

-- ----------------------------
-- Table structure for cc_admin_permission
-- ----------------------------
DROP TABLE IF EXISTS `cc_admin_permission`;
CREATE TABLE `cc_admin_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业id',
  `permission_name` varchar(255) NOT NULL DEFAULT '' COMMENT '权限名称',
  `permission_url` varchar(255) NOT NULL DEFAULT '' COMMENT '权限URL',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '父权限id',
  `permission_order` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `is_front` int(11) NOT NULL DEFAULT '1' COMMENT '是否前端权限',
  `is_interface` int(11) NOT NULL DEFAULT '1' COMMENT '是否后端权限',
  `status` int(11) NOT NULL DEFAULT '1',
  `permission_level` int(11) NOT NULL DEFAULT '1' COMMENT '菜单级别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限表';

-- ----------------------------
-- Table structure for cc_admin_permission_role
-- ----------------------------
DROP TABLE IF EXISTS `cc_admin_permission_role`;
CREATE TABLE `cc_admin_permission_role` (
  `id` bigint(20) NOT NULL COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `role_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `permission_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '权限ID',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限角色表';

-- ----------------------------
-- Table structure for cc_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `cc_admin_role`;
CREATE TABLE `cc_admin_role` (
  `id` bigint(20) NOT NULL COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属企业',
  `role_name` varchar(255) NOT NULL DEFAULT '' COMMENT '角色名称',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Table structure for cc_agent
-- ----------------------------
DROP TABLE IF EXISTS `cc_agent`;
CREATE TABLE `cc_agent` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `agent_id` varchar(255) NOT NULL DEFAULT '' COMMENT '坐席工号',
  `agent_key` varchar(255) NOT NULL DEFAULT '' COMMENT '坐席账户',
  `agent_name` varchar(255) NOT NULL DEFAULT '' COMMENT '坐席名称',
  `agent_code` varchar(20) NOT NULL DEFAULT '' COMMENT '坐席分机号',
  `agent_type` int(11) NOT NULL DEFAULT '2' COMMENT '座席类型：2:普通座席；1：班长',
  `passwd` varchar(255) NOT NULL DEFAULT '' COMMENT '座席密码',
  `sip_phone` varchar(255) NOT NULL DEFAULT '' COMMENT '绑定的电话号码',
  `record` int(11) NOT NULL DEFAULT '0' COMMENT '是否录音 0 no 1 yes',
  `group_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '座席主要技能组  不能为空 必填项',
  `after_interval` int(11) NOT NULL DEFAULT '5' COMMENT '话后自动空闲间隔时长',
  `diaplay` varchar(255) NOT NULL DEFAULT '' COMMENT '主叫显号',
  `ring_time` int(11) NOT NULL DEFAULT '10' COMMENT '振铃时长',
  `ext1` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展1',
  `ext2` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展2',
  `ext3` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展3',
  `status` int(4) NOT NULL DEFAULT '1' COMMENT '状态：1 开通，0关闭',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_ccagent_agent_key` (`agent_key`) USING BTREE,
  KEY `idx_ccagent_company_id` (`company_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14092 DEFAULT CHARSET=utf8 COMMENT='座席工号表';

-- ----------------------------
-- Table structure for cc_agent_group
-- ----------------------------
DROP TABLE IF EXISTS `cc_agent_group`;
CREATE TABLE `cc_agent_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `agent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '坐席id',
  `group_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '技能组id',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_idx_agentgroup_agent_group` (`group_id`,`agent_id`) USING BTREE,
  KEY `idx_agentgroup_company_id` (`company_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='坐席技能组表';

-- ----------------------------
-- Table structure for cc_agent_sip
-- ----------------------------
DROP TABLE IF EXISTS `cc_agent_sip`;
CREATE TABLE `cc_agent_sip` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cts` bigint(20) NOT NULL DEFAULT '0',
  `uts` bigint(20) NOT NULL DEFAULT '0',
  `company_id` bigint(20) DEFAULT '0',
  `sip` varchar(32) NOT NULL DEFAULT '',
  `agent_id` bigint(20) NOT NULL DEFAULT '0',
  `sip_pwd` varchar(255) DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_agentsip_agent_id` (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='sip表';

-- ----------------------------
-- Table structure for cc_agent_state_log
-- ----------------------------
DROP TABLE IF EXISTS `cc_agent_state_log`;
CREATE TABLE `cc_agent_state_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业id',
  `group_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '主技能组id',
  `agent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '坐席id',
  `agent_key` varchar(255) NOT NULL DEFAULT '' COMMENT '坐席编号',
  `call_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '通话唯一标识',
  `login_type` int(11) NOT NULL DEFAULT '1' COMMENT '登录类型',
  `work_type` int(11) NOT NULL DEFAULT '1' COMMENT '工作类型',
  `host` varchar(255) NOT NULL DEFAULT '' COMMENT '服务站点',
  `remote_address` varchar(255) NOT NULL DEFAULT '' COMMENT '远端地址',
  `before_state` varchar(50) NOT NULL DEFAULT '' COMMENT '变更之前状态',
  `before_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '更变之前时间',
  `state` varchar(50) NOT NULL DEFAULT '' COMMENT '变更之后状态',
  `state_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '当前时间',
  `duration` int(11) NOT NULL DEFAULT '0' COMMENT '持续时间',
  `busy_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '忙碌类型',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `ext1` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展字段1',
  `ext2` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展字段2',
  `ext3` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展字段3',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_agentstate_agentkey` (`agent_key`),
  KEY `idx_agentstate_cts` (`state_time`) USING BTREE,
  KEY `idx_agentstate_group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2496 DEFAULT CHARSET=utf8 COMMENT='坐席状态历史表';

-- ----------------------------
-- Table structure for cc_call_detail
-- ----------------------------
DROP TABLE IF EXISTS `cc_call_detail`;
CREATE TABLE `cc_call_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `start_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `call_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '通话ID',
  `detail_index` int(11) NOT NULL DEFAULT '1' COMMENT '顺序',
  `transfer_type` int(11) NOT NULL DEFAULT '0' COMMENT '1:进vdn,2:进ivr,3:技能组,4:按键收号,5:外线\n',
  `transfer_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '转接ID',
  `reason` varchar(50) NOT NULL DEFAULT '' COMMENT '出队列原因:排队挂机或者转坐席',
  `ext1` varchar(50) NOT NULL DEFAULT '' COMMENT '扩展字段1',
  `ext2` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展字段2',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_calldetail_call_id` (`call_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通话流程表';

-- ----------------------------
-- Table structure for cc_call_device
-- ----------------------------
DROP TABLE IF EXISTS `cc_call_device`;
CREATE TABLE `cc_call_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `call_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '通话ID',
  `device_id` varchar(255) NOT NULL DEFAULT '' COMMENT '设备id',
  `agent_key` varchar(255) NOT NULL DEFAULT '' COMMENT '坐席',
  `device_type` int(11) NOT NULL DEFAULT '1' COMMENT '1:坐席,2:客户,3:外线',
  `cdr_type` int(11) NOT NULL DEFAULT '1' COMMENT '1:呼入,2:外呼,3:内呼,4:转接,5:咨询,6:监听,7:强插',
  `caller` varchar(50) NOT NULL DEFAULT '' COMMENT '主叫',
  `called` varchar(50) NOT NULL DEFAULT '' COMMENT '被叫',
  `display` varchar(50) NOT NULL DEFAULT '' COMMENT '显号',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '归属地',
  `call_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '呼叫开始时间',
  `ring_start_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '振铃开始时间',
  `ring_end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '振铃结束时间',
  `answer_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '接通时间',
  `bridge_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '桥接时间',
  `end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `talk_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '通话时长',
  `sip_protocol` varchar(50) NOT NULL DEFAULT '' COMMENT '信令协议(tcp/udp)',
  `hangup_cause` varchar(50) NOT NULL COMMENT '挂机原因',
  `sip_to_uri` varchar(50) NOT NULL DEFAULT '' COMMENT 'sip呼叫地址',
  `ext1` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展字段1',
  `sip_status` varchar(50) NOT NULL DEFAULT '' COMMENT 'sip状态',
  `ext2` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展字段2',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_calldetail__call_id` (`call_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=712 DEFAULT CHARSET=utf8mb4 COMMENT='通话参与表';

-- ----------------------------
-- Table structure for cc_call_dtmf
-- ----------------------------
DROP TABLE IF EXISTS `cc_call_dtmf`;
CREATE TABLE `cc_call_dtmf` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `dtmf_key` varchar(255) NOT NULL DEFAULT '' COMMENT '按键号码',
  `process_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '业务流程id',
  `call_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '通话标识id',
  `dtmf_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '按键时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='呼叫按键表';

-- ----------------------------
-- Table structure for cc_call_log
-- ----------------------------
DROP TABLE IF EXISTS `cc_call_log`;
CREATE TABLE `cc_call_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '落单时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业id',
  `call_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '话单id',
  `caller_display` varchar(255) NOT NULL DEFAULT '' COMMENT '主叫显号',
  `caller` varchar(50) NOT NULL DEFAULT '' COMMENT '主叫',
  `called_display` varchar(255) NOT NULL DEFAULT '' COMMENT '被叫显号',
  `called` varchar(50) NOT NULL DEFAULT '' COMMENT '被叫',
  `agent_key` varchar(20) NOT NULL DEFAULT '' COMMENT '坐席',
  `group_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '技能组',
  `login_type` int(11) NOT NULL DEFAULT '1' COMMENT '1:sip号,2:webrtc,3:手机',
  `task_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '任务ID',
  `ivr_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'ivr',
  `bot_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '机器人id',
  `call_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '呼叫开始时间',
  `answer_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '接听时间',
  `end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `call_type` varchar(32) NOT NULL DEFAULT '' COMMENT '呼叫类型',
  `direction` varchar(32) NOT NULL DEFAULT '' COMMENT '呼叫方向',
  `answer_flag` int(11) NOT NULL DEFAULT '0' COMMENT '通话标识(0:接通,1:坐席未接用户未接,2:坐席接通用户未接通,3:用户接通坐席未接通)',
  `wait_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '累计等待时长',
  `answer_count` int(11) NOT NULL DEFAULT '0' COMMENT '应答设备数',
  `hangup_dir` int(11) NOT NULL DEFAULT '1' COMMENT '挂机方向(1:主叫挂机,2:被叫挂机,3:系统挂机)',
  `hangup_cause` varchar(255) NOT NULL DEFAULT '' COMMENT '挂机原因',
  `media` varchar(255) NOT NULL DEFAULT '' COMMENT '媒体服务器',
  `record` varchar(255) NOT NULL DEFAULT '' COMMENT '录音地址',
  `talk_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '通话时长(秒)',
  `follow_data` varchar(2048) NOT NULL DEFAULT '' COMMENT '通话随路数据(2048)',
  `uuid1` varchar(50) NOT NULL DEFAULT '' COMMENT '扩展1',
  `uuid2` varchar(50) NOT NULL DEFAULT '' COMMENT '扩展2',
  `ext1` varchar(50) NOT NULL DEFAULT '' COMMENT '扩展3',
  `ext2` varchar(50) NOT NULL DEFAULT '' COMMENT '扩展4',
  `ext3` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展5',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_calllog_call_id` (`call_id`) USING BTREE,
  KEY `idx_calllog_create_time` (`call_time`) USING BTREE,
  KEY `idx_call_log_agent` (`agent_key`),
  KEY `idx_call_log_group` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=658 DEFAULT CHARSET=utf8mb4 COMMENT='话单表';

-- ----------------------------
-- Table structure for cc_company
-- ----------------------------
DROP TABLE IF EXISTS `cc_company`;
CREATE TABLE `cc_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `id_path` varchar(255) NOT NULL DEFAULT '' COMMENT '父企业ID',
  `pid` bigint(20) NOT NULL DEFAULT '0' COMMENT '父企业',
  `company_code` varchar(255) NOT NULL DEFAULT '' COMMENT '简称',
  `contact` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '电话',
  `balance` bigint(20) NOT NULL DEFAULT '0' COMMENT '金额',
  `bill_type` int(11) NOT NULL DEFAULT '0' COMMENT '1:呼出计费,2:呼入计费,3:双向计费,0:全免费',
  `pay_type` int(11) NOT NULL DEFAULT '0' COMMENT '0:预付费;1:后付费',
  `hidden_customer` int(11) NOT NULL DEFAULT '0' COMMENT '隐藏客户号码(0:不隐藏;1:隐藏)',
  `secret_key` varchar(32) NOT NULL DEFAULT '' COMMENT '验证秘钥',
  `ivr_limit` int(11) NOT NULL DEFAULT '50' COMMENT 'IVR通道数',
  `agent_limit` int(11) NOT NULL DEFAULT '50' COMMENT '开通坐席',
  `group_limit` int(11) NOT NULL DEFAULT '10' COMMENT '开通技能组',
  `group_agent_limit` int(11) NOT NULL DEFAULT '1000' COMMENT '单技能组中坐席上限',
  `agent_state` int(11) NOT NULL DEFAULT '0' COMMENT '坐席状态统计',
  `inbound_stat` int(11) NOT NULL DEFAULT '0' COMMENT '呼入报表统计',
  `outbound_stat` int(11) NOT NULL DEFAULT '0' COMMENT '外呼报表统计',
  `group_wait_stat` int(11) NOT NULL DEFAULT '0' COMMENT '技能组排队统计',
  `blacklist` bigint(20) NOT NULL DEFAULT '0' COMMENT '黑名单',
  `notify_url` varchar(255) NOT NULL DEFAULT '' COMMENT '话单回调通知',
  `ext1` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展1',
  `ext2` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展2',
  `ext3` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展3',
  `ext4` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展4',
  `ext5` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展5',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态(1:启用,0:未启用)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_unqidx_name` (`name`),
  UNIQUE KEY `company_unqidx_code` (`company_code`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COMMENT='企业信息表';

-- ----------------------------
-- Table structure for cc_company_display
-- ----------------------------
DROP TABLE IF EXISTS `cc_company_display`;
CREATE TABLE `cc_company_display` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '号码池',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1:主叫显号,2:被叫显号',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `uni_idx_company_display` (`company_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='号码池表';

-- ----------------------------
-- Table structure for cc_company_phone
-- ----------------------------
DROP TABLE IF EXISTS `cc_company_phone`;
CREATE TABLE `cc_company_phone` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业id',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '号码',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1:呼入号码,2:主叫显号,3:被叫显号',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1:未启用,2:启用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_idx_companyphone_phone` (`company_id`,`phone`,`type`),
  KEY `idx_companyhpone_company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='企业号码';

-- ----------------------------
-- Table structure for cc_company_phone_group
-- ----------------------------
DROP TABLE IF EXISTS `cc_company_phone_group`;
CREATE TABLE `cc_company_phone_group` (
  `id` bigint(20) NOT NULL COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `display_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '号码池id',
  `phone_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '号码id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for cc_group
-- ----------------------------
DROP TABLE IF EXISTS `cc_group`;
CREATE TABLE `cc_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '新增时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '技能组名称',
  `control_flag` int(11) NOT NULL DEFAULT '0' COMMENT '控制开关：0：技能组控制(1:技能组,2:坐席)',
  `after_interval` int(11) NOT NULL DEFAULT '5' COMMENT '话后自动空闲时长',
  `caller_display_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '主叫显号号码池',
  `called_display_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '被叫显号号码池',
  `level_value` int(11) NOT NULL DEFAULT '1' COMMENT '技能组优先级',
  `tts_play` int(11) NOT NULL DEFAULT '0' COMMENT '播放工号(0:不播放,1:中文,2:英文)',
  `tts_content` varchar(100) NOT NULL DEFAULT '' COMMENT '播放内容',
  `evaluate` bigint(20) NOT NULL DEFAULT '0' COMMENT '转服务评价(0:否,1:是)',
  `queue_play` bigint(20) NOT NULL DEFAULT '0' COMMENT '排队音',
  `transfer_play` bigint(20) NOT NULL DEFAULT '0' COMMENT '转接提示音',
  `group_type` int(11) NOT NULL DEFAULT '0' COMMENT '技能组类型',
  `notify_position` int(11) NOT NULL DEFAULT '0' COMMENT '0:不播放排队位置,1:播放排队位置',
  `notify_rate` int(11) NOT NULL DEFAULT '10' COMMENT '频次',
  `notify_content` varchar(255) NOT NULL DEFAULT '' COMMENT '您前面还有$位用户在等待',
  `call_memory` int(11) NOT NULL DEFAULT '1' COMMENT '主叫记忆(1:开启,0:不开启)',
  `ext1` varchar(50) NOT NULL DEFAULT '' COMMENT '扩展1',
  `ext2` varchar(50) NOT NULL DEFAULT '' COMMENT '扩展2',
  `ext3` varchar(50) NOT NULL DEFAULT '' COMMENT '扩展3',
  `ext4` varchar(50) NOT NULL DEFAULT '' COMMENT '扩展4',
  `ext5` varchar(50) NOT NULL DEFAULT '' COMMENT '扩展5',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_company_name` (`company_id`,`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='技能组表';

-- ----------------------------
-- Table structure for cc_group_lineup_strategy
-- ----------------------------
DROP TABLE IF EXISTS `cc_group_lineup_strategy`;
CREATE TABLE `cc_group_lineup_strategy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT ' 创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `group_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '技能组id',
  `strategy_type` int(11) NOT NULL DEFAULT '1' COMMENT '1:内置策略,2:自定义',
  `default_value` int(11) NOT NULL DEFAULT '1' COMMENT '(1最长空闲时间、2最长平均空闲、3最少应答次数、4最少通话时长、5最长话后时长、6轮选、7随机)',
  `custom_expression` varchar(255) NOT NULL DEFAULT '' COMMENT '自定义表达式',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='坐席策略';

-- ----------------------------
-- Table structure for cc_group_memory
-- ----------------------------
DROP TABLE IF EXISTS `cc_group_memory`;
CREATE TABLE `cc_group_memory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `agent_key` varchar(32) NOT NULL DEFAULT '' COMMENT '坐席',
  `group_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '技能组ID',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '客户电话',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_idx_group_id` (`group_id`,`phone`,`agent_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='坐席与客户记忆表';

-- ----------------------------
-- Table structure for cc_group_memory_config
-- ----------------------------
DROP TABLE IF EXISTS `cc_group_memory_config`;
CREATE TABLE `cc_group_memory_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `group_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '技能组ID',
  `success_strategy` int(11) NOT NULL DEFAULT '0' COMMENT '匹配成功策略',
  `success_strategy_value` bigint(20) NOT NULL DEFAULT '0' COMMENT '匹配成功策略值',
  `fail_strategy` int(11) NOT NULL DEFAULT '0' COMMENT '匹配失败策略',
  `fail_strategy_value` bigint(20) NOT NULL DEFAULT '0' COMMENT '匹配失败策略值',
  `memory_day` int(11) NOT NULL DEFAULT '30' COMMENT '记忆天数',
  `inbound_cover` int(11) NOT NULL DEFAULT '0' COMMENT '呼入覆盖',
  `outbound_cover` int(11) NOT NULL DEFAULT '0' COMMENT '外呼覆盖',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_idx_group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='技能组坐席记忆配置表';

-- ----------------------------
-- Table structure for cc_group_overflow
-- ----------------------------
DROP TABLE IF EXISTS `cc_group_overflow`;
CREATE TABLE `cc_group_overflow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `group_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '技能组ID',
  `overflow_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '溢出策略ID',
  `level_value` int(11) NOT NULL DEFAULT '1' COMMENT '优先级',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_idx_group_overflow` (`group_id`,`overflow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='技能组排队策略表';

-- ----------------------------
-- Table structure for cc_group_strategy_exp
-- ----------------------------
DROP TABLE IF EXISTS `cc_group_strategy_exp`;
CREATE TABLE `cc_group_strategy_exp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `group_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '技能组id',
  `strategy_key` varchar(20) NOT NULL DEFAULT '' COMMENT '自定义值',
  `strategy_present` int(11) NOT NULL DEFAULT '1' COMMENT '百分百',
  `strategy_type` int(11) NOT NULL DEFAULT '1' COMMENT '类型',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='坐席自定义策略表';

-- ----------------------------
-- Table structure for cc_overflow_config
-- ----------------------------
DROP TABLE IF EXISTS `cc_overflow_config`;
CREATE TABLE `cc_overflow_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) DEFAULT '0' COMMENT '企业id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `handle_type` int(11) NOT NULL DEFAULT '1' COMMENT '1:排队,2:溢出,3:挂机',
  `busy_type` int(11) DEFAULT '1' COMMENT '排队方式(1:先进先出,2:vip,3:自定义)',
  `queue_timeout` int(11) DEFAULT '60' COMMENT '排队超时时间',
  `busy_timeout_type` int(11) DEFAULT '1' COMMENT '排队超时(1:溢出,2:挂机)',
  `overflow_type` int(11) DEFAULT '1' COMMENT '溢出(1:group,2:ivr,3:vdn)',
  `overflow_value` int(11) DEFAULT '0' COMMENT '溢出值',
  `lineup_expression` varchar(255) DEFAULT '' COMMENT '自定义排队表达式',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_idx_name` (`company_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='溢出策略表';

-- ----------------------------
-- Table structure for cc_overflow_exp
-- ----------------------------
DROP TABLE IF EXISTS `cc_overflow_exp`;
CREATE TABLE `cc_overflow_exp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `overflow_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '溢出策略ID',
  `exp_key` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义值',
  `rate` int(11) NOT NULL DEFAULT '1' COMMENT '权重',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='自定义溢出策略优先级';

-- ----------------------------
-- Table structure for cc_overflow_front
-- ----------------------------
DROP TABLE IF EXISTS `cc_overflow_front`;
CREATE TABLE `cc_overflow_front` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `overflow_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '策略ID',
  `front_key` varchar(20) NOT NULL DEFAULT '' COMMENT 'key',
  `compare_condition` int(11) NOT NULL DEFAULT '0' COMMENT '5种条件',
  `rank_value_start` int(11) NOT NULL DEFAULT '0',
  `rank_value` int(11) NOT NULL DEFAULT '0' COMMENT '符号条件值',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='溢出策略前置条件';

-- ----------------------------
-- Table structure for cc_playback
-- ----------------------------
DROP TABLE IF EXISTS `cc_playback`;
CREATE TABLE `cc_playback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL COMMENT '企业ID',
  `playback` varchar(255) NOT NULL DEFAULT '' COMMENT '放音文件',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1:待审核,2:审核通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='语音文件表';

-- ----------------------------
-- Table structure for cc_push_fail_log
-- ----------------------------
DROP TABLE IF EXISTS `cc_push_fail_log`;
CREATE TABLE `cc_push_fail_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业id',
  `call_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'callid',
  `send_times` int(11) NOT NULL DEFAULT '1' COMMENT '发送次数',
  `send_url` varchar(255) NOT NULL DEFAULT '' COMMENT '发送次数',
  `content` varchar(4000) NOT NULL DEFAULT '' COMMENT '推送内容',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态(1:推送，0:不推送)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for cc_route_call
-- ----------------------------
DROP TABLE IF EXISTS `cc_route_call`;
CREATE TABLE `cc_route_call` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属企业',
  `route_group_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属路由组',
  `route_num` varchar(32) NOT NULL DEFAULT '' COMMENT '字冠号码',
  `num_max` int(11) NOT NULL DEFAULT '0' COMMENT '最长',
  `num_min` int(11) NOT NULL DEFAULT '0' COMMENT '最短',
  `caller_change` int(11) NOT NULL DEFAULT '0' COMMENT '主叫替换规则',
  `caller_change_num` varchar(32) NOT NULL DEFAULT '' COMMENT '替换号码',
  `called_change` int(11) NOT NULL DEFAULT '0' COMMENT '被叫替换规则',
  `called_change_num` varchar(32) NOT NULL DEFAULT '' COMMENT '替换号码',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `unq_idx_route` (`company_id`,`route_num`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='字冠路由表';

-- ----------------------------
-- Table structure for cc_route_getway
-- ----------------------------
DROP TABLE IF EXISTS `cc_route_getway`;
CREATE TABLE `cc_route_getway` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '号码',
  `media_host` varchar(255) NOT NULL DEFAULT '' COMMENT '媒体地址',
  `media_port` int(11) NOT NULL DEFAULT '0' COMMENT '媒体端口',
  `caller_prefix` varchar(255) NOT NULL DEFAULT '' COMMENT '主叫号码前缀',
  `called_prefix` varchar(255) NOT NULL DEFAULT '' COMMENT '被叫号码前缀',
  `sip_header1` varchar(255) NOT NULL DEFAULT '' COMMENT 'sip头1',
  `sip_header2` varchar(255) NOT NULL DEFAULT '' COMMENT 'sip头2',
  `sip_header3` varchar(255) NOT NULL DEFAULT '' COMMENT 'sip头3',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uindex_getway_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='媒体网关表';

-- ----------------------------
-- Table structure for cc_route_getway_group
-- ----------------------------
DROP TABLE IF EXISTS `cc_route_getway_group`;
CREATE TABLE `cc_route_getway_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `getway_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '媒体网关',
  `route_group_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '网关组',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='路由字冠关联组表';

-- ----------------------------
-- Table structure for cc_route_group
-- ----------------------------
DROP TABLE IF EXISTS `cc_route_group`;
CREATE TABLE `cc_route_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `route_group` varchar(255) NOT NULL DEFAULT '' COMMENT '网关组',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='网关组';

-- ----------------------------
-- Table structure for cc_schedule_config
-- ----------------------------
DROP TABLE IF EXISTS `cc_schedule_config`;
CREATE TABLE `cc_schedule_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '日程名称',
  `level_value` int(11) NOT NULL DEFAULT '1' COMMENT '优先级',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1:指定时间,2:相对时间',
  `start_day` varchar(20) NOT NULL DEFAULT '' COMMENT '开始日期',
  `end_day` varchar(20) NOT NULL DEFAULT '' COMMENT '结束日期',
  `start_time` varchar(20) NOT NULL DEFAULT '' COMMENT '开始时间',
  `end_time` varchar(20) NOT NULL DEFAULT '' COMMENT '结束时间',
  `mon` int(11) NOT NULL DEFAULT '1' COMMENT '周一',
  `tue` int(11) NOT NULL DEFAULT '1' COMMENT '周二',
  `wed` int(11) NOT NULL DEFAULT '1' COMMENT '周三',
  `thu` int(11) NOT NULL DEFAULT '1' COMMENT '周四',
  `fri` int(11) NOT NULL DEFAULT '1' COMMENT '周五',
  `sat` int(11) NOT NULL DEFAULT '1' COMMENT '周六',
  `sun` int(11) NOT NULL DEFAULT '1' COMMENT '周天',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='日程表';

-- ----------------------------
-- Table structure for cc_skill
-- ----------------------------
DROP TABLE IF EXISTS `cc_skill`;
CREATE TABLE `cc_skill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业id',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='技能表';

-- ----------------------------
-- Table structure for cc_skill_agent
-- ----------------------------
DROP TABLE IF EXISTS `cc_skill_agent`;
CREATE TABLE `cc_skill_agent` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业id',
  `skill_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '技能id',
  `agent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '坐席id',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '范围',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='坐席技能表';

-- ----------------------------
-- Table structure for cc_skill_group
-- ----------------------------
DROP TABLE IF EXISTS `cc_skill_group`;
CREATE TABLE `cc_skill_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `skill_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '技能ID',
  `group_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '技能组ID',
  `rank_about` int(11) NOT NULL DEFAULT '1' COMMENT '等级类型(1:全部,2:等于,3:>,4:<,5:介于)',
  `rank_value_start` int(11) NOT NULL DEFAULT '0' COMMENT '介于的开始值',
  `rank_value` int(11) NOT NULL DEFAULT '1' COMMENT '等级值',
  `rate` int(11) NOT NULL DEFAULT '100' COMMENT '占用率',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_group_id` (`group_id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='技能组技能表';

-- ----------------------------
-- Table structure for cc_vdn_code
-- ----------------------------
DROP TABLE IF EXISTS `cc_vdn_code`;
CREATE TABLE `cc_vdn_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'vdn名称',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='呼入路由表';

-- ----------------------------
-- Table structure for cc_vdn_phone
-- ----------------------------
DROP TABLE IF EXISTS `cc_vdn_phone`;
CREATE TABLE `cc_vdn_phone` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `vdn_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '路由码',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '特服号',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_idx_phone` (`vdn_id`,`company_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='路由号码表';

-- ----------------------------
-- Table structure for cc_vdn_schedule
-- ----------------------------
DROP TABLE IF EXISTS `cc_vdn_schedule`;
CREATE TABLE `cc_vdn_schedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '子码日程',
  `vdn_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'vdn_id',
  `schedule_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '日程id',
  `route_type` int(11) NOT NULL DEFAULT '1' COMMENT '路由类型(1:技能组,2:放音,3:ivr,4:坐席,5:外呼)',
  `route_value` varchar(255) NOT NULL DEFAULT '0' COMMENT '路由类型值',
  `play_type` int(11) NOT NULL DEFAULT '0' COMMENT '放音类型(1:按键导航,2:技能组,3:ivr,4:路由字码,5:挂机)',
  `play_value` bigint(20) NOT NULL DEFAULT '0' COMMENT '放音类型对应值',
  `dtmf_end` varchar(255) NOT NULL DEFAULT '*' COMMENT '结束音',
  `retry` int(11) NOT NULL DEFAULT '1' COMMENT '重复播放次数',
  `dtmf_max` int(11) NOT NULL DEFAULT '1' COMMENT '最大收键长度',
  `dtmf_min` int(11) NOT NULL DEFAULT '1' COMMENT '最小收键长度',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='路由字码表';

-- ----------------------------
-- Table structure for cc_vdn_schedule_dtmf
-- ----------------------------
DROP TABLE IF EXISTS `cc_vdn_schedule_dtmf`;
CREATE TABLE `cc_vdn_schedule_dtmf` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cts` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uts` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `navigate_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '按键导航ID',
  `dtmf` varchar(20) NOT NULL DEFAULT '1' COMMENT '按键',
  `route_type` int(11) NOT NULL DEFAULT '0' COMMENT '路由类型(1:技能组,2:IVR,3:路由字码,4:坐席分机,5:挂机)',
  `route_value` bigint(20) NOT NULL DEFAULT '0' COMMENT '路由值',
  `status` int(11) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='按键导航表';

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ruid` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) DEFAULT NULL,
  `contact` varchar(255) NOT NULL DEFAULT '',
  `received` varchar(128) DEFAULT NULL,
  `path` varchar(512) DEFAULT NULL,
  `expires` datetime NOT NULL DEFAULT '2030-05-28 21:32:15',
  `q` float(10,2) NOT NULL DEFAULT '1.00',
  `callid` varchar(255) NOT NULL DEFAULT 'Default-Call-ID',
  `cseq` int(11) NOT NULL DEFAULT '1',
  `last_modified` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  `flags` int(11) NOT NULL DEFAULT '0',
  `cflags` int(11) NOT NULL DEFAULT '0',
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `socket` varchar(64) DEFAULT NULL,
  `methods` int(11) DEFAULT NULL,
  `instance` varchar(255) DEFAULT NULL,
  `reg_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ruid_idx` (`ruid`) USING BTREE,
  KEY `account_contact_idx` (`username`,`domain`,`contact`) USING BTREE,
  KEY `expires_idx` (`expires`) USING BTREE,
  KEY `IDX_CA_CO_US` (`callid`,`contact`,`username`) USING BTREE,
  KEY `IDX_CONTACT` (`contact`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=718 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for siu_users
-- ----------------------------
DROP TABLE IF EXISTS `siu_users`;
CREATE TABLE `siu_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL COMMENT '企业ID',
  `sip_id` varchar(50) NOT NULL COMMENT 'SIP账号',
  `sip_password` varchar(255) NOT NULL COMMENT 'SIP密码',
  `subaccound` varchar(255) DEFAULT NULL COMMENT '子帐号',
  `subtoken` varchar(255) DEFAULT NULL COMMENT '子帐号令牌',
  `bind_phoneid` int(255) DEFAULT NULL COMMENT '绑定的特服号ID',
  `ccsdirectcallflag` tinyint(4) DEFAULT '1' COMMENT 'ccs是否支持硬话机外呼（0：不允许；1：允许)',
  `sip_domain` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '类型：1 ivr，2 ccs',
  `stationno` int(11) DEFAULT NULL COMMENT '绑定IVR或CCS站点号',
  `status` int(11) DEFAULT '1' COMMENT '账号是否有效：0：无效；1：有效',
  `ctime` int(11) DEFAULT NULL,
  `utime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `sip_id` (`sip_id`) USING BTREE,
  KEY `sip_companyid` (`companyid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60862 DEFAULT CHARSET=utf8 COMMENT='SIP用户注册表';

-- ----------------------------
-- Table structure for ss_station
-- ----------------------------
DROP TABLE IF EXISTS `ss_station`;
CREATE TABLE `ss_station` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `station_no` int(11) NOT NULL COMMENT '站点号',
  `station_type` int(11) NOT NULL COMMENT '站点类型:2:MG;3:SS；4：CCS;5:IVR;6:AAA,7:DBA;8:OAMSERVICE;9:WEBSERVICE;10:PDS;11:DIALER;12:SCHEDULE;13:CTISERVER;14:FILESERVER;15:APISERVER;16:statservice;17:TTS;18:cti录音模块.19：pdsmanage模块,20:NLP;21:ccsproxy;22:pushserver;100:ACD;101:newIVR;102clpss；103：crontab',
  `ipaddr` varchar(32) DEFAULT NULL COMMENT 'IP地址',
  `ipport` int(11) DEFAULT NULL COMMENT 'IP端口',
  `redundance_ip` varchar(255) DEFAULT NULL COMMENT '冗余站点IP地址',
  `redundance_port` int(11) DEFAULT NULL COMMENT '冗余站点端口',
  `ipaddr_bak` varchar(20) DEFAULT NULL COMMENT '备用的IP，连接OAM的ws用',
  `ipport_bak` int(5) DEFAULT NULL COMMENT '备用的端口，连接OAM的ws用 ccs开放pdstcp端口',
  `ivrflowpath` varchar(255) DEFAULT NULL COMMENT 'IVR站点流程路径',
  `validurl` varchar(255) DEFAULT NULL COMMENT '站点监听的有效URL（此字段为空，将以IP地址字段和Port字段拼出该站点URL）',
  `redundance_validurl` varchar(255) DEFAULT NULL COMMENT '站点监听的冗余有效URL（此字段为空，将以IP地址字段和Port字段拼出该站点URL）',
  `ccswebsocketurl` varchar(255) DEFAULT NULL COMMENT 'CCS websocket URL',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `socketport` int(11) DEFAULT '0' COMMENT 'OAM，SS监听的TCP端口',
  `ss_media_ip` varchar(32) DEFAULT NULL COMMENT 'SS媒体服务器地址',
  `ss_media_port` int(11) DEFAULT NULL COMMENT 'SS媒体服务器端口',
  `ss_media_playpath` varchar(255) DEFAULT NULL COMMENT 'SS对应的媒体服务器放音路径',
  `ss_media_recordpath` varchar(255) DEFAULT NULL COMMENT 'SS对应的媒体服务器录音路径',
  `ss_media_fileserverport` int(11) DEFAULT NULL COMMENT 'ss对应的媒体服务器文件接收端口或IVR文件接收端口',
  `register_ip` varchar(255) DEFAULT NULL COMMENT 'SIP注册服务器地址',
  `register_port` int(11) DEFAULT NULL COMMENT 'SIP注册服务器端口',
  `cti_linkid` varchar(100) DEFAULT '' COMMENT 'CTI连接ID',
  `cti_userid` varchar(100) DEFAULT '' COMMENT 'CTI用户ID',
  `cti_password` varchar(100) DEFAULT '' COMMENT 'CTI用户密码',
  `media_for_lan` int(11) DEFAULT '0' COMMENT 'MG是否用于内网，0代表本MG不用于内网，1代表本MG仅用于内网。默认是0',
  `register_ip_lan` varchar(255) DEFAULT '' COMMENT '当MG用于内网的时候，注册的IP地址。',
  `register_port_lan` int(11) DEFAULT '0' COMMENT '当MG用于内网的时候，注册的端口',
  `tts_path` varchar(255) DEFAULT '' COMMENT '下载tts的wav文件存放的路径',
  `tts_gateway_ip` varchar(255) DEFAULT '' COMMENT 'tts网关url',
  `record_auth` varchar(255) DEFAULT '' COMMENT 'cti录音模块的auth',
  `is_leader` tinyint(4) DEFAULT '0' COMMENT '站点是主备：1:主:，2:被，0: 默认没有含义',
  `station_group` int(11) DEFAULT '0' COMMENT '站点分组概念主要服务于双中心。pds只加载同一个组里的任务',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `memo` (`memo`) USING BTREE,
  KEY `index_no` (`station_no`) USING BTREE,
  KEY `prim_ip_index` (`ipaddr`) USING BTREE,
  KEY `redundance_ip_index` (`redundance_ip`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8 COMMENT='站点信息表';

-- ----------------------------
-- Table structure for ss_stationrelation
-- ----------------------------
DROP TABLE IF EXISTS `ss_stationrelation`;
CREATE TABLE `ss_stationrelation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '站点关联表',
  `stationno` int(11) DEFAULT NULL COMMENT '站点号',
  `peer_no` int(11) DEFAULT NULL COMMENT '关联站点号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_station_peer` (`stationno`,`peer_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8 COMMENT='站点关联表';

-- ----------------------------
-- Table structure for version
-- ----------------------------
DROP TABLE IF EXISTS `version`;
CREATE TABLE `version` (
  `table_name` varchar(32) NOT NULL,
  `table_version` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  UNIQUE KEY `table_name_idx` (`table_name`) USING BTREE,
  KEY `idx_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
