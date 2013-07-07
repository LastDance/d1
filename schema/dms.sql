/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : dms

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-07-06 23:36:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `material_detail`
-- ----------------------------
DROP TABLE IF EXISTS `material_detail`;
CREATE TABLE `material_detail` (
  `matl_id` int(11) NOT NULL,
  `matl_attr1` varchar(20) DEFAULT NULL,
  `matl_attr2` varchar(20) DEFAULT NULL,
  `matl_attr3` varchar(20) DEFAULT NULL,
  `matl_attr4` varchar(20) DEFAULT NULL,
  `matl_nbr` varchar(20) DEFAULT NULL,
  `matl_desc` varchar(40) DEFAULT NULL,
  `matl_ctg` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of material_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `order_line`
-- ----------------------------
DROP TABLE IF EXISTS `order_line`;
CREATE TABLE `order_line` (
  `ordl_id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_line
-- ----------------------------

-- ----------------------------
-- Table structure for `order_master`
-- ----------------------------
DROP TABLE IF EXISTS `order_master`;
CREATE TABLE `order_master` (
  `ord_id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_master
-- ----------------------------

-- ----------------------------
-- Table structure for `process_appr`
-- ----------------------------
DROP TABLE IF EXISTS `process_appr`;
CREATE TABLE `process_appr` (
  `pa_id` int(11) DEFAULT NULL,
  `pa_appr` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of process_appr
-- ----------------------------

-- ----------------------------
-- Table structure for `review_detail`
-- ----------------------------
DROP TABLE IF EXISTS `review_detail`;
CREATE TABLE `review_detail` (
  `rvw_id` int(11) NOT NULL,
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
-- Table structure for `task_detail`
-- ----------------------------
DROP TABLE IF EXISTS `task_detail`;
CREATE TABLE `task_detail` (
  `tkd_id` int(11) NOT NULL,
  `tkd_tk_id` int(11) NOT NULL,
  `tkd_part` varchar(20) NOT NULL,
  `tkd_desc` varchar(80) DEFAULT NULL,
  `tkd_cust_part` varchar(40) DEFAULT NULL,
  `tkd_matl_id` int(11) NOT NULL,
  `tkd_qty_set` double NOT NULL,
  `tkd_qty_per_set` double NOT NULL,
  `tkd_appr` varchar(40) NOT NULL,
  `tkd_cmt` text,
  PRIMARY KEY (`tkd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `task_master`
-- ----------------------------
DROP TABLE IF EXISTS `task_master`;
CREATE TABLE `task_master` (
  `tk_id` int(11) NOT NULL,
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
  `user_id` int(11) NOT NULL,
  `user_name` varchar(40) NOT NULL,
  `user_passwd` varchar(40) NOT NULL,
  `user_email` varchar(80) DEFAULT NULL,
  `user_telephone` varchar(20) NOT NULL,
  `user_qq` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', null, '13795481516', '381659304');
