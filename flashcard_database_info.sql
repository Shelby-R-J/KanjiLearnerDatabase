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
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `info_id` int NOT NULL AUTO_INCREMENT,
  `sound` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `kanji_ex` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `hiragana_ex` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `eng_ex` varchar(50) NOT NULL,
  PRIMARY KEY (`info_id`),
  UNIQUE KEY `unique_info` (`sound`,`kanji_ex`,`hiragana_ex`,`eng_ex`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (6,'other','一昨年','おととし','year before last'),(133,'other','人々','ひとびと','people'),(91,'other','今日','きょう','today'),(134,'other','山々','やまやま','mountains'),(93,'other','明後日','あさって','day after tomorrow'),(92,'other','明日','あした','tomorrow'),(95,'other','昨日','きのう','yesterday'),(131,'other','時々','ときどき','sometimes'),(132,'other','色々な','いろいろな','various'),(1,'いち','一','いち','one'),(2,'いち','一年生','いちねんせい','first-year student'),(38,'いち','一時','いちじ','1 o\'clock'),(22,'いち','一月','いちがつ','January'),(5,'いっ','一歳','いっさい','one year old'),(33,'いつ','五つ','いつつ','five (counter)'),(124,'えん','円','えん','yen'),(125,'えん','千円','せんえん','1,000 yen'),(96,'か','二日酔い','ふつかよい','hangover'),(75,'か','火曜日','かようび','Tuesday'),(86,'かな','金沢','かなざわ','Kanazawa'),(83,'かね','お金','おかね','money'),(79,'き','木','き','tree'),(63,'きゅう','九','きゅう','nine'),(82,'きん','料金','りょうきん','fare; fee'),(87,'きん','金','きん','gold'),(81,'きん','金曜日','きんようび','Friday'),(60,'く','九','く','nine'),(62,'く','九時','くじ','9 o\'clock'),(61,'く','九月','くがつ','September'),(64,'ここの','九つ','ここのつ','nine (counter)'),(30,'ご','五','ご','five'),(45,'ご','五時','ごじ','5 o\'clock'),(32,'ご','五月','ごがつ','May'),(46,'ご','五百','ごひゃく','500'),(15,'さん','三','さん','three'),(14,'さん','三年生','さんねんせい','third-year student'),(41,'さん','三時','さんじ','3 o\'clock'),(42,'さん','三百','さんびゃく','300'),(29,'さんがつ','三月','さんがつ','March'),(20,'し','四','し','four'),(21,'し','四月','しがつ','April'),(51,'しち','七','しち','seven'),(52,'しち','七時','しちじ','7 o\'clock'),(53,'しち','七月','しちがつ','July'),(106,'じ','一時','いちじ','1 o\'clock'),(105,'じ','何時','なんじ','What time is it?'),(101,'じつ','祝日','しゅくじつ','holiday'),(66,'じゅう','十','じゅう','ten'),(67,'じゅう','十時','じゅうじ','10 o\'clock'),(68,'じゅう','十月','じゅうがつ','October'),(78,'すい','水曜日','すいようび','Wednesday'),(122,'せん','千','せん','1,000'),(123,'ぜん','三千','さんぜん','3,000'),(121,'ち','千葉県','ちばけん','Chiba prefecture'),(70,'つき','月','つき','moon'),(88,'つち','土','つち','soil'),(103,'と','時計','とけい','watch; clock'),(69,'とお','十','とお','ten (counter)'),(102,'とき','時々','ときどき','sometimes'),(104,'とき','～時','～とき','at the time of ~'),(89,'ど','土曜日','どようび','Saturday'),(48,'なな','七','なな','seven'),(50,'なな','七つ','ななつ','seven (counter)'),(49,'なな','七時','ななじ','7 o\'clock'),(54,'なな','七百','ななひゃく','700'),(7,'に','ニ','に','two'),(9,'に','二年生','にねんせい','second-year student'),(39,'に','二時','にじ','2 o\'clock'),(27,'に','二月','にがつ','February'),(40,'に','二百','にひゃく','200'),(97,'に','日本','にほん','Japan'),(100,'にち','日','にち','day (in dates)'),(90,'にち','日曜日','にちようび','Sunday'),(55,'はち','八','はち','eight'),(56,'はち','八時','はちじ','8 o\'clock'),(57,'はち','八月','はちがつ','August'),(58,'はっ','八百','はっぴゃく','800'),(116,'はん','半分','はんぶん','half'),(115,'はん','～時半','～じはん','half past ~'),(74,'ひ','火','ひ','fire'),(3,'ひと','一つ','ひとつ','one (counter)'),(4,'ひと','一人で','ひとりで','alone'),(117,'ひゃく','百','ひゃく','100'),(120,'ひゃく','百万','ひゃくまん','1,000,000'),(99,'び','日曜日','にちようび','Sunday'),(94,'び','誕生日','たんじょうび','birthday'),(118,'びゃく','三百','さんびゃく','300'),(119,'ぴゃく','六百','ろっぴゃく','600'),(10,'ふた','二つ','ふたつ','two (counter)'),(12,'ふた','二人','ふたり','two people'),(13,'ふつ','二日酔い','ふつかよい','hangover'),(107,'ふん','二分','にふん','2 minutes'),(110,'ぶん','半分','はんぶん','half'),(112,'ぶん','気分が悪い','きぶんがわるい','feel sick'),(111,'ぶん','自分','じぶん','myself'),(108,'ぷん','一分','いっぷん','1 minute'),(109,'ぷん','何分','なんぷん','how many minutes'),(129,'まい','一枚','いちまい','one flat object'),(130,'まい','何枚','なんまい','how many flat objects'),(126,'まん','一万','いちまん','10,000'),(127,'まん','十万','じゅうまん','100,000'),(128,'まん','百万','ひゃくまん','1,000,000'),(76,'みず','水','みず','water'),(77,'みず','水着','みずぎ','swimwear'),(16,'みっ','三つ','みっつ','three (counter)'),(35,'むっ','六つ','むっつ','six (counter)'),(80,'もく','木曜日','もくようび','Thursday'),(59,'やっ','八つ','やっつ','eight (counter)'),(18,'よ','四年生','よねんせい','fourth-year student'),(44,'よ','四時','よじ','4 o\'clock'),(19,'よっ','四つ','よっつ','four (counter)'),(17,'よん','四','よん','four'),(43,'よん','四百','よんひゃく','400'),(34,'ろく','六','ろく','six'),(47,'ろく','六時','ろくじ','6 o\'clock'),(36,'ろく','六月','ろくがつ','June'),(37,'ろっ','六百','ろっぴゃく','600'),(113,'わ','分かります','わかります','to understand'),(114,'わ','分けます','わけます','to divide');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
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
