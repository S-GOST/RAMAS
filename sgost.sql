-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sgost
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administradores` (
  `ID_ADMINISTRADOR` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `TipoDocumento` varchar(100) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_ADMINISTRADOR`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (1,'JuanP','Juanpxxx@gmail.com','5698745','322546987'),(2,'Alejo','Alejopxxx@gmail.com','5469871','325586787');
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `ID_CLIENTES` int(11) NOT NULL AUTO_INCREMENT,
  `ID_UBICACION` int(11) DEFAULT NULL,
  `Nombre` varchar(100) NOT NULL,
  `TipoDocumento` varchar(45) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_CLIENTES`),
  KEY `ID_UBICACION` (`ID_UBICACION`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`ID_UBICACION`) REFERENCES `ubicacion` (`ID_UBICACION`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (2,1,'Teodoro','Tarjeta de Identidad','Teodoroxxx@gmail.com','3112036543'),(3,2,'Bok','Cedula de Ciudadania','Bokxxx@gmail.com','3002548798'),(4,2,'Camila','Pasaporte','Camilaxxx@gmail.com','3102456987');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobante`
--

DROP TABLE IF EXISTS `comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprobante` (
  `ID_COMPROBANTE` int(11) NOT NULL AUTO_INCREMENT,
  `ID_INFORME` int(11) DEFAULT NULL,
  `ID_CLIENTES` int(11) DEFAULT NULL,
  `ID_ADMINISTRADOR` int(11) DEFAULT NULL,
  `Monto` decimal(10,2) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Estado_pago` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_COMPROBANTE`),
  KEY `ID_CLIENTES` (`ID_CLIENTES`),
  KEY `ID_ADMINISTRADOR` (`ID_ADMINISTRADOR`),
  KEY `comprobante_ibfk_1` (`ID_INFORME`),
  CONSTRAINT `comprobante_ibfk_1` FOREIGN KEY (`ID_INFORME`) REFERENCES `detalles_orden_servicio` (`ID_DETALLES_ORDEN_SERVICIO`),
  CONSTRAINT `comprobante_ibfk_2` FOREIGN KEY (`ID_CLIENTES`) REFERENCES `clientes` (`ID_CLIENTES`),
  CONSTRAINT `comprobante_ibfk_3` FOREIGN KEY (`ID_ADMINISTRADOR`) REFERENCES `administradores` (`ID_ADMINISTRADOR`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobante`
--

LOCK TABLES `comprobante` WRITE;
/*!40000 ALTER TABLE `comprobante` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprobante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_orden_servicio`
--

DROP TABLE IF EXISTS `detalles_orden_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_orden_servicio` (
  `ID_DETALLES_ORDEN_SERVICIO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ORDEN_SERVICIO` int(11) DEFAULT NULL,
  `ID_SERVICIOS` int(11) DEFAULT NULL,
  `ID_PRODUCTOS` int(11) DEFAULT NULL,
  `Garantia` varchar(100) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_DETALLES_ORDEN_SERVICIO`),
  KEY `ID_ORDEN_SERVICIO` (`ID_ORDEN_SERVICIO`),
  KEY `ID_SERVICIOS` (`ID_SERVICIOS`),
  KEY `ID_PRODUCTOS` (`ID_PRODUCTOS`),
  CONSTRAINT `detalles_orden_servicio_ibfk_1` FOREIGN KEY (`ID_ORDEN_SERVICIO`) REFERENCES `orden_servicio` (`ID_ORDEN_SERVICIO`),
  CONSTRAINT `detalles_orden_servicio_ibfk_2` FOREIGN KEY (`ID_SERVICIOS`) REFERENCES `servicios` (`ID_SERVICIOS`),
  CONSTRAINT `detalles_orden_servicio_ibfk_3` FOREIGN KEY (`ID_PRODUCTOS`) REFERENCES `productos` (`ID_PRODUCTOS`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_orden_servicio`
--

LOCK TABLES `detalles_orden_servicio` WRITE;
/*!40000 ALTER TABLE `detalles_orden_servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles_orden_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial`
--

DROP TABLE IF EXISTS `historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial` (
  `ID_HISTORIAL` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ORDEN_SERVICIO` int(11) DEFAULT NULL,
  `ID_COMPROBANTE` int(11) DEFAULT NULL,
  `ID_INFORME` int(11) DEFAULT NULL,
  `ID_TECNICOS` int(11) DEFAULT NULL,
  `ID_CLIENTES` int(11) DEFAULT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  `Fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`ID_HISTORIAL`),
  KEY `ID_ORDEN_SERVICIO` (`ID_ORDEN_SERVICIO`),
  KEY `ID_COMPROBANTE` (`ID_COMPROBANTE`),
  CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`ID_ORDEN_SERVICIO`) REFERENCES `orden_servicio` (`ID_ORDEN_SERVICIO`),
  CONSTRAINT `historial_ibfk_2` FOREIGN KEY (`ID_COMPROBANTE`) REFERENCES `comprobante` (`ID_COMPROBANTE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial`
--

LOCK TABLES `historial` WRITE;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informe`
--

DROP TABLE IF EXISTS `informe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informe` (
  `ID_INFORME` int(11) NOT NULL AUTO_INCREMENT,
  `ID_DETALLES_ORDEN_SERVICIO` int(11) DEFAULT NULL,
  `ID_ADMINISTRADOR` int(11) DEFAULT NULL,
  `ID_TECNICOS` int(11) DEFAULT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Estado` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_INFORME`),
  KEY `ID_ADMINISTRADOR` (`ID_ADMINISTRADOR`),
  KEY `ID_TECNICOS` (`ID_TECNICOS`),
  KEY `informe_ibfk_1` (`ID_DETALLES_ORDEN_SERVICIO`),
  CONSTRAINT `informe_ibfk_1` FOREIGN KEY (`ID_DETALLES_ORDEN_SERVICIO`) REFERENCES `orden_servicio` (`ID_ORDEN_SERVICIO`),
  CONSTRAINT `informe_ibfk_2` FOREIGN KEY (`ID_ADMINISTRADOR`) REFERENCES `administradores` (`ID_ADMINISTRADOR`),
  CONSTRAINT `informe_ibfk_3` FOREIGN KEY (`ID_TECNICOS`) REFERENCES `tecnicos` (`ID_TECNICOS`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informe`
--

LOCK TABLES `informe` WRITE;
/*!40000 ALTER TABLE `informe` DISABLE KEYS */;
INSERT INTO `informe` VALUES (1,1,1,2,'Lista para entrega','2025-11-11 00:00:00','Pendiente'),(2,2,2,1,'En espera','2025-11-20 00:00:00','Entregado'),(3,3,1,3,'En espera de repuestos','2025-11-25 00:00:00','Pendiente');
/*!40000 ALTER TABLE `informe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motos`
--

DROP TABLE IF EXISTS `motos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motos` (
  `ID_MOTOS` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CLIENTES` int(11) DEFAULT NULL,
  `Placa` varchar(20) NOT NULL,
  `Modelo` varchar(100) NOT NULL,
  `Marca` varchar(100) NOT NULL,
  `Recorrido` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_MOTOS`),
  KEY `ID_CLIENTES` (`ID_CLIENTES`),
  CONSTRAINT `motos_ibfk_1` FOREIGN KEY (`ID_CLIENTES`) REFERENCES `clientes` (`ID_CLIENTES`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motos`
--

LOCK TABLES `motos` WRITE;
/*!40000 ALTER TABLE `motos` DISABLE KEYS */;
/*!40000 ALTER TABLE `motos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_servicio`
--

DROP TABLE IF EXISTS `orden_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_servicio` (
  `ID_ORDEN_SERVICIO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CLIENTES` int(11) DEFAULT NULL,
  `ID_ADMINISTRADOR` int(11) DEFAULT NULL,
  `ID_TECNICOS` int(11) DEFAULT NULL,
  `ID_MOTOS` int(11) DEFAULT NULL,
  `Fecha_inicio` datetime NOT NULL,
  `Fecha_estimada` datetime NOT NULL,
  `Fecha_fin` datetime NOT NULL,
  `Estado` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_ORDEN_SERVICIO`),
  KEY `ID_CLIENTES` (`ID_CLIENTES`),
  KEY `ID_ADMINISTRADOR` (`ID_ADMINISTRADOR`),
  KEY `ID_TECNICOS` (`ID_TECNICOS`),
  KEY `ID_MOTOS` (`ID_MOTOS`),
  CONSTRAINT `orden_servicio_ibfk_1` FOREIGN KEY (`ID_CLIENTES`) REFERENCES `clientes` (`ID_CLIENTES`),
  CONSTRAINT `orden_servicio_ibfk_2` FOREIGN KEY (`ID_ADMINISTRADOR`) REFERENCES `administradores` (`ID_ADMINISTRADOR`),
  CONSTRAINT `orden_servicio_ibfk_3` FOREIGN KEY (`ID_TECNICOS`) REFERENCES `tecnicos` (`ID_TECNICOS`),
  CONSTRAINT `orden_servicio_ibfk_4` FOREIGN KEY (`ID_MOTOS`) REFERENCES `motos` (`ID_MOTOS`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_servicio`
--

LOCK TABLES `orden_servicio` WRITE;
/*!40000 ALTER TABLE `orden_servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `ID_PRODUCTOS` int(11) NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(100) NOT NULL,
  `Marca` varchar(100) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Garantia` varchar(100) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_PRODUCTOS`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Lubricantes y Refrigerantes','Motorex','Aceite','30',120000.00,8,'Disponibles'),(2,'Accesorios Mecanicos','Rombo','Cadena','30',180000.00,5,'Disponibles'),(3,'Accesorios Electricos','Minda','Direccionales','10',150000.00,15,'Disponibles');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `ID_SERVICIOS` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Categoria` varchar(100) NOT NULL,
  `Garantia` varchar(100) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_SERVICIOS`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Mantenimineto preventivo','Mantenimientos','30','Disponible',6000000.00),(2,'Reparacion por daños','Reparaciones','-','Disponible',0.00),(3,'Instalaciones de accesorios','Instalaciones','14','Disponible',300000.00),(4,'Diagnosticos motor ','Diagnosticos','-','Disponible',600000.00);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnicos`
--

DROP TABLE IF EXISTS `tecnicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnicos` (
  `ID_TECNICOS` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `TipoDocumento` varchar(100) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_TECNICOS`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnicos`
--

LOCK TABLES `tecnicos` WRITE;
/*!40000 ALTER TABLE `tecnicos` DISABLE KEYS */;
INSERT INTO `tecnicos` VALUES (1,'Camilo','52145698','Camiloxxx@gmail.com','315487962'),(2,'Alejandro','5463215','Alejandroxxx@gmail.com','311486562'),(3,'Santiago','5471256','Santiagoxxx@gmail.com','312425462');
/*!40000 ALTER TABLE `tecnicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacion`
--

DROP TABLE IF EXISTS `ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicacion` (
  `ID_UBICACION` int(11) NOT NULL AUTO_INCREMENT,
  `Departamento` varchar(100) NOT NULL,
  `Ciudad` varchar(100) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_UBICACION`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion`
--

LOCK TABLES `ubicacion` WRITE;
/*!40000 ALTER TABLE `ubicacion` DISABLE KEYS */;
INSERT INTO `ubicacion` VALUES (1,'Cundinamarca','Soacha','Cra 40-55 sur'),(2,'Bogota','Suba','Cra 30-13 norte'),(3,'Cundinamarca','Sopo','Cra 80-20');
/*!40000 ALTER TABLE `ubicacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-07 19:41:30
