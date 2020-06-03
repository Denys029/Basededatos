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
  `CorreoElectronio¿co` varchar(30) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `Biografia` text DEFAULT NULL,
  `IdAlbumes` int(11) NOT NULL,
  PRIMARY KEY (`IdArtista`),
  KEY `IdAlbumes` (`IdAlbumes`),
  CONSTRAINT `Artista_ibfk_1` FOREIGN KEY (`IdAlbumes`) REFERENCES `Albumes` (`IdAlbumes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artista`
--

LOCK TABLES `Artista` WRITE;
/*!40000 ALTER TABLE `Artista` DISABLE KEYS */;
/*!40000 ALTER TABLE `Artista` ENABLE KEYS */;
UNLOCK TABLES;

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
  `IdUsuario` int(11) NOT NULL,
  PRIMARY KEY (`IdCancionesMasEscuchadas`),
  KEY `IdArtista` (`IdArtista`),
  KEY `IdGenero` (`IdGenero`),
  KEY `IdAlbumes` (`IdAlbumes`),
  KEY `CantidadVecesEscuchado` (`CantidadVecesEscuchado`),
  KEY `IdUsuario` (`IdUsuario`),
  CONSTRAINT `CancionesMasEscuchadas_ibfk_1` FOREIGN KEY (`IdArtista`) REFERENCES `Artista` (`IdArtista`),
  CONSTRAINT `CancionesMasEscuchadas_ibfk_2` FOREIGN KEY (`IdGenero`) REFERENCES `Genero` (`IdGenero`),
  CONSTRAINT `CancionesMasEscuchadas_ibfk_3` FOREIGN KEY (`IdAlbumes`) REFERENCES `Albumes` (`IdAlbumes`),
  CONSTRAINT `CancionesMasEscuchadas_ibfk_4` FOREIGN KEY (`CantidadVecesEscuchado`) REFERENCES `CancionesEscuchadas` (`IdCancionesEscuchadas`),
  CONSTRAINT `CancionesMasEscuchadas_ibfk_5` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario` (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CancionesMasEscuchadas`
--

LOCK TABLES `CancionesMasEscuchadas` WRITE;
/*!40000 ALTER TABLE `CancionesMasEscuchadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `CancionesMasEscuchadas` ENABLE KEYS */;
UNLOCK TABLES;

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
  `ClaveEncriptada` int(11) NOT NULL,
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
  `IdTarjeta` int(11) NOT NULL,
  PRIMARY KEY (`IdPago`),
  KEY `IdTarjeta` (`IdTarjeta`),
  CONSTRAINT `FormaPago_ibfk_1` FOREIGN KEY (`IdTarjeta`) REFERENCES `Tarjeta` (`IdTarjeta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FormaPago`
--

LOCK TABLES `FormaPago` WRITE;
/*!40000 ALTER TABLE `FormaPago` DISABLE KEYS */;
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
  `NombreGenero` int(11) NOT NULL,
  PRIMARY KEY (`IdGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genero`
--

LOCK TABLES `Genero` WRITE;
/*!40000 ALTER TABLE `Genero` DISABLE KEYS */;
/*!40000 ALTER TABLE `Genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Login`
--

DROP TABLE IF EXISTS `Login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Login` (
  `IdLogin` int(11) NOT NULL,
  `TiempoReproduccion` time NOT NULL,
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
-- Table structure for table `Tarjeta`
--

DROP TABLE IF EXISTS `Tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tarjeta` (
  `IdTarjeta` int(11) NOT NULL,
  `Numero` tinyint(4) NOT NULL,
  `FechaExpiracion` date NOT NULL,
  `Cvc` tinyint(4) NOT NULL,
  PRIMARY KEY (`IdTarjeta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tarjeta`
--

LOCK TABLES `Tarjeta` WRITE;
/*!40000 ALTER TABLE `Tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tarjeta` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-03  5:18:17
