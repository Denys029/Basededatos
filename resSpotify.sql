-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Spotify
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB-1:10.4.13+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Albumes`
--

DROP TABLE IF EXISTS `Albumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Albumes` (
  `IdAlbumes` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `FechaLanzamiento` date NOT NULL,
  `TiempoReproducion` time NOT NULL,
  PRIMARY KEY (`IdAlbumes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Albumes`
--

LOCK TABLES `Albumes` WRITE;
/*!40000 ALTER TABLE `Albumes` DISABLE KEYS */;
INSERT INTO `Albumes` VALUES (1,'Aire','2010-12-21','02:15:30'),(2,'Hasta Ahora','2009-08-19','01:30:10'),(3,'Tanto Amor','2013-04-07','03:15:08'),(4,'Un Año','2020-09-21','02:08:45'),(5,'Primer Avion','2019-06-20','01:50:23');
/*!40000 ALTER TABLE `Albumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Artista`
--

DROP TABLE IF EXISTS `Artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Artista` (
  `IdArtista` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `CorreoElectronico` varchar(30) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `Biografia` text DEFAULT NULL,
  PRIMARY KEY (`IdArtista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artista`
--

LOCK TABLES `Artista` WRITE;
/*!40000 ALTER TABLE `Artista` DISABLE KEYS */;
INSERT INTO `Artista` VALUES (1,'Ricardo Arjona','ric.arj@gmail.com','2021-04-22','Born in Antigua, Arjona was interested in music from an early age but initially.'),(2,'Carlos','Crls@hotmail.com','2021-04-01','Emerging in 2013 with the hit single The Way, Grande'),(3,'Sebastian','seb056632@pucece.edu.ec','2020-11-29','blandit enim consequat purus. Maecenas libero'),(4,'Maria','maria56526@gmail.com','2020-01-12','Radicada en Medellín desde 1996, donde inicia su carrera artística, empezó a componer canciones desde muy niña'),(5,'Ana','ana0626@gmail.com','2020-12-31','Reconocido y talentoso músico ecuatoriano, lanza su primera producción discográfica');
/*!40000 ALTER TABLE `Artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Artistas`
--

DROP TABLE IF EXISTS `Artistas`;
/*!50001 DROP VIEW IF EXISTS `Artistas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Artistas` (
  `Nombre` tinyint NOT NULL,
  `Biografia` tinyint NOT NULL,
  `CorreoElectronico` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Canciones`
--

DROP TABLE IF EXISTS `Canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Canciones` (
  `IdCanciones` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `FechaLanzamiento` date NOT NULL,
  `TiempoReproducion` time NOT NULL,
  `Creditos` text DEFAULT NULL,
  `IdArtista` int(11) NOT NULL,
  `IdGenero` int(11) NOT NULL,
  `IdAlbumes` int(11) NOT NULL,
  PRIMARY KEY (`IdCanciones`),
  KEY `IdArtista` (`IdArtista`),
  KEY `IdGenero` (`IdGenero`),
  KEY `IdAlbumes` (`IdAlbumes`),
  CONSTRAINT `Canciones_ibfk_1` FOREIGN KEY (`IdArtista`) REFERENCES `Artista` (`IdArtista`),
  CONSTRAINT `Canciones_ibfk_2` FOREIGN KEY (`IdGenero`) REFERENCES `Genero` (`IdGenero`),
  CONSTRAINT `Canciones_ibfk_3` FOREIGN KEY (`IdAlbumes`) REFERENCES `Albumes` (`IdAlbumes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Canciones`
--

LOCK TABLES `Canciones` WRITE;
/*!40000 ALTER TABLE `Canciones` DISABLE KEYS */;
INSERT INTO `Canciones` VALUES (1,'Un año','2018-12-28','00:03:17','vel sapien imperdiet ornare. In',3,1,5),(2,'Consejo de amor','2017-12-19','00:02:50','consectetuer mauris id sapien. Cras',5,3,2),(3,'Perdoname','2018-08-30','00:04:10','turpis. In condimentum. Donec at',1,1,1),(4,'Saturno','2010-05-26','00:03:32','pulvinar arcu et pede. Nunc',4,5,5),(5,'Solamente tu','2014-02-03','00:05:23','Quisque fringilla euismod enim. Etiam',3,5,5);
/*!40000 ALTER TABLE `Canciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CancionesEscuchadas`
--

DROP TABLE IF EXISTS `CancionesEscuchadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CancionesEscuchadas` (
  `IdCancionesEscuchadas` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `IdArtista` int(11) NOT NULL,
  `IdGenero` int(11) NOT NULL,
  `IdAlbumes` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  PRIMARY KEY (`IdCancionesEscuchadas`),
  KEY `IdArtista` (`IdArtista`),
  KEY `IdGenero` (`IdGenero`),
  KEY `IdAlbumes` (`IdAlbumes`),
  KEY `IdUsuario` (`IdUsuario`),
  CONSTRAINT `CancionesEscuchadas_ibfk_1` FOREIGN KEY (`IdArtista`) REFERENCES `Artista` (`IdArtista`),
  CONSTRAINT `CancionesEscuchadas_ibfk_2` FOREIGN KEY (`IdGenero`) REFERENCES `Genero` (`IdGenero`),
  CONSTRAINT `CancionesEscuchadas_ibfk_3` FOREIGN KEY (`IdAlbumes`) REFERENCES `Albumes` (`IdAlbumes`),
  CONSTRAINT `CancionesEscuchadas_ibfk_4` FOREIGN KEY (`IdCancionesEscuchadas`) REFERENCES `Canciones` (`IdCanciones`),
  CONSTRAINT `CancionesEscuchadas_ibfk_5` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario` (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CancionesEscuchadas`
--

LOCK TABLES `CancionesEscuchadas` WRITE;
/*!40000 ALTER TABLE `CancionesEscuchadas` DISABLE KEYS */;
INSERT INTO `CancionesEscuchadas` VALUES (1,'Felix',4,2,3,1),(2,'David',3,9,5,2),(3,'Reed',4,8,4,3),(4,'Kelsey',2,1,5,5),(5,'Beau',1,5,4,4);
/*!40000 ALTER TABLE `CancionesEscuchadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CancionesMasEscuchadas`
--

DROP TABLE IF EXISTS `CancionesMasEscuchadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CancionesMasEscuchadas` (
  `IdCancionesMasEscuchadas` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `CantidadVecesEscuchado` int(11) NOT NULL,
  `IdArtista` int(11) NOT NULL,
  `IdGenero` int(11) NOT NULL,
  `IdAlbumes` int(11) NOT NULL,
  `IdCancionesEscuchadas` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  PRIMARY KEY (`IdCancionesMasEscuchadas`),
  KEY `IdArtista` (`IdArtista`),
  KEY `IdGenero` (`IdGenero`),
  KEY `IdAlbumes` (`IdAlbumes`),
  KEY `IdCancionesEscuchadas` (`IdCancionesEscuchadas`),
  KEY `IdUsuario` (`IdUsuario`),
  CONSTRAINT `CancionesMasEscuchadas_ibfk_1` FOREIGN KEY (`IdArtista`) REFERENCES `Artista` (`IdArtista`),
  CONSTRAINT `CancionesMasEscuchadas_ibfk_2` FOREIGN KEY (`IdGenero`) REFERENCES `Genero` (`IdGenero`),
  CONSTRAINT `CancionesMasEscuchadas_ibfk_3` FOREIGN KEY (`IdAlbumes`) REFERENCES `Albumes` (`IdAlbumes`),
  CONSTRAINT `CancionesMasEscuchadas_ibfk_4` FOREIGN KEY (`IdCancionesEscuchadas`) REFERENCES `CancionesEscuchadas` (`IdCancionesEscuchadas`),
  CONSTRAINT `CancionesMasEscuchadas_ibfk_5` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario` (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CancionesMasEscuchadas`
--

LOCK TABLES `CancionesMasEscuchadas` WRITE;
/*!40000 ALTER TABLE `CancionesMasEscuchadas` DISABLE KEYS */;
INSERT INTO `CancionesMasEscuchadas` VALUES (1,'Emerald',85,4,6,5,2,2),(2,'Imelda',81,5,7,3,5,5),(3,'Blair',76,5,3,1,4,3),(4,'Felix',89,3,3,5,1,4),(5,'Hamish',63,3,5,4,1,2);
/*!40000 ALTER TABLE `CancionesMasEscuchadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `CancionesMasEscuchadas3`
--

DROP TABLE IF EXISTS `CancionesMasEscuchadas3`;
/*!50001 DROP VIEW IF EXISTS `CancionesMasEscuchadas3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CancionesMasEscuchadas3` (
  `Cancion` tinyint NOT NULL,
  `Album` tinyint NOT NULL,
  `Artista` tinyint NOT NULL,
  `Cant. veces escuchado` tinyint NOT NULL,
  `Cant. de usuarios` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `CancionesSugeridas`
--

DROP TABLE IF EXISTS `CancionesSugeridas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CancionesSugeridas` (
  `IdCanciones` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `IdPlaylist` int(11) NOT NULL,
  KEY `IdCanciones` (`IdCanciones`),
  KEY `IdUsuario` (`IdUsuario`),
  KEY `IdPlaylist` (`IdPlaylist`),
  CONSTRAINT `CancionesSugeridas_ibfk_1` FOREIGN KEY (`IdCanciones`) REFERENCES `Canciones` (`IdCanciones`),
  CONSTRAINT `CancionesSugeridas_ibfk_2` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario` (`IdUsuario`),
  CONSTRAINT `CancionesSugeridas_ibfk_3` FOREIGN KEY (`IdPlaylist`) REFERENCES `Playlist` (`IdPlaylist`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CancionesSugeridas`
--

LOCK TABLES `CancionesSugeridas` WRITE;
/*!40000 ALTER TABLE `CancionesSugeridas` DISABLE KEYS */;
INSERT INTO `CancionesSugeridas` VALUES (1,5,5),(2,3,3),(3,1,1),(4,4,2),(5,3,4);
/*!40000 ALTER TABLE `CancionesSugeridas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clave`
--

DROP TABLE IF EXISTS `Clave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clave` (
  `IdClave` int(11) NOT NULL,
  `ClaveEncriptada` varchar(50) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  PRIMARY KEY (`IdClave`),
  KEY `IdUsuario` (`IdUsuario`),
  CONSTRAINT `Clave_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario` (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clave`
--

LOCK TABLES `Clave` WRITE;
/*!40000 ALTER TABLE `Clave` DISABLE KEYS */;
INSERT INTO `Clave` VALUES (1,'KNP24LXC1ZB',2),(2,'KAL42NUA9UX',1),(3,'AMR79WBG8QH',4),(4,'NYL14GHG6RM',5),(5,'TEZ92KJJ7XG',3);
/*!40000 ALTER TABLE `Clave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cuenta`
--

DROP TABLE IF EXISTS `Cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cuenta` (
  `IdCuenta` int(11) NOT NULL,
  `NombreCuenta` varchar(50) NOT NULL,
  PRIMARY KEY (`IdCuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cuenta`
--

LOCK TABLES `Cuenta` WRITE;
/*!40000 ALTER TABLE `Cuenta` DISABLE KEYS */;
INSERT INTO `Cuenta` VALUES (1,'Gratis'),(2,'Premium Individual'),(3,'Premium Universitario'),(4,'Premium Duo'),(5,'Premium Familiar');
/*!40000 ALTER TABLE `Cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FormaPago`
--

DROP TABLE IF EXISTS `FormaPago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FormaPago` (
  `IdPago` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `Tarjeta` int(11) NOT NULL,
  PRIMARY KEY (`IdPago`),
  KEY `IdUsuario` (`IdUsuario`),
  CONSTRAINT `FormaPago_ibfk_2` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario` (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FormaPago`
--

LOCK TABLES `FormaPago` WRITE;
/*!40000 ALTER TABLE `FormaPago` DISABLE KEYS */;
INSERT INTO `FormaPago` VALUES (1,2,3),(2,1,4),(3,4,1),(4,2,2);
/*!40000 ALTER TABLE `FormaPago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genero`
--

DROP TABLE IF EXISTS `Genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Genero` (
  `IdGenero` int(11) NOT NULL,
  `NombreGenero` varchar(50) NOT NULL,
  PRIMARY KEY (`IdGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genero`
--

LOCK TABLES `Genero` WRITE;
/*!40000 ALTER TABLE `Genero` DISABLE KEYS */;
INSERT INTO `Genero` VALUES (1,'Pop'),(2,'Afro'),(3,'Cristiana'),(4,'Clasica'),(5,'Rock'),(6,'K-pop'),(7,'Romantica'),(8,'Latina'),(9,'Reggae'),(10,'Cumbia');
/*!40000 ALTER TABLE `Genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `IngresosDeUsuarios`
--

DROP TABLE IF EXISTS `IngresosDeUsuarios`;
/*!50001 DROP VIEW IF EXISTS `IngresosDeUsuarios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `IngresosDeUsuarios` (
  `Nombre` tinyint NOT NULL,
  `Fecha de ultimo ingreso` tinyint NOT NULL,
  `Cantidad de ingresos` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Login`
--

DROP TABLE IF EXISTS `Login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Login` (
  `IdLogin` int(11) NOT NULL,
  `Tiempo` time NOT NULL,
  `IdCanciones` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  PRIMARY KEY (`IdLogin`),
  KEY `IdCanciones` (`IdCanciones`),
  KEY `IdUsuario` (`IdUsuario`),
  CONSTRAINT `Login_ibfk_1` FOREIGN KEY (`IdCanciones`) REFERENCES `Canciones` (`IdCanciones`),
  CONSTRAINT `Login_ibfk_2` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario` (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Login`
--

LOCK TABLES `Login` WRITE;
/*!40000 ALTER TABLE `Login` DISABLE KEYS */;
INSERT INTO `Login` VALUES (1,'02:35:37',3,5),(2,'04:12:00',4,5),(3,'08:53:49',5,2),(4,'10:34:30',3,5),(5,'03:15:22',4,4);
/*!40000 ALTER TABLE `Login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Playlist`
--

DROP TABLE IF EXISTS `Playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Playlist` (
  `IdPlaylist` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `IdCanciones` int(11) NOT NULL,
  PRIMARY KEY (`IdPlaylist`),
  KEY `IdUsuario` (`IdUsuario`),
  KEY `IdCanciones` (`IdCanciones`),
  CONSTRAINT `Playlist_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario` (`IdUsuario`),
  CONSTRAINT `Playlist_ibfk_2` FOREIGN KEY (`IdCanciones`) REFERENCES `Canciones` (`IdCanciones`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Playlist`
--

LOCK TABLES `Playlist` WRITE;
/*!40000 ALTER TABLE `Playlist` DISABLE KEYS */;
INSERT INTO `Playlist` VALUES (1,'Raphael','2016-09-18',3,4),(2,'Hector','2018-07-14',5,2),(3,'Marny','2017-08-03',2,2),(4,'Halee','2019-04-12',3,1),(5,'Bryar','2019-06-22',4,4);
/*!40000 ALTER TABLE `Playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlaylistEscuchadas`
--

DROP TABLE IF EXISTS `PlaylistEscuchadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlaylistEscuchadas` (
  `IdPlaylist` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  KEY `IdPlaylist` (`IdPlaylist`),
  CONSTRAINT `PlaylistEscuchadas_ibfk_1` FOREIGN KEY (`IdPlaylist`) REFERENCES `Playlist` (`IdPlaylist`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlaylistEscuchadas`
--

LOCK TABLES `PlaylistEscuchadas` WRITE;
/*!40000 ALTER TABLE `PlaylistEscuchadas` DISABLE KEYS */;
INSERT INTO `PlaylistEscuchadas` VALUES (1,'Lois'),(2,'Tarik'),(3,'Erich'),(4,'Calista'),(5,'Karleigh');
/*!40000 ALTER TABLE `PlaylistEscuchadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Roles` (
  `IdRoles` int(11) NOT NULL,
  `NombreRol` varchar(30) NOT NULL,
  PRIMARY KEY (`IdRoles`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES (1,'Administrador'),(2,'Básico'),(3,'Premium');
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `IdUsuario` int(11) NOT NULL,
  `FechaUltimoIngreso` date NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `IngresosTotal` int(11) NOT NULL,
  `CorreoElectronico` varchar(30) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `IdRoles` int(11) NOT NULL,
  `IdCuenta` int(11) NOT NULL,
  PRIMARY KEY (`IdUsuario`),
  KEY `IdRoles` (`IdRoles`),
  KEY `IdCuenta` (`IdCuenta`),
  CONSTRAINT `Usuario_ibfk_1` FOREIGN KEY (`IdRoles`) REFERENCES `Roles` (`IdRoles`),
  CONSTRAINT `Usuario_ibfk_2` FOREIGN KEY (`IdCuenta`) REFERENCES `Cuenta` (`IdCuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'2018-02-20','Fernando',483,'fer48@gmail.com','2017-05-25',2,2),(2,'2016-10-16','Toby',254,'Tb62695@hotmail.com','2018-05-23',1,2),(3,'2019-11-18','Peter',57,'peter.mjdfsig@pucese.edu.ec','2020-01-18',3,1),(4,'2017-09-30','Paula',492,'enim@gmail.com','2017-07-07',1,5),(5,'2020-06-02','Jenny',14,'ridjenny@hotmail.com','2017-02-15',2,3);
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `Artistas`
--

/*!50001 DROP TABLE IF EXISTS `Artistas`*/;
/*!50001 DROP VIEW IF EXISTS `Artistas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Artistas` AS select `Artista`.`Nombre` AS `Nombre`,`Artista`.`Biografia` AS `Biografia`,`Artista`.`CorreoElectronico` AS `CorreoElectronico` from `Artista` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CancionesMasEscuchadas3`
--

/*!50001 DROP TABLE IF EXISTS `CancionesMasEscuchadas3`*/;
/*!50001 DROP VIEW IF EXISTS `CancionesMasEscuchadas3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CancionesMasEscuchadas3` AS select `Canciones`.`Nombre` AS `Cancion`,`Albumes`.`Nombre` AS `Album`,`Artista`.`Nombre` AS `Artista`,count(`CancionesEscuchadas`.`IdCancionesEscuchadas`) AS `Cant. veces escuchado`,count(`Usuario`.`IdUsuario`) AS `Cant. de usuarios` from (((((`Canciones` join `Albumes`) join `Artista`) join `CancionesEscuchadas`) join `Usuario`) join `Playlist`) where `Canciones`.`IdAlbumes` = `Albumes`.`IdAlbumes` and `Canciones`.`IdArtista` = `Artista`.`IdArtista` and `Canciones`.`IdCanciones` = `Playlist`.`IdCanciones` and `Playlist`.`IdUsuario` = `Usuario`.`IdUsuario` group by `Canciones`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `IngresosDeUsuarios`
--

/*!50001 DROP TABLE IF EXISTS `IngresosDeUsuarios`*/;
/*!50001 DROP VIEW IF EXISTS `IngresosDeUsuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `IngresosDeUsuarios` AS select `Usuario`.`Nombre` AS `Nombre`,`Usuario`.`FechaUltimoIngreso` AS `Fecha de ultimo ingreso`,`Usuario`.`IngresosTotal` AS `Cantidad de ingresos` from `Usuario` */;
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

-- Dump completed on 2020-06-04  8:23:50
