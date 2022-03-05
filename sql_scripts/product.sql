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
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `category_id` bigint(20) DEFAULT NULL COMMENT '类目编号',
  `title` varchar(50) DEFAULT NULL COMMENT '商品标题',
  `description` varchar(80) DEFAULT NULL COMMENT '商品描述',
  `price` decimal(20,2) DEFAULT NULL COMMENT '商品价格',
  `amount` int(10) DEFAULT NULL COMMENT '商品数量',
  `sales` int(10) DEFAULT NULL COMMENT '商品销量',
  `main_image` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品主图',
  `delivery` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品发货',
  `assurance` varchar(30) DEFAULT NULL COMMENT '商品保障',
  `name` varchar(30) DEFAULT NULL COMMENT '商品名称',
  `weight` double(20,0) DEFAULT NULL COMMENT '商品重量',
  `brand` varchar(10) DEFAULT NULL COMMENT '商品品牌',
  `origin` varchar(80) DEFAULT NULL COMMENT '商品产地',
  `shelf_life` int(20) DEFAULT NULL COMMENT '商品保质期',
  `net_weight` double(20,0) DEFAULT NULL COMMENT '商品净含量',
  `use_way` varchar(20) DEFAULT NULL COMMENT '使用方式',
  `packing_way` varchar(20) DEFAULT NULL COMMENT '包装方式',
  `storage_conditions` varchar(20) DEFAULT NULL COMMENT '存储条件',
  `detail_image` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详情图片',
  `status` int(10) DEFAULT NULL COMMENT '商品状态',
  `created` varchar(50) DEFAULT NULL COMMENT '创建时间',
  `updated` varchar(50) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES (9, 1098, '菠菜300g', '新鲜菠菜', 6.00, 351, 330, 'http://localhost:8000/image/IMG_1296.JPG', '现在下单，预计3小时内送达', '支持6小时内退换货', '菠菜', 300, '自营', '湖北省武汉市', 2, 300, '食用', '袋装', '常温', 'http://localhost:8000/image/IMG_1298.JPG', 2, '2021-11-05 10:17:05', '2021-11-09 20:43:45');
INSERT INTO `product` VALUES (10, 1100, '大红西红柿（番茄）400g', '汁水丰盈 酸甜可口', 4.00, 680, 120, 'http://localhost:8000/image/IMG_1299.JPG', '现在下单，预计2小时送达', '支持6小时内退货', '西红柿（番茄）', 400, '自营', '湖北省武汉市', 3, 400, '食用', '袋装', '常温', 'http://localhost:8000/image/IMG_1300.JPG', 1, '2021-11-05 10:29:39', '');
INSERT INTO `product` VALUES (11, 1102, '红洋葱450g', '葱香四溢 微辣清脆', 4.00, 233, 36, 'http://localhost:8000/image/IMG_1301.JPG', '现在发货，预计3小时送达', '支持6小时内退货', '红洋葱', 450, '自营', '广东省广州市', 7, 450, '炒菜食用', '袋装', '常温', 'http://localhost:8000/image/IMG_1302.JPG', 1, '2021-11-05 10:40:59', '2021-11-05 21:23:25');
INSERT INTO `product` VALUES (12, 1103, '生菜300g', '新鲜生菜 看得见', 4.00, 106, 300, 'http://localhost:8000/image/IMG_1303.JPG', '现在下载，预计2小时送达', '不支持退换货', '生菜', 300, '自营', '湖北省武汉市', 3, 300, '食用', '袋装', '冷藏', 'http://localhost:8000/image/IMG_1304.JPG', 1, '2021-11-05 10:49:00', '2021-11-05 21:04:53');
INSERT INTO `product` VALUES (13, 1104, '长白萝卜600g', '生熟两吃 美味不可挡', 5.00, 355, 550, 'http://localhost:8000/image/IMG_1305.JPG', '现在下单，预计2小时内送达', '支持5小时内退货', '长白萝卜', 600, '自营', '江西省南昌市', 5, 600, '食用', '袋装', '常温', 'http://localhost:8000/image/IMG_1306.JPG', 1, '2021-11-05 14:27:12', '');
INSERT INTO `product` VALUES (14, 1105, '大白菜300g', '新鲜大白菜 超好吃', 5.00, 124, 8802, 'http://localhost:8000/image/IMG_1307.JPG', '现在下单，预计2小时送达', '支持3小时内退货', '大白菜', 300, '自营', '湖北省武汉市', 2, 300, '食用', '袋装', '常温', 'http://localhost:8000/image/IMG_1308.JPG', 1, '2021-11-05 14:33:09', '2021-11-05 21:02:58');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
