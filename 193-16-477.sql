/*
 Navicat Premium Data Transfer

 Source Server         : 193-16-477
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : 193-16-477

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 16/04/2022 14:19:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `CustomerNumber` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CustomerName` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TelephoneNo` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ReturningCustomer` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Notes` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerNumber`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('00127', 'Dave Higgins', '27 Acacia Avenue Upper Farringdon Rutlandshire, R1 877', '0209 888 8888', 'Yes', 'Customer diabetic.');

-- ----------------------------
-- Table structure for customerproduct
-- ----------------------------
DROP TABLE IF EXISTS `customerproduct`;
CREATE TABLE `customerproduct`  (
  `CustomerProductId` int NOT NULL,
  `CustomerNumber` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ProductCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PackageDuration` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LocationCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerProductId`) USING BTREE,
  INDEX `KEY3`(`CustomerNumber`) USING BTREE,
  INDEX `KEY4`(`ProductCode`) USING BTREE,
  INDEX `KEY5`(`LocationCode`) USING BTREE,
  CONSTRAINT `KEY3` FOREIGN KEY (`CustomerNumber`) REFERENCES `customer` (`CustomerNumber`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `KEY4` FOREIGN KEY (`ProductCode`) REFERENCES `product` (`ProductCode`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `KEY5` FOREIGN KEY (`LocationCode`) REFERENCES `location` (`LocationCode`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customerproduct
-- ----------------------------
INSERT INTO `customerproduct` VALUES (1, '00127', '01/2004', '01-06-04 to 17-06-04', 'CUBA');
INSERT INTO `customerproduct` VALUES (2, '00127', 'BTH', NULL, 'STKITTS');
INSERT INTO `customerproduct` VALUES (3, '00127', 'FE', NULL, 'HAW');
INSERT INTO `customerproduct` VALUES (4, '00127', 'AC', NULL, 'NZ');
INSERT INTO `customerproduct` VALUES (5, '00127', '01/2004', '18-06-04 to 29-06-04', 'SARD');
INSERT INTO `customerproduct` VALUES (6, '00127', 'BTH', NULL, 'HAW');

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location`  (
  `LocationCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LocationName` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`LocationCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES ('CUBA', 'Cuba');
INSERT INTO `location` VALUES ('HAW', 'Hawaii');
INSERT INTO `location` VALUES ('NZ', 'New Zealand');
INSERT INTO `location` VALUES ('SARD', 'Sardinia');
INSERT INTO `location` VALUES ('STKITTS', 'St Kitts and Nevis');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `ProductCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProductName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ProductTypeCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LocationCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UnitCost` int NULL DEFAULT NULL,
  `QuantityPurchase` int NULL DEFAULT NULL,
  PRIMARY KEY (`ProductCode`) USING BTREE,
  INDEX `FK1`(`ProductTypeCode`) USING BTREE,
  INDEX `FK2`(`LocationCode`) USING BTREE,
  CONSTRAINT `FK1` FOREIGN KEY (`ProductTypeCode`) REFERENCES `producttype` (`ProductTypeCode`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK2` FOREIGN KEY (`LocationCode`) REFERENCES `location` (`LocationCode`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('01/2004', 'Holiday 1', 'HOL', 'CUBA', 25000, 2);
INSERT INTO `product` VALUES ('AC', 'All weather clothing', 'EH', 'NZ', 2000, 1);
INSERT INTO `product` VALUES ('BTH', 'Boat Hire', 'BH', 'STKITTS', 4500, 2);
INSERT INTO `product` VALUES ('FE', 'Fishing Equipment', 'EH', 'HAW', 1500, 1);

-- ----------------------------
-- Table structure for productlocation
-- ----------------------------
DROP TABLE IF EXISTS `productlocation`;
CREATE TABLE `productlocation`  (
  `ProductCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LocationCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ProductCode`, `LocationCode`) USING BTREE,
  INDEX `KEY7`(`LocationCode`) USING BTREE,
  CONSTRAINT `KEY6` FOREIGN KEY (`ProductCode`) REFERENCES `product` (`ProductCode`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `KEY7` FOREIGN KEY (`LocationCode`) REFERENCES `location` (`LocationCode`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productlocation
-- ----------------------------
INSERT INTO `productlocation` VALUES ('01/2004', 'CUBA');
INSERT INTO `productlocation` VALUES ('01/2004', 'SARD');
INSERT INTO `productlocation` VALUES ('AC', 'NZ');
INSERT INTO `productlocation` VALUES ('BTH', 'HAW');
INSERT INTO `productlocation` VALUES ('BTH', 'STKITTS');
INSERT INTO `productlocation` VALUES ('FE', 'HAW');

-- ----------------------------
-- Table structure for producttype
-- ----------------------------
DROP TABLE IF EXISTS `producttype`;
CREATE TABLE `producttype`  (
  `ProductTypeCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProductTypeName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ProductTypeCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of producttype
-- ----------------------------
INSERT INTO `producttype` VALUES ('BH', 'Boat Hire');
INSERT INTO `producttype` VALUES ('EH', 'Equipment Hire');
INSERT INTO `producttype` VALUES ('HOL', 'Holiday Package');

SET FOREIGN_KEY_CHECKS = 1;
