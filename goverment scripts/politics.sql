/*
Navicat MySQL Data Transfer

Source Server         : ARMA
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : arma3life

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-02-06 13:53:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `politics`
-- ----------------------------
DROP TABLE IF EXISTS `politics`;
CREATE TABLE `politics` (
  `name` varchar(32) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `invest` int(11) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `policy` varchar(300) NOT NULL,
  `votecount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`invest`,`votecount`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;