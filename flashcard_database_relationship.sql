-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: flashcard_database
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `relationship`
--

DROP TABLE IF EXISTS `relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relationship` (
  `kanji_id` int NOT NULL,
  `meaning_id` int NOT NULL,
  `info_id` int NOT NULL,
  PRIMARY KEY (`kanji_id`,`meaning_id`,`info_id`),
  UNIQUE KEY `unique_relationship` (`kanji_id`,`meaning_id`,`info_id`),
  KEY `kanji_id_idx` (`kanji_id`),
  KEY `meaning_id_fk_idx` (`meaning_id`),
  KEY `info_id_fk_idx` (`info_id`),
  CONSTRAINT `info_id_fk` FOREIGN KEY (`info_id`) REFERENCES `info` (`info_id`),
  CONSTRAINT `kanji_id_fk` FOREIGN KEY (`kanji_id`) REFERENCES `kanji` (`kanji_id`),
  CONSTRAINT `meaning_id_fk` FOREIGN KEY (`meaning_id`) REFERENCES `eng_meaning` (`meaning_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationship`
--

LOCK TABLES `relationship` WRITE;
/*!40000 ALTER TABLE `relationship` DISABLE KEYS */;
INSERT INTO `relationship` VALUES (1,1,1),(1,1,2),(1,1,3),(1,1,4),(1,1,5),(1,1,6),(1,1,22),(1,1,38),(2,2,7),(2,2,9),(2,2,10),(2,2,12),(2,2,13),(2,2,27),(2,2,39),(2,2,40),(4,4,14),(4,4,15),(4,4,16),(4,4,29),(4,4,41),(4,4,42),(5,5,17),(5,5,18),(5,5,19),(5,5,20),(5,5,21),(5,5,43),(5,5,44),(10,10,30),(10,10,32),(10,10,33),(10,10,45),(10,10,46),(11,11,34),(11,11,35),(11,11,36),(11,11,37),(11,11,47),(12,12,48),(12,12,49),(12,12,50),(12,12,51),(12,12,52),(12,12,53),(12,12,54),(13,13,55),(13,13,56),(13,13,57),(13,13,58),(13,13,59),(14,14,60),(14,14,61),(14,14,62),(14,14,63),(14,14,64),(16,16,66),(16,16,67),(16,16,68),(16,16,69),(17,17,70),(18,21,74),(18,21,75),(19,22,76),(19,22,77),(19,22,78),(20,23,79),(20,23,80),(21,24,81),(21,24,82),(21,24,83),(21,27,86),(21,28,87),(22,29,88),(22,29,89),(23,30,90),(23,30,91),(23,31,92),(23,31,93),(23,31,94),(23,31,95),(23,31,96),(23,31,97),(23,31,99),(23,31,100),(23,31,101),(24,32,102),(24,32,103),(24,32,104),(24,32,105),(24,33,106),(25,34,107),(25,34,108),(25,34,109),(25,35,110),(25,35,111),(25,35,112),(25,35,113),(25,35,114),(26,36,115),(26,36,116),(27,37,117),(27,37,118),(27,37,119),(27,37,120),(28,38,121),(28,38,122),(28,38,123),(29,39,124),(29,39,125),(30,40,126),(30,40,127),(30,40,128),(31,41,129),(31,41,130),(32,42,131),(32,42,132),(32,42,133),(32,42,134);
/*!40000 ALTER TABLE `relationship` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-10 10:49:02
