-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: manbus
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacen` (
  `id_almacen` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cantidad_entrada` decimal(8,2) DEFAULT NULL,
  `cantidad_salida` decimal(8,2) DEFAULT '0.00',
  `cantidad_actual` decimal(8,2) DEFAULT '0.00',
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  PRIMARY KEY (`id_almacen`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` VALUES (1,'2',150.00,0.00,0.00,1,'2022-09-27 23:04:03','127.0.0.1',NULL,NULL,NULL,1,'2022-09-27 23:34:44','127.0.0.1','2022-09-27'),(2,'2',100.00,0.00,0.00,1,'2022-09-27 23:35:06','127.0.0.1',NULL,NULL,NULL,1,'2022-09-27 23:36:26','127.0.0.1','2022-09-28'),(3,'2',175.25,0.00,175.25,1,'2022-09-27 23:35:15','127.0.0.1',1,'2022-09-27 23:36:22','127.0.0.1',1,'2022-09-27 23:49:13','127.0.0.1','2022-09-22'),(4,'2',14.00,0.00,14.00,1,'2022-09-27 23:46:46','127.0.0.1',NULL,NULL,NULL,1,'2022-09-27 23:49:10','127.0.0.1','2022-09-28'),(6,'2',150.00,0.00,150.00,1,'2022-09-27 23:51:41','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2022-09-27'),(7,'2',15.00,0.00,15.00,1,'2022-09-27 23:52:08','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2022-09-26'),(8,'2',100.00,0.00,100.00,1,'2022-09-28 21:58:54','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'2022-09-28');
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id_area` int(11) NOT NULL AUTO_INCREMENT,
  `id_taller` int(11) NOT NULL,
  `codigo` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,2,'aa','aaa',1,'2022-09-27 00:00:00','1',NULL,NULL,NULL,1,'2022-09-27 22:11:40','127.0.0.1'),(2,2,'bb','bb',1,'2022-09-27 00:00:00','1',NULL,NULL,NULL,1,'2022-09-27 22:12:40','127.0.0.1'),(3,2,NULL,'dfghdfhfhfgh',1,'2022-09-27 21:57:00','127.0.0.1',NULL,NULL,NULL,1,'2022-09-27 22:14:44','127.0.0.1'),(4,2,NULL,'Prueba de registro de area nueva',1,'2022-09-27 22:14:38','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL),(5,2,NULL,'sdfsfsf',1,'2022-09-27 22:15:42','127.0.0.1',NULL,NULL,NULL,1,'2022-09-27 22:15:47','127.0.0.1'),(6,2,NULL,'sdfsfsfsfsdfs',1,'2022-09-27 22:15:45','127.0.0.1',NULL,NULL,NULL,1,'2022-09-27 22:17:19','127.0.0.1'),(7,2,NULL,'dgdfgdgd',1,'2022-09-27 22:17:17','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL),(8,3,NULL,'Mantenimiento',1,'2022-09-28 21:57:28','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL),(9,3,NULL,'Limpieza',1,'2022-09-28 21:57:38','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choque`
--

DROP TABLE IF EXISTS `choque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `choque` (
  `id_choque` int(11) NOT NULL AUTO_INCREMENT,
  `id_vehiculo` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `detalle` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_choque`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choque`
--

LOCK TABLES `choque` WRITE;
/*!40000 ALTER TABLE `choque` DISABLE KEYS */;
INSERT INTO `choque` VALUES (1,3,'2022-11-05','2022 sfsf',1,'2022-11-05 00:44:04','127.0.0.1',NULL,NULL,NULL,1,NULL,'127.0.0.1','reparado'),(2,1,'2022-11-05','dxfsfsdf',1,'2022-11-05 01:30:00','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,'por reparar');
/*!40000 ALTER TABLE `choque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combustible`
--

DROP TABLE IF EXISTS `combustible`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combustible` (
  `id_combustible` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_combustible` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_combustible`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combustible`
--

LOCK TABLES `combustible` WRITE;
/*!40000 ALTER TABLE `combustible` DISABLE KEYS */;
INSERT INTO `combustible` VALUES (1,'C00001','Gasolina','es una mezcla de hidrocarburos obtenida de la dest',1,'2022-11-24 22:28:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'C0002','Gas licuado de petróleo1',' es la mezcla de gases licuados presentes en el gas natural o disueltos en el petróleo conformados principalmente por propano y butano. Funciona como sustituto de la gasolina.',1,'2022-11-24 22:36:10','127.0.0.1',1,'2022-11-24 22:38:02','127.0.0.1',NULL,NULL,''),(3,'C0003','tefgd','dffhfh',1,'2022-11-24 23:06:09','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `combustible` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnostico`
--

DROP TABLE IF EXISTS `diagnostico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostico` (
  `id_diagnostico` int(11) NOT NULL AUTO_INCREMENT,
  `id_vehiculo` int(11) NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_diagnostico`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostico`
--

LOCK TABLES `diagnostico` WRITE;
/*!40000 ALTER TABLE `diagnostico` DISABLE KEYS */;
INSERT INTO `diagnostico` VALUES (1,1,'Prueba 2022',1,'2022-11-04 22:46:38','127.0.0.1',1,'2022-11-04 23:04:44','127.0.0.1',1,'2022-11-04 23:06:01','127.0.0.1'),(2,1,'sdfsfsdf',1,'2022-11-05 01:43:36','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `diagnostico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nombres` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `apellido_paterno` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `apellido_materno` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sexo` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_empleado`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'72669187','Franklin Ruiz','Asto','Leon','Masculino',1,'2021-05-01 01:03:57','1',1,'2021-09-26 22:53:15','::1',1,'2022-09-10 00:56:10','127.0.0.1'),(11,'72669188','Franklin Ruiz3','Asto','Leon','Masculino',1,'2022-09-09 23:37:20','127.0.0.1',1,'2022-09-09 23:37:55','127.0.0.1',1,'2022-09-09 23:39:08','127.0.0.1');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantenimiento`
--

DROP TABLE IF EXISTS `mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantenimiento` (
  `id_mantenimiento` int(11) NOT NULL AUTO_INCREMENT,
  `id_vehiculo` int(11) NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `comentario` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_mantenimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantenimiento`
--

LOCK TABLES `mantenimiento` WRITE;
/*!40000 ALTER TABLE `mantenimiento` DISABLE KEYS */;
INSERT INTO `mantenimiento` VALUES (1,1,'2022','2022-11-12',1,'2022-11-05 00:21:34','127.0.0.1',1,'2022-11-24 23:04:55','127.0.0.1',NULL,NULL,NULL,'2022-11-24','Se cumplió con el manteniendo');
/*!40000 ALTER TABLE `mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulo` (
  `id_modulo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_modulo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_modulo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (1,'Seguridad','seguridad',1,'2021-04-30 20:22:03','::1',NULL,NULL,NULL,NULL,NULL,NULL),(2,'Persona','persona',1,'2021-04-30 20:40:54','::1',1,'2021-05-02 15:04:06','::1',NULL,NULL,NULL),(14,'etrt','ert200',1,'2022-09-09 23:56:07','127.0.0.1',1,'2022-09-09 23:56:28','127.0.0.1',1,'2022-09-09 23:56:34','127.0.0.1'),(15,'Producto','producto',1,'2022-09-27 19:37:53','127.0.0.1',1,'2022-09-28 00:44:23','127.0.0.1',NULL,NULL,NULL),(16,'Taller','taller',1,'2022-09-27 19:38:01','127.0.0.1',1,'2022-09-28 00:44:31','127.0.0.1',NULL,NULL,NULL),(17,'Almacen','almacen',1,'2022-09-27 22:34:21','127.0.0.1',1,'2022-09-28 00:44:37','127.0.0.1',NULL,NULL,NULL),(18,'Vehiculo','vehiculo',1,'2022-09-28 20:20:07','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL),(19,'Diagnostico','diagnostico',1,'2022-11-01 18:13:43','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL),(20,'Mantenimiento','mantenimiento',1,'2022-11-04 23:50:30','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL),(21,'Choque / siniestro vehicular','choque',1,'2022-11-05 00:28:55','127.0.0.1',1,'2022-11-05 00:29:15','127.0.0.1',NULL,NULL,NULL),(22,'Dashboard','dashboard',1,'2022-11-05 01:03:21','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL),(23,'Combustible','combustible',1,'2022-11-24 22:13:03','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_producto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `precio` decimal(8,2) DEFAULT NULL,
  `stock` decimal(8,2) DEFAULT '0.00',
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'C0002','gfh','fgh2020',1,10.20,10.00,1,'2022-09-10 00:51:56','127.0.0.1',1,'2022-09-10 00:56:06','127.0.0.1',1,'2022-09-10 00:56:35','127.0.0.1'),(2,'C0002','asdad','adasd',1,120.50,275.00,1,'2022-09-10 00:57:08','127.0.0.1',1,'2022-09-10 00:57:15','127.0.0.1',NULL,NULL,NULL);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_rol`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'administrador','prueba',1,1,'2021-04-30 22:41:48','::1',1,'2022-11-24 22:13:10','127.0.0.1',NULL,NULL,NULL),(5,'asdad','asdasd2020',1,1,'2022-09-09 23:53:31','127.0.0.1',1,'2022-09-09 23:54:07','127.0.0.1',NULL,NULL,NULL);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_modulo`
--

DROP TABLE IF EXISTS `rol_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_modulo` (
  `id_rol_modulo` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NOT NULL,
  `id_modulo` int(11) NOT NULL,
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_rol_modulo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_modulo`
--

LOCK TABLES `rol_modulo` WRITE;
/*!40000 ALTER TABLE `rol_modulo` DISABLE KEYS */;
INSERT INTO `rol_modulo` VALUES (167,1,1,1,'2022-08-30 21:25:21','::1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(168,1,2,1,'2022-08-30 21:25:21','::1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(169,5,1,1,'2022-09-09 23:53:31','127.0.0.1',NULL,NULL,NULL,1,'2022-09-09 23:54:07','127.0.0.1'),(170,5,1,1,'2022-09-09 23:54:07','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL),(171,1,1,1,'2022-09-27 19:38:09','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(172,1,2,1,'2022-09-27 19:38:09','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(173,1,15,1,'2022-09-27 19:38:09','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(174,1,16,1,'2022-09-27 19:38:09','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(175,1,1,1,'2022-09-27 22:34:27','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(176,1,2,1,'2022-09-27 22:34:27','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(177,1,15,1,'2022-09-27 22:34:27','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(178,1,16,1,'2022-09-27 22:34:27','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(179,1,17,1,'2022-09-27 22:34:27','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(180,1,1,1,'2022-09-28 20:20:13','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(181,1,2,1,'2022-09-28 20:20:13','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(182,1,15,1,'2022-09-28 20:20:13','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(183,1,16,1,'2022-09-28 20:20:13','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(184,1,17,1,'2022-09-28 20:20:13','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(185,1,18,1,'2022-09-28 20:20:13','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(186,1,1,1,'2022-11-01 18:13:50','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(187,1,2,1,'2022-11-01 18:13:50','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(188,1,15,1,'2022-11-01 18:13:50','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(189,1,16,1,'2022-11-01 18:13:50','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(190,1,17,1,'2022-11-01 18:13:50','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(191,1,18,1,'2022-11-01 18:13:50','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(192,1,19,1,'2022-11-01 18:13:50','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(193,1,1,1,'2022-11-04 23:50:37','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(194,1,2,1,'2022-11-04 23:50:37','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(195,1,15,1,'2022-11-04 23:50:37','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(196,1,16,1,'2022-11-04 23:50:37','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(197,1,17,1,'2022-11-04 23:50:37','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(198,1,18,1,'2022-11-04 23:50:37','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(199,1,19,1,'2022-11-04 23:50:37','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(200,1,20,1,'2022-11-04 23:50:37','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(201,1,1,1,'2022-11-05 00:29:02','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(202,1,2,1,'2022-11-05 00:29:02','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(203,1,15,1,'2022-11-05 00:29:02','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(204,1,16,1,'2022-11-05 00:29:02','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(205,1,17,1,'2022-11-05 00:29:02','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(206,1,18,1,'2022-11-05 00:29:02','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(207,1,19,1,'2022-11-05 00:29:02','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(208,1,20,1,'2022-11-05 00:29:02','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(209,1,21,1,'2022-11-05 00:29:02','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(210,1,1,1,'2022-11-05 01:07:12','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(211,1,2,1,'2022-11-05 01:07:12','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(212,1,15,1,'2022-11-05 01:07:12','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(213,1,16,1,'2022-11-05 01:07:12','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(214,1,17,1,'2022-11-05 01:07:12','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(215,1,18,1,'2022-11-05 01:07:12','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(216,1,19,1,'2022-11-05 01:07:12','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(217,1,20,1,'2022-11-05 01:07:12','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(218,1,21,1,'2022-11-05 01:07:12','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(219,1,22,1,'2022-11-05 01:07:12','127.0.0.1',NULL,NULL,NULL,1,'2022-11-24 22:13:10','127.0.0.1'),(220,1,1,1,'2022-11-24 22:13:10','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL),(221,1,2,1,'2022-11-24 22:13:10','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL),(222,1,15,1,'2022-11-24 22:13:10','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL),(223,1,16,1,'2022-11-24 22:13:10','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL),(224,1,17,1,'2022-11-24 22:13:10','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL),(225,1,18,1,'2022-11-24 22:13:10','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL),(226,1,19,1,'2022-11-24 22:13:10','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL),(227,1,20,1,'2022-11-24 22:13:10','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL),(228,1,21,1,'2022-11-24 22:13:10','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL),(229,1,22,1,'2022-11-24 22:13:10','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL),(230,1,23,1,'2022-11-24 22:13:10','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `rol_modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taller`
--

DROP TABLE IF EXISTS `taller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taller` (
  `id_taller` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_taller` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `concesionario` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_taller`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taller`
--

LOCK TABLES `taller` WRITE;
/*!40000 ALTER TABLE `taller` DISABLE KEYS */;
INSERT INTO `taller` VALUES (1,'C0002','El agustino','av lucas',1,'2022-09-10 01:16:27','127.0.0.1',1,'2022-09-10 01:19:32','127.0.0.1',1,'2022-09-10 01:19:37','127.0.0.1',NULL),(2,'C0002','roche1','Av. San  553, Lima',1,'2022-09-27 19:38:20','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'m00024','Las malvinas 1','las malvinas 145 n2 ',1,'2022-09-28 00:24:14','127.0.0.1',1,'2022-09-28 00:39:22','127.0.0.1',NULL,NULL,NULL,'Las malvinas'),(4,'fghf','fgh','fghfh',1,'2022-09-28 00:36:18','127.0.0.1',NULL,NULL,NULL,1,'2022-09-28 00:41:31','127.0.0.1',''),(5,'gjhghj','ghjghj','hgjgj',1,'2022-09-28 00:37:55','127.0.0.1',NULL,NULL,NULL,1,'2022-09-28 00:41:27','127.0.0.1','ghjhgj');
/*!40000 ALTER TABLE `taller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) NOT NULL,
  `id_area` int(11) DEFAULT NULL,
  `id_rol` int(11) NOT NULL,
  `usuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `correo` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_usuario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1,15,1,'admin','$2y$13$AzSu7ICHHQQo7durNWiSju29o9CNOKhynuXmp1RnAE2thoZppAQiW','franklin.asto.leon@gmail.com',1,'2021-04-30 01:16:30','a',1,'2021-06-29 23:51:59','::1',NULL,NULL,NULL,1),(10,1,NULL,1,'admin1','$2y$13$pY8ebvvP9Ih2hw32aS63RuW0Oy5QYiS6uecuZVQEb9EZ/Kml.ta4i','franklin.asto.leon@gmail.com',1,'2022-09-10 00:01:37','127.0.0.1',1,'2022-09-10 00:03:46','127.0.0.1',1,'2022-09-10 00:03:52','127.0.0.1',0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculos` (
  `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modelo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `matricula` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `denominacion_comercial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medidas_neumaticos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altura` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anchura` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitud` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `distancia_entre_ejes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `masa_maxima_autorizada` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_motor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero_cilindros` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cilindarada` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `potencia_expresada_en_cv` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `potencia_expresada_en_kw` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero_bastidor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero_plazas` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tara` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `incripcion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `config_vehicular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flg_estado` tinyint(1) NOT NULL,
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flg_inspeccion_tecnica` tinyint(4) DEFAULT NULL,
  `flg_soat` tinyint(4) DEFAULT NULL,
  `id_combustible` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_vehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
INSERT INTO `vehiculos` VALUES (1,'toyota','as','as','as','as','as','as','as','as',NULL,NULL,'as','as',NULL,'as','as','as','as','as','2022','as','as',1,1,'2022-09-28 20:00:07','127.0.0.1',1,'2022-11-04 23:40:23','127.0.0.1',1,NULL,'127.0.0.1','Inoperativo',1,1,1),(3,'toyota','a10','prueba','AL102','prueba','150','2.5','7','2',NULL,NULL,'prueba','as',NULL,'as','1','as','as','10','Derivadas','prueba','as',1,1,'2022-11-04 23:42:17','127.0.0.1',1,'2022-11-24 23:06:36','127.0.0.1',NULL,NULL,NULL,'Operativo',0,1,3);
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'manbus'
--
/*!50003 DROP PROCEDURE IF EXISTS `datoUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `datoUsuario`(IN idUsuario int)
begin
	select
		pe.nombre_rol as perfil,
		concat(p.nombres,' ',p.apellido_paterno,' ',p.apellido_materno) as persona
	from usuarios u
		inner join empleado p on u.id_empleado = p.id_empleado
		inner join rol pe on u.id_rol = pe.id_rol
  where u.fecha_del is null and u.id_usuario = idUsuario;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listadoAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoAlmacen`(IN row1 int, IN length1 int, IN busca varchar(200), OUT total int)
BEGIN



    declare totalRegistro int;



    select

        a.id_almacen,

        p.codigo_producto,

        p.nombre,

        a.fecha_ingreso,

        a.cantidad_entrada,

        a.cantidad_salida,

        a.cantidad_actual

    from almacen a

        inner join producto p on a.id_producto = p.id_producto

    where a.fecha_del is null

      and concat(p.codigo_producto, ' ', p.nombre) like concat('%', busca, '%')

    LIMIT row1,length1;



    set totalRegistro = (select count(*) from almacen a inner join producto p on a.id_producto = p.id_producto

                         where a.fecha_del is null

                           and concat(p.codigo_producto, ' ', p.nombre) like concat('%', busca, '%'));



    select totalRegistro INTO total;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listadoChoque` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoChoque`(IN row1 int, IN length1 int, IN busca varchar(200), OUT total int)
BEGIN



    declare totalRegistro int;



    select m.id_choque,

           v.marca,

           v.version,

           v.modelo,

           v.matricula,

           v.denominacion_comercial,

           m.fecha,

           m.detalle

    from choque m

             inner join vehiculos v on m.id_vehiculo = v.id_vehiculo

    where m.fecha_del is null

      and concat(v.marca, ' ', v.version, ' ', v.modelo, ' ', v.matricula, ' ', v.denominacion_comercial, ' ',m.detalle) like concat('%', busca, '%')

    LIMIT row1,length1;



    set totalRegistro = (select count(*)

                         from choque d inner join vehiculos v on d.id_vehiculo = v.id_vehiculo

                         where d.fecha_del is null

                           and concat(v.marca, ' ', v.version, ' ', v.modelo, ' ', v.matricula, ' ', v.denominacion_comercial, ' ',d.detalle) like concat('%', busca, '%'));



    select totalRegistro INTO total;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listadoCombustible` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoCombustible`(IN row1 int, IN length1 int, IN busca varchar(200), OUT total int)
BEGIN



    declare totalRegistro int;



    select id_combustible,

           codigo_combustible,

           nombre,

           descripcion

    from combustible

    where fecha_del is null

      and concat(codigo_combustible, ' ', nombre) like concat('%', busca, '%')

    LIMIT row1,length1;



    set totalRegistro = (select count(*)

                         from combustible

                         where fecha_del is null

                           and concat(codigo_combustible, ' ', nombre) like concat('%', busca, '%'));



    select totalRegistro INTO total;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listadoDiagnostico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoDiagnostico`(IN row1 int, IN length1 int, IN busca varchar(200), OUT total int)
BEGIN



    declare totalRegistro int;



    select d.id_diagnostico,

           v.marca,

           v.version,

           v.modelo,

           v.matricula,

           v.denominacion_comercial,

           d.descripcion

    from diagnostico d

             inner join vehiculos v on d.id_vehiculo = v.id_vehiculo

    where d.fecha_del is null

      and concat(v.marca, ' ', v.version, ' ', v.modelo, ' ', v.matricula, ' ', v.denominacion_comercial, ' ',d.descripcion) like concat('%', busca, '%')

    LIMIT row1,length1;



    set totalRegistro = (select count(*)

                         from diagnostico d inner join vehiculos v on d.id_vehiculo = v.id_vehiculo

                         where d.fecha_del is null

                           and concat(v.marca, ' ', v.version, ' ', v.modelo, ' ', v.matricula, ' ', v.denominacion_comercial, ' ',d.descripcion) like concat('%', busca, '%'));



    select totalRegistro INTO total;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listadoEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoEmpleado`(IN row1 int, IN length1 int, IN busca varchar(200))
BEGIN
	select
		id_empleado,
		dni,
		nombres,
		apellido_paterno,
		apellido_materno,
		(select count(*) from empleado where fecha_del is null) as total
	from empleado
  where fecha_del is null and concat(nombres,' ',apellido_paterno,' ',apellido_materno) like concat('%',busca,'%')
		LIMIT row1,length1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listadoMantenimiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoMantenimiento`(IN row1 int, IN length1 int, IN busca varchar(200), OUT total int)
BEGIN

    declare totalRegistro int;

    select m.id_mantenimiento,
           v.marca,
           v.version,
           v.modelo,
           v.matricula,
           v.denominacion_comercial,
           m.fecha,
           m.descripcion,
           m.fecha_fin
    from mantenimiento m
             inner join vehiculos v on m.id_vehiculo = v.id_vehiculo
    where m.fecha_del is null
      and concat(v.marca, ' ', v.version, ' ', v.modelo, ' ', v.matricula, ' ', v.denominacion_comercial, ' ',m.descripcion) like concat('%', busca, '%')
    LIMIT row1,length1;

    set totalRegistro = (select count(*)
                         from mantenimiento d inner join vehiculos v on d.id_vehiculo = v.id_vehiculo
                         where d.fecha_del is null
                           and concat(v.marca, ' ', v.version, ' ', v.modelo, ' ', v.matricula, ' ', v.denominacion_comercial, ' ',d.descripcion) like concat('%', busca, '%'));

    select totalRegistro INTO total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listadoModulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoModulo`(IN row1 int, IN length1 int, IN buscar varchar(200))
BEGIN
   SELECT
			id_modulo as id_modulo,
			nombre_modulo as nombre_modulo,
			url as ruta,
			(select count(*) from modulo where fecha_del is null) as total
		FROM modulo where fecha_del is null and nombre_modulo like concat('%',buscar,'%')
		LIMIT row1,length1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listadoProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoProducto`(IN row1 int, IN length1 int, IN busca varchar(200), OUT total int)
BEGIN



    declare totalRegistro int;



    select id_producto,

           codigo_producto,

           nombre,

           descripcion,

           estado,

           precio,

           stock

    from producto

    where fecha_del is null

      and concat(codigo_producto, ' ', nombre) like concat('%', busca, '%')

    LIMIT row1,length1;



    set totalRegistro = (select count(*)

                         from producto

                         where fecha_del is null

                           and concat(codigo_producto, ' ', nombre) like concat('%', busca, '%'));



    select totalRegistro INTO total;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listadoRol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoRol`(IN row1 int, IN length1 int, IN busca varchar(200))
BEGIN
    SELECT id_rol,
           nombre_rol,
           descripcion,
           estado,
           (select count(*) from rol where fecha_del is null) as total
    FROM rol
    where fecha_del is null
      and nombre_rol like concat('%', busca, '%')
    LIMIT row1,length1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listadoTaller` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoTaller`(IN row1 int, IN length1 int, IN busca varchar(200), OUT total int)
BEGIN

    declare totalRegistro int;

    select id_taller,
           codigo_taller,
           nombre,
           direccion,
           concesionario
    from taller
    where fecha_del is null
      and concat(codigo_taller, ' ', nombre) like concat('%', busca, '%')
    LIMIT row1,length1;

    set totalRegistro = (select count(*)
                         from taller
                         where fecha_del is null
                           and concat(codigo_taller, ' ', nombre) like concat('%', busca, '%'));

    select totalRegistro INTO total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listadoUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoUsuario`(IN row1 int, IN length1 int, IN busca varchar(200))
BEGIN
    select u.id_usuario,
           u.usuario,
           pe.nombre_rol                                                       as perfil,
           concat(p.nombres, ' ', p.apellido_paterno, ' ', p.apellido_materno) as persona,
           (select count(*) from usuarios where fecha_del is null)             as total
    from usuarios u
             inner join empleado p on u.id_empleado = p.id_empleado
             inner join rol pe on u.id_rol = pe.id_rol
    where u.fecha_del is null
      and concat(u.id_usuario, ' ', u.usuario, ' ', pe.nombre_rol, ' ', p.nombres, ' ', p.apellido_paterno, ' ',
                 p.apellido_materno) like concat('%', busca, '%')
    LIMIT row1,length1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listadoVehiuclo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoVehiuclo`(IN row1 int, IN length1 int, IN busca varchar(200), OUT total int)
BEGIN

    declare totalRegistro int;

    select v.id_vehiculo,
        v.marca,
        v.version,
        v.modelo,
        v.matricula,
        v.denominacion_comercial,
        v.medidas_neumaticos,
        v.altura,
        v.anchura,
        v.longitud,
        v.distancia_entre_ejes,
        v.masa_maxima_autorizada,
        v.tipo_motor,
        v.numero_cilindros,
        v.cilindarada,
        v.potencia_expresada_en_cv,
        v.potencia_expresada_en_kw,
        v.numero_bastidor,
        v.numero_plazas,
        v.tara,
        v.descripcion,
        v.incripcion,
        v.config_vehicular,
        v.flg_estado,
        v.estado,
        c.nombre as combustible
    from vehiculos v
    inner join combustible c on v.id_combustible = c.id_combustible
    where v.fecha_del is null
      and concat(v.matricula, ' ', v.descripcion,' ',v.estado) like concat('%', busca, '%')
    LIMIT row1,length1;

    set totalRegistro = (select count(*)
                         from vehiculos v
                         inner join combustible c on v.id_combustible = c.id_combustible
                         where v.fecha_del is null
                           and concat(v.matricula, ' ', v.descripcion,' ',v.estado) like concat('%', busca, '%'));

    select totalRegistro INTO total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `menu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `menu`(IN idPerfil int)
begin
    select o.nombre_modulo,
           o.url
    from rol_modulo po
             inner join modulo o on po.id_modulo = o.id_modulo and po.fecha_del is null
    where po.id_rol = idPerfil;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rolModulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rolModulo`(IN idPerfil int)
begin
    select o.id_modulo,
           o.nombre_modulo,
           (case when po.id_rol_modulo > 0 then 1 else 0 end) as activo
    from rol_modulo po
             right join modulo o on po.id_modulo = o.id_modulo and po.fecha_del is null and po.id_rol = idPerfil;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-25 20:24:32
