-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: empresa_xyz
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `actividades`
--

DROP TABLE IF EXISTS `actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `fecha` date DEFAULT NULL,
  `puntos_asignados` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividades`
--

LOCK TABLES `actividades` WRITE;
/*!40000 ALTER TABLE `actividades` DISABLE KEYS */;
INSERT INTO `actividades` VALUES (1,'Taller de Liderazgo','Capacitación para gerentes','2006-06-17',45),(2,'Día de Integración','Jornada recreativa con juegos','2012-03-23',55),(3,'Capacitación Técnica','Curso avanzado en herramientas digitales','2020-07-09',30),(4,'Torneo Deportivo','Competencia de fútbol y voleibol','2017-09-15',60),(5,'Voluntariado','Ayuda comunitaria organizada por la empresa','2013-12-05',75),(6,'Curso de Python','Introducción a la programación en Python','2018-04-22',40),(7,'Hackathon Empresarial','Competencia de desarrollo de software','2025-02-01',70),(8,'Sesión de Innovación','Día de brainstorming para proyectos','2003-11-19',35),(9,'Competencia de Ventas','Premio a los mejores vendedores','2009-08-07',65),(10,'Día de la Familia','Evento social para colaboradores y familiares','2016-01-29',50),(11,'Desafío de Logística','Descripción de Desafío de Logística','2019-08-15',92),(12,'Capacitación en Finanzas','Descripción de Capacitación en Finanzas','2025-03-05',88),(13,'Torneo de Ajedrez','Descripción de Torneo de Ajedrez','2008-11-22',61),(14,'Seminario de RRHH','Descripción de Seminario de RRHH','2002-07-09',55),(15,'Charlas Motivacionales','Descripción de Charlas Motivacionales','2023-10-30',77);
/*!40000 ALTER TABLE `actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fidelizacion`
--

DROP TABLE IF EXISTS `fidelizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fidelizacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int DEFAULT NULL,
  `actividad_id` int DEFAULT NULL,
  `puntos` int DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `actividad_id` (`actividad_id`),
  CONSTRAINT `fidelizacion_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fidelizacion_ibfk_2` FOREIGN KEY (`actividad_id`) REFERENCES `actividades` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fidelizacion`
--

LOCK TABLES `fidelizacion` WRITE;
/*!40000 ALTER TABLE `fidelizacion` DISABLE KEYS */;
INSERT INTO `fidelizacion` VALUES (1,17,4,66,'2014-12-24 00:00:00'),(2,6,2,61,'2010-07-23 00:00:00'),(3,6,10,31,'2016-09-21 00:00:00'),(4,2,4,100,'2019-04-28 00:00:00'),(5,7,12,91,'2021-05-06 00:00:00'),(6,5,9,13,'2010-11-29 00:00:00'),(7,16,3,66,'2012-01-31 00:00:00'),(8,16,6,60,'2010-07-03 00:00:00'),(9,7,13,19,'2024-01-17 00:00:00'),(10,2,2,43,'2012-11-14 00:00:00'),(11,9,9,60,'2023-03-05 00:00:00'),(12,18,1,53,'2016-11-02 00:00:00'),(13,7,9,76,'2024-10-13 00:00:00'),(14,1,1,21,'2013-08-09 00:00:00'),(15,1,10,21,'2007-06-09 00:00:00'),(16,5,14,81,'2018-09-13 00:00:00'),(17,2,7,95,'2014-06-16 00:00:00'),(18,8,10,19,'2012-01-27 00:00:00'),(19,8,4,18,'2006-03-26 00:00:00'),(20,11,5,86,'2015-12-25 00:00:00'),(21,8,13,11,'2011-05-15 00:00:00'),(22,16,2,29,'2005-07-14 00:00:00'),(23,6,2,57,'2015-08-18 00:00:00'),(24,9,14,22,'2024-03-17 00:00:00'),(25,19,7,38,'2018-03-17 00:00:00'),(26,12,15,10,'2020-05-29 00:00:00'),(27,1,9,87,'2014-05-02 00:00:00'),(28,14,2,62,'2013-04-03 00:00:00'),(29,15,2,48,'2005-11-08 00:00:00'),(30,13,11,66,'2024-08-07 00:00:00'),(31,9,13,14,'2008-01-30 00:00:00'),(32,7,7,34,'2025-05-02 00:00:00'),(33,7,9,95,'2001-07-26 00:00:00'),(34,18,9,27,'2019-01-28 00:00:00'),(35,16,15,67,'2020-05-02 00:00:00'),(36,4,5,11,'2022-08-09 00:00:00'),(37,12,9,26,'2022-06-23 00:00:00'),(38,3,4,74,'2002-06-17 00:00:00'),(39,8,4,15,'2011-01-30 00:00:00'),(40,14,10,36,'2014-02-02 00:00:00'),(41,9,11,43,'2009-03-07 00:00:00'),(42,3,12,47,'2005-10-18 00:00:00'),(43,13,13,40,'2022-09-03 00:00:00'),(44,13,12,15,'2001-10-04 00:00:00'),(45,10,9,48,'2014-10-22 00:00:00'),(46,18,1,69,'2022-10-29 00:00:00'),(47,13,13,37,'2000-09-24 00:00:00'),(48,20,13,46,'2014-01-10 00:00:00'),(49,2,2,18,'2019-11-16 00:00:00'),(50,19,13,45,'2013-05-07 00:00:00'),(51,5,2,50,'2025-03-15 17:01:26'),(52,5,2,50,'2025-03-15 17:27:16');
/*!40000 ALTER TABLE `fidelizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int DEFAULT NULL,
  `fecha_hora` datetime DEFAULT CURRENT_TIMESTAMP,
  `exito` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,20,'2022-04-02 06:13:18',1),(2,7,'2000-03-24 16:56:38',0),(3,20,'2018-09-10 13:48:19',0),(4,3,'2023-02-28 12:42:55',1),(5,15,'2004-09-27 16:31:35',0),(6,2,'2008-05-26 08:02:10',1),(7,7,'2010-12-20 11:17:02',0),(8,12,'2024-12-25 13:14:26',1),(9,7,'2001-05-14 11:52:54',1),(10,3,'2018-03-24 14:27:29',0),(11,18,'2006-07-23 12:09:15',1),(12,6,'2024-11-18 12:43:59',1),(13,5,'2013-01-15 13:15:35',0),(14,6,'2016-05-27 15:27:17',0),(15,13,'2020-01-27 13:02:26',0),(16,4,'2017-10-25 00:32:36',0),(17,8,'2014-08-09 17:46:38',1),(18,13,'2011-03-27 23:58:00',0),(19,13,'2016-05-03 05:48:25',1),(20,6,'2006-05-02 05:57:07',1),(21,9,'2021-10-15 05:39:33',1),(22,8,'2011-02-12 12:28:44',0),(23,7,'2015-01-13 02:06:17',0),(24,14,'2000-01-09 07:40:26',0),(25,8,'2013-05-12 21:14:31',1),(26,1,'2007-05-04 11:59:31',1),(27,13,'2006-04-25 08:15:10',0),(28,20,'2015-01-16 13:13:21',0),(29,9,'2024-04-20 12:38:35',0),(30,6,'2010-02-17 11:34:26',1),(31,7,'2025-12-23 05:40:44',1),(32,20,'2023-08-12 03:32:14',1),(33,6,'2017-05-02 02:18:16',0),(34,5,'2020-05-18 22:47:07',0),(35,2,'2014-07-28 06:29:36',1),(36,2,'2015-10-28 16:23:55',0),(37,10,'2000-08-04 18:27:57',0),(38,7,'2010-12-17 00:21:42',0),(39,7,'2004-11-26 21:42:53',0),(40,17,'2006-09-27 14:05:39',0),(41,5,'2001-08-23 03:23:29',0),(42,20,'2025-12-01 04:50:40',1),(43,1,'2015-01-12 21:20:57',1),(44,19,'2007-09-22 14:48:12',1),(45,6,'2018-08-28 01:17:19',1),(46,14,'2004-11-27 01:24:52',0),(47,6,'2022-06-23 15:41:34',1),(48,4,'2012-01-15 13:21:00',1),(49,19,'2018-10-22 12:14:41',1),(50,14,'2000-02-18 16:39:11',1),(51,8,'2021-01-21 13:39:32',1),(52,4,'2017-10-24 21:55:58',0),(53,10,'2005-08-17 23:12:04',1),(54,7,'2010-02-14 23:28:23',1),(55,13,'2009-02-08 03:56:14',0),(56,3,'2015-08-05 22:16:33',1),(57,2,'2011-01-01 19:00:39',0),(58,6,'2015-02-26 02:45:32',0),(59,7,'2014-10-09 01:22:45',1),(60,2,'2008-06-13 16:09:42',0),(61,3,'2015-07-22 07:13:13',0),(62,11,'2005-08-10 23:44:49',1),(63,3,'2022-11-23 11:57:21',1),(64,8,'2002-06-02 21:19:55',1),(65,10,'2010-07-16 03:59:34',1),(66,14,'2016-04-14 13:21:05',0),(67,12,'2021-04-02 08:39:12',0),(68,16,'2016-12-18 10:15:01',0),(69,10,'2010-09-03 12:16:48',0),(70,16,'2004-06-23 16:03:11',1),(71,5,'2022-08-15 17:04:13',1),(72,16,'2006-11-21 21:20:01',0),(73,10,'2000-08-02 08:42:25',0),(74,17,'2002-12-18 03:51:50',1),(75,17,'2000-09-15 09:22:42',0),(76,4,'2011-09-06 20:36:32',1),(77,19,'2022-07-09 18:57:26',0),(78,7,'2016-02-24 18:20:24',0),(79,20,'2017-06-11 12:21:14',0),(80,2,'2025-08-06 03:02:47',1),(81,18,'2020-05-10 15:09:56',0),(82,4,'2006-09-27 10:25:46',1),(83,17,'2003-04-01 06:15:27',1),(84,9,'2009-07-22 04:32:09',0),(85,8,'2010-11-10 21:27:37',1),(86,1,'2021-01-23 20:52:46',0),(87,17,'2013-01-18 01:22:45',1),(88,16,'2003-04-27 21:35:20',1),(89,13,'2010-01-01 00:57:47',0),(90,20,'2018-08-02 08:31:36',0),(91,12,'2009-03-25 18:08:27',1),(92,18,'2020-05-11 19:55:12',0),(93,13,'2012-05-15 10:34:38',0),(94,8,'2014-08-17 21:47:16',1),(95,1,'2006-02-27 07:40:28',0),(96,7,'2012-06-28 10:13:48',0),(97,8,'2019-09-05 16:57:45',1),(98,8,'2025-11-07 16:38:13',0),(99,3,'2004-06-25 23:15:20',1),(100,14,'2015-11-14 22:11:10',0),(101,6,'2022-06-23 15:49:09',0),(102,20,'2002-07-12 09:46:38',1),(103,15,'2023-04-18 09:02:03',0),(104,9,'2021-11-25 17:03:05',0),(105,1,'2011-01-27 14:13:14',1),(106,2,'2015-10-05 11:49:44',0),(107,1,'2011-01-21 16:09:47',0),(108,1,'2015-12-27 21:43:51',0),(109,1,'2017-05-27 14:08:51',1),(110,17,'2010-07-17 06:36:11',0),(111,5,'2015-05-02 01:15:04',1),(112,13,'2013-08-15 18:18:12',0),(113,2,'2025-09-17 20:25:36',1),(114,1,'2020-11-05 01:50:00',1),(115,11,'2002-11-28 09:56:34',0),(116,10,'2006-11-17 06:34:06',1),(117,17,'2015-07-21 04:42:00',1),(118,12,'2003-12-15 14:30:41',1),(119,13,'2010-02-08 23:07:42',0),(120,16,'2007-02-18 20:19:06',1),(121,10,'2017-01-01 23:56:45',1),(122,11,'2020-04-04 19:34:30',1),(123,8,'2016-01-06 23:09:57',0),(124,11,'2020-04-07 05:24:22',1),(125,3,'2018-03-21 02:17:11',0),(126,18,'2025-06-06 14:33:55',1),(127,19,'2020-03-19 15:13:13',0),(128,9,'2020-10-14 01:57:31',1),(129,6,'2003-10-17 13:03:34',1),(130,17,'2025-05-26 10:25:52',0),(131,16,'2017-12-23 03:15:52',1),(132,10,'2011-11-06 05:32:00',0),(133,3,'2008-03-05 02:08:18',0),(134,18,'2024-02-20 04:51:40',1),(135,4,'2007-11-18 12:39:44',1),(136,11,'2011-07-12 10:52:07',0),(137,14,'2011-01-26 09:13:59',0),(138,9,'2006-12-06 00:29:24',1),(139,15,'2024-06-13 20:58:17',1),(140,15,'2003-05-20 05:08:59',0),(141,10,'2025-06-08 23:08:44',0),(142,6,'2009-02-10 10:06:16',0),(143,10,'2002-03-18 14:03:32',0),(144,18,'2020-05-19 01:23:43',0),(145,20,'2016-03-04 00:47:51',1),(146,18,'2016-08-05 23:25:12',1),(147,20,'2019-11-04 21:10:11',0),(148,14,'2024-09-26 06:36:15',0),(149,11,'2004-05-11 18:36:46',0),(150,2,'2005-10-11 09:58:36',0),(151,20,'2009-12-17 03:53:04',1),(152,5,'2001-08-23 05:46:11',1),(153,10,'2013-03-18 10:14:54',1),(154,11,'2001-09-11 17:32:31',0),(155,11,'2013-02-01 15:16:25',0),(156,2,'2014-08-12 05:57:03',0),(157,18,'2004-03-13 16:09:40',1),(158,12,'2002-09-11 16:23:50',0),(159,16,'2019-05-23 16:07:30',0),(160,7,'2004-10-14 00:43:32',0),(161,18,'2021-06-02 17:27:10',0),(162,15,'2007-05-23 22:23:06',0),(163,7,'2016-02-24 17:06:24',1),(164,6,'2008-09-22 13:35:15',0),(165,13,'2016-05-26 11:41:58',1),(166,6,'2019-12-11 04:41:56',1),(167,11,'2013-02-28 15:11:01',1),(168,16,'2003-05-16 15:33:50',1),(169,1,'2013-07-07 10:31:19',0),(170,5,'2024-01-15 10:36:43',1),(171,18,'2022-10-07 19:19:12',0),(172,15,'2008-07-25 16:47:54',0),(173,19,'2005-04-21 20:08:07',0),(174,10,'2021-10-12 15:07:37',1),(175,15,'2013-06-16 11:40:56',1),(176,18,'2001-10-23 12:19:01',0),(177,12,'2012-09-04 11:02:43',0),(178,7,'2002-07-17 03:54:11',0),(179,9,'2011-01-24 01:47:48',1),(180,15,'2022-12-12 00:53:23',0),(181,5,'2007-10-06 12:00:27',0),(182,4,'2025-05-26 09:14:04',1),(183,19,'2020-01-27 13:54:53',1),(184,19,'2009-03-24 13:17:45',1),(185,10,'2012-12-16 17:02:58',1),(186,17,'2024-04-14 13:24:19',0),(187,2,'2005-11-15 23:29:29',1),(188,7,'2019-10-18 19:13:38',1),(189,15,'2000-11-14 15:50:15',1),(190,20,'2015-01-17 16:44:36',1),(191,9,'2012-03-17 06:37:20',1),(192,20,'2010-03-20 22:38:20',1),(193,19,'2005-05-08 03:01:38',0),(194,12,'2017-07-25 13:17:43',1),(195,11,'2011-08-25 09:20:32',1),(196,15,'2017-03-28 06:30:39',1),(197,18,'2004-02-02 23:44:46',1),(198,17,'2004-05-16 11:47:30',0),(199,4,'2012-12-04 19:46:24',1),(200,7,'2011-04-02 12:21:15',0),(201,3,'2025-03-15 17:01:16',1),(202,3,'2025-03-15 17:27:10',1);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `fecha_vigencia` date DEFAULT NULL,
  `descripcion` text,
  `encargado` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfiles`
--

LOCK TABLES `perfiles` WRITE;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` VALUES (1,'Administrador','2002-05-17','Administra el sistema','Gerente General'),(2,'Empleado','2011-09-29','Trabajador estándar','RRHH'),(3,'Supervisor','2020-12-03','Supervisa actividades','Jefe de Operaciones'),(4,'Soporte Técnico','2015-07-21','Asistencia TI','TI Manager'),(5,'Marketing','2018-03-15','Gestión de redes sociales','Director de Marketing'),(6,'Ventas','2009-10-08','Atención al cliente','Jefe de Ventas'),(7,'Logística','2016-06-19','Supervisa envíos','Gerente Logística'),(8,'Finanzas','2023-08-25','Manejo de presupuesto','Director Financiero'),(9,'Recursos Humanos','2007-11-11','Manejo de personal','Jefe de RRHH'),(10,'Desarrollador','2025-02-05','Desarrollador de software','Líder de Proyecto');
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `estado` enum('Activo','Inactivo') DEFAULT 'Activo',
  `contraseña` varchar(255) NOT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `perfil_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `perfil_id` (`perfil_id`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`perfil_id`) REFERENCES `perfiles` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Juan','Perez','Activo','ab21f0993bc94c25e65a79f66634121d7e9ccc8433dfbe033d047f05b17243d0','Gerente',3572.80,'2005-07-13',1),(2,'Maria','Gomez','Activo','485a8325a50979eee6abba26880c82b42dcd1d9c4b5fb7828883a6e891318eef','Empleado',1925.50,'2017-04-05',2),(3,'Carlos','Lopez','Inactivo','021f2b5dec12b9657dc17d70aae8d447c8118a65f4e839ee485283d56d8c8411','Supervisor',2784.10,'2011-10-28',3),(4,'Ana','Torres','Activo','1a79f1bab7ccc9629f56d577007b40b75611bb20801a55320cc56644a54ad165','Soporte Técnico',2156.75,'2009-09-07',4),(5,'Luis','Ramirez','Activo','d8640343d3914672347f763bda81a4e471773d27cdea58341687fe67c7635eb6','Marketing',2469.00,'2021-12-30',5),(6,'Paula','Fernandez','Inactivo','bfb15ee1a8c7a37376b57c1e2efc415f04177b7c79b59750fe60d5639a7cef88','Ventas',2265.20,'2015-03-18',6),(7,'Hector','Martinez','Activo','5d8501680a617c77715ff81aa3952b4710d65f9867052c2f0ed1f95f7ce3ae1b','Logística',2897.35,'2020-05-23',7),(8,'Laura','Diaz','Activo','30cfb41b703755447adab826723d638a9efcf2ecd0bb0e7ea614bc5c302acf6b','Finanzas',3987.80,'2001-02-14',8),(9,'Pedro','Ortiz','Activo','94bca6c48b301b3e4724a0cc0de299f7b28e55eaeb3844d46bc0c8a610464087','Recursos Humanos',2750.00,'2008-08-21',9),(10,'Sofia','Reyes','Activo','3bd05d1c256630cb7e9c15b41d8af61c63db4dd4a64896bc9a87d6e61fa423e0','Desarrollador',3678.40,'2014-11-04',10),(11,'Jorge','Velazquez','Inactivo','f3250292c790ba9b727852a6404de695a79fa6fbc7f88b0e669074da6cf1a514','Gerente',2428.44,'2024-01-28',8),(12,'Andrea','Luna','Inactivo','99a21b28c420793acfed68f8ac448940e0b969e19d82ed5d8d48ab2449bcc547','Empleado',2164.86,'2001-02-25',7),(13,'Raul','Santos','Activo','fe4a003c1c4b7325580fdaf8a8fd69414625846c324344a43865cbeb652f8186','Supervisor',4350.38,'2021-04-15',4),(14,'Diana','Cruz','Activo','dd1c4241d5cd52651eabd8da145009de53888bd26abe28f2cad7f6e746d5b6dc','Soporte Técnico',4460.95,'2021-01-25',9),(15,'Alberto','Castro','Inactivo','cf65c58ba704c8cd8bc7be5153af97974a1f029a69468b5aac48e8d45983fe4b','Marketing',2482.66,'2015-07-20',4),(16,'Fernanda','Garcia','Activo','59c8839a5e3e968824e7c475fea67560e04a3fe04e3dcf9ddd83a7bb9b436a14','Ventas',3617.19,'2017-06-10',2),(17,'Ricardo','Mendoza','Activo','3fa04f8f03d0ef4354b1980021dc2668f905848e7186357f83d2b5fa2ae79ce8','Logística',3118.85,'2009-09-14',3),(18,'Elena','Hernandez','Inactivo','d7cc0fdf52bf2d3d44d8973cc93dd8590bffcab9e4f37ca26dde59f7f9932f68','Finanzas',4895.74,'2003-08-08',10),(19,'Oscar','Navarro','Activo','14c6ba766d94529a5f2eda1a102d29e22eef3f0992f9e4bdfbac291eb1696f5f','Recursos Humanos',3520.10,'2022-03-05',6),(20,'Valeria','Morales','Activo','573fd4fcc6e2ec969a88df2a52bb2ae4ec25b972f33173691e6da1880107dbcc','Desarrollador',2840.60,'2012-12-18',5),(21,'Carlos','López','Activo','ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f','Analista',2500.00,'2025-02-10',2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_fidelizacion`
--

DROP TABLE IF EXISTS `vista_fidelizacion`;
/*!50001 DROP VIEW IF EXISTS `vista_fidelizacion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_fidelizacion` AS SELECT 
 1 AS `usuario_id`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `actividad`,
 1 AS `puntos`,
 1 AS `fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_login`
--

DROP TABLE IF EXISTS `vista_login`;
/*!50001 DROP VIEW IF EXISTS `vista_login`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_login` AS SELECT 
 1 AS `usuario_id`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `fecha_hora`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_puntos_acumulados`
--

DROP TABLE IF EXISTS `vista_puntos_acumulados`;
/*!50001 DROP VIEW IF EXISTS `vista_puntos_acumulados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_puntos_acumulados` AS SELECT 
 1 AS `usuario_id`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `total_puntos`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'empresa_xyz'
--

--
-- Dumping routines for database 'empresa_xyz'
--
/*!50003 DROP PROCEDURE IF EXISTS `agregar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_usuario`(
    IN p_nombre VARCHAR(50), IN p_apellido VARCHAR(50), IN p_contraseña VARCHAR(255),
    IN p_cargo VARCHAR(100), IN p_salario DECIMAL(10,2), IN p_fecha_ingreso DATE, IN p_perfil_id INT
)
BEGIN
    INSERT INTO usuarios (nombre, apellido, estado, contraseña, cargo, salario, fecha_ingreso, perfil_id)
    VALUES (p_nombre, p_apellido, 'Activo', SHA2(p_contraseña, 256), p_cargo, p_salario, p_fecha_ingreso, p_perfil_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_evento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_evento`(
    IN p_tipo_evento VARCHAR(20), -- 'login' o 'fidelizacion'
    IN p_usuario_id INT,
    IN p_actividad_id INT, -- Solo para fidelización
    IN p_exito TINYINT, -- Solo para login
    IN p_puntos INT -- Solo para fidelización
)
BEGIN
    IF p_tipo_evento = 'login' THEN
        INSERT INTO login (usuario_id, fecha_hora, exito)
        VALUES (p_usuario_id, NOW(), p_exito);
    ELSEIF p_tipo_evento = 'fidelizacion' THEN
        INSERT INTO fidelizacion (usuario_id, actividad_id, puntos, fecha)
        VALUES (p_usuario_id, p_actividad_id, p_puntos, NOW());
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_fidelizacion`
--

/*!50001 DROP VIEW IF EXISTS `vista_fidelizacion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_fidelizacion` AS select `u`.`id` AS `usuario_id`,`u`.`nombre` AS `nombre`,`u`.`apellido` AS `apellido`,`a`.`nombre` AS `actividad`,`f`.`puntos` AS `puntos`,`f`.`fecha` AS `fecha` from ((`fidelizacion` `f` join `usuarios` `u` on((`f`.`usuario_id` = `u`.`id`))) join `actividades` `a` on((`f`.`actividad_id` = `a`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_login`
--

/*!50001 DROP VIEW IF EXISTS `vista_login`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_login` AS select `u`.`id` AS `usuario_id`,`u`.`nombre` AS `nombre`,`u`.`apellido` AS `apellido`,`l`.`fecha_hora` AS `fecha_hora`,if((`l`.`exito` = 1),'Éxito','Fallido') AS `estado` from (`login` `l` join `usuarios` `u` on((`l`.`usuario_id` = `u`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_puntos_acumulados`
--

/*!50001 DROP VIEW IF EXISTS `vista_puntos_acumulados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_puntos_acumulados` AS select `u`.`id` AS `usuario_id`,`u`.`nombre` AS `nombre`,`u`.`apellido` AS `apellido`,sum(`f`.`puntos`) AS `total_puntos` from (`fidelizacion` `f` join `usuarios` `u` on((`f`.`usuario_id` = `u`.`id`))) group by `u`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-20  3:59:43
