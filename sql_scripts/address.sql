/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : sf_mall

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `user_id` varchar(200) DEFAULT NULL COMMENT '用户id',
  `name` varchar(255) DEFAULT NULL COMMENT '收货人姓名',
  `mobile` char(16) DEFAULT NULL COMMENT '手机号',
  `postal_code` int(6) DEFAULT NULL COMMENT '邮政编码',
  `province` char(30) DEFAULT NULL COMMENT '省',
  `city` char(30) DEFAULT NULL COMMENT '城市',
  `district` char(30) DEFAULT NULL COMMENT '区/县',
  `detailed_address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `is_default` tinyint(1) DEFAULT NULL COMMENT '1为默认，0为非默认',
  `created` char(20) DEFAULT NULL COMMENT '创建时间',
  `updated` char(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1098 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
BEGIN;
INSERT INTO `address` VALUES (1096, 'oUT385ZLmRr6R_a9xKSfSW9SekYI', '时光不等人', '13300003333', 303033, '浙江省', '湖州市', '长兴县', '三三小区3栋303', 1, '2021-11-09 16:28:37', '2021-11-15 18:13:44');
INSERT INTO `address` VALUES (1097, 'aUT385ZLmRr6R_a9xKSfSW9SekUK', '岁月无痕', '13708061236', 303045, '浙江省', '杭州市', '上城区', 'xxxx', 2, '2021-11-15 18:13:26', '');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
