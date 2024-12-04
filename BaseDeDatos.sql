CREATE DATABASE  IF NOT EXISTS `tuberculosisproyectlleno` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tuberculosisproyectlleno`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: tuberculosisproyectlleno
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `criterioingreso`
--

DROP TABLE IF EXISTS `criterioingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `criterioingreso` (
  `idCriterioIngreso` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(30) NOT NULL COMMENT 'ExtraPulmonar\\\\nClinico\\\\nBactereologico\\\\nOtro (ninguno)',
  `subtipo` varchar(100) DEFAULT NULL,
  `estadoIngreso` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaActualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idCriterioIngreso`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criterioingreso`
--

LOCK TABLES `criterioingreso` WRITE;
/*!40000 ALTER TABLE `criterioingreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `criterioingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `establecimientosalud`
--

DROP TABLE IF EXISTS `establecimientosalud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `establecimientosalud` (
  `idEstablecimientoSalud` int NOT NULL AUTO_INCREMENT,
  `nombreEstablecimiento` varchar(60) DEFAULT NULL,
  `clasificacion` varchar(30) DEFAULT NULL COMMENT 'Valores: Publico (PUB)',
  `telefono` varchar(15) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaActualizacion` datetime DEFAULT NULL,
  `idRedSalud` int NOT NULL,
  PRIMARY KEY (`idEstablecimientoSalud`),
  KEY `fk_EstablecimientoSalud_RedSalud1_idx` (`idRedSalud`),
  CONSTRAINT `fk_EstablecimientoSalud_RedSalud1` FOREIGN KEY (`idRedSalud`) REFERENCES `redsalud` (`idRedSalud`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establecimientosalud`
--

LOCK TABLES `establecimientosalud` WRITE;
/*!40000 ALTER TABLE `establecimientosalud` DISABLE KEYS */;
/*!40000 ALTER TABLE `establecimientosalud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familiarreferencia`
--

DROP TABLE IF EXISTS `familiarreferencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `familiarreferencia` (
  `idFamiliarReferencia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `apellido` varchar(120) NOT NULL,
  `numCelular` varchar(15) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaActualizacion` datetime DEFAULT NULL,
  `Persona_idPersona` int NOT NULL,
  PRIMARY KEY (`idFamiliarReferencia`),
  KEY `fk_FamiliarReferencia_Persona1_idx` (`Persona_idPersona`),
  CONSTRAINT `fk_FamiliarReferencia_Persona1` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familiarreferencia`
--

LOCK TABLES `familiarreferencia` WRITE;
/*!40000 ALTER TABLE `familiarreferencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `familiarreferencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `idPersona` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) NOT NULL,
  `primerApellido` varchar(60) NOT NULL,
  `segundoApellido` varchar(60) DEFAULT NULL,
  `numeroCelular` varchar(15) NOT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `sexo` varchar(10) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `CI` varchar(12) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaActualizacion` datetime DEFAULT NULL,
  `EstablecimientoSalud_idEstablecimientoSalud` int DEFAULT NULL,
  `idCriterioIngreso` int DEFAULT NULL,
  PRIMARY KEY (`idPersona`),
  KEY `fk_Persona_EstablecimientoSalud1_idx` (`EstablecimientoSalud_idEstablecimientoSalud`),
  KEY `fk_CriterioIngreso` (`idCriterioIngreso`),
  CONSTRAINT `fk_CriterioIngreso` FOREIGN KEY (`idCriterioIngreso`) REFERENCES `criterioingreso` (`idCriterioIngreso`),
  CONSTRAINT `fk_Persona_EstablecimientoSalud1` FOREIGN KEY (`EstablecimientoSalud_idEstablecimientoSalud`) REFERENCES `establecimientosalud` (`idEstablecimientoSalud`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Admin','Admin',NULL,'77777777',NULL,NULL,NULL,'00000000',1,'2024-12-04 19:39:33',NULL,NULL,NULL);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_has_transferencia`
--

DROP TABLE IF EXISTS `persona_has_transferencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona_has_transferencia` (
  `Persona_idPersona` int NOT NULL,
  `Transferencia_idTransferencia` int NOT NULL,
  PRIMARY KEY (`Persona_idPersona`,`Transferencia_idTransferencia`),
  KEY `fk_Persona_has_Transferencia_Transferencia1_idx` (`Transferencia_idTransferencia`),
  KEY `fk_Persona_has_Transferencia_Persona1_idx` (`Persona_idPersona`),
  CONSTRAINT `fk_Persona_has_Transferencia_Persona1` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`),
  CONSTRAINT `fk_Persona_has_Transferencia_Transferencia1` FOREIGN KEY (`Transferencia_idTransferencia`) REFERENCES `transferencia` (`idTransferencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_has_transferencia`
--

LOCK TABLES `persona_has_transferencia` WRITE;
/*!40000 ALTER TABLE `persona_has_transferencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona_has_transferencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalsalud`
--

DROP TABLE IF EXISTS `personalsalud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personalsalud` (
  `persona_idPersona` int NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `contrasenia` varchar(30) NOT NULL,
  `rol` varchar(45) NOT NULL,
  PRIMARY KEY (`persona_idPersona`),
  KEY `fk_personalsalud_persona1_idx` (`persona_idPersona`),
  CONSTRAINT `fk_personalsalud_persona1` FOREIGN KEY (`persona_idPersona`) REFERENCES `persona` (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalsalud`
--

LOCK TABLES `personalsalud` WRITE;
/*!40000 ALTER TABLE `personalsalud` DISABLE KEYS */;
INSERT INTO `personalsalud` VALUES (1,'admin','admin','SuperAdmin');
/*!40000 ALTER TABLE `personalsalud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redsalud`
--

DROP TABLE IF EXISTS `redsalud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `redsalud` (
  `idRedSalud` int NOT NULL AUTO_INCREMENT,
  `nombreRedSalud` varchar(50) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaActualizacion` datetime DEFAULT NULL,
  `idSede` int NOT NULL,
  PRIMARY KEY (`idRedSalud`),
  KEY `fk_RedSalud_Sede1_idx` (`idSede`),
  CONSTRAINT `fk_RedSalud_Sede1` FOREIGN KEY (`idSede`) REFERENCES `sede` (`idSede`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redsalud`
--

LOCK TABLES `redsalud` WRITE;
/*!40000 ALTER TABLE `redsalud` DISABLE KEYS */;
/*!40000 ALTER TABLE `redsalud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sede` (
  `idSede` int NOT NULL AUTO_INCREMENT,
  `nombreSede` varchar(50) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaActualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idSede`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguimiento`
--

DROP TABLE IF EXISTS `seguimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguimiento` (
  `idSeguimiento` int NOT NULL AUTO_INCREMENT,
  `video` varchar(100) NOT NULL,
  `fechaEnvio` datetime NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `Persona_idPersona` int NOT NULL,
  `EstablecimientoSalud_idEstablecimientoSalud` int NOT NULL,
  PRIMARY KEY (`idSeguimiento`),
  KEY `fk_Seguimiento_Persona1_idx` (`Persona_idPersona`),
  KEY `fk_Seguimiento_EstablecimientoSalud1_idx` (`EstablecimientoSalud_idEstablecimientoSalud`),
  CONSTRAINT `fk_Seguimiento_EstablecimientoSalud1` FOREIGN KEY (`EstablecimientoSalud_idEstablecimientoSalud`) REFERENCES `establecimientosalud` (`idEstablecimientoSalud`),
  CONSTRAINT `fk_Seguimiento_Persona1` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguimiento`
--

LOCK TABLES `seguimiento` WRITE;
/*!40000 ALTER TABLE `seguimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `seguimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferencia`
--

DROP TABLE IF EXISTS `transferencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferencia` (
  `idTransferencia` int NOT NULL AUTO_INCREMENT,
  `idEstablecimientoSaludOrigen` int NOT NULL,
  `idEstablecimientoSaludDestino` int NOT NULL,
  `idPersona` int NOT NULL,
  `motivo` varchar(45) NOT NULL,
  `observacion` varchar(200) DEFAULT NULL,
  `documentoRef` longtext,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaActualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idTransferencia`),
  KEY `fk_Transferencia_EstablecimientoSalud1_idx` (`idEstablecimientoSaludOrigen`),
  KEY `fk_Transferencia_EstablecimientoSalud2_idx` (`idEstablecimientoSaludDestino`),
  KEY `fk_Transferencia_Persona1_idx` (`idPersona`),
  CONSTRAINT `fk_Transferencia_EstablecimientoSalud1` FOREIGN KEY (`idEstablecimientoSaludOrigen`) REFERENCES `establecimientosalud` (`idEstablecimientoSalud`),
  CONSTRAINT `fk_Transferencia_EstablecimientoSalud2` FOREIGN KEY (`idEstablecimientoSaludDestino`) REFERENCES `establecimientosalud` (`idEstablecimientoSalud`),
  CONSTRAINT `fk_Transferencia_Persona1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferencia`
--

LOCK TABLES `transferencia` WRITE;
/*!40000 ALTER TABLE `transferencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamiento`
--

DROP TABLE IF EXISTS `tratamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamiento` (
  `idTratamiento` int NOT NULL AUTO_INCREMENT,
  `medicamento` varchar(45) NOT NULL,
  `fechaInicio` datetime NOT NULL,
  `fechaFinalizacion` datetime DEFAULT NULL,
  `cantDosis` int NOT NULL,
  `intervaloTiempo` int NOT NULL,
  `Persona_idPersona` int NOT NULL,
  PRIMARY KEY (`idTratamiento`),
  KEY `fk_Tratamiento_Persona1_idx` (`Persona_idPersona`),
  CONSTRAINT `fk_Tratamiento_Persona1` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamiento`
--

LOCK TABLES `tratamiento` WRITE;
/*!40000 ALTER TABLE `tratamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tratamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `video_base64` longtext,
  `fecha_subida` datetime DEFAULT CURRENT_TIMESTAMP,
  `persona_idPersona` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_persona_id` (`persona_idPersona`),
  CONSTRAINT `fk_persona_id` FOREIGN KEY (`persona_idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-04 19:49:41
