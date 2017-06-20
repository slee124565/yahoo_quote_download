-- MySQL dump 10.16  Distrib 10.1.17-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: yahoo
-- ------------------------------------------------------
-- Server version	10.1.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `idx`
--

DROP TABLE IF EXISTS `idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idx` (
  `Index_ID` varchar(10) NOT NULL,
  `Index_Name` varchar(50) NOT NULL,
  `CountryName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idx_dd`
--

DROP TABLE IF EXISTS `idx_dd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idx_dd` (
  `DDate` date NOT NULL,
  `Index_ID` varchar(10) NOT NULL,
  `SOpen` double NOT NULL,
  `SHigh` double NOT NULL,
  `SLow` double NOT NULL,
  `SClose` double NOT NULL,
  `TShare` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idx_ww`
--

DROP TABLE IF EXISTS `idx_ww`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idx_ww` (
  `DDate` date NOT NULL,
  `Index_ID` varchar(10) NOT NULL,
  `SOpen` double NOT NULL,
  `SHigh` double NOT NULL,
  `SLow` double NOT NULL,
  `SClose` double NOT NULL,
  `TShare` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nasdaq100`
--

DROP TABLE IF EXISTS `nasdaq100`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nasdaq100` (
  `SecID` varchar(10) NOT NULL,
  `SecName` varchar(50) DEFAULT NULL,
  UNIQUE KEY `SecID` (`SecID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sp500`
--

DROP TABLE IF EXISTS `sp500`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp500` (
  `SecID` varchar(10) NOT NULL,
  `SecName` varchar(50) DEFAULT NULL,
  `outShare` double DEFAULT NULL,
  `indexWT` decimal(10,4) DEFAULT NULL,
  UNIQUE KEY `SecID` (`SecID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usastock_dd`
--

DROP TABLE IF EXISTS `usastock_dd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usastock_dd` (
  `DDate` date NOT NULL,
  `StockID` varchar(10) NOT NULL,
  `SOpen` double NOT NULL,
  `SHigh` double NOT NULL,
  `SLow` double NOT NULL,
  `SClose` double NOT NULL,
  `TShare` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usastock_mm`
--

DROP TABLE IF EXISTS `usastock_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usastock_mm` (
  `DDate` date NOT NULL,
  `StockID` varchar(10) NOT NULL,
  `SOpen` double NOT NULL,
  `SHigh` double NOT NULL,
  `SLow` double NOT NULL,
  `SClose` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usastock_ww`
--

DROP TABLE IF EXISTS `usastock_ww`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usastock_ww` (
  `DDate` date NOT NULL,
  `StockID` varchar(10) NOT NULL,
  `SOpen` double NOT NULL,
  `SHigh` double NOT NULL,
  `SLow` double NOT NULL,
  `SClose` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-20 18:09:06
