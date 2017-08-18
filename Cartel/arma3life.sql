-- ----------------------------
-- Table structure for zones
-- ----------------------------
DROP TABLE IF EXISTS `zones`;
CREATE TABLE `zones` (
  `list` text NOT NULL,
  `id` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zones
-- ----------------------------
INSERT INTO `zones` VALUES ('[["Contested","Arms Dealer",0],["Contested","Cocaine Cartel",0],["Contested","Meth Cartel",0],["Contested","Heroin Cartel",0]]', '1');