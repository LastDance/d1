/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : yitong_sys

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-07-04 23:25:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `ordl_id` int(11) NOT NULL AUTO_INCREMENT,
  `ordl_ord_id` int(11) NOT NULL,
  `ordl_nbr` int(11) NOT NULL,
  `ordl_item` varchar(20) NOT NULL,
  `ordl_item_price` double(20,0) NOT NULL DEFAULT '0',
  `ordl_item_qty` double(20,0) NOT NULL DEFAULT '0',
  `ordl_status` varchar(20) NOT NULL DEFAULT 'unknown',
  `ordl_required_date` date DEFAULT NULL,
  `ordl_reviewed_by` varchar(255) DEFAULT NULL,
  `ordl_reviewed_date` date DEFAULT NULL,
  `ordl_comment` text,
  `ordl_active` bit(1) NOT NULL,
  PRIMARY KEY (`ordl_id`),
  UNIQUE KEY `ordl_detail` (`ordl_ord_id`,`ordl_nbr`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('1', '22', '1', 'i11', '100', '100', 'cc', null, null, null, '11', '');
INSERT INTO `order_detail` VALUES ('2', '25', '1', 'chanp1', '33', '22', '已录入，待审核', null, null, null, '4', '');

-- ----------------------------
-- Table structure for `order_master`
-- ----------------------------
DROP TABLE IF EXISTS `order_master`;
CREATE TABLE `order_master` (
  `ord_id` int(20) NOT NULL AUTO_INCREMENT,
  `ord_prefix` varchar(20) NOT NULL,
  `ord_cust_nbr` varchar(40) DEFAULT NULL,
  `ord_customer` varchar(40) NOT NULL,
  `ord_entered_date` date DEFAULT NULL,
  `ord_entered_by` varchar(40) NOT NULL,
  `ord_required_date` date DEFAULT NULL,
  `ord_reviewed_by` varchar(40) DEFAULT NULL,
  `ord_reviewed_date` date DEFAULT NULL,
  `ord_status` varchar(20) NOT NULL DEFAULT 'unknown',
  `ord_comment` text,
  PRIMARY KEY (`ord_id`),
  UNIQUE KEY `ord_master` (`ord_id`,`ord_prefix`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_master
-- ----------------------------
INSERT INTO `order_master` VALUES ('1', 'so000', '123', '23', '2013-06-30', 'admin', '2013-06-30', null, null, 'status', 'comment');
INSERT INTO `order_master` VALUES ('2', 'so000', '123', '23', '2013-06-30', 'admin', '2013-06-30', null, null, 'status', 'comment');
INSERT INTO `order_master` VALUES ('3', 'so000', '123', '23', '2013-06-30', 'admin', '2013-06-30', null, null, 'status', 'comment');
INSERT INTO `order_master` VALUES ('4', 'so000', '123', '23', '2013-06-30', 'admin', '2013-06-30', null, null, 'status', 'comment');
INSERT INTO `order_master` VALUES ('5', 'so000', '123', '23', '2013-06-30', 'admin', '2013-06-30', null, null, 'status', 'comment');
INSERT INTO `order_master` VALUES ('6', 'so000', '', '', '2013-06-30', 'admin', '2013-07-03', null, null, '', '');
INSERT INTO `order_master` VALUES ('7', 'so000', '', '', '2013-07-02', 'admin', null, null, null, '', '');
INSERT INTO `order_master` VALUES ('22', 'SOyld-test', 'cococ1', 'coco', '2013-07-04', 'admin', '2013-07-11', null, null, 'asd', 'ddd');
INSERT INTO `order_master` VALUES ('25', 'test', '', 'COCO', '2013-07-04', 'admin', '2013-07-18', null, null, '已录入，待审核', '');

-- ----------------------------
-- Table structure for `order_status`
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `ords_id` int(11) NOT NULL AUTO_INCREMENT,
  `ords_status` varchar(20) NOT NULL,
  PRIMARY KEY (`ords_id`),
  UNIQUE KEY `ords_status` (`ords_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_status
-- ----------------------------
INSERT INTO `order_status` VALUES ('1', '已审核');
INSERT INTO `order_status` VALUES ('2', '已录入，待审核');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(40) NOT NULL,
  `user_passwd` varchar(40) NOT NULL,
  `user_email` varchar(40) DEFAULT NULL,
  `user_telephone` varchar(40) DEFAULT NULL,
  `user_qq` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`user_name`),
  UNIQUE KEY `user` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@yt.com', '13795481516', '381659304');
