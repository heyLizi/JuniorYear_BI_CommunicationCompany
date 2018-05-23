/*
Navicat MySQL Data Transfer

Source Server         : Test
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : star_model_dw

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-02-24 18:25:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `area_dim`
-- ----------------------------
DROP TABLE IF EXISTS `area_dim`;
CREATE TABLE `area_dim` (
  `area_sk` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(50) NOT NULL,
  `province` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `district` varchar(20) NOT NULL,
  `effective_date` date NOT NULL,
  PRIMARY KEY (`area_sk`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of area_dim
-- ----------------------------
INSERT INTO `area_dim` VALUES ('1', '北京市海淀区美景家园14栋1603', '北京市', '北京市', '海淀区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('2', '广东省深圳市宝安区彩虹小区1栋401', '广东省', '深圳市', '宝安区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('3', '上海市黄浦区伟杰写字楼1202', '上海市', '上海市', '黄浦区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('4', '天津市河东区黑牛城小区8栋105', '天津市', '天津市', '河东区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('5', '重庆市江北区碧馨苑2栋602', '重庆市', '重庆市', '江北区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('6', '江苏省南京市鼓楼区新世界商厦A座1201', '江苏省', '南京市', '鼓楼区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('7', '北京市朝阳区信阳商务楼A座4202', '北京市', '北京市', '朝阳区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('8', '上海市静安区诚善大厦A座503', '上海市', '上海市', '静安区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('9', '陕西省西安市碑林区星港小区23栋103', '陕西省', '西安市', '碑林区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('10', '广东省深圳市罗湖区金灿写字楼1105', '广东省', '深圳市', '罗湖区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('11', '重庆市双桥区彩虹居17栋203', '重庆市', '重庆市', '双桥区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('12', '天津市河北区新通商厦D座602', '天津市', '天津市', '河北区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('13', '北京市东城区花沛写字楼1207', '北京市', '北京市', '东城区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('14', '江苏省南京市栖霞区彩虹写字楼C座602', '江苏省', '南京市', '栖霞区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('15', '广东省深圳市福田区崇安里17栋303', '广东省', '深圳市', '福田区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('16', '陕西省西安市莲湖区华沙写字楼4101', '陕西省', '西安市', '莲湖区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('17', '上海市浦东区外贸商厦4003', '上海市', '上海市', '浦东区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('18', '北京市丰台区翠微大厦2601', '北京市', '北京市', '丰台区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('19', '北京市昌平县南华街小区5栋502', '北京市', '北京市', '昌平县', '2017-01-30');
INSERT INTO `area_dim` VALUES ('20', '重庆市渝北区伊栗大厦C座1101', '重庆市', '重庆市', '渝北区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('21', '天津市和平区聚宝大厦4501', '天津市', '天津市', '和平区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('22', '江苏省南京市玄武区仁恒写字楼205', '江苏省', '南京市', '玄武区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('23', '北京市东城区夕阳里3栋2601', '北京市', '北京市', '东城区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('24', '陕西省西安市临潼区树桦花园2栋202', '陕西省', '西安市', '临潼区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('25', '上海市奉贤区宜静小区26栋302', '上海市', '上海市', '奉贤区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('26', '天津市南开区汇德小区9栋602', '天津市', '天津市', '南开区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('27', '重庆市巴南区新联合大厦3702', '重庆市', '重庆市', '巴南区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('28', '北京市西城区世界商厦2805', '北京市', '北京市', '西城区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('29', '江苏省南京市六合区创汇大厦D座702', '江苏省', '南京市', '六合区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('30', '江苏省苏州市太仓区美景家园14栋1603', '江苏省', '苏州市', '太仓区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('31', '上海市徐汇区尊礼写字楼1612', '上海市', '上海市', '徐汇区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('32', '陕西省西安市雁塔区东旭大厦1303', '陕西省', '西安市', '雁塔区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('33', '广东省深圳市盐田区华侨小区9栋2103', '广东省', '深圳市', '盐田区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('34', '重庆市九龙坡区巨力小区16栋103', '重庆市', '重庆市', '九龙坡', '2017-01-30');
INSERT INTO `area_dim` VALUES ('35', '天津市滨海新区贻静园5栋402', '天津市', '天津市', '滨海新', '2017-01-30');
INSERT INTO `area_dim` VALUES ('36', '江苏省南京市白下区龙腾园20栋403', '江苏省', '南京市', '白下区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('37', '重庆市涪陵区宁馨写字楼1801', '重庆市', '重庆市', '涪陵区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('38', '广东省深圳市龙岗区纳福商厦B座1501', '广东省', '深圳市', '龙岗区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('39', '陕西省西安市灞桥区港深大厦4602', '陕西省', '西安市', '灞桥区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('40', '天津市红桥区香榭丽舍大厦B座703', '天津市', '天津市', '红桥区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('41', '上海市卢湾区幸福小区4栋802', '上海市', '上海市', '卢湾区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('42', '江苏省南京市建邺区元宝商厦A座3513', '江苏省', '南京市', '建邺区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('43', '广东省深圳市南山区西江小区19栋503', '广东省', '深圳市', '南山区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('44', '重庆市渝中区万里写字楼3612', '重庆市', '重庆市', '渝中区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('45', '天津市河西区荷花园4栋101', '天津市', '天津市', '河西区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('46', '上海市长宁区金辉写字楼A座1601', '上海市', '上海市', '长宁区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('47', '江苏省南京市秦淮区秦淮大厦202', '江苏省', '南京市', '秦淮区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('48', '广东省深圳市罗湖区精英写字楼C座1002', '广东省', '深圳市', '罗湖区', '2017-01-30');
INSERT INTO `area_dim` VALUES ('49', '重庆市大渡口区景湾大厦403', '重庆市', '重庆市', '大渡口', '2017-01-30');
INSERT INTO `area_dim` VALUES ('50', '北京市房山区春兰园1栋1903', '北京市', '北京市', '房山区', '2017-01-30');

-- ----------------------------
-- Table structure for `customer_dim`
-- ----------------------------
DROP TABLE IF EXISTS `customer_dim`;
CREATE TABLE `customer_dim` (
  `customer_sk` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` char(10) NOT NULL,
  `customer_mobile` char(11) NOT NULL,
  `effective_date` date NOT NULL,
  PRIMARY KEY (`customer_sk`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_dim
-- ----------------------------
INSERT INTO `customer_dim` VALUES ('1', 'CUS_000001', '18362925001', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('2', 'CUS_000002', '18362925002', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('3', 'CUS_000003', '18362925003', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('4', 'CUS_000004', '18362925004', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('5', 'CUS_000005', '18362925005', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('6', 'CUS_000006', '18362925006', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('7', 'CUS_000007', '18362925007', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('8', 'CUS_000008', '18362925008', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('9', 'CUS_000009', '18362925009', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('10', 'CUS_000010', '18362925010', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('11', 'CUS_000011', '18362925011', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('12', 'CUS_000012', '18362925012', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('13', 'CUS_000013', '18362925013', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('14', 'CUS_000014', '18362925014', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('15', 'CUS_000015', '18362925015', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('16', 'CUS_000016', '18362925016', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('17', 'CUS_000017', '18362925017', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('18', 'CUS_000018', '18362925018', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('19', 'CUS_000019', '18362925019', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('20', 'CUS_000020', '18362925020', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('21', 'CUS_000021', '18362925021', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('22', 'CUS_000022', '18362925022', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('23', 'CUS_000023', '18362925023', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('24', 'CUS_000024', '18362925024', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('25', 'CUS_000025', '18362925025', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('26', 'CUS_000026', '18362925026', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('27', 'CUS_000027', '18362925027', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('28', 'CUS_000028', '18362925028', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('29', 'CUS_000029', '18362925029', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('30', 'CUS_000030', '18362925030', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('31', 'CUS_000031', '18362925031', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('32', 'CUS_000032', '18362925032', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('33', 'CUS_000033', '18362925033', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('34', 'CUS_000034', '18362925034', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('35', 'CUS_000035', '18362925035', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('36', 'CUS_000036', '18362925036', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('37', 'CUS_000037', '18362925037', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('38', 'CUS_000038', '18362925038', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('39', 'CUS_000039', '18362925039', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('40', 'CUS_000040', '18362925040', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('41', 'CUS_000041', '18362925041', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('42', 'CUS_000042', '18362925042', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('43', 'CUS_000043', '18362925043', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('44', 'CUS_000044', '18362925044', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('45', 'CUS_000045', '18362925045', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('46', 'CUS_000046', '18362925046', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('47', 'CUS_000047', '18362925047', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('48', 'CUS_000048', '18362925048', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('49', 'CUS_000049', '18362925049', '2017-01-30');
INSERT INTO `customer_dim` VALUES ('50', 'CUS_000050', '18362925050', '2017-01-30');

-- ----------------------------
-- Table structure for `product_dim`
-- ----------------------------
DROP TABLE IF EXISTS `product_dim`;
CREATE TABLE `product_dim` (
  `product_sk` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` char(10) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_brand_id` char(10) NOT NULL,
  `product_brand_name` varchar(20) NOT NULL,
  `product_type` tinyint(4) NOT NULL,
  `product_cost` decimal(8,2) NOT NULL,
  `effective_date` date NOT NULL,
  PRIMARY KEY (`product_sk`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_dim
-- ----------------------------
INSERT INTO `product_dim` VALUES ('1', 'PROD_00001', 'iPhone7 Plus 128G', 'BRA_000001', '苹果', '1', '7199.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('2', 'PROD_00002', 'iPhone7 128G', 'BRA_000001', '苹果', '1', '5999.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('3', 'PROD_00003', 'iPhone6s Plus 64G', 'BRA_000001', '苹果', '1', '5888.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('4', 'PROD_00004', 'iPhone6s Plus 32G', 'BRA_000001', '苹果', '1', '5388.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('5', 'PROD_00005', 'Galaxy S7 32G', 'BRA_000002', '三星', '1', '3588.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('6', 'PROD_00006', 'Galaxy C7 32G', 'BRA_000002', '三星', '1', '2388.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('7', 'PROD_00007', 'Galaxy C9 Pro 32G', 'BRA_000002', '三星', '1', '3199.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('8', 'PROD_00008', 'Galaxy C5 32G', 'BRA_000002', '三星', '1', '1999.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('9', 'PROD_00009', '小米5s Plus', 'BRA_000003', '小米', '1', '2299.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('10', 'PROD_00010', '小米5s 64G', 'BRA_000003', '小米', '1', '1999.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('11', 'PROD_00011', '红米 64G', 'BRA_000003', '小米', '1', '1349.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('12', 'PROD_00012', '小米Max 64G', 'BRA_000003', '小米', '1', '1499.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('13', 'PROD_00013', '华为Mate9 64G', 'BRA_000004', '华为', '1', '3899.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('14', 'PROD_00014', '华为Nova 64G', 'BRA_000004', '华为', '1', '2399.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('15', 'PROD_00015', '华为P9 64G', 'BRA_000004', '华为', '1', '3388.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('16', 'PROD_00016', '华为畅想6s 32G', 'BRA_000004', '华为', '1', '1499.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('17', 'PROD_00017', 'OPPO R9s 64G', 'BRA_000005', 'OPPO', '1', '2799.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('18', 'PROD_00018', 'OPPO R9s Plus 64G', 'BRA_000005', 'OPPO', '1', '3499.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('19', 'PROD_00019', 'OPPO A57 32G', 'BRA_000005', 'OPPO', '1', '1599.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('20', 'PROD_00020', 'OPPO A59s 32G', 'BRA_000005', 'OPPO', '1', '1999.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('21', 'PROD_00021', '荣耀 畅玩5 16G', 'BRA_000006', '荣耀', '1', '599.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('22', 'PROD_00022', '荣耀 畅玩5A 16G', 'BRA_000006', '荣耀', '1', '799.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('23', 'PROD_00023', '荣耀 畅玩5C 16G', 'BRA_000006', '荣耀', '1', '899.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('24', 'PROD_00024', '荣耀 畅玩5S 16G', 'BRA_000006', '荣耀', '1', '999.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('25', 'PROD_00025', '联想 Zuk Pro 128G', 'BRA_000007', '联想', '1', '2099.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('26', 'PROD_00026', '联想 Zuk Edge 64G', 'BRA_000007', '联想', '1', '2499.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('27', 'PROD_00027', '联想 Moto Z 128G', 'BRA_000007', '联想', '1', '3999.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('28', 'PROD_00028', '联想 Zuk Z2 3 32G', 'BRA_000007', '联想', '1', '1199.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('29', 'PROD_00029', '魅族 MX6 32G', 'BRA_000008', '魅族', '1', '1799.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('30', 'PROD_00030', '魅蓝 Note5 32G', 'BRA_000008', '魅族', '1', '1099.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('31', 'PROD_00031', '魅蓝 X 32G', 'BRA_000008', '魅族', '1', '1699.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('32', 'PROD_00032', '魅蓝 Max 64G', 'BRA_000008', '魅族', '1', '1799.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('33', 'PROD_00033', 'VIVO X9 64G', 'BRA_000009', 'VIVO', '1', '2798.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('34', 'PROD_00034', 'VIVO X9 Plus 64G', 'BRA_000009', 'VIVO', '1', '3498.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('35', 'PROD_00035', 'VIVO Y67 32G', 'BRA_000009', 'VIVO', '1', '1798.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('36', 'PROD_00036', 'VIVO Y66 32G', 'BRA_000009', 'VIVO', '1', '1698.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('37', 'PROD_00037', 'Nokia 6 64G', 'BRA_000010', '诺基亚', '1', '1999.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('38', 'PROD_00038', 'Nokia 130 DS 2G', 'BRA_000010', '诺基亚', '1', '185.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('39', 'PROD_00039', 'Nokia 105 2G', 'BRA_000010', '诺基亚', '1', '239.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('40', 'PROD_00040', 'Nokia 225 2G', 'BRA_000010', '诺基亚', '1', '499.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('41', 'PROD_00041', '苹果原装数据线', 'BRA_000001', '苹果', '2', '76.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('42', 'PROD_00042', '苹果原装手机电池', 'BRA_000001', '苹果', '2', '148.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('43', 'PROD_00043', '三星原装数据线', 'BRA_000002', '三星', '2', '39.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('44', 'PROD_00044', '三星原装手机电池', 'BRA_000002', '三星', '2', '79.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('45', 'PROD_00045', '小米入耳式耳机', 'BRA_000003', '小米', '2', '109.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('46', 'PROD_00046', '小米移动电源10000mAh', 'BRA_000003', '小米', '2', '149.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('47', 'PROD_00047', '华为原装充电器', 'BRA_000004', '华为', '2', '89.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('48', 'PROD_00048', '华为原装防缠绕耳机', 'BRA_000004', '华为', '2', '99.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('49', 'PROD_00049', 'OPPO原装充电器', 'BRA_000005', 'OPPO', '2', '79.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('50', 'PROD_00050', 'OPPO原装手机电池', 'BRA_000005', 'OPPO', '2', '96.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('51', 'PROD_00051', '荣耀移动电源', 'BRA_000006', '荣耀', '2', '129.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('52', 'PROD_00052', '荣耀原装充电器', 'BRA_000006', '荣耀', '2', '89.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('53', 'PROD_00053', '联想原装充电器', 'BRA_000007', '联想', '2', '88.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('54', 'PROD_00054', '联想原装手机电池', 'BRA_000007', '联想', '2', '69.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('55', 'PROD_00055', '魅族磁吸入耳式耳机', 'BRA_000008', '魅族', '2', '269.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('56', 'PROD_00056', '魅族快充移动电源', 'BRA_000008', '魅族', '2', '129.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('57', 'PROD_00057', 'VIVO原装数据线', 'BRA_000009', 'VIVO', '2', '19.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('58', 'PROD_00058', 'VIVO原装入耳式耳机', 'BRA_000009', 'VIVO', '2', '29.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('59', 'PROD_00059', 'Nokia原装充电器', 'BRA_000010', '诺基亚', '2', '39.00', '2017-01-30');
INSERT INTO `product_dim` VALUES ('60', 'PROD_00060', 'Nokia原装手机电池', 'BRA_000010', '诺基亚', '2', '49.00', '2017-01-30');

-- ----------------------------
-- Table structure for `sale_fact`
-- ----------------------------
DROP TABLE IF EXISTS `sale_fact`;
CREATE TABLE `sale_fact` (
  `customer_sk` int(11) NOT NULL,
  `product_sk` int(11) NOT NULL,
  `time_sk` int(11) NOT NULL,
  `area_sk` int(11) NOT NULL,
  `sale_money` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale_fact
-- ----------------------------
INSERT INTO `sale_fact` VALUES ('18', '1', '3', '3', '7199.00');
INSERT INTO `sale_fact` VALUES ('26', '2', '4', '4', '5999.00');
INSERT INTO `sale_fact` VALUES ('10', '2', '8', '8', '5999.00');
INSERT INTO `sale_fact` VALUES ('4', '2', '29', '29', '5999.00');
INSERT INTO `sale_fact` VALUES ('28', '3', '19', '19', '5888.00');
INSERT INTO `sale_fact` VALUES ('46', '4', '24', '24', '5388.00');
INSERT INTO `sale_fact` VALUES ('25', '8', '40', '40', '1999.00');
INSERT INTO `sale_fact` VALUES ('32', '9', '2', '2', '2299.00');
INSERT INTO `sale_fact` VALUES ('45', '11', '46', '46', '1349.00');
INSERT INTO `sale_fact` VALUES ('15', '13', '28', '28', '3899.00');
INSERT INTO `sale_fact` VALUES ('14', '13', '33', '33', '3899.00');
INSERT INTO `sale_fact` VALUES ('45', '15', '10', '10', '3388.00');
INSERT INTO `sale_fact` VALUES ('36', '15', '34', '34', '3388.00');
INSERT INTO `sale_fact` VALUES ('6', '17', '1', '1', '2799.00');
INSERT INTO `sale_fact` VALUES ('24', '18', '7', '7', '3499.00');
INSERT INTO `sale_fact` VALUES ('31', '18', '47', '47', '3499.00');
INSERT INTO `sale_fact` VALUES ('8', '19', '49', '49', '1599.00');
INSERT INTO `sale_fact` VALUES ('9', '20', '14', '14', '1999.00');
INSERT INTO `sale_fact` VALUES ('23', '20', '27', '27', '1999.00');
INSERT INTO `sale_fact` VALUES ('16', '23', '21', '21', '899.00');
INSERT INTO `sale_fact` VALUES ('48', '23', '31', '31', '899.00');
INSERT INTO `sale_fact` VALUES ('50', '23', '45', '45', '899.00');
INSERT INTO `sale_fact` VALUES ('31', '24', '9', '9', '999.00');
INSERT INTO `sale_fact` VALUES ('40', '25', '18', '18', '2099.00');
INSERT INTO `sale_fact` VALUES ('3', '26', '6', '6', '2499.00');
INSERT INTO `sale_fact` VALUES ('35', '26', '20', '20', '2499.00');
INSERT INTO `sale_fact` VALUES ('17', '26', '25', '25', '2499.00');
INSERT INTO `sale_fact` VALUES ('49', '27', '43', '43', '3999.00');
INSERT INTO `sale_fact` VALUES ('32', '28', '32', '32', '1199.00');
INSERT INTO `sale_fact` VALUES ('50', '31', '15', '15', '1699.00');
INSERT INTO `sale_fact` VALUES ('38', '32', '23', '23', '1799.00');
INSERT INTO `sale_fact` VALUES ('46', '32', '41', '41', '1799.00');
INSERT INTO `sale_fact` VALUES ('41', '35', '5', '5', '1798.00');
INSERT INTO `sale_fact` VALUES ('5', '35', '35', '35', '1798.00');
INSERT INTO `sale_fact` VALUES ('27', '35', '44', '44', '1798.00');
INSERT INTO `sale_fact` VALUES ('19', '36', '17', '17', '1698.00');
INSERT INTO `sale_fact` VALUES ('2', '37', '22', '22', '1999.00');
INSERT INTO `sale_fact` VALUES ('26', '37', '36', '36', '1999.00');
INSERT INTO `sale_fact` VALUES ('27', '39', '12', '12', '239.00');
INSERT INTO `sale_fact` VALUES ('46', '41', '48', '48', '76.00');
INSERT INTO `sale_fact` VALUES ('1', '42', '16', '16', '148.00');
INSERT INTO `sale_fact` VALUES ('14', '45', '39', '39', '109.00');
INSERT INTO `sale_fact` VALUES ('33', '46', '11', '11', '149.00');
INSERT INTO `sale_fact` VALUES ('39', '46', '30', '30', '149.00');
INSERT INTO `sale_fact` VALUES ('34', '46', '37', '37', '149.00');
INSERT INTO `sale_fact` VALUES ('20', '51', '38', '38', '129.00');
INSERT INTO `sale_fact` VALUES ('30', '52', '26', '26', '89.00');
INSERT INTO `sale_fact` VALUES ('37', '53', '42', '42', '88.00');
INSERT INTO `sale_fact` VALUES ('12', '57', '13', '13', '19.00');
INSERT INTO `sale_fact` VALUES ('23', '58', '50', '50', '29.00');

-- ----------------------------
-- Table structure for `sale_fact_1`
-- ----------------------------
DROP TABLE IF EXISTS `sale_fact_1`;
CREATE TABLE `sale_fact_1` (
  `product_brand_id` char(10) NOT NULL,
  `product_brand_name` varchar(20) NOT NULL,
  `total_sale_money` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale_fact_1
-- ----------------------------
INSERT INTO `sale_fact_1` VALUES ('BRA_000001', '苹果', '36696.00');
INSERT INTO `sale_fact_1` VALUES ('BRA_000002', '三星', '1999.00');
INSERT INTO `sale_fact_1` VALUES ('BRA_000003', '小米', '4204.00');
INSERT INTO `sale_fact_1` VALUES ('BRA_000004', '华为', '14574.00');
INSERT INTO `sale_fact_1` VALUES ('BRA_000005', 'OPPO', '15394.00');
INSERT INTO `sale_fact_1` VALUES ('BRA_000006', '荣耀', '3914.00');
INSERT INTO `sale_fact_1` VALUES ('BRA_000007', '联想', '14882.00');
INSERT INTO `sale_fact_1` VALUES ('BRA_000008', '魅族', '5297.00');
INSERT INTO `sale_fact_1` VALUES ('BRA_000009', 'VIVO', '7140.00');
INSERT INTO `sale_fact_1` VALUES ('BRA_000010', '诺基亚', '4237.00');

-- ----------------------------
-- Table structure for `sale_fact_2`
-- ----------------------------
DROP TABLE IF EXISTS `sale_fact_2`;
CREATE TABLE `sale_fact_2` (
  `day_of_week` tinyint(4) NOT NULL,
  `total_sale_money` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale_fact_2
-- ----------------------------
INSERT INTO `sale_fact_2` VALUES ('1', '15996.00');
INSERT INTO `sale_fact_2` VALUES ('2', '12539.00');
INSERT INTO `sale_fact_2` VALUES ('3', '19581.00');
INSERT INTO `sale_fact_2` VALUES ('4', '10862.00');
INSERT INTO `sale_fact_2` VALUES ('5', '11204.00');
INSERT INTO `sale_fact_2` VALUES ('6', '25931.00');
INSERT INTO `sale_fact_2` VALUES ('7', '12224.00');

-- ----------------------------
-- Table structure for `sale_fact_3`
-- ----------------------------
DROP TABLE IF EXISTS `sale_fact_3`;
CREATE TABLE `sale_fact_3` (
  `province` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `total_sale_money` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale_fact_3
-- ----------------------------
INSERT INTO `sale_fact_3` VALUES ('上海市', '上海市', '21442.00');
INSERT INTO `sale_fact_3` VALUES ('北京市', '北京市', '20031.00');
INSERT INTO `sale_fact_3` VALUES ('江苏省', '南京市', '18082.00');
INSERT INTO `sale_fact_3` VALUES ('天津市', '天津市', '11922.00');
INSERT INTO `sale_fact_3` VALUES ('广东省', '深圳市', '15489.00');
INSERT INTO `sale_fact_3` VALUES ('江苏省', '苏州市', '149.00');
INSERT INTO `sale_fact_3` VALUES ('陕西省', '西安市', '7843.00');
INSERT INTO `sale_fact_3` VALUES ('重庆市', '重庆市', '13379.00');

-- ----------------------------
-- Table structure for `time_dim`
-- ----------------------------
DROP TABLE IF EXISTS `time_dim`;
CREATE TABLE `time_dim` (
  `time_sk` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `hour` int(1) NOT NULL,
  `day` date NOT NULL,
  `day_of_week` int(1) NOT NULL,
  `day_of_month` int(1) NOT NULL,
  `month` int(1) NOT NULL,
  `quarter` int(1) NOT NULL,
  `year` int(4) NOT NULL,
  `effective_date` date NOT NULL,
  PRIMARY KEY (`time_sk`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of time_dim
-- ----------------------------
INSERT INTO `time_dim` VALUES ('1', '2016-12-20 11:45:04', '11', '2016-12-20', '3', '20', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('2', '2016-12-25 14:21:35', '14', '2016-12-25', '1', '25', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('3', '2017-01-20 23:48:38', '23', '2017-01-20', '6', '20', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('4', '2017-01-01 16:51:20', '16', '2017-01-01', '1', '1', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('5', '2016-12-05 18:42:42', '18', '2016-12-05', '2', '5', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('6', '2017-01-23 09:53:57', '9', '2017-01-23', '2', '23', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('7', '2017-01-12 22:23:27', '22', '2017-01-12', '5', '12', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('8', '2017-01-14 15:09:10', '15', '2017-01-14', '7', '14', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('9', '2017-01-23 12:45:00', '12', '2017-01-23', '2', '23', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('10', '2016-12-14 06:56:08', '6', '2016-12-14', '4', '14', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('11', '2017-01-10 21:39:05', '21', '2017-01-10', '3', '10', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('12', '2016-12-27 19:24:23', '19', '2016-12-27', '3', '27', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('13', '2017-01-23 07:00:12', '7', '2017-01-23', '2', '23', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('14', '2016-12-26 14:36:46', '14', '2016-12-26', '2', '26', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('15', '2016-12-04 10:22:48', '10', '2016-12-04', '1', '4', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('16', '2016-12-21 11:26:59', '11', '2016-12-21', '4', '21', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('17', '2016-12-15 12:48:23', '12', '2016-12-15', '5', '15', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('18', '2017-01-27 04:23:47', '4', '2017-01-27', '6', '27', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('19', '2016-12-07 13:53:19', '13', '2016-12-07', '4', '7', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('20', '2017-01-17 21:29:30', '21', '2017-01-17', '3', '17', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('21', '2017-01-09 18:38:24', '18', '2017-01-09', '2', '9', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('22', '2016-12-22 19:27:38', '19', '2016-12-22', '5', '22', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('23', '2017-01-21 05:05:49', '5', '2017-01-21', '7', '21', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('24', '2017-01-06 20:34:24', '20', '2017-01-06', '6', '6', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('25', '2016-12-31 21:23:46', '21', '2016-12-31', '7', '31', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('26', '2017-01-25 12:53:50', '12', '2017-01-25', '4', '25', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('27', '2016-12-06 14:02:23', '14', '2016-12-06', '3', '6', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('28', '2017-01-20 13:00:52', '13', '2017-01-20', '6', '20', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('29', '2016-12-18 17:24:23', '17', '2016-12-18', '1', '18', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('30', '2017-01-03 21:59:45', '21', '2017-01-03', '3', '3', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('31', '2016-12-12 18:18:22', '18', '2016-12-12', '2', '12', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('32', '2016-12-16 11:26:01', '11', '2016-12-16', '6', '16', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('33', '2017-01-26 12:20:04', '12', '2017-01-26', '5', '26', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('34', '2016-12-20 22:03:26', '22', '2016-12-20', '3', '20', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('35', '2017-01-24 17:48:45', '17', '2017-01-24', '3', '24', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('36', '2016-12-30 16:09:37', '16', '2016-12-30', '6', '30', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('37', '2017-01-20 09:17:26', '9', '2017-01-20', '6', '20', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('38', '2016-12-17 07:42:18', '7', '2016-12-17', '7', '17', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('39', '2017-01-26 17:45:17', '17', '2017-01-26', '5', '26', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('40', '2016-12-06 20:26:04', '20', '2016-12-06', '3', '6', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('41', '2017-01-02 12:50:24', '12', '2017-01-02', '2', '2', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('42', '2016-10-25 21:35:55', '21', '2016-10-25', '3', '25', '10', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('43', '2017-01-20 23:27:23', '23', '2017-01-20', '6', '20', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('44', '2016-12-17 18:34:11', '18', '2016-12-17', '7', '17', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('45', '2016-12-20 23:11:31', '23', '2016-12-20', '3', '20', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('46', '2017-01-25 16:57:05', '16', '2017-01-25', '4', '25', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('47', '2016-12-27 20:23:27', '20', '2016-12-27', '3', '27', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('48', '2017-01-24 15:45:40', '15', '2017-01-24', '3', '24', '1', '1', '2017', '2017-01-30');
INSERT INTO `time_dim` VALUES ('49', '2016-12-05 08:03:58', '8', '2016-12-05', '2', '5', '12', '4', '2016', '2017-01-30');
INSERT INTO `time_dim` VALUES ('50', '2017-01-09 11:57:02', '11', '2017-01-09', '2', '9', '1', '1', '2017', '2017-01-30');

-- ----------------------------
-- Function structure for `SPLIT_STR`
-- ----------------------------
DROP FUNCTION IF EXISTS `SPLIT_STR`;
DELIMITER ;;
CREATE DEFINER=``@`` FUNCTION `SPLIT_STR`( x VARCHAR(255), delim VARCHAR(12), pos INT ) RETURNS varchar(255) CHARSET utf8
RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),        LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),        delim, '')
;;
DELIMITER ;
