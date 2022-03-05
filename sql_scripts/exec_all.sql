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
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '类目id',
  `name` char(50) DEFAULT NULL COMMENT '类目名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级类目id',
  `level` int(5) DEFAULT NULL COMMENT '类目层级',
  `sort` int(5) DEFAULT NULL COMMENT '类目排序',
  `created` char(20) DEFAULT NULL COMMENT '创建时间',
  `updated` char(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES (1077, '叶菜类', 1, 1, 100, '2021-11-03 10:10:05', '');
INSERT INTO `category` VALUES (1078, '小白菜', 1077, 2, 80, '2021-11-03 10:10:21', '');
INSERT INTO `category` VALUES (1079, '芹菜', 1077, 2, 35, '2021-11-03 10:11:38', '');
INSERT INTO `category` VALUES (1080, '空心菜', 1077, 2, 32, '2021-11-03 10:12:16', '');
INSERT INTO `category` VALUES (1081, '豆芽类', 1, 1, 60, '2021-11-03 10:12:46', '');
INSERT INTO `category` VALUES (1082, '豆芽菜', 1081, 2, 35, '2021-11-03 10:12:55', '');
INSERT INTO `category` VALUES (1083, '瓜果类', 1, 1, 34, '2021-11-03 10:24:58', '');
INSERT INTO `category` VALUES (1084, '黄瓜', 1083, 2, 55, '2021-11-03 10:25:08', '');
INSERT INTO `category` VALUES (1085, '冬瓜', 1083, 2, 77, '2021-11-03 10:25:32', '');
INSERT INTO `category` VALUES (1086, '茄果类', 1, 1, 55, '2021-11-03 10:25:55', '');
INSERT INTO `category` VALUES (1087, '辣椒', 1086, 2, 67, '2021-11-03 10:26:05', '');
INSERT INTO `category` VALUES (1088, '根菜类', 1, 1, 12, '2021-11-03 10:26:19', '');
INSERT INTO `category` VALUES (1089, '胡萝卜', 1088, 2, 33, '2021-11-03 10:26:29', '');
INSERT INTO `category` VALUES (1090, '花菜类', 1, 1, 35, '2021-11-03 10:26:40', '');
INSERT INTO `category` VALUES (1091, '西兰花', 1090, 2, 12, '2021-11-03 10:26:47', '');
INSERT INTO `category` VALUES (1092, '豆荚类', 1, 1, 35, '2021-11-03 10:27:00', '');
INSERT INTO `category` VALUES (1093, '豌豆', 1092, 2, 58, '2021-11-03 10:27:13', '');
INSERT INTO `category` VALUES (1094, '菌菇类', 1, 1, 55, '2021-11-03 10:27:48', '');
INSERT INTO `category` VALUES (1095, '香菇', 1094, 2, 12, '2021-11-03 10:27:58', '');
INSERT INTO `category` VALUES (1096, '水生类', 1, 1, 12, '2021-11-03 10:28:44', '');
INSERT INTO `category` VALUES (1097, '紫菜', 1096, 2, 12, '2021-11-03 10:28:47', '');
INSERT INTO `category` VALUES (1098, '菠菜', 1077, 2, 55, '2021-11-05 09:44:49', '');
INSERT INTO `category` VALUES (1100, '西红柿', 1086, 2, 39, '2021-11-05 10:23:49', '');
INSERT INTO `category` VALUES (1101, '葱蒜类', 1, 1, 30, '2021-11-05 10:31:33', '');
INSERT INTO `category` VALUES (1102, '红洋葱', 1101, 2, 55, '2021-11-05 10:32:04', '');
INSERT INTO `category` VALUES (1103, '生菜', 1077, 2, 29, '2021-11-05 10:44:47', '');
INSERT INTO `category` VALUES (1104, '长白萝卜', 1088, 2, 36, '2021-11-05 14:20:39', '');
INSERT INTO `category` VALUES (1105, '大白菜', 1077, 2, 80, '2021-11-05 14:28:24', '');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;


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
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
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
INSERT INTO `order` VALUES (202190039061, '9', 6.00, '配送中', 1085, 'oUT385ZLmRr6R_a9xKSfSW9SekYI', '时光不等人', '2021-11-09 14:51:25', '2021-11-09 20:40:23');
INSERT INTO `order` VALUES (202190039062, '10', 4.00, '配送中', 1096, 'oUT385ZLmRr6R_a9xKSfSW9SekYI', '时光不等人', '2021-11-09 16:30:22', '2021-11-09 20:40:27');
INSERT INTO `order` VALUES (202190039063, '9,10', 10.00, '配送中', 1096, 'oUT385ZLmRr6R_a9xKSfSW9SekYI', '时光不等人', '2021-11-09 20:52:03', '2021-11-14 09:54:02');
INSERT INTO `order` VALUES (202190039064, '10,12', 44.00, '配送中', 1096, 'oUT385ZLmRr6R_a9xKSfSW9SekYI', '时光不等人', '2021-11-09 22:52:50', '2021-11-14 09:54:10');
INSERT INTO `order` VALUES (202190039065, '13', 20.00, '待发货', 1096, 'oUT385ZLmRr6R_a9xKSfSW9SekYI', '时光不等人', '2021-11-15 18:09:10', '');
INSERT INTO `order` VALUES (202190039066, '10,14', 100.00, '待发货', 1096, 'oUT385ZLmRr6R_a9xKSfSW9SekYI', '时光不等人', '2021-11-15 18:20:54', '');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;


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
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id（主键）',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名称',
  `real_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户真实名称',
  `role_id` tinyint(20) NOT NULL DEFAULT '1' COMMENT '用户角色，1表示普通用户',
  `password` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话',
  `balance` decimal(20,2) unsigned NOT NULL DEFAULT '0' COMMENT '用户余额',
  `status` tinyint(20) NOT NULL DEFAULT '1' COMMENT '用户状态，1表示正常，0表示暂停',
  `logged_in_time` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录时间',
  `created` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建时间',
  `updated` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100037 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('oUT385ZLmRr6R_a9xKSfSW9SekYI', '时光不等人', 'admin', 1,'admin@123','13300003333',0, 1, NULL, '2021-12-03 10:35:02', NULL);
INSERT INTO `user` VALUES ('aUT385ZLmRr6R_a9xKSfSW9SekUK', '岁月无痕', 'HAHA', 1,'admin@123','13708061236',0, 1, NULL, '2021-12-03 10:35:02', NULL);
INSERT INTO `user` VALUES ('aUT385ZLmRr6R_dsadasdW9SekUK', '法外狂徒', '张三', 1,'admin@123','18708061231',0, 1, NULL, '2021-12-03 10:35:02', NULL);
INSERT INTO `user` VALUES ('aUT385Zdasdas_a9xKSfSW9SekUK', '金毛狮王', '李四', 1,'admin@123','15108061236',0, 1, NULL, '2021-12-03 10:35:02', NULL);
INSERT INTO `user` VALUES ('dasdadsadacxz_a9xKSfSW9SekUK', '玉面飞龙', '王五', 1,'admin@123','17708061236',0, 1, NULL, '2021-12-03 10:35:02', NULL);
INSERT INTO `user` VALUES ('aUT385ZLmRr6R_dfmskdmfsdfksd', '神奇大侠', '赵六', 1,'admin@123','13708061238',0, 1, NULL, '2021-12-03 10:35:02', NULL);
INSERT INTO `user` VALUES ('dasdsadvcbxgd_dsadDkdfFDSFdd', '逍遥王', '孙七', 1,'admin@123','13708061232',0, 1, NULL, '2021-12-03 10:35:02', NULL);
INSERT INTO `user` VALUES ('cUT234ZLmRr7R_a0xKSfSW1SekUK', '锦毛鼠', '周八', 1,'admin@123','13708061233',0, 1, NULL, '2021-12-03 10:35:02', NULL);
INSERT INTO `user` VALUES ('dUT381ZLmRr6R_a1xKSfSW2SekUK', '智多星', '吴九', 1,'admin@123','13708061235',0, 1, NULL, '2021-12-03 10:35:02', NULL);
INSERT INTO `user` VALUES ('eUT482ZLmRr6R_a2xKSfSW3SekUK', '及时雨', '真实', 1,'admin@123','13708061239',0, 1, NULL, '2021-12-03 10:35:02', NULL);
INSERT INTO `user` VALUES ('fUT583ZLmRr6R_a3xKSfSW4SekUK', '混江龙', '十一', 1,'admin@123','15508061236',0, 1, NULL, '2021-12-03 10:35:02', NULL);
INSERT INTO `user` VALUES ('hUT684ZLmRr6R_a4xKSfSW5SekUK', '小李飞刀', '李寻欢', 1,'admin@123','13708061136',0, 1, NULL, '2021-12-03 10:35:02', NULL);
INSERT INTO `user` VALUES ('iUT786ZLmRr6R_a5xKSfSW6SekUK', '逍遥祖师', '无崖子', 1,'admin@123','13708061256',0, 1, NULL, '2021-12-03 10:35:02', NULL);
INSERT INTO `user` VALUES ('jUT887ZLmRr6R_a6xKSfSW7SekUK', '降龙十八掌', '乔峰', 1,'admin@123','13708065555',0, 1, NULL, '2021-12-03 10:35:02', NULL);
INSERT INTO `user` VALUES ('hUT988ZLmRr6R_a7xKSfSW8SekUK', '少林', '虚竹', 1,'admin@123','13708061111',0, 1, NULL, '2021-12-03 10:35:02', NULL);
INSERT INTO `user` VALUES ('qUT089ZLmRr6R_a8xKSfSU1SekUK', '大理王子', '段誉', 1,'admin@123','13708062235',0, 1, NULL, '2021-12-03 10:35:02', NULL);
INSERT INTO `user` VALUES ('wUT171ZLmRr6R_b1xKSfSU2SekUK', '雪山飞狐', '胡斐', 1,'admin@123','13708062233',0, 1, NULL, '2021-12-03 10:35:02', NULL);
INSERT INTO `user` VALUES ('eUT272ZLmRr6R_b2xKSfSU3SekUK', '总舵主', '陈家洛', 1,'admin@123','13708061666',0, 1, NULL, '2021-12-03 10:35:02', NULL);
INSERT INTO `user` VALUES ('rUT373ZLmRr6R_b3xKSfSU4SekUK', '八仙', '何仙姑', 1,'admin@123','13708069999',0, 1, NULL, '2021-12-03 10:35:02', NULL);
INSERT INTO `user` VALUES ('tUT374ZLmRr6R_b4xKSfSU5SekUK', '大清王爷', '韦小宝', 1,'admin@123','13708068888',0, 1, NULL, '2021-12-03 10:35:02', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
