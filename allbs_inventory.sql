-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: allbs
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inv_id` bigint NOT NULL,
  `cond` varchar(255) NOT NULL,
  `prod_pic` blob,
  `price` float NOT NULL,
  `book_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`inv_id`),
  KEY `FK8rus8qhfxl7ds6cv9xtawtrrk` (`book_id`),
  KEY `FK86u2qtuaxn5uph2u9olsxk2ic` (`user_id`),
  KEY `prod_pic_idx` (`prod_pic`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'New',NULL,799,NULL,NULL),(2,'Like New',NULL,18,NULL,NULL),(3,'Used',NULL,70,NULL,NULL),(4,'New',NULL,90,NULL,NULL),(5,'New',NULL,179,NULL,NULL),(6,'Like New',NULL,149,NULL,NULL),(7,'Used',NULL,75,NULL,NULL),(8,'Used',NULL,350,NULL,NULL),(9,'New',NULL,19,NULL,NULL),(10,'Like New',NULL,199,NULL,NULL),(11,'New',NULL,69,NULL,NULL),(12,'Like New',NULL,199,NULL,NULL),(13,'Like New',NULL,349,NULL,NULL),(14,'New',NULL,79,NULL,NULL),(15,'New',NULL,28,NULL,NULL),(16,'Like New',NULL,249,NULL,NULL),(17,'Used',NULL,25,NULL,NULL),(18,'New',NULL,45,NULL,NULL),(19,'New',NULL,200,NULL,NULL),(20,'Used',NULL,300,NULL,NULL);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-21 12:05:19
