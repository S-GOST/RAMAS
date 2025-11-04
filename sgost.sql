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
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (1,'Alejandro','alejandroxxxx@gmail.com','2025469',322456321),(2,'Juan','Juanxxx@gmail.com','7854698',300254987);
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'1','Teodoro','Teodoroxxxx@gmail.com','45253'),(2,'2','Bock','Bockxxxx@gmail.com','57415'),(3,'3','Terry','Terryxxxx@gmail.com','89552');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `comprobante`
--

LOCK TABLES `comprobante` WRITE;
/*!40000 ALTER TABLE `comprobante` DISABLE KEYS */;
INSERT INTO `comprobante` VALUES (1,1,1,2,300.00,'2025-10-20 13:30:20','PAGO'),(2,2,2,1,400.00,'2025-10-20 13:30:20','PENDIENTE'),(3,3,3,1,500.00,'2025-10-20 13:30:20','PENDIENTE');
/*!40000 ALTER TABLE `comprobante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `detalles_orden_servicio`
--

LOCK TABLES `detalles_orden_servicio` WRITE;
/*!40000 ALTER TABLE `detalles_orden_servicio` DISABLE KEYS */;
INSERT INTO `detalles_orden_servicio` VALUES (1,1,1,2,'30','300.000'),(2,2,2,0,'30','400.000'),(3,3,4,3,'30','600.000');
/*!40000 ALTER TABLE `detalles_orden_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `historial`
--

LOCK TABLES `historial` WRITE;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
INSERT INTO `historial` VALUES (1,'1','1',1,1,'1','Historial','2025-11-08 13:20:10');
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `informe`
--

LOCK TABLES `informe` WRITE;
/*!40000 ALTER TABLE `informe` DISABLE KEYS */;
INSERT INTO `informe` VALUES (1,1,1,1,'Reporte de avances','2025-10-30 16:30:20','Lista para entrega'),(2,2,2,2,'Reporte de avances','2025-10-20 13:30:20','En proceso'),(3,3,1,3,'Reporte de avances','2025-10-20 13:30:20','Finalizada');
/*!40000 ALTER TABLE `informe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `motos`
--

LOCK TABLES `motos` WRITE;
/*!40000 ALTER TABLE `motos` DISABLE KEYS */;
INSERT INTO `motos` VALUES (2,1,'MIN587','390','DUKE','36000KM'),(3,2,'NUN789','200','DUKE','26000KM'),(4,3,'MOM564','250','DUKE','46000KM');
/*!40000 ALTER TABLE `motos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `orden_servicio`
--

LOCK TABLES `orden_servicio` WRITE;
/*!40000 ALTER TABLE `orden_servicio` DISABLE KEYS */;
INSERT INTO `orden_servicio` VALUES (1,1,1,1,2,'2025-08-02 13:25:20','2025-08-02 13:25:20','2025-08-02 16:35:20','En proceso'),(2,2,1,2,3,'2025-10-20 13:25:20','2025-10-30 13:25:20','2025-10-31 16:35:20','Finalizada'),(3,3,2,3,4,'2025-10-15 13:25:20','2025-10-20 13:25:20','2025-10-18 16:35:20','En espera repuestos');
/*!40000 ALTER TABLE `orden_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (2,'Lubricantes y Refrigerantes','Motorex','Aceite','-','160.000',5,'Disponibles'),(3,'Accesorios Mecanicos','Rombo','Cadena','30','260.000',5,'Disponibles'),(4,'Accesorios Electricos','Antishock KTM','Dirreccionales','30','90.000',5,'Disponibles');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Mantenimientos','Mantenimiento Preventivo','30','Disponible','300.000'),(2,'Reparaciones','reparacion por daños','30','Disponible','300.000'),(3,'Diagnosticos','revision','30','Disponible','60.000'),(4,'Instalaciones','instalacion de accesorios','20','Disponible','160.000');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tecnicos`
--

LOCK TABLES `tecnicos` WRITE;
/*!40000 ALTER TABLE `tecnicos` DISABLE KEYS */;
INSERT INTO `tecnicos` VALUES (1,'Santiago','Santiagoxxx@gmail.com','9875642',315456987),(2,'Camilo','Camiloxxx@gmail.com','5648796',311456987),(3,'Alejandro','Alejandroxxx@gmail.com','6954782',310256987);
/*!40000 ALTER TABLE `tecnicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ubicacion`
--

LOCK TABLES `ubicacion` WRITE;
/*!40000 ALTER TABLE `ubicacion` DISABLE KEYS */;
INSERT INTO `ubicacion` VALUES (1,'Cundinamarca','Briseno','80'),(2,'Cundinamarca','Guatoque','80'),(3,'Cundinamarca','El carmen','80');
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

-- Dump completed on 2025-11-01 18:33:41
