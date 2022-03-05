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
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `product_item` varchar(20) DEFAULT NULL COMMENT '商品项',
  `total_price` decimal(20,2) DEFAULT NULL COMMENT '合计',
  `status` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单状态',
  `address_id` bigint(20) DEFAULT NULL COMMENT '地址id',
  `user_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  `nick_name` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户昵称',
  `created` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建时间',
  `updated` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=202190039067 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES (202190039061, '9', 6.00, '配送中', 1085, 'oUT385ZLmRr6R_a9xKSfSW9SekYI', '时光不等人', '2021-11-09 14:51:25', '2021-11-09 20:40:23');
INSERT INTO `orders` VALUES (202190039062, '10', 4.00, '配送中', 1096, 'oUT385ZLmRr6R_a9xKSfSW9SekYI', '时光不等人', '2021-11-09 16:30:22', '2021-11-09 20:40:27');
INSERT INTO `orders` VALUES (202190039063, '9,10', 10.00, '配送中', 1096, 'oUT385ZLmRr6R_a9xKSfSW9SekYI', '时光不等人', '2021-11-09 20:52:03', '2021-11-14 09:54:02');
INSERT INTO `orders` VALUES (202190039064, '10,12', 44.00, '配送中', 1096, 'oUT385ZLmRr6R_a9xKSfSW9SekYI', '时光不等人', '2021-11-09 22:52:50', '2021-11-14 09:54:10');
INSERT INTO `orders` VALUES (202190039065, '13', 20.00, '待发货', 1096, 'oUT385ZLmRr6R_a9xKSfSW9SekYI', '时光不等人', '2021-11-15 18:09:10', '');
INSERT INTO `orders` VALUES (202190039066, '10,14', 100.00, '待发货', 1096, 'oUT385ZLmRr6R_a9xKSfSW9SekYI', '时光不等人', '2021-11-15 18:20:54', '');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
