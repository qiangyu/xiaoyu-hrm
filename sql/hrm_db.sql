/*
 Navicat Premium Data Transfer

 Source Server         : aliyun
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : 47.96.164.65:3306
 Source Schema         : hrm_db

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 26/12/2021 15:55:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept_inf
-- ----------------------------
DROP TABLE IF EXISTS `dept_inf`;
CREATE TABLE `dept_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentId` int(11) NULL DEFAULT NULL,
  `depPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enabled` tinyint(1) NULL DEFAULT 1,
  `isParent` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 144 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dept_inf
-- ----------------------------
INSERT INTO `dept_inf` VALUES (1, '总公办', '这是总公办噢', -1, '.1', 1, 1);
INSERT INTO `dept_inf` VALUES (2, '技术部', '这是技术部噢', 1, '.1.4', 1, 1);
INSERT INTO `dept_inf` VALUES (3, '运营部', '这是运营部噢', 1, '.1.4', 1, 0);
INSERT INTO `dept_inf` VALUES (5, '市场部', '这是市场部噢', 1, '.1.4', 1, 1);
INSERT INTO `dept_inf` VALUES (6, '教学部', '这是教学部噢', 1, '.1.4', 1, 0);
INSERT INTO `dept_inf` VALUES (134, '测定', '测试', 1, '.1.134', 1, 0);
INSERT INTO `dept_inf` VALUES (139, 'd d f', 'ddd', 5, '.1.4.139', 1, 0);
INSERT INTO `dept_inf` VALUES (143, 'ty', 'ry', 2, '.1.4.143', 1, 0);

-- ----------------------------
-- Table structure for document_inf
-- ----------------------------
DROP TABLE IF EXISTS `document_inf`;
CREATE TABLE `document_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `is_delete` tinyint(1) NULL DEFAULT 0,
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_DOCUMENT_USER`(`user_id`) USING BTREE,
  CONSTRAINT `FK_DOCUMENT_USER` FOREIGN KEY (`user_id`) REFERENCES `user_inf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of document_inf
-- ----------------------------
INSERT INTO `document_inf` VALUES (30, '再次测试', '数据库脚本', '1585295476466_hrm_db.sql', '/home/hrm/uploads/', 'application/octet-stream', 17738, 0, '2020-03-27 15:51:16', 1);
INSERT INTO `document_inf` VALUES (31, '神鼎飞丹砂', '发生发大水', '1585308664359_Snipaste_2020-03-27_19-30-50.jpg', '/home/hrm/uploads/', 'image/jpeg', 7227, 0, '2020-03-27 19:31:04', 1);
INSERT INTO `document_inf` VALUES (32, 'docker', '操作', '1585314353647_docker.txt', '/home/hrm/uploads/', 'text/plain', 872, 0, '2020-03-27 21:05:54', 1);
INSERT INTO `document_inf` VALUES (34, '图片', '测试', '1586336540239_24c6fedb4a20a4ec.jpg', '/home/hrm/uploads/', 'image/jpeg', 3349, 0, '2020-04-08 17:02:20', 1);
INSERT INTO `document_inf` VALUES (35, '软件测试', '资产管理系统测试需求报告', '1586668517230_资产管理系统测试需求报告.doc', '/home/hrm/uploads/', 'application/octet-stream', 39699, 0, '2020-04-12 13:15:17', 1);
INSERT INTO `document_inf` VALUES (36, 'hadoop', 'hadoop、hbase、mongodb', '1586771294211_hadoop.txt', '/home/hrm/uploads/', 'text/plain', 7546, 0, '2020-04-13 17:48:14', 1);
INSERT INTO `document_inf` VALUES (37, '简历', '初稿', '1588922257403_简历.txt', '/home/hrm/uploads/', 'text/plain', 1573, 0, '2020-05-08 15:17:37', 1);
INSERT INTO `document_inf` VALUES (38, 'jar运行', '后台运行jar', '1589248654455_后台运行jar.txt', '/home/hrm/uploads/', 'text/plain', 46, 0, '2020-05-12 09:57:34', 1);
INSERT INTO `document_inf` VALUES (39, 'vue', 'vue安装运行打包', '1589248682255_vue安装运行打包.txt', '/home/hrm/uploads/', 'text/plain', 86, 0, '2020-05-12 09:58:02', 1);
INSERT INTO `document_inf` VALUES (40, '柴犬', '测试手机上传', '1589268321627_6933889182d6b174.jpg', '/home/hrm/uploads/', 'image/jpeg', 33304, 0, '2020-05-12 15:25:22', 1);
INSERT INTO `document_inf` VALUES (42, 'hrm-index', '系统登录页面', '1589430943532_index.png', '/home/hrm/uploads/', 'image/png', 42548, 0, '2020-05-14 12:35:44', 1);
INSERT INTO `document_inf` VALUES (43, 'hrm-home', '系统主页', '1589430979711_home.png', '/home/hrm/uploads/', 'image/png', 63882, 0, '2020-05-14 12:36:20', 1);
INSERT INTO `document_inf` VALUES (44, 'hrm-userBasic', '系统管理用户模块', '1589431019254_userBasic.png', '/home/hrm/uploads/', 'image/png', 83052, 0, '2020-05-14 12:36:59', 1);
INSERT INTO `document_inf` VALUES (45, 'hrm-userAdd', '系统添加用户模块', '1589431045907_userAdd.png', '/home/hrm/uploads/', 'image/png', 51869, 0, '2020-05-14 12:37:26', 1);
INSERT INTO `document_inf` VALUES (46, 'test', 'test', '1589436116266_08dbc52f154d905a2d1ca1a5000400ae.png', '/home/hrm/uploads/', 'image/png', 392393, 0, '2020-05-14 14:01:56', 1);
INSERT INTO `document_inf` VALUES (47, '2021.10.09 Java作业', 'Java作业', '1633751282535_2021.10.9 Java作业.docx', '/home/xiaoyu/hrm/uploads/', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 825933, 0, '2021-10-09 11:48:03', 1);
INSERT INTO `document_inf` VALUES (49, 'Java源码 2021 10 09', '作业源码', '1634138941395_HomeWorks.java', '/home/xiaoyu/hrm/uploads/', 'application/octet-stream', 5058, 0, '2021-10-13 23:29:01', 1);
INSERT INTO `document_inf` VALUES (50, '钟乐爸爸', '666', '1634145160591_计科6班27钟乐.docx', '/home/xiaoyu/hrm/uploads/', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 373927, 0, '2021-10-14 01:12:41', 1);
INSERT INTO `document_inf` VALUES (51, '练习2', '666', '1634180996578_练习2.doc', '/home/xiaoyu/hrm/uploads/', 'application/msword', 380887, 0, '2021-10-14 11:09:57', 1);
INSERT INTO `document_inf` VALUES (52, '2021.10.14 Java作业', 'Java作业', '1634184083166_2021.10.14 Java作业.docx', '/home/xiaoyu/hrm/uploads/', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1187107, 0, '2021-10-14 12:01:23', 1);
INSERT INTO `document_inf` VALUES (53, '2021.10.14 Java作业源码', 'Java作业源码', '1634184158895_HomeWorks211014.java', '/home/xiaoyu/hrm/uploads/', 'application/octet-stream', 5262, 0, '2021-10-14 12:02:39', 1);
INSERT INTO `document_inf` VALUES (54, '钟乐2', '666', '1634745782091_计科6班27钟乐.docx', '/home/xiaoyu/hrm/uploads/', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 463221, 0, '2021-10-21 00:03:02', 1);
INSERT INTO `document_inf` VALUES (55, '练习3', '999', '1634786607400_练习3.doc', '/home/xiaoyu/hrm/uploads/', 'application/msword', 131584, 0, '2021-10-21 11:23:27', 1);
INSERT INTO `document_inf` VALUES (56, '2021.10.14 Java作业', '2021.10.14 Java作业', '1634788612814_2021.10.21 Java作业.docx', '/home/xiaoyu/hrm/uploads/', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1355057, 0, '2021-10-21 11:56:53', 1);
INSERT INTO `document_inf` VALUES (57, '333', '333', '1635351349567_3.docx', '/home/xiaoyu/hrm/uploads/', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 830157, 0, '2021-10-28 00:15:50', 1);
INSERT INTO `document_inf` VALUES (58, '444', '444', '1635392828312_练习4.docx', '/home/xiaoyu/hrm/uploads/', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 147211, 0, '2021-10-28 11:47:08', 1);
INSERT INTO `document_inf` VALUES (59, '2021.10.20 Java作业', '2021.10.20 Java作业', '1635393929712_2021.10.28 Java作业.docx', '/home/xiaoyu/hrm/uploads/', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1703015, 0, '2021-10-28 12:05:30', 1);
INSERT INTO `document_inf` VALUES (60, 'Java 练习作业 2021.11.11', 'Java 练习作业 2021.11.11', '1636599101607_练习5.docx', '/home/xiaoyu/hrm/uploads/', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 37343, 0, '2021-11-11 10:51:42', 1);
INSERT INTO `document_inf` VALUES (61, '1', '123213', '1636600567790_第五次课.zip', '/home/xiaoyu/hrm/uploads/', 'application/x-zip-compressed', 63277, 0, '2021-11-11 11:16:08', 1);
INSERT INTO `document_inf` VALUES (62, 'Java作业 2021.11.11', 'Java作业 2021.11.11', '1636603713627_计科6班 钟强裕 33.zip', '/home/xiaoyu/hrm/uploads/', 'application/x-zip-compressed', 320512, 0, '2021-11-11 12:08:34', 1);
INSERT INTO `document_inf` VALUES (63, '1', '1', '1637208194162_练习6.docx', '/home/xiaoyu/hrm/uploads/', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 123629, 0, '2021-11-18 12:03:14', 1);
INSERT INTO `document_inf` VALUES (68, '2021.11.18 Java作业', '2021.11.18 Java作业', '1638406623001_2021.11.18 Java作业.docx', '/home/xiaoyu/hrm/uploads/', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1313925, 0, '2021-12-02 08:57:03', 1);
INSERT INTO `document_inf` VALUES (69, 'java第7次练习', 'java第7次练习', '1638411578107_第7次练习.docx', '/home/xiaoyu/hrm/uploads/', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 126033, 0, '2021-12-02 10:19:38', 1);
INSERT INTO `document_inf` VALUES (70, '2021.12.02 Java作业', '2021.12.02 Java作业', '1638414728980_2021.12.02 Java作业.docx', '/home/xiaoyu/hrm/uploads/', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1284406, 0, '2021-12-02 11:12:09', 1);
INSERT INTO `document_inf` VALUES (72, 'Java 2021 12 09 第8次练习', 'Java 2021 12 09 第8次练习', '1639017152979_第8次练习.docx', '/home/xiaoyu/hrm/uploads/', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 78380, 0, '2021-12-09 10:32:33', 1);
INSERT INTO `document_inf` VALUES (73, '2021.12.09 Java作业', '2021.12.09 Java作业', '1639022513889_2021.12.09 Java作业.docx', '/home/xiaoyu/hrm/uploads/', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 3700176, 0, '2021-12-09 12:01:54', 1);
INSERT INTO `document_inf` VALUES (74, '2021 12 16 Java 第9次练习', '2021 12 16 Java 第9次练习', '1639622428874_Java 第9次练习.zip', '/home/xiaoyu/hrm/uploads/', 'application/x-zip-compressed', 55896, 0, '2021-12-16 10:40:29', 1);
INSERT INTO `document_inf` VALUES (75, '2021.12.16 Java作业', '2021.12.16 Java作业', '1639982617454_2021.12.16 Java作业.docx', '/home/xiaoyu/hrm/uploads/', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 3649255, 0, '2021-12-20 14:43:37', 1);
INSERT INTO `document_inf` VALUES (76, '2021.12.20 Java 第10次练习', '2021.12.20 Java 第10次练习', '1639989510516_2021.12.20 Java 第10次练习.docx', '/home/xiaoyu/hrm/uploads/', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 284493, 0, '2021-12-20 16:38:31', 1);
INSERT INTO `document_inf` VALUES (77, '99999', '9999', '1639993027130_第9次练习答案.zip', '/home/xiaoyu/hrm/uploads/', 'application/x-zip-compressed', 3280, 0, '2021-12-20 17:37:07', 1);
INSERT INTO `document_inf` VALUES (78, '《面向对象程序设计》大作业', '《面向对象程序设计》大作业', '1640191820063_《面向对象程序设计》大作业.zip', '/home/xiaoyu/hrm/uploads/', 'application/x-zip-compressed', 1571488, 0, '2021-12-23 00:50:20', 1);
INSERT INTO `document_inf` VALUES (79, '计科6班钟乐27', '计科6班钟乐27', '1640219709179_计科6班钟乐27.zip', '/home/xiaoyu/hrm/uploads/', 'application/zip', 5348722, 0, '2021-12-23 08:35:09', 1);
INSERT INTO `document_inf` VALUES (80, '2021.12.23 《面向对象程序设计》课程设计', '2021.12.23 《面向对象程序设计》课程设计', '1640230186400_《面向对象程序设计》课程设计.docx', '/home/xiaoyu/hrm/uploads/', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 24616, 0, '2021-12-23 11:29:46', 1);
INSERT INTO `document_inf` VALUES (81, '12', '12', '1640413476294_聚合.txt', '/home/xiaoyu/hrm/uploads/', 'text/plain', 1032, 0, '2021-12-25 14:24:36', 1);

-- ----------------------------
-- Table structure for employee_inf
-- ----------------------------
DROP TABLE IF EXISTS `employee_inf`;
CREATE TABLE `employee_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `card_id` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `post_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qq_num` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` int(11) NOT NULL DEFAULT 1,
  `party` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` datetime(0) NULL DEFAULT NULL,
  `race` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `education` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `speciality` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hobby` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_EMP_DEPT`(`dept_id`) USING BTREE,
  INDEX `FK_EMP_JOB`(`job_id`) USING BTREE,
  CONSTRAINT `FK_EMP_DEPT` FOREIGN KEY (`dept_id`) REFERENCES `dept_inf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_EMP_JOB` FOREIGN KEY (`job_id`) REFERENCES `job_inf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1005 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of employee_inf
-- ----------------------------
INSERT INTO `employee_inf` VALUES (3, 1, 2, 'bb', '432801197711251038', '广州', '510000', '020-99999999', '13907351532', '36750064', '36750064@qq.com', 1, '中共党员', '2021-12-24 00:00:00', '汉族', '本科', '计算机', '爬山', '无', '2016-07-14 00:00:00');
INSERT INTO `employee_inf` VALUES (1000, 2, 3, '123', '123123244565146', '1242541', '123431', '123531412254', '13543535223', '13141241', '211123@qq.com', 1, '共青团员', '2020-03-05 00:00:00', '汉族', '硕士', '123', '12312', '123123', '2020-03-25 00:00:00');
INSERT INTO `employee_inf` VALUES (1001, 3, 3, '123', '123123244565146', '1242541', '123431', '123531412254', '13543535223', '13141241', '211123@qq.com', 1, '共青团员', '2020-03-05 00:00:00', '汉族', '硕士', '123', '12312', '123123', '2020-03-25 00:00:00');
INSERT INTO `employee_inf` VALUES (1002, 2, 3, '123', '123123244565146', '1242541', '123431', '123531412254', '13543535223', '13141241', '211123@qq.com', 1, '共青团员', '2020-03-05 00:00:00', '汉族', '硕士', '123', '12312', '123123', '2020-03-25 00:00:00');
INSERT INTO `employee_inf` VALUES (1003, 6, 3, '123', '123123244565146', '1242541', '123431', '123531412254', '13543535223', '13141241', '211123@qq.com', 1, '共青团员', '2020-03-05 00:00:00', '汉族', '硕士', '123', '12312', '123123', '2020-03-25 00:00:00');
INSERT INTO `employee_inf` VALUES (1004, 134, 1, '四个字的', '42312432131412', '2131423534', '12312421', '241412411', '13213432221', '123114', '123321@qq.com', 0, '中共党员', '2020-03-02 00:00:00', '汉族', '高中', '信息管理与信息系统', '123', '2313', '2020-03-25 00:00:00');

-- ----------------------------
-- Table structure for job_inf
-- ----------------------------
DROP TABLE IF EXISTS `job_inf`;
CREATE TABLE `job_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createDate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of job_inf
-- ----------------------------
INSERT INTO `job_inf` VALUES (1, '职员', '职员', '2018-01-11 00:00:00', 1);
INSERT INTO `job_inf` VALUES (2, 'Java开发工程师', 'Java开发工程师', '2018-01-11 00:00:00', 1);
INSERT INTO `job_inf` VALUES (3, 'Java中级开发工程师', 'Java中级开发工程师', '2018-01-11 00:00:00', 1);
INSERT INTO `job_inf` VALUES (4, 'Java高级开发工程师', 'Java高级开发工程师', '2018-01-11 00:00:00', 1);
INSERT INTO `job_inf` VALUES (6, '架构师', '架构师', '2018-01-11 00:00:00', 1);
INSERT INTO `job_inf` VALUES (7, '主管', '主管', '2018-01-11 00:00:00', 1);
INSERT INTO `job_inf` VALUES (8, '经理', '经理', '2018-01-11 00:00:00', 1);
INSERT INTO `job_inf` VALUES (30, '电工', '电工', '2020-08-25 12:21:39', 1);
INSERT INTO `job_inf` VALUES (31, '无敌开发岗', '给钱无敌多', '2020-11-03 17:54:43', 1);
INSERT INTO `job_inf` VALUES (32, 'wqw', 'qwqw', '2021-04-17 16:43:54', 1);
INSERT INTO `job_inf` VALUES (33, '1212', '211212', '2021-04-17 16:44:20', 1);

-- ----------------------------
-- Table structure for log_login
-- ----------------------------
DROP TABLE IF EXISTS `log_login`;
CREATE TABLE `log_login`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `operating` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型：login登陆、logout注销',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆ip',
  `date` datetime(0) NOT NULL COMMENT '登陆时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 271 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of log_login
-- ----------------------------
INSERT INTO `log_login` VALUES (113, 'admin', 'login', '223.73.168.179', '2021-04-15 10:16:45');
INSERT INTO `log_login` VALUES (114, 'admin', 'login', '223.73.168.179', '2021-04-15 10:28:27');
INSERT INTO `log_login` VALUES (115, 'admin', 'logout', '223.73.168.179', '2021-04-15 10:31:25');
INSERT INTO `log_login` VALUES (116, 'admin', 'login', '113.54.196.102', '2021-04-17 16:39:33');
INSERT INTO `log_login` VALUES (117, 'admin', 'login', '101.206.166.68', '2021-04-17 22:18:06');
INSERT INTO `log_login` VALUES (118, 'admin', 'login', '14.26.76.45', '2021-04-18 13:11:30');
INSERT INTO `log_login` VALUES (119, 'admin', 'login', '124.203.212.6', '2021-04-24 15:32:58');
INSERT INTO `log_login` VALUES (120, 'admin', 'logout', '124.203.212.6', '2021-04-24 15:34:56');
INSERT INTO `log_login` VALUES (121, 'admin', 'login', '124.203.212.6', '2021-04-24 15:35:16');
INSERT INTO `log_login` VALUES (122, 'admin', 'login', '124.203.212.6', '2021-04-24 15:37:11');
INSERT INTO `log_login` VALUES (123, 'admin', 'login', '124.203.212.6', '2021-04-24 15:37:48');
INSERT INTO `log_login` VALUES (124, 'admin', 'login', '124.203.212.6', '2021-04-24 15:38:32');
INSERT INTO `log_login` VALUES (125, 'admin', 'login', '223.73.168.118', '2021-05-05 23:42:27');
INSERT INTO `log_login` VALUES (126, 'admin', 'login', '183.24.55.190', '2021-05-05 23:43:01');
INSERT INTO `log_login` VALUES (127, 'admin', 'login', '113.111.185.58', '2021-05-11 15:37:02');
INSERT INTO `log_login` VALUES (128, 'admin', 'logout', '113.111.185.58', '2021-05-11 15:42:56');
INSERT INTO `log_login` VALUES (129, 'admin', 'login', '113.111.185.58', '2021-05-11 15:44:03');
INSERT INTO `log_login` VALUES (130, 'admin', 'login', '124.203.218.245', '2021-05-13 00:43:34');
INSERT INTO `log_login` VALUES (131, 'admin', 'login', '183.221.157.170', '2021-06-10 18:50:14');
INSERT INTO `log_login` VALUES (132, 'admin', 'login', '113.57.245.139', '2021-06-22 21:32:07');
INSERT INTO `log_login` VALUES (133, 'admin', 'login', '183.234.184.135', '2021-06-24 12:10:46');
INSERT INTO `log_login` VALUES (134, 'admin', 'login', '120.239.12.175', '2021-06-24 12:52:29');
INSERT INTO `log_login` VALUES (135, 'admin', 'login', '183.234.184.135', '2021-07-01 15:28:07');
INSERT INTO `log_login` VALUES (136, 'admin', 'login', '183.234.184.135', '2021-07-01 15:32:38');
INSERT INTO `log_login` VALUES (137, 'admin', 'login', '175.152.114.56', '2021-07-09 12:50:54');
INSERT INTO `log_login` VALUES (138, 'admin', 'login', '112.96.179.209', '2021-07-14 17:58:57');
INSERT INTO `log_login` VALUES (139, 'admin', 'login', '112.96.167.202', '2021-07-15 16:01:07');
INSERT INTO `log_login` VALUES (140, 'admin', 'login', '120.244.232.255', '2021-07-25 23:46:33');
INSERT INTO `log_login` VALUES (141, 'admin', 'login', '183.234.184.136', '2021-07-26 11:44:52');
INSERT INTO `log_login` VALUES (142, 'admin', 'login', '222.190.22.179', '2021-08-06 14:53:58');
INSERT INTO `log_login` VALUES (143, 'admin', 'logout', '222.190.22.179', '2021-08-06 14:56:51');
INSERT INTO `log_login` VALUES (144, 'admin', 'login', '222.190.22.179', '2021-08-06 14:56:53');
INSERT INTO `log_login` VALUES (145, 'admin', 'logout', '222.190.22.179', '2021-08-06 14:57:06');
INSERT INTO `log_login` VALUES (146, 'admin', 'login', '222.190.22.179', '2021-08-06 14:59:07');
INSERT INTO `log_login` VALUES (147, 'admin', 'login', '182.101.54.103', '2021-08-12 16:25:36');
INSERT INTO `log_login` VALUES (148, 'admin', 'login', '112.97.180.31', '2021-09-09 20:48:37');
INSERT INTO `log_login` VALUES (149, 'admin', 'login', '111.61.124.223', '2021-10-05 19:48:55');
INSERT INTO `log_login` VALUES (150, 'admin', 'login', '221.192.179.214', '2021-10-05 19:51:02');
INSERT INTO `log_login` VALUES (151, 'admin', 'login', '111.61.124.223', '2021-10-05 19:51:45');
INSERT INTO `log_login` VALUES (152, 'admin', 'login', '223.104.65.56', '2021-10-09 11:44:10');
INSERT INTO `log_login` VALUES (153, 'admin', 'login', '125.93.83.251', '2021-10-09 11:46:22');
INSERT INTO `log_login` VALUES (154, 'admin', 'login', '119.141.85.71', '2021-10-13 23:19:44');
INSERT INTO `log_login` VALUES (155, 'admin', 'login', '223.104.1.145', '2021-10-13 23:26:20');
INSERT INTO `log_login` VALUES (156, 'admin', 'login', '223.104.63.227', '2021-10-14 01:12:04');
INSERT INTO `log_login` VALUES (157, 'admin', 'login', '125.93.83.247', '2021-10-14 08:27:10');
INSERT INTO `log_login` VALUES (158, 'admin', 'login', '125.93.83.238', '2021-10-14 09:11:25');
INSERT INTO `log_login` VALUES (159, 'admin', 'login', '125.93.83.238', '2021-10-14 11:09:20');
INSERT INTO `log_login` VALUES (160, 'admin', 'logout', '125.93.83.247', '2021-10-14 11:47:34');
INSERT INTO `log_login` VALUES (161, 'admin', 'login', '223.104.1.145', '2021-10-14 12:00:33');
INSERT INTO `log_login` VALUES (162, 'admin', 'login', '125.93.83.246', '2021-10-14 12:03:28');
INSERT INTO `log_login` VALUES (163, 'admin', 'login', '223.104.63.227', '2021-10-20 23:13:33');
INSERT INTO `log_login` VALUES (164, 'admin', 'login', '223.104.61.37', '2021-10-20 23:59:54');
INSERT INTO `log_login` VALUES (165, 'admin', 'login', '125.93.83.241', '2021-10-21 09:37:54');
INSERT INTO `log_login` VALUES (166, 'admin', 'login', '125.93.83.241', '2021-10-21 11:20:42');
INSERT INTO `log_login` VALUES (167, 'admin', 'login', '125.93.83.241', '2021-10-21 11:45:59');
INSERT INTO `log_login` VALUES (168, 'admin', 'login', '223.104.63.232', '2021-10-21 11:55:58');
INSERT INTO `log_login` VALUES (169, 'admin', 'login', '125.93.83.242', '2021-10-21 11:57:40');
INSERT INTO `log_login` VALUES (170, 'admin', 'login', '119.141.85.95', '2021-10-27 23:26:21');
INSERT INTO `log_login` VALUES (171, 'admin', 'login', '119.141.85.199', '2021-10-27 23:26:53');
INSERT INTO `log_login` VALUES (172, 'admin', 'login', '183.46.120.52', '2021-10-28 00:15:24');
INSERT INTO `log_login` VALUES (173, 'admin', 'login', '125.93.83.251', '2021-10-28 10:42:56');
INSERT INTO `log_login` VALUES (174, 'admin', 'logout', '125.93.83.251', '2021-10-28 11:46:46');
INSERT INTO `log_login` VALUES (175, 'admin', 'login', '125.93.83.251', '2021-10-28 11:46:47');
INSERT INTO `log_login` VALUES (176, 'admin', 'login', '223.104.63.225', '2021-10-28 12:05:00');
INSERT INTO `log_login` VALUES (177, 'admin', 'login', '117.136.32.129', '2021-11-11 10:39:05');
INSERT INTO `log_login` VALUES (178, 'admin', 'login', '0:0:0:0:0:0:0:1', '2021-11-11 10:39:36');
INSERT INTO `log_login` VALUES (179, 'admin', 'login', '125.93.83.250', '2021-11-11 10:50:22');
INSERT INTO `log_login` VALUES (180, 'admin', 'login', '117.136.32.129', '2021-11-11 11:05:16');
INSERT INTO `log_login` VALUES (181, 'admin', 'login', '125.93.83.252', '2021-11-11 11:15:27');
INSERT INTO `log_login` VALUES (182, 'admin', 'login', '125.93.83.250', '2021-11-11 12:08:43');
INSERT INTO `log_login` VALUES (183, 'admin', 'login', '223.104.61.125', '2021-11-16 22:55:06');
INSERT INTO `log_login` VALUES (184, 'admin', 'login', '125.93.83.241', '2021-11-18 08:30:37');
INSERT INTO `log_login` VALUES (185, 'admin', 'logout', '125.93.83.241', '2021-11-18 12:03:03');
INSERT INTO `log_login` VALUES (186, 'admin', 'login', '125.93.83.241', '2021-11-18 12:03:06');
INSERT INTO `log_login` VALUES (187, 'admin', 'login', '117.136.32.129', '2021-11-18 12:03:36');
INSERT INTO `log_login` VALUES (188, 'admin', 'login', '119.141.85.115', '2021-12-01 21:22:06');
INSERT INTO `log_login` VALUES (189, 'admin', 'login', '0:0:0:0:0:0:0:1', '2021-12-01 21:52:06');
INSERT INTO `log_login` VALUES (190, 'admin', 'logout', '119.141.85.115', '2021-12-01 22:37:01');
INSERT INTO `log_login` VALUES (191, 'admin', 'login', '125.93.83.252', '2021-12-02 08:26:49');
INSERT INTO `log_login` VALUES (192, 'admin', 'login', '223.104.65.228', '2021-12-02 08:33:47');
INSERT INTO `log_login` VALUES (193, 'admin', 'login', '223.104.65.228', '2021-12-02 08:39:26');
INSERT INTO `log_login` VALUES (194, 'admin', 'login', '223.104.65.228', '2021-12-02 09:58:53');
INSERT INTO `log_login` VALUES (195, 'admin', 'login', '125.93.83.252', '2021-12-02 10:19:24');
INSERT INTO `log_login` VALUES (196, 'admin', 'login', '124.166.254.136', '2021-12-02 17:35:51');
INSERT INTO `log_login` VALUES (197, 'admin', 'login', '1.68.172.21', '2021-12-02 17:38:25');
INSERT INTO `log_login` VALUES (198, 'admin', 'login', '223.104.14.29', '2021-12-02 17:38:31');
INSERT INTO `log_login` VALUES (199, 'admin', 'login', '110.180.56.95', '2021-12-02 18:16:56');
INSERT INTO `log_login` VALUES (200, 'admin', 'login', '110.180.56.95', '2021-12-02 18:50:45');
INSERT INTO `log_login` VALUES (201, 'admin', 'login', '110.180.56.95', '2021-12-02 19:07:56');
INSERT INTO `log_login` VALUES (202, 'admin', 'login', '110.180.56.95', '2021-12-02 19:07:59');
INSERT INTO `log_login` VALUES (203, 'admin', 'login', '110.180.56.95', '2021-12-02 19:10:07');
INSERT INTO `log_login` VALUES (204, 'admin', 'login', '110.180.56.95', '2021-12-02 19:11:02');
INSERT INTO `log_login` VALUES (205, 'admin', 'login', '110.180.56.95', '2021-12-02 19:16:17');
INSERT INTO `log_login` VALUES (206, 'admin', 'login', '110.180.56.95', '2021-12-02 19:17:13');
INSERT INTO `log_login` VALUES (207, 'admin', 'login', '110.180.56.95', '2021-12-02 19:37:16');
INSERT INTO `log_login` VALUES (208, 'admin', 'login', '110.180.56.95', '2021-12-02 19:51:06');
INSERT INTO `log_login` VALUES (209, 'admin', 'logout', '110.180.56.95', '2021-12-02 19:51:50');
INSERT INTO `log_login` VALUES (210, 'admin', 'login', '220.166.50.62', '2021-12-02 21:00:44');
INSERT INTO `log_login` VALUES (211, 'admin', 'login', '119.141.85.80', '2021-12-08 18:53:14');
INSERT INTO `log_login` VALUES (212, 'admin', 'login', '119.141.85.80', '2021-12-08 20:05:30');
INSERT INTO `log_login` VALUES (213, 'admin', 'login', '125.93.83.250', '2021-12-09 08:50:05');
INSERT INTO `log_login` VALUES (214, 'admin', 'logout', '125.93.83.250', '2021-12-09 10:28:12');
INSERT INTO `log_login` VALUES (215, 'admin', 'login', '125.93.83.250', '2021-12-09 10:28:14');
INSERT INTO `log_login` VALUES (216, 'admin', 'login', '223.104.64.1', '2021-12-09 10:44:32');
INSERT INTO `log_login` VALUES (217, 'admin', 'logout', '223.104.64.1', '2021-12-09 12:01:38');
INSERT INTO `log_login` VALUES (218, 'admin', 'login', '223.104.64.1', '2021-12-09 12:01:39');
INSERT INTO `log_login` VALUES (219, 'admin', 'login', '0:0:0:0:0:0:0:1', '2021-12-12 01:03:20');
INSERT INTO `log_login` VALUES (220, 'admin', 'logout', '0:0:0:0:0:0:0:1', '2021-12-12 01:07:22');
INSERT INTO `log_login` VALUES (221, 'admin', 'login', '0:0:0:0:0:0:0:1', '2021-12-12 01:07:41');
INSERT INTO `log_login` VALUES (222, 'admin', 'logout', '0:0:0:0:0:0:0:1', '2021-12-12 01:12:45');
INSERT INTO `log_login` VALUES (223, 'admin', 'login', '221.226.37.66', '2021-12-14 14:15:09');
INSERT INTO `log_login` VALUES (224, 'admin', 'login', '119.141.85.80', '2021-12-15 23:23:22');
INSERT INTO `log_login` VALUES (225, 'admin', 'login', '125.93.83.234', '2021-12-16 09:16:05');
INSERT INTO `log_login` VALUES (226, 'admin', 'logout', '125.93.83.234', '2021-12-16 10:40:19');
INSERT INTO `log_login` VALUES (227, 'admin', 'login', '125.93.83.234', '2021-12-16 10:40:21');
INSERT INTO `log_login` VALUES (228, 'admin', 'login', '117.136.34.87', '2021-12-16 10:43:22');
INSERT INTO `log_login` VALUES (229, 'admin', 'login', '117.136.32.44', '2021-12-20 14:43:21');
INSERT INTO `log_login` VALUES (230, 'admin', 'login', '125.93.83.233', '2021-12-20 14:44:44');
INSERT INTO `log_login` VALUES (231, 'admin', 'login', '125.93.83.233', '2021-12-20 16:38:09');
INSERT INTO `log_login` VALUES (232, 'admin', 'login', '119.141.85.208', '2021-12-20 17:30:06');
INSERT INTO `log_login` VALUES (233, 'admin', 'login', '125.93.83.232', '2021-12-20 17:36:38');
INSERT INTO `log_login` VALUES (234, 'admin', 'login', '223.104.67.75', '2021-12-22 21:00:42');
INSERT INTO `log_login` VALUES (235, 'admin', 'logout', '223.104.67.75', '2021-12-22 21:01:13');
INSERT INTO `log_login` VALUES (236, 'admin', 'login', '119.141.85.71', '2021-12-22 22:08:07');
INSERT INTO `log_login` VALUES (237, 'admin', 'login', '119.141.85.71', '2021-12-22 22:19:55');
INSERT INTO `log_login` VALUES (238, 'admin', 'login', '117.136.32.19', '2021-12-23 00:40:53');
INSERT INTO `log_login` VALUES (239, 'admin', 'login', '117.136.32.1', '2021-12-23 00:48:39');
INSERT INTO `log_login` VALUES (240, 'admin', 'login', '125.93.83.250', '2021-12-23 08:21:50');
INSERT INTO `log_login` VALUES (241, 'admin', 'login', '117.136.32.1', '2021-12-23 08:34:28');
INSERT INTO `log_login` VALUES (242, 'admin', 'login', '125.93.83.250', '2021-12-23 11:29:13');
INSERT INTO `log_login` VALUES (243, 'admin', 'login', '119.141.85.115', '2021-12-23 20:05:25');
INSERT INTO `log_login` VALUES (244, 'admin', 'login', '116.23.160.234', '2021-12-24 15:04:51');
INSERT INTO `log_login` VALUES (245, 'admin', 'login', '223.104.67.31', '2021-12-24 22:19:55');
INSERT INTO `log_login` VALUES (246, 'admin', 'login', '183.6.41.56', '2021-12-24 23:52:41');
INSERT INTO `log_login` VALUES (247, 'admin', 'login', '0:0:0:0:0:0:0:1', '2021-12-25 00:41:08');
INSERT INTO `log_login` VALUES (248, 'admin', 'login', '0:0:0:0:0:0:0:1', '2021-12-25 00:55:06');
INSERT INTO `log_login` VALUES (249, 'admin', 'login', '183.6.41.45', '2021-12-25 14:07:22');
INSERT INTO `log_login` VALUES (250, 'admin', 'logout', '183.6.41.45', '2021-12-25 14:07:38');
INSERT INTO `log_login` VALUES (251, 'admin', 'login', '0:0:0:0:0:0:0:1', '2021-12-25 14:07:54');
INSERT INTO `log_login` VALUES (252, 'admin', 'login', '183.6.41.45', '2021-12-25 14:44:02');
INSERT INTO `log_login` VALUES (253, 'admin', 'login', '0:0:0:0:0:0:0:1', '2021-12-25 18:44:56');
INSERT INTO `log_login` VALUES (254, 'admin', 'logout', '0:0:0:0:0:0:0:1', '2021-12-25 18:47:55');
INSERT INTO `log_login` VALUES (255, 'admin', 'login', '223.104.67.119', '2021-12-25 20:15:07');
INSERT INTO `log_login` VALUES (256, 'admin', 'login', '223.104.67.119', '2021-12-25 20:15:55');
INSERT INTO `log_login` VALUES (257, 'admin', 'login', '183.6.41.56', '2021-12-25 20:35:15');
INSERT INTO `log_login` VALUES (258, 'admin', 'login', '223.104.67.119', '2021-12-25 21:43:44');
INSERT INTO `log_login` VALUES (259, 'admin', 'login', '183.6.41.56', '2021-12-25 21:44:03');
INSERT INTO `log_login` VALUES (260, 'admin', 'login', '183.6.41.75', '2021-12-25 22:03:23');
INSERT INTO `log_login` VALUES (261, 'admin', 'login', '223.104.67.119', '2021-12-25 22:05:54');
INSERT INTO `log_login` VALUES (262, 'admin', 'login', '223.104.67.119', '2021-12-25 22:11:37');
INSERT INTO `log_login` VALUES (263, 'admin', 'login', '223.104.67.119', '2021-12-25 22:57:30');
INSERT INTO `log_login` VALUES (264, 'admin', 'logout', '223.104.67.119', '2021-12-25 22:57:40');
INSERT INTO `log_login` VALUES (265, 'admin', 'login', '183.6.40.242', '2021-12-25 22:58:27');
INSERT INTO `log_login` VALUES (266, 'admin', 'login', '223.104.67.119', '2021-12-25 23:59:58');
INSERT INTO `log_login` VALUES (267, 'admin', 'logout', '183.6.40.242', '2021-12-26 00:11:56');
INSERT INTO `log_login` VALUES (268, 'admin', 'login', '183.6.40.242', '2021-12-26 00:11:59');
INSERT INTO `log_login` VALUES (269, 'admin', 'login', '116.199.50.213', '2021-12-26 13:49:19');
INSERT INTO `log_login` VALUES (270, 'admin', 'login', '127.0.0.1', '2021-12-26 15:41:42');

-- ----------------------------
-- Table structure for log_operating
-- ----------------------------
DROP TABLE IF EXISTS `log_operating`;
CREATE TABLE `log_operating`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `operating` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型',
  `operating_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作数据',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ip',
  `date` datetime(0) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of log_operating
-- ----------------------------
INSERT INTO `log_operating` VALUES (11, 'admin', 'powerInsertPosition', '{\"createDate\":1618649033859,\"enabled\":true,\"name\":\"wqw\",\"remark\":\"qwqw\"}', '113.54.196.102', '2021-04-17 16:43:54');
INSERT INTO `log_operating` VALUES (12, 'admin', 'powerInsertPosition', '{\"createDate\":1618649060369,\"enabled\":true,\"name\":\"1212\",\"remark\":\"211212\"}', '113.54.196.102', '2021-04-17 16:44:20');
INSERT INTO `log_operating` VALUES (13, 'admin', 'powerDeleteUser', '{\"createdate\":1590508800000,\"id\":78,\"loginname\":\"test021\",\"status\":1,\"username\":\"自动生成账号\"}', '113.54.196.102', '2021-04-17 16:45:24');
INSERT INTO `log_operating` VALUES (14, 'admin', 'powerDeleteUser', '{\"createdate\":1590508800000,\"id\":80,\"loginname\":\"test023\",\"status\":1,\"username\":\"自动生成账号\"}', '113.54.196.102', '2021-04-17 16:45:26');
INSERT INTO `log_operating` VALUES (15, 'admin', 'powerDeleteUser', '{\"createdate\":1590508800000,\"id\":79,\"loginname\":\"test022\",\"status\":1,\"username\":\"自动生成账号\"}', '113.54.196.102', '2021-04-17 16:45:28');
INSERT INTO `log_operating` VALUES (16, 'admin', 'powerInsertUser', '{\"createdate\":1619249804402,\"id\":129,\"loginname\":\"88888888\",\"newPassword\":\"\",\"password\":\"e88888888\",\"status\":1,\"username\":\"88888888\"}', '124.203.212.6', '2021-04-24 15:36:44');
INSERT INTO `log_operating` VALUES (17, 'admin', 'powerInsertDepartment', '{\"children\":[],\"depPath\":\".1.4\",\"enabled\":true,\"id\":139,\"name\":\"d d f\",\"parentId\":5,\"remark\":\"ddd\"}', '221.192.179.214', '2021-10-05 19:51:27');
INSERT INTO `log_operating` VALUES (18, 'admin', 'powerDeleteDocument', '{\"createDate\":1634054400000,\"delete\":false,\"fileName\":\"1634138831381_Test.java\",\"fileSize\":4094,\"fileType\":\"application/octet-stream\",\"id\":48,\"remark\":\"作业源码\",\"title\":\"Java源码 2021 10 13\",\"user\":{\"id\":1,\"loginname\":\"admin\"},\"userId\":1}', '119.141.85.71', '2021-10-13 23:29:35');
INSERT INTO `log_operating` VALUES (19, 'admin', 'powerUpdateDocument', '{\"createDate\":1634054400000,\"delete\":false,\"fileName\":\"1634138941395_HomeWorks.java\",\"fileSize\":5058,\"fileType\":\"application/octet-stream\",\"id\":49,\"remark\":\"作业源码\",\"title\":\"Java源码 2021 10 09\",\"user\":{\"id\":1,\"loginname\":\"admin\"},\"userId\":1}', '223.104.1.145', '2021-10-14 12:00:49');
INSERT INTO `log_operating` VALUES (20, 'admin', 'otherInsertDocument', '{\"createDate\":1638366465041,\"delete\":false,\"fileName\":\"1638366465041_MicroPython File Uploader.exe\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":76288,\"fileType\":\"application/x-msdownload\",\"remark\":\"xxxx\",\"title\":\"xxxx\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"测试账号\"},\"userId\":1}', '119.141.85.115', '2021-12-01 21:47:45');
INSERT INTO `log_operating` VALUES (21, 'admin', 'powerDeleteDocument', '{\"createDate\":1638288000000,\"delete\":false,\"fileName\":\"1638366465041_MicroPython File Uploader.exe\",\"fileSize\":76288,\"fileType\":\"application/x-msdownload\",\"id\":66,\"remark\":\"xxxx\",\"title\":\"xxxx\",\"user\":{\"id\":1,\"loginname\":\"admin\"},\"userId\":1}', '119.141.85.115', '2021-12-01 22:12:14');
INSERT INTO `log_operating` VALUES (22, 'admin', 'powerDeleteDocument', '{\"createDate\":1638288000000,\"delete\":false,\"fileName\":\"1638366465041_MicroPython File Uploader.exe\",\"fileSize\":76288,\"fileType\":\"application/x-msdownload\",\"id\":66,\"remark\":\"xxxx\",\"title\":\"xxxx\",\"user\":{\"id\":1,\"loginname\":\"admin\"},\"userId\":1}', '119.141.85.115', '2021-12-01 22:12:30');
INSERT INTO `log_operating` VALUES (23, 'admin', 'powerDeleteDocument', '{\"createDate\":1638288000000,\"delete\":false,\"fileName\":\"1638366465041_MicroPython File Uploader.exe\",\"fileSize\":76288,\"fileType\":\"application/x-msdownload\",\"id\":66,\"remark\":\"xxxx\",\"title\":\"xxxx\",\"user\":{\"id\":1,\"loginname\":\"admin\"},\"userId\":1}', '119.141.85.115', '2021-12-01 22:13:36');
INSERT INTO `log_operating` VALUES (24, 'admin', 'powerDeleteDocument', '{\"createDate\":1638288000000,\"delete\":false,\"fileName\":\"1638366465041_MicroPython File Uploader.exe\",\"fileSize\":76288,\"fileType\":\"application/x-msdownload\",\"id\":66,\"remark\":\"xxxx\",\"title\":\"xxxx\",\"user\":{\"id\":1,\"loginname\":\"admin\"},\"userId\":1}', '119.141.85.115', '2021-12-01 22:14:10');
INSERT INTO `log_operating` VALUES (25, 'admin', 'powerDeleteDocument', '{\"createDate\":1638288000000,\"delete\":false,\"fileName\":\"1638366465041_MicroPython File Uploader.exe\",\"fileSize\":76288,\"fileType\":\"application/x-msdownload\",\"id\":66,\"remark\":\"xxxx\",\"title\":\"xxxx\",\"user\":{\"id\":1,\"loginname\":\"admin\"},\"userId\":1}', '119.141.85.115', '2021-12-01 22:17:34');
INSERT INTO `log_operating` VALUES (26, 'admin', 'otherInsertDocument', '{\"createDate\":1638368339746,\"delete\":false,\"fileName\":\"1638368339746_xiaoyu-hrm-2.1.0-SNAPSHOT.jar.original\",\"filePath\":\"/home/hrm/uploads/\",\"fileSize\":2045089,\"fileType\":\"application/octet-stream\",\"remark\":\"xx\",\"title\":\"xx\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"测试账号\"},\"userId\":1}', '119.141.85.115', '2021-12-01 22:19:00');
INSERT INTO `log_operating` VALUES (27, 'admin', 'powerDeleteDocument', '{\"createDate\":1638288000000,\"delete\":false,\"fileName\":\"1638368339746_xiaoyu-hrm-2.1.0-SNAPSHOT.jar.original\",\"fileSize\":2045089,\"fileType\":\"application/octet-stream\",\"id\":67,\"remark\":\"xx\",\"title\":\"xx\",\"user\":{\"id\":1,\"loginname\":\"admin\"},\"userId\":1}', '119.141.85.115', '2021-12-01 22:19:19');
INSERT INTO `log_operating` VALUES (28, 'admin', 'powerDeleteDocument', '{\"createDate\":1638288000000,\"delete\":false,\"fileName\":\"1638366465041_MicroPython File Uploader.exe\",\"fileSize\":76288,\"fileType\":\"application/x-msdownload\",\"id\":66,\"remark\":\"xxxx\",\"title\":\"xxxx\",\"user\":{\"id\":1,\"loginname\":\"admin\"},\"userId\":1}', '119.141.85.115', '2021-12-01 22:19:46');
INSERT INTO `log_operating` VALUES (29, 'admin', 'powerDeleteDocument', '{\"createDate\":1638288000000,\"delete\":false,\"fileName\":\"1638365885559_2021.11.18 Java作业.docx\",\"fileSize\":1313925,\"fileType\":\"application/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"id\":64,\"remark\":\"2021.11.18 Java作业\",\"title\":\"2021.11.18 Java作业\",\"user\":{\"id\":1,\"loginname\":\"admin\"},\"userId\":1}', '223.104.65.228', '2021-12-02 08:34:11');
INSERT INTO `log_operating` VALUES (30, 'admin', 'otherInsertDocument', '{\"createDate\":1638406623001,\"delete\":false,\"fileName\":\"1638406623001_2021.11.18 Java作业.docx\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":1313925,\"fileType\":\"application/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"remark\":\"2021.11.18 Java作业\",\"title\":\"2021.11.18 Java作业\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"测试账号\"},\"userId\":1}', '223.104.65.228', '2021-12-02 08:57:04');
INSERT INTO `log_operating` VALUES (31, 'admin', 'otherInsertDocument', '{\"createDate\":1638411578107,\"delete\":false,\"fileName\":\"1638411578107_第7次练习.docx\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":126033,\"fileType\":\"application/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"remark\":\"java第7次练习\",\"title\":\"java第7次练习\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"测试账号\"},\"userId\":1}', '125.93.83.252', '2021-12-02 10:19:38');
INSERT INTO `log_operating` VALUES (32, 'admin', 'otherInsertDocument', '{\"createDate\":1638414728980,\"delete\":false,\"fileName\":\"1638414728980_2021.12.02 Java作业.docx\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":1284406,\"fileType\":\"application/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"remark\":\"2021.12.02 Java作业\",\"title\":\"2021.12.02 Java作业\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"测试账号\"},\"userId\":1}', '223.104.65.228', '2021-12-02 11:12:09');
INSERT INTO `log_operating` VALUES (33, 'admin', 'otherInsertDocument', '{\"createDate\":1639016914583,\"delete\":false,\"fileName\":\"1639016914583_第8次练习.docx\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":68779,\"fileType\":\"application/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"remark\":\"Java 2021 12 09 第8次练习\",\"title\":\"Java 2021 12 09 第8次练习\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"测试账号\"},\"userId\":1}', '125.93.83.250', '2021-12-09 10:28:35');
INSERT INTO `log_operating` VALUES (34, 'admin', 'powerDeleteDocument', '{\"createDate\":1638979200000,\"delete\":false,\"fileName\":\"1639016914583_第8次练习.docx\",\"fileSize\":68779,\"fileType\":\"application/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"id\":71,\"remark\":\"Java 2021 12 09 第8次练习\",\"title\":\"Java 2021 12 09 第8次练习\",\"user\":{\"id\":1,\"loginname\":\"admin\"},\"userId\":1}', '125.93.83.250', '2021-12-09 10:32:23');
INSERT INTO `log_operating` VALUES (35, 'admin', 'otherInsertDocument', '{\"createDate\":1639017152979,\"delete\":false,\"fileName\":\"1639017152979_第8次练习.docx\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":78380,\"fileType\":\"application/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"remark\":\"Java 2021 12 09 第8次练习\",\"title\":\"Java 2021 12 09 第8次练习\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"测试账号\"},\"userId\":1}', '125.93.83.250', '2021-12-09 10:32:33');
INSERT INTO `log_operating` VALUES (36, 'admin', 'otherInsertDocument', '{\"createDate\":1639022513889,\"delete\":false,\"fileName\":\"1639022513889_2021.12.09 Java作业.docx\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":3700176,\"fileType\":\"application/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"remark\":\"2021.12.09 Java作业\",\"title\":\"2021.12.09 Java作业\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"测试账号\"},\"userId\":1}', '223.104.64.1', '2021-12-09 12:01:54');
INSERT INTO `log_operating` VALUES (37, 'admin', 'otherInsertDocument', '{\"createDate\":1639622428874,\"delete\":false,\"fileName\":\"1639622428874_Java 第9次练习.zip\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":55896,\"fileType\":\"application/x-zip-compressed\",\"remark\":\"2021 12 16 Java 第9次练习\",\"title\":\"2021 12 16 Java 第9次练习\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"测试账号\"},\"userId\":1}', '125.93.83.234', '2021-12-16 10:40:29');
INSERT INTO `log_operating` VALUES (38, 'admin', 'otherInsertDocument', '{\"createDate\":1639982617454,\"delete\":false,\"fileName\":\"1639982617454_2021.12.16 Java作业.docx\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":3649255,\"fileType\":\"application/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"remark\":\"2021.12.16 Java作业\",\"title\":\"2021.12.16 Java作业\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"测试账号\"},\"userId\":1}', '117.136.32.44', '2021-12-20 14:43:37');
INSERT INTO `log_operating` VALUES (39, 'admin', 'otherInsertDocument', '{\"createDate\":1639989510516,\"delete\":false,\"fileName\":\"1639989510516_2021.12.20 Java 第10次练习.docx\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":284493,\"fileType\":\"application/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"remark\":\"2021.12.20 Java 第10次练习\",\"title\":\"2021.12.20 Java 第10次练习\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"测试账号\"},\"userId\":1}', '125.93.83.233', '2021-12-20 16:38:31');
INSERT INTO `log_operating` VALUES (40, 'admin', 'otherInsertDocument', '{\"createDate\":1639993027130,\"delete\":false,\"fileName\":\"1639993027130_第9次练习答案.zip\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":3280,\"fileType\":\"application/x-zip-compressed\",\"remark\":\"9999\",\"title\":\"99999\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"测试账号\"},\"userId\":1}', '125.93.83.232', '2021-12-20 17:37:07');
INSERT INTO `log_operating` VALUES (41, 'admin', 'otherInsertDocument', '{\"createDate\":1640191820063,\"delete\":false,\"fileName\":\"1640191820063_《面向对象程序设计》大作业.zip\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":1571488,\"fileType\":\"application/x-zip-compressed\",\"remark\":\"《面向对象程序设计》大作业\",\"title\":\"《面向对象程序设计》大作业\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"测试账号\"},\"userId\":1}', '117.136.32.1', '2021-12-23 00:50:20');
INSERT INTO `log_operating` VALUES (42, 'admin', 'otherInsertDocument', '{\"createDate\":1640219709179,\"delete\":false,\"fileName\":\"1640219709179_计科6班钟乐27.zip\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":5348722,\"fileType\":\"application/zip\",\"remark\":\"计科6班钟乐27\",\"title\":\"计科6班钟乐27\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"测试账号\"},\"userId\":1}', '117.136.32.1', '2021-12-23 08:35:09');
INSERT INTO `log_operating` VALUES (43, 'admin', 'otherInsertDocument', '{\"createDate\":1640230186400,\"delete\":false,\"fileName\":\"1640230186400_《面向对象程序设计》课程设计.docx\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":24616,\"fileType\":\"application/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"remark\":\"2021.12.23 《面向对象程序设计》课程设计\",\"title\":\"2021.12.23 《面向对象程序设计》课程设计\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"测试账号\"},\"userId\":1}', '125.93.83.250', '2021-12-23 11:29:46');
INSERT INTO `log_operating` VALUES (44, 'admin', 'powerUpdatePosition', '{\"createDate\":1515600000000,\"enabled\":true,\"id\":1,\"name\":\"职员\",\"remark\":\"职员\"}', '116.23.160.234', '2021-12-24 15:05:30');
INSERT INTO `log_operating` VALUES (45, 'admin', 'powerDeleteUser', '{\"createdate\":1590508800000,\"id\":81,\"loginname\":\"test024\",\"status\":1,\"username\":\"自动生成账号\"}', '0:0:0:0:0:0:0:1', '2021-12-25 00:55:35');
INSERT INTO `log_operating` VALUES (46, 'admin', 'powerInsertPosition', '{\"createDate\":1640365613049,\"enabled\":true,\"name\":\"11\",\"remark\":\"11\"}', '0:0:0:0:0:0:0:1', '2021-12-25 01:06:54');
INSERT INTO `log_operating` VALUES (47, 'admin', 'powerInsertPosition', '{\"createDate\":1640365613833,\"enabled\":true,\"name\":\"11\",\"remark\":\"11\"}', '0:0:0:0:0:0:0:1', '2021-12-25 01:06:54');
INSERT INTO `log_operating` VALUES (48, 'admin', 'otherUpdateUser', '{\"createdate\":1583942400000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"测试账号1\"}', '0:0:0:0:0:0:0:1', '2021-12-25 01:07:08');
INSERT INTO `log_operating` VALUES (49, 'admin', 'otherInsertDocument', '{\"createDate\":1640413476294,\"delete\":false,\"fileName\":\"1640413476294_聚合.txt\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":1032,\"fileType\":\"text/plain\",\"remark\":\"12\",\"title\":\"12\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"测试账号1\"},\"userId\":1}', '0:0:0:0:0:0:0:1', '2021-12-25 14:24:38');
INSERT INTO `log_operating` VALUES (50, 'admin', 'powerInsertDepartment', '{\"children\":[],\"depPath\":\".1\",\"enabled\":true,\"id\":140,\"name\":\"12\",\"parentId\":1,\"remark\":\"12\"}', '0:0:0:0:0:0:0:1', '2021-12-25 14:27:02');
INSERT INTO `log_operating` VALUES (51, 'admin', 'powerInsertDepartment', '{\"children\":[],\"depPath\":\".1\",\"enabled\":true,\"id\":141,\"name\":\"12\",\"parentId\":1,\"remark\":\"12\"}', '0:0:0:0:0:0:0:1', '2021-12-25 14:27:32');
INSERT INTO `log_operating` VALUES (52, 'admin', 'powerDeleteDepartment', '{\"children\":[],\"depPath\":\".1.140\",\"enabled\":true,\"id\":140,\"name\":\"12\",\"parent\":false,\"parentId\":1,\"remark\":\"12\"}', '0:0:0:0:0:0:0:1', '2021-12-25 14:27:49');
INSERT INTO `log_operating` VALUES (53, 'admin', 'powerDeleteDepartment', '{\"children\":[],\"depPath\":\".1\",\"enabled\":true,\"id\":141,\"name\":\"12\",\"parentId\":1,\"remark\":\"12\"}', '0:0:0:0:0:0:0:1', '2021-12-25 14:27:51');
INSERT INTO `log_operating` VALUES (54, 'admin', 'powerDeleteUser', '{\"createdate\":1590508800000,\"id\":118,\"loginname\":\"test006\",\"status\":1,\"username\":\"自动生成账号\"}', '223.104.67.119', '2021-12-25 20:16:52');
INSERT INTO `log_operating` VALUES (55, 'admin', 'powerDeletesPosition', '{\"createdate\":1590508800000,\"id\":118,\"loginname\":\"test006\",\"status\":1,\"username\":\"自动生成账号\"}', '223.104.67.119', '2021-12-25 20:17:19');
INSERT INTO `log_operating` VALUES (56, 'admin', 'powerInsertDepartment', '{\"children\":[],\"depPath\":\".1\",\"enabled\":true,\"id\":142,\"name\":\"45\",\"parentId\":1,\"remark\":\"45\"}', '183.6.41.56', '2021-12-25 20:35:32');
INSERT INTO `log_operating` VALUES (57, 'admin', 'powerDeleteDepartment', '{\"children\":[],\"depPath\":\".1\",\"enabled\":true,\"id\":142,\"name\":\"45\",\"parentId\":1,\"remark\":\"45\"}', '183.6.41.56', '2021-12-25 20:35:50');
INSERT INTO `log_operating` VALUES (58, 'admin', 'powerInsertUser', '{\"createdate\":1640504557686,\"id\":130,\"loginname\":\"909090\",\"newPassword\":\"\",\"password\":\"a123456\",\"status\":1,\"username\":\"909090\"}', '127.0.0.1', '2021-12-26 15:42:38');
INSERT INTO `log_operating` VALUES (59, 'admin', 'powerDeleteUser', '{\"createdate\":1619193600000,\"id\":129,\"loginname\":\"88888888\",\"status\":1,\"username\":\"88888888\"}', '127.0.0.1', '2021-12-26 15:43:37');
INSERT INTO `log_operating` VALUES (60, 'admin', 'otherUpdateUser', '{\"createdate\":1583942400000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"管理员\"}', '127.0.0.1', '2021-12-26 15:44:11');
INSERT INTO `log_operating` VALUES (61, 'admin', 'powerInsertDepartment', '{\"children\":[],\"depPath\":\".1.4\",\"enabled\":true,\"id\":143,\"name\":\"ty\",\"parentId\":2,\"remark\":\"ry\"}', '127.0.0.1', '2021-12-26 15:50:22');
INSERT INTO `log_operating` VALUES (62, 'admin', 'powerUpdateEmployee', '{\"address\":\"广州\",\"birthday\":1640275200000,\"cardId\":\"432801197711251038\",\"createDate\":1468425600000,\"department\":{\"children\":[],\"id\":1,\"name\":\"总公办\"},\"education\":\"本科\",\"email\":\"36750064@qq.com\",\"hobby\":\"爬山\",\"id\":3,\"name\":\"bb\",\"party\":\"党员\",\"phone\":\"13907351532\",\"position\":{\"id\":2,\"name\":\"Java开发工程师\"},\"postCode\":\"510000\",\"qqNum\":\"36750064\",\"race\":\"汉族\",\"remark\":\"无\",\"sex\":1,\"speciality\":\"计算机\",\"tel\":\"020-99999999\"}', '127.0.0.1', '2021-12-26 15:51:31');
INSERT INTO `log_operating` VALUES (63, 'admin', 'powerUpdateEmployee', '{\"address\":\"广州\",\"birthday\":1640275200000,\"cardId\":\"432801197711251038\",\"createDate\":1468425600000,\"department\":{\"children\":[],\"id\":1,\"name\":\"总公办\"},\"education\":\"本科\",\"email\":\"36750064@qq.com\",\"hobby\":\"爬山\",\"id\":3,\"name\":\"bb\",\"party\":\"中共党员\",\"phone\":\"13907351532\",\"position\":{\"id\":2,\"name\":\"Java开发工程师\"},\"postCode\":\"510000\",\"qqNum\":\"36750064\",\"race\":\"汉族\",\"remark\":\"无\",\"sex\":1,\"speciality\":\"计算机\",\"tel\":\"020-99999999\"}', '127.0.0.1', '2021-12-26 15:52:03');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL DEFAULT 0,
  `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `component` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iconCls` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keepAlive` tinyint(1) NULL DEFAULT NULL,
  `requireAuth` tinyint(1) NULL DEFAULT NULL,
  `parentId` int(11) NULL DEFAULT NULL,
  `enabled` tinyint(1) NULL DEFAULT 1 COMMENT '是否启用',
  `is_power` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否需要权限：1（true，需要）、0（false，不需要）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '/', NULL, NULL, '所有', NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `menu` VALUES (2, '/', '/home', 'Home', '用户管理', 'fa fa-user-circle-o', NULL, 1, 1, 1, 0);
INSERT INTO `menu` VALUES (3, '/', '/home', 'Home', '部门管理', 'fa fa-address-card-o', NULL, 1, 1, 1, 0);
INSERT INTO `menu` VALUES (4, '/', '/home', 'Home', '职位管理', 'fa fa-money', NULL, 1, 1, 1, 0);
INSERT INTO `menu` VALUES (5, '/', '/home', 'Home', '员工管理', 'fa fa-bar-chart', NULL, 1, 1, 1, 0);
INSERT INTO `menu` VALUES (6, '/', '/home', 'Home', '下载管理', 'fa fa-windows', NULL, 1, 1, 1, 0);
INSERT INTO `menu` VALUES (7, '/user/basic/**', '/user/basic', 'UserBasic', '用户查询', NULL, NULL, 1, 2, 1, 0);
INSERT INTO `menu` VALUES (8, '/user/add/**', '/user/insert', 'UserAdd', '添加用户', NULL, NULL, 1, 2, 1, 1);
INSERT INTO `menu` VALUES (9, '/department/basic/**', '/dep/basic', 'DepBasic', '部门查询', NULL, NULL, 1, 3, 1, 0);
INSERT INTO `menu` VALUES (10, '/department/add/**', '/dep/insert', 'DepAdd', '添加部门', NULL, NULL, 1, 3, 1, 1);
INSERT INTO `menu` VALUES (14, '/position/basic/**', '/pos/basic', 'PosBasic', '职位查询', NULL, NULL, 1, 4, 1, 0);
INSERT INTO `menu` VALUES (15, '/position/add/**', '/pos/insert', 'PosAdd', '添加职位', NULL, NULL, 1, 4, 1, 1);
INSERT INTO `menu` VALUES (19, '/employee/basic/**', '/emp/basic', 'EmpBasic', '员工查询', NULL, NULL, 1, 5, 1, 0);
INSERT INTO `menu` VALUES (20, '/employee/add/**', '/emp/insert', 'EmpAdd', '添加员工', NULL, NULL, 1, 5, 1, 1);
INSERT INTO `menu` VALUES (21, '/document/basic/**', '/sys/basic', 'SysBasic', '文件查询', NULL, NULL, 1, 6, 1, 0);
INSERT INTO `menu` VALUES (22, '/document/upload/**', '/sys/upload', 'SysUpload', '文件上传', NULL, NULL, 1, 6, 1, 0);
INSERT INTO `menu` VALUES (23, '/', '/home', 'Home', '系统日志', 'fa fa-windows', NULL, 1, 1, 1, 1);
INSERT INTO `menu` VALUES (24, '/log/login/**', '/log/login', 'LogLogin', '登陆日志', NULL, NULL, 1, 23, 1, 1);
INSERT INTO `menu` VALUES (25, '/log/operating/**', '/log/operating', 'LogOperating', '操作日志', NULL, NULL, 1, 23, 1, 1);

-- ----------------------------
-- Table structure for nation
-- ----------------------------
DROP TABLE IF EXISTS `nation`;
CREATE TABLE `nation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of nation
-- ----------------------------
INSERT INTO `nation` VALUES (1, '汉族');
INSERT INTO `nation` VALUES (2, '蒙古族');
INSERT INTO `nation` VALUES (3, '回族');
INSERT INTO `nation` VALUES (4, '藏族');
INSERT INTO `nation` VALUES (5, '维吾尔族');
INSERT INTO `nation` VALUES (6, '苗族');
INSERT INTO `nation` VALUES (7, '彝族');
INSERT INTO `nation` VALUES (8, '壮族');
INSERT INTO `nation` VALUES (9, '布依族');
INSERT INTO `nation` VALUES (10, '朝鲜族');
INSERT INTO `nation` VALUES (11, '满族');
INSERT INTO `nation` VALUES (12, '侗族');
INSERT INTO `nation` VALUES (13, '瑶族');
INSERT INTO `nation` VALUES (14, '白族');
INSERT INTO `nation` VALUES (15, '土家族');
INSERT INTO `nation` VALUES (16, '哈尼族');
INSERT INTO `nation` VALUES (17, '哈萨克族');
INSERT INTO `nation` VALUES (18, '傣族');
INSERT INTO `nation` VALUES (19, '黎族');
INSERT INTO `nation` VALUES (20, '傈僳族');
INSERT INTO `nation` VALUES (21, '佤族');
INSERT INTO `nation` VALUES (22, '畲族');
INSERT INTO `nation` VALUES (23, '高山族');
INSERT INTO `nation` VALUES (24, '拉祜族');
INSERT INTO `nation` VALUES (25, '水族');
INSERT INTO `nation` VALUES (26, '东乡族');
INSERT INTO `nation` VALUES (27, '纳西族');
INSERT INTO `nation` VALUES (28, '景颇族');
INSERT INTO `nation` VALUES (29, '柯尔克孜族');
INSERT INTO `nation` VALUES (30, '土族');
INSERT INTO `nation` VALUES (31, '达斡尔族');
INSERT INTO `nation` VALUES (32, '仫佬族');
INSERT INTO `nation` VALUES (33, '羌族');
INSERT INTO `nation` VALUES (34, '布朗族');
INSERT INTO `nation` VALUES (35, '撒拉族');
INSERT INTO `nation` VALUES (36, '毛难族');
INSERT INTO `nation` VALUES (37, '仡佬族');
INSERT INTO `nation` VALUES (38, '锡伯族');
INSERT INTO `nation` VALUES (39, '阿昌族');
INSERT INTO `nation` VALUES (40, '普米族');
INSERT INTO `nation` VALUES (41, '塔吉克族');
INSERT INTO `nation` VALUES (42, '怒族');
INSERT INTO `nation` VALUES (43, '乌孜别克族');
INSERT INTO `nation` VALUES (44, '俄罗斯族');
INSERT INTO `nation` VALUES (45, '鄂温克族');
INSERT INTO `nation` VALUES (46, '崩龙族');
INSERT INTO `nation` VALUES (47, '保安族');
INSERT INTO `nation` VALUES (48, '裕固族');
INSERT INTO `nation` VALUES (49, '京族');
INSERT INTO `nation` VALUES (50, '塔塔尔族');
INSERT INTO `nation` VALUES (51, '独龙族');
INSERT INTO `nation` VALUES (52, '鄂伦春族');
INSERT INTO `nation` VALUES (53, '赫哲族');
INSERT INTO `nation` VALUES (54, '门巴族');
INSERT INTO `nation` VALUES (55, '珞巴族');
INSERT INTO `nation` VALUES (56, '基诺族');

-- ----------------------------
-- Table structure for politics_status
-- ----------------------------
DROP TABLE IF EXISTS `politics_status`;
CREATE TABLE `politics_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of politics_status
-- ----------------------------
INSERT INTO `politics_status` VALUES (1, '中共党员');
INSERT INTO `politics_status` VALUES (2, '中共预备党员');
INSERT INTO `politics_status` VALUES (3, '共青团员');
INSERT INTO `politics_status` VALUES (4, '民革党员');
INSERT INTO `politics_status` VALUES (5, '民盟盟员');
INSERT INTO `politics_status` VALUES (6, '民建会员');
INSERT INTO `politics_status` VALUES (7, '民进会员');
INSERT INTO `politics_status` VALUES (8, '农工党党员');
INSERT INTO `politics_status` VALUES (9, '致公党党员');
INSERT INTO `politics_status` VALUES (10, '九三学社社员');
INSERT INTO `politics_status` VALUES (11, '台盟盟员');
INSERT INTO `politics_status` VALUES (12, '无党派民主人士');
INSERT INTO `politics_status` VALUES (13, '普通公民');

-- ----------------------------
-- Table structure for user_inf
-- ----------------------------
DROP TABLE IF EXISTS `user_inf`;
CREATE TABLE `user_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `createdate` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 131 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_inf
-- ----------------------------
INSERT INTO `user_inf` VALUES (1, 'admin', 'z123456', 2, '2020-03-12 09:34:28', '管理员');
INSERT INTO `user_inf` VALUES (20, 'xiaoyu', 'z123456', 3, '2020-03-19 17:23:30', '开发者测试账号');
INSERT INTO `user_inf` VALUES (45, 'xiaoyu2', 'z123456', 2, '2020-05-12 10:33:33', '小鱼2号..');
INSERT INTO `user_inf` VALUES (82, 'test025', 'z123456', 1, '2020-05-27 11:58:13', '自动生成账号');
INSERT INTO `user_inf` VALUES (83, 'test041', 'z123456', 1, '2020-05-27 11:58:14', '自动生成账号');
INSERT INTO `user_inf` VALUES (84, 'test031', 'z123456', 1, '2020-05-27 11:58:14', '自动生成账号');
INSERT INTO `user_inf` VALUES (85, 'test026', 'z123456', 1, '2020-05-27 11:58:19', '自动生成账号');
INSERT INTO `user_inf` VALUES (86, 'test042', 'z123456', 1, '2020-05-27 11:58:19', '自动生成账号');
INSERT INTO `user_inf` VALUES (87, 'test032', 'z123456', 1, '2020-05-27 11:58:19', '自动生成账号');
INSERT INTO `user_inf` VALUES (88, 'test027', 'z123456', 1, '2020-05-27 11:58:24', '自动生成账号');
INSERT INTO `user_inf` VALUES (89, 'test043', 'z123456', 1, '2020-05-27 11:58:25', '自动生成账号');
INSERT INTO `user_inf` VALUES (90, 'test033', 'z123456', 1, '2020-05-27 11:58:25', '自动生成账号');
INSERT INTO `user_inf` VALUES (91, 'test011', 'z123456', 1, '2020-05-27 11:58:25', '自动生成账号');
INSERT INTO `user_inf` VALUES (92, 'test028', 'z123456', 1, '2020-05-27 11:58:30', '自动生成账号');
INSERT INTO `user_inf` VALUES (93, 'test034', 'z123456', 1, '2020-05-27 11:58:30', '自动生成账号');
INSERT INTO `user_inf` VALUES (94, 'test012', 'z123456', 1, '2020-05-27 11:58:31', '自动生成账号');
INSERT INTO `user_inf` VALUES (95, 'test044', 'z123456', 1, '2020-05-27 11:58:31', '自动生成账号');
INSERT INTO `user_inf` VALUES (96, 'test001', 'z123456', 1, '2020-05-27 11:58:33', '自动生成账号');
INSERT INTO `user_inf` VALUES (97, 'test029', 'z123456', 1, '2020-05-27 11:58:35', '自动生成账号');
INSERT INTO `user_inf` VALUES (98, 'test035', 'z123456', 1, '2020-05-27 11:58:36', '自动生成账号');
INSERT INTO `user_inf` VALUES (99, 'test013', 'z123456', 1, '2020-05-27 11:58:36', '自动生成账号');
INSERT INTO `user_inf` VALUES (100, 'test045', 'z123456', 1, '2020-05-27 11:58:37', '自动生成账号');
INSERT INTO `user_inf` VALUES (101, 'test002', 'z123456', 1, '2020-05-27 11:58:38', '自动生成账号');
INSERT INTO `user_inf` VALUES (102, 'test030', 'z123456', 1, '2020-05-27 11:58:41', '自动生成账号');
INSERT INTO `user_inf` VALUES (103, 'test036', 'z123456', 1, '2020-05-27 11:58:41', '自动生成账号');
INSERT INTO `user_inf` VALUES (104, 'test014', 'z123456', 1, '2020-05-27 11:58:42', '自动生成账号');
INSERT INTO `user_inf` VALUES (105, 'test046', 'z123456', 1, '2020-05-27 11:58:42', '自动生成账号');
INSERT INTO `user_inf` VALUES (106, 'test003', 'z123456', 1, '2020-05-27 11:58:43', '自动生成账号');
INSERT INTO `user_inf` VALUES (107, 'test037', 'z123456', 1, '2020-05-27 11:58:47', '自动生成账号');
INSERT INTO `user_inf` VALUES (108, 'test015', 'z123456', 1, '2020-05-27 11:58:47', '自动生成账号');
INSERT INTO `user_inf` VALUES (109, 'test047', 'z123456', 1, '2020-05-27 11:58:48', '自动生成账号');
INSERT INTO `user_inf` VALUES (110, 'test004', 'z123456', 1, '2020-05-27 11:58:49', '自动生成账号');
INSERT INTO `user_inf` VALUES (111, 'test038', 'z123456', 1, '2020-05-27 11:58:52', '自动生成账号');
INSERT INTO `user_inf` VALUES (112, 'test016', 'z123456', 1, '2020-05-27 11:58:53', '自动生成账号');
INSERT INTO `user_inf` VALUES (113, 'test048', 'z123456', 1, '2020-05-27 11:58:53', '自动生成账号');
INSERT INTO `user_inf` VALUES (114, 'test005', 'z123456', 1, '2020-05-27 11:58:54', '自动生成账号');
INSERT INTO `user_inf` VALUES (115, 'test039', 'z123456', 1, '2020-05-27 11:58:58', '自动生成账号');
INSERT INTO `user_inf` VALUES (116, 'test017', 'z123456', 1, '2020-05-27 11:58:58', '自动生成账号');
INSERT INTO `user_inf` VALUES (117, 'test049', 'z123456', 1, '2020-05-27 11:58:58', '自动生成账号');
INSERT INTO `user_inf` VALUES (119, 'test040', 'z123456', 1, '2020-05-27 11:59:03', '自动生成账号');
INSERT INTO `user_inf` VALUES (120, 'test018', 'z123456', 1, '2020-05-27 11:59:03', '自动生成账号');
INSERT INTO `user_inf` VALUES (121, 'test050', 'z123456', 1, '2020-05-27 11:59:04', '自动生成账号');
INSERT INTO `user_inf` VALUES (122, 'test007', 'z123456', 1, '2020-05-27 11:59:05', '自动生成账号');
INSERT INTO `user_inf` VALUES (123, 'test019', 'z123456', 1, '2020-05-27 11:59:09', '自动生成账号');
INSERT INTO `user_inf` VALUES (124, 'test008', 'z123456', 1, '2020-05-27 11:59:11', '自动生成账号');
INSERT INTO `user_inf` VALUES (125, 'test020', 'z123456', 1, '2020-05-27 11:59:14', '自动生成账号');
INSERT INTO `user_inf` VALUES (126, 'test009', 'z123456', 1, '2020-05-27 11:59:16', '自动生成账号');
INSERT INTO `user_inf` VALUES (127, 'test010', 'z123456', 1, '2020-05-27 11:59:21', '自动生成账号');
INSERT INTO `user_inf` VALUES (130, '909090', 'a123456', 1, '2021-12-26 15:42:38', '909090');

SET FOREIGN_KEY_CHECKS = 1;
