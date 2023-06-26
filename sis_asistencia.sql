/*
Navicat MySQL Data Transfer

Source Server         : xampp Local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : sis_asistencia

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2023-06-26 11:09:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for asistencia
-- ----------------------------
DROP TABLE IF EXISTS `asistencia`;
CREATE TABLE `asistencia` (
`id_asistencia`  int(11) NOT NULL AUTO_INCREMENT ,
`id_empleado`  int(11) NOT NULL ,
`entrada`  datetime NULL DEFAULT '' ,
`salida`  datetime NULL DEFAULT '' ,
PRIMARY KEY (`id_asistencia`),
FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE CASCADE ON UPDATE RESTRICT,
INDEX `fk2` (`id_empleado`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=53

;

-- ----------------------------
-- Records of asistencia
-- ----------------------------
BEGIN;
INSERT INTO `asistencia` VALUES ('14', '6', '2022-03-31 00:22:53', '2022-03-31 00:23:04'), ('30', '1', '2022-08-06 21:00:00', '2022-08-06 21:00:00'), ('32', '12', '2022-08-06 21:00:00', '2022-08-06 21:00:00'), ('35', '6', '2023-06-13 10:28:46', '2023-06-13 11:02:44'), ('47', '12', '2023-06-20 06:08:22', '2023-06-20 06:13:01'), ('48', '6', '2023-06-20 06:08:37', '2023-06-20 06:08:42'), ('49', '2', '2023-06-20 06:33:24', '2023-06-20 06:35:31'), ('51', '12', '2023-06-26 09:49:04', '2023-06-26 09:55:46'), ('52', '6', '2023-06-26 11:45:17', '2023-06-26 11:46:20');
COMMIT;

-- ----------------------------
-- Table structure for cargo
-- ----------------------------
DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
`id_cargo`  int(11) NOT NULL AUTO_INCREMENT ,
`nombre`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
PRIMARY KEY (`id_cargo`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=14

;

-- ----------------------------
-- Records of cargo
-- ----------------------------
BEGIN;
INSERT INTO `cargo` VALUES ('1', 'cirujano'), ('2', 'odontologo'), ('3', 'farmacia'), ('4', 'limpieza'), ('5', 'enfermera'), ('12', 'prueba123');
COMMIT;

-- ----------------------------
-- Table structure for empleado
-- ----------------------------
DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
`id_empleado`  int(11) NOT NULL AUTO_INCREMENT ,
`nombre`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`apellido`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`dni`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`cargo`  int(11) NOT NULL ,
PRIMARY KEY (`id_empleado`),
FOREIGN KEY (`cargo`) REFERENCES `cargo` (`id_cargo`) ON DELETE CASCADE ON UPDATE RESTRICT,
INDEX `fk1` (`cargo`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=20

;

-- ----------------------------
-- Records of empleado
-- ----------------------------
BEGIN;
INSERT INTO `empleado` VALUES ('1', 'juan manuel', 'quispe chocce', '78945612', '1'), ('2', 'josep', 'vega chavez', '77441122', '2'), ('3', 'erick', 'muleta paredes', '77885522', '3'), ('4', 'maria', 'molina gutierrez', '00225566', '5'), ('6', 'ismael', 'sandoval', '74433542', '4'), ('11', 'prueba', 'prueba', '00225588', '1'), ('12', 'Eder', 'Quijano Oxte', '12345678', '3'), ('19', 'Prueba5', 'Pueba 5', '24681012', '4');
COMMIT;

-- ----------------------------
-- Table structure for empresa
-- ----------------------------
DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa` (
`id_empresa`  int(11) NOT NULL AUTO_INCREMENT ,
`nombre`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`telefono`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`ubicacion`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`ruc`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
PRIMARY KEY (`id_empresa`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of empresa
-- ----------------------------
BEGIN;
INSERT INTO `empresa` VALUES ('1', 'Hotel Tuul', '9999999999', 'Izamal Yucatán México', '123456789');
COMMIT;

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
`id_usuario`  int(11) NOT NULL AUTO_INCREMENT ,
`nombre`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`apellido`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`usuario`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`password`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id_usuario`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=9

;

-- ----------------------------
-- Records of usuario
-- ----------------------------
BEGIN;
INSERT INTO `usuario` VALUES ('1', 'ismaelito', 'sandoval', 'isai', '202cb962ac59075b964b07152d234b70'), ('2', 'juan', 'mamani', 'juan', '202cb962ac59075b964b07152d234b70'), ('6', 'Karen', 'Quijano', 'Karen Quijano', '21232f297a57a5a743894a0e4a801fc3');
COMMIT;

-- ----------------------------
-- Auto increment value for asistencia
-- ----------------------------
ALTER TABLE `asistencia` AUTO_INCREMENT=53;

-- ----------------------------
-- Auto increment value for cargo
-- ----------------------------
ALTER TABLE `cargo` AUTO_INCREMENT=14;

-- ----------------------------
-- Auto increment value for empleado
-- ----------------------------
ALTER TABLE `empleado` AUTO_INCREMENT=20;

-- ----------------------------
-- Auto increment value for empresa
-- ----------------------------
ALTER TABLE `empresa` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for usuario
-- ----------------------------
ALTER TABLE `usuario` AUTO_INCREMENT=9;
