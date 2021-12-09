-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: 167.99.168.84    Database: S33Grupo1
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita` (
  `idCita` bigint NOT NULL AUTO_INCREMENT,
  `fechaInicioCita` timestamp NOT NULL,
  `fechaFinCita` timestamp NOT NULL,
  `estado` varchar(100) NOT NULL,
  `tipoConsulta` varchar(100) NOT NULL,
  `fk_idPaciente` bigint NOT NULL,
  `fk_idMedico` int DEFAULT NULL,
  PRIMARY KEY (`idCita`),
  KEY `cita_FK` (`fk_idPaciente`),
  CONSTRAINT `cita_FK` FOREIGN KEY (`fk_idPaciente`) REFERENCES `paciente` (`idPaciente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examen`
--

DROP TABLE IF EXISTS `examen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examen` (
  `idExamen` bigint NOT NULL AUTO_INCREMENT,
  `nombreExamen` varchar(100) NOT NULL,
  `archivo` varchar(100) NOT NULL,
  PRIMARY KEY (`idExamen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examen`
--

LOCK TABLES `examen` WRITE;
/*!40000 ALTER TABLE `examen` DISABLE KEYS */;
/*!40000 ALTER TABLE `examen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examenPaciente`
--

DROP TABLE IF EXISTS `examenPaciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examenPaciente` (
  `fk_idExamen` bigint NOT NULL,
  `fk_IdOrden` bigint NOT NULL,
  KEY `examenPaciente_FK_1` (`fk_idExamen`),
  KEY `examenPaciente_FK` (`fk_IdOrden`),
  CONSTRAINT `examenPaciente_FK` FOREIGN KEY (`fk_IdOrden`) REFERENCES `orden` (`idOrden`),
  CONSTRAINT `examenPaciente_FK_1` FOREIGN KEY (`fk_idExamen`) REFERENCES `examen` (`idExamen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examenPaciente`
--

LOCK TABLES `examenPaciente` WRITE;
/*!40000 ALTER TABLE `examenPaciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `examenPaciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formula`
--

DROP TABLE IF EXISTS `formula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formula` (
  `idFormula` bigint NOT NULL AUTO_INCREMENT,
  `indicaciones` varchar(500) NOT NULL,
  `fechaReceta` timestamp NOT NULL,
  `fk_idCita` bigint NOT NULL,
  PRIMARY KEY (`idFormula`),
  KEY `formula_FK` (`fk_idCita`),
  CONSTRAINT `formula_FK` FOREIGN KEY (`fk_idCita`) REFERENCES `cita` (`idCita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formula`
--

LOCK TABLES `formula` WRITE;
/*!40000 ALTER TABLE `formula` DISABLE KEYS */;
/*!40000 ALTER TABLE `formula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formulaMedicamento`
--

DROP TABLE IF EXISTS `formulaMedicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formulaMedicamento` (
  `fk_idFormula` bigint NOT NULL,
  `fk_idMedicamento` bigint NOT NULL,
  `cantidad` varchar(100) NOT NULL,
  KEY `formulaMedicamento_FK` (`fk_idFormula`),
  KEY `formulaMedicamento_FK_1` (`fk_idMedicamento`),
  CONSTRAINT `formulaMedicamento_FK` FOREIGN KEY (`fk_idFormula`) REFERENCES `formula` (`idFormula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `formulaMedicamento_FK_1` FOREIGN KEY (`fk_idMedicamento`) REFERENCES `medicamento` (`idMedicamento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formulaMedicamento`
--

LOCK TABLES `formulaMedicamento` WRITE;
/*!40000 ALTER TABLE `formulaMedicamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `formulaMedicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historiaClinica`
--

DROP TABLE IF EXISTS `historiaClinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historiaClinica` (
  `idHistoriaClinica` bigint NOT NULL AUTO_INCREMENT,
  `motivoConsulta` varchar(500) NOT NULL,
  `enfermedadActual` varchar(500) DEFAULT NULL,
  `peso` int NOT NULL,
  `talla` int NOT NULL,
  `imc` int NOT NULL,
  `temperatura` varchar(100) NOT NULL,
  `fecuenciaCardiaca` varchar(100) NOT NULL,
  `frecuenciaRespiratoria` varchar(100) NOT NULL,
  `presionArterial` varchar(100) NOT NULL,
  `examenFisicoGeneral` varchar(500) NOT NULL,
  `antecedentesPatologicos` varchar(500) DEFAULT NULL,
  `antecedentesQuirurgicos` varchar(500) DEFAULT NULL,
  `antecedentesAlergicos` varchar(500) DEFAULT NULL,
  `antecedentesFamiliares` varchar(500) DEFAULT NULL,
  `antecedentesOtros` varchar(500) DEFAULT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  `analisis` varchar(500) DEFAULT NULL,
  `plan` varchar(500) DEFAULT NULL,
  `diagnostico` varchar(500) DEFAULT NULL,
  `fk_idCita` bigint NOT NULL,
  PRIMARY KEY (`idHistoriaClinica`),
  KEY `historiaClinica_FK` (`fk_idCita`),
  CONSTRAINT `historiaClinica_FK` FOREIGN KEY (`fk_idCita`) REFERENCES `cita` (`idCita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historiaClinica`
--

LOCK TABLES `historiaClinica` WRITE;
/*!40000 ALTER TABLE `historiaClinica` DISABLE KEYS */;
/*!40000 ALTER TABLE `historiaClinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incapacidadMedica`
--

DROP TABLE IF EXISTS `incapacidadMedica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incapacidadMedica` (
  `idIncapacidad` bigint NOT NULL AUTO_INCREMENT,
  `motivoIncapacidad` varchar(100) NOT NULL,
  `fechaInicioIncapacidad` timestamp NOT NULL,
  `fechaFinalIncapacidad` timestamp NOT NULL,
  `fk_idPaciente` bigint NOT NULL,
  PRIMARY KEY (`idIncapacidad`),
  KEY `incapacidadMedica_FK` (`fk_idPaciente`),
  CONSTRAINT `incapacidadMedica_FK` FOREIGN KEY (`fk_idPaciente`) REFERENCES `paciente` (`idPaciente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incapacidadMedica`
--

LOCK TABLES `incapacidadMedica` WRITE;
/*!40000 ALTER TABLE `incapacidadMedica` DISABLE KEYS */;
/*!40000 ALTER TABLE `incapacidadMedica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento`
--

DROP TABLE IF EXISTS `medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamento` (
  `idMedicamento` bigint NOT NULL AUTO_INCREMENT,
  `codigoMedicamento` varchar(100) NOT NULL,
  `nombreMedicamento` varchar(100) NOT NULL,
  `presentacion` varchar(100) NOT NULL,
  PRIMARY KEY (`idMedicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento`
--

LOCK TABLES `medicamento` WRITE;
/*!40000 ALTER TABLE `medicamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `idMedico` bigint NOT NULL AUTO_INCREMENT,
  `primerNombre` varchar(100) NOT NULL,
  `segundoNombre` varchar(100) DEFAULT NULL,
  `primerApellido` varchar(100) NOT NULL,
  `segundoApellido` varchar(100) DEFAULT NULL,
  `usuario` varchar(100) NOT NULL,
  `contrasena` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fotoUsuario` varchar(100) DEFAULT NULL,
  `firma` varchar(100) NOT NULL,
  PRIMARY KEY (`idMedico`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (38,'Diego','Alejandro','Perez','Alejandro','Dlesmes','undefined','undefined','Dlesmes'),(48,'Natanael','Alfonso','Barrera','Alfonso','NBarrera','clave2','No tengo','NatoB'),(49,'Nathalia','Jully','Moreno','Jully','natha92','clave3','no tengo','nathy'),(52,'Pedro','Gardel','Ortiz','Salazar','Portiz','clave4','No tengo','PiterO'),(55,'Miller','Albeiro','Puentes','Lozano','mpuentes','clave 5','No tengo','mpuentesp');
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden` (
  `idOrden` bigint NOT NULL AUTO_INCREMENT,
  `indicaciones` varchar(100) NOT NULL,
  `fk_idCita` bigint NOT NULL,
  PRIMARY KEY (`idOrden`),
  KEY `orden_FK_1` (`fk_idCita`),
  CONSTRAINT `orden_FK_1` FOREIGN KEY (`fk_idCita`) REFERENCES `cita` (`idCita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `idPaciente` bigint NOT NULL AUTO_INCREMENT,
  `primerNombre` varchar(100) NOT NULL,
  `segundoNombre` varchar(100) DEFAULT NULL,
  `primerApellido` varchar(100) NOT NULL,
  `segundoApellido` varchar(100) NOT NULL,
  `tipoDocumento` varchar(100) NOT NULL,
  `numeroIdentificacion` varchar(100) NOT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `municipio` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `fechaNacimiento` timestamp NOT NULL,
  `sexo` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `fk_idMedico` bigint NOT NULL,
  PRIMARY KEY (`idPaciente`),
  KEY `paciente_idPaciente_IDX` (`idPaciente`) USING BTREE,
  KEY `paciente_FK` (`fk_idMedico`),
  CONSTRAINT `paciente_FK` FOREIGN KEY (`fk_idMedico`) REFERENCES `medico` (`idMedico`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-09  0:06:35
