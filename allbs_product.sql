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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL,
  `category` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `discription` varchar(255) DEFAULT NULL,
  `prod_pic` blob,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (3,'Home & Kitchen','Instant Pot Duo Nova','A 7-in-1 pressure cooker that can also sauté, steam, slow cook, and more. Comes in various sizes.','',0),(4,'Fashion','Nike Air Force 1','A classic sneaker with a leather upper, iconic design, and comfortable Air-Sole unit. Available in various colors.','',0),(5,'Toys & Games','LEGO Creator Expert Bookshop','A detailed, 3-story modular building set with a bookstore and adjoining townhouse. Includes 5 minifigures.','',0),(6,'Health & Wellness','Fitbit Charge 5','An advanced fitness tracker with built-in GPS, EDA sensors, heart rate monitoring, and up to 7 days of battery life.','',0),(7,'Sports & Outdoors','Patagonia Better Sweater','A cozy, eco-friendly fleece sweater made from recycled materials. Available in various colors and sizes.','',0),(8,'Home & Kitchen','Vitamix 5200 Blender','A powerful, high-performance blender that can blend anything from smoothies to hot soups. Comes with a tamper and recipe book.','',0),(11,'Fashion','Levi\'s 501 Original Fit Jeans','A classic, straight-leg jean made from durable denim. Available in various washes and sizes.','',0),(12,'Toys & Games','Nintendo Switch Lite','A compact, handheld version of the popular Nintendo Switch console. Comes in various colors.','',0),(13,'Health & Wellness','Theragun Elite','A percussive therapy device that helps relieve muscle soreness and tension. Includes 5 attachments and a carrying case.','',0),(14,'Home & Kitchen','Instant Pot Air Fryer Lid','An attachment that turns your Instant Pot into an air fryer. Can also roast, broil, and dehydrate.','',0),(15,'Beauty','Olaplex Hair Perfector No. 3','A at-home hair treatment that helps repair and strengthen damaged hair. Suitable for all hair types.','',0),(16,'Electronics','Samsung Galaxy Watch 4','An advanced smartwatch with built-in GPS, heart rate monitoring, and various fitness tracking features.','',0),(17,'Sports & Outdoors','Yeti Rambler Tumbler','A durable, double-wall insulated tumbler that keeps drinks hot or cold for hours. Available in various sizes and colors.','',0),(18,'Toys & Games','Catan Board Game','A classic strategy board game where players compete to build settlements and cities on an island.','',0),(19,'Health & Wellness','Philips Sonicare DiamondClean Toothbrush','An advanced electric toothbrush with 5 brushing modes and a built-in timer.','',0),(20,'Home & Kitchen','KitchenAid Artisan Stand Mixer','A versatile stand mixer with a powerful motor and various attachments for','',0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-21 12:05:18
