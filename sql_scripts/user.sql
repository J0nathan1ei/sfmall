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
  `balance` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户余额',
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

BEGIN;
update `user` set balance=500 where id='oUT385ZLmRr6R_a9xKSfSW9SekYI';
update `user` set balance=1000 where id='aUT385ZLmRr6R_a9xKSfSW9SekUK';
update `user` set balance=2000 where id='aUT385ZLmRr6R_dsadasdW9SekUK';
update `user` set balance=5000 where id='aUT385Zdasdas_a9xKSfSW9SekUK';
update `user` set balance=8000 where id='dasdadsadacxz_a9xKSfSW9SekUK';
update `user` set balance=100 where id='aUT385ZLmRr6R_dfmskdmfsdfksd';
update `user` set balance=200 where id='dasdsadvcbxgd_dsadDkdfFDSFdd';
update `user` set balance=300 where id='cUT234ZLmRr7R_a0xKSfSW1SekUK';
update `user` set balance=400 where id='dUT381ZLmRr6R_a1xKSfSW2SekUK';
update `user` set balance=500 where id='eUT482ZLmRr6R_a2xKSfSW3SekUK';
update `user` set balance=600 where id='fUT583ZLmRr6R_a3xKSfSW4SekUK';
update `user` set balance=1000 where id='hUT684ZLmRr6R_a4xKSfSW5SekUK';
update `user` set balance=200 where id='iUT786ZLmRr6R_a5xKSfSW6SekUK';
update `user` set balance=500 where id='jUT887ZLmRr6R_a6xKSfSW7SekUK';
update `user` set balance=500 where id='hUT988ZLmRr6R_a7xKSfSW8SekUK';
update `user` set balance=500 where id='qUT089ZLmRr6R_a8xKSfSU1SekUK';
update `user` set balance=500 where id='wUT171ZLmRr6R_b1xKSfSU2SekUK';
update `user` set balance=500 where id='eUT272ZLmRr6R_b2xKSfSU3SekUK';
update `user` set balance=500 where id='rUT373ZLmRr6R_b3xKSfSU4SekUK';
update `user` set balance=500 where id='tUT374ZLmRr6R_b4xKSfSU5SekUK';
COMMIT;
