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
-- Dumping events for database 'flashcard_database'
--

--
-- Dumping routines for database 'flashcard_database'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_info`(IN p_sound VARCHAR(50),
						  IN p_kanji_ex VARCHAR(50),
                          IN p_hiragana_ex VARCHAR(50),
                          IN p_eng_ex VARCHAR(50))
BEGIN
	INSERT INTO info (sound, kanji_ex, hiragana_ex, eng_ex)
    VALUES (p_sound, p_kanji_ex, p_hiragana_ex, p_eng_ex);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_kanji` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_kanji`(IN p_kanji_char VARCHAR(50),
						   IN p_unit_num INT)
BEGIN
	INSERT INTO kanji (kanji_char, unit_num)
    VALUES (p_kanji_char, p_unit_num);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_meaning` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_meaning`(IN p_meaning VARCHAR(50))
BEGIN
	INSERT INTO eng_meaning (meaning)
    VALUES (p_meaning);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_kanji` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_kanji`(IN r_kanji_id INT)
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT "An error has occurred, operation rollbacked and procedure terminated";
	END;

	SET AUTOCOMMIT = OFF;
	SET foreign_key_checks = OFF;
    
	DELETE FROM kanji
	WHERE kanji_id = r_kanji_id;

	DELETE FROM eng_meaning
    WHERE meaning_id = ( SELECT meaning_id
						 FROM relationship
                         WHERE kanji_id = r_kanji_id );

	DELETE FROM info
    WHERE info_id = ( SELECT info_id
					  FROM relationship
					  WHERE kanji_id = r_kanji_id );

	DELETE FROM relationship
	WHERE kanji_id = r_kanji_id;

    COMMIT;
    
	SET foreign_key_checks = OFF;
    SET AUTOCOMMIT = ON;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_relationship` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_relationship`(IN r_kanji_char VARCHAR(50),
								   IN r_unit_num INT,
                                   IN r_meaning VARCHAR(50),
                                   IN r_sound VARCHAR(50),
								   IN r_kanji_ex VARCHAR(50),
                                   IN r_hiragana_ex VARCHAR(50),
								   IN r_eng_ex VARCHAR(50))
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT "An error has occurred, operation rollbacked and procedure terminated";
	END;
    
    SET AUTOCOMMIT = OFF;

	SET @kanji_in_table = (EXISTS(
		SELECT *
        FROM kanji
        WHERE kanji_char = r_kanji_char));
	
    SET @meaning_in_table = (EXISTS(
		SELECT *
        FROM eng_meaning
        WHERE meaning = r_meaning));
        
	IF @kanji_in_table AND @meaning_in_table THEN
        SET @v_kanji_id = (SELECT kanji_id
			FROM kanji
			WHERE kanji_char = r_kanji_char);
                 
        SET @v_meaning_id = (SELECT meaning_id
			FROM eng_meaning
			WHERE meaning = r_meaning);
		
		CALL add_info(r_sound, r_kanji_ex, r_hiragana_ex, r_eng_ex);
		SET @v_info_id = last_insert_id();
		
		INSERT INTO relationship (kanji_id, meaning_id, info_id)
		VALUES (@v_kanji_id, @v_meaning_id, @v_info_id);
	ELSEIF @kanji_in_table THEN
        SET @v_kanji_id = (SELECT kanji_id
				 FROM kanji
				 WHERE kanji_char = r_kanji_char);
                 
        CALL add_meaning(r_meaning);
		SET @v_meaning_id = last_insert_id();
		
		CALL add_info(r_sound, r_kanji_ex, r_hiragana_ex, r_eng_ex);
		SET @v_info_id = last_insert_id();
		
		INSERT INTO relationship (kanji_id, meaning_id, info_id)
		VALUES (@v_kanji_id, @v_meaning_id, @v_info_id);
	ELSE
		CALL add_kanji(r_kanji_char, r_unit_num);
		SET @v_kanji_id = last_insert_id();
		
		CALL add_meaning(r_meaning);
		SET @v_meaning_id = last_insert_id();
		
		CALL add_info(r_sound, r_kanji_ex, r_hiragana_ex, r_eng_ex);
		SET @v_info_id = last_insert_id();
		
		INSERT INTO relationship (kanji_id, meaning_id, info_id)
		VALUES (@v_kanji_id, @v_meaning_id, @v_info_id);
	END IF;
    
    COMMIT;
    
    SET AUTOCOMMIT = ON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_all`()
BEGIN
	SELECT *
	FROM relationship r
	JOIN kanji k
		USING(kanji_id)
	JOIN eng_meaning m
		USING(meaning_id)
	JOIN info i
		USING(info_id)
	ORDER BY k.kanji_id, m.meaning_id, i.sound;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-10 10:49:02
