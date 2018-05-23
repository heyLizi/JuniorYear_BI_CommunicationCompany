/*
Navicat MySQL Data Transfer

Source Server         : Test
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : snow_model_dw

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-02-24 18:25:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `area_dim`
-- ----------------------------
DROP TABLE IF EXISTS `area_dim`;
CREATE TABLE `area_dim` (
  `area_id` char(10) NOT NULL,
  `area_name` varchar(20) NOT NULL,
  `province` varchar(10) NOT NULL,
  `city` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of area_dim
-- ----------------------------
INSERT INTO `area_dim` VALUES ('CIT_000001', '北京市', '北京市', '北京市');
INSERT INTO `area_dim` VALUES ('CIT_000002', '上海市', '上海市', '上海市');
INSERT INTO `area_dim` VALUES ('CIT_000003', '广东省广州市', '广东省', '广州市');
INSERT INTO `area_dim` VALUES ('CIT_000004', '江苏省南京市', '江苏省', '南京市');
INSERT INTO `area_dim` VALUES ('CIT_000005', '天津市', '天津市', '天津市');
INSERT INTO `area_dim` VALUES ('CIT_000006', '重庆市', '重庆市', '重庆市');
INSERT INTO `area_dim` VALUES ('CIT_000007', '江苏省苏州市', '江苏省', '苏州市');
INSERT INTO `area_dim` VALUES ('CIT_000008', '广东省深圳市', '广东省', '深圳市');
INSERT INTO `area_dim` VALUES ('CIT_000009', '陕西省西安市', '陕西省', '西安市');
INSERT INTO `area_dim` VALUES ('CIT_000010', '河北省唐山市', '河北省', '唐山市');

-- ----------------------------
-- Table structure for `bill_sp_fact`
-- ----------------------------
DROP TABLE IF EXISTS `bill_sp_fact`;
CREATE TABLE `bill_sp_fact` (
  `card_sk` int(11) NOT NULL,
  `sp_sk` int(11) NOT NULL,
  `time_sk` int(11) NOT NULL,
  `bill_money` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bill_sp_fact
-- ----------------------------
INSERT INTO `bill_sp_fact` VALUES ('1', '1', '1', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('1', '1', '2', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('1', '6', '1', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('1', '6', '2', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('2', '1', '1', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('2', '1', '2', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('2', '6', '1', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('2', '6', '2', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('3', '1', '1', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('3', '1', '2', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('3', '6', '1', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('3', '6', '2', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('4', '1', '1', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('4', '1', '2', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('4', '6', '1', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('4', '6', '2', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('5', '1', '1', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('5', '1', '2', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('5', '6', '1', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('5', '6', '2', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('6', '1', '1', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('6', '1', '2', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('6', '6', '1', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('6', '6', '2', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('7', '1', '1', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('7', '1', '2', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('7', '6', '1', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('7', '6', '2', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('8', '1', '1', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('8', '1', '2', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('8', '6', '1', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('8', '6', '2', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('9', '1', '1', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('9', '1', '2', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('9', '6', '1', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('9', '6', '2', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('10', '1', '1', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('10', '1', '2', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('10', '6', '1', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('10', '6', '2', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('11', '2', '1', '38.00');
INSERT INTO `bill_sp_fact` VALUES ('11', '2', '2', '38.00');
INSERT INTO `bill_sp_fact` VALUES ('11', '7', '1', '30.00');
INSERT INTO `bill_sp_fact` VALUES ('11', '7', '2', '30.00');
INSERT INTO `bill_sp_fact` VALUES ('12', '2', '1', '38.00');
INSERT INTO `bill_sp_fact` VALUES ('12', '2', '2', '38.00');
INSERT INTO `bill_sp_fact` VALUES ('12', '7', '1', '30.00');
INSERT INTO `bill_sp_fact` VALUES ('12', '7', '2', '30.00');
INSERT INTO `bill_sp_fact` VALUES ('13', '2', '1', '38.00');
INSERT INTO `bill_sp_fact` VALUES ('13', '2', '2', '38.00');
INSERT INTO `bill_sp_fact` VALUES ('13', '7', '1', '30.00');
INSERT INTO `bill_sp_fact` VALUES ('13', '7', '2', '30.00');
INSERT INTO `bill_sp_fact` VALUES ('14', '2', '1', '38.00');
INSERT INTO `bill_sp_fact` VALUES ('14', '2', '2', '38.00');
INSERT INTO `bill_sp_fact` VALUES ('14', '7', '1', '30.00');
INSERT INTO `bill_sp_fact` VALUES ('14', '7', '2', '30.00');
INSERT INTO `bill_sp_fact` VALUES ('15', '2', '1', '38.00');
INSERT INTO `bill_sp_fact` VALUES ('15', '2', '2', '38.00');
INSERT INTO `bill_sp_fact` VALUES ('15', '7', '1', '30.00');
INSERT INTO `bill_sp_fact` VALUES ('15', '7', '2', '30.00');
INSERT INTO `bill_sp_fact` VALUES ('16', '2', '1', '38.00');
INSERT INTO `bill_sp_fact` VALUES ('16', '2', '2', '38.00');
INSERT INTO `bill_sp_fact` VALUES ('16', '7', '1', '30.00');
INSERT INTO `bill_sp_fact` VALUES ('16', '7', '2', '30.00');
INSERT INTO `bill_sp_fact` VALUES ('17', '2', '1', '38.00');
INSERT INTO `bill_sp_fact` VALUES ('17', '2', '2', '38.00');
INSERT INTO `bill_sp_fact` VALUES ('17', '7', '1', '30.00');
INSERT INTO `bill_sp_fact` VALUES ('17', '7', '2', '30.00');
INSERT INTO `bill_sp_fact` VALUES ('18', '2', '1', '38.00');
INSERT INTO `bill_sp_fact` VALUES ('18', '2', '2', '38.00');
INSERT INTO `bill_sp_fact` VALUES ('18', '7', '1', '30.00');
INSERT INTO `bill_sp_fact` VALUES ('18', '7', '2', '30.00');
INSERT INTO `bill_sp_fact` VALUES ('19', '2', '1', '38.00');
INSERT INTO `bill_sp_fact` VALUES ('19', '2', '2', '38.00');
INSERT INTO `bill_sp_fact` VALUES ('19', '7', '1', '30.00');
INSERT INTO `bill_sp_fact` VALUES ('19', '7', '2', '30.00');
INSERT INTO `bill_sp_fact` VALUES ('20', '2', '1', '38.00');
INSERT INTO `bill_sp_fact` VALUES ('20', '2', '2', '38.00');
INSERT INTO `bill_sp_fact` VALUES ('20', '7', '1', '30.00');
INSERT INTO `bill_sp_fact` VALUES ('20', '7', '2', '30.00');
INSERT INTO `bill_sp_fact` VALUES ('21', '3', '1', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('21', '3', '2', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('21', '8', '1', '50.00');
INSERT INTO `bill_sp_fact` VALUES ('21', '8', '2', '50.00');
INSERT INTO `bill_sp_fact` VALUES ('22', '3', '1', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('22', '3', '2', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('22', '8', '1', '50.00');
INSERT INTO `bill_sp_fact` VALUES ('22', '8', '2', '50.00');
INSERT INTO `bill_sp_fact` VALUES ('23', '3', '1', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('23', '3', '2', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('23', '8', '1', '50.00');
INSERT INTO `bill_sp_fact` VALUES ('23', '8', '2', '50.00');
INSERT INTO `bill_sp_fact` VALUES ('24', '3', '1', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('24', '3', '2', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('24', '8', '1', '50.00');
INSERT INTO `bill_sp_fact` VALUES ('24', '8', '2', '50.00');
INSERT INTO `bill_sp_fact` VALUES ('25', '3', '1', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('25', '3', '2', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('25', '8', '1', '50.00');
INSERT INTO `bill_sp_fact` VALUES ('25', '8', '2', '50.00');
INSERT INTO `bill_sp_fact` VALUES ('26', '3', '1', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('26', '3', '2', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('26', '8', '1', '50.00');
INSERT INTO `bill_sp_fact` VALUES ('26', '8', '2', '50.00');
INSERT INTO `bill_sp_fact` VALUES ('27', '3', '1', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('27', '3', '2', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('27', '8', '1', '50.00');
INSERT INTO `bill_sp_fact` VALUES ('27', '8', '2', '50.00');
INSERT INTO `bill_sp_fact` VALUES ('28', '3', '1', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('28', '3', '2', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('28', '8', '1', '50.00');
INSERT INTO `bill_sp_fact` VALUES ('28', '8', '2', '50.00');
INSERT INTO `bill_sp_fact` VALUES ('29', '3', '1', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('29', '3', '2', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('29', '8', '1', '50.00');
INSERT INTO `bill_sp_fact` VALUES ('29', '8', '2', '50.00');
INSERT INTO `bill_sp_fact` VALUES ('30', '3', '1', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('30', '3', '2', '28.00');
INSERT INTO `bill_sp_fact` VALUES ('30', '8', '1', '50.00');
INSERT INTO `bill_sp_fact` VALUES ('30', '8', '2', '50.00');
INSERT INTO `bill_sp_fact` VALUES ('31', '4', '1', '58.00');
INSERT INTO `bill_sp_fact` VALUES ('31', '4', '2', '58.00');
INSERT INTO `bill_sp_fact` VALUES ('31', '9', '1', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('31', '9', '2', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('32', '4', '1', '58.00');
INSERT INTO `bill_sp_fact` VALUES ('32', '4', '2', '58.00');
INSERT INTO `bill_sp_fact` VALUES ('32', '9', '1', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('32', '9', '2', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('33', '4', '1', '58.00');
INSERT INTO `bill_sp_fact` VALUES ('33', '4', '2', '58.00');
INSERT INTO `bill_sp_fact` VALUES ('33', '9', '1', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('33', '9', '2', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('34', '4', '1', '58.00');
INSERT INTO `bill_sp_fact` VALUES ('34', '4', '2', '58.00');
INSERT INTO `bill_sp_fact` VALUES ('34', '9', '1', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('34', '9', '2', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('35', '4', '1', '58.00');
INSERT INTO `bill_sp_fact` VALUES ('35', '4', '2', '58.00');
INSERT INTO `bill_sp_fact` VALUES ('35', '9', '1', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('35', '9', '2', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('36', '4', '1', '58.00');
INSERT INTO `bill_sp_fact` VALUES ('36', '4', '2', '58.00');
INSERT INTO `bill_sp_fact` VALUES ('36', '9', '1', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('36', '9', '2', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('37', '4', '1', '58.00');
INSERT INTO `bill_sp_fact` VALUES ('37', '4', '2', '58.00');
INSERT INTO `bill_sp_fact` VALUES ('37', '9', '1', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('37', '9', '2', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('38', '4', '1', '58.00');
INSERT INTO `bill_sp_fact` VALUES ('38', '4', '2', '58.00');
INSERT INTO `bill_sp_fact` VALUES ('38', '9', '1', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('38', '9', '2', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('39', '4', '1', '58.00');
INSERT INTO `bill_sp_fact` VALUES ('39', '4', '2', '58.00');
INSERT INTO `bill_sp_fact` VALUES ('39', '9', '1', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('39', '9', '2', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('40', '4', '1', '58.00');
INSERT INTO `bill_sp_fact` VALUES ('40', '4', '2', '58.00');
INSERT INTO `bill_sp_fact` VALUES ('40', '9', '1', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('40', '9', '2', '10.00');
INSERT INTO `bill_sp_fact` VALUES ('41', '5', '1', '88.00');
INSERT INTO `bill_sp_fact` VALUES ('41', '5', '2', '88.00');
INSERT INTO `bill_sp_fact` VALUES ('41', '10', '1', '15.00');
INSERT INTO `bill_sp_fact` VALUES ('41', '10', '2', '15.00');
INSERT INTO `bill_sp_fact` VALUES ('42', '5', '1', '88.00');
INSERT INTO `bill_sp_fact` VALUES ('42', '5', '2', '88.00');
INSERT INTO `bill_sp_fact` VALUES ('42', '10', '1', '15.00');
INSERT INTO `bill_sp_fact` VALUES ('42', '10', '2', '15.00');
INSERT INTO `bill_sp_fact` VALUES ('43', '5', '1', '88.00');
INSERT INTO `bill_sp_fact` VALUES ('43', '5', '2', '88.00');
INSERT INTO `bill_sp_fact` VALUES ('43', '10', '1', '15.00');
INSERT INTO `bill_sp_fact` VALUES ('43', '10', '2', '15.00');
INSERT INTO `bill_sp_fact` VALUES ('44', '5', '1', '88.00');
INSERT INTO `bill_sp_fact` VALUES ('44', '5', '2', '88.00');
INSERT INTO `bill_sp_fact` VALUES ('44', '10', '1', '15.00');
INSERT INTO `bill_sp_fact` VALUES ('44', '10', '2', '15.00');
INSERT INTO `bill_sp_fact` VALUES ('45', '5', '1', '88.00');
INSERT INTO `bill_sp_fact` VALUES ('45', '5', '2', '88.00');
INSERT INTO `bill_sp_fact` VALUES ('45', '10', '1', '15.00');
INSERT INTO `bill_sp_fact` VALUES ('45', '10', '2', '15.00');
INSERT INTO `bill_sp_fact` VALUES ('46', '5', '1', '88.00');
INSERT INTO `bill_sp_fact` VALUES ('46', '5', '2', '88.00');
INSERT INTO `bill_sp_fact` VALUES ('46', '10', '1', '15.00');
INSERT INTO `bill_sp_fact` VALUES ('46', '10', '2', '15.00');
INSERT INTO `bill_sp_fact` VALUES ('47', '5', '1', '88.00');
INSERT INTO `bill_sp_fact` VALUES ('47', '5', '2', '88.00');
INSERT INTO `bill_sp_fact` VALUES ('47', '10', '1', '15.00');
INSERT INTO `bill_sp_fact` VALUES ('47', '10', '2', '15.00');
INSERT INTO `bill_sp_fact` VALUES ('48', '5', '1', '88.00');
INSERT INTO `bill_sp_fact` VALUES ('48', '5', '2', '88.00');
INSERT INTO `bill_sp_fact` VALUES ('48', '10', '1', '15.00');
INSERT INTO `bill_sp_fact` VALUES ('48', '10', '2', '15.00');
INSERT INTO `bill_sp_fact` VALUES ('49', '5', '1', '88.00');
INSERT INTO `bill_sp_fact` VALUES ('49', '5', '2', '88.00');
INSERT INTO `bill_sp_fact` VALUES ('49', '10', '1', '15.00');
INSERT INTO `bill_sp_fact` VALUES ('49', '10', '2', '15.00');
INSERT INTO `bill_sp_fact` VALUES ('50', '5', '1', '88.00');
INSERT INTO `bill_sp_fact` VALUES ('50', '5', '2', '88.00');
INSERT INTO `bill_sp_fact` VALUES ('50', '10', '1', '15.00');
INSERT INTO `bill_sp_fact` VALUES ('50', '10', '2', '15.00');

-- ----------------------------
-- Table structure for `bill_sp_fact_1`
-- ----------------------------
DROP TABLE IF EXISTS `bill_sp_fact_1`;
CREATE TABLE `bill_sp_fact_1` (
  `sp_cost` int(11) NOT NULL,
  `total_bill_money` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bill_sp_fact_1
-- ----------------------------
INSERT INTO `bill_sp_fact_1` VALUES ('10', '400.00');
INSERT INTO `bill_sp_fact_1` VALUES ('15', '300.00');
INSERT INTO `bill_sp_fact_1` VALUES ('28', '1120.00');
INSERT INTO `bill_sp_fact_1` VALUES ('30', '600.00');
INSERT INTO `bill_sp_fact_1` VALUES ('38', '760.00');
INSERT INTO `bill_sp_fact_1` VALUES ('50', '1000.00');
INSERT INTO `bill_sp_fact_1` VALUES ('58', '1160.00');
INSERT INTO `bill_sp_fact_1` VALUES ('88', '1760.00');

-- ----------------------------
-- Table structure for `bill_sp_fact_2`
-- ----------------------------
DROP TABLE IF EXISTS `bill_sp_fact_2`;
CREATE TABLE `bill_sp_fact_2` (
  `month` int(11) NOT NULL,
  `total_bill_money` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bill_sp_fact_2
-- ----------------------------
INSERT INTO `bill_sp_fact_2` VALUES ('1', '3550.00');
INSERT INTO `bill_sp_fact_2` VALUES ('12', '3550.00');

-- ----------------------------
-- Table structure for `card_dim`
-- ----------------------------
DROP TABLE IF EXISTS `card_dim`;
CREATE TABLE `card_dim` (
  `card_sk` int(11) NOT NULL AUTO_INCREMENT,
  `card_num` char(11) NOT NULL,
  `card_client_id` char(10) NOT NULL,
  `card_area_id` char(10) NOT NULL,
  PRIMARY KEY (`card_sk`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of card_dim
-- ----------------------------
INSERT INTO `card_dim` VALUES ('1', '18362920001', 'CLI_000001', 'CIT_000001');
INSERT INTO `card_dim` VALUES ('2', '18362920002', 'CLI_000002', 'CIT_000002');
INSERT INTO `card_dim` VALUES ('3', '18362920003', 'CLI_000003', 'CIT_000003');
INSERT INTO `card_dim` VALUES ('4', '18362920004', 'CLI_000004', 'CIT_000004');
INSERT INTO `card_dim` VALUES ('5', '18362920005', 'CLI_000005', 'CIT_000005');
INSERT INTO `card_dim` VALUES ('6', '18362920006', 'CLI_000006', 'CIT_000001');
INSERT INTO `card_dim` VALUES ('7', '18362920007', 'CLI_000007', 'CIT_000002');
INSERT INTO `card_dim` VALUES ('8', '18362920008', 'CLI_000008', 'CIT_000003');
INSERT INTO `card_dim` VALUES ('9', '18362920009', 'CLI_000009', 'CIT_000004');
INSERT INTO `card_dim` VALUES ('10', '18362920010', 'CLI_000010', 'CIT_000005');
INSERT INTO `card_dim` VALUES ('11', '18362920011', 'CLI_000011', 'CIT_000001');
INSERT INTO `card_dim` VALUES ('12', '18362920012', 'CLI_000012', 'CIT_000002');
INSERT INTO `card_dim` VALUES ('13', '18362920013', 'CLI_000013', 'CIT_000003');
INSERT INTO `card_dim` VALUES ('14', '18362920014', 'CLI_000014', 'CIT_000004');
INSERT INTO `card_dim` VALUES ('15', '18362920015', 'CLI_000015', 'CIT_000005');
INSERT INTO `card_dim` VALUES ('16', '18362920016', 'CLI_000016', 'CIT_000001');
INSERT INTO `card_dim` VALUES ('17', '18362920017', 'CLI_000017', 'CIT_000002');
INSERT INTO `card_dim` VALUES ('18', '18362920018', 'CLI_000018', 'CIT_000003');
INSERT INTO `card_dim` VALUES ('19', '18362920019', 'CLI_000019', 'CIT_000004');
INSERT INTO `card_dim` VALUES ('20', '18362920020', 'CLI_000020', 'CIT_000005');
INSERT INTO `card_dim` VALUES ('21', '18362920021', 'CLI_000021', 'CIT_000001');
INSERT INTO `card_dim` VALUES ('22', '18362920022', 'CLI_000022', 'CIT_000002');
INSERT INTO `card_dim` VALUES ('23', '18362920023', 'CLI_000023', 'CIT_000003');
INSERT INTO `card_dim` VALUES ('24', '18362920024', 'CLI_000024', 'CIT_000004');
INSERT INTO `card_dim` VALUES ('25', '18362920025', 'CLI_000025', 'CIT_000005');
INSERT INTO `card_dim` VALUES ('26', '18362920026', 'CLI_000026', 'CIT_000001');
INSERT INTO `card_dim` VALUES ('27', '18362920027', 'CLI_000027', 'CIT_000002');
INSERT INTO `card_dim` VALUES ('28', '18362920028', 'CLI_000028', 'CIT_000003');
INSERT INTO `card_dim` VALUES ('29', '18362920029', 'CLI_000029', 'CIT_000004');
INSERT INTO `card_dim` VALUES ('30', '18362920030', 'CLI_000030', 'CIT_000005');
INSERT INTO `card_dim` VALUES ('31', '18362920031', 'CLI_000031', 'CIT_000001');
INSERT INTO `card_dim` VALUES ('32', '18362920032', 'CLI_000032', 'CIT_000002');
INSERT INTO `card_dim` VALUES ('33', '18362920033', 'CLI_000033', 'CIT_000003');
INSERT INTO `card_dim` VALUES ('34', '18362920034', 'CLI_000034', 'CIT_000004');
INSERT INTO `card_dim` VALUES ('35', '18362920035', 'CLI_000035', 'CIT_000005');
INSERT INTO `card_dim` VALUES ('36', '18362920036', 'CLI_000036', 'CIT_000001');
INSERT INTO `card_dim` VALUES ('37', '18362920037', 'CLI_000037', 'CIT_000002');
INSERT INTO `card_dim` VALUES ('38', '18362920038', 'CLI_000038', 'CIT_000003');
INSERT INTO `card_dim` VALUES ('39', '18362920039', 'CLI_000039', 'CIT_000004');
INSERT INTO `card_dim` VALUES ('40', '18362920040', 'CLI_000040', 'CIT_000005');
INSERT INTO `card_dim` VALUES ('41', '18362920041', 'CLI_000041', 'CIT_000001');
INSERT INTO `card_dim` VALUES ('42', '18362920042', 'CLI_000042', 'CIT_000002');
INSERT INTO `card_dim` VALUES ('43', '18362920043', 'CLI_000043', 'CIT_000003');
INSERT INTO `card_dim` VALUES ('44', '18362920044', 'CLI_000044', 'CIT_000004');
INSERT INTO `card_dim` VALUES ('45', '18362920045', 'CLI_000045', 'CIT_000005');
INSERT INTO `card_dim` VALUES ('46', '18362920046', 'CLI_000046', 'CIT_000001');
INSERT INTO `card_dim` VALUES ('47', '18362920047', 'CLI_000047', 'CIT_000002');
INSERT INTO `card_dim` VALUES ('48', '18362920048', 'CLI_000048', 'CIT_000003');
INSERT INTO `card_dim` VALUES ('49', '18362920049', 'CLI_000049', 'CIT_000004');
INSERT INTO `card_dim` VALUES ('50', '18362920050', 'CLI_000050', 'CIT_000005');

-- ----------------------------
-- Table structure for `client_dim`
-- ----------------------------
DROP TABLE IF EXISTS `client_dim`;
CREATE TABLE `client_dim` (
  `client_id` char(10) NOT NULL,
  `client_name` varchar(20) NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client_dim
-- ----------------------------
INSERT INTO `client_dim` VALUES ('CLI_000001', '王静');
INSERT INTO `client_dim` VALUES ('CLI_000002', '王伟');
INSERT INTO `client_dim` VALUES ('CLI_000003', '王芳');
INSERT INTO `client_dim` VALUES ('CLI_000004', '王军');
INSERT INTO `client_dim` VALUES ('CLI_000005', '王娜');
INSERT INTO `client_dim` VALUES ('CLI_000006', '王敏');
INSERT INTO `client_dim` VALUES ('CLI_000007', '王杰');
INSERT INTO `client_dim` VALUES ('CLI_000008', '王斌');
INSERT INTO `client_dim` VALUES ('CLI_000009', '王坤');
INSERT INTO `client_dim` VALUES ('CLI_000010', '王颖');
INSERT INTO `client_dim` VALUES ('CLI_000011', '张静');
INSERT INTO `client_dim` VALUES ('CLI_000012', '张伟');
INSERT INTO `client_dim` VALUES ('CLI_000013', '张芳');
INSERT INTO `client_dim` VALUES ('CLI_000014', '张军');
INSERT INTO `client_dim` VALUES ('CLI_000015', '张娜');
INSERT INTO `client_dim` VALUES ('CLI_000016', '张敏');
INSERT INTO `client_dim` VALUES ('CLI_000017', '张杰');
INSERT INTO `client_dim` VALUES ('CLI_000018', '张斌');
INSERT INTO `client_dim` VALUES ('CLI_000019', '张坤');
INSERT INTO `client_dim` VALUES ('CLI_000020', '张颖');
INSERT INTO `client_dim` VALUES ('CLI_000021', '李静');
INSERT INTO `client_dim` VALUES ('CLI_000022', '李伟');
INSERT INTO `client_dim` VALUES ('CLI_000023', '李芳');
INSERT INTO `client_dim` VALUES ('CLI_000024', '李军');
INSERT INTO `client_dim` VALUES ('CLI_000025', '李娜');
INSERT INTO `client_dim` VALUES ('CLI_000026', '李敏');
INSERT INTO `client_dim` VALUES ('CLI_000027', '李杰');
INSERT INTO `client_dim` VALUES ('CLI_000028', '李斌');
INSERT INTO `client_dim` VALUES ('CLI_000029', '李坤');
INSERT INTO `client_dim` VALUES ('CLI_000030', '李颖');
INSERT INTO `client_dim` VALUES ('CLI_000031', '刘静');
INSERT INTO `client_dim` VALUES ('CLI_000032', '刘伟');
INSERT INTO `client_dim` VALUES ('CLI_000033', '刘芳');
INSERT INTO `client_dim` VALUES ('CLI_000034', '刘军');
INSERT INTO `client_dim` VALUES ('CLI_000035', '刘娜');
INSERT INTO `client_dim` VALUES ('CLI_000036', '刘敏');
INSERT INTO `client_dim` VALUES ('CLI_000037', '刘杰');
INSERT INTO `client_dim` VALUES ('CLI_000038', '刘斌');
INSERT INTO `client_dim` VALUES ('CLI_000039', '刘坤');
INSERT INTO `client_dim` VALUES ('CLI_000040', '刘颖');
INSERT INTO `client_dim` VALUES ('CLI_000041', '孙静');
INSERT INTO `client_dim` VALUES ('CLI_000042', '孙伟');
INSERT INTO `client_dim` VALUES ('CLI_000043', '孙芳');
INSERT INTO `client_dim` VALUES ('CLI_000044', '孙军');
INSERT INTO `client_dim` VALUES ('CLI_000045', '孙娜');
INSERT INTO `client_dim` VALUES ('CLI_000046', '孙敏');
INSERT INTO `client_dim` VALUES ('CLI_000047', '孙杰');
INSERT INTO `client_dim` VALUES ('CLI_000048', '孙斌');
INSERT INTO `client_dim` VALUES ('CLI_000049', '孙坤');
INSERT INTO `client_dim` VALUES ('CLI_000050', '孙颖');

-- ----------------------------
-- Table structure for `sp_dim`
-- ----------------------------
DROP TABLE IF EXISTS `sp_dim`;
CREATE TABLE `sp_dim` (
  `sp_sk` int(11) NOT NULL AUTO_INCREMENT,
  `sp_id` char(10) NOT NULL,
  `sp_type` tinyint(4) NOT NULL,
  `sp_cost` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sp_sk`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_dim
-- ----------------------------
INSERT INTO `sp_dim` VALUES ('1', 'PLA_000001', '11', '28');
INSERT INTO `sp_dim` VALUES ('2', 'PLA_000002', '12', '38');
INSERT INTO `sp_dim` VALUES ('3', 'PLA_000003', '13', '28');
INSERT INTO `sp_dim` VALUES ('4', 'PLA_000004', '14', '58');
INSERT INTO `sp_dim` VALUES ('5', 'PLA_000005', '15', '88');
INSERT INTO `sp_dim` VALUES ('6', 'SER_000001', '1', '10');
INSERT INTO `sp_dim` VALUES ('7', 'SER_000002', '1', '30');
INSERT INTO `sp_dim` VALUES ('8', 'SER_000003', '1', '50');
INSERT INTO `sp_dim` VALUES ('9', 'SER_000004', '2', '10');
INSERT INTO `sp_dim` VALUES ('10', 'SER_000005', '2', '15');

-- ----------------------------
-- Table structure for `time_dim`
-- ----------------------------
DROP TABLE IF EXISTS `time_dim`;
CREATE TABLE `time_dim` (
  `time_sk` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `day` date NOT NULL,
  `month` int(1) NOT NULL,
  `quarter` int(1) NOT NULL,
  `year` int(4) NOT NULL,
  PRIMARY KEY (`time_sk`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of time_dim
-- ----------------------------
INSERT INTO `time_dim` VALUES ('1', '2016-12-31 23:59:59', '2016-12-31', '12', '4', '2016');
INSERT INTO `time_dim` VALUES ('2', '2017-01-31 23:59:59', '2017-01-31', '1', '1', '2017');
