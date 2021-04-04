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
-- Table structure for table `account_login`
--
use business_listings;
DROP TABLE IF EXISTS `account_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_login` (
  `login_attempt_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `user_account` varchar(45) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `ip_number` int(11) DEFAULT NULL,
  `browser_type` varchar(45) DEFAULT NULL,
  `success` varchar(1) DEFAULT NULL,
  `login_at` datetime DEFAULT NULL,
  PRIMARY KEY (`login_attempt_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_login`
--

LOCK TABLES `account_login` WRITE;
/*!40000 ALTER TABLE `account_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_image_tags`
--

DROP TABLE IF EXISTS `business_image_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_image_tags` (
  `image_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  KEY `id_idx` (`image_id`),
  KEY `bz_tag_id_idx` (`tag_id`),
  CONSTRAINT `bz_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `business_tags` (`business_tag_id`),
  CONSTRAINT `id` FOREIGN KEY (`image_id`) REFERENCES `business_images` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_image_tags`
--

LOCK TABLES `business_image_tags` WRITE;
/*!40000 ALTER TABLE `business_image_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_image_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_images`
--

DROP TABLE IF EXISTS `business_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_url` longtext NOT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `card_id_idx` (`business_id`),
  CONSTRAINT `card_id` FOREIGN KEY (`business_id`) REFERENCES `business_listings` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_images`
--

LOCK TABLES `business_images` WRITE;
/*!40000 ALTER TABLE `business_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_listings`
--

DROP TABLE IF EXISTS `business_listings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_listings` (
  `business_id` int(11) NOT NULL AUTO_INCREMENT,
  `business_name` varchar(100) DEFAULT NULL,
  `business_address_id` int(11) DEFAULT NULL,
  `business_website` varchar(200) DEFAULT NULL,
  `business_img_id` int(11) DEFAULT NULL,
  `business_category` varchar(45) DEFAULT NULL,
  `business_phone` varchar(20) DEFAULT NULL,
  `business_sm_id` int(11) DEFAULT NULL,
  `business_email_id` longtext,
  `business_hours` longtext,
  PRIMARY KEY (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_listings`
--

LOCK TABLES `business_listings` WRITE;
/*!40000 ALTER TABLE `business_listings` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_listings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_location`
--

DROP TABLE IF EXISTS `business_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_location` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(100) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `business_id` int(11) NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  UNIQUE KEY `address_id_UNIQUE` (`address_id`),
  KEY `bz_cards_id` (`business_id`),
  CONSTRAINT `bz_cards_id` FOREIGN KEY (`business_id`) REFERENCES `business_listings` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_location`
--

LOCK TABLES `business_location` WRITE;
/*!40000 ALTER TABLE `business_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_social_media`
--

DROP TABLE IF EXISTS `business_social_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_social_media` (
  `business_sm_id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `business_fb_url` longtext,
  `business_ig_url` longtext,
  `business_tw_url` longtext,
  PRIMARY KEY (`business_sm_id`),
  KEY `card_id_idx` (`business_id`),
  CONSTRAINT `sm_card_id` FOREIGN KEY (`business_id`) REFERENCES `business_listings` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_social_media`
--

LOCK TABLES `business_social_media` WRITE;
/*!40000 ALTER TABLE `business_social_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_social_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_tags`
--

DROP TABLE IF EXISTS `business_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_tags` (
  `business_tag_id` int(11) NOT NULL,
  `business_tag` varchar(255) NOT NULL,
  `created_At` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`business_tag_id`),
  UNIQUE KEY `bz_tag_id_UNIQUE` (`business_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_tags`
--

LOCK TABLES `business_tags` WRITE;
/*!40000 ALTER TABLE `business_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_account` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_account_name` varchar(45) NOT NULL,
  `user_email` text,
  `user_phone` int(11) NOT NULL,
  `user_full_name` longtext,
  `business_user_flag` varchar(1) NOT NULL DEFAULT 'N',
  `user_create_date` date NOT NULL,
  `user_business_id` int(11) DEFAULT NULL,
  `user_active` varchar(1) DEFAULT 'Y',
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_id_UNIQUE` (`user_id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_account_name`),
  UNIQUE KEY `user_phone_UNIQUE` (`user_phone`),
  KEY `business_id_idx` (`user_business_id`),
  CONSTRAINT `business_id` FOREIGN KEY (`user_business_id`) REFERENCES `business_listings` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-04  1:45:18
