/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50506
Source Host           : localhost:3306
Source Database       : ttool

Target Server Type    : MYSQL
Target Server Version : 50506
File Encoding         : 65001

Date: 2022-04-06 10:18:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `classadministration`
-- ----------------------------
DROP TABLE IF EXISTS `classadministration`;
CREATE TABLE `classadministration` (
  `c_a_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `name` varchar(255) DEFAULT NULL COMMENT '班名',
  PRIMARY KEY (`c_a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=212862 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classadministration
-- ----------------------------
INSERT INTO `classadministration` VALUES ('201601', '2016级1班');
INSERT INTO `classadministration` VALUES ('201602', '2016级2班');
INSERT INTO `classadministration` VALUES ('201603', '2016级3班');
INSERT INTO `classadministration` VALUES ('201604', '2016级4班');
INSERT INTO `classadministration` VALUES ('212861', 'S21Z2861');

-- ----------------------------
-- Table structure for `classcourse`
-- ----------------------------
DROP TABLE IF EXISTS `classcourse`;
CREATE TABLE `classcourse` (
  `class_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '授课班级号',
  `class_name` varchar(255) DEFAULT NULL COMMENT '授课班级名字',
  `tid` varchar(255) DEFAULT NULL COMMENT '授课教师',
  `course_id` int(16) DEFAULT NULL COMMENT '课程',
  PRIMARY KEY (`class_id`),
  KEY `c_t_id` (`tid`),
  KEY `courseid` (`course_id`),
  CONSTRAINT `courseid` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `c_t_id` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2021006 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classcourse
-- ----------------------------
INSERT INTO `classcourse` VALUES ('2020001', '数据结构', 't201301', '2020001');
INSERT INTO `classcourse` VALUES ('2020002', '软件工程', 't201301', '2020002');
INSERT INTO `classcourse` VALUES ('2020003', '项目管理', 't201302', '2020003');
INSERT INTO `classcourse` VALUES ('2020005', '网络原理', 't201305', '2020005');
INSERT INTO `classcourse` VALUES ('2020006', '操作系统', 't201303', '2020006');
INSERT INTO `classcourse` VALUES ('2020007', '软件体系设计', 't201304', '2020007');
INSERT INTO `classcourse` VALUES ('2021001', '知识产权', 't202102', '2020001');
INSERT INTO `classcourse` VALUES ('2021002', '大型数据库开发技术', 't202103', '2021002');
INSERT INTO `classcourse` VALUES ('2021003', '工程伦理', 't202102', '2021003');
INSERT INTO `classcourse` VALUES ('2021004', '数据库设计', 't202103', '2021004');
INSERT INTO `classcourse` VALUES ('2021005', '测试课', 't202103', '2021005');

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '课程号',
  `cname` varchar(255) DEFAULT NULL COMMENT '课程名',
  `credit` double(16,0) NOT NULL COMMENT '学分',
  `period` int(16) DEFAULT NULL COMMENT '学时',
  `major` varchar(16) DEFAULT NULL COMMENT '是否主修',
  `nature` varchar(255) DEFAULT NULL COMMENT '课程性质',
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2021006 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('2020001', '数据结构', '4', '60', '是', '必修');
INSERT INTO `course` VALUES ('2020002', '软件工程', '3', '48', '是', '必修');
INSERT INTO `course` VALUES ('2020003', '项目管理', '3', '48', '是', '必修');
INSERT INTO `course` VALUES ('2020005', '网络原理', '3', '60', '是', '必修');
INSERT INTO `course` VALUES ('2020006', '操作系统', '4', '48', '是', '必修');
INSERT INTO `course` VALUES ('2020007', '软件体系设计', '2', '32', '否', '选修');
INSERT INTO `course` VALUES ('2021001', '知识产权', '1', '48', '是', '选修');
INSERT INTO `course` VALUES ('2021002', '大型数据库开发技术', '2', '48', '是', '选修');
INSERT INTO `course` VALUES ('2021003', '工程伦理', '1', '48', '是', '选修');
INSERT INTO `course` VALUES ('2021004', '数据库设计', '3', '48', '是', '必修');
INSERT INTO `course` VALUES ('2021005', '测试', '1', '48', '是', '必修');

-- ----------------------------
-- Table structure for `feedback`
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `txt` varchar(255) DEFAULT NULL COMMENT '反馈内容',
  `status` int(16) DEFAULT NULL COMMENT '是否审核',
  `feedtime` date DEFAULT NULL COMMENT '上传时间',
  `sid` varchar(255) DEFAULT NULL,
  `tid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fs_id` (`sid`),
  KEY `ft_id` (`tid`),
  CONSTRAINT `fs_id` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`),
  CONSTRAINT `ft_id` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=6018 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('6001', '1111', '1', '2020-02-03', '2016011357', 't201301');
INSERT INTO `feedback` VALUES ('6002', '你试试', '1', '2020-02-03', '2016011370', 't201301');
INSERT INTO `feedback` VALUES ('6003', '  请反馈您的问题', '1', '2020-02-14', '2016011370', 't201301');
INSERT INTO `feedback` VALUES ('6004', '  你从老师的讲授中收获了什么？你还有什么建议对老师说？', '1', '2020-02-22', '2016011370', 't201301');
INSERT INTO `feedback` VALUES ('6005', '  你从老师的讲授中收获了什么？\n  你还有什么建议对老师说？', '1', '2020-02-22', '2016011370', 't201301');
INSERT INTO `feedback` VALUES ('6006', '  你从老师的讲授中收获了什么？\n  你还有什么建议对老师说？', '0', '2020-02-22', '2016011370', 't201302');
INSERT INTO `feedback` VALUES ('6008', '111111', '1', '2020-02-22', '2016011370', 't201301');
INSERT INTO `feedback` VALUES ('6009', '这个我不会。', '0', '2020-05-03', '2016011370', 't201301');
INSERT INTO `feedback` VALUES ('6010', '  你从老师的讲授中收获了什么？\n  你还有什么建议对老师说？', '1', '2020-05-03', '2016011370', 't201301');
INSERT INTO `feedback` VALUES ('6011', '这是什么？', '1', '2020-05-09', '2016011370', 't201301');
INSERT INTO `feedback` VALUES ('6012', '  你从老师的讲授中收获了什么？\n  你还有什么建议对老师说？', '1', '2020-05-09', '2016011370', 't201301');
INSERT INTO `feedback` VALUES ('6013', '  你从老师的讲授中收获了什么？\n  你还有什么建议对老师说？', '1', '2020-05-09', '2016011370', 't201301');
INSERT INTO `feedback` VALUES ('6014', '  你从老师的讲授中收获了什么？\n  你还有什么建议对老师说？', '1', '2020-05-10', '2016011370', 't201301');
INSERT INTO `feedback` VALUES ('6015', '  你从老师的讲授中收获了什么？\n  你还有什么建议对老师说？', '0', '2021-07-08', '2016011370', 't201301');
INSERT INTO `feedback` VALUES ('6016', '  你从老师的讲授中收获了什么？\n  你还有什么建议对老师说？', '1', '2022-03-25', '202132803071', 't202103');
INSERT INTO `feedback` VALUES ('6017', '123', '0', '2022-03-25', '202132803071', 't202103');

-- ----------------------------
-- Table structure for `loadstudent`
-- ----------------------------
DROP TABLE IF EXISTS `loadstudent`;
CREATE TABLE `loadstudent` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '学生登录序列号',
  `login_time` date DEFAULT NULL COMMENT '登录时间',
  `sid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lss_id` (`sid`),
  CONSTRAINT `lss_id` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loadstudent
-- ----------------------------
INSERT INTO `loadstudent` VALUES ('1', '2020-01-29', '2016011370');
INSERT INTO `loadstudent` VALUES ('4', '2020-01-29', '2016011370');
INSERT INTO `loadstudent` VALUES ('5', '2020-01-29', '2016011370');
INSERT INTO `loadstudent` VALUES ('7', '2020-01-29', '2016011370');
INSERT INTO `loadstudent` VALUES ('8', '2020-01-29', '2016011370');
INSERT INTO `loadstudent` VALUES ('9', '2020-01-29', '2016011370');
INSERT INTO `loadstudent` VALUES ('11', '2020-01-29', '2016011370');
INSERT INTO `loadstudent` VALUES ('12', '2020-01-29', '2016011370');
INSERT INTO `loadstudent` VALUES ('13', '2020-01-29', '2016011370');
INSERT INTO `loadstudent` VALUES ('14', '2020-01-29', '2016011370');
INSERT INTO `loadstudent` VALUES ('15', '2020-01-29', '2016011370');
INSERT INTO `loadstudent` VALUES ('16', '2020-01-29', '2016011370');
INSERT INTO `loadstudent` VALUES ('17', '2020-01-29', '2016011370');
INSERT INTO `loadstudent` VALUES ('18', '2020-01-29', '2016011370');
INSERT INTO `loadstudent` VALUES ('19', '2020-01-30', '2016011370');
INSERT INTO `loadstudent` VALUES ('20', '2020-01-30', '2016011370');
INSERT INTO `loadstudent` VALUES ('21', '2020-01-30', '2016011370');
INSERT INTO `loadstudent` VALUES ('22', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('23', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('24', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('25', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('26', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('27', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('28', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('29', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('30', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('31', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('32', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('33', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('34', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('35', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('36', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('37', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('38', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('39', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('40', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('41', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('42', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('45', '2020-01-31', '2016011370');
INSERT INTO `loadstudent` VALUES ('46', '2020-02-01', '2016011370');
INSERT INTO `loadstudent` VALUES ('62', '2020-02-02', '2016011370');
INSERT INTO `loadstudent` VALUES ('63', '2020-02-02', '2016011370');
INSERT INTO `loadstudent` VALUES ('64', '2020-02-02', '2016011370');
INSERT INTO `loadstudent` VALUES ('65', '2020-02-02', '2016011370');
INSERT INTO `loadstudent` VALUES ('66', '2020-02-02', '2016011370');
INSERT INTO `loadstudent` VALUES ('67', '2020-02-02', '2016011370');
INSERT INTO `loadstudent` VALUES ('68', '2020-02-02', '2016011370');
INSERT INTO `loadstudent` VALUES ('69', '2020-02-02', '2016011370');
INSERT INTO `loadstudent` VALUES ('70', '2020-02-02', '2016011370');
INSERT INTO `loadstudent` VALUES ('71', '2020-02-02', '2016011370');
INSERT INTO `loadstudent` VALUES ('72', '2020-02-02', '2016011370');
INSERT INTO `loadstudent` VALUES ('73', '2020-02-02', '2016011370');
INSERT INTO `loadstudent` VALUES ('74', '2020-02-02', '2016011370');
INSERT INTO `loadstudent` VALUES ('75', '2020-02-02', '2016011370');
INSERT INTO `loadstudent` VALUES ('76', '2020-02-02', '2016011370');
INSERT INTO `loadstudent` VALUES ('77', '2020-02-02', '2016011370');
INSERT INTO `loadstudent` VALUES ('78', '2020-02-02', '2016011370');
INSERT INTO `loadstudent` VALUES ('79', '2020-02-02', '2016011370');
INSERT INTO `loadstudent` VALUES ('80', '2020-02-02', '2016011370');
INSERT INTO `loadstudent` VALUES ('81', '2020-02-02', '2016011370');
INSERT INTO `loadstudent` VALUES ('82', '2020-02-02', '2016011370');
INSERT INTO `loadstudent` VALUES ('83', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('84', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('85', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('86', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('87', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('88', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('89', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('90', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('91', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('92', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('93', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('94', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('95', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('96', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('97', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('98', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('99', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('100', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('101', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('102', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('103', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('104', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('105', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('106', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('107', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('108', '2020-02-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('109', '2020-02-04', '2016011370');
INSERT INTO `loadstudent` VALUES ('110', '2020-02-04', '2016011370');
INSERT INTO `loadstudent` VALUES ('111', '2020-02-04', '2016011370');
INSERT INTO `loadstudent` VALUES ('112', '2020-02-04', '2016011357');
INSERT INTO `loadstudent` VALUES ('113', '2020-02-04', '2016011370');
INSERT INTO `loadstudent` VALUES ('114', '2020-02-04', '2016011370');
INSERT INTO `loadstudent` VALUES ('115', '2020-02-04', '2016011370');
INSERT INTO `loadstudent` VALUES ('116', '2020-02-04', '2016011370');
INSERT INTO `loadstudent` VALUES ('117', '2020-02-04', '2016011370');
INSERT INTO `loadstudent` VALUES ('118', '2020-02-04', '2016011370');
INSERT INTO `loadstudent` VALUES ('119', '2020-02-04', '2016011370');
INSERT INTO `loadstudent` VALUES ('120', '2020-02-04', '2016011370');
INSERT INTO `loadstudent` VALUES ('121', '2020-02-05', '2016011370');
INSERT INTO `loadstudent` VALUES ('122', '2020-02-05', '2016011370');
INSERT INTO `loadstudent` VALUES ('123', '2020-02-05', '2016011370');
INSERT INTO `loadstudent` VALUES ('124', '2020-02-05', '2016011370');
INSERT INTO `loadstudent` VALUES ('125', '2020-02-05', '2016011370');
INSERT INTO `loadstudent` VALUES ('126', '2020-02-05', '2016011357');
INSERT INTO `loadstudent` VALUES ('127', '2020-02-05', '2016011357');
INSERT INTO `loadstudent` VALUES ('128', '2020-02-05', '2016011357');
INSERT INTO `loadstudent` VALUES ('129', '2020-02-05', '2016011370');
INSERT INTO `loadstudent` VALUES ('130', '2020-02-05', '2016011370');
INSERT INTO `loadstudent` VALUES ('131', '2020-02-07', '2016011370');
INSERT INTO `loadstudent` VALUES ('132', '2020-02-07', '2016011370');
INSERT INTO `loadstudent` VALUES ('133', '2020-02-11', '2016011370');
INSERT INTO `loadstudent` VALUES ('134', '2020-02-11', '2016011370');
INSERT INTO `loadstudent` VALUES ('135', '2020-02-13', '2016011370');
INSERT INTO `loadstudent` VALUES ('136', '2020-02-13', '2016011370');
INSERT INTO `loadstudent` VALUES ('137', '2020-02-13', '2016011370');
INSERT INTO `loadstudent` VALUES ('138', '2020-02-13', '2016011370');
INSERT INTO `loadstudent` VALUES ('139', '2020-02-13', '2016011370');
INSERT INTO `loadstudent` VALUES ('140', '2020-02-13', '2016011370');
INSERT INTO `loadstudent` VALUES ('141', '2020-02-13', '2016011370');
INSERT INTO `loadstudent` VALUES ('142', '2020-02-13', '2016011370');
INSERT INTO `loadstudent` VALUES ('143', '2020-02-13', '2016011370');
INSERT INTO `loadstudent` VALUES ('144', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('145', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('146', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('147', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('148', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('149', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('150', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('151', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('152', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('153', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('154', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('155', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('156', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('157', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('158', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('159', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('160', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('161', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('162', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('163', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('164', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('165', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('166', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('167', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('168', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('169', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('170', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('171', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('172', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('173', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('174', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('175', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('176', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('177', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('178', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('179', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('180', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('181', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('182', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('183', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('184', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('185', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('186', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('187', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('188', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('189', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('190', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('191', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('192', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('193', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('194', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('195', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('196', '2020-02-14', '2016011370');
INSERT INTO `loadstudent` VALUES ('197', '2020-02-15', '2016011370');
INSERT INTO `loadstudent` VALUES ('198', '2020-02-15', '2016011370');
INSERT INTO `loadstudent` VALUES ('199', '2020-02-15', '2016011370');
INSERT INTO `loadstudent` VALUES ('200', '2020-02-15', '2016011370');
INSERT INTO `loadstudent` VALUES ('201', '2020-02-15', '2016011370');
INSERT INTO `loadstudent` VALUES ('202', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('203', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('204', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('205', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('206', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('207', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('208', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('209', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('210', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('211', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('212', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('213', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('214', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('215', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('216', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('217', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('218', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('219', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('220', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('221', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('222', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('223', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('224', '2020-02-22', '2016011370');
INSERT INTO `loadstudent` VALUES ('225', '2020-02-25', '2016011370');
INSERT INTO `loadstudent` VALUES ('226', '2020-02-25', '2016011370');
INSERT INTO `loadstudent` VALUES ('227', '2020-02-25', '2016011370');
INSERT INTO `loadstudent` VALUES ('228', '2020-02-26', '2016011370');
INSERT INTO `loadstudent` VALUES ('229', '2020-05-03', '2016011370');
INSERT INTO `loadstudent` VALUES ('230', '2020-05-04', '2016011370');
INSERT INTO `loadstudent` VALUES ('231', '2020-05-04', '2016011370');
INSERT INTO `loadstudent` VALUES ('232', '2020-05-04', '2016011370');
INSERT INTO `loadstudent` VALUES ('233', '2020-05-04', '2016011357');
INSERT INTO `loadstudent` VALUES ('234', '2020-05-09', '2016011370');
INSERT INTO `loadstudent` VALUES ('235', '2020-05-09', '2016011370');
INSERT INTO `loadstudent` VALUES ('236', '2020-05-09', '2016011370');
INSERT INTO `loadstudent` VALUES ('237', '2020-05-09', '2016011370');
INSERT INTO `loadstudent` VALUES ('238', '2020-05-09', '2016011370');
INSERT INTO `loadstudent` VALUES ('239', '2020-05-09', '2016011370');
INSERT INTO `loadstudent` VALUES ('240', '2020-05-09', '2016011370');
INSERT INTO `loadstudent` VALUES ('241', '2020-05-09', '2016011370');
INSERT INTO `loadstudent` VALUES ('242', '2020-05-09', '2016011370');
INSERT INTO `loadstudent` VALUES ('243', '2020-05-09', '2016011370');
INSERT INTO `loadstudent` VALUES ('244', '2020-05-09', '2016011370');
INSERT INTO `loadstudent` VALUES ('245', '2020-05-09', '2016011370');
INSERT INTO `loadstudent` VALUES ('246', '2020-05-09', '2016011370');
INSERT INTO `loadstudent` VALUES ('247', '2020-05-10', '2016011370');
INSERT INTO `loadstudent` VALUES ('248', '2020-05-10', '2016011370');
INSERT INTO `loadstudent` VALUES ('249', '2020-05-10', '2016011370');
INSERT INTO `loadstudent` VALUES ('250', '2020-05-10', '2016011370');
INSERT INTO `loadstudent` VALUES ('251', '2020-05-10', '2016011370');
INSERT INTO `loadstudent` VALUES ('252', '2020-05-10', '2016011370');
INSERT INTO `loadstudent` VALUES ('253', '2020-05-10', '2016011370');
INSERT INTO `loadstudent` VALUES ('254', '2020-05-10', '2016011370');
INSERT INTO `loadstudent` VALUES ('255', '2020-06-06', '2016011370');
INSERT INTO `loadstudent` VALUES ('256', '2021-07-08', '2016011370');
INSERT INTO `loadstudent` VALUES ('257', '2021-07-08', '2016011370');
INSERT INTO `loadstudent` VALUES ('258', '2021-07-08', '2016011370');
INSERT INTO `loadstudent` VALUES ('259', '2021-07-08', '2016011370');
INSERT INTO `loadstudent` VALUES ('260', '2021-07-08', '2016011370');
INSERT INTO `loadstudent` VALUES ('261', '2021-07-08', '2016011370');
INSERT INTO `loadstudent` VALUES ('262', '2022-03-20', '2016011370');
INSERT INTO `loadstudent` VALUES ('263', '2022-03-20', '2016011370');
INSERT INTO `loadstudent` VALUES ('264', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('265', '2022-03-25', '202132803099');
INSERT INTO `loadstudent` VALUES ('266', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('267', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('268', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('269', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('270', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('271', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('272', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('273', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('274', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('275', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('276', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('277', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('278', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('279', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('280', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('281', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('282', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('283', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('284', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('285', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('286', '2022-03-25', '202132803071');
INSERT INTO `loadstudent` VALUES ('287', '2022-03-27', '202132803071');
INSERT INTO `loadstudent` VALUES ('288', '2022-03-27', '202132803071');

-- ----------------------------
-- Table structure for `loadteacher`
-- ----------------------------
DROP TABLE IF EXISTS `loadteacher`;
CREATE TABLE `loadteacher` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '教师登录流水号',
  `login_time` date DEFAULT NULL COMMENT '登录时间',
  `tid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacherid` (`tid`),
  CONSTRAINT `teacherid` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5356 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loadteacher
-- ----------------------------
INSERT INTO `loadteacher` VALUES ('5008', '2020-02-03', 't201301');
INSERT INTO `loadteacher` VALUES ('5009', '2020-02-03', 't201301');
INSERT INTO `loadteacher` VALUES ('5010', '2020-02-03', 't201301');
INSERT INTO `loadteacher` VALUES ('5011', '2020-02-03', 't201301');
INSERT INTO `loadteacher` VALUES ('5012', '2020-02-03', 't201301');
INSERT INTO `loadteacher` VALUES ('5013', '2020-02-03', 't201301');
INSERT INTO `loadteacher` VALUES ('5014', '2020-02-03', 't201301');
INSERT INTO `loadteacher` VALUES ('5015', '2020-02-03', 't201301');
INSERT INTO `loadteacher` VALUES ('5016', '2020-02-03', 't201301');
INSERT INTO `loadteacher` VALUES ('5017', '2020-02-03', 't201301');
INSERT INTO `loadteacher` VALUES ('5018', '2020-02-03', 't201301');
INSERT INTO `loadteacher` VALUES ('5019', '2020-02-03', 't201301');
INSERT INTO `loadteacher` VALUES ('5020', '2020-02-04', 't201301');
INSERT INTO `loadteacher` VALUES ('5021', '2020-02-04', 't201301');
INSERT INTO `loadteacher` VALUES ('5022', '2020-02-04', 't201301');
INSERT INTO `loadteacher` VALUES ('5023', '2020-02-04', 't201301');
INSERT INTO `loadteacher` VALUES ('5024', '2020-02-04', 't201301');
INSERT INTO `loadteacher` VALUES ('5025', '2020-02-04', 't201301');
INSERT INTO `loadteacher` VALUES ('5026', '2020-02-04', 't201301');
INSERT INTO `loadteacher` VALUES ('5027', '2020-02-04', 't201301');
INSERT INTO `loadteacher` VALUES ('5028', '2020-02-04', 't201301');
INSERT INTO `loadteacher` VALUES ('5029', '2020-02-04', 't201301');
INSERT INTO `loadteacher` VALUES ('5030', '2020-02-04', 't201301');
INSERT INTO `loadteacher` VALUES ('5031', '2020-02-04', 't201301');
INSERT INTO `loadteacher` VALUES ('5032', '2020-02-04', 't201301');
INSERT INTO `loadteacher` VALUES ('5033', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5034', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5035', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5036', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5037', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5038', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5039', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5040', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5041', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5042', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5043', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5044', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5045', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5046', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5047', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5048', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5049', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5050', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5051', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5052', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5053', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5054', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5055', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5056', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5057', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5058', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5059', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5060', '2020-02-04', 't201302');
INSERT INTO `loadteacher` VALUES ('5061', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5062', '2020-02-05', 't201302');
INSERT INTO `loadteacher` VALUES ('5063', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5064', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5065', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5066', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5067', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5068', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5069', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5070', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5071', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5072', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5073', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5074', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5075', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5076', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5077', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5078', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5079', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5080', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5081', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5082', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5083', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5084', '2020-02-05', 't201301');
INSERT INTO `loadteacher` VALUES ('5085', '2020-02-07', 't201301');
INSERT INTO `loadteacher` VALUES ('5086', '2020-02-07', 't201302');
INSERT INTO `loadteacher` VALUES ('5087', '2020-02-07', 't201302');
INSERT INTO `loadteacher` VALUES ('5088', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5089', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5090', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5091', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5092', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5093', '2020-02-13', 't201302');
INSERT INTO `loadteacher` VALUES ('5094', '2020-02-13', 't201302');
INSERT INTO `loadteacher` VALUES ('5095', '2020-02-13', 't201302');
INSERT INTO `loadteacher` VALUES ('5096', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5097', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5098', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5099', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5100', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5101', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5102', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5103', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5104', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5105', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5106', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5107', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5108', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5109', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5110', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5111', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5112', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5113', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5114', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5115', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5116', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5117', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5118', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5119', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5120', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5121', '2020-02-13', 't201301');
INSERT INTO `loadteacher` VALUES ('5122', '2020-02-14', 't201301');
INSERT INTO `loadteacher` VALUES ('5123', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5124', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5125', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5126', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5127', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5128', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5129', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5130', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5131', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5132', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5133', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5134', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5135', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5136', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5137', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5138', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5139', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5140', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5141', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5142', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5143', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5144', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5145', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5146', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5147', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5148', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5149', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5150', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5151', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5152', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5153', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5154', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5155', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5156', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5157', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5158', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5159', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5160', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5161', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5162', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5163', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5164', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5165', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5166', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5167', '2020-02-15', 't201301');
INSERT INTO `loadteacher` VALUES ('5168', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5169', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5170', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5171', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5172', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5173', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5174', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5175', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5176', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5177', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5178', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5179', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5180', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5181', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5182', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5183', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5184', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5185', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5186', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5187', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5188', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5189', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5190', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5191', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5192', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5193', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5194', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5195', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5196', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5197', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5198', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5199', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5200', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5201', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5202', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5203', '2020-02-22', 't201301');
INSERT INTO `loadteacher` VALUES ('5204', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5205', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5206', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5207', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5208', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5209', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5210', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5211', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5212', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5213', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5214', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5215', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5216', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5217', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5218', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5219', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5220', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5221', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5222', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5223', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5224', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5225', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5226', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5227', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5228', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5229', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5230', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5231', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5232', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5233', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5234', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5235', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5236', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5237', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5238', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5239', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5240', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5241', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5242', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5243', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5244', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5245', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5246', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5247', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5248', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5249', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5250', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5251', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5252', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5253', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5254', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5255', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5256', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5257', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5258', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5259', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5260', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5261', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5262', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5263', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5264', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5265', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5266', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5267', '2020-02-23', 't201301');
INSERT INTO `loadteacher` VALUES ('5268', '2020-02-24', 't201301');
INSERT INTO `loadteacher` VALUES ('5269', '2020-02-25', 't201301');
INSERT INTO `loadteacher` VALUES ('5270', '2020-02-25', 't201301');
INSERT INTO `loadteacher` VALUES ('5271', '2020-02-25', 't201301');
INSERT INTO `loadteacher` VALUES ('5272', '2020-02-25', 't201301');
INSERT INTO `loadteacher` VALUES ('5273', '2020-02-25', 't201301');
INSERT INTO `loadteacher` VALUES ('5274', '2020-02-26', 't201301');
INSERT INTO `loadteacher` VALUES ('5275', '2020-05-03', 't201301');
INSERT INTO `loadteacher` VALUES ('5276', '2020-05-03', 't201301');
INSERT INTO `loadteacher` VALUES ('5277', '2020-05-03', 't201301');
INSERT INTO `loadteacher` VALUES ('5278', '2020-05-03', 't201301');
INSERT INTO `loadteacher` VALUES ('5279', '2020-05-04', 't201301');
INSERT INTO `loadteacher` VALUES ('5280', '2020-05-04', 't201301');
INSERT INTO `loadteacher` VALUES ('5281', '2020-05-09', 't201301');
INSERT INTO `loadteacher` VALUES ('5282', '2020-05-09', 't201301');
INSERT INTO `loadteacher` VALUES ('5283', '2020-05-09', 't201301');
INSERT INTO `loadteacher` VALUES ('5284', '2020-05-09', 't201301');
INSERT INTO `loadteacher` VALUES ('5285', '2020-05-10', 't201301');
INSERT INTO `loadteacher` VALUES ('5286', '2020-05-10', 't201301');
INSERT INTO `loadteacher` VALUES ('5287', '2020-05-10', 't201301');
INSERT INTO `loadteacher` VALUES ('5288', '2020-05-10', 't201301');
INSERT INTO `loadteacher` VALUES ('5289', '2020-05-10', 't201301');
INSERT INTO `loadteacher` VALUES ('5290', '2020-05-10', 't201301');
INSERT INTO `loadteacher` VALUES ('5291', '2020-05-10', 't201301');
INSERT INTO `loadteacher` VALUES ('5292', '2021-07-08', 't201301');
INSERT INTO `loadteacher` VALUES ('5293', '2022-03-25', 't201301');
INSERT INTO `loadteacher` VALUES ('5294', '2022-03-25', 't201301');
INSERT INTO `loadteacher` VALUES ('5295', '2022-03-25', 't201301');
INSERT INTO `loadteacher` VALUES ('5296', '2022-03-25', 't201301');
INSERT INTO `loadteacher` VALUES ('5297', '2022-03-25', 't202103');
INSERT INTO `loadteacher` VALUES ('5298', '2022-03-25', 't202103');
INSERT INTO `loadteacher` VALUES ('5299', '2022-03-25', 't202103');
INSERT INTO `loadteacher` VALUES ('5300', '2022-03-25', 't202103');
INSERT INTO `loadteacher` VALUES ('5301', '2022-03-25', 't202103');
INSERT INTO `loadteacher` VALUES ('5302', '2022-03-25', 't202103');
INSERT INTO `loadteacher` VALUES ('5303', '2022-03-25', 't202103');
INSERT INTO `loadteacher` VALUES ('5304', '2022-03-25', 't202103');
INSERT INTO `loadteacher` VALUES ('5305', '2022-03-25', 't202103');
INSERT INTO `loadteacher` VALUES ('5306', '2022-03-25', 't202103');
INSERT INTO `loadteacher` VALUES ('5307', '2022-03-25', 't202103');
INSERT INTO `loadteacher` VALUES ('5308', '2022-03-25', 't202103');
INSERT INTO `loadteacher` VALUES ('5309', '2022-03-27', 't202103');
INSERT INTO `loadteacher` VALUES ('5310', '2022-04-03', 't202101');
INSERT INTO `loadteacher` VALUES ('5311', '2022-04-03', 't202101');
INSERT INTO `loadteacher` VALUES ('5312', '2022-04-03', 't202101');
INSERT INTO `loadteacher` VALUES ('5313', '2022-04-03', 't202101');
INSERT INTO `loadteacher` VALUES ('5314', '2022-04-03', 't202102');
INSERT INTO `loadteacher` VALUES ('5315', '2022-04-03', 't202103');
INSERT INTO `loadteacher` VALUES ('5316', '2022-04-03', 't202103');
INSERT INTO `loadteacher` VALUES ('5317', '2022-04-03', 't202103');
INSERT INTO `loadteacher` VALUES ('5318', '2022-04-03', 't202103');
INSERT INTO `loadteacher` VALUES ('5319', '2022-04-03', 't202103');
INSERT INTO `loadteacher` VALUES ('5320', '2022-04-03', 't202103');
INSERT INTO `loadteacher` VALUES ('5321', '2022-04-03', 't202103');
INSERT INTO `loadteacher` VALUES ('5322', '2022-04-03', 't202103');
INSERT INTO `loadteacher` VALUES ('5323', '2022-04-03', 't202103');
INSERT INTO `loadteacher` VALUES ('5324', '2022-04-03', 't202103');
INSERT INTO `loadteacher` VALUES ('5325', '2022-04-03', 't202103');
INSERT INTO `loadteacher` VALUES ('5326', '2022-04-03', 't202103');
INSERT INTO `loadteacher` VALUES ('5327', '2022-04-03', 't202103');
INSERT INTO `loadteacher` VALUES ('5328', '2022-04-03', 't202103');
INSERT INTO `loadteacher` VALUES ('5329', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5330', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5331', '2022-04-05', 't202102');
INSERT INTO `loadteacher` VALUES ('5332', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5333', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5334', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5335', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5336', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5337', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5338', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5339', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5340', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5341', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5342', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5343', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5344', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5345', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5346', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5347', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5348', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5349', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5350', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5351', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5352', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5353', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5354', '2022-04-05', 't202103');
INSERT INTO `loadteacher` VALUES ('5355', '2022-04-05', 't202103');

-- ----------------------------
-- Table structure for `nodenumber`
-- ----------------------------
DROP TABLE IF EXISTS `nodenumber`;
CREATE TABLE `nodenumber` (
  `node_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `node` varchar(255) DEFAULT NULL COMMENT '节数',
  `start_time` time DEFAULT NULL COMMENT '节数开始时间',
  `end_time` time DEFAULT NULL COMMENT '节数结束时间',
  `sign_range` int(16) DEFAULT NULL COMMENT '签到时间差值',
  PRIMARY KEY (`node_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20006 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nodenumber
-- ----------------------------
INSERT INTO `nodenumber` VALUES ('20001', '1', '08:30:00', '10:05:00', '5');
INSERT INTO `nodenumber` VALUES ('20002', '2', '10:25:00', '12:00:00', '5');
INSERT INTO `nodenumber` VALUES ('20003', '3', '14:00:00', '15:35:00', '5');
INSERT INTO `nodenumber` VALUES ('20004', '4', '15:55:00', '17:30:00', '5');
INSERT INTO `nodenumber` VALUES ('20005', '5', '18:40:00', '21:05:00', '5');

-- ----------------------------
-- Table structure for `record`
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '签到表流水号',
  `sid` varchar(255) DEFAULT NULL COMMENT '学生学号',
  `state` int(16) DEFAULT NULL COMMENT '签到状态',
  `date` date DEFAULT NULL COMMENT '签到时间',
  `class_id` int(16) DEFAULT NULL COMMENT '上课班级',
  `image` varchar(255) DEFAULT NULL COMMENT '签到图片路径',
  PRIMARY KEY (`id`),
  KEY `rs_id` (`sid`),
  KEY `rc_id` (`class_id`),
  CONSTRAINT `rc_id` FOREIGN KEY (`class_id`) REFERENCES `classcourse` (`class_id`),
  CONSTRAINT `rs_id` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('9', '2016011370', '1', '2020-04-29', '2020001', 'faceimg\\2020-02-01-2016011370.jpg');
INSERT INTO `record` VALUES ('10', '2016011370', '1', '2020-05-28', '2020003', 'faceimg\\2020-02-04-2016011370.jpg');
INSERT INTO `record` VALUES ('11', '2016011357', '1', '2020-05-27', '2020003', 'faceimg\\2020-02-04-2016011357.jpg');
INSERT INTO `record` VALUES ('12', '2016011370', '1', '2020-02-21', '2020001', 'faceimg\\2020-02-14-2016011370.jpg');
INSERT INTO `record` VALUES ('13', '2016011370', '1', '2020-02-25', '2020001', 'faceimg\\2020-02-25-2016011370.jpg');
INSERT INTO `record` VALUES ('19', '2016011370', '1', '2020-05-04', '2020001', 'faceimg\\2020-05-04-2016011370.jpg');
INSERT INTO `record` VALUES ('20', '2016011370', '1', '2020-05-09', '2020001', 'faceimg\\2020-05-09-2016011370.jpg');
INSERT INTO `record` VALUES ('23', '2016011370', '1', '2020-05-10', '2020001', 'faceimg\\2020-05-10-2016011370.jpg');
INSERT INTO `record` VALUES ('24', '202132803071', '1', '2022-03-25', '2021005', 'faceimg\\2022-03-25-202132803071.jpg');
INSERT INTO `record` VALUES ('25', '202132803071', '1', '2022-03-25', '2021005', 'faceimg\\2022-03-25-202132803071.jpg');
INSERT INTO `record` VALUES ('26', '202132803071', '1', '2022-03-25', '2021005', 'faceimg\\2022-03-25-202132803071.jpg');

-- ----------------------------
-- Table structure for `score`
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `sid` varchar(255) DEFAULT NULL,
  `course_id` int(16) DEFAULT NULL,
  `score` double(16,2) unsigned DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `ssc_id` (`sid`),
  KEY `cosc_id` (`course_id`),
  CONSTRAINT `cosc_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ssc_id` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=202100035 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('201600001', '2016011370', '2020001', '80.00');
INSERT INTO `score` VALUES ('201600002', '2016011370', '2020002', '50.00');
INSERT INTO `score` VALUES ('201600003', '2016011357', '2020001', '79.00');
INSERT INTO `score` VALUES ('201600004', '2016011359', '2020002', '80.00');
INSERT INTO `score` VALUES ('201600005', '2016011364', '2020002', '50.00');
INSERT INTO `score` VALUES ('201600006', '2016011370', '2020003', '96.00');
INSERT INTO `score` VALUES ('201600008', '2016011370', '2020005', '79.00');
INSERT INTO `score` VALUES ('201600009', '2016011370', '2020006', '85.00');
INSERT INTO `score` VALUES ('201600010', '2016011370', '2020007', '80.00');
INSERT INTO `score` VALUES ('201600011', '2016011359', '2020001', '78.00');
INSERT INTO `score` VALUES ('201600012', '2016011364', '2020001', '86.00');
INSERT INTO `score` VALUES ('201600013', '2016011398', '2020001', '80.00');
INSERT INTO `score` VALUES ('201600014', '2016011369', '2020001', '60.00');
INSERT INTO `score` VALUES ('202100015', '202132803071', '2021002', '90.00');
INSERT INTO `score` VALUES ('202100016', '202132803099', '2021002', '90.00');
INSERT INTO `score` VALUES ('202100017', '202132803104', '2021002', '90.00');
INSERT INTO `score` VALUES ('202100018', '202132803106', '2021002', '90.00');
INSERT INTO `score` VALUES ('202100019', '202132803071', '2021001', '90.00');
INSERT INTO `score` VALUES ('202100020', '202132803099', '2021001', '90.00');
INSERT INTO `score` VALUES ('202100021', '202132803104', '2021001', '90.00');
INSERT INTO `score` VALUES ('202100022', '202132803106', '2021001', '90.00');
INSERT INTO `score` VALUES ('202100023', '202132803071', '2021003', '90.00');
INSERT INTO `score` VALUES ('202100024', '202132803106', '2021003', '90.00');
INSERT INTO `score` VALUES ('202100025', '202132803099', '2021003', '90.00');
INSERT INTO `score` VALUES ('202100026', '202132803104', '2021003', '90.00');
INSERT INTO `score` VALUES ('202100027', '202132803071', '2021004', '0.00');
INSERT INTO `score` VALUES ('202100028', '202132803099', '2021004', '0.00');
INSERT INTO `score` VALUES ('202100029', '202132803104', '2021004', '0.00');
INSERT INTO `score` VALUES ('202100030', '202132803106', '2021004', '0.00');
INSERT INTO `score` VALUES ('202100031', '202132803071', '2021005', '0.00');
INSERT INTO `score` VALUES ('202100032', '202132803099', '2021005', '0.00');
INSERT INTO `score` VALUES ('202100033', '202132803104', '2021005', '0.00');
INSERT INTO `score` VALUES ('202100034', '202132803106', '2021005', '0.00');

-- ----------------------------
-- Table structure for `shareresource`
-- ----------------------------
DROP TABLE IF EXISTS `shareresource`;
CREATE TABLE `shareresource` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `oldfile` varchar(255) DEFAULT NULL,
  `newfile` varchar(255) DEFAULT NULL,
  `uploadtime` date DEFAULT NULL,
  `tid` varchar(255) DEFAULT NULL COMMENT '教工号',
  PRIMARY KEY (`id`),
  KEY `srt_id` (`tid`),
  CONSTRAINT `srt_id` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shareresource
-- ----------------------------
INSERT INTO `shareresource` VALUES ('5', '项目管理.txt', 't2013011589032177146.txt', '2022-03-10', 't202102');
INSERT INTO `shareresource` VALUES ('6', 'test.txt', 't2013011589032739700.txt', '2022-03-11', 't202103');
INSERT INTO `shareresource` VALUES ('7', '草表.pdf', 't2013011625729521908.pdf', '2022-03-11', 't202103');
INSERT INTO `shareresource` VALUES ('8', '流程图.jpg', 't2021031648211258452.jpg', '2022-03-25', 't202103');

-- ----------------------------
-- Table structure for `studentclass`
-- ----------------------------
DROP TABLE IF EXISTS `studentclass`;
CREATE TABLE `studentclass` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `class_id` int(16) DEFAULT NULL COMMENT '上课班级',
  `sid` varchar(255) DEFAULT NULL COMMENT '学生学号',
  PRIMARY KEY (`id`),
  KEY `csc_id` (`class_id`),
  KEY `scs_id` (`sid`),
  CONSTRAINT `csc_id` FOREIGN KEY (`class_id`) REFERENCES `classcourse` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `scs_id` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=40039 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentclass
-- ----------------------------
INSERT INTO `studentclass` VALUES ('40001', '2020001', '2016011370');
INSERT INTO `studentclass` VALUES ('40002', '2020002', '2016011370');
INSERT INTO `studentclass` VALUES ('40003', '2020003', '2016011370');
INSERT INTO `studentclass` VALUES ('40004', '2020003', '2016011357');
INSERT INTO `studentclass` VALUES ('40005', '2020002', '2016011357');
INSERT INTO `studentclass` VALUES ('40006', '2020001', '2016011357');
INSERT INTO `studentclass` VALUES ('40007', '2020001', '2016011364');
INSERT INTO `studentclass` VALUES ('40008', '2020001', '2016011369');
INSERT INTO `studentclass` VALUES ('40009', '2020001', '2016011350');
INSERT INTO `studentclass` VALUES ('40010', '2020001', '2016011398');
INSERT INTO `studentclass` VALUES ('40012', '2020001', '2016011359');
INSERT INTO `studentclass` VALUES ('40013', '2020002', '2016011359');
INSERT INTO `studentclass` VALUES ('40014', '2020002', '2016011364');
INSERT INTO `studentclass` VALUES ('40015', '2021004', '2016011370');
INSERT INTO `studentclass` VALUES ('40016', '2020005', '2016011370');
INSERT INTO `studentclass` VALUES ('40017', '2020006', '2016011370');
INSERT INTO `studentclass` VALUES ('40018', '2020007', '2016011370');
INSERT INTO `studentclass` VALUES ('40019', '2020002', '2016011350');
INSERT INTO `studentclass` VALUES ('40020', '2020002', '2016011357');
INSERT INTO `studentclass` VALUES ('40021', '2020003', '2016011359');
INSERT INTO `studentclass` VALUES ('40022', '2021003', '202132803106');
INSERT INTO `studentclass` VALUES ('40023', '2021003', '202132803099');
INSERT INTO `studentclass` VALUES ('40024', '2021003', '202132803071');
INSERT INTO `studentclass` VALUES ('40025', '2021003', '202132803104');
INSERT INTO `studentclass` VALUES ('40026', '2021001', '202132803071');
INSERT INTO `studentclass` VALUES ('40027', '2021002', '202132803071');
INSERT INTO `studentclass` VALUES ('40028', '2021004', '202132803071');
INSERT INTO `studentclass` VALUES ('40029', '2021001', '202132803099');
INSERT INTO `studentclass` VALUES ('40030', '2021002', '202132803099');
INSERT INTO `studentclass` VALUES ('40031', '2021004', '202132803099');
INSERT INTO `studentclass` VALUES ('40032', '2021001', '202132803104');
INSERT INTO `studentclass` VALUES ('40033', '2021002', '202132803104');
INSERT INTO `studentclass` VALUES ('40034', '2021004', '202132803104');
INSERT INTO `studentclass` VALUES ('40035', '2020001', '202132803106');
INSERT INTO `studentclass` VALUES ('40036', '2021002', '202132803106');
INSERT INTO `studentclass` VALUES ('40037', '2021004', '202132803106');
INSERT INTO `studentclass` VALUES ('40038', '2021005', '202132803071');

-- ----------------------------
-- Table structure for `students`
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `sid` varchar(255) NOT NULL COMMENT '学号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `name` varchar(255) DEFAULT NULL COMMENT '学生名字',
  `image` varchar(255) DEFAULT NULL COMMENT '图片信息',
  `c_a_id` int(16) DEFAULT NULL COMMENT '行政班级',
  PRIMARY KEY (`sid`),
  KEY `sca_id` (`c_a_id`),
  CONSTRAINT `sca_id` FOREIGN KEY (`c_a_id`) REFERENCES `classadministration` (`c_a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('2016011350', '123456', '纪朝萍', 'faceimg/2016011357.jpg', '201601');
INSERT INTO `students` VALUES ('2016011357', '123456', '郭程媛', 'faceimg/2016011357.jpg', '201601');
INSERT INTO `students` VALUES ('2016011359', '123456', '郭诗博', 'faceimg/2016011357.jpg', '201601');
INSERT INTO `students` VALUES ('2016011364', '123456', '潘凯亚', 'faceimg/2016011357.jpg', '201601');
INSERT INTO `students` VALUES ('2016011369', '123456', '张家程', 'faceimg/2016011357.jpg', '201601');
INSERT INTO `students` VALUES ('2016011370', '123', '苏鑫', 'faceimg/2016011370.jpg', '201601');
INSERT INTO `students` VALUES ('2016011398', '123456', '孙采萱', 'faceimg/2016011357.jpg', '201602');
INSERT INTO `students` VALUES ('202132803071', '123', '苏鑫', 'faceimg/202132803071.jpg', '212861');
INSERT INTO `students` VALUES ('202132803099', '123', '张梦泉', 'faceimg/202132803099.jpg', '212861');
INSERT INTO `students` VALUES ('202132803104', '123', '赵益晨', 'faceimg/202132803104.jpg', '212861');
INSERT INTO `students` VALUES ('202132803106', '123', '姚昊', 'faceimg/202132803106.jpg', '212861');

-- ----------------------------
-- Table structure for `studentstatus`
-- ----------------------------
DROP TABLE IF EXISTS `studentstatus`;
CREATE TABLE `studentstatus` (
  `sid` varchar(255) NOT NULL DEFAULT '' COMMENT '学生学号',
  `record_status` int(11) DEFAULT NULL COMMENT '是否签到',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentstatus
-- ----------------------------
INSERT INTO `studentstatus` VALUES ('2016011350', '0');
INSERT INTO `studentstatus` VALUES ('2016011357', '0');
INSERT INTO `studentstatus` VALUES ('2016011359', '0');
INSERT INTO `studentstatus` VALUES ('2016011369', '0');
INSERT INTO `studentstatus` VALUES ('2016011370', '0');
INSERT INTO `studentstatus` VALUES ('2016011398', '0');
INSERT INTO `studentstatus` VALUES ('202132803071', '0');
INSERT INTO `studentstatus` VALUES ('202132803099', '2');
INSERT INTO `studentstatus` VALUES ('202132803104', '1');
INSERT INTO `studentstatus` VALUES ('202132803106', '0');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tid` varchar(255) NOT NULL COMMENT '教工号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `tname` varchar(255) DEFAULT NULL COMMENT '教师名字',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('t201301', '123', '丁蕾蕾');
INSERT INTO `teacher` VALUES ('t201302', '123', '丁盟');
INSERT INTO `teacher` VALUES ('t201303', '123456', '陈润滋');
INSERT INTO `teacher` VALUES ('t201304', '123456', '武永亮');
INSERT INTO `teacher` VALUES ('t201305', '123456', '韩立刚');
INSERT INTO `teacher` VALUES ('t202101', '123', '郭迎春');
INSERT INTO `teacher` VALUES ('t202102', '123', '张建军');
INSERT INTO `teacher` VALUES ('t202103', '123', '侯向丹');

-- ----------------------------
-- Table structure for `teacherstatus`
-- ----------------------------
DROP TABLE IF EXISTS `teacherstatus`;
CREATE TABLE `teacherstatus` (
  `tid` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacherstatus
-- ----------------------------
INSERT INTO `teacherstatus` VALUES ('t202101', '0');
INSERT INTO `teacherstatus` VALUES ('t202102', '0');
INSERT INTO `teacherstatus` VALUES ('t202103', '0');

-- ----------------------------
-- Table structure for `term`
-- ----------------------------
DROP TABLE IF EXISTS `term`;
CREATE TABLE `term` (
  `term_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '学期序列号',
  `time_begin` date DEFAULT NULL COMMENT '学期开始日期',
  `time_end` date DEFAULT NULL COMMENT '学期结束日期',
  `status` int(16) DEFAULT NULL COMMENT '学期状态',
  PRIMARY KEY (`term_id`)
) ENGINE=InnoDB AUTO_INCREMENT=202103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of term
-- ----------------------------
INSERT INTO `term` VALUES ('202001', '2021-03-27', '2021-08-30', '0');
INSERT INTO `term` VALUES ('202102', '2022-02-21', '2022-06-30', '1');

-- ----------------------------
-- Table structure for `times`
-- ----------------------------
DROP TABLE IF EXISTS `times`;
CREATE TABLE `times` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '上课时间流水号',
  `c_week` varchar(255) DEFAULT NULL COMMENT '上课周数（1-18）',
  `c_date` varchar(255) DEFAULT NULL COMMENT '上课（星期几）',
  `node_id` int(16) DEFAULT NULL COMMENT '上课节数',
  `class_id` int(16) DEFAULT NULL COMMENT '课程班级',
  PRIMARY KEY (`id`),
  KEY `ct_id` (`class_id`),
  KEY `nt_id` (`node_id`),
  CONSTRAINT `ct_id` FOREIGN KEY (`class_id`) REFERENCES `classcourse` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nt_id` FOREIGN KEY (`node_id`) REFERENCES `nodenumber` (`node_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30018 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of times
-- ----------------------------
INSERT INTO `times` VALUES ('30001', '1-18', '四', '20001', '2020001');
INSERT INTO `times` VALUES ('30002', '1-18', '四', '20002', '2020002');
INSERT INTO `times` VALUES ('30003', '1-18', '五', '20003', '2021005');
INSERT INTO `times` VALUES ('30004', '1-18', '五', '20004', '2021005');
INSERT INTO `times` VALUES ('30005', '1-18', '六', '20004', '2020001');
INSERT INTO `times` VALUES ('30006', '1-18', '六', '20003', '2020003');
INSERT INTO `times` VALUES ('30007', '1-18', '六', '20001', '2020001');
INSERT INTO `times` VALUES ('30008', '1-18', '六', '20002', '2020003');
INSERT INTO `times` VALUES ('30009', '1-18', '日', '20001', '2021002');
INSERT INTO `times` VALUES ('30010', '1-18', '日', '20002', '2021002');
INSERT INTO `times` VALUES ('30011', '1-18', '日', '20003', '2021002');
INSERT INTO `times` VALUES ('30012', '1-18', '日', '20004', '2021002');
INSERT INTO `times` VALUES ('30013', '2-9', '三', '20001', '2021002');
INSERT INTO `times` VALUES ('30014', '2-9', '三', '20002', '2021002');
INSERT INTO `times` VALUES ('30015', '2-9', '二', '20001', '2021001');
INSERT INTO `times` VALUES ('30016', '2-9', '二', '20002', '2021002');
INSERT INTO `times` VALUES ('30017', '2-9', '五', '20005', '2021002');
