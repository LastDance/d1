/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : yitong_sys

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-07-04 10:48:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sales_order`
-- ----------------------------
DROP TABLE IF EXISTS `sales_order`;
CREATE TABLE `sales_order` (
  `ord_id` int(20) NOT NULL AUTO_INCREMENT,
  `ord_nbr` varchar(20) NOT NULL,
  `ord_cust_nbr` varchar(40) DEFAULT NULL,
  `ord_customer` varchar(40) NOT NULL,
  `ord_entered_date` date DEFAULT NULL,
  `ord_entered_by` varchar(40) NOT NULL,
  `ord_required_date` date DEFAULT NULL,
  `ord_reviewed_by` varchar(40) DEFAULT NULL,
  `ord_reviewed_date` date DEFAULT NULL,
  `ord_status` varchar(20) NOT NULL DEFAULT 'unknown',
  `ord_comment` text,
  PRIMARY KEY (`ord_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `sales_order_line`
-- ----------------------------
DROP TABLE IF EXISTS `sales_order_line`;
CREATE TABLE `sales_order_line` (
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
  PRIMARY KEY (`ordl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sales_order_line
-- ----------------------------

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
  PRIMARY KEY (`user_id`,`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@yt.com', '13795481516', '381659304');
