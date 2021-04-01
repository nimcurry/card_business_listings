CREATE DATABASE  IF NOT EXISTS `card_business_listings` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `card_business_listings`;
-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: localhost    Database: card_business_listings
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `bz_cards`
--

DROP TABLE IF EXISTS `bz_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bz_cards` (
  `bz_card_id` int(11) NOT NULL AUTO_INCREMENT,
  `bz_name` varchar(100) DEFAULT NULL,
  `bz_address_id` int(11) DEFAULT NULL,
  `bz_website` varchar(200) DEFAULT NULL,
  `bz_image_id` int(11) DEFAULT NULL,
  `bz_category` varchar(45) DEFAULT NULL,
  `bz_phone` varchar(20) DEFAULT NULL,
  `bz_social_media_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bz_card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bz_cards`
--

LOCK TABLES `bz_cards` WRITE;
/*!40000 ALTER TABLE `bz_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `bz_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bz_image_tags`
--

DROP TABLE IF EXISTS `bz_image_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bz_image_tags` (
  `image_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  KEY `id_idx` (`image_id`),
  KEY `bz_tag_id_idx` (`tag_id`),
  CONSTRAINT `bz_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `bz_tags` (`bz_tag_id`),
  CONSTRAINT `id` FOREIGN KEY (`image_id`) REFERENCES `bz_images` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bz_image_tags`
--

LOCK TABLES `bz_image_tags` WRITE;
/*!40000 ALTER TABLE `bz_image_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `bz_image_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bz_images`
--

DROP TABLE IF EXISTS `bz_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bz_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_url` longtext NOT NULL,
  `card_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `card_id_idx` (`card_id`),
  CONSTRAINT `card_id` FOREIGN KEY (`card_id`) REFERENCES `bz_cards` (`bz_card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bz_images`
--

LOCK TABLES `bz_images` WRITE;
/*!40000 ALTER TABLE `bz_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `bz_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bz_location`
--

DROP TABLE IF EXISTS `bz_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bz_location` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(100) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `card_id` int(11) NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  UNIQUE KEY `address_id_UNIQUE` (`address_id`),
  KEY `bz_cards_id` (`card_id`),
  CONSTRAINT `bz_cards_id` FOREIGN KEY (`card_id`) REFERENCES `bz_cards` (`bz_card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bz_location`
--

LOCK TABLES `bz_location` WRITE;
/*!40000 ALTER TABLE `bz_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `bz_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bz_social_media`
--

DROP TABLE IF EXISTS `bz_social_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bz_social_media` (
  `bz_sm_id` int(11) NOT NULL,
  `sm_card_id` int(11) NOT NULL,
  `bz_fb_url` longtext,
  `bz_ig_url` longtext,
  `bz_tw_url` longtext,
  PRIMARY KEY (`bz_sm_id`),
  KEY `card_id_idx` (`sm_card_id`),
  CONSTRAINT `sm_card_id` FOREIGN KEY (`sm_card_id`) REFERENCES `bz_cards` (`bz_card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bz_social_media`
--

LOCK TABLES `bz_social_media` WRITE;
/*!40000 ALTER TABLE `bz_social_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `bz_social_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bz_tags`
--

DROP TABLE IF EXISTS `bz_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bz_tags` (
  `bz_tag_id` int(11) NOT NULL,
  `bz_tag` varchar(255) NOT NULL,
  `created_At` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`bz_tag_id`),
  UNIQUE KEY `bz_tag_id_UNIQUE` (`bz_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bz_tags`
--

LOCK TABLES `bz_tags` WRITE;
/*!40000 ALTER TABLE `bz_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `bz_tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-31 23:57:42
