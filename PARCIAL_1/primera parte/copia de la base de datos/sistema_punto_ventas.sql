-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema_punto_ventas
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL,
  `empresa` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `departamento` varchar(50) DEFAULT NULL,
  `codigoPostal` varchar(15) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `empleadoAtiende` int DEFAULT NULL,
  `limiteCredito` double DEFAULT NULL,
  `tipo_cliente` enum('Regular','Premium') DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `telefono` (`telefono`),
  KEY `empleadoAtiende` (`empleadoAtiende`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`empleadoAtiende`) REFERENCES `empleados` (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Tech Solutions','Johnson','Robert','+1 555-1234','456 Tech Ave','New York','Sales','10005','USA',1001,5000,'Regular'),(2,'Fashionista','Gomez','Isabella','+1 555-5678','789 Fashion St','Los Angeles','Marketing','90010','USA',1002,10000,'Premium'),(3,'Books & More','Dubois','Émilie','+33 1 2345-6789','101 Rue du Livre','Paris','Finance','75005','France',1003,7500,'Regular'),(4,'Tech Japan','Yamamoto','Takashi','+81 3 4567-8901','789 Gadget Blvd','Tokyo','Development','100-0003','Japan',1004,30000,'Premium'),(5,'Aussie Gadgets','White','Emily','+61 2 3456-7890','123 Kangaroo Ave','Sydney','Operations','2000','Australia',1005,15000,'Regular'),(6,'Brazil Beauty','Oliveira','Lucas','+55 11 9876-5432','456 Beleza St','São Paulo','HR','01315-000','Brazil',1006,20000,'Premium'),(7,'Berlin Books','Schmidt','Lena','+49 30 1234-5678','789 Buchstrasse','Berlin','IT','10117','Germany',1007,12000,'Regular');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallesordenes`
--

DROP TABLE IF EXISTS `detallesordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallesordenes` (
  `id_orden` int NOT NULL,
  `id_producto` varchar(15) NOT NULL,
  `cantidadPedida` int DEFAULT NULL,
  `valorUnitario` double DEFAULT NULL,
  `ordenEntrega` int DEFAULT NULL,
  `tipo_detalle` enum('Regular','Especial') DEFAULT NULL,
  `es_prioritario` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_orden`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detallesordenes_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `ordenes` (`id_orden`),
  CONSTRAINT `detallesordenes_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallesordenes`
--

LOCK TABLES `detallesordenes` WRITE;
/*!40000 ALTER TABLE `detallesordenes` DISABLE KEYS */;
INSERT INTO `detallesordenes` VALUES (1001,'PROD001',10,599.99,1,'Regular',1),(1001,'PROD002',20,19.99,2,'Regular',0),(1002,'PROD003',5,9.99,1,'Regular',1),(1003,'PROD004',2,49.99,1,'Especial',0),(1004,'PROD005',15,14.99,1,'Regular',1),(1005,'PROD006',1,29.99,1,'Regular',1),(1005,'PROD007',50,9.99,2,'Regular',0);
/*!40000 ALTER TABLE `detallesordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `documento` int NOT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id_oficina` varchar(10) DEFAULT NULL,
  `jefe` int DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `tipo_contrato` enum('Permanente','Temporal') DEFAULT NULL,
  PRIMARY KEY (`documento`),
  UNIQUE KEY `email` (`email`),
  KEY `id_oficina` (`id_oficina`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_oficina`) REFERENCES `oficinas` (`id_oficina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1001,'Smith','John','1234','jsmith@example.com','OF001',NULL,'Sales Manager','Permanente'),(1002,'Garcia','Maria','5678','mgarcia@example.com','OF002',1001,'Marketing Assistant','Permanente'),(1003,'Müller','Hans','9101','hmuller@example.com','OF003',1001,'Financial Analyst','Permanente'),(1004,'Tanaka','Yuki','2345','ytanaka@example.com','OF004',1001,'Software Developer','Permanente'),(1005,'Chen','Wei','6789','wchen@example.com','OF005',1001,'Operations Coordinator','Permanente'),(1006,'Silva','Carlos','1112','csilva@example.com','OF006',1001,'HR Specialist','Permanente'),(1007,'Schulz','Anna','1314','aschulz@example.com','OF007',1001,'IT Technician','Permanente');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineasproductos`
--

DROP TABLE IF EXISTS `lineasproductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineasproductos` (
  `id_lineaProducto` int NOT NULL,
  `nombreLinea` varchar(50) DEFAULT NULL,
  `textoDescripcion` varchar(4000) DEFAULT NULL,
  `htmlDescripcion` varchar(200) DEFAULT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `es_activa` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_lineaProducto`),
  UNIQUE KEY `nombreLinea` (`nombreLinea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineasproductos`
--

LOCK TABLES `lineasproductos` WRITE;
/*!40000 ALTER TABLE `lineasproductos` DISABLE KEYS */;
INSERT INTO `lineasproductos` VALUES (1,'Electronics','Electronic products line','<p>Electronic products line description</p>','electronic.jpg',1),(2,'Clothing','Clothing and apparel','<p>Clothing and apparel description</p>','clothing.jpg',1),(3,'Books','Books and literature','<p>Books and literature description</p>','books.jpg',1),(4,'Toys','Toys and games','<p>Toys and games description</p>','toys.jpg',1),(5,'Sports','Sports equipment','<p>Sports equipment description</p>','sports.jpg',1),(6,'Home','Home and garden','<p>Home and garden description</p>','home.jpg',1),(7,'Beauty','Beauty products','<p>Beauty products description</p>','beauty.jpg',1);
/*!40000 ALTER TABLE `lineasproductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oficinas`
--

DROP TABLE IF EXISTS `oficinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oficinas` (
  `id_oficina` varchar(10) NOT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `departamento` varchar(50) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `codigoPostal` varchar(15) DEFAULT NULL,
  `continente` varchar(10) DEFAULT NULL,
  `tipo_oficina` enum('Principal','Sucursal') DEFAULT NULL,
  `es_activa` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_oficina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oficinas`
--

LOCK TABLES `oficinas` WRITE;
/*!40000 ALTER TABLE `oficinas` DISABLE KEYS */;
INSERT INTO `oficinas` VALUES ('OF001','New York','+1 123-456-7890','123 Main St','Sales','USA','10001','América','Principal',1),('OF002','Los Angeles','+1 987-654-3210','456 Elm St','Marketing','USA','90001','América','Sucursal',1),('OF003','Paris','+33 1 2345-6789','789 Rue Principale','Finance','France','75001','Europa','Sucursal',1),('OF004','Tokyo','+81 3 4567-8901','101 Sakura Ave','Development','Japan','100-0001','Asia','Sucursal',1),('OF005','Sydney','+61 2 3456-7890','567 Kangaroo St','Operations','Australia','2000','Oceanía','Sucursal',1),('OF006','São Paulo','+55 11 9876-5432','321 Avenida Paulista','HR','Brazil','01310-000','América','Sucursal',1),('OF007','Berlin','+49 30 1234-5678','987 Hauptstrasse','IT','Germany','10115','Europa','Sucursal',1);
/*!40000 ALTER TABLE `oficinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes`
--

DROP TABLE IF EXISTS `ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes` (
  `id_orden` int NOT NULL,
  `fechaRecibido` date DEFAULT NULL,
  `fechaLimiteEntrega` date DEFAULT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `estado` varchar(15) DEFAULT NULL,
  `observacion` text,
  `id_cliente` int DEFAULT NULL,
  `tipo_envio` enum('Normal','Express') DEFAULT NULL,
  `es_internacional` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes`
--

LOCK TABLES `ordenes` WRITE;
/*!40000 ALTER TABLE `ordenes` DISABLE KEYS */;
INSERT INTO `ordenes` VALUES (1001,'2024-06-01','2024-06-10','2024-06-08','Entregado','Cliente satisfecho',1,'Normal',0),(1002,'2024-06-02','2024-06-12',NULL,'En proceso','Esperando confirmación de pago',2,'Express',0),(1003,'2024-06-03','2024-06-15',NULL,'En proceso','Productos en backorder',3,'Normal',1),(1004,'2024-06-04','2024-06-14','2024-06-13','Entregado','Entrega exitosa',4,'Express',0),(1005,'2024-06-05','2024-06-20',NULL,'En proceso','Revisión aduanal pendiente',5,'Normal',1),(1006,'2024-06-06','2024-06-18','2024-06-17','Entregado','Cliente recogió en tienda',6,'Express',0),(1007,'2024-06-07','2024-06-22',NULL,'En proceso','Esperando confirmación de stock',7,'Normal',1);
/*!40000 ALTER TABLE `ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id_cliente` int NOT NULL,
  `numeroFactura` varchar(50) NOT NULL,
  `fechaPago` date DEFAULT NULL,
  `totalPago` double DEFAULT NULL,
  `tipo_pago` enum('Contado','Crédito') DEFAULT NULL,
  PRIMARY KEY (`id_cliente`,`numeroFactura`),
  UNIQUE KEY `numeroFactura` (`numeroFactura`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,'F2024-001','2024-06-10',5999.9,'Crédito'),(2,'F2024-002','2024-06-12',399.95,'Contado'),(3,'F2024-003','2024-06-15',49.95,'Contado'),(4,'F2024-004','2024-06-14',749.85,'Crédito'),(5,'F2024-005','2024-06-20',224.85,'Crédito'),(6,'F2024-006','2024-06-17',149.95,'Contado'),(7,'F2024-007','2024-06-22',499.5,'Crédito');
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` varchar(15) NOT NULL,
  `nombreProducto` varchar(70) DEFAULT NULL,
  `id_lineaProducto` int DEFAULT NULL,
  `escala` varchar(10) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precioVenta` double DEFAULT NULL,
  `MSRP` double DEFAULT NULL,
  `es_disponible` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `nombreProducto` (`nombreProducto`),
  KEY `id_lineaProducto` (`id_lineaProducto`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_lineaProducto`) REFERENCES `lineasproductos` (`id_lineaProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES ('PROD001','Smartphone X',1,'1:10',100,599.99,699.99,1),('PROD002','T-shirt Basic',2,'S',500,19.99,24.99,1),('PROD003','Book of Wonders',3,'',200,9.99,14.99,1),('PROD004','LEGO Set 123',4,'',50,49.99,59.99,1),('PROD005','Soccer Ball',5,'',100,14.99,19.99,1),('PROD006','Garden Hose 30m',6,'',30,29.99,34.99,1),('PROD007','Lipstick Red',7,'',300,9.99,12.99,1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-27 18:14:29
