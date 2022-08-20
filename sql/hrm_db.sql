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

 Date: 20/08/2022 19:09:35
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
) ENGINE = InnoDB AUTO_INCREMENT = 149 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dept_inf
-- ----------------------------
INSERT INTO `dept_inf` VALUES (1, '总公办', '这是总公办噢', -1, '.1', 1, 1);
INSERT INTO `dept_inf` VALUES (2, '技术部', '这是技术部噢', 1, '.1.4', 1, 1);
INSERT INTO `dept_inf` VALUES (3, '运营部', '这是运营部噢', 1, '.1.4', 1, 1);
INSERT INTO `dept_inf` VALUES (5, '市场部', '这是市场部噢', 1, '.1.4', 1, 1);
INSERT INTO `dept_inf` VALUES (6, '教学部', '这是教学部噢', 1, '.1.4', 1, 0);
INSERT INTO `dept_inf` VALUES (134, '测定', '测试', 1, '.1.134', 1, 0);
INSERT INTO `dept_inf` VALUES (145, 'test', 'tes1', 2, '.1.4.145', 1, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
INSERT INTO `document_inf` VALUES (82, '789', '98', '1640505761045_聚合.txt', '/home/xiaoyu/hrm/uploads/', 'text/plain', 1032, 0, '2021-12-26 16:02:41', 1);
INSERT INTO `document_inf` VALUES (83, '2022 2 25 HTML', '2022 2 25 HTML', '1645761726510_xiaoyu_2_25.rar', '/home/xiaoyu/hrm/uploads/', 'application/octet-stream', 124140, 0, '2022-02-25 12:02:07', 1);
INSERT INTO `document_inf` VALUES (84, 'system.py', '学生管理系统 初步 ', '1646884444146_system.py', '/home/xiaoyu/hrm/uploads/', 'text/plain', 1544, 0, '2022-03-10 11:54:04', 1);
INSERT INTO `document_inf` VALUES (85, '2022-3-11 HTML', '2022-3-11 HTML', '1646968132327_33.rar', '/home/xiaoyu/hrm/uploads/', 'application/octet-stream', 165693, 0, '2022-03-11 11:08:52', 1);
INSERT INTO `document_inf` VALUES (86, '123', '123', '1654743700553_草稿.py', '/home/xiaoyu/hrm/uploads/', 'text/plain', 5749, 0, '2022-06-09 11:01:41', 1);
INSERT INTO `document_inf` VALUES (87, '1', '1', '1654744952494_可视化.py', '/home/xiaoyu/hrm/uploads/', 'text/plain', 904, 0, '2022-06-09 11:22:32', 1);
INSERT INTO `document_inf` VALUES (88, 'wada', 'adad', '1654747617774_untitled.rar', '/home/xiaoyu/hrm/uploads/', 'application/octet-stream', 1218, 0, '2022-06-09 12:06:58', 1);
INSERT INTO `document_inf` VALUES (89, 'rp', 'monday', '1655697250271_26张嘉城注册登陆页.rp', '/home/xiaoyu/hrm/uploads/', 'application/octet-stream', 53646, 0, '2022-06-20 11:54:10', 1);
INSERT INTO `document_inf` VALUES (90, 'dsad', 'sfdad', '1655697793001_201908324627钟乐.rp', '/home/xiaoyu/hrm/uploads/', 'application/octet-stream', 67864, 0, '2022-06-20 12:03:13', 1);
INSERT INTO `document_inf` VALUES (91, '33 app', '33 app', '1655697930042_app.rp', '/home/xiaoyu/hrm/uploads/', 'application/octet-stream', 63242, 0, '2022-06-20 12:05:30', 1);
INSERT INTO `document_inf` VALUES (92, '2222', '2222', '1655711413960_201908324627钟乐.rp', '/home/xiaoyu/hrm/uploads/', 'application/octet-stream', 98284, 0, '2022-06-20 15:50:14', 1);
INSERT INTO `document_inf` VALUES (94, '33 原型首页', '33 原型首页', '1655711716914_app.rp', '/home/xiaoyu/hrm/uploads/', 'application/octet-stream', 96858, 0, '2022-06-20 15:55:17', 1);
INSERT INTO `document_inf` VALUES (95, 'day2-1', 'dddd', '1655783676538_201908324627钟乐.rp', '/home/xiaoyu/hrm/uploads/', 'application/octet-stream', 124510, 0, '2022-06-21 11:54:37', 1);
INSERT INTO `document_inf` VALUES (96, '22-6-21 33 原型', '22-6-21 33 原型', '1655784092190_app.rp', '/home/xiaoyu/hrm/uploads/', 'application/octet-stream', 165593, 0, '2022-06-21 12:01:32', 1);
INSERT INTO `document_inf` VALUES (97, 'web实训大作业', '2022-6-23\r\n包含圆形图及标注图', '1655970967880_pinxixi.zip', '/home/xiaoyu/hrm/uploads/', 'application/x-zip-compressed', 4165335, 0, '2022-06-23 15:56:08', 1);
INSERT INTO `document_inf` VALUES (98, 'pxixi效果图', '2022-6-23', '1655995184023_pinxixi.rp', '/home/xiaoyu/hrm/uploads/', 'application/octet-stream', 638257, 0, '2022-06-23 22:39:44', 1);
INSERT INTO `document_inf` VALUES (99, '1321', '12312', '1655996231341_pinxixi.zip', '/home/xiaoyu/hrm/uploads/', 'application/x-zip-compressed', 928286, 0, '2022-06-23 22:57:11', 1);

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
INSERT INTO `employee_inf` VALUES (1000, 2, 3, '123', '123123244565146', '1242541', '123431', '123531412254', '13543535223', '13141241', '211123@qq.com', 1, '共青团员', '2020-03-05 00:00:00', '汉族', '硕士', '123', '12312', '123123', '2020-03-25 00:00:00');
INSERT INTO `employee_inf` VALUES (1001, 3, 3, '123', '123123244565146', '1242541', '123431', '123531412254', '13543535223', '13141241', '211123@qq.com', 1, '共青团员', '2020-03-05 00:00:00', '汉族', '硕士', '123', '12312', '123123', '2020-03-25 00:00:00');

-- ----------------------------
-- Table structure for job_inf
-- ----------------------------
DROP TABLE IF EXISTS `job_inf`;
CREATE TABLE `job_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of job_inf
-- ----------------------------
INSERT INTO `job_inf` VALUES (2, 'g', 'g', '2018-01-11 00:00:00', 1);
INSERT INTO `job_inf` VALUES (3, 'S', 'Java中级开发工程师', '2018-01-11 00:00:00', 1);
INSERT INTO `job_inf` VALUES (41, 'yuanyuan', '1111', '2022-05-31 13:19:53', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 415 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
INSERT INTO `log_login` VALUES (271, 'admin', 'logout', '127.0.0.1', '2021-12-26 15:58:52');
INSERT INTO `log_login` VALUES (272, 'admin', 'login', '127.0.0.1', '2021-12-26 15:58:53');
INSERT INTO `log_login` VALUES (273, 'admin', 'login', '223.104.67.90', '2021-12-26 17:09:02');
INSERT INTO `log_login` VALUES (274, 'admin', 'login', '116.23.163.80', '2021-12-27 11:44:54');
INSERT INTO `log_login` VALUES (275, 'admin', 'login', '183.36.181.106', '2021-12-27 13:17:49');
INSERT INTO `log_login` VALUES (276, 'admin', 'login', '183.36.181.106', '2021-12-27 13:18:05');
INSERT INTO `log_login` VALUES (277, 'admin', 'login', '120.238.29.51', '2021-12-27 14:23:03');
INSERT INTO `log_login` VALUES (278, 'admin', 'login', '183.6.118.224', '2021-12-27 14:52:12');
INSERT INTO `log_login` VALUES (279, 'admin', 'logout', '183.6.118.224', '2021-12-27 14:52:18');
INSERT INTO `log_login` VALUES (280, 'admin', 'login', '183.6.118.224', '2021-12-27 14:52:21');
INSERT INTO `log_login` VALUES (281, 'admin', 'login', '183.6.95.70', '2021-12-27 15:53:41');
INSERT INTO `log_login` VALUES (282, 'admin', 'logout', '183.6.95.70', '2021-12-27 15:53:47');
INSERT INTO `log_login` VALUES (283, 'admin', 'login', '183.6.95.70', '2021-12-27 15:54:33');
INSERT INTO `log_login` VALUES (284, 'admin', 'logout', '183.6.95.70', '2021-12-27 15:54:39');
INSERT INTO `log_login` VALUES (285, 'admin', 'login', '183.6.95.70', '2021-12-27 15:54:40');
INSERT INTO `log_login` VALUES (286, 'admin', 'logout', '183.6.95.70', '2021-12-27 15:54:44');
INSERT INTO `log_login` VALUES (287, 'admin', 'login', '183.6.95.70', '2021-12-27 15:54:48');
INSERT INTO `log_login` VALUES (288, 'admin', 'logout', '183.6.95.70', '2021-12-27 16:00:32');
INSERT INTO `log_login` VALUES (289, 'admin', 'login', '183.6.95.70', '2021-12-27 16:19:50');
INSERT INTO `log_login` VALUES (290, 'admin', 'login', '183.6.118.224', '2021-12-27 16:33:34');
INSERT INTO `log_login` VALUES (291, 'admin', 'logout', '183.6.118.224', '2021-12-27 16:38:17');
INSERT INTO `log_login` VALUES (292, 'admin', 'login', '183.6.118.224', '2021-12-27 16:38:19');
INSERT INTO `log_login` VALUES (293, 'admin', 'logout', '183.6.118.224', '2021-12-27 16:41:05');
INSERT INTO `log_login` VALUES (294, 'admin', 'login', '183.6.118.224', '2021-12-27 16:41:34');
INSERT INTO `log_login` VALUES (295, 'admin', 'logout', '183.6.118.224', '2021-12-27 16:41:47');
INSERT INTO `log_login` VALUES (296, 'admin', 'login', '183.6.118.224', '2021-12-27 16:42:13');
INSERT INTO `log_login` VALUES (297, 'admin', 'logout', '183.6.118.224', '2021-12-27 16:43:12');
INSERT INTO `log_login` VALUES (298, 'admin', 'login', '183.6.118.224', '2021-12-27 16:43:20');
INSERT INTO `log_login` VALUES (299, '1231231', 'logout', '183.6.118.224', '2021-12-27 16:46:52');
INSERT INTO `log_login` VALUES (300, '1231231', 'login', '183.6.118.224', '2021-12-27 16:46:52');
INSERT INTO `log_login` VALUES (301, 'admin', 'logout', '183.6.118.194', '2021-12-27 17:18:04');
INSERT INTO `log_login` VALUES (302, 'admin', 'login', '183.6.118.194', '2021-12-27 17:18:05');
INSERT INTO `log_login` VALUES (303, 'admin', 'logout', '183.6.118.194', '2021-12-27 17:18:16');
INSERT INTO `log_login` VALUES (304, 'admin', 'login', '183.6.118.194', '2021-12-27 17:18:19');
INSERT INTO `log_login` VALUES (305, 'admin', 'logout', '183.6.118.194', '2021-12-27 17:18:30');
INSERT INTO `log_login` VALUES (306, 'admin', 'login', '183.6.118.194', '2021-12-27 17:18:33');
INSERT INTO `log_login` VALUES (307, 'admin', 'logout', '183.6.118.194', '2021-12-27 17:18:46');
INSERT INTO `log_login` VALUES (308, 'admin', 'login', '183.6.118.194', '2021-12-27 17:18:46');
INSERT INTO `log_login` VALUES (309, 'admin', 'logout', '183.6.118.194', '2021-12-27 17:19:39');
INSERT INTO `log_login` VALUES (310, 'admin', 'login', '183.6.118.194', '2021-12-27 17:19:48');
INSERT INTO `log_login` VALUES (311, '1231231', 'logout', '183.6.118.194', '2021-12-27 17:36:07');
INSERT INTO `log_login` VALUES (312, '1231231', 'login', '183.6.118.194', '2021-12-27 17:36:08');
INSERT INTO `log_login` VALUES (313, '1231231', 'login', '183.6.95.70', '2021-12-27 17:51:16');
INSERT INTO `log_login` VALUES (314, 'admin', 'logout', '183.6.95.70', '2021-12-27 17:55:04');
INSERT INTO `log_login` VALUES (315, 'admin', 'login', '183.6.95.70', '2021-12-27 17:55:05');
INSERT INTO `log_login` VALUES (316, 'admin', 'logout', '183.6.95.70', '2021-12-27 17:55:11');
INSERT INTO `log_login` VALUES (317, 'admin', 'login', '183.6.95.70', '2021-12-27 17:55:13');
INSERT INTO `log_login` VALUES (318, 'admin', 'login', '183.6.95.70', '2021-12-27 18:08:38');
INSERT INTO `log_login` VALUES (319, 'admin', 'logout', '183.6.95.70', '2021-12-27 18:12:27');
INSERT INTO `log_login` VALUES (320, 'admin', 'login', '183.6.95.70', '2021-12-27 18:12:37');
INSERT INTO `log_login` VALUES (321, '1231231', 'logout', '183.6.95.70', '2021-12-27 18:13:45');
INSERT INTO `log_login` VALUES (322, '1231231', 'login', '183.6.95.70', '2021-12-27 18:13:46');
INSERT INTO `log_login` VALUES (323, '1231231', 'login', '183.6.41.12', '2021-12-27 23:32:51');
INSERT INTO `log_login` VALUES (324, '1231231', 'login', '116.52.34.55', '2021-12-28 14:42:55');
INSERT INTO `log_login` VALUES (325, '1231231', 'login', '222.244.158.206', '2022-01-01 15:18:57');
INSERT INTO `log_login` VALUES (326, '1231231', 'login', '220.174.242.5', '2022-01-11 10:08:57');
INSERT INTO `log_login` VALUES (327, '1231231', 'login', '144.52.175.241', '2022-01-12 13:42:42');
INSERT INTO `log_login` VALUES (328, '1231231', 'login', '117.36.118.216', '2022-01-24 13:53:59');
INSERT INTO `log_login` VALUES (329, '1231231', 'login', '222.243.158.253', '2022-02-12 13:14:41');
INSERT INTO `log_login` VALUES (330, '1231231', 'login', '182.149.167.139', '2022-02-22 20:50:53');
INSERT INTO `log_login` VALUES (331, 'admin', 'logout', '182.149.167.139', '2022-02-22 20:51:23');
INSERT INTO `log_login` VALUES (332, 'admin', 'login', '125.93.83.250', '2022-02-25 12:01:38');
INSERT INTO `log_login` VALUES (333, 'admin', 'login', '23.142.224.22', '2022-02-26 13:26:49');
INSERT INTO `log_login` VALUES (334, 'admin', 'login', '115.216.3.166', '2022-03-10 11:37:57');
INSERT INTO `log_login` VALUES (335, 'admin', 'login', '125.93.83.233', '2022-03-10 11:52:24');
INSERT INTO `log_login` VALUES (336, 'admin', 'login', '125.93.83.239', '2022-03-11 11:08:20');
INSERT INTO `log_login` VALUES (337, 'admin', 'login', '81.28.13.41', '2022-03-11 14:34:12');
INSERT INTO `log_login` VALUES (338, 'admin', 'logout', '81.28.13.41', '2022-03-11 14:36:03');
INSERT INTO `log_login` VALUES (339, 'admin', 'login', '81.28.13.41', '2022-03-11 14:37:28');
INSERT INTO `log_login` VALUES (340, 'admin', 'logout', '81.28.13.41', '2022-03-11 14:38:31');
INSERT INTO `log_login` VALUES (341, 'admin', 'login', '20.187.75.197', '2022-03-11 14:45:30');
INSERT INTO `log_login` VALUES (342, 'admin', 'login', '119.141.85.227', '2022-05-07 22:11:11');
INSERT INTO `log_login` VALUES (343, 'admin', 'login', '119.141.85.99', '2022-05-09 09:36:10');
INSERT INTO `log_login` VALUES (344, 'admin', 'login', '218.24.162.13', '2022-05-09 09:40:22');
INSERT INTO `log_login` VALUES (345, 'admin', 'login', '119.141.85.99', '2022-05-11 15:07:19');
INSERT INTO `log_login` VALUES (346, 'admin', 'login', '183.6.73.139', '2022-05-12 16:53:36');
INSERT INTO `log_login` VALUES (347, 'admin', 'login', '223.104.67.88', '2022-05-12 16:55:17');
INSERT INTO `log_login` VALUES (348, 'admin', 'logout', '223.104.67.88', '2022-05-12 16:55:24');
INSERT INTO `log_login` VALUES (349, 'admin', 'login', '1.62.202.28', '2022-05-17 14:02:00');
INSERT INTO `log_login` VALUES (350, 'admin', 'login', '112.6.193.19', '2022-05-20 01:02:01');
INSERT INTO `log_login` VALUES (351, 'admin', 'login', '74.207.246.138', '2022-05-27 21:16:38');
INSERT INTO `log_login` VALUES (352, 'admin', 'login', '74.207.246.138', '2022-05-27 21:17:57');
INSERT INTO `log_login` VALUES (353, 'admin', 'login', '59.57.153.132', '2022-05-28 14:34:04');
INSERT INTO `log_login` VALUES (354, 'admin', 'login', '110.53.129.39', '2022-05-31 13:18:21');
INSERT INTO `log_login` VALUES (355, 'admin', 'logout', '110.53.129.39', '2022-05-31 13:26:25');
INSERT INTO `log_login` VALUES (356, 'admin', 'login', '110.53.129.39', '2022-05-31 13:26:29');
INSERT INTO `log_login` VALUES (357, 'admin', 'login', '223.107.38.0', '2022-05-31 20:38:22');
INSERT INTO `log_login` VALUES (358, 'admin', 'login', '182.91.186.25', '2022-06-03 20:53:12');
INSERT INTO `log_login` VALUES (359, 'admin', 'login', '119.141.85.242', '2022-06-09 11:01:01');
INSERT INTO `log_login` VALUES (360, 'admin', 'login', '125.93.83.250', '2022-06-09 11:01:43');
INSERT INTO `log_login` VALUES (361, 'admin', 'login', '125.93.83.250', '2022-06-09 11:27:31');
INSERT INTO `log_login` VALUES (362, 'admin', 'login', '223.104.63.254', '2022-06-09 22:00:37');
INSERT INTO `log_login` VALUES (363, 'admin', 'login', '180.165.119.10', '2022-06-10 22:08:57');
INSERT INTO `log_login` VALUES (364, 'admin', 'login', '180.165.119.10', '2022-06-10 22:13:57');
INSERT INTO `log_login` VALUES (365, 'admin', 'logout', '180.165.119.10', '2022-06-11 10:01:46');
INSERT INTO `log_login` VALUES (366, 'admin', 'login', '180.165.119.10', '2022-06-11 10:01:59');
INSERT INTO `log_login` VALUES (367, 'admin', 'logout', '180.165.119.10', '2022-06-11 10:14:32');
INSERT INTO `log_login` VALUES (368, 'admin', 'login', '180.165.119.10', '2022-06-11 10:14:59');
INSERT INTO `log_login` VALUES (369, 'admin', 'logout', '180.165.119.10', '2022-06-11 10:15:03');
INSERT INTO `log_login` VALUES (370, 'admin', 'login', '180.165.119.10', '2022-06-11 10:23:57');
INSERT INTO `log_login` VALUES (371, 'admin', 'login', '180.165.119.10', '2022-06-11 10:49:52');
INSERT INTO `log_login` VALUES (372, 'admin', 'login', '36.161.112.104', '2022-06-14 10:35:24');
INSERT INTO `log_login` VALUES (373, 'admin', 'logout', '36.161.112.104', '2022-06-14 10:39:37');
INSERT INTO `log_login` VALUES (374, 'admin', 'login', '36.161.112.104', '2022-06-14 10:39:39');
INSERT INTO `log_login` VALUES (375, 'admin', 'login', '101.82.120.63', '2022-06-14 14:12:31');
INSERT INTO `log_login` VALUES (376, 'admin', 'login', '36.161.112.104', '2022-06-14 23:42:03');
INSERT INTO `log_login` VALUES (377, 'admin', 'login', '222.242.252.110', '2022-06-17 15:19:19');
INSERT INTO `log_login` VALUES (378, 'admin', 'login', '125.93.83.242', '2022-06-20 11:53:16');
INSERT INTO `log_login` VALUES (379, 'admin', 'login', '125.93.83.242', '2022-06-20 11:59:33');
INSERT INTO `log_login` VALUES (380, 'admin', 'login', '125.93.83.238', '2022-06-20 12:02:43');
INSERT INTO `log_login` VALUES (381, 'admin', 'login', '125.93.83.235', '2022-06-20 12:05:15');
INSERT INTO `log_login` VALUES (382, 'admin', 'login', '125.93.83.235', '2022-06-20 14:36:45');
INSERT INTO `log_login` VALUES (383, 'admin', 'login', '125.93.83.238', '2022-06-20 14:41:33');
INSERT INTO `log_login` VALUES (384, 'admin', 'login', '125.93.83.238', '2022-06-20 15:48:54');
INSERT INTO `log_login` VALUES (385, 'admin', 'logout', '125.93.83.235', '2022-06-20 15:54:14');
INSERT INTO `log_login` VALUES (386, 'admin', 'login', '125.93.83.235', '2022-06-20 15:54:15');
INSERT INTO `log_login` VALUES (387, 'admin', 'login', '125.90.50.207', '2022-06-20 16:21:03');
INSERT INTO `log_login` VALUES (388, 'admin', 'login', '125.93.83.238', '2022-06-21 08:24:40');
INSERT INTO `log_login` VALUES (389, 'admin', 'login', '125.93.83.238', '2022-06-21 08:39:08');
INSERT INTO `log_login` VALUES (390, 'admin', 'login', '125.93.83.238', '2022-06-21 11:27:59');
INSERT INTO `log_login` VALUES (391, 'admin', 'login', '125.93.83.235', '2022-06-21 12:00:52');
INSERT INTO `log_login` VALUES (392, 'admin', 'login', '112.48.62.103', '2022-06-21 22:57:33');
INSERT INTO `log_login` VALUES (393, 'admin', 'login', '119.141.85.0', '2022-06-22 10:03:15');
INSERT INTO `log_login` VALUES (394, 'admin', 'login', '125.93.83.238', '2022-06-23 10:04:51');
INSERT INTO `log_login` VALUES (395, 'admin', 'login', '125.93.83.235', '2022-06-23 15:54:30');
INSERT INTO `log_login` VALUES (396, 'admin', 'login', '119.141.85.0', '2022-06-23 22:39:12');
INSERT INTO `log_login` VALUES (397, 'admin', 'login', '119.141.85.200', '2022-06-23 22:40:36');
INSERT INTO `log_login` VALUES (398, 'admin', 'login', '125.90.50.142', '2022-06-28 09:57:09');
INSERT INTO `log_login` VALUES (399, 'admin', 'login', '127.0.0.1', '2022-07-20 21:52:09');
INSERT INTO `log_login` VALUES (400, 'admin', 'login', '46.8.199.33', '2022-08-12 09:34:16');
INSERT INTO `log_login` VALUES (401, 'admin', 'login', '124.65.127.78', '2022-08-16 10:27:28');
INSERT INTO `log_login` VALUES (402, 'admin', 'login', '223.104.65.239', '2022-08-18 17:23:22');
INSERT INTO `log_login` VALUES (403, 'admin', 'login', '223.73.168.244', '2022-08-20 11:03:01');
INSERT INTO `log_login` VALUES (404, 'admin', 'logout', '14.113.143.8', '2022-08-20 17:34:22');
INSERT INTO `log_login` VALUES (405, 'admin', 'login', '14.113.143.8', '2022-08-20 17:35:12');
INSERT INTO `log_login` VALUES (406, 'admin', 'login', '0:0:0:0:0:0:0:1', '2022-08-20 17:41:07');
INSERT INTO `log_login` VALUES (407, 'admin', 'login', '127.0.0.1', '2022-08-20 18:56:52');
INSERT INTO `log_login` VALUES (408, 'admin', 'logout', '0:0:0:0:0:0:0:1', '2022-08-20 18:57:25');
INSERT INTO `log_login` VALUES (409, 'admin', 'login', '127.0.0.1', '2022-08-20 18:57:31');
INSERT INTO `log_login` VALUES (410, 'admin', 'login', '0:0:0:0:0:0:0:1', '2022-08-20 19:01:00');
INSERT INTO `log_login` VALUES (411, 'admin', 'login', '0:0:0:0:0:0:0:1', '2022-08-20 19:01:16');
INSERT INTO `log_login` VALUES (412, 'admin', 'logout', '0:0:0:0:0:0:0:1', '2022-08-20 19:01:46');
INSERT INTO `log_login` VALUES (413, 'admin', 'login', '0:0:0:0:0:0:0:1', '2022-08-20 19:04:35');
INSERT INTO `log_login` VALUES (414, 'admin', 'login', '117.136.79.206', '2022-08-20 19:04:35');

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
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
INSERT INTO `log_operating` VALUES (64, 'admin', 'powerDeleteDocument', '{\"createDate\":1640361600000,\"delete\":false,\"fileName\":\"1640413476294_聚合.txt\",\"fileSize\":1032,\"fileType\":\"text/plain\",\"id\":81,\"remark\":\"12\",\"title\":\"12\",\"user\":{\"id\":1,\"loginname\":\"admin\"},\"userId\":1}', '127.0.0.1', '2021-12-26 15:57:58');
INSERT INTO `log_operating` VALUES (65, 'admin', 'powerDeleteDocument', '{\"createDate\":1640361600000,\"delete\":false,\"fileName\":\"1640413476294_聚合.txt\",\"fileSize\":1032,\"fileType\":\"text/plain\",\"id\":81,\"remark\":\"12\",\"title\":\"12\",\"user\":{\"id\":1,\"loginname\":\"admin\"},\"userId\":1}', '127.0.0.1', '2021-12-26 15:58:03');
INSERT INTO `log_operating` VALUES (66, 'admin', 'powerDeleteDocument', '{\"createDate\":1640361600000,\"delete\":false,\"fileName\":\"1640413476294_聚合.txt\",\"fileSize\":1032,\"fileType\":\"text/plain\",\"id\":81,\"remark\":\"12\",\"title\":\"12\",\"user\":{\"id\":1,\"loginname\":\"admin\"},\"userId\":1}', '127.0.0.1', '2021-12-26 15:58:14');
INSERT INTO `log_operating` VALUES (67, 'admin', 'powerDeleteDocument', '{\"createDate\":1640361600000,\"delete\":false,\"fileName\":\"1640413476294_聚合.txt\",\"fileSize\":1032,\"fileType\":\"text/plain\",\"id\":81,\"remark\":\"12\",\"title\":\"12\",\"user\":{\"id\":1,\"loginname\":\"admin\"},\"userId\":1}', '127.0.0.1', '2021-12-26 15:58:57');
INSERT INTO `log_operating` VALUES (68, 'admin', 'powerDeleteDocument', '{\"createDate\":1640361600000,\"delete\":false,\"fileName\":\"1640413476294_聚合.txt\",\"fileSize\":1032,\"fileType\":\"text/plain\",\"id\":81,\"remark\":\"12\",\"title\":\"12\",\"user\":{\"id\":1,\"loginname\":\"admin\"},\"userId\":1}', '127.0.0.1', '2021-12-26 15:59:04');
INSERT INTO `log_operating` VALUES (69, 'admin', 'powerDeleteEmployee', '{\"address\":\"2131423534\",\"birthday\":1583078400000,\"cardId\":\"42312432131412\",\"createDate\":1585065600000,\"department\":{\"children\":[],\"id\":134,\"name\":\"测定\"},\"education\":\"高中\",\"email\":\"123321@qq.com\",\"hobby\":\"123\",\"id\":1004,\"name\":\"四个字的\",\"party\":\"中共党员\",\"phone\":\"13213432221\",\"position\":{\"id\":1,\"name\":\"职员\"},\"postCode\":\"12312421\",\"qqNum\":\"123114\",\"race\":\"汉族\",\"remark\":\"2313\",\"sex\":0,\"speciality\":\"信息管理与信息系统\",\"tel\":\"241412411\"}', '127.0.0.1', '2021-12-26 16:00:10');
INSERT INTO `log_operating` VALUES (70, 'admin', 'otherInsertDocument', '{\"createDate\":1640505761045,\"delete\":false,\"fileName\":\"1640505761045_聚合.txt\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":1032,\"fileType\":\"text/plain\",\"remark\":\"98\",\"title\":\"789\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"管理员\"},\"userId\":1}', '127.0.0.1', '2021-12-26 16:02:41');
INSERT INTO `log_operating` VALUES (71, 'admin', 'powerDeleteDocument', '{\"createDate\":1640448000000,\"delete\":false,\"fileName\":\"1640505761045_聚合.txt\",\"fileSize\":1032,\"fileType\":\"text/plain\",\"id\":82,\"remark\":\"98\",\"title\":\"789\",\"user\":{\"id\":1,\"loginname\":\"admin\"},\"userId\":1}', '127.0.0.1', '2021-12-26 16:02:52');
INSERT INTO `log_operating` VALUES (72, 'admin', 'powerInsertUser', '{\"createdate\":1640583741421,\"id\":131,\"loginname\":\"1231321\",\"newPassword\":\"\",\"password\":\"a123456\",\"status\":1,\"username\":\"123123\"}', '183.36.181.106', '2021-12-27 13:42:21');
INSERT INTO `log_operating` VALUES (73, 'admin', 'powerInsertDepartment', '{\"children\":[],\"depPath\":\".1.4\",\"enabled\":true,\"id\":144,\"name\":\"nnljjl\",\"parentId\":3,\"remark\":\"bkkh\"}', '120.238.29.51', '2021-12-27 14:23:19');
INSERT INTO `log_operating` VALUES (74, 'admin', 'powerDeletePosition', '{\"createDate\":1598284800000,\"enabled\":true,\"id\":30,\"name\":\"电工\",\"remark\":\"电工\"}', '120.238.29.51', '2021-12-27 14:23:57');
INSERT INTO `log_operating` VALUES (75, 'admin', 'powerInsertDepartment', '{\"children\":[],\"depPath\":\".1.4\",\"enabled\":true,\"id\":145,\"name\":\"test\",\"parentId\":2,\"remark\":\"tes1\"}', '120.238.29.51', '2021-12-27 14:25:37');
INSERT INTO `log_operating` VALUES (76, 'admin', 'powerDeleteUser', '{\"createdate\":1590508800000,\"id\":83,\"loginname\":\"test041\",\"status\":1,\"username\":\"自动生成账号\"}', '183.6.118.224', '2021-12-27 15:05:46');
INSERT INTO `log_operating` VALUES (77, 'admin', 'powerDeleteUser', '{\"createdate\":1590508800000,\"id\":82,\"loginname\":\"test025\",\"status\":1,\"username\":\"自动生成账号\"}', '183.6.118.224', '2021-12-27 15:05:56');
INSERT INTO `log_operating` VALUES (78, 'admin', 'powerUpdatePosition', '{\"createDate\":1515600000000,\"enabled\":false,\"id\":1,\"name\":\"职员\",\"remark\":\"职员\"}', '183.6.95.70', '2021-12-27 15:55:11');
INSERT INTO `log_operating` VALUES (79, 'admin', 'powerUpdatePosition', '{\"createDate\":1515600000000,\"enabled\":true,\"id\":1,\"name\":\"职员\",\"remark\":\"职员\"}', '183.6.95.70', '2021-12-27 15:55:14');
INSERT INTO `log_operating` VALUES (80, 'admin', 'powerInsertDepartment', '{\"children\":[],\"depPath\":\".1\",\"enabled\":true,\"id\":146,\"name\":\"3-=h\",\"parentId\":1,\"remark\":\"6\"}', '183.6.95.70', '2021-12-27 16:20:12');
INSERT INTO `log_operating` VALUES (81, 'admin', 'powerInsertDepartment', '{\"children\":[],\"depPath\":\".1\",\"enabled\":true,\"id\":147,\"name\":\"[0 KK OP\",\"parentId\":1,\"remark\":\"243\"}', '183.6.95.70', '2021-12-27 16:20:27');
INSERT INTO `log_operating` VALUES (82, 'admin', 'powerDeleteDepartment', '{\"children\":[],\"depPath\":\".1\",\"enabled\":true,\"id\":146,\"name\":\"3-=h\",\"parentId\":1,\"remark\":\"6\"}', '183.6.95.70', '2021-12-27 16:20:33');
INSERT INTO `log_operating` VALUES (83, 'admin', 'powerDeleteDepartment', '{\"children\":[],\"depPath\":\".1\",\"enabled\":true,\"id\":147,\"name\":\"[0 KK OP\",\"parentId\":1,\"remark\":\"243\"}', '183.6.95.70', '2021-12-27 16:20:34');
INSERT INTO `log_operating` VALUES (84, 'admin', 'powerInsertDepartment', '{\"children\":[],\"depPath\":\".1\",\"enabled\":true,\"id\":148,\"name\":\"ki\",\"parentId\":1,\"remark\":\"j\"}', '183.6.95.70', '2021-12-27 16:21:33');
INSERT INTO `log_operating` VALUES (85, 'admin', 'powerDeletePosition', '{\"createDate\":1515600000000,\"enabled\":true,\"id\":1,\"name\":\"职员\",\"remark\":\"职员\"}', '183.6.118.224', '2021-12-27 16:35:39');
INSERT INTO `log_operating` VALUES (86, 'admin', 'powerDeletesPosition', '{\"createDate\":1515600000000,\"enabled\":true,\"id\":1,\"name\":\"职员\",\"remark\":\"职员\"}', '183.6.118.224', '2021-12-27 16:36:11');
INSERT INTO `log_operating` VALUES (87, 'admin', 'powerUpdatePosition', '{\"createDate\":1515600000000,\"enabled\":false,\"id\":2,\"name\":\"Java开发工程师\",\"remark\":\"Java开发工程师\"}', '183.6.118.224', '2021-12-27 16:39:06');
INSERT INTO `log_operating` VALUES (88, 'admin', 'powerDeletePosition', '{\"createDate\":1515600000000,\"enabled\":true,\"id\":6,\"name\":\"架构师\",\"remark\":\"架构师\"}', '183.6.118.224', '2021-12-27 16:39:14');
INSERT INTO `log_operating` VALUES (89, 'admin', 'powerDeletePosition', '{\"createDate\":1515600000000,\"enabled\":true,\"id\":8,\"name\":\"经理\",\"remark\":\"经理\"}', '183.6.118.224', '2021-12-27 16:39:19');
INSERT INTO `log_operating` VALUES (90, 'admin', 'powerDeletePosition', '{\"createDate\":1515600000000,\"enabled\":true,\"id\":7,\"name\":\"主管\",\"remark\":\"主管\"}', '183.6.118.224', '2021-12-27 16:39:22');
INSERT INTO `log_operating` VALUES (91, 'admin', 'powerUpdatePosition', '{\"createDate\":1515600000000,\"enabled\":true,\"id\":2,\"name\":\"Java开发工程师\",\"remark\":\"Java开发工程师\"}', '183.6.118.224', '2021-12-27 16:39:33');
INSERT INTO `log_operating` VALUES (92, 'admin', 'powerDeletePosition', '{\"createDate\":1618588800000,\"enabled\":true,\"id\":32,\"name\":\"wqw\",\"remark\":\"qwqw\"}', '183.6.118.224', '2021-12-27 16:39:37');
INSERT INTO `log_operating` VALUES (93, 'admin', 'powerInsertPosition', '{\"createDate\":1640594394449,\"enabled\":true,\"name\":\"444\",\"remark\":\"444\"}', '183.6.118.224', '2021-12-27 16:39:54');
INSERT INTO `log_operating` VALUES (94, 'admin', 'powerInsertPosition', '{\"createDate\":1640594397463,\"enabled\":true,\"name\":\"897\",\"remark\":\"798\"}', '183.6.118.224', '2021-12-27 16:39:57');
INSERT INTO `log_operating` VALUES (95, 'admin', 'powerDeletesEmployee', '{\"createDate\":1640594397463,\"enabled\":true,\"name\":\"897\",\"remark\":\"798\"}', '183.6.118.224', '2021-12-27 16:40:28');
INSERT INTO `log_operating` VALUES (96, 'admin', 'powerDeletesPosition', '{\"createDate\":1640594397463,\"enabled\":true,\"name\":\"897\",\"remark\":\"798\"}', '183.6.118.224', '2021-12-27 16:40:35');
INSERT INTO `log_operating` VALUES (97, 'admin', 'powerInsertUser', '{\"createdate\":1640594582746,\"id\":132,\"loginname\":\"1231231\",\"newPassword\":\"\",\"password\":\"z123456\",\"status\":1,\"username\":\"1231231\"}', '183.6.118.224', '2021-12-27 16:43:03');
INSERT INTO `log_operating` VALUES (98, 'admin', 'powerDeleteUser', '{\"createdate\":1590508800000,\"id\":84,\"loginname\":\"test031\",\"status\":1,\"username\":\"自动生成账号\"}', '183.6.95.70', '2021-12-27 17:02:02');
INSERT INTO `log_operating` VALUES (99, 'admin', 'powerDeleteUser', '{\"createdate\":1590508800000,\"id\":86,\"loginname\":\"test042\",\"status\":1,\"username\":\"自动生成账号\"}', '183.6.95.70', '2021-12-27 17:02:12');
INSERT INTO `log_operating` VALUES (100, 'admin', 'powerDeleteUser', '{\"createdate\":1590508800000,\"id\":85,\"loginname\":\"test026\",\"status\":1,\"username\":\"自动生成账号\"}', '183.6.118.194', '2021-12-27 17:14:21');
INSERT INTO `log_operating` VALUES (101, 'admin', 'powerDeleteUser', '{\"createdate\":1590508800000,\"id\":87,\"loginname\":\"test032\",\"status\":1,\"username\":\"自动生成账号\"}', '183.6.118.194', '2021-12-27 17:14:33');
INSERT INTO `log_operating` VALUES (102, 'admin', 'powerDeletePosition', '{\"createDate\":1604332800000,\"enabled\":true,\"id\":31,\"name\":\"无敌开发岗\",\"remark\":\"给钱无敌多\"}', '183.6.118.194', '2021-12-27 17:15:16');
INSERT INTO `log_operating` VALUES (103, 'admin', 'powerDeleteDepartment', '{\"children\":[],\"depPath\":\".1.148\",\"enabled\":true,\"id\":148,\"name\":\"ki\",\"parent\":false,\"parentId\":1,\"remark\":\"j\"}', '183.6.118.194', '2021-12-27 17:18:02');
INSERT INTO `log_operating` VALUES (104, 'admin', 'powerUpdatePosition', '{\"createDate\":1515600000000,\"enabled\":true,\"id\":2,\"name\":\"Java开发工程师\",\"remark\":\"g\"}', '183.6.118.194', '2021-12-27 17:36:37');
INSERT INTO `log_operating` VALUES (105, 'admin', 'powerUpdatePosition', '{\"createDate\":1515600000000,\"enabled\":true,\"id\":2,\"name\":\"g\",\"remark\":\"g\"}', '183.6.118.194', '2021-12-27 17:36:39');
INSERT INTO `log_operating` VALUES (106, 'admin', 'powerUpdatePosition', '{\"createDate\":1515600000000,\"enabled\":true,\"id\":2,\"name\":\"g\",\"remark\":\"g\"}', '183.6.118.194', '2021-12-27 17:38:43');
INSERT INTO `log_operating` VALUES (107, 'admin', 'powerDeletePosition', '{\"createDate\":1618588800000,\"enabled\":true,\"id\":33,\"name\":\"1212\",\"remark\":\"211212\"}', '183.6.118.194', '2021-12-27 17:39:52');
INSERT INTO `log_operating` VALUES (108, 'admin', 'powerDeleteUser', '{\"createdate\":1590508800000,\"id\":88,\"loginname\":\"test027\",\"status\":1,\"username\":\"自动生成账号1\"}', '183.6.95.70', '2021-12-27 17:55:28');
INSERT INTO `log_operating` VALUES (109, 'admin', 'powerInsertPosition', '{\"createDate\":1640599762055,\"enabled\":true,\"name\":\"45\",\"remark\":\"45\"}', '183.6.95.70', '2021-12-27 18:09:22');
INSERT INTO `log_operating` VALUES (110, 'admin', 'powerInsertPosition', '{\"createDate\":1640599764254,\"enabled\":true,\"name\":\"78\",\"remark\":\"7887\"}', '183.6.95.70', '2021-12-27 18:09:24');
INSERT INTO `log_operating` VALUES (111, 'admin', 'powerInsertPosition', '{\"createDate\":1640599766190,\"enabled\":true,\"name\":\"788\",\"remark\":\"78\"}', '183.6.95.70', '2021-12-27 18:09:26');
INSERT INTO `log_operating` VALUES (112, 'admin', 'powerDeletePosition', '{\"createDate\":1640534400000,\"enabled\":true,\"id\":39,\"name\":\"78\",\"remark\":\"7887\"}', '183.6.95.70', '2021-12-27 18:09:31');
INSERT INTO `log_operating` VALUES (113, 'admin', 'powerDeletesPosition', '{\"createDate\":1640534400000,\"enabled\":true,\"id\":39,\"name\":\"78\",\"remark\":\"7887\"}', '183.6.95.70', '2021-12-27 18:09:35');
INSERT INTO `log_operating` VALUES (114, 'admin', 'powerUpdateEmployee', '{\"address\":\"广州\",\"birthday\":1640275200000,\"cardId\":\"432801197711251038\",\"createDate\":1468425600000,\"department\":{\"children\":[],\"id\":1,\"name\":\"总公办\"},\"education\":\"本科\",\"email\":\"36750064@qq.com\",\"hobby\":\"爬山\",\"id\":3,\"name\":\"bb\",\"party\":\"中共党员\",\"phone\":\"13907351532\",\"position\":{\"id\":2,\"name\":\"g\"},\"postCode\":\"510000\",\"qqNum\":\"36750064\",\"race\":\"汉族\",\"remark\":\"无\",\"sex\":0,\"speciality\":\"计算机\",\"tel\":\"020-99999999\"}', '183.6.95.70', '2021-12-27 18:10:35');
INSERT INTO `log_operating` VALUES (115, 'admin', 'powerUpdateEmployee', '{\"address\":\"QQQ\",\"birthday\":1640275200000,\"cardId\":\"432801197711251038\",\"createDate\":1468425600000,\"department\":{\"children\":[],\"id\":1,\"name\":\"总公办\"},\"education\":\"本科\",\"email\":\"36750064@qq.com\",\"hobby\":\"爬山\",\"id\":3,\"name\":\"bb\",\"party\":\"中共党员\",\"phone\":\"13907351532\",\"position\":{\"id\":2,\"name\":\"g\"},\"postCode\":\"510000\",\"qqNum\":\"36750064\",\"race\":\"汉族\",\"remark\":\"无\",\"sex\":0,\"speciality\":\"计算机\",\"tel\":\"020-99999999\"}', '183.6.95.70', '2021-12-27 18:10:56');
INSERT INTO `log_operating` VALUES (116, 'admin', 'powerUpdateEmployee', '{\"address\":\"广州\",\"birthday\":1640275200000,\"cardId\":\"432801197711251038\",\"createDate\":1468425600000,\"department\":{\"children\":[],\"id\":1,\"name\":\"总公办\"},\"education\":\"本科\",\"email\":\"36750064@qq.com\",\"hobby\":\"爬山\",\"id\":3,\"name\":\"bb\",\"party\":\"中共党员\",\"phone\":\"13907351532\",\"position\":{\"id\":2,\"name\":\"g\"},\"postCode\":\"510000\",\"qqNum\":\"36750064\",\"race\":\"汉族\",\"remark\":\"无\",\"sex\":0,\"speciality\":\"计算机\",\"tel\":\"020-99999999\"}', '183.6.95.70', '2021-12-27 18:11:01');
INSERT INTO `log_operating` VALUES (117, 'admin', 'powerUpdatePosition', '{\"createDate\":1515600000000,\"enabled\":true,\"id\":3,\"name\":\"S\",\"remark\":\"Java中级开发工程师\"}', '183.6.95.70', '2021-12-27 18:11:13');
INSERT INTO `log_operating` VALUES (118, 'admin', 'powerDeleteUser', '{\"createdate\":1590508800000,\"id\":89,\"loginname\":\"test043\",\"status\":1,\"username\":\"自动生成账号\"}', '183.6.95.70', '2021-12-27 18:14:21');
INSERT INTO `log_operating` VALUES (119, 'admin', 'powerDeleteDepartment', '{\"children\":[],\"depPath\":\".1.4.143\",\"enabled\":true,\"id\":143,\"name\":\"ty\",\"parent\":false,\"parentId\":2,\"remark\":\"ry\"}', '183.6.95.70', '2021-12-27 18:14:47');
INSERT INTO `log_operating` VALUES (120, 'admin', 'otherInsertDocument', '{\"createDate\":1645761726510,\"delete\":false,\"fileName\":\"1645761726510_xiaoyu_2_25.rar\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":124140,\"fileType\":\"application/octet-stream\",\"remark\":\"2022 2 25 HTML\",\"title\":\"2022 2 25 HTML\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"管理员\"},\"userId\":1}', '125.93.83.250', '2022-02-25 12:02:07');
INSERT INTO `log_operating` VALUES (121, 'admin', 'otherInsertDocument', '{\"createDate\":1646884444146,\"delete\":false,\"fileName\":\"1646884444146_system.py\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":1544,\"fileType\":\"text/plain\",\"remark\":\"学生管理系统 初步 \",\"title\":\"system.py\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"管理员\"},\"userId\":1}', '125.93.83.233', '2022-03-10 11:54:04');
INSERT INTO `log_operating` VALUES (122, 'admin', 'otherInsertDocument', '{\"createDate\":1646968132327,\"delete\":false,\"fileName\":\"1646968132327_33.rar\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":165693,\"fileType\":\"application/octet-stream\",\"remark\":\"2022-3-11 HTML\",\"title\":\"2022-3-11 HTML\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"管理员\"},\"userId\":1}', '125.93.83.239', '2022-03-11 11:08:52');
INSERT INTO `log_operating` VALUES (123, 'admin', 'otherUpdateUser', '{\"createdate\":1583942400000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"管理\"}', '110.53.129.39', '2022-05-31 13:18:33');
INSERT INTO `log_operating` VALUES (124, 'admin', 'otherUpdateUser', '{\"createdate\":1590508800000,\"id\":90,\"loginname\":\"test033\",\"status\":1,\"username\":\"自动生成账号\"}', '110.53.129.39', '2022-05-31 13:18:44');
INSERT INTO `log_operating` VALUES (125, 'admin', 'powerDeleteUser', '{\"createdate\":1590508800000,\"id\":90,\"loginname\":\"test033\",\"status\":1,\"username\":\"自动生成账号\"}', '110.53.129.39', '2022-05-31 13:19:23');
INSERT INTO `log_operating` VALUES (126, 'admin', 'powerInsertPosition', '{\"createDate\":1653974392869,\"enabled\":true,\"name\":\"yuanyuan\",\"remark\":\"1111\"}', '110.53.129.39', '2022-05-31 13:19:53');
INSERT INTO `log_operating` VALUES (127, 'admin', 'powerInsertUser', '{\"createdate\":1653974432421,\"id\":133,\"loginname\":\"11111\",\"newPassword\":\"\",\"password\":\"111111x\",\"status\":1,\"username\":\"12345\"}', '110.53.129.39', '2022-05-31 13:20:32');
INSERT INTO `log_operating` VALUES (128, 'admin', 'otherInsertDocument', '{\"createDate\":1654743700553,\"delete\":false,\"fileName\":\"1654743700553_草稿.py\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":5749,\"fileType\":\"text/plain\",\"remark\":\"123\",\"title\":\"123\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"管理\"},\"userId\":1}', '119.141.85.242', '2022-06-09 11:01:41');
INSERT INTO `log_operating` VALUES (129, 'admin', 'otherInsertDocument', '{\"createDate\":1654744952494,\"delete\":false,\"fileName\":\"1654744952494_可视化.py\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":904,\"fileType\":\"text/plain\",\"remark\":\"1\",\"title\":\"1\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"管理\"},\"userId\":1}', '119.141.85.242', '2022-06-09 11:22:33');
INSERT INTO `log_operating` VALUES (130, 'admin', 'otherInsertDocument', '{\"createDate\":1654747617774,\"delete\":false,\"fileName\":\"1654747617774_untitled.rar\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":1218,\"fileType\":\"application/octet-stream\",\"remark\":\"adad\",\"title\":\"wada\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"管理\"},\"userId\":1}', '125.93.83.250', '2022-06-09 12:06:58');
INSERT INTO `log_operating` VALUES (131, 'admin', 'otherInsertDocument', '{\"createDate\":1655697250271,\"delete\":false,\"fileName\":\"1655697250271_26张嘉城注册登陆页.rp\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":53646,\"fileType\":\"application/octet-stream\",\"remark\":\"monday\",\"title\":\"rp\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"管理\"},\"userId\":1}', '125.93.83.242', '2022-06-20 11:54:10');
INSERT INTO `log_operating` VALUES (132, 'admin', 'otherInsertDocument', '{\"createDate\":1655697793001,\"delete\":false,\"fileName\":\"1655697793001_201908324627钟乐.rp\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":67864,\"fileType\":\"application/octet-stream\",\"remark\":\"sfdad\",\"title\":\"dsad\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"管理\"},\"userId\":1}', '125.93.83.238', '2022-06-20 12:03:13');
INSERT INTO `log_operating` VALUES (133, 'admin', 'otherInsertDocument', '{\"createDate\":1655697930042,\"delete\":false,\"fileName\":\"1655697930042_app.rp\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":63242,\"fileType\":\"application/octet-stream\",\"remark\":\"33 app\",\"title\":\"33 app\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"管理\"},\"userId\":1}', '125.93.83.235', '2022-06-20 12:05:30');
INSERT INTO `log_operating` VALUES (134, 'admin', 'otherInsertDocument', '{\"createDate\":1655711413960,\"delete\":false,\"fileName\":\"1655711413960_201908324627钟乐.rp\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":98284,\"fileType\":\"application/octet-stream\",\"remark\":\"2222\",\"title\":\"2222\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"管理\"},\"userId\":1}', '125.93.83.238', '2022-06-20 15:50:14');
INSERT INTO `log_operating` VALUES (135, 'admin', 'otherInsertDocument', '{\"createDate\":1655711662492,\"delete\":false,\"fileName\":\"1655711662492_app.rp\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":96862,\"fileType\":\"application/octet-stream\",\"remark\":\"33 原型首页\",\"title\":\"33 原型首页\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"管理\"},\"userId\":1}', '125.93.83.235', '2022-06-20 15:54:23');
INSERT INTO `log_operating` VALUES (136, 'admin', 'powerDeleteDocument', '{\"createDate\":1655654400000,\"delete\":false,\"fileName\":\"1655711662492_app.rp\",\"fileSize\":96862,\"fileType\":\"application/octet-stream\",\"id\":93,\"remark\":\"33 原型首页\",\"title\":\"33 原型首页\",\"user\":{\"id\":1,\"loginname\":\"admin\"},\"userId\":1}', '125.93.83.235', '2022-06-20 15:55:05');
INSERT INTO `log_operating` VALUES (137, 'admin', 'otherInsertDocument', '{\"createDate\":1655711716914,\"delete\":false,\"fileName\":\"1655711716914_app.rp\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":96858,\"fileType\":\"application/octet-stream\",\"remark\":\"33 原型首页\",\"title\":\"33 原型首页\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"管理\"},\"userId\":1}', '125.93.83.235', '2022-06-20 15:55:17');
INSERT INTO `log_operating` VALUES (138, 'admin', 'otherInsertDocument', '{\"createDate\":1655783676538,\"delete\":false,\"fileName\":\"1655783676538_201908324627钟乐.rp\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":124510,\"fileType\":\"application/octet-stream\",\"remark\":\"dddd\",\"title\":\"day2-1\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"管理\"},\"userId\":1}', '125.93.83.238', '2022-06-21 11:54:37');
INSERT INTO `log_operating` VALUES (139, 'admin', 'otherInsertDocument', '{\"createDate\":1655784092190,\"delete\":false,\"fileName\":\"1655784092190_app.rp\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":165593,\"fileType\":\"application/octet-stream\",\"remark\":\"22-6-21 33 原型\",\"title\":\"22-6-21 33 原型\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"管理\"},\"userId\":1}', '125.93.83.235', '2022-06-21 12:01:32');
INSERT INTO `log_operating` VALUES (140, 'admin', 'otherInsertDocument', '{\"createDate\":1655970967880,\"delete\":false,\"fileName\":\"1655970967880_pinxixi.zip\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":4165335,\"fileType\":\"application/x-zip-compressed\",\"remark\":\"2022-6-23\\r\\n包含圆形图及标注图\",\"title\":\"web实训大作业\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"管理\"},\"userId\":1}', '125.93.83.235', '2022-06-23 15:56:08');
INSERT INTO `log_operating` VALUES (141, 'admin', 'otherInsertDocument', '{\"createDate\":1655995184023,\"delete\":false,\"fileName\":\"1655995184023_pinxixi.rp\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":638257,\"fileType\":\"application/octet-stream\",\"remark\":\"2022-6-23\",\"title\":\"pxixi效果图\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"管理\"},\"userId\":1}', '119.141.85.0', '2022-06-23 22:39:44');
INSERT INTO `log_operating` VALUES (142, 'admin', 'otherInsertDocument', '{\"createDate\":1655996231341,\"delete\":false,\"fileName\":\"1655996231341_pinxixi.zip\",\"filePath\":\"/home/xiaoyu/hrm/uploads/\",\"fileSize\":928286,\"fileType\":\"application/x-zip-compressed\",\"remark\":\"12312\",\"title\":\"1321\",\"user\":{\"createdate\":1583976868000,\"id\":1,\"loginname\":\"admin\",\"status\":2,\"username\":\"管理\"},\"userId\":1}', '119.141.85.200', '2022-06-23 22:57:11');
INSERT INTO `log_operating` VALUES (143, 'admin', 'powerDeleteEmployee', '{\"address\":\"广州\",\"birthday\":1640275200000,\"cardId\":\"432801197711251038\",\"createDate\":1468425600000,\"department\":{\"children\":[],\"id\":1,\"name\":\"总公办\"},\"education\":\"本科\",\"email\":\"36750064@qq.com\",\"hobby\":\"爬山\",\"id\":3,\"name\":\"bb\",\"party\":\"中共党员\",\"phone\":\"13907351532\",\"position\":{\"id\":2,\"name\":\"g\"},\"postCode\":\"510000\",\"qqNum\":\"36750064\",\"race\":\"汉族\",\"remark\":\"无\",\"sex\":0,\"speciality\":\"计算机\",\"tel\":\"020-99999999\"}', '0:0:0:0:0:0:0:1', '2022-08-20 17:58:20');
INSERT INTO `log_operating` VALUES (144, 'admin', 'powerDeleteDepartment', '{\"children\":[],\"depPath\":\".1.4.144\",\"enabled\":true,\"id\":144,\"name\":\"nnljjl\",\"parent\":false,\"parentId\":3,\"remark\":\"bkkh\"}', '0:0:0:0:0:0:0:1', '2022-08-20 18:03:37');
INSERT INTO `log_operating` VALUES (145, 'admin', 'powerDeleteDepartment', '{\"children\":[],\"depPath\":\".1.4.139\",\"enabled\":true,\"id\":139,\"name\":\"d d f\",\"parent\":false,\"parentId\":5,\"remark\":\"ddd\"}', '0:0:0:0:0:0:0:1', '2022-08-20 18:03:40');

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
INSERT INTO `menu` VALUES (10, '/department/add/**', '/dep/insert', 'DepAdd', '添加部门', NULL, NULL, 1, 3, 0, 1);
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
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_inf
-- ----------------------------
INSERT INTO `user_inf` VALUES (1, 'admin', 'z123456', 2, '2020-03-12 09:34:28', '管理');
INSERT INTO `user_inf` VALUES (20, 'xiaoyu', 'z123456', 3, '2020-03-19 17:23:30', '开发者测试账号');
INSERT INTO `user_inf` VALUES (45, 'xiaoyu2', 'z123456', 2, '2020-05-12 10:33:33', '小鱼2号..');
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
INSERT INTO `user_inf` VALUES (131, '1231321', 'a123456', 1, '2021-12-27 13:42:21', '123123');
INSERT INTO `user_inf` VALUES (132, '1231231', 'z123456', 1, '2021-12-27 16:43:03', '1231231');
INSERT INTO `user_inf` VALUES (133, '11111', '111111x', 1, '2022-05-31 13:20:32', '12345');

SET FOREIGN_KEY_CHECKS = 1;
