SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `recharge_cards`;
CREATE TABLE `recharge_cards`(
    `id`        varchar(50)                    NOT NULL       COMMENT '充值卡ID',
    `credits`   decimal(20,2)                  NOT NULL       COMMENT '充值卡点数',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=202190039067 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recharge_cards
-- ----------------------------
BEGIN;
INSERT INTO `recharge_cards` VALUES ("100001", 50);
INSERT INTO `recharge_cards` VALUES ("100002", 80);
INSERT INTO `recharge_cards` VALUES ("100003", 100);
INSERT INTO `recharge_cards` VALUES ("100004", 50);
INSERT INTO `recharge_cards` VALUES ("100005", 50);
INSERT INTO `recharge_cards` VALUES ("100006", 150);
INSERT INTO `recharge_cards` VALUES ("100007", 200);
COMMIT;
SET FOREIGN_KEY_CHECKS = 1;