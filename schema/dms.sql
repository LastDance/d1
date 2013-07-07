/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : dms

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-07-07 15:22:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `material_detail`
-- ----------------------------
DROP TABLE IF EXISTS `material_detail`;
CREATE TABLE `material_detail` (
  `matl_id` int(11) NOT NULL AUTO_INCREMENT,
  `matl_tkl_id` int(11) NOT NULL,
  `matl_attr1` varchar(20) DEFAULT NULL,
  `matl_attr2` varchar(20) DEFAULT NULL,
  `matl_attr3` varchar(20) DEFAULT NULL,
  `matl_attr4` varchar(20) DEFAULT NULL,
  `matl_name` varchar(20) DEFAULT NULL,
  `matl_desc` varchar(40) DEFAULT NULL,
  `matl_ctg` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`matl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of material_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `order_line`
-- ----------------------------
DROP TABLE IF EXISTS `order_line`;
CREATE TABLE `order_line` (
  `ordl_id` int(11) NOT NULL AUTO_INCREMENT,
  `ordl_ord_id` int(11) NOT NULL,
  `ordl_nbr` int(11) NOT NULL,
  `ordl_line_item` varchar(40) NOT NULL,
  `ordl_product` varchar(40) DEFAULT NULL,
  `ordl_item_price` double NOT NULL,
  `ordl_item_qty` double NOT NULL,
  `ordl_status` varchar(40) NOT NULL,
  `ordl_req_date` date DEFAULT NULL,
  `ordl_rvw_grp` int(11) DEFAULT NULL,
  `ordl_cmt` text,
  `ordl_active` bit(1) NOT NULL,
  PRIMARY KEY (`ordl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_line
-- ----------------------------
INSERT INTO `order_line` VALUES ('1', '2', '1', '电脑1', null, '2', '3', '已录入，待审核', null, null, '草草', '');
INSERT INTO `order_line` VALUES ('2', '3', '1', 'asd', null, '44', '11', '已录入，待审核', null, null, 'ss', '');
INSERT INTO `order_line` VALUES ('3', '3', '2', 'asd', null, '44', '22', '已录入，待审核', null, null, 'dd', '');
INSERT INTO `order_line` VALUES ('4', '3', '3', 'asd', null, '11', '33', '已录入，待审核', null, null, 'ff', '');

-- ----------------------------
-- Table structure for `order_master`
-- ----------------------------
DROP TABLE IF EXISTS `order_master`;
CREATE TABLE `order_master` (
  `ord_id` int(11) NOT NULL AUTO_INCREMENT,
  `ord_prefix` varchar(20) NOT NULL,
  `ord_cust_nbr` varchar(40) DEFAULT NULL,
  `ord_cust` varchar(40) NOT NULL,
  `ord_ent_date` date NOT NULL,
  `ord_req_date` date NOT NULL,
  `ord_ent_by` varchar(40) NOT NULL,
  `ord_rvw_grp` int(11) DEFAULT NULL,
  `ord_status` varchar(40) NOT NULL,
  `ord_cmt` text,
  PRIMARY KEY (`ord_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_master
-- ----------------------------
INSERT INTO `order_master` VALUES ('2', 'test', 'ref-coco1', 'coco1', '2013-07-17', '2013-07-25', 'admin', null, '已录入，待审核', 'fsdfs');
INSERT INTO `order_master` VALUES ('3', 'test', '222', '123', '2013-07-07', '2013-07-17', 'admin', null, '已录入，待审核', 'asdd');

-- ----------------------------
-- Table structure for `process_appr`
-- ----------------------------
DROP TABLE IF EXISTS `process_appr`;
CREATE TABLE `process_appr` (
  `pa_id` int(11) NOT NULL AUTO_INCREMENT,
  `pa_appr` varchar(40) NOT NULL,
  PRIMARY KEY (`pa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of process_appr
-- ----------------------------

-- ----------------------------
-- Table structure for `review_detail`
-- ----------------------------
DROP TABLE IF EXISTS `review_detail`;
CREATE TABLE `review_detail` (
  `rvw_id` int(11) NOT NULL AUTO_INCREMENT,
  `rvw_group` int(11) NOT NULL,
  `rvw_ent_by` varchar(40) NOT NULL,
  `rvw_ent_date` date DEFAULT NULL,
  `rvw_cmt` text,
  PRIMARY KEY (`rvw_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `task_line`
-- ----------------------------
DROP TABLE IF EXISTS `task_line`;
CREATE TABLE `task_line` (
  `tkl_id` int(11) NOT NULL AUTO_INCREMENT,
  `tkl_tk_id` int(11) NOT NULL,
  `tkl_part` varchar(20) NOT NULL,
  `tkl_desc` varchar(80) DEFAULT NULL,
  `tkl_matl_id` int(11) NOT NULL,
  `tkl_qty_set` double NOT NULL,
  `tkl_qty_per_set` double NOT NULL,
  `tkl_appr` varchar(40) NOT NULL,
  `tkl_cmt` text,
  PRIMARY KEY (`tkl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task_line
-- ----------------------------

-- ----------------------------
-- Table structure for `task_master`
-- ----------------------------
DROP TABLE IF EXISTS `task_master`;
CREATE TABLE `task_master` (
  `tk_id` int(11) NOT NULL AUTO_INCREMENT,
  `tk_ordl_id` int(11) NOT NULL,
  `tk_product` varchar(40) NOT NULL,
  `tk_desc` varchar(40) DEFAULT NULL,
  `tk_set_qty` int(11) NOT NULL,
  `tk_due_date` date NOT NULL,
  `tk_ent_by` varchar(40) NOT NULL,
  `tk_ent_date` date NOT NULL,
  `tk_rvw_grp` int(11) DEFAULT NULL,
  `tk_cmt` text,
  PRIMARY KEY (`tk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task_master
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(40) NOT NULL,
  `user_passwd` varchar(40) NOT NULL,
  `user_email` varchar(80) DEFAULT NULL,
  `user_telephone` varchar(20) NOT NULL,
  `user_qq` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', null, '13795481516', '381659304');
