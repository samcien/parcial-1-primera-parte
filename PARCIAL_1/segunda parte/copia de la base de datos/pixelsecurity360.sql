-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: pixelsecurity360
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
-- Table structure for table `autenticacion`
--

DROP TABLE IF EXISTS `autenticacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autenticacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `agente_usuario` varchar(100) NOT NULL,
  `token` varchar(255) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `autenticacion_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autenticacion`
--

LOCK TABLES `autenticacion` WRITE;
/*!40000 ALTER TABLE `autenticacion` DISABLE KEYS */;
INSERT INTO `autenticacion` VALUES (1,1,'juanperez','contraseña123','Mozilla/5.0','token123','2024-06-27 21:45:20'),(2,2,'mariagarcia','password456','Chrome/99.0','token456','2024-06-27 21:45:20'),(3,3,'carloslopez','secreto789','Safari/15.0','token789','2024-06-27 21:45:20'),(4,4,'anamartinez','claveabc','Edge/99.0','tokenabc','2024-06-27 21:45:20'),(5,5,'pedrorodriguez','contraseñaXYZ','Firefox/100.0','tokenxyz','2024-06-27 21:45:20'),(6,6,'laurahernandez','passwordDEF','Chrome/99.0','tokendef','2024-06-27 21:45:20'),(7,7,'javiergomez','secretoDGH','Edge/99.0','tokendgh','2024-06-27 21:45:20'),(8,8,'sofiadiaz','claveIJK','Safari/15.0','tokenijk','2024-06-27 21:45:20'),(9,9,'diegotorres','passwordLMN','Mozilla/5.0','tokenlmn','2024-06-27 21:45:20'),(10,10,'elenalopez','secretoOPQ','Chrome/99.0','tokenopq','2024-06-27 21:45:20'),(11,11,'andresmartin','claveRST','Edge/99.0','tokenrst','2024-06-27 21:45:20'),(12,12,'luciaruiz','passwordUVW','Firefox/100.0','tokenuvw','2024-06-27 21:45:20'),(13,13,'pablogonzalez','secretoXYZ','Safari/15.0','tokenxyz','2024-06-27 21:45:20'),(14,14,'marinasanchez','claveABC','Edge/99.0','tokenabc','2024-06-27 21:45:20'),(15,15,'robertomartinez','passwordDEF','Mozilla/5.0','tokendef','2024-06-27 21:45:20'),(16,16,'valeriahernandez','secretoDGH','Chrome/99.0','tokendgh','2024-06-27 21:45:20'),(17,17,'gabrielflores','claveIJK','Edge/99.0','tokenijk','2024-06-27 21:45:20'),(18,18,'carolinadiaz','passwordLMN','Firefox/100.0','tokenlmn','2024-06-27 21:45:20'),(19,19,'alejandrolopez','secretoOPQ','Safari/15.0','tokenopq','2024-06-27 21:45:20'),(20,20,'isabellagarcia','claveRST','Edge/99.0','tokenrst','2024-06-27 21:45:20');
/*!40000 ALTER TABLE `autenticacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `numero_tarjeta` varchar(16) NOT NULL,
  `nombre_titular` varchar(100) NOT NULL,
  `cvc` varchar(4) NOT NULL,
  `fecha_expiracion` date NOT NULL,
  `por_defecto` tinyint(1) NOT NULL,
  `id_tipo_tarjeta` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_tipo_tarjeta` (`id_tipo_tarjeta`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`id_tipo_tarjeta`) REFERENCES `tipos_tarjetas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,1,'1234567812345678','Juan Perez','123','2023-08-31',1,1),(2,2,'2345678923456789','Maria Garcia','234','2024-09-30',0,2),(3,3,'3456789034567890','Carlos Lopez','345','2025-10-31',1,3),(4,4,'4567890145678901','Ana Martinez','456','2026-11-30',0,4),(5,5,'5678901256789012','Pedro Rodriguez','567','2027-12-31',1,1),(6,6,'6789012367890123','Laura Hernandez','678','2028-01-31',0,2),(7,7,'7890123478901234','Javier Gomez','789','2029-02-28',1,3),(8,8,'8901234589012345','Sofia Diaz','890','2030-03-31',0,4),(9,9,'9012345690123456','Diego Torres','901','2031-04-30',1,1),(10,10,'0123456701234567','Elena Lopez','012','2032-05-31',0,2),(11,11,'1234567812345678','Andres Martin','123','2023-06-30',1,3),(12,12,'2345678923456789','Lucia Ruiz','234','2024-07-31',0,4),(13,13,'3456789034567890','Pablo Gonzalez','345','2025-08-31',1,1),(14,14,'4567890145678901','Marina Sanchez','456','2026-09-30',0,2),(15,15,'5678901256789012','Roberto Martinez','567','2027-10-31',1,3),(16,16,'6789012367890123','Valeria Hernandez','678','2028-11-30',0,4),(17,17,'7890123478901234','Gabriel Flores','789','2029-12-31',1,1),(18,18,'8901234589012345','Carolina Diaz','890','2030-01-31',0,2),(19,19,'9012345690123456','Alejandro Lopez','901','2031-02-28',1,3),(20,20,'0123456701234567','Isabella Garcia','012','2032-03-31',0,4);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportes`
--

DROP TABLE IF EXISTS `reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_TPrueba` int NOT NULL,
  `contenido` text NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('pendiente','completado','en_progreso') NOT NULL,
  `comentarios` text,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_TPrueba` (`id_TPrueba`),
  CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `reportes_ibfk_2` FOREIGN KEY (`id_TPrueba`) REFERENCES `tipos_pruebas` (`id_TPrueba`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes`
--

LOCK TABLES `reportes` WRITE;
/*!40000 ALTER TABLE `reportes` DISABLE KEYS */;
INSERT INTO `reportes` VALUES (1,1,1,'Reporte detallado de reconocimiento inicial.','2024-06-27 10:15:00','completado','Sin comentarios.'),(2,2,2,'Análisis completo de vulnerabilidades encontradas.','2024-06-27 11:30:00','completado','Ninguno.'),(3,3,3,'Informe de explotación exitosa de vulnerabilidades críticas.','2024-06-27 12:45:00','pendiente','Esperando validación.'),(4,4,4,'Detalle de escalado de privilegios en entorno de prueba.','2024-06-27 14:00:00','en_progreso','Análisis en curso.'),(5,5,5,'Enumeración de servicios y usuarios en red interna.','2024-06-27 15:15:00','completado','Ningún comentario adicional.'),(6,6,6,'Análisis de impacto de ingeniería social en la organización.','2024-06-28 09:30:00','completado','Informe finalizado.'),(7,7,7,'Evaluación de vulnerabilidades en aplicación web principal.','2024-06-28 10:45:00','en_progreso','Revisión de hallazgos.'),(8,8,8,'Informe detallado de auditoría de red corporativa.','2024-06-28 12:00:00','pendiente','Esperando aprobación.'),(9,9,9,'Pruebas de sistemas operativos y hallazgos relevantes.','2024-06-28 13:15:00','completado','Aceptado.'),(10,10,10,'Revisión de políticas de seguridad física y recomendaciones.','2024-06-28 14:30:00','en_progreso','Implementación de sugerencias.'),(11,11,11,'Resultados de simulación de ataques de phishing.','2024-06-29 09:45:00','completado','Validación realizada.'),(12,12,12,'Pruebas de intrusión interna y mitigación de riesgos.','2024-06-29 11:00:00','completado','Sin observaciones adicionales.'),(13,13,13,'Informe de cumplimiento normativo y ajustes necesarios.','2024-06-29 12:15:00','en_progreso','Revisión de cumplimiento.'),(14,14,14,'Seguridad móvil: análisis de aplicaciones y dispositivos.','2024-06-29 13:30:00','completado','Aprobado.'),(15,15,15,'Análisis forense de incidente de seguridad crítico.','2024-06-29 14:45:00','pendiente','Investigación en curso.'),(16,16,16,'Evaluación de vulnerabilidades mediante pruebas de penetración.','2024-06-30 10:00:00','completado','Reporte validado.'),(17,17,17,'Monitoreo de seguridad: revisión de alertas y recomendaciones.','2024-06-30 11:15:00','completado','Implementación sugerida.'),(18,18,18,'Análisis exhaustivo de registros de actividad.','2024-06-30 12:30:00','en_progreso','Análisis detallado.'),(19,19,19,'Revisión de configuraciones y mejoras recomendadas.','2024-06-30 13:45:00','completado','Aceptado y aplicado.'),(20,20,20,'Auditoría independiente de controles de seguridad.','2024-06-30 15:00:00','pendiente','Programación de revisión final.');
/*!40000 ALTER TABLE `reportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_pruebas`
--

DROP TABLE IF EXISTS `tipos_pruebas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_pruebas` (
  `id_TPrueba` int NOT NULL AUTO_INCREMENT,
  `referencia` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `estado` enum('activado','desactivado') NOT NULL,
  PRIMARY KEY (`id_TPrueba`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_pruebas`
--

LOCK TABLES `tipos_pruebas` WRITE;
/*!40000 ALTER TABLE `tipos_pruebas` DISABLE KEYS */;
INSERT INTO `tipos_pruebas` VALUES (1,'REF001','Reconocimiento','Identificación inicial de activos y características del objetivo.','2023-01-15','desactivado'),(2,'REF002','Análisis de Vulnerabilidad','Identificación y evaluación de vulnerabilidades en sistemas y redes.','2023-02-20','desactivado'),(3,'REF003','Explotación','Uso de vulnerabilidades para ganar acceso no autorizado o privilegios elevados.','2023-03-25','desactivado'),(4,'REF004','Escalar Privilegios','Técnicas para obtener acceso a recursos y permisos elevados en sistemas.','2023-04-30','desactivado'),(5,'REF005','Enumeración','Recopilación de información detallada sobre el objetivo, como servicios disponibles y usuarios.','2023-05-15','desactivado'),(6,'REF006','Ingeniería Social','Uso de técnicas psicológicas para obtener acceso no autorizado.','2023-06-20','activado'),(7,'REF007','Pruebas de Aplicaciones Web','Evaluación de la seguridad de aplicaciones web en busca de vulnerabilidades.','2023-07-25','activado'),(8,'REF008','Pruebas de Redes','Evaluación de la seguridad de redes para identificar vulnerabilidades y configuraciones incorrectas.','2023-08-30','desactivado'),(9,'REF009','Pruebas de Sistemas Operativos','Evaluación de la seguridad de sistemas operativos para identificar configuraciones inseguras.','2023-09-15','activado'),(10,'REF010','Pruebas de Seguridad Física','Evaluación de la seguridad física de instalaciones, edificios o centros de datos.','2023-10-20','activado'),(11,'REF011','Pruebas de Phishing','Simulación de ataques de phishing para evaluar la preparación y respuesta de los usuarios.','2023-11-25','activado'),(12,'REF012','Pruebas de Intrusión Interna','Simulación de ataques internos para evaluar la respuesta y detección de amenazas internas.','2023-12-30','activado'),(13,'REF013','Pruebas de Cumplimiento','Evaluación para asegurar que los sistemas y procesos cumplan con normativas y estándares.','2024-01-15','desactivado'),(14,'REF014','Pruebas de Seguridad Móvil','Evaluación de la seguridad de aplicaciones y dispositivos móviles en busca de vulnerabilidades.','2024-02-20','activado'),(15,'REF015','Análisis Forense','Investigación y análisis de incidentes de seguridad para determinar su causa y alcance.','2024-03-25','desactivado'),(16,'REF016','Pruebas de Penetración','Simulación de ataques reales para evaluar la resistencia de los sistemas y redes.','2024-04-30','desactivado'),(17,'REF017','Monitoreo de Seguridad','Implementación y gestión de herramientas para la detección de amenazas en tiempo real.','2024-05-15','desactivado'),(18,'REF018','Análisis de Logs','Revisión y análisis de registros de actividad para detectar incidentes de seguridad.','2024-06-20','activado'),(19,'REF019','Evaluación de Configuraciones','Revisión y ajuste de configuraciones para mejorar la seguridad de sistemas y redes.','2024-07-25','activado'),(20,'REF020','Auditoría de Seguridad','Revisión y evaluación independiente de controles de seguridad para garantizar su eficacia.','2024-08-30','desactivado');
/*!40000 ALTER TABLE `tipos_pruebas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_tarjetas`
--

DROP TABLE IF EXISTS `tipos_tarjetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_tarjetas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_tarjeta` enum('Visa','American Express','MasterCard','Discover') NOT NULL,
  `imagen` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_tarjetas`
--

LOCK TABLES `tipos_tarjetas` WRITE;
/*!40000 ALTER TABLE `tipos_tarjetas` DISABLE KEYS */;
INSERT INTO `tipos_tarjetas` VALUES (1,'Visa','C:UserssamleDocumentsase de datos 2parcial 1imagenesvisa.png'),(2,'American Express','C:UserssamleDocumentsase de datos 2parcial 1imagenesamex.png'),(3,'MasterCard','C:UserssamleDocumentsase de datos 2parcial 1imagenesMastercard.png'),(4,'Discover','C:UserssamleDocumentsase de datos 2parcial 1imagenesDiscover.png');
/*!40000 ALTER TABLE `tipos_tarjetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_usuarios`
--

DROP TABLE IF EXISTS `tipos_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_usuario` enum('Cliente','Administrador','Vendedor','Ejecutivo','Otro') NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_usuarios`
--

LOCK TABLES `tipos_usuarios` WRITE;
/*!40000 ALTER TABLE `tipos_usuarios` DISABLE KEYS */;
INSERT INTO `tipos_usuarios` VALUES (1,'Cliente','Usuario Cliente'),(2,'Administrador','Usuario Administrador'),(3,'Vendedor','Usuario Vendedor'),(4,'Ejecutivo','Usuario Ejecutivo'),(5,'Otro','Otro tipo de usuario');
/*!40000 ALTER TABLE `tipos_usuarios` ENABLE KEYS */;
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
  `nombre_usuario` varchar(50) NOT NULL,
  `token` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `estado_civil` varchar(20) NOT NULL,
  `tipo_empresa` enum('pública','privada') NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `id_tipo_usuario` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tipo_usuario` (`id_tipo_usuario`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipos_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Juan','Pérez','juanperez','token123','contraseña123','Madrid','Masculino','Soltero','privada','Calle Mayor, 1',1),(2,'María','García','mariagarcia','token456','password456','Barcelona','Femenino','Casada','pública','Calle Gran Vía, 2',2),(3,'Carlos','López','carloslopez','token789','secreto789','Valencia','Masculino','Divorciado','privada','Calle Colón, 3',3),(4,'Ana','Martínez','anamartinez','tokenabc','claveabc','Sevilla','Femenino','Soltera','pública','Calle Sierpes, 4',4),(5,'Pedro','Rodríguez','pedrorodriguez','tokenxyz','contraseñaXYZ','Zaragoza','Masculino','Casado','privada','Calle San Miguel, 5',5),(6,'Laura','Hernández','laurahernandez','tokendef','passwordDEF','Málaga','Femenino','Soltera','pública','Calle Larios, 6',1),(7,'Javier','Gómez','javiergomez','tokendgh','secretoDGH','Bilbao','Masculino','Casado','privada','Calle Ercilla, 7',2),(8,'Sofía','Díaz','sofiadiaz','tokenijk','claveIJK','Alicante','Femenino','Divorciada','pública','Calle Mayor, 8',3),(9,'Diego','Torres','diegotorres','tokenlmn','passwordLMN','Córdoba','Masculino','Soltero','privada','Calle Cruz Conde, 9',4),(10,'Elena','López','elenalopez','tokenopq','secretoOPQ','Granada','Femenino','Casada','pública','Calle Reyes Católicos, 10',5),(11,'Andrés','Martín','andresmartin','tokenrst','claveRST','Oviedo','Masculino','Soltero','privada','Calle Uría, 11',1),(12,'Lucía','Ruiz','luciaruiz','tokenuvw','passwordUVW','Vigo','Femenino','Casada','pública','Calle Príncipe, 12',2),(13,'Pablo','González','pablogonzalez','tokenxyz','secretoXYZ','Santander','Masculino','Divorciado','privada','Calle Burgos, 13',3),(14,'Marina','Sánchez','marinasanchez','tokenabc','claveABC','Murcia','Femenino','Soltera','pública','Gran Vía, 14',4),(15,'Roberto','Martínez','robertomartinez','tokendef','passwordDEF','Salamanca','Masculino','Casado','privada','Calle Zamora, 15',5),(16,'Valeria','Hernández','valeriahernandez','tokendgh','secretoDGH','Burgos','Femenino','Soltera','pública','Calle Vitoria, 16',1),(17,'Gabriel','Flores','gabrielflores','tokenijk','claveIJK','León','Masculino','Casado','privada','Calle Ordoño II, 17',2),(18,'Carolina','Díaz','carolinadiaz','tokenlmn','passwordLMN','Tenerife','Femenino','Divorciada','pública','Avenida Tres de Mayo, 18',3),(19,'Alejandro','López','alejandrolopez','tokenopq','secretoOPQ','Pamplona','Masculino','Soltero','privada','Calle Estafeta, 19',4),(20,'Isabella','García','isabellagarcia','tokenrst','claveRST','Logroño','Femenino','Casada','pública','Calle Laurel, 20',5);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_autenticacion_usuarios`
--

DROP TABLE IF EXISTS `vista_autenticacion_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vista_autenticacion_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_autenticacion_usuarios` AS SELECT 
 1 AS `nombre_usuario`,
 1 AS `apellido`,
 1 AS `ciudad`,
 1 AS `tipo_empresa`,
 1 AS `fecha_creacion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_mediospagos`
--

DROP TABLE IF EXISTS `vista_mediospagos`;
/*!50001 DROP VIEW IF EXISTS `vista_mediospagos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_mediospagos` AS SELECT 
 1 AS `nombre_usuario`,
 1 AS `estado_civil`,
 1 AS `direccion`,
 1 AS `numero_tarjeta`,
 1 AS `nombre_titular`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_tipos_pruebas_activas`
--

DROP TABLE IF EXISTS `vista_tipos_pruebas_activas`;
/*!50001 DROP VIEW IF EXISTS `vista_tipos_pruebas_activas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_tipos_pruebas_activas` AS SELECT 
 1 AS `id_TPrueba`,
 1 AS `referencia`,
 1 AS `nombre`,
 1 AS `descripcion`,
 1 AS `fecha_ingreso`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_tiposusuariosporempresa`
--

DROP TABLE IF EXISTS `vista_tiposusuariosporempresa`;
/*!50001 DROP VIEW IF EXISTS `vista_tiposusuariosporempresa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_tiposusuariosporempresa` AS SELECT 
 1 AS `nombre_usuario`,
 1 AS `apellido`,
 1 AS `tipo_empresa`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_autenticacion_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vista_autenticacion_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_autenticacion_usuarios` AS select `a`.`nombre_usuario` AS `nombre_usuario`,`u`.`apellido` AS `apellido`,`u`.`ciudad` AS `ciudad`,`u`.`tipo_empresa` AS `tipo_empresa`,`a`.`fecha_creacion` AS `fecha_creacion` from (`usuarios` `u` join `autenticacion` `a` on((`u`.`id` = `a`.`id_usuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_mediospagos`
--

/*!50001 DROP VIEW IF EXISTS `vista_mediospagos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_mediospagos` AS select `usuarios`.`nombre_usuario` AS `nombre_usuario`,`usuarios`.`estado_civil` AS `estado_civil`,`usuarios`.`direccion` AS `direccion`,`pagos`.`numero_tarjeta` AS `numero_tarjeta`,`pagos`.`nombre_titular` AS `nombre_titular` from (`usuarios` join `pagos` on((`usuarios`.`id` = `pagos`.`id_usuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_tipos_pruebas_activas`
--

/*!50001 DROP VIEW IF EXISTS `vista_tipos_pruebas_activas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_tipos_pruebas_activas` AS select `tipos_pruebas`.`id_TPrueba` AS `id_TPrueba`,`tipos_pruebas`.`referencia` AS `referencia`,`tipos_pruebas`.`nombre` AS `nombre`,`tipos_pruebas`.`descripcion` AS `descripcion`,`tipos_pruebas`.`fecha_ingreso` AS `fecha_ingreso`,`tipos_pruebas`.`estado` AS `estado` from `tipos_pruebas` where (`tipos_pruebas`.`estado` = 'activado') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_tiposusuariosporempresa`
--

/*!50001 DROP VIEW IF EXISTS `vista_tiposusuariosporempresa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_tiposusuariosporempresa` AS select `usuarios`.`nombre_usuario` AS `nombre_usuario`,`usuarios`.`apellido` AS `apellido`,`usuarios`.`tipo_empresa` AS `tipo_empresa` from `usuarios` order by `usuarios`.`tipo_empresa` */;
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

-- Dump completed on 2024-06-27 22:18:22
