-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: localhost    Database: library_db
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `books_tbl`
--

DROP TABLE IF EXISTS `books_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_tbl` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `owner` varchar(100) DEFAULT NULL,
  `checked_out_by_id` bigint DEFAULT NULL,
  `checked_out_by` varchar(100) DEFAULT NULL,
  `checked_out_date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_tbl`
--

LOCK TABLES `books_tbl` WRITE;
/*!40000 ALTER TABLE `books_tbl` DISABLE KEYS */;
INSERT INTO `books_tbl` VALUES (1,'Available','Exactus Office','The Elegant Universe','Brian Greene','Dustin',NULL,'',''),(2,'Checked Out','Exactus Office','Fahrenheit 451','Ray Bradbury','Dustin',3,NULL,'2020-08-09'),(4,'Available','Exactus Office','All the Pretty Horses','Cormac McCarthy','Dustin',NULL,NULL,NULL),(5,'Available','Exactus Office','War Child','Emmanuel Jal','Dustin',NULL,NULL,NULL),(6,'Checked Out','Exactus Office','To Kill a Mockingbird','Harper Lee','Dustin',3,NULL,'2020-08-09');
/*!40000 ALTER TABLE `books_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_tbl`
--

DROP TABLE IF EXISTS `comments_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments_tbl` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bookid` bigint DEFAULT NULL,
  `userid` bigint DEFAULT NULL,
  `comment` text,
  `comment_date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_tbl`
--

LOCK TABLES `comments_tbl` WRITE;
/*!40000 ALTER TABLE `comments_tbl` DISABLE KEYS */;
INSERT INTO `comments_tbl` VALUES (2,1,2,'hehehe','2020-08-09'),(3,2,2,'dsafdsaf','2020-08-09'),(4,2,2,'I love this book! I had so much fun reading it!','2020-08-09'),(5,2,3,'Wow! This book is awesome!','2020-08-09'),(6,6,3,'Awesome! Great story!','2020-08-09'),(7,1,2,'yeyeyeyeye','2020-08-09 6:i:30'),(8,1,2,'sdafdsafsd','2020-08-09 06:10 AM');
/*!40000 ALTER TABLE `comments_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_tbl`
--

DROP TABLE IF EXISTS `users_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_tbl` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role` varchar(50) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `uname` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_tbl`
--

LOCK TABLES `users_tbl` WRITE;
/*!40000 ALTER TABLE `users_tbl` DISABLE KEYS */;
INSERT INTO `users_tbl` VALUES (1,'ADMIN','Maria','Lestrange','admin','admin'),(2,'BORROWER','Jampz','Baliw','jampzdev','12345'),(3,'BORROWER','Malinda','Hollaway','malinda','12345');
/*!40000 ALTER TABLE `users_tbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-09 15:06:11
