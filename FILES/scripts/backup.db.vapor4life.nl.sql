-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (i686)
--
-- Host: vandaae11.eleven.axc.nl    Database: vandaae11_zc1
-- ------------------------------------------------------
-- Server version	5.5.33

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
-- Table structure for table `zc_address_book`
--

DROP TABLE IF EXISTS `zc_address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_address_book` (
  `address_book_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `entry_gender` char(1) NOT NULL DEFAULT '',
  `entry_company` varchar(64) DEFAULT NULL,
  `entry_firstname` varchar(32) NOT NULL DEFAULT '',
  `entry_lastname` varchar(32) NOT NULL DEFAULT '',
  `entry_street_address` varchar(64) NOT NULL DEFAULT '',
  `entry_suburb` varchar(32) DEFAULT NULL,
  `entry_postcode` varchar(10) NOT NULL DEFAULT '',
  `entry_city` varchar(32) NOT NULL DEFAULT '',
  `entry_state` varchar(32) DEFAULT NULL,
  `entry_country_id` int(11) NOT NULL DEFAULT '0',
  `entry_zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_book_id`),
  KEY `idx_address_book_customers_id_zen` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_address_book`
--

LOCK TABLES `zc_address_book` WRITE;
/*!40000 ALTER TABLE `zc_address_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_address_format`
--

DROP TABLE IF EXISTS `zc_address_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_address_format` (
  `address_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_format` varchar(128) NOT NULL DEFAULT '',
  `address_summary` varchar(48) NOT NULL DEFAULT '',
  PRIMARY KEY (`address_format_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_address_format`
--

LOCK TABLES `zc_address_format` WRITE;
/*!40000 ALTER TABLE `zc_address_format` DISABLE KEYS */;
INSERT INTO `zc_address_format` VALUES (1,'$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country','$city / $country'),(2,'$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country','$city, $state / $country'),(3,'$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country','$state / $country'),(4,'$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country','$postcode / $country'),(5,'$firstname $lastname$cr$streets$cr$postcode $city$cr$country','$city / $country'),(6,'$firstname $lastname$cr$streets$cr$city$cr$state$cr$postcode$cr$country','$postcode / $country');
/*!40000 ALTER TABLE `zc_address_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_admin`
--

DROP TABLE IF EXISTS `zc_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(32) NOT NULL DEFAULT '',
  `admin_email` varchar(96) NOT NULL DEFAULT '',
  `admin_profile` int(11) NOT NULL DEFAULT '0',
  `admin_pass` varchar(40) NOT NULL DEFAULT '',
  `prev_pass1` varchar(40) NOT NULL DEFAULT '',
  `prev_pass2` varchar(40) NOT NULL DEFAULT '',
  `prev_pass3` varchar(40) NOT NULL DEFAULT '',
  `pwd_last_change_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset_token` varchar(60) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_ip` varchar(45) NOT NULL DEFAULT '',
  `failed_logins` smallint(4) unsigned NOT NULL DEFAULT '0',
  `lockout_expires` int(11) NOT NULL DEFAULT '0',
  `last_failed_attempt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_failed_ip` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`admin_id`),
  KEY `idx_admin_name_zen` (`admin_name`),
  KEY `idx_admin_email_zen` (`admin_email`),
  KEY `idx_admin_profile_zen` (`admin_profile`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_admin`
--

LOCK TABLES `zc_admin` WRITE;
/*!40000 ALTER TABLE `zc_admin` DISABLE KEYS */;
INSERT INTO `zc_admin` VALUES (1,'ray','ray@vandaaag.nu',1,'587292d0ed565fb44678583bbd0022c5:yH','','','','2013-09-05 17:27:43','','0000-00-00 00:00:00','2013-09-06 11:56:33','217.122.104.136',0,0,'0000-00-00 00:00:00','');
/*!40000 ALTER TABLE `zc_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_admin_activity_log`
--

DROP TABLE IF EXISTS `zc_admin_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_admin_activity_log` (
  `log_id` bigint(15) NOT NULL AUTO_INCREMENT,
  `access_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `page_accessed` varchar(80) NOT NULL DEFAULT '',
  `page_parameters` text,
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `flagged` tinyint(4) NOT NULL DEFAULT '0',
  `attention` varchar(255) NOT NULL DEFAULT '',
  `gzpost` mediumblob NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `idx_page_accessed_zen` (`page_accessed`),
  KEY `idx_access_date_zen` (`access_date`),
  KEY `idx_ip_zen` (`ip_address`),
  KEY `idx_flagged_zen` (`flagged`)
) ENGINE=MyISAM AUTO_INCREMENT=515 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_admin_activity_log`
--

LOCK TABLES `zc_admin_activity_log` WRITE;
/*!40000 ALTER TABLE `zc_admin_activity_log` DISABLE KEYS */;
INSERT INTO `zc_admin_activity_log` VALUES (1,'2013-09-05 17:30:47',0,'Log found to be empty. Logging started.','','217.122.104.136',0,'',''),(2,'2013-09-05 17:30:47',0,'login.php ','camefrom=index.php&','217.122.104.136',0,'',''),(3,'2013-09-05 17:30:52',0,'login.php admin','camefrom=index.php&','217.122.104.136',0,'','´VJL…ÕÃãœKÃMU≤ÇpîtîìK2ÛÛÄ)˘â∆F∆)¶©&&I&©ÜÜ&)F&iIâFñFâÜfJµ\0'),(4,'2013-09-05 17:31:05',0,'login.php admin','camefrom=index.php&','217.122.104.136',0,'','´VJL…ÕÃãœKÃMU≤ÇpîtîìK2ÛÛÄ)˘â∆F∆)¶©&&I&©ÜÜ&)F&iIâFñFâÜfJµ\0'),(5,'2013-09-05 17:31:22',0,'login.php ray','camefrom=index.php&','217.122.104.136',0,'','´VJL…ÕÃãœKÃMU≤R*J¨T“QJL.…ÃœrSÚççåSLS\rL,L,íLR\r\rMRåL“íç,ç\rÕîj'),(6,'2013-09-05 17:31:52',1,'define_pages_editor.php','','217.122.104.136',0,'',''),(7,'2013-09-05 17:31:58',1,'define_pages_editor.php','define_it=4&action=new_page&','217.122.104.136',0,'',''),(8,'2013-09-05 17:33:27',1,'define_pages_editor.php','define_it=4&action=new_page&','217.122.104.136',0,'',''),(9,'2013-09-05 17:33:58',1,'define_pages_editor.php','define_it=4&action=new_page&','217.122.104.136',0,'',''),(10,'2013-09-05 17:34:06',1,'define_pages_editor.php','define_it=4&action=new_page&','217.122.104.136',0,'',''),(11,'2013-09-05 17:34:11',1,'define_pages_editor.php','lngdir=dutch&','217.122.104.136',0,'',''),(12,'2013-09-05 17:34:18',1,'define_pages_editor.php','define_it=4&action=new_page&','217.122.104.136',0,'',''),(13,'2013-09-05 17:34:49',1,'define_pages_editor.php','define_it=4&action=new_page&','217.122.104.136',0,'',''),(14,'2013-09-05 17:38:07',1,'define_pages_editor.php','lngdir=dutch&filename=define_main_page.php&action=save&','217.122.104.136',0,'','çQÕn‹ ~ïâ`q§t+«Uï™VU9DHÜY<kY5Qﬁ=‡$ÍzËê>æ?ÜßÊH<£Á‘öN¡Òx+•l&Êı ÖÁÛyÁ≤À;)ﬁÿR‹Ï˜˚ˆCeˆ-R‘õée1Iq˜ÈW€ﬁ\\Z≈ê∫!è§qwZm•ÅrºÒÁVxPﬁ(e¡–[tâï#ã0ï[ád»øJôÿ·&˛Ü#úË.≈#¸F4	Æ€∂E˜e}Që¡‚3ÕS!écÅ∑åøE@AÁ†\'æÇÔµXs!ó:µG&ÆöBƒô_∏\\m=•Ë;)T/£Ù›⁄%ÜÀ£ºÅ≤+Úù˚¬t €¸:9ìYORLº∏ÅºvŸTT;ïi)∫˙	ETŒı›∫KÉ∑˝œœ¯°‘\\ßK\'XZFL ´V¬:Ëˇè¸ró’)∆ãÿ∑∞≠@Û¸'),(15,'2013-09-05 17:38:07',1,'define_pages_editor.php','','217.122.104.136',0,'',''),(16,'2013-09-05 17:39:14',1,'configuration.php','gID=20&','217.122.104.136',0,'',''),(17,'2013-09-05 17:39:18',1,'configuration.php','gID=20&cID=446&action=edit&','217.122.104.136',0,'',''),(18,'2013-09-05 17:39:21',1,'configuration.php','gID=20&cID=447&action=edit&','217.122.104.136',0,'',''),(19,'2013-09-05 17:39:26',1,'configuration.php','gID=20&cID=447&','217.122.104.136',0,'',''),(20,'2013-09-05 17:39:30',1,'configuration.php','gID=20&cID=446&action=edit&','217.122.104.136',0,'',''),(21,'2013-09-05 17:39:36',1,'configuration.php','gID=20&cID=446&action=save&','217.122.104.136',0,'','´VJŒœKÀL/-J,…Ãœã/KÃ)MU≤RJKÃ)NU“Q*.M Õ,qÒ˜ãwÛä˜uÙÙqısÙsvçØ\0*31∆Ø¶®∆–D©\0'),(22,'2013-09-05 17:39:36',1,'configuration.php','gID=20&cID=446&','217.122.104.136',0,'',''),(23,'2013-09-05 17:40:20',1,'layout_controller.php','','217.122.104.136',0,'',''),(24,'2013-09-05 17:40:36',1,'layout_controller.php','page=&cID=75&','217.122.104.136',0,'',''),(25,'2013-09-05 17:40:40',1,'layout_controller.php','page=&cID=75&action=edit&','217.122.104.136',0,'',''),(26,'2013-09-05 17:40:44',1,'layout_controller.php','page=&cID=75&action=save&layout_box_name=whats_new.php&','217.122.104.136',0,'','´V I¨Ã/-âO Øà/.I,)-V≤R2P“Aœ…ON,…Ãœ√î)Œ/*âœ/JI- ·îå/ŒÃKœI≈¢l#≤t-\0'),(27,'2013-09-05 17:40:45',1,'layout_controller.php','page=&cID=75&','217.122.104.136',0,'',''),(28,'2013-09-05 17:40:50',1,'layout_controller.php','page=&cID=62&','217.122.104.136',0,'',''),(29,'2013-09-05 17:40:52',1,'layout_controller.php','page=&cID=62&action=edit&','217.122.104.136',0,'',''),(30,'2013-09-05 17:40:56',1,'layout_controller.php','page=&cID=62&action=save&layout_box_name=manufacturers.php&','217.122.104.136',0,'','´V I¨Ã/-âO Øà/.I,)-V≤R2P“Aœ…ON,…Ãœ√î)Œ/*âœ/JI- „îå/ŒÃKœI™1BW∂!o®T\0'),(31,'2013-09-05 17:40:56',1,'layout_controller.php','page=&cID=62&','217.122.104.136',0,'',''),(32,'2013-09-05 17:41:04',1,'layout_controller.php','page=&cID=64&','217.122.104.136',0,'',''),(33,'2013-09-05 17:41:07',1,'layout_controller.php','page=&cID=64&action=edit&','217.122.104.136',0,'',''),(34,'2013-09-05 17:41:17',1,'layout_controller.php','page=&cID=64&action=save&layout_box_name=more_information.php&','217.122.104.136',0,'','´V I¨Ã/-âO Øà/.I,)-V≤R2P“Aœ…ON,…Ãœ√î)Œ/*âœ/JI- ‡îç/ŒÃKœI≈™l)BÅÅR-\0'),(35,'2013-09-05 17:41:18',1,'layout_controller.php','page=&cID=64&','217.122.104.136',0,'',''),(36,'2013-09-05 17:42:00',1,'layout_controller.php','page=&cID=55&','217.122.104.136',0,'',''),(37,'2013-09-05 17:42:04',1,'layout_controller.php','page=&cID=55&action=edit&','217.122.104.136',0,'',''),(38,'2013-09-05 17:42:08',1,'layout_controller.php','page=&cID=55&action=save&layout_box_name=categories.php&','217.122.104.136',0,'','´V I¨Ã/-âO Øà/.I,)-V≤R2P“Aœ…ON,…Ãœ√î)Œ/*âœ/JI- ‚îå/ŒÃKœI≈¶l%Bﬁ@©\0'),(39,'2013-09-05 17:42:08',1,'layout_controller.php','page=&cID=55&','217.122.104.136',0,'',''),(40,'2013-09-05 17:42:10',1,'layout_controller.php','page=&cID=62&','217.122.104.136',0,'',''),(41,'2013-09-05 17:42:13',1,'layout_controller.php','page=&cID=62&action=edit&','217.122.104.136',0,'',''),(42,'2013-09-05 17:42:17',1,'layout_controller.php','page=&cID=62&action=save&layout_box_name=manufacturers.php&','217.122.104.136',0,'','´V I¨Ã/-âO Øà/.I,)-V≤R2P“Aœ…ON,…Ãœ√î)Œ/*âœ/JI- „îå/ŒÃKœI™1BW∂!o†T\0'),(43,'2013-09-05 17:42:17',1,'layout_controller.php','page=&cID=62&','217.122.104.136',0,'',''),(44,'2013-09-05 17:42:21',1,'layout_controller.php','page=&cID=60&','217.122.104.136',0,'',''),(45,'2013-09-05 17:42:24',1,'layout_controller.php','page=&cID=60&action=edit&','217.122.104.136',0,'',''),(46,'2013-09-05 17:42:29',1,'layout_controller.php','page=&cID=60&action=save&layout_box_name=information.php&','217.122.104.136',0,'','´V I¨Ã/-âO Øà/.I,)-V≤R2P“Aœ…ON,…Ãœ√î)Œ/*âœ/JI- ô‚îå/ŒÃKœI™1AW∂!o†T\0'),(47,'2013-09-05 17:42:29',1,'layout_controller.php','page=&cID=60&','217.122.104.136',0,'',''),(48,'2013-09-05 17:42:32',1,'layout_controller.php','page=&cID=72&','217.122.104.136',0,'',''),(49,'2013-09-05 17:42:45',1,'layout_controller.php','page=&cID=72&action=edit&','217.122.104.136',0,'',''),(50,'2013-09-05 17:42:50',1,'layout_controller.php','page=&cID=72&action=save&layout_box_name=shopping_cart.php&','217.122.104.136',0,'','´V I¨Ã/-âO Øà/.I,)-V≤R2P“Aœ…ON,…Ãœ ¢ ÁïƒÁ•§ÂåpI∆gÊ•Á§’£´[âê7P™\0'),(51,'2013-09-05 17:42:50',1,'layout_controller.php','page=&cID=72&','217.122.104.136',0,'',''),(52,'2013-09-05 17:42:53',1,'layout_controller.php','page=&cID=54&','217.122.104.136',0,'',''),(53,'2013-09-05 17:42:58',1,'layout_controller.php','page=&cID=54&action=edit&','217.122.104.136',0,'',''),(54,'2013-09-05 17:43:04',1,'layout_controller.php','page=&cID=54&action=save&layout_box_name=best_sellers.php&','217.122.104.136',0,'','´V I¨Ã/-âO Øà/.I,)-V≤R2P“Aœ…ON,…Ãœ ¢ ÁïƒÁ•§Âå\rpI∆gÊ•Á§’ò£´[âê7P™\0'),(55,'2013-09-05 17:43:04',1,'layout_controller.php','page=&cID=54&','217.122.104.136',0,'',''),(56,'2013-09-05 17:43:06',1,'layout_controller.php','page=&cID=63&','217.122.104.136',0,'',''),(57,'2013-09-05 17:43:10',1,'layout_controller.php','page=&cID=63&action=edit&','217.122.104.136',0,'',''),(58,'2013-09-05 17:43:14',1,'layout_controller.php','page=&cID=63&action=save&layout_box_name=manufacturer_info.php&','217.122.104.136',0,'','´V I¨Ã/-âO Øà/.I,)-V≤R2P“Aœ…ON,…Ãœ ¢ ÁïƒÁ•§ÂåMqI∆gÊ•Á§’X¢´[âê7P™\0'),(59,'2013-09-05 17:43:15',1,'layout_controller.php','page=&cID=63&','217.122.104.136',0,'',''),(60,'2013-09-05 17:43:18',1,'layout_controller.php','page=&cID=61&','217.122.104.136',0,'',''),(61,'2013-09-05 17:43:22',1,'layout_controller.php','page=&cID=61&action=edit&','217.122.104.136',0,'',''),(62,'2013-09-05 17:43:27',1,'layout_controller.php','page=&cID=61&action=save&layout_box_name=languages.php&','217.122.104.136',0,'','´V I¨Ã/-âO Øà/.I,)-V≤R2P“Aœ…ON,…Ãœ ¢ ÁïƒÁ•§ÂÃ\rpI∆gÊ•Á§’ò¢´[âê7P™\0'),(63,'2013-09-05 17:43:27',1,'layout_controller.php','page=&cID=61&','217.122.104.136',0,'',''),(64,'2013-09-05 17:43:33',1,'layout_controller.php','page=&cID=56&','217.122.104.136',0,'',''),(65,'2013-09-05 17:43:36',1,'layout_controller.php','page=&cID=56&action=edit&','217.122.104.136',0,'',''),(66,'2013-09-05 17:43:40',1,'layout_controller.php','page=&cID=56&action=save&layout_box_name=currencies.php&','217.122.104.136',0,'','´V I¨Ã/-âO Øà/.I,)-V≤R2P“Aœ…ON,…Ãœ ¢ ÁïƒÁ•§Â,pI∆gÊ•Á§’ò°´[âê7P™\0'),(67,'2013-09-05 17:43:40',1,'layout_controller.php','page=&cID=56&','217.122.104.136',0,'',''),(68,'2013-09-05 17:43:43',1,'layout_controller.php','page=&cID=76&','217.122.104.136',0,'',''),(69,'2013-09-05 17:43:49',1,'layout_controller.php','page=&cID=76&action=edit&','217.122.104.136',0,'',''),(70,'2013-09-05 17:43:53',1,'layout_controller.php','page=&cID=76&action=save&layout_box_name=whos_online.php&','217.122.104.136',0,'','´V I¨Ã/-âO Øà/.I,)-V≤R2P“Aœ…ON,…Ãœ ¢ ÁïƒÁ•§Âåp…∆gÊ•Á§bU∂°¿@©\0'),(71,'2013-09-05 17:43:53',1,'layout_controller.php','page=&cID=76&','217.122.104.136',0,'',''),(72,'2013-09-05 17:45:58',1,'layout_controller.php','page=&cID=51&','217.122.104.136',0,'',''),(73,'2013-09-05 17:46:01',1,'layout_controller.php','page=&cID=51&action=edit&','217.122.104.136',0,'',''),(74,'2013-09-05 17:46:08',1,'layout_controller.php','page=&cID=51&action=save&layout_box_name=banner_box.php&','217.122.104.136',0,'','´V I¨Ã/-âO Øà/.I,)-V≤R2P“Aœ…ON,…Ãœ√î)Œ/*âœ/JI- ‡îç/ŒÃKœI*2DS∂!m†T\0'),(75,'2013-09-05 17:46:08',1,'layout_controller.php','page=&cID=51&','217.122.104.136',0,'',''),(76,'2013-09-05 17:46:11',1,'layout_controller.php','page=&cID=58&','217.122.104.136',0,'',''),(77,'2013-09-05 17:46:14',1,'layout_controller.php','page=&cID=58&action=edit&','217.122.104.136',0,'',''),(78,'2013-09-05 17:46:19',1,'layout_controller.php','page=&cID=58&action=save&layout_box_name=ezpages.php&','217.122.104.136',0,'','´V I¨Ã/-âO Øà/.I,)-V≤R2P“Aœ…ON,…Ãœ ¢ ÁïƒÁ•§ÂtqJ∆gÊ•Á§’°)€àê6P™\0'),(79,'2013-09-05 17:46:19',1,'layout_controller.php','page=&cID=58&','217.122.104.136',0,'',''),(80,'2013-09-05 17:49:06',0,'login.php ','camefrom=index.php&','31.13.99.116',0,'',''),(81,'2013-09-05 17:53:16',0,'login.php ','camefrom=index.php&','217.122.104.136',0,'',''),(82,'2013-09-05 17:53:18',0,'login.php ','camefrom=index.php&','173.252.73.117',0,'',''),(83,'2013-09-05 17:56:03',0,'login.php ray','camefrom=index.php&','217.122.104.136',0,'','´VJL…ÕÃãœKÃMU≤R*J¨T“QJL.…ÃœrSÚÕMçMM“í\rÕåÃ,,íå\rMMìSSÕç“íçì--Ãîj'),(84,'2013-09-05 17:56:23',1,'categories.php','','217.122.104.136',0,'',''),(85,'2013-09-05 17:56:25',1,'categories.php','x=64&y=16&product_type=1&cPath=&action=new_product&','217.122.104.136',0,'',''),(86,'2013-09-05 17:56:25',1,'product.php','x=64&y=16&product_type=1&cPath=&action=new_product&','217.122.104.136',0,'',''),(87,'2013-09-05 17:56:28',1,'categories.php','cPath=&action=new_category&','217.122.104.136',0,'',''),(88,'2013-09-05 17:57:56',1,'define_pages_editor.php','','217.122.104.136',0,'',''),(89,'2013-09-05 17:58:01',1,'define_pages_editor.php','define_it=4&action=new_page&','217.122.104.136',0,'',''),(90,'2013-09-05 17:58:42',1,'define_pages_editor.php','','217.122.104.136',0,'',''),(91,'2013-09-05 20:41:24',0,'login.php ','camefrom=define_pages_editor.php&','217.122.104.136',0,'',''),(92,'2013-09-05 22:56:39',0,'login.php ','camefrom=index.php&','217.122.104.136',0,'',''),(93,'2013-09-06 11:56:23',0,'login.php ','camefrom=index.php&','217.122.104.136',0,'',''),(94,'2013-09-06 11:56:33',0,'login.php ray','camefrom=index.php&','217.122.104.136',0,'','´VJL…ÕÃãœKÃMU≤R*J¨T“QJL.…ÃœrSÚ”å“RÕì,ìÃçRÕ”ÃåììåMLLSSí“ÃMîj'),(95,'2013-09-06 11:56:44',1,'categories.php','','217.122.104.136',0,'',''),(96,'2013-09-06 11:56:48',1,'categories.php','cPath=&action=new_category&','217.122.104.136',0,'',''),(97,'2013-09-06 11:58:00',1,'categories.php','action=insert_category&cPath=&','217.122.104.136',0,'','Uå1\n√0øb∂6Ñ∏‘\\¶\ràC:ƒA$Ö”•2˛ªÖÉ±]Ó23ß™¬Õ ∑`Ç√ÀHçuò≈\ZF<˚Öuº“ë[P˘ö‘rHPrÚQ¥ØSy?p+H¶ƒ>S˘—Áo∑™Ê´F÷=≥'),(98,'2013-09-06 11:58:00',1,'categories.php','cPath=&cID=1&','217.122.104.136',0,'',''),(99,'2013-09-06 11:58:05',1,'categories.php','cPath=&action=new_category&','217.122.104.136',0,'',''),(100,'2013-09-06 11:59:04',1,'categories.php','action=insert_category&cPath=&','217.122.104.136',0,'','UåA\nÑ0ˇ“gAÙËÕaHÜ0`22O≤_qY‘c7Uu R„¨&Ï°RaLFLòcdwcGá·|Èûpbè&[≠ÁJ…!âùÎVñØÇ \n’ù÷üÌj-®%∂+Û'),(101,'2013-09-06 11:59:05',1,'categories.php','cPath=&cID=2&','217.122.104.136',0,'',''),(102,'2013-09-06 12:00:33',1,'categories.php','cPath=&action=new_category&','217.122.104.136',0,'',''),(103,'2013-09-06 12:00:57',1,'categories.php','action=insert_category&cPath=&','217.122.104.136',0,'','Uå1\nÄ0ˇ≤µ\"Z⁄€˘!Ê&—K¨ƒø+ä®Â¿Ãl)≥ã*úL œh74h—ïΩ,´ÿÑı…ÿãØj9ç*sñû‚#äw∆äûÙ&CÖﬂA<96û¬J”]ß®ŸDµ¨◊Ê\0'),(104,'2013-09-06 12:00:57',1,'categories.php','cPath=&cID=3&','217.122.104.136',0,'',''),(105,'2013-09-06 12:01:05',1,'categories.php','cPath=1&','217.122.104.136',0,'',''),(106,'2013-09-06 12:01:10',1,'categories.php','cPath=&cID=1&action=edit_category&','217.122.104.136',0,'',''),(107,'2013-09-06 12:01:29',1,'categories.php','action=update_category&cPath=&','217.122.104.136',0,'','UŒ1\n√0–´ÕíéπB«¿˚c±de(!wØ©Sp◊˜ø¯:»≥!T\'ÅöÈ>ZÊZz¥Ëe¨Ω=≈jkÕçË¸kTØ≤ôî¸;\Zäí¢¢«›ƒ.qﬁyÌaóÄ÷÷ijTãö+\Z†◊ìäj*ﬁúΩ7|Ì¸\0'),(108,'2013-09-06 12:01:29',1,'categories.php','cPath=&cID=1&','217.122.104.136',0,'',''),(109,'2013-09-06 12:01:38',1,'categories.php','cPath=&action=new_category&','217.122.104.136',0,'',''),(110,'2013-09-06 12:02:08',1,'categories.php','action=insert_category&cPath=&','217.122.104.136',0,'','UÃ¡\nÉ0–ôs†Xo^˚BXÃ‹lŸ§≈◊RD{úaﬁ¨ò®q6Æ±ê2ÜOxë7SYÿ+∫£¡Ó„ƒury7±rö€P4«$~§ãå¸=àRÊ®T>4ˇt5o—<Òˆÿv'),(111,'2013-09-06 12:02:09',1,'categories.php','cPath=&cID=4&','217.122.104.136',0,'',''),(112,'2013-09-06 12:02:20',1,'categories.php','cPath=&cID=3&action=edit_category&','217.122.104.136',0,'',''),(113,'2013-09-06 12:02:25',1,'categories.php','action=update_category&cPath=&','217.122.104.136',0,'','Uç±\n√0DˇEsI∫eÔñ0∆F€©¨%‰ﬂ´`ÓxÔﬁqØã0U«3º‡—≥Ï¡|¿d’˚πgg¨¶åñ·¸SëjﬁîKæù»):di∞?M>íK>Ô~me#H+©]√`®QWÈ⁄OÑ™\nu˙›.iÑÛ'),(114,'2013-09-06 12:02:25',1,'categories.php','cPath=&cID=3&','217.122.104.136',0,'',''),(115,'2013-09-06 12:02:29',1,'categories.php','cPath=&cID=2&action=edit_category&','217.122.104.136',0,'',''),(116,'2013-09-06 12:02:34',1,'categories.php','action=update_category&cPath=&','217.122.104.136',0,'','UŒ1\n√0–ªhŒ–∫xÎIå±ÖƒVêî°Ñ‹Ω\n¶‡ÆOˇÛuBNÜïÖP#Ñe∂û\ZB8ùºsFU&Aı–Í◊_∏†f°›à˚Ø3©’XHŒ≥-Uå-ı#m„8§‡ÜÊ„pRã,Ô˛À¡ü0°l—>˚Z·˙'),(117,'2013-09-06 12:02:34',1,'categories.php','cPath=&cID=2&','217.122.104.136',0,'',''),(118,'2013-09-06 12:04:18',1,'categories.php','cPath=&action=new_category&','217.122.104.136',0,'',''),(119,'2013-09-06 12:04:35',1,'categories.php','action=insert_category&cPath=&','217.122.104.136',0,'','UÃ¡\nÄ0–…Y=zÙ;ÑQ\\∑IWO‚ø´à®«Ñºl…8d..QdtZtË…åU&N®–úˆÍªı\\Fï≈$ßá|ÜÉÛ¢gz…P„˜ ëªHi•˘÷%´π¨û/ÿb?\0'),(120,'2013-09-06 12:04:35',1,'categories.php','cPath=&cID=5&','217.122.104.136',0,'',''),(121,'2013-09-06 12:07:23',1,'countries.php','','217.122.104.136',0,'',''),(122,'2013-09-06 12:07:35',1,'tax_rates.php','','217.122.104.136',0,'',''),(123,'2013-09-06 12:07:44',1,'tax_rates.php','page=1&action=new&','217.122.104.136',0,'',''),(124,'2013-09-06 12:07:53',1,'tax_classes.php','','217.122.104.136',0,'',''),(125,'2013-09-06 12:08:00',1,'tax_classes.php','page=1&action=new&','217.122.104.136',0,'',''),(126,'2013-09-06 12:08:24',1,'tax_classes.php','page=1&action=insert&','217.122.104.136',0,'','´V*I¨àOŒI,.é/…,…IU≤Rr\n	W“AOI-N. ,(…Ãœ *’\0'),(127,'2013-09-06 12:08:24',1,'tax_classes.php','','217.122.104.136',0,'',''),(128,'2013-09-06 12:08:32',1,'tax_rates.php','','217.122.104.136',0,'',''),(129,'2013-09-06 12:08:34',1,'tax_rates.php','page=1&action=new&','217.122.104.136',0,'',''),(130,'2013-09-06 12:08:43',1,'tax_rates.php','page=1&','217.122.104.136',0,'',''),(131,'2013-09-06 12:08:47',1,'geo_zones.php','','217.122.104.136',0,'',''),(132,'2013-09-06 12:11:29',1,'geo_zones.php','zpage=1&zID=1&action=new_zone&','217.122.104.136',0,'',''),(133,'2013-09-06 12:11:52',1,'geo_zones.php','zpage=1&zID=1&action=insert_zone&','217.122.104.136',0,'','´VJOÕèØ œKçœKÃMU≤Rr\rU“A¶§\'eîdÊÁÅÂúB¬ïj'),(134,'2013-09-06 12:11:52',1,'geo_zones.php','zID=2&','217.122.104.136',0,'',''),(135,'2013-09-06 12:11:56',1,'geo_zones.php','zpage=1&zID=1&','217.122.104.136',0,'',''),(136,'2013-09-06 12:11:58',1,'geo_zones.php','zpage=1&zID=1&action=list&','217.122.104.136',0,'',''),(137,'2013-09-06 12:12:02',1,'geo_zones.php','zpage=1&zID=1&','217.122.104.136',0,'',''),(138,'2013-09-06 12:12:04',1,'geo_zones.php','zpage=1&zID=2&','217.122.104.136',0,'',''),(139,'2013-09-06 12:12:07',1,'geo_zones.php','zpage=1&zID=2&action=list&','217.122.104.136',0,'',''),(140,'2013-09-06 12:12:11',1,'geo_zones.php','zpage=1&zID=2&','217.122.104.136',0,'',''),(141,'2013-09-06 12:12:21',1,'geo_zones.php','','217.122.104.136',0,'',''),(142,'2013-09-06 12:12:25',1,'tax_classes.php','','217.122.104.136',0,'',''),(143,'2013-09-06 12:12:29',1,'tax_classes.php','page=1&tID=2&action=edit&','217.122.104.136',0,'',''),(144,'2013-09-06 12:12:32',1,'tax_classes.php','page=1&tID=2&','217.122.104.136',0,'',''),(145,'2013-09-06 12:12:40',1,'tax_rates.php','','217.122.104.136',0,'',''),(146,'2013-09-06 12:12:43',1,'tax_rates.php','page=1&action=new&','217.122.104.136',0,'',''),(147,'2013-09-06 12:13:14',1,'tax_rates.php','page=1&action=insert&','217.122.104.136',0,'','´V*I¨àOŒI,.éœLQ≤R2R“UÂÁ•¢ä%ñ§Ç∏ÜP~JjqrQfAIf~PÿœG¡)$*UPîô_îYR	W™\0'),(148,'2013-09-06 12:13:14',1,'tax_rates.php','page=1&tID=2&','217.122.104.136',0,'',''),(149,'2013-09-06 12:13:20',1,'tax_rates.php','','217.122.104.136',0,'',''),(150,'2013-09-06 12:13:23',1,'tax_classes.php','','217.122.104.136',0,'',''),(151,'2013-09-06 12:13:26',1,'geo_zones.php','','217.122.104.136',0,'',''),(152,'2013-09-06 12:13:33',1,'geo_zones.php','zpage=1&zID=2&action=edit_zone&','217.122.104.136',0,'',''),(153,'2013-09-06 12:13:48',1,'geo_zones.php','zpage=1&zID=2&action=save_zone&','217.122.104.136',0,'','´VJOÕèØ œKçœKÃMU≤Rr\rU“A¶§\'eîdÊÁÅÂúB¬ïj'),(154,'2013-09-06 12:13:48',1,'geo_zones.php','zID=2&','217.122.104.136',0,'',''),(155,'2013-09-06 12:13:55',1,'geo_zones.php','zpage=1&zID=2&action=list&','217.122.104.136',0,'',''),(156,'2013-09-06 12:13:59',1,'geo_zones.php','zpage=1&zID=2&action=list&spage=0&saction=new&','217.122.104.136',0,'',''),(157,'2013-09-06 12:14:15',1,'geo_zones.php','zpage=1&zID=2&action=list&spage=0&saction=insert_sub&','217.122.104.136',0,'','´V™ œKçOŒ/Õ+)™åœLQ≤R245P“ÅàÉ˘Jµ\0'),(158,'2013-09-06 12:14:15',1,'geo_zones.php','zpage=1&zID=2&action=list&sID=2&','217.122.104.136',0,'',''),(159,'2013-09-06 12:14:21',1,'geo_zones.php','zpage=1&zID=2&action=list&spage=1&sID=2&saction=new&','217.122.104.136',0,'',''),(160,'2013-09-06 12:14:27',1,'geo_zones.php','zpage=1&zID=2&action=list&spage=1&sID=2&saction=insert_sub&','217.122.104.136',0,'','´V™ œKçOŒ/Õ+)™åœLQ≤R22T“ÅÉπJµ\0'),(161,'2013-09-06 12:14:28',1,'geo_zones.php','zpage=1&zID=2&action=list&sID=3&','217.122.104.136',0,'',''),(162,'2013-09-06 12:14:33',1,'geo_zones.php','zpage=1&zID=2&action=list&spage=1&sID=3&saction=new&','217.122.104.136',0,'',''),(163,'2013-09-06 12:14:48',1,'geo_zones.php','zpage=1&zID=2&action=list&spage=1&sID=3&saction=insert_sub&','217.122.104.136',0,'','´V™ œKçOŒ/Õ+)™åœLQ≤R≤0T“ÅÉπJµ\0'),(164,'2013-09-06 12:14:48',1,'geo_zones.php','zpage=1&zID=2&action=list&sID=4&','217.122.104.136',0,'',''),(165,'2013-09-06 12:14:50',1,'geo_zones.php','zpage=1&zID=2&action=list&spage=1&sID=4&saction=new&','217.122.104.136',0,'',''),(166,'2013-09-06 12:15:06',1,'geo_zones.php','zpage=1&zID=2&action=list&spage=1&sID=4&saction=insert_sub&','217.122.104.136',0,'','´V™ œKçOŒ/Õ+)™åœLQ≤R27V“ÅÉπJµ\0'),(167,'2013-09-06 12:15:06',1,'geo_zones.php','zpage=1&zID=2&action=list&sID=5&','217.122.104.136',0,'',''),(168,'2013-09-06 12:15:11',1,'geo_zones.php','zpage=1&zID=2&','217.122.104.136',0,'',''),(169,'2013-09-06 12:15:23',1,'geo_zones.php','','217.122.104.136',0,'',''),(170,'2013-09-06 12:15:26',1,'tax_classes.php','','217.122.104.136',0,'',''),(171,'2013-09-06 12:15:30',1,'tax_classes.php','page=1&tID=1&','217.122.104.136',0,'',''),(172,'2013-09-06 12:15:33',1,'tax_classes.php','page=1&tID=1&action=delete&','217.122.104.136',0,'',''),(173,'2013-09-06 12:15:35',1,'tax_classes.php','page=1&action=deleteconfirm&','217.122.104.136',0,'','´V*ÒtQ≤R2T™\0'),(174,'2013-09-06 12:15:35',1,'tax_classes.php','page=1&','217.122.104.136',0,'',''),(175,'2013-09-06 12:15:52',1,'tax_classes.php','','217.122.104.136',0,'',''),(176,'2013-09-06 12:15:59',1,'tax_classes.php','page=1&tID=1&','217.122.104.136',0,'',''),(177,'2013-09-06 12:16:02',1,'tax_classes.php','page=1&tID=1&action=delete&','217.122.104.136',0,'',''),(178,'2013-09-06 12:16:08',1,'tax_classes.php','page=1&action=deleteconfirm&','217.122.104.136',0,'','´V*ÒtQ≤R2T™\0'),(179,'2013-09-06 12:16:08',1,'tax_classes.php','page=1&','217.122.104.136',0,'',''),(180,'2013-09-06 12:16:21',1,'tax_rates.php','','217.122.104.136',0,'',''),(181,'2013-09-06 12:16:27',1,'tax_rates.php','page=1&tID=1&action=delete&','217.122.104.136',0,'',''),(182,'2013-09-06 12:16:32',1,'tax_rates.php','page=1&action=deleteconfirm&','217.122.104.136',0,'','´V*ÒtQ≤R2T™\0'),(183,'2013-09-06 12:16:32',1,'tax_rates.php','page=1&','217.122.104.136',0,'',''),(184,'2013-09-06 12:16:38',1,'geo_zones.php','','217.122.104.136',0,'',''),(185,'2013-09-06 12:16:41',1,'geo_zones.php','zpage=1&zID=1&','217.122.104.136',0,'',''),(186,'2013-09-06 12:17:11',1,'customers.php','','217.122.104.136',0,'',''),(187,'2013-09-06 12:17:23',1,'modules.php','set=ordertotal&','217.122.104.136',0,'',''),(188,'2013-09-06 12:17:45',1,'group_pricing.php','','217.122.104.136',0,'',''),(189,'2013-09-06 12:17:55',1,'currencies.php','','217.122.104.136',0,'',''),(190,'2013-09-06 12:18:36',1,'currencies.php','page=1&cID=2&','217.122.104.136',0,'',''),(191,'2013-09-06 12:18:39',1,'currencies.php','page=1&cID=2&action=edit&','217.122.104.136',0,'',''),(192,'2013-09-06 12:19:17',1,'currencies.php','page=1&cID=2&action=save&','217.122.104.136',0,'','MÕ¡\nÉ0‡w…a\')€ézﬁvñ¨çZàçÿV√w7ï·ÃÌˇ¯ÚÖ‰‘»≥@V‹û^O\rÒ3æÖ[¶.©]H+Õügﬂ≈UY?\"∑ì¯P»®•Arƒ‡‚°’π…h)*ﬁ‰\\æﬁÃıw{≥√Ãe\'÷\r'),(193,'2013-09-06 12:19:17',1,'currencies.php','page=1&cID=2&','217.122.104.136',0,'',''),(194,'2013-09-06 12:19:22',1,'currencies.php','page=1&cID=5&','217.122.104.136',0,'',''),(195,'2013-09-06 12:19:24',1,'currencies.php','page=1&cID=5&action=delete&','217.122.104.136',0,'',''),(196,'2013-09-06 12:19:26',1,'currencies.php','page=1&action=deleteconfirm&','217.122.104.136',0,'','´VJˆtQ≤R2U™\0'),(197,'2013-09-06 12:19:26',1,'currencies.php','page=1&','217.122.104.136',0,'',''),(198,'2013-09-06 12:19:29',1,'currencies.php','page=1&cID=4&action=delete&','217.122.104.136',0,'',''),(199,'2013-09-06 12:19:32',1,'currencies.php','page=1&action=deleteconfirm&','217.122.104.136',0,'','´VJˆtQ≤R2Q™\0'),(200,'2013-09-06 12:19:32',1,'currencies.php','page=1&','217.122.104.136',0,'',''),(201,'2013-09-06 12:19:35',1,'currencies.php','page=1&cID=3&','217.122.104.136',0,'',''),(202,'2013-09-06 12:19:38',1,'currencies.php','page=1&cID=3&action=delete&','217.122.104.136',0,'',''),(203,'2013-09-06 12:19:41',1,'currencies.php','page=1&action=deleteconfirm&','217.122.104.136',0,'','´VJˆtQ≤R2V™\0'),(204,'2013-09-06 12:19:41',1,'currencies.php','page=1&','217.122.104.136',0,'',''),(205,'2013-09-06 12:19:44',1,'currencies.php','page=1&cID=1&','217.122.104.136',0,'',''),(206,'2013-09-06 12:19:46',1,'currencies.php','page=1&cID=1&action=delete&','217.122.104.136',0,'',''),(207,'2013-09-06 12:19:47',1,'currencies.php','page=1&action=deleteconfirm&','217.122.104.136',0,'','´VJˆtQ≤R2T™\0'),(208,'2013-09-06 12:19:47',1,'currencies.php','page=1&','217.122.104.136',0,'',''),(209,'2013-09-06 12:19:54',1,'languages.php','','217.122.104.136',0,'',''),(210,'2013-09-06 12:20:01',1,'languages.php','page=1&lID=1&','217.122.104.136',0,'',''),(211,'2013-09-06 12:20:10',1,'layout_controller.php','','217.122.104.136',0,'',''),(212,'2013-09-06 12:20:49',1,'configuration.php','gID=1&','217.122.104.136',0,'',''),(213,'2013-09-06 12:20:53',1,'configuration.php','gID=1&cID=2&action=edit&','217.122.104.136',0,'',''),(214,'2013-09-06 12:21:09',1,'configuration.php','gID=1&cID=2&action=save&','217.122.104.136',0,'','´VJŒœKÀL/-J,…Ãœã/KÃ)MU≤R\n3ÒÛQ“Q*.M Õ,	Òrç˜˜s\räØ\0Jöò`ï™Jô)’\0'),(215,'2013-09-06 12:21:10',1,'configuration.php','gID=1&cID=2&','217.122.104.136',0,'',''),(216,'2013-09-06 12:21:11',1,'configuration.php','gID=1&cID=3&action=edit&','217.122.104.136',0,'',''),(217,'2013-09-06 12:21:18',1,'configuration.php','gID=1&cID=3&action=save&','217.122.104.136',0,'','´VJŒœKÀL/-J,…Ãœã/KÃ)MU≤R245P“Q*.M Õ,	Òrçwˆı	äåØ\0 öö‡ê¨i5P™\0'),(218,'2013-09-06 12:21:18',1,'configuration.php','gID=1&cID=3&','217.122.104.136',0,'',''),(219,'2013-09-06 12:21:35',1,'configuration.php','gID=1&cID=4&action=edit&','217.122.104.136',0,'',''),(220,'2013-09-06 12:21:41',1,'configuration.php','gID=1&cID=4&action=edit&','217.122.104.136',0,'',''),(221,'2013-09-06 12:23:01',1,'modules.php','set=shipping&','217.122.104.136',0,'',''),(222,'2013-09-06 12:23:05',1,'modules.php','set=shipping&module=zones&','217.122.104.136',0,'',''),(223,'2013-09-06 12:23:07',1,'modules.php','set=shipping&action=install&','217.122.104.136',0,'','´V ÕO)ÕIU≤R™ œK-V“Q Ã+.IÃ…q*-)…œãØ\0 òcWÖ\rîj'),(224,'2013-09-06 12:23:08',1,'modules.php','set=shipping&module=zones&action=edit&','217.122.104.136',0,'',''),(225,'2013-09-06 12:23:12',1,'modules.php','set=shipping&module=zones&action=save&','217.122.104.136',0,'','•–Ak√ Ä·ˇ‚9£î-ﬁlö∞4ñ|Üç]§liÍ%)Y26Jˇ˚¥É¬∫Üû‘èyÙÑﬁ˙nØ€iÿç∫Ô;°çHÍ\"UêÂ€m^Æ’´(SP π¨1$á©AÅ£⁄§2â©û›Fg\'˘ãäˆBÏ≠Vr[¡Aè∫kù1àJ*Q%iÂΩûÃ1µDgã∫îUnv°…jbÓiA^2 K<∞€5ä¡ÏvdºL\n{Ω‹kˆ˚≥óZÔÕpÉû¯i‡‰8ô\'3‡Ù_8ΩNg¡È~–«Ó≥YM„ÿwÍÀÃó!˙3˚6≥ù\0'),(226,'2013-09-06 12:23:12',1,'modules.php','set=shipping&module=zones&','217.122.104.136',0,'',''),(227,'2013-09-06 12:23:20',1,'modules.php','set=shipping&module=freeshipper&','217.122.104.136',0,'',''),(228,'2013-09-06 12:23:23',1,'modules.php','set=shipping&module=freeshipper&action=remove&','217.122.104.136',0,'',''),(229,'2013-09-06 12:23:41',1,'modules.php','action=removeconfirm&','217.122.104.136',0,'','´V*N-Q≤R*Œ»,(»ÃKW“Q ÕO)ÕIä••¶Ç≈SãÄ¬E©π˘e©N•%%˘yÒ@i#t—J†®ÖR-\0'),(230,'2013-09-06 12:23:42',1,'modules.php','set=shipping&module=freeshipper&','217.122.104.136',0,'',''),(231,'2013-09-06 12:23:46',1,'modules.php','set=shipping&module=item&','217.122.104.136',0,'',''),(232,'2013-09-06 12:23:47',1,'modules.php','set=shipping&module=item&action=remove&','217.122.104.136',0,'',''),(233,'2013-09-06 12:23:49',1,'modules.php','action=removeconfirm&','217.122.104.136',0,'','´V*N-Q≤R*Œ»,(»ÃKW“Q ÕO)ÕIäeñ§Ê˘E©π˘e©N•%%˘yÒ@qc3t—J†®°πR-\0'),(234,'2013-09-06 12:23:49',1,'modules.php','set=shipping&module=item&','217.122.104.136',0,'',''),(235,'2013-09-06 12:23:58',1,'modules.php','set=shipping&module=storepickup&','217.122.104.136',0,'',''),(236,'2013-09-06 12:23:59',1,'modules.php','set=shipping&module=storepickup&action=remove&','217.122.104.136',0,'',''),(237,'2013-09-06 12:24:02',1,'modules.php','action=removeconfirm&','217.122.104.136',0,'','´V*N-Q≤R*Œ»,(»ÃKW“Q ÕO)ÕIâï‰•d&gó\0ÖãRsÛÀRùJKJÚÛ‚+Ä“∆Ë¢ï@QCc•Z\0'),(238,'2013-09-06 12:24:03',1,'modules.php','set=shipping&module=storepickup&','217.122.104.136',0,'',''),(239,'2013-09-06 12:24:05',1,'modules.php','set=shipping&module=flat&','217.122.104.136',0,'',''),(240,'2013-09-06 12:24:07',1,'modules.php','set=shipping&module=flat&action=remove&','217.122.104.136',0,'',''),(241,'2013-09-06 12:24:08',1,'modules.php','action=removeconfirm&','217.122.104.136',0,'','´V*N-Q≤R*Œ»,(»ÃKW“Q ÕO)ÕIä•Â$ñ\0˘E©π˘e©N•%%˘yÒ@qSKt—J†®ÖR-\0'),(242,'2013-09-06 12:24:08',1,'modules.php','set=shipping&module=flat&','217.122.104.136',0,'',''),(243,'2013-09-06 12:24:28',1,'configuration.php','gID=1&','217.122.104.136',0,'',''),(244,'2013-09-06 12:24:53',1,'group_pricing.php','','217.122.104.136',0,'',''),(245,'2013-09-06 12:24:59',1,'modules.php','set=payment&','217.122.104.136',0,'',''),(246,'2013-09-06 12:25:14',1,'modules.php','set=payment&module=freecharger&','217.122.104.136',0,'',''),(247,'2013-09-06 12:25:16',1,'modules.php','set=payment&module=freecharger&action=remove&','217.122.104.136',0,'',''),(248,'2013-09-06 12:25:18',1,'modules.php','action=removeconfirm&','217.122.104.136',0,'','´V*N-Q≤R*H¨ÃMÕ+Q“Q ÕO)ÕI\n••¶&g$•ßÖãRsÛÀRùJKJÚÛ‚+Ä“fFË¢ï@QS•Z\0'),(249,'2013-09-06 12:25:18',1,'modules.php','set=payment&module=freecharger&','217.122.104.136',0,'',''),(250,'2013-09-06 12:25:54',1,'orders_status.php','','217.122.104.136',0,'',''),(251,'2013-09-06 12:26:28',1,'orders_status.php','page=0&action=new&','217.122.104.136',0,'',''),(252,'2013-09-06 12:26:44',1,'orders_status.php','page=0&action=insert&','217.122.104.136',0,'','´V /JI-*é/.I,)-éœKÃMU≤™V2R≤RÚœ+)KÃKOÕS“Q2Úïjk'),(253,'2013-09-06 12:26:45',1,'orders_status.php','page=0&oID=5&','217.122.104.136',0,'',''),(254,'2013-09-06 12:27:09',1,'orders_status.php','page=1&oID=5&action=edit&','217.122.104.136',0,'',''),(255,'2013-09-06 12:27:12',1,'orders_status.php','page=1&oID=5&action=save&','217.122.104.136',0,'','´V /JI-*é/.I,)-éœKÃMU≤™V2R≤RÚœ+)KÃKOÕS“Q2ÚïjuîRR”KsJÄº¸<•Z\0'),(256,'2013-09-06 12:27:12',1,'orders_status.php','page=1&oID=5&','217.122.104.136',0,'',''),(257,'2013-09-06 12:27:16',1,'orders_status.php','page=1&action=new&','217.122.104.136',0,'',''),(258,'2013-09-06 12:27:34',1,'orders_status.php','page=1&action=insert&','217.122.104.136',0,'','´V /JI-*é/.I,)-éœKÃMU≤™V2R≤RÚÃS(K-*O- ŒÃKW“Q2ä)’÷\0'),(259,'2013-09-06 12:27:34',1,'orders_status.php','page=1&oID=6&','217.122.104.136',0,'',''),(260,'2013-09-06 12:27:41',1,'orders_status.php','page=1&action=new&','217.122.104.136',0,'',''),(261,'2013-09-06 12:27:50',1,'orders_status.php','page=1&action=insert&','217.122.104.136',0,'','´V /JI-*é/.I,)-éœKÃMU≤™V2R≤R\nK-™ œKIÕS“Q2ÚÉ32\nRSîjk'),(262,'2013-09-06 12:27:50',1,'orders_status.php','page=1&oID=7&','217.122.104.136',0,'',''),(263,'2013-09-06 12:27:55',1,'orders_status.php','page=1&oID=5&','217.122.104.136',0,'',''),(264,'2013-09-06 12:27:57',1,'orders_status.php','page=1&oID=5&action=edit&','217.122.104.136',0,'',''),(265,'2013-09-06 12:28:21',1,'orders_status.php','page=1&oID=5&action=save&','217.122.104.136',0,'','´V /JI-*é/.I,)-éœKÃMU≤™V2R≤RÚœ+)KÃKOÕS“Q2ÚRÛR2Û“ïjk'),(266,'2013-09-06 12:28:21',1,'orders_status.php','page=1&oID=5&','217.122.104.136',0,'',''),(267,'2013-09-06 12:28:25',1,'orders_status.php','page=1&action=new&','217.122.104.136',0,'',''),(268,'2013-09-06 12:28:42',1,'orders_status.php','page=1&action=insert&','217.122.104.136',0,'','´V /JI-*é/.I,)-éœKÃMU≤™V2R≤Rr ÃJ/O- .Q“Q2ÚCRKRïjk'),(269,'2013-09-06 12:28:43',1,'orders_status.php','page=1&oID=8&','217.122.104.136',0,'',''),(270,'2013-09-06 12:28:45',1,'orders_status.php','page=1&oID=8&action=edit&','217.122.104.136',0,'',''),(271,'2013-09-06 12:28:49',1,'orders_status.php','page=1&oID=8&action=save&','217.122.104.136',0,'','´V /JI-*é/.I,)-éœKÃMU≤™V2R≤Rr ÃJO-O- .Q“Q2\nÑ§$ñ§*’÷\0'),(272,'2013-09-06 12:28:49',1,'orders_status.php','page=1&oID=8&','217.122.104.136',0,'',''),(273,'2013-09-06 12:28:58',1,'orders_status.php','page=1&action=new&','217.122.104.136',0,'',''),(274,'2013-09-06 12:29:05',1,'orders_status.php','page=1&action=insert&','217.122.104.136',0,'','´V /JI-*é/.I,)-éœKÃMU≤™V2R≤R\nq\rQ“Q22ïjk'),(275,'2013-09-06 12:29:06',1,'orders_status.php','page=1&oID=9&','217.122.104.136',0,'',''),(276,'2013-09-06 12:29:09',1,'orders_status.php','page=1&action=new&','217.122.104.136',0,'',''),(277,'2013-09-06 12:29:14',1,'orders_status.php','page=1&action=insert&','217.122.104.136',0,'','´V /JI-*é/.I,)-éœKÃMU≤™V2R≤RÚÀL-QP“Q2≤ïjk'),(278,'2013-09-06 12:29:14',1,'orders_status.php','page=1&action=insert&','217.122.104.136',0,'','´V /JI-*é/.I,)-éœKÃMU≤™V2R≤RÚÀL-QP“Q2≤ïjk'),(279,'2013-09-06 12:29:15',1,'orders_status.php','page=1&oID=10&','217.122.104.136',0,'',''),(280,'2013-09-06 12:29:15',1,'orders_status.php','page=1&oID=11&','217.122.104.136',0,'',''),(281,'2013-09-06 12:29:15',1,'orders_status.php','page=1&action=insert&','217.122.104.136',0,'','´V /JI-*é/.I,)-éœKÃMU≤™V2R≤RÚÀL-QP“Q2≤ïjk'),(282,'2013-09-06 12:29:15',1,'orders_status.php','page=1&oID=12&','217.122.104.136',0,'',''),(283,'2013-09-06 12:29:17',1,'orders_status.php','page=1&oID=12&action=edit&','217.122.104.136',0,'',''),(284,'2013-09-06 12:29:25',1,'orders_status.php','page=1&oID=12&action=save&','217.122.104.136',0,'','´V /JI-*é/.I,)-éœKÃMU≤™V2R≤RÚÀL-QpJ-ILÃIQ“Q2\n)’÷\0'),(285,'2013-09-06 12:29:25',1,'orders_status.php','page=1&oID=12&','217.122.104.136',0,'',''),(286,'2013-09-06 12:29:31',1,'orders_status.php','page=1&oID=10&','217.122.104.136',0,'',''),(287,'2013-09-06 12:29:33',1,'orders_status.php','page=1&oID=10&action=delete&','217.122.104.136',0,'',''),(288,'2013-09-06 12:29:34',1,'orders_status.php','page=1&action=deleteconfirm&','217.122.104.136',0,'','´V ˜tQ≤R24P™\0'),(289,'2013-09-06 12:29:35',1,'orders_status.php','page=1&','217.122.104.136',0,'',''),(290,'2013-09-06 12:29:36',1,'orders_status.php','page=1&oID=11&','217.122.104.136',0,'',''),(291,'2013-09-06 12:29:39',1,'orders_status.php','page=1&oID=11&action=delete&','217.122.104.136',0,'',''),(292,'2013-09-06 12:29:41',1,'orders_status.php','page=1&action=deleteconfirm&','217.122.104.136',0,'','´V ˜tQ≤R24T™\0'),(293,'2013-09-06 12:29:41',1,'orders_status.php','page=1&','217.122.104.136',0,'',''),(294,'2013-09-06 12:29:53',1,'orders_status.php','page=1&action=new&','217.122.104.136',0,'',''),(295,'2013-09-06 12:30:03',1,'orders_status.php','page=1&action=insert&','217.122.104.136',0,'','´V /JI-*é/.I,)-éœKÃMU≤™V2R≤Rr)MJJÕIUpJ-.IÕ……ÃKW“Q2J(’÷\0'),(296,'2013-09-06 12:30:04',1,'orders_status.php','page=1&oID=13&','217.122.104.136',0,'',''),(297,'2013-09-06 12:30:26',1,'categories.php','','217.122.104.136',0,'',''),(298,'2013-09-06 12:31:02',1,'configuration.php','gID=1&','217.122.104.136',0,'',''),(299,'2013-09-06 12:31:06',1,'configuration.php','gID=1&cID=4&action=edit&','217.122.104.136',0,'',''),(300,'2013-09-06 12:31:39',1,'profiles.php','','217.122.104.136',0,'',''),(301,'2013-09-06 12:31:43',1,'users.php','','217.122.104.136',0,'',''),(302,'2013-09-06 12:31:49',1,'admin_page_registration.php','','217.122.104.136',0,'',''),(303,'2013-09-06 12:32:02',1,'admin_page_registration.php','language=en&','217.122.104.136',0,'',''),(304,'2013-09-06 12:32:04',1,'configuration.php','gID=1&','217.122.104.136',0,'',''),(305,'2013-09-06 12:32:07',1,'configuration.php','gID=1&cID=4&action=edit&','217.122.104.136',0,'',''),(306,'2013-09-06 12:32:16',1,'alt_nav.php','','217.122.104.136',0,'',''),(307,'2013-09-06 12:32:19',1,'alt_nav.php','language=nl&','217.122.104.136',0,'',''),(308,'2013-09-06 12:32:30',1,'languages.php','','217.122.104.136',0,'',''),(309,'2013-09-06 12:32:37',1,'template_select.php','','217.122.104.136',0,'',''),(310,'2013-09-06 12:33:31',1,'layout_controller.php','','217.122.104.136',0,'',''),(311,'2013-09-06 12:34:54',1,'layout_controller.php','page=&cID=55&','217.122.104.136',0,'',''),(312,'2013-09-06 12:34:56',1,'layout_controller.php','page=&cID=55&action=edit&','217.122.104.136',0,'',''),(313,'2013-09-06 12:35:00',1,'layout_controller.php','page=&cID=55&action=save&layout_box_name=categories.php&','217.122.104.136',0,'','uÕA¬ –ª∞vÅm„9‹ìôv0D“I`HJ\ZÔ.∏j¢nÁ˝?W*q»õÀR≤∫)≠N«{‰$˙-ôì8N•fÁøËrXë~e>ìoúi.)HΩÛì˙&¯¡ì≈+†»˙ÀàÄ„4iCzmßVŸZÃÙnÌ?åzΩ'),(314,'2013-09-06 12:35:00',1,'layout_controller.php','page=&cID=55&','217.122.104.136',0,'',''),(315,'2013-09-06 12:35:19',1,'layout_controller.php','page=&cID=55&action=edit&','217.122.104.136',0,'',''),(316,'2013-09-06 12:35:28',1,'layout_controller.php','page=&cID=55&action=save&layout_box_name=categories.php&','217.122.104.136',0,'','uç¡\n¬0Dˇ%g±Mç¯ﬁ√nªë`ËB≤ÅÜ‚øõx™†∑aﬁfW*q»õÀR≤∫©≥:˚»3H‡µ˝M2\'qúJ}ı∫÷G§_ŒÁÚ¿Œ4ó§ﬁ˘I˝¸‡…‚–d˝eD¿—=—Ç^[”&[”¶jÍı'),(317,'2013-09-06 12:35:28',1,'layout_controller.php','page=&cID=55&','217.122.104.136',0,'',''),(318,'2013-09-06 12:36:13',1,'layout_controller.php','page=&cID=60&','217.122.104.136',0,'',''),(319,'2013-09-06 12:36:16',1,'layout_controller.php','page=&cID=60&action=edit&','217.122.104.136',0,'',''),(320,'2013-09-06 12:36:22',1,'layout_controller.php','page=&cID=60&action=save&layout_box_name=information.php&','217.122.104.136',0,'','uçÀ\n√ Eˇ≈u6öZ˙›ÀòåE*–	DBˇΩc7}@wó9˜ŒŸUÜF+˚@õØºVuQGu¯ºgöÄ-BÙ7©TÿSô±ˇB_”rÀ(˚€y)ﬂºõ+NkI‹Æt«ÓÑ8Dt·¡\rË‚…∆Z=‚¢vV&[m$4	N=û'),(321,'2013-09-06 12:36:22',1,'layout_controller.php','page=&cID=60&','217.122.104.136',0,'',''),(322,'2013-09-06 12:36:35',1,'layout_controller.php','page=&cID=60&action=edit&','217.122.104.136',0,'',''),(323,'2013-09-06 12:36:39',1,'layout_controller.php','page=&cID=60&action=save&layout_box_name=information.php&','217.122.104.136',0,'','uçA\n¬0EÔíµã¥Içx˜a¶ùH0t ôBÉxw7ä‚nò˜ˇ˚wï†Ú&y˜E@∂¢ŒjPáœ‚$Ú˙K\ngÒú çM˙Ù%Æ◊D-cø3Ø…7Ô˛BÛñ£‘ﬂ®oB9<∫ë\\8\Z4÷Íâ⁄ŸVŸª⁄¥£v«†O'),(324,'2013-09-06 12:36:39',1,'layout_controller.php','page=&cID=60&','217.122.104.136',0,'',''),(325,'2013-09-06 12:37:01',1,'layout_controller.php','page=&cID=69&','217.122.104.136',0,'',''),(326,'2013-09-06 12:37:04',1,'layout_controller.php','page=&cID=69&action=edit&','217.122.104.136',0,'',''),(327,'2013-09-06 12:37:08',1,'layout_controller.php','page=&cID=69&action=save&layout_box_name=reviews.php&','217.122.104.136',0,'','uç¡¬ DˇÖ≥,(’ÔNv€≈I7Å%)i¸w—ìFΩΩÃõ…l*A„*yıE@jQg•’Ó=O<ÅD^æM·,ûÛLπ;˚W˙ók¢˚◊„ß.4’•]¯FœKC á#†»Ö£A@c≠>–åA;€\'kØôSá÷a?™˚'),(328,'2013-09-06 12:37:09',1,'layout_controller.php','page=&cID=69&','217.122.104.136',0,'',''),(329,'2013-09-06 12:37:17',1,'layout_controller.php','page=&cID=75&','217.122.104.136',0,'',''),(330,'2013-09-06 12:37:20',1,'layout_controller.php','page=&cID=75&action=edit&','217.122.104.136',0,'',''),(331,'2013-09-06 12:37:25',1,'layout_controller.php','page=&cID=75&action=save&layout_box_name=whats_new.php&','217.122.104.136',0,'','uç¡\nB!Eˇ≈uSÀË;⁄ÀÃ{cHÚt<â˛=mSAÌ.˜‹Àπ´çW	»[®≤VuV{µ˚Ï3O âóNÙ7©\\$pô©tf˛¬P”rÕÙ„ˇ2æÒWö÷í§]¯FC	—DÚxÙÜ|<Z¥ŒÈÕµw˝≤ıô≥=¥‘„	'),(332,'2013-09-06 12:37:25',1,'layout_controller.php','page=&cID=75&','217.122.104.136',0,'',''),(333,'2013-09-06 12:37:43',1,'layout_controller.php','page=&cID=70&','217.122.104.136',0,'',''),(334,'2013-09-06 12:37:45',1,'layout_controller.php','page=&cID=70&action=edit&','217.122.104.136',0,'',''),(335,'2013-09-06 12:37:53',1,'layout_controller.php','page=&cID=70&action=save&layout_box_name=search.php&','217.122.104.136',0,'','}éÀ\n√ Eˇ≈u6öZ˙›ÀL2©d@GàÑ˛{MW}@wó9g∏wS	\ZWÒ»´/Rã∫®£:ºﬂO ëó_R8ãÁ<S˛«|âÀ-QWÙóÚ*¸ƒÖ¶ö£¥+ﬂioÑ0rxtπp2h¨’#Õ¥≥˝eÌ⁄hzh˚\n´O'),(336,'2013-09-06 12:37:53',1,'layout_controller.php','page=&cID=70&','217.122.104.136',0,'',''),(337,'2013-09-06 12:38:27',1,'layout_controller.php','page=&cID=70&action=edit&','217.122.104.136',0,'',''),(338,'2013-09-06 12:39:20',1,'layout_controller.php','page=&cID=65&','217.122.104.136',0,'',''),(339,'2013-09-06 12:39:22',1,'layout_controller.php','page=&cID=65&action=edit&','217.122.104.136',0,'',''),(340,'2013-09-06 12:39:26',1,'layout_controller.php','page=&cID=65&action=save&layout_box_name=music_genres.php&','217.122.104.136',0,'','mç¡\n¬0Dˇ%g±MMÒ;ºá›v#¡–Öd\r≈7ı¢Eo√º7Ã¶\"T.‚êWó§duUZùæ˚»H‡•ëÛëdN‚8Õî~WÊrXÓë˛(Ô√#Œ4ï§ﬁ¯A˚#¯Œì≈–vd˝•G¿ﬁ=–å^[”&k”ÃÿBm¡™Á'),(341,'2013-09-06 12:39:26',1,'layout_controller.php','page=&cID=65&','217.122.104.136',0,'',''),(342,'2013-09-06 12:40:06',1,'layout_controller.php','page=&cID=58&','217.122.104.136',0,'',''),(343,'2013-09-06 12:40:09',1,'layout_controller.php','page=&cID=58&action=edit&','217.122.104.136',0,'',''),(344,'2013-09-06 12:40:15',1,'layout_controller.php','page=&cID=58&action=save&layout_box_name=ezpages.php&','217.122.104.136',0,'','uç¡\n¬0Dˇ%gÖöF#~á˜∞€n$∫êl†°¯Ô&^≈Îº73õäPπàC^]êí’E‘Ó3è<Å^~IÊ$é”L©±˝_ËrXnëö£øî◊„˜ÖLSIAÍïÔ‘/¡kOœÄVìıßGcÜ#ÕËkZemöÈ›⁄7¨z<'),(345,'2013-09-06 12:40:15',1,'layout_controller.php','page=&cID=58&','217.122.104.136',0,'',''),(346,'2013-09-06 12:40:42',1,'layout_controller.php','page=&cID=52&','217.122.104.136',0,'',''),(347,'2013-09-06 12:40:45',1,'layout_controller.php','page=&cID=52&action=edit&','217.122.104.136',0,'',''),(348,'2013-09-06 12:40:51',1,'layout_controller.php','page=&cID=52&action=save&layout_box_name=banner_box2.php&','217.122.104.136',0,'','uçM\n¬0ÖÔíµã⁄§F=á˚0”N$:êL†Aºª	n,‚ÓÒæ˜ÛT*q»õÀR≤∫™£:|˚ëgê¿k#√ûdN‚8-îzk˙]Î=“ÔÚÁqè3Õ%©7~Pø?z≤x¥#Y“®ç&Z–÷¥ ÷b˙“DÌFΩﬁ'),(349,'2013-09-06 12:40:52',1,'layout_controller.php','page=&cID=52&','217.122.104.136',0,'',''),(350,'2013-09-06 12:41:44',1,'layout_controller.php','page=&cID=52&action=edit&','217.122.104.136',0,'',''),(351,'2013-09-06 12:41:54',1,'layout_controller.php','page=&cID=52&action=save&layout_box_name=banner_box2.php&','217.122.104.136',0,'','uçÀ\n√ Eˇ≈u&∆\Z˙›ÀL2©d¿DBˇΩ⁄M–›0Áﬁ{†r…y∑)C.I\\ƒ Nüˇ¿dœ[#Úõ$éŸr\\)ˆñ˛mÚ€-PÀËﬂÅóÚÕª9—R¢œı wÍNp£#É3†…∏≥B@5MR”äNö©UˆSs;jﬂƒ„	'),(352,'2013-09-06 12:41:54',1,'layout_controller.php','page=&cID=52&','217.122.104.136',0,'',''),(353,'2013-09-06 12:41:59',1,'layout_controller.php','page=&cID=60&','217.122.104.136',0,'',''),(354,'2013-09-06 12:42:03',1,'layout_controller.php','page=&cID=60&action=edit&','217.122.104.136',0,'',''),(355,'2013-09-06 12:42:13',1,'layout_controller.php','page=&cID=60&action=save&layout_box_name=information.php&','217.122.104.136',0,'','uçÀ\n√ Eˇ≈u6&5Ù;∫óôd,R…Äé)˝˜j7}@w√=˜Œπ´ïã8‰›e)Yù’Q>Û»H‡≠˝M2\'qúVJçM°ÀaªFjÛ€y)ﬂºõ3-%©æQwÇ<YúÌ@÷üöq‘≠Ëµ€dÔ˙πµˇ0ÍÒ'),(356,'2013-09-06 12:42:13',1,'layout_controller.php','page=&cID=60&','217.122.104.136',0,'',''),(357,'2013-09-06 12:44:51',1,'layout_controller.php','page=&cID=73&','217.122.104.136',0,'',''),(358,'2013-09-06 12:44:54',1,'layout_controller.php','page=&cID=73&action=edit&','217.122.104.136',0,'',''),(359,'2013-09-06 12:44:57',1,'layout_controller.php','page=&cID=73&action=save&layout_box_name=specials.php&','217.122.104.136',0,'','uçA\n¬0EÔíµãÿ&¶x˜a¶ùH0t ôBÉxw7ä‚n¯Ô˝˘wï†Ú&y˜E@∂¢ŒÍ®üy‚$Ú˙K\ngÒú ç˚˙◊k¢ÊË/Âµ¯∆˝}°yÀQÍÖo‘\'!ÅNÄn N#é∆hKÌL´ÏM≥Ω[€1©«'),(360,'2013-09-06 12:44:58',1,'layout_controller.php','page=&cID=73&','217.122.104.136',0,'',''),(361,'2013-09-06 12:45:36',1,'layout_controller.php','page=&cID=58&','217.122.104.136',0,'',''),(362,'2013-09-06 12:45:38',1,'layout_controller.php','page=&cID=58&action=edit&','217.122.104.136',0,'',''),(363,'2013-09-06 12:46:04',1,'layout_controller.php','page=&cID=58&action=save&layout_box_name=ezpages.php&','217.122.104.136',0,'','uçM\n¬0ÖÔíµãÿFS<á˚0”N$:êL†°xw7\nÍÓÒæ˜≥´ïã8‰Õe)Y]‘Q>˝»3H‡ıõdN‚8-î\Z”ˇòÀaΩE˙yæq_œ4ó§^˘N˝¸‡…‚h≤˛<\"‡hå>—Ç^[”*[ãô.jìz<'),(364,'2013-09-06 12:46:04',1,'layout_controller.php','page=&cID=58&','217.122.104.136',0,'',''),(365,'2013-09-06 12:46:24',1,'banner_manager.php','','217.122.104.136',0,'',''),(366,'2013-09-06 12:46:35',1,'banner_manager.php','page=1&bID=9&action=new&','217.122.104.136',0,'',''),(367,'2013-09-06 12:47:12',1,'layout_controller.php','','217.122.104.136',0,'',''),(368,'2013-09-06 12:47:19',1,'layout_controller.php','page=&cID=68&','217.122.104.136',0,'',''),(369,'2013-09-06 12:47:24',1,'layout_controller.php','page=&cID=68&action=edit&','217.122.104.136',0,'',''),(370,'2013-09-06 12:47:27',1,'layout_controller.php','page=&cID=68&action=save&layout_box_name=record_companies.php&','217.122.104.136',0,'','mé¡¬ DˇÖ≥⁄¢ø√;ŸmC$›ñ§ƒ¯ÔÇmÙ:o^f*BÂ\"ysY@JV•’·;è<É^ˆ$s«i°Ùk}òÀaΩE˙SyÓq¶π§ ı wÍã‡GOœÄv$ÎON∆Ë#-Ëµ5MŸZÕt∑ˆáÉzæ\0'),(371,'2013-09-06 12:47:27',1,'layout_controller.php','page=&cID=68&','217.122.104.136',0,'',''),(372,'2013-09-06 12:47:38',1,'layout_controller.php','page=&cID=53&','217.122.104.136',0,'',''),(373,'2013-09-06 12:47:40',1,'layout_controller.php','page=&cID=53&action=edit&','217.122.104.136',0,'',''),(374,'2013-09-06 12:47:46',1,'layout_controller.php','page=&cID=53&action=save&layout_box_name=banner_box_all.php&','217.122.104.136',0,'','uŒ¡\n√ ‡wÒºÉmm{é›%i„êI\Z°RˆÓ≥Ï≤2v˘í¸ŸUÑ EÚÊ≤Äî¨nJ´Àw?Úxm“ù%s«i°‘l¸g.áıÈ˜\'ÃôÊíÇ‘;?ÈHﬂ{≤x¥=Y?\r8£GZ–kk⁄ ÷∆Ã‘äz|ÿ©◊'),(375,'2013-09-06 12:47:46',1,'layout_controller.php','page=&cID=53&','217.122.104.136',0,'',''),(376,'2013-09-06 12:48:30',1,'layout_controller.php','page=&cID=59&','217.122.104.136',0,'',''),(377,'2013-09-06 12:48:32',1,'layout_controller.php','page=&cID=59&action=edit&','217.122.104.136',0,'',''),(378,'2013-09-06 12:48:38',1,'layout_controller.php','page=&cID=59&action=save&layout_box_name=featured.php&','217.122.104.136',0,'','uçA¬ EÔ¬⁄*∆s∏\'3Ì`à§ì¿4)iºª‡F£q;ÔÕ˚ªJPyèº˘\" kQuTáœ{‚	$ÚÚK\ngÒúg çŸÒÙ%.∑DÕ—_ kÒç{æ–¥Ê(ı wÍìÜ@œÄn Nçµz§Év∂ΩlM3=]{C´«'),(379,'2013-09-06 12:48:38',1,'layout_controller.php','page=&cID=59&','217.122.104.136',0,'',''),(380,'2013-09-06 12:48:56',1,'categories.php','','217.122.104.136',0,'',''),(381,'2013-09-06 12:49:00',1,'categories.php','cPath=1&','217.122.104.136',0,'',''),(382,'2013-09-06 12:49:08',1,'categories.php','x=49&y=7&product_type=1&cPath=1&action=new_product&','217.122.104.136',0,'',''),(383,'2013-09-06 12:49:09',1,'product.php','x=49&y=7&product_type=1&cPath=1&action=new_product&','217.122.104.136',0,'',''),(384,'2013-09-06 12:50:04',1,'product.php','cPath=1&product_type=1&action=new_product_preview&','217.122.104.136',0,'','ÖS¡R„0˝&Áe\'M≥-À/p\\Ó9VÇ;≤‹6√ÔÎ§-%néñû§ß˜‰˜b`ob#AT`ö‚±® ’˙æ¸{_nä_ÖÉ »™IÄŒ3aP4aRÊRL°Ò±%„Ä)W~õT-{ó#¶UúÊ‰π  1§Ëj—sfª≤†-Ÿ8ËcçDFæ¡±óÄÔEï‚ˇXÓûH`5·>>ÅäB‚àŸS¥ko27Jè\nDòtî´ı™±Nî™´Ú|®~oÍzs≠I«>ÃÀóãû;bâ`Ø9Ç›√x\\@Ö\ZÍªú–õåJ˚√EŸe6B/î ûMr›Qükü#‡CèÿìÑoª8:Ã7∑ÙC√4˘˛ÏŸ3π{ΩeŸ•Ÿ¨‘◊>Œ¥Ÿ!å;Ú1˘·†;›π.›)ü)û(X¸t”Ôê˜LÛ{AÙàùNÚ9ëÌô˚-Œ{§ÓE≤öÈU;\r\nÿƒ4w|ˆØ89m’‚V?ÄﬁV∏m7k\rz]◊Â4∫-∑u*ôÏ®ß⁄YéuÒÒ'),(385,'2013-09-06 12:50:07',1,'product.php','cPath=1&product_type=1&action=insert_product&','217.122.104.136',0,'','ÖRAr€0¸JFÁ¶#À™ïÊ=&wHA\n&§®Ç†mM&%«çM9”#±K`ÿ∑bdﬂF#Aµ ®†m±-ã™‹lÔÀﬂ˜ÂÆ¯Q8Ç¨L\"Ùû	É¢ôìêØœåèÉ(ôFLX˘-®:ˆ.gåLUúÊ‰XêRus’sQª≤†-û‘8bF\"#Ø4*\ni4f‚Ê™ko\njïûà0È(+WGe,ÑœI’Í{*>T?wuΩ[[ÌŸá≈Sy’sO,ÏZ#ÿL\'*º–8“–ÁÇ˛ §¥?~-Ï\Zç0%äÁ6”—êØ4g¿Ò?=‚@æÌ‚Ë∏DÈ&∫Xøúo—f°\Z˜‰cZ∞É˛Û∆‰˙î\'>?R]•è¯Ô<~è|`ZﬁWìO‹9\"êœ9 ı/íÁ0û|Êùp©˚[∫¯cÒ$¿r˜á$6sá˜Àåb0L£êŒ¸gr˜zõŸûi∑‡ã%41yúû˝+ŒgÑÆÍ∞—†õ\nõn∑’†∑u]˛¬VweSß/Û-ó Œ´oä˜'),(386,'2013-09-06 12:50:07',1,'categories.php','cPath=1&pID=1&','217.122.104.136',0,'',''),(387,'2013-09-06 12:50:26',1,'layout_controller.php','','217.122.104.136',0,'',''),(388,'2013-09-06 12:50:31',1,'layout_controller.php','page=&cID=75&','217.122.104.136',0,'',''),(389,'2013-09-06 12:50:34',1,'layout_controller.php','page=&cID=75&action=edit&','217.122.104.136',0,'',''),(390,'2013-09-06 12:53:45',1,'layout_controller.php','page=&cID=75&action=save&layout_box_name=whats_new.php&','217.122.104.136',0,'','uçA!EÔ¬⁄∆s∏\'e¶\"ô&Pí!Ô.∏—h‹ˆΩæøãç*;Oõ+\\ã∏à£8|ﬁÕ¿ë÷_R(≥£º`ÓL˛cÆƒıñ∞+˙€y-æ˘»úké‹Æt«1	A¥˛ﬁ*¥a“º6FûpÒAZ”_∂ÆM#›FCâ«'),(391,'2013-09-06 12:53:45',1,'layout_controller.php','page=&cID=75&','217.122.104.136',0,'',''),(392,'2013-09-06 12:54:06',1,'layout_controller.php','page=&cID=75&action=edit&','217.122.104.136',0,'',''),(393,'2013-09-06 12:54:14',1,'layout_controller.php','page=&cID=75&action=save&layout_box_name=whats_new.php&','217.122.104.136',0,'','uçA!EÔ¬⁄äÒÓI;SëLË$Cåw‹h4Óöæ˜ˇø´çW	»[®≤VuV{µ˚¸gû@/ø§rë¿e¶“ô˛«BMÀ5SWÃ∑ÛZ|ÛQ_iZKív·çIà&í«†7‰„—\"†uNh∆®ΩÎë≠kŒˆ£ç´O'),(394,'2013-09-06 12:54:14',1,'layout_controller.php','page=&cID=75&','217.122.104.136',0,'',''),(395,'2013-09-06 12:54:41',1,'layout_controller.php','page=&cID=75&action=edit&','217.122.104.136',0,'',''),(396,'2013-09-06 12:54:47',1,'layout_controller.php','page=&cID=75&action=save&layout_box_name=whats_new.php&','217.122.104.136',0,'','uçM¬ ÖÔ¬⁄EıÓ…L;\"È$0$%çwó∫—D›ΩºÔ˝¨*A„*yÒE@jQµWªO?Òy˛&Ö≥xŒÂŒÙ˙Á[¢_ô◊Âõo˚Ö∆ö£¥+ﬂi˚Ñ†9<:M.\r\ZkáMg{eÈ1sÓ¢u·‘„	'),(397,'2013-09-06 12:54:47',1,'layout_controller.php','page=&cID=75&','217.122.104.136',0,'',''),(398,'2013-09-06 12:55:27',1,'layout_controller.php','page=&cID=72&','217.122.104.136',0,'',''),(399,'2013-09-06 12:55:29',1,'layout_controller.php','page=&cID=72&action=edit&','217.122.104.136',0,'',''),(400,'2013-09-06 12:55:55',1,'layout_controller.php','page=&cID=72&action=save&layout_box_name=shopping_cart.php&','217.122.104.136',0,'','uÕA\n√ –ª∏Ó¬öXKœ—Ω8…X§í!z˜N∫J°›}Ê˝·o*áNç=–Í+nU›îVß„=”8—\"r˛ñJÖ=ïÀnˆ˙öñG∆_ùœ‰¡Ö+N≠$Ówz‚æ¢âË‡\Z¿tÒ2@Äaµ≈¢v£º¨R3NBó`’Î\r'),(401,'2013-09-06 12:55:55',1,'layout_controller.php','page=&cID=72&','217.122.104.136',0,'',''),(402,'2013-09-06 12:56:28',1,'layout_controller.php','page=&cID=72&action=edit&','217.122.104.136',0,'',''),(403,'2013-09-06 12:56:32',1,'layout_controller.php','page=&cID=72&action=save&layout_box_name=shopping_cart.php&','217.122.104.136',0,'','uÕA\n√ –ª∏Ó\"çFKœ—ΩÃ$cëJtÑHÈ›k∫\n¥›}Ê˝·?UÇ∆U<ÚÊãÄ‘¢ÆÍ¨N«{‚$Ú˙-Ö≥xŒÂ›¶ËK\\Ôâ~u>ìÔ\\hÆ9JªÒÉˆMc á@7íV#†6fòh¡08”_∂^”∂á÷ÉUØ7'),(404,'2013-09-06 12:56:32',1,'layout_controller.php','page=&cID=72&','217.122.104.136',0,'',''),(405,'2013-09-06 12:56:43',1,'layout_controller.php','page=&cID=67&','217.122.104.136',0,'',''),(406,'2013-09-06 12:56:45',1,'layout_controller.php','page=&cID=67&action=edit&','217.122.104.136',0,'',''),(407,'2013-09-06 12:56:50',1,'layout_controller.php','page=&cID=67&action=save&layout_box_name=product_notifications.php&','217.122.104.136',0,'','uçÕ\n√ Ñﬂ≈s6—\Z˙ΩÀö¨E*Y–\"°Ô^-î˛@o√|3|ªàP©∞u¥ŸÃ¿%ã≥ê‚ŸGöÅ≠çøI¶ƒñ“Ç©1≠ˇAõ√zçÿ6”ÔÊ©|ÛnŒ8ó∏^ËÜ›	~h‹Œh¸it‡F•§∆≈yiTªl/}ÌA‹'),(408,'2013-09-06 12:56:50',1,'layout_controller.php','page=&cID=67&','217.122.104.136',0,'',''),(409,'2013-09-06 12:57:29',1,'ezpages.php','','217.122.104.136',0,'',''),(410,'2013-09-06 12:57:51',1,'layout_controller.php','','217.122.104.136',0,'',''),(411,'2013-09-06 12:58:03',1,'layout_controller.php','page=&cID=71&action=edit&','217.122.104.136',0,'',''),(412,'2013-09-06 12:58:08',1,'layout_controller.php','page=&cID=71&action=save&layout_box_name=search_header.php&','217.122.104.136',0,'','}ç¡\n¬0Dˇ%g±çF¸Ôa∑›H0t!ªÅÒﬂM=)ä∑aﬁÊn24Æ\Zê◊ \nZ≈úç5ª˜>Ûöx˘&¬Eóô ?$-◊L?î◊·\'öjI⁄.|£Ì‚…„	–‰„qD¿—9{†£ıÆO÷Æπm€zÿ[Ûx'),(413,'2013-09-06 12:58:08',1,'layout_controller.php','page=&cID=71&','217.122.104.136',0,'',''),(414,'2013-09-06 12:58:37',1,'categories.php','','217.122.104.136',0,'',''),(415,'2013-09-06 12:58:38',1,'categories.php','cPath=1&','217.122.104.136',0,'',''),(416,'2013-09-06 12:58:40',1,'product.php','page=1&product_type=1&cPath=1&pID=1&action=new_product&','217.122.104.136',0,'',''),(417,'2013-09-06 12:58:53',1,'product.php','cPath=1&product_type=1&pID=1&action=new_product_preview&page=1&','217.122.104.136',0,'','ÖS—RÉ@¸ïœÍ\\)Ì/¯®Ô7f<8ÃÂ⁄2éˇÓmµÖv|‰≤…nv√W“≥≠|)NW ®°™∞J6I™ñ´{ı|Ø÷ãe∫yTï\'wINêuêçeBß)Çó°Ù7Ü\\i}\'ZÜCQ›,Íöm;EÙL%jg9Ö⁄S˙∞Œ≤ı9¬	àw3⁄Q˝»@a\"Ô(∑Û5î‚˘(ıº•É6\0øí4ºø\n∞,^H`qﬂø@M.(≈….ÒµcÆÍØt1ha*ºÃLÿÎ“Ä;JJgÌ◊˜>8”∞u„ÚÍbÊñX<òπF0;h˜N}O]3Ù)É.Ï˛Ü≥ü:°\0±\\Ö[Í˛C¿~∆pâ…mûñˆ8?+t%S/dªSfoËdÒq-≤øa£SÁsZ[°ôBœ∏%ÎC-4«€°∂	◊ ßè$¸M”nëwL„˜Ö–6ûLy<õìˆköwHÕªL≠ãø¬¡∂#ì√“‚·Õ~`åÍ¥∆ºxÇ\"O1Ø◊´äUñ©G¨äZÂYhâyd±7˙ë%ﬂ?'),(418,'2013-09-06 12:58:54',1,'product.php','cPath=1&product_type=1&pID=1&action=update_product&page=1&','217.122.104.136',0,'','ÖR—r£0¸ïœ◊é!4¥˘Ö>^ﬂ=¬TSÉ©-\'a:˝˜≥I“&êÃΩav•›ïÙï\rŒÍ†ÿK\rå¥Fùm≥B‰ÎÒÚ 6´ºÿ>â≠®≤?Yû—Iô≠uÑ^R\"Á˙mC^Ÿ–≥‰q¿äª†lúÌÊå¡ëBÈ≠ãB{.7eππdx~!;πﬂ®M“ùÏˆ°≈¡°;Y˝-ë‰£úYLs”ññı(ÅŸQxëç· ïR*Â∑„∑Œ˙)ì∏Íπ#«Ã“#ò=å«\0“ø”0PﬂŒ\r}Ú(k{∏3∞œ\0=S§Xß„N;Íˇ«Ä√B·öz‚˚:PﬂCßËó@g5ö´Ö•Q·élàÓ†=Ìò∫6^ï;?‚Òg=vánÔhz_)πÈD`Æ≥Gjﬂy6›‰1ËºU]lˇWæÕ˛28^ΩGBû˙~_)zÂh`≤˝ôˇÜûW∑È¡ô3Ì|1è*ƒê„õ˝¿¥Ghä´˙Í™¿™Ÿ¨k®◊e)ûP◊ç® XíñYæƒèiˆyˆ˝'),(419,'2013-09-06 12:58:55',1,'categories.php','cPath=1&pID=1&page=1&','217.122.104.136',0,'',''),(420,'2013-09-06 12:59:07',1,'product.php','page=1&product_type=1&cPath=1&pID=1&action=new_product&','217.122.104.136',0,'',''),(421,'2013-09-06 12:59:30',1,'product.php','cPath=1&product_type=1&pID=1&action=new_product_preview&page=1&','217.122.104.136',0,'','ÖS¡r£0˝ïÁv\rm~°«Ì›#∞†ö\ZLe9	”ÈøØMí&ÅtˆhÈIzzO˛J∂⁄◊‚îAZ£N∂IûfÎ«ÙÂ1›¨≤|˚în”2yH:pÇ¨ÍÄl-:EúÖ‘•\rπ⁄˙^îåÜd˙kR5lª9b`™Q9ÀaP»=Á6E±πF8Òn1vbø2Pô8w¢€˚jÒå|¢z]“CÄ_I‚XVØ$êE‹˜PëLq∂Kå÷`Ã]˛ZU£¶ ÀBÅÉ™\r∏•|Q~Ô£2-[7-üﬁÙ‹ã≥‰f„qÂﬁi®oÁÑ>eTï=\\îΩÕzËÖƒ≤Êw‘œµü#‡üæ\'qøvÈËÄÀ≥BW3\rB∂?{ˆÜNV˜,ª4õî∫Ó”Yçfv„é¨~t–ûná∫6\\+ü!(¸q”Óê˜L”˚ÜËOÊs<õ3˜{ú˜HÌªÃ•ã_·(€ií√⁄á¡„õ˝¿h4yÉeıUôcŸl÷TÎ¢HüPWMZ°$˙±éw6Èë%ﬂˇ\0'),(422,'2013-09-06 12:59:32',1,'product.php','cPath=1&product_type=1&pID=1&action=update_product&page=1&','217.122.104.136',0,'','ÖR¡rÍ0¸&Á◊NÅ¯Ö€ªG∂ïTS\'Nm»t˙Ôµ0Ω≈Ÿï¥´’W÷;´Éb/40\n–\Zu∂…ä|æx ˇ?Â´Ÿºÿ,ÛM^eˇ≤<£*2ÎΩ†DûGË‹Üº≤°c¡CèÃÇ¢v∂ù2zG\nÖ∑.äÿ∫x^ïÂÍí·8¯õ±£˙-êi“‹QnjP∫£‘sâ ‡Db˙´¿òª≤¥êÉ\0fG2ç7ÜΩP¸qRqS~ﬂŒ¡p„¨=ÂW=∑‰8Äπ’f√¡ÄÔ‘˜‘5SAü<i˜ÁÖ]£:¶H±N«L[Í¶+ù2`ˇGè–˚á]Z⁄£~Ñé÷/Å÷j4WÅ•U·ñlàn°9fLmØ ùÒøàÖ¯è›¢€9\ZﬂWì‹t\"0ù≥Cjﬁyj6›‰¡Ë¥Umlˇ#ﬂdØég/ƒë0O}ø/èΩr‘3ŸÓƒCœ≥è˚Ù‡ÃâvæÿÇG¢…·Õ~` Í¢∆JÆAVVıj!A. 2_¢ñu^ï±$Öπ\\ƒè¥˚uˆ˝'),(423,'2013-09-06 12:59:32',1,'categories.php','cPath=1&pID=1&page=1&','217.122.104.136',0,'',''),(424,'2013-09-06 13:00:50',1,'layout_controller.php','','217.122.104.136',0,'',''),(425,'2013-09-06 13:01:02',1,'banner_manager.php','','217.122.104.136',0,'',''),(426,'2013-09-06 13:01:09',1,'banner_manager.php','page=1&bID=6&','217.122.104.136',0,'',''),(427,'2013-09-06 13:01:20',1,'banner_manager.php','page=1&bID=6&action=new&','217.122.104.136',0,'',''),(428,'2013-09-06 13:01:29',1,'banner_manager.php','page=1&bID=6&action=setflag&flag=0&','217.122.104.136',0,'',''),(429,'2013-09-06 13:01:29',1,'banner_manager.php','page=1&bID=6&','217.122.104.136',0,'',''),(430,'2013-09-06 13:02:28',1,'banner_manager.php','','217.122.104.136',0,'',''),(431,'2013-09-06 13:02:31',1,'layout_controller.php','','217.122.104.136',0,'',''),(432,'2013-09-06 13:03:14',1,'configuration.php','gID=5&','217.122.104.136',0,'',''),(433,'2013-09-06 13:03:18',1,'configuration.php','gID=5&cID=130&action=edit&','217.122.104.136',0,'',''),(434,'2013-09-06 13:03:37',1,'configuration.php','gID=5&cID=134&action=edit&','217.122.104.136',0,'',''),(435,'2013-09-06 13:03:47',1,'configuration.php','gID=5&cID=134&action=save&','217.122.104.136',0,'','´VJŒœKÀL/-J,…Ãœã/KÃ)MU≤R245P“Q*.M Õ,	ˆèwruqçwtvˆıâwqusı	âÛÇ\"„+ÄzL-H“R	≤∆§%5π¥(≥§2$?;5(òòfîñjûdëòdnîjûffúîòdlbb`ööíîf`n¢T\0'),(436,'2013-09-06 13:03:47',1,'configuration.php','gID=5&cID=134&','217.122.104.136',0,'',''),(437,'2013-09-06 13:03:49',1,'configuration.php','gID=5&cID=135&action=edit&','217.122.104.136',0,'',''),(438,'2013-09-06 13:03:51',1,'configuration.php','gID=5&cID=135&action=save&','217.122.104.136',0,'','´VJŒœKÀL/-J,…Ãœã/KÃ)MU≤RJKÃ)NU“Q*.M Õ,qtvˆıâwsåà˜ıur\räØ\0*21¿ß¢®¬§ 5π¥(≥§2$?;5(ñòfîñjûdëòdnîjûffúîòdlbb`ööíîf`n¢T\0'),(439,'2013-09-06 13:03:52',1,'configuration.php','gID=5&cID=135&','217.122.104.136',0,'',''),(440,'2013-09-06 13:03:56',1,'configuration.php','gID=5&cID=136&action=edit&','217.122.104.136',0,'',''),(441,'2013-09-06 13:04:03',1,'configuration.php','gID=5&cID=136&action=save&','217.122.104.136',0,'','ç ¡\n¬ \0‡w˘œÜZV∑1º≈Ç¸GG—ı≤RX\ZçË›≥7Ë˙ÒΩaL—ákôm)ößΩÇ=0X¡£∏{»m◊áMØŒ˙†’…hlq–ÊUƒ•∆›Ô—XÊêL≈j÷3O“m≠ìå§ﬂpg¢Y”≈˘F\n¯|'),(442,'2013-09-06 13:04:03',1,'configuration.php','gID=5&cID=136&','217.122.104.136',0,'',''),(443,'2013-09-06 13:04:06',1,'configuration.php','gID=5&cID=137&action=edit&','217.122.104.136',0,'',''),(444,'2013-09-06 13:04:17',1,'configuration.php','gID=5&cID=137&action=save&','217.122.104.136',0,'','´VJŒœKÀL/-J,…Ãœã/KÃ)MU≤R2T“Q*.M Õ,qtvˆıâwıuÙÙârus\rrısvçØ\0*31\"¨ÆdúH]jriQfIeH~vjP01Õ(-’<…\"1…‹(’<ÕÃ8)1…ÿƒƒ¿45%)Õ¿‹D©\0'),(445,'2013-09-06 13:04:17',1,'configuration.php','gID=5&cID=137&','217.122.104.136',0,'',''),(446,'2013-09-06 13:04:22',1,'configuration.php','gID=5&cID=138&action=edit&','217.122.104.136',0,'',''),(447,'2013-09-06 13:04:36',1,'configuration.php','gID=5&cID=138&action=save&','217.122.104.136',0,'','ïÀ¡\n¬ \0‡wÒ‹aLõ—mXÅáfÃﬂ≥Ë“êJai4¢wœ°ÎﬂM)˙p)≥…!E˝4∑‚–5hÖ≈ﬁCfJÇ8ÓG©O£ÿ)R¯Å≥∏¥Ñî‘Øöp˜ÔZÍ¢ø‰¶2áº@∫∫XÕ¯÷;j7∆“÷Qﬂak,&§Yª≥ı\r%ËÛ'),(448,'2013-09-06 13:04:37',1,'configuration.php','gID=5&cID=138&','217.122.104.136',0,'',''),(449,'2013-09-06 13:04:40',1,'configuration.php','gID=5&cID=139&action=edit&','217.122.104.136',0,'',''),(450,'2013-09-06 13:04:45',1,'configuration.php','gID=5&cID=140&action=edit&','217.122.104.136',0,'',''),(451,'2013-09-06 13:04:52',1,'configuration.php','gID=5&cID=142&action=edit&','217.122.104.136',0,'',''),(452,'2013-09-06 13:05:05',1,'configuration.php','gID=5&cID=130&action=edit&','217.122.104.136',0,'',''),(453,'2013-09-06 13:05:10',1,'configuration.php','gID=5&cID=130&action=save&','217.122.104.136',0,'','´VJŒœKÀL/-J,…Ãœã/KÃ)MU≤RJKÃ)NU“Q*.M Õ,qtvˆıâwˆ˜\rpÙãåØ\0™01¬)]	î∂\0…¶&óeñTÜ‰gßÊ≈”å“RÕì,ìÃçRÕ”ÃåììåMLLSSí“ÃMîj'),(454,'2013-09-06 13:05:11',1,'configuration.php','gID=5&cID=130&','217.122.104.136',0,'',''),(455,'2013-09-06 13:06:22',1,'configuration.php','gID=5&cID=130&action=edit&','217.122.104.136',0,'',''),(456,'2013-09-06 13:06:27',1,'configuration.php','gID=5&cID=130&action=save&','217.122.104.136',0,'','´VJŒœKÀL/-J,…Ãœã/KÃ)MU≤R*)R:J≈•Iπô%éŒŒ˛°~!ÒŒ˛æé~ëÒ@∆8•+Å“Ü& È‘‰“¢Ãí ê¸Ï‘<†`böQZ™yíEbíπQ™yöôqRbí±ââÅijJRöÅπâR-\0'),(457,'2013-09-06 13:06:27',1,'configuration.php','gID=5&cID=130&','217.122.104.136',0,'',''),(458,'2013-09-06 13:06:32',1,'configuration.php','gID=2&','217.122.104.136',0,'',''),(459,'2013-09-06 13:06:34',1,'configuration.php','gID=2&cID=37&action=edit&','217.122.104.136',0,'',''),(460,'2013-09-06 13:06:38',1,'configuration.php','gID=2&cID=37&action=save&','217.122.104.136',0,'','´VJŒœKÀL/-J,…Ãœã/KÃ)MU≤R2P“Q*.M Õ,qı	äåwˆ˜\rpÙãå˜ıÙã˜qısÒàØ\0*3!B]%Pù°!H]jriQfIeH~vjP01Õ(-’<…\"1…‹(’<ÕÃ8)1…ÿƒƒ¿45%)Õ¿‹D©\0'),(461,'2013-09-06 13:06:38',1,'configuration.php','gID=2&cID=37&','217.122.104.136',0,'',''),(462,'2013-09-06 13:06:52',1,'configuration.php','gID=2&cID=38&action=edit&','217.122.104.136',0,'',''),(463,'2013-09-06 13:07:13',1,'configuration.php','gID=2&cID=42&action=edit&','217.122.104.136',0,'',''),(464,'2013-09-06 13:07:17',1,'configuration.php','gID=2&cID=41&action=edit&','217.122.104.136',0,'',''),(465,'2013-09-06 13:07:23',1,'configuration.php','gID=2&cID=41&action=save&','217.122.104.136',0,'','ç ¡\n¬ \0‡w˘œlsY›•À\"ºtˇı;§•∞4\Z—ª\'=A◊èÔ\r}Œy≤…«`ûvÃ[X2X¿#„›\'©Ù˘b¥Ï‰©=*i{e:©v∫5Ø2˘Êü9ó˘ã‘Á…ßY«Öb÷UéÆ-ääÑ[’h±Êú5tE«áœ'),(466,'2013-09-06 13:07:23',1,'configuration.php','gID=2&cID=41&','217.122.104.136',0,'',''),(467,'2013-09-06 13:07:44',1,'configuration.php','gID=3&','217.122.104.136',0,'',''),(468,'2013-09-06 13:09:09',1,'alt_nav.php','','217.122.104.136',0,'',''),(469,'2013-09-06 13:09:12',1,'coupon_admin.php','','217.122.104.136',0,'',''),(470,'2013-09-06 13:09:22',1,'newsletters.php','','217.122.104.136',0,'',''),(471,'2013-09-06 13:09:29',1,'whos_online.php','','217.122.104.136',0,'',''),(472,'2013-09-06 13:09:44',1,'modules.php','set=ordertotal&','217.122.104.136',0,'',''),(473,'2013-09-06 13:10:03',1,'modules.php','set=ordertotal&module=ot_loworderfee&','217.122.104.136',0,'',''),(474,'2013-09-06 13:10:07',1,'modules.php','set=ordertotal&module=ot_loworderfee&action=remove&','217.122.104.136',0,'',''),(475,'2013-09-06 13:10:10',1,'modules.php','action=removeconfirm&','217.122.104.136',0,'','] A¬ F·ªÃ⁄E*∆•gpﬂ@˘\'1“NBájcº{—•€ÔΩ7-P∫êîÑ¢¢!”Å&I5„´:dy˛\Z≠L≤‚ZUe^Ì∞Ê_∑¶«æÈÇ±ñªn7y`nÿ0|<áË\r<ül—:◊ıHë;ÔË≥'),(476,'2013-09-06 13:10:10',1,'modules.php','set=ordertotal&module=ot_loworderfee&','217.122.104.136',0,'',''),(477,'2013-09-06 13:10:52',1,'modules.php','set=shipping&','217.122.104.136',0,'',''),(478,'2013-09-06 13:10:58',1,'modules.php','set=shipping&module=zones&','217.122.104.136',0,'',''),(479,'2013-09-06 13:11:03',1,'modules.php','set=shipping&module=zones&action=edit&','217.122.104.136',0,'',''),(480,'2013-09-06 13:15:09',1,'modules.php','set=shipping&module=zones&action=save&','217.122.104.136',0,'','ï”OkÉ0Ä·Ôí≥ç2ºi\rSfçòcó†6va†≈ÈX)˝Óã\n;ƒ÷õ˘ÒﬂºÄ¶ÔZyúÜjî}¸ÿì®L1ßqíÁIˆ¬ﬂIÜ)ß,`%>`√$Ä°Q{Ãb)ï≤—3ºÒ]\Z–y?∏™¬Ä&≥¢Útí›Qã))\'EÑ•-={UK<j…éî+ıd)ñ•FàçØp iô¶Ô>yBOã„ ã“y9ø`ﬁg˜πh2ƒ@4\\?õä]∑O√MÖpC°}∑–~®–ﬁThﬂ\nØ¯™æE8çcﬂÒ5w¯7;´Ÿ2Õ4»ÒÃ˙O°˛\rPµ∞®~Æjj=ªÆj€qLWÍ÷D∏˛'),(481,'2013-09-06 13:15:10',1,'modules.php','set=shipping&module=zones&','217.122.104.136',0,'',''),(482,'2013-09-06 13:15:38',1,'configuration.php','gID=7&','217.122.104.136',0,'',''),(483,'2013-09-06 13:15:43',1,'configuration.php','gID=7&cID=202&action=edit&','217.122.104.136',0,'',''),(484,'2013-09-06 13:15:49',1,'configuration.php','gID=7&cID=202&action=save&','217.122.104.136',0,'','´VJŒœKÀL/-J,…Ãœã/KÃ)MU≤R245P“Q*.M Õ,	ˆÙsè˜Út˜Ùãwˆı	äåØ\0™3± ®¨dú1HYjriQfIeH~vjP01Õ(-’<…\"1…‹(’<ÕÃ8)1…ÿƒƒ¿45%)Õ¿‹D©\0'),(485,'2013-09-06 13:15:50',1,'configuration.php','gID=7&cID=202&','217.122.104.136',0,'',''),(486,'2013-09-06 13:15:53',1,'configuration.php','gID=7&cID=203&action=edit&','217.122.104.136',0,'',''),(487,'2013-09-06 13:16:22',1,'configuration.php','gID=7&cID=203&action=save&','217.122.104.136',0,'','} 1¬ \0–ª¸Ÿ)„ÊT¨Dù\\ø~\Z¢BR¡ÿÔ.^¿ıÂΩaH—á±L.áÌ”›\n¡\Z¯R≤Õ(x˘∏’∆Ëæ≥˚ÉÓtoœ⁄ÿWm≠¯[ÊZ‰o–P¶êÁS∫R¨Ê<˜§pÂPqRæm–a#ìtAœîÄœ'),(488,'2013-09-06 13:16:23',1,'configuration.php','gID=7&cID=203&','217.122.104.136',0,'',''),(489,'2013-09-06 13:16:33',1,'configuration.php','gID=7&cID=204&action=edit&','217.122.104.136',0,'',''),(490,'2013-09-06 13:17:27',1,'configuration.php','gID=7&cID=209&action=edit&','217.122.104.136',0,'',''),(491,'2013-09-06 13:17:36',1,'configuration.php','gID=7&cID=209&action=save&','217.122.104.136',0,'','´VJŒœKÀL/-J,…Ãœã/KÃ)MU≤R2P“Q*.M Õ,Òrq\räwˆ˜ıuı	é˜ÙÛ˜tvçØ\0*2%®™® –§*5π¥(≥§2$?;5(òòfîñjûdëòdnîjûffúîòdlbb`ööíîf`n¢T\0'),(492,'2013-09-06 13:17:36',1,'configuration.php','gID=7&cID=209&','217.122.104.136',0,'',''),(493,'2013-09-06 13:17:41',1,'configuration.php','gID=7&cID=210&action=edit&','217.122.104.136',0,'',''),(494,'2013-09-06 13:17:45',1,'configuration.php','gID=7&cID=210&action=save&','217.122.104.136',0,'','´VJŒœKÀL/-J,…Ãœã/KÃ)MU≤R2P“Q*.M Õ,Òrq\räwˆ˜ıuı	éptˆˆÙsèˆÒàØ\0™41#Ji%P©9HejriQfIeH~vjP,1Õ(-’<…\"1…‹(’<ÕÃ8)1…ÿƒƒ¿45%)Õ¿‹D©\0'),(495,'2013-09-06 13:17:45',1,'configuration.php','gID=7&cID=210&','217.122.104.136',0,'',''),(496,'2013-09-06 13:18:19',1,'modules.php','set=shipping&','217.122.104.136',0,'',''),(497,'2013-09-06 13:18:21',1,'modules.php','set=shipping&module=zones&','217.122.104.136',0,'',''),(498,'2013-09-06 13:18:30',1,'countries.php','','217.122.104.136',0,'',''),(499,'2013-09-06 13:18:33',1,'geo_zones.php','','217.122.104.136',0,'',''),(500,'2013-09-06 13:18:38',1,'tax_classes.php','','217.122.104.136',0,'',''),(501,'2013-09-06 13:18:42',1,'tax_rates.php','','217.122.104.136',0,'',''),(502,'2013-09-06 13:18:53',1,'configuration.php','gID=1&','217.122.104.136',0,'',''),(503,'2013-09-06 13:18:59',1,'configuration.php','gID=1&cID=15&action=edit&','217.122.104.136',0,'',''),(504,'2013-09-06 13:19:04',1,'configuration.php','gID=1&cID=15&action=save&','217.122.104.136',0,'','´VJŒœKÀL/-J,…Ãœã/KÃ)MU≤R*)R:J≈•Iπô%.û¡>éëÒAûŒÆÒ·û!Ò!éÒ@uF&ÑTUUYÄ•&óeñTÜ‰gßÊ≈”å“RÕì,ìÃçRÕ”ÃåììåMLLSSí“ÃMîj'),(505,'2013-09-06 13:19:05',1,'configuration.php','gID=1&cID=15&','217.122.104.136',0,'',''),(506,'2013-09-06 13:19:08',1,'configuration.php','gID=1&cID=16&action=edit&','217.122.104.136',0,'',''),(507,'2013-09-06 13:19:12',1,'configuration.php','gID=1&cID=16&action=save&','217.122.104.136',0,'','´VJŒœKÀL/-J,…Ãœã/KÃ)MU≤R*)R:J≈•Iπô%.û¡>éëÒAûŒÆÒ·û!Ò!éÒé.æû~Ò@’&ƒ©≠™54©MM.- ,©…œNÕ\n&¶••ö\'Y$&ô•ößô\'%&õòò¶¶$•òõ(’\0'),(508,'2013-09-06 13:19:12',1,'configuration.php','gID=1&cID=16&','217.122.104.136',0,'',''),(509,'2013-09-06 13:19:51',1,'configuration.php','gID=1&cID=4&action=edit&','217.122.104.136',0,'',''),(510,'2013-09-06 13:19:56',1,'configuration.php','gID=1&cID=4&','217.122.104.136',0,'',''),(511,'2013-09-06 14:15:51',0,'login.php ','camefrom=layout_controller.php&','217.122.104.136',0,'',''),(512,'2013-09-06 19:01:35',0,'login.php ','camefrom=layout_controller.php&','217.122.104.136',0,'',''),(513,'2013-09-07 10:34:48',0,'login.php ','camefrom=layout_controller.php&','217.122.104.136',0,'',''),(514,'2013-09-07 11:40:24',0,'login.php ','camefrom=layout_controller.php&','217.122.104.136',0,'','');
/*!40000 ALTER TABLE `zc_admin_activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_admin_menus`
--

DROP TABLE IF EXISTS `zc_admin_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_admin_menus` (
  `menu_key` varchar(32) NOT NULL DEFAULT '',
  `language_key` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `menu_key` (`menu_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_admin_menus`
--

LOCK TABLES `zc_admin_menus` WRITE;
/*!40000 ALTER TABLE `zc_admin_menus` DISABLE KEYS */;
INSERT INTO `zc_admin_menus` VALUES ('configuration','BOX_HEADING_CONFIGURATION',1),('catalog','BOX_HEADING_CATALOG',2),('modules','BOX_HEADING_MODULES',3),('customers','BOX_HEADING_CUSTOMERS',4),('taxes','BOX_HEADING_LOCATION_AND_TAXES',5),('localization','BOX_HEADING_LOCALIZATION',6),('reports','BOX_HEADING_REPORTS',7),('tools','BOX_HEADING_TOOLS',8),('gv','BOX_HEADING_GV_ADMIN',9),('access','BOX_HEADING_ADMIN_ACCESS',10),('extras','BOX_HEADING_EXTRAS',11);
/*!40000 ALTER TABLE `zc_admin_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_admin_pages`
--

DROP TABLE IF EXISTS `zc_admin_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_admin_pages` (
  `page_key` varchar(32) NOT NULL DEFAULT '',
  `language_key` varchar(255) NOT NULL DEFAULT '',
  `main_page` varchar(64) NOT NULL DEFAULT '',
  `page_params` varchar(64) NOT NULL DEFAULT '',
  `menu_key` varchar(32) NOT NULL DEFAULT '',
  `display_on_menu` char(1) NOT NULL DEFAULT 'N',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `page_key` (`page_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_admin_pages`
--

LOCK TABLES `zc_admin_pages` WRITE;
/*!40000 ALTER TABLE `zc_admin_pages` DISABLE KEYS */;
INSERT INTO `zc_admin_pages` VALUES ('configMyStore','BOX_CONFIGURATION_MY_STORE','FILENAME_CONFIGURATION','gID=1','configuration','Y',1),('configMinimumValues','BOX_CONFIGURATION_MINIMUM_VALUES','FILENAME_CONFIGURATION','gID=2','configuration','Y',2),('configMaximumValues','BOX_CONFIGURATION_MAXIMUM_VALUES','FILENAME_CONFIGURATION','gID=3','configuration','Y',3),('configImages','BOX_CONFIGURATION_IMAGES','FILENAME_CONFIGURATION','gID=4','configuration','Y',4),('configCustomerDetails','BOX_CONFIGURATION_CUSTOMER_DETAILS','FILENAME_CONFIGURATION','gID=5','configuration','Y',5),('configShipping','BOX_CONFIGURATION_SHIPPING_PACKAGING','FILENAME_CONFIGURATION','gID=7','configuration','Y',6),('configProductListing','BOX_CONFIGURATION_PRODUCT_LISTING','FILENAME_CONFIGURATION','gID=8','configuration','Y',7),('configStock','BOX_CONFIGURATION_STOCK','FILENAME_CONFIGURATION','gID=9','configuration','Y',8),('configLogging','BOX_CONFIGURATION_LOGGING','FILENAME_CONFIGURATION','gID=10','configuration','Y',9),('configEmail','BOX_CONFIGURATION_EMAIL_OPTIONS','FILENAME_CONFIGURATION','gID=12','configuration','Y',10),('configAttributes','BOX_CONFIGURATION_ATTRIBUTE_OPTIONS','FILENAME_CONFIGURATION','gID=13','configuration','Y',11),('configGzipCompression','BOX_CONFIGURATION_GZIP_COMPRESSION','FILENAME_CONFIGURATION','gID=14','configuration','Y',12),('configSessions','BOX_CONFIGURATION_SESSIONS','FILENAME_CONFIGURATION','gID=15','configuration','Y',13),('configRegulations','BOX_CONFIGURATION_REGULATIONS','FILENAME_CONFIGURATION','gID=11','configuration','Y',14),('configGvCoupons','BOX_CONFIGURATION_GV_COUPONS','FILENAME_CONFIGURATION','gID=16','configuration','Y',15),('configCreditCards','BOX_CONFIGURATION_CREDIT_CARDS','FILENAME_CONFIGURATION','gID=17','configuration','Y',16),('configProductInfo','BOX_CONFIGURATION_PRODUCT_INFO','FILENAME_CONFIGURATION','gID=18','configuration','Y',17),('configLayoutSettings','BOX_CONFIGURATION_LAYOUT_SETTINGS','FILENAME_CONFIGURATION','gID=19','configuration','Y',18),('configWebsiteMaintenance','BOX_CONFIGURATION_WEBSITE_MAINTENANCE','FILENAME_CONFIGURATION','gID=20','configuration','Y',19),('configNewListing','BOX_CONFIGURATION_NEW_LISTING','FILENAME_CONFIGURATION','gID=21','configuration','Y',20),('configFeaturedListing','BOX_CONFIGURATION_FEATURED_LISTING','FILENAME_CONFIGURATION','gID=22','configuration','Y',21),('configAllListing','BOX_CONFIGURATION_ALL_LISTING','FILENAME_CONFIGURATION','gID=23','configuration','Y',22),('configIndexListing','BOX_CONFIGURATION_INDEX_LISTING','FILENAME_CONFIGURATION','gID=24','configuration','Y',23),('configDefinePageStatus','BOX_CONFIGURATION_DEFINE_PAGE_STATUS','FILENAME_CONFIGURATION','gID=25','configuration','Y',24),('configEzPagesSettings','BOX_CONFIGURATION_EZPAGES_SETTINGS','FILENAME_CONFIGURATION','gID=30','configuration','Y',25),('categories','BOX_CATALOG_CATEGORIES_PRODUCTS','FILENAME_CATEGORIES','','catalog','Y',1),('productTypes','BOX_CATALOG_PRODUCT_TYPES','FILENAME_PRODUCT_TYPES','','catalog','Y',2),('priceManager','BOX_CATALOG_PRODUCTS_PRICE_MANAGER','FILENAME_PRODUCTS_PRICE_MANAGER','','catalog','Y',3),('optionNames','BOX_CATALOG_CATEGORIES_OPTIONS_NAME_MANAGER','FILENAME_OPTIONS_NAME_MANAGER','','catalog','Y',4),('optionValues','BOX_CATALOG_CATEGORIES_OPTIONS_VALUES_MANAGER','FILENAME_OPTIONS_VALUES_MANAGER','','catalog','Y',5),('attributes','BOX_CATALOG_CATEGORIES_ATTRIBUTES_CONTROLLER','FILENAME_ATTRIBUTES_CONTROLLER','','catalog','Y',6),('downloads','BOX_CATALOG_CATEGORIES_ATTRIBUTES_DOWNLOADS_MANAGER','FILENAME_DOWNLOADS_MANAGER','','catalog','Y',7),('optionNameSorter','BOX_CATALOG_PRODUCT_OPTIONS_NAME','FILENAME_PRODUCTS_OPTIONS_NAME','','catalog','Y',8),('optionValueSorter','BOX_CATALOG_PRODUCT_OPTIONS_VALUES','FILENAME_PRODUCTS_OPTIONS_VALUES','','catalog','Y',9),('manufacturers','BOX_CATALOG_MANUFACTURERS','FILENAME_MANUFACTURERS','','catalog','Y',10),('reviews','BOX_CATALOG_REVIEWS','FILENAME_REVIEWS','','catalog','Y',11),('specials','BOX_CATALOG_SPECIALS','FILENAME_SPECIALS','','catalog','Y',12),('featured','BOX_CATALOG_FEATURED','FILENAME_FEATURED','','catalog','Y',13),('salemaker','BOX_CATALOG_SALEMAKER','FILENAME_SALEMAKER','','catalog','Y',14),('productsExpected','BOX_CATALOG_PRODUCTS_EXPECTED','FILENAME_PRODUCTS_EXPECTED','','catalog','Y',15),('product','BOX_CATALOG_PRODUCT','FILENAME_PRODUCT','','catalog','N',16),('productsToCategories','BOX_CATALOG_PRODUCTS_TO_CATEGORIES','FILENAME_PRODUCTS_TO_CATEGORIES','','catalog','N',17),('payment','BOX_MODULES_PAYMENT','FILENAME_MODULES','set=payment','modules','Y',1),('shipping','BOX_MODULES_SHIPPING','FILENAME_MODULES','set=shipping','modules','Y',2),('orderTotal','BOX_MODULES_ORDER_TOTAL','FILENAME_MODULES','set=ordertotal','modules','Y',3),('customers','BOX_CUSTOMERS_CUSTOMERS','FILENAME_CUSTOMERS','','customers','Y',1),('orders','BOX_CUSTOMERS_ORDERS','FILENAME_ORDERS','','customers','Y',2),('groupPricing','BOX_CUSTOMERS_GROUP_PRICING','FILENAME_GROUP_PRICING','','customers','Y',3),('paypal','BOX_CUSTOMERS_PAYPAL','FILENAME_PAYPAL','','customers','Y',4),('invoice','BOX_CUSTOMERS_INVOICE','FILENAME_ORDERS_INVOICE','','customers','N',5),('packingslip','BOX_CUSTOMERS_PACKING_SLIP','FILENAME_ORDERS_PACKINGSLIP','','customers','N',6),('linkpointReview','BOX_CUSTOMERS_LINKPOINT_REVIEW','FILENAME_LINKPOINT_REVIEW','','customers','Y',7),('countries','BOX_TAXES_COUNTRIES','FILENAME_COUNTRIES','','taxes','Y',1),('zones','BOX_TAXES_ZONES','FILENAME_ZONES','','taxes','Y',2),('geoZones','BOX_TAXES_GEO_ZONES','FILENAME_GEO_ZONES','','taxes','Y',3),('taxClasses','BOX_TAXES_TAX_CLASSES','FILENAME_TAX_CLASSES','','taxes','Y',4),('taxRates','BOX_TAXES_TAX_RATES','FILENAME_TAX_RATES','','taxes','Y',5),('currencies','BOX_LOCALIZATION_CURRENCIES','FILENAME_CURRENCIES','','localization','Y',1),('languages','BOX_LOCALIZATION_LANGUAGES','FILENAME_LANGUAGES','','localization','Y',2),('ordersStatus','BOX_LOCALIZATION_ORDERS_STATUS','FILENAME_ORDERS_STATUS','','localization','Y',3),('reportCustomers','BOX_REPORTS_ORDERS_TOTAL','FILENAME_STATS_CUSTOMERS','','reports','Y',1),('reportReferrals','BOX_REPORTS_CUSTOMERS_REFERRALS','FILENAME_STATS_CUSTOMERS_REFERRALS','','reports','Y',2),('reportLowStock','BOX_REPORTS_PRODUCTS_LOWSTOCK','FILENAME_STATS_PRODUCTS_LOWSTOCK','','reports','Y',3),('reportProductsSold','BOX_REPORTS_PRODUCTS_PURCHASED','FILENAME_STATS_PRODUCTS_PURCHASED','','reports','Y',4),('reportProductsViewed','BOX_REPORTS_PRODUCTS_VIEWED','FILENAME_STATS_PRODUCTS_VIEWED','','reports','Y',5),('templateSelect','BOX_TOOLS_TEMPLATE_SELECT','FILENAME_TEMPLATE_SELECT','','tools','Y',1),('layoutController','BOX_TOOLS_LAYOUT_CONTROLLER','FILENAME_LAYOUT_CONTROLLER','','tools','Y',2),('banners','BOX_TOOLS_BANNER_MANAGER','FILENAME_BANNER_MANAGER','','tools','Y',3),('mail','BOX_TOOLS_MAIL','FILENAME_MAIL','','tools','Y',4),('newsletters','BOX_TOOLS_NEWSLETTER_MANAGER','FILENAME_NEWSLETTERS','','tools','Y',5),('server','BOX_TOOLS_SERVER_INFO','FILENAME_SERVER_INFO','','tools','Y',6),('whosOnline','BOX_TOOLS_WHOS_ONLINE','FILENAME_WHOS_ONLINE','','tools','Y',7),('storeManager','BOX_TOOLS_STORE_MANAGER','FILENAME_STORE_MANAGER','','tools','Y',9),('developersToolKit','BOX_TOOLS_DEVELOPERS_TOOL_KIT','FILENAME_DEVELOPERS_TOOL_KIT','','tools','Y',10),('ezpages','BOX_TOOLS_EZPAGES','FILENAME_EZPAGES_ADMIN','','tools','Y',11),('definePagesEditor','BOX_TOOLS_DEFINE_PAGES_EDITOR','FILENAME_DEFINE_PAGES_EDITOR','','tools','Y',12),('sqlPatch','BOX_TOOLS_SQLPATCH','FILENAME_SQLPATCH','','tools','Y',13),('couponAdmin','BOX_COUPON_ADMIN','FILENAME_COUPON_ADMIN','','gv','Y',1),('couponRestrict','BOX_COUPON_RESTRICT','FILENAME_COUPON_RESTRICT','','gv','N',1),('gvQueue','BOX_GV_ADMIN_QUEUE','FILENAME_GV_QUEUE','','gv','Y',2),('gvMail','BOX_GV_ADMIN_MAIL','FILENAME_GV_MAIL','','gv','Y',3),('gvSent','BOX_GV_ADMIN_SENT','FILENAME_GV_SENT','','gv','Y',4),('profiles','BOX_ADMIN_ACCESS_PROFILES','FILENAME_PROFILES','','access','Y',1),('users','BOX_ADMIN_ACCESS_USERS','FILENAME_USERS','','access','Y',2),('pageRegistration','BOX_ADMIN_ACCESS_PAGE_REGISTRATION','FILENAME_ADMIN_PAGE_REGISTRATION','','access','Y',3),('adminlogs','BOX_ADMIN_ACCESS_LOGS','FILENAME_ADMIN_ACTIVITY','','access','Y',4),('recordArtists','BOX_CATALOG_RECORD_ARTISTS','FILENAME_RECORD_ARTISTS','','extras','Y',1),('recordCompanies','BOX_CATALOG_RECORD_COMPANY','FILENAME_RECORD_COMPANY','','extras','Y',2),('musicGenre','BOX_CATALOG_MUSIC_GENRE','FILENAME_MUSIC_GENRE','','extras','Y',3),('mediaManager','BOX_CATALOG_MEDIA_MANAGER','FILENAME_MEDIA_MANAGER','','extras','Y',4),('mediaTypes','BOX_CATALOG_MEDIA_TYPES','FILENAME_MEDIA_TYPES','','extras','Y',5);
/*!40000 ALTER TABLE `zc_admin_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_admin_pages_to_profiles`
--

DROP TABLE IF EXISTS `zc_admin_pages_to_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_admin_pages_to_profiles` (
  `profile_id` int(11) NOT NULL DEFAULT '0',
  `page_key` varchar(32) NOT NULL DEFAULT '',
  UNIQUE KEY `profile_page` (`profile_id`,`page_key`),
  UNIQUE KEY `page_profile` (`page_key`,`profile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_admin_pages_to_profiles`
--

LOCK TABLES `zc_admin_pages_to_profiles` WRITE;
/*!40000 ALTER TABLE `zc_admin_pages_to_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_admin_pages_to_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_admin_profiles`
--

DROP TABLE IF EXISTS `zc_admin_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_admin_profiles` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`profile_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_admin_profiles`
--

LOCK TABLES `zc_admin_profiles` WRITE;
/*!40000 ALTER TABLE `zc_admin_profiles` DISABLE KEYS */;
INSERT INTO `zc_admin_profiles` VALUES (1,'Superuser');
/*!40000 ALTER TABLE `zc_admin_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_authorizenet`
--

DROP TABLE IF EXISTS `zc_authorizenet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_authorizenet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `response_code` int(1) NOT NULL DEFAULT '0',
  `response_text` varchar(255) NOT NULL DEFAULT '',
  `authorization_type` varchar(50) NOT NULL DEFAULT '',
  `transaction_id` bigint(20) DEFAULT NULL,
  `sent` longtext NOT NULL,
  `received` longtext NOT NULL,
  `time` varchar(50) NOT NULL DEFAULT '',
  `session_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_authorizenet`
--

LOCK TABLES `zc_authorizenet` WRITE;
/*!40000 ALTER TABLE `zc_authorizenet` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_authorizenet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_banners`
--

DROP TABLE IF EXISTS `zc_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_banners` (
  `banners_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_title` varchar(64) NOT NULL DEFAULT '',
  `banners_url` varchar(255) NOT NULL DEFAULT '',
  `banners_image` varchar(64) NOT NULL DEFAULT '',
  `banners_group` varchar(15) NOT NULL DEFAULT '',
  `banners_html_text` text,
  `expires_impressions` int(7) DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `date_scheduled` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `banners_open_new_windows` int(1) NOT NULL DEFAULT '1',
  `banners_on_ssl` int(1) NOT NULL DEFAULT '1',
  `banners_sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banners_id`),
  KEY `idx_status_group_zen` (`status`,`banners_group`),
  KEY `idx_expires_date_zen` (`expires_date`),
  KEY `idx_date_scheduled_zen` (`date_scheduled`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_banners`
--

LOCK TABLES `zc_banners` WRITE;
/*!40000 ALTER TABLE `zc_banners` DISABLE KEYS */;
INSERT INTO `zc_banners` VALUES (1,'Zen Cart','http://www.zen-cart.com','banners/zencart_468_60_02.gif','Wide-Banners','',0,NULL,NULL,'2004-01-11 20:59:12',NULL,1,1,1,0),(2,'Zen Cart the art of e-commerce','http://www.zen-cart.com','banners/125zen_logo.gif','SideBox-Banners','',0,NULL,NULL,'2004-01-11 20:59:12',NULL,1,1,1,0),(3,'Zen Cart the art of e-commerce','http://www.zen-cart.com','banners/125x125_zen_logo.gif','SideBox-Banners','',0,NULL,NULL,'2004-01-11 20:59:12',NULL,1,1,1,0),(4,'if you have to think ... you haven\'t been Zenned!','http://www.zen-cart.com','banners/think_anim.gif','Wide-Banners','',0,NULL,NULL,'2004-01-12 20:53:18',NULL,1,1,1,0),(5,'Zen Cart the art of e-commerce','http://www.zen-cart.com','banners/bw_zen_88wide.gif','BannersAll','',0,NULL,NULL,'2005-05-13 10:54:38',NULL,1,1,1,10),(6,'Start Accepting Credit Cards For Your Business Today!','http://www.zen-cart.com/partners/payment','banners/cardsvcs_468x60.gif','Wide-Banners','',0,NULL,NULL,'2006-03-13 11:02:43','2013-09-06 13:01:29',0,1,1,0),(7,'eStart Your Web Store with Zen Cart(tm)','http://www.lulu.com/content/466605','banners/big-book-ad.gif','Wide-Banners','',0,NULL,NULL,'2007-02-10 00:00:00',NULL,1,1,1,1),(8,'eStart Your Web Store with Zen Cart(tm)','http://www.lulu.com/content/466605','banners/tall-book.gif','SideBox-Banners','',0,NULL,NULL,'2007-02-10 00:00:00',NULL,1,1,1,1),(9,'eStart Your Web Store with Zen Cart(tm)','http://www.lulu.com/content/466605','banners/tall-book.gif','BannersAll','',0,NULL,NULL,'2007-02-10 00:00:00',NULL,1,1,1,15);
/*!40000 ALTER TABLE `zc_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_banners_history`
--

DROP TABLE IF EXISTS `zc_banners_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_banners_history` (
  `banners_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_id` int(11) NOT NULL DEFAULT '0',
  `banners_shown` int(5) NOT NULL DEFAULT '0',
  `banners_clicked` int(5) NOT NULL DEFAULT '0',
  `banners_history_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`banners_history_id`),
  KEY `idx_banners_id_zen` (`banners_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_banners_history`
--

LOCK TABLES `zc_banners_history` WRITE;
/*!40000 ALTER TABLE `zc_banners_history` DISABLE KEYS */;
INSERT INTO `zc_banners_history` VALUES (1,2,5,0,'2013-09-05 17:27:57'),(2,5,16,0,'2013-09-05 17:27:57'),(3,9,16,0,'2013-09-05 17:27:57'),(4,2,5,0,'2013-09-05 17:27:57'),(5,6,4,0,'2013-09-05 17:27:57'),(6,3,13,0,'2013-09-05 17:30:00'),(7,3,13,0,'2013-09-05 17:30:00'),(8,1,4,0,'2013-09-05 17:30:00'),(9,7,7,0,'2013-09-05 17:30:13'),(10,8,8,0,'2013-09-05 17:30:18'),(11,8,8,0,'2013-09-05 17:30:18'),(12,4,1,0,'2013-09-05 17:46:23'),(13,5,22,0,'2013-09-06 12:34:34'),(14,9,22,0,'2013-09-06 12:34:34'),(15,3,15,0,'2013-09-06 12:34:34'),(16,4,17,0,'2013-09-06 12:34:34'),(17,2,14,1,'2013-09-06 12:34:47'),(18,7,11,0,'2013-09-06 12:34:47'),(19,6,10,0,'2013-09-06 12:35:06'),(20,8,15,0,'2013-09-06 12:36:25'),(21,1,6,0,'2013-09-06 12:40:21'),(22,3,1,0,'2013-09-07 18:44:12'),(23,7,1,0,'2013-09-07 18:44:12');
/*!40000 ALTER TABLE `zc_banners_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_categories`
--

DROP TABLE IF EXISTS `zc_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_categories` (
  `categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_image` varchar(64) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `categories_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`categories_id`),
  KEY `idx_parent_id_cat_id_zen` (`parent_id`,`categories_id`),
  KEY `idx_status_zen` (`categories_status`),
  KEY `idx_sort_order_zen` (`sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_categories`
--

LOCK TABLES `zc_categories` WRITE;
/*!40000 ALTER TABLE `zc_categories` DISABLE KEYS */;
INSERT INTO `zc_categories` VALUES (1,NULL,0,1,'2013-09-06 11:58:00','2013-09-06 12:01:29',1),(2,NULL,0,5,'2013-09-06 11:59:04','2013-09-06 12:02:34',1),(3,NULL,0,2,'2013-09-06 12:00:57','2013-09-06 12:02:25',1),(4,NULL,0,3,'2013-09-06 12:02:08',NULL,1),(5,NULL,0,2,'2013-09-06 12:04:35',NULL,1);
/*!40000 ALTER TABLE `zc_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_categories_description`
--

DROP TABLE IF EXISTS `zc_categories_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_categories_description` (
  `categories_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `categories_name` varchar(32) NOT NULL DEFAULT '',
  `categories_description` text NOT NULL,
  PRIMARY KEY (`categories_id`,`language_id`),
  KEY `idx_categories_name_zen` (`categories_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_categories_description`
--

LOCK TABLES `zc_categories_description` WRITE;
/*!40000 ALTER TABLE `zc_categories_description` DISABLE KEYS */;
INSERT INTO `zc_categories_description` VALUES (1,2,'Starter Kits',''),(1,1,'',''),(2,2,'Accessoires',''),(2,1,'',''),(3,2,'E-Liquids',''),(3,1,'',''),(4,2,'Cartomizers',''),(4,1,'',''),(5,2,'Batterijen',''),(5,1,'','');
/*!40000 ALTER TABLE `zc_categories_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_configuration`
--

DROP TABLE IF EXISTS `zc_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_configuration` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` text NOT NULL,
  `configuration_key` varchar(255) NOT NULL DEFAULT '',
  `configuration_value` text NOT NULL,
  `configuration_description` text NOT NULL,
  `configuration_group_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text,
  `set_function` text,
  PRIMARY KEY (`configuration_id`),
  UNIQUE KEY `unq_config_key_zen` (`configuration_key`),
  KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)),
  KEY `idx_cfg_grp_id_zen` (`configuration_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=567 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_configuration`
--

LOCK TABLES `zc_configuration` WRITE;
/*!40000 ALTER TABLE `zc_configuration` DISABLE KEYS */;
INSERT INTO `zc_configuration` VALUES (1,'Store Name','STORE_NAME','Start Vaping!','The name of my store',1,1,NULL,'2009-05-30 08:43:46',NULL,NULL),(2,'Store Owner','STORE_OWNER','V4NL','The name of my store owner',1,2,'2013-09-06 12:21:09','2009-05-30 08:43:46',NULL,NULL),(3,'Country','STORE_COUNTRY','150','The country my store is located in <br /><br /><strong>Note: Please remember to update the store zone.</strong>',1,6,'2013-09-06 12:21:18','2009-05-30 08:43:46','zen_get_country_name','zen_cfg_pull_down_country_list('),(4,'Zone','STORE_ZONE','18','The zone my store is located in',1,7,NULL,'2009-05-30 08:43:46','zen_cfg_get_zone_name','zen_cfg_pull_down_zone_list('),(5,'Expected Sort Order','EXPECTED_PRODUCTS_SORT','desc','This is the sort order used in the expected products box.',1,8,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'asc\', \'desc\'), '),(6,'Expected Sort Field','EXPECTED_PRODUCTS_FIELD','date_expected','The column to sort by in the expected products box.',1,9,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'products_name\', \'date_expected\'), '),(7,'Switch To Default Language Currency','USE_DEFAULT_LANGUAGE_CURRENCY','false','Automatically switch to the language\'s currency when it is changed',1,10,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(8,'Language Selector','LANGUAGE_DEFAULT_SELECTOR','Default','Should the default language be based on the Store preferences, or the customer\'s browser settings?<br /><br />Default: Store\'s default settings',1,11,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'Default\', \'Browser\'), '),(9,'Use Search-Engine Safe URLs (still in development)','SEARCH_ENGINE_FRIENDLY_URLS','false','Use search-engine safe urls for all site links',6,12,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(10,'Display Cart After Adding Product','DISPLAY_CART','true','Display the shopping cart after adding a product (or return back to their origin)',1,14,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(11,'Default Search Operator','ADVANCED_SEARCH_DEFAULT_OPERATOR','and','Default search operators',1,17,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'and\', \'or\'), '),(12,'Store Address and Phone','STORE_NAME_ADDRESS','Store Name\nAddress\nCountry\nPhone','This is the Store Name, Address and Phone used on printable documents and displayed online',1,7,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_textarea('),(13,'Show Category Counts','SHOW_COUNTS','true','Count recursively how many products are in each category',1,19,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(14,'Tax Decimal Places','TAX_DECIMAL_PLACES','0','Pad the tax value this amount of decimal places',1,20,NULL,'2009-05-30 08:43:46',NULL,NULL),(15,'Display Prices with Tax','DISPLAY_PRICE_WITH_TAX','true','Display prices with tax included (true) or add the tax at the end (false)',1,21,'2013-09-06 13:19:04','2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(16,'Display Prices with Tax in Admin','DISPLAY_PRICE_WITH_TAX_ADMIN','true','Display prices with tax included (true) or add the tax at the end (false) in Admin(Invoices)',1,21,'2013-09-06 13:19:12','2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(17,'Basis of Product Tax','STORE_PRODUCT_TAX_BASIS','Shipping','On what basis is Product Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone',1,21,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), '),(18,'Basis of Shipping Tax','STORE_SHIPPING_TAX_BASIS','Shipping','On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone - Can be overriden by correctly written Shipping Module',1,21,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), '),(19,'Sales Tax Display Status','STORE_TAX_DISPLAY_STATUS','0','Always show Sales Tax even when amount is $0.00?<br />0= Off<br />1= On',1,21,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(20,'Admin Session Time Out in Seconds','SESSION_TIMEOUT_ADMIN','900','Enter the time in seconds.<br />Max allowed is 900 for PCI Compliance Reasons.<br /> Default=900<br />Example: 900= 15 min <br /><br />Note: Too few seconds can result in timeout issues when adding/editing products',1,40,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'900\', \'600\', \'300\'), '),(21,'Admin Set max_execution_time for processes','GLOBAL_SET_TIME_LIMIT','60','Enter the time in seconds for how long the max_execution_time of processes should be. Default=60<br />Example: 60= 1 minute<br /><br />Note: Changing the time limit is only needed if you are having problems with the execution time of a process',1,42,NULL,'2009-05-30 08:43:46',NULL,NULL),(22,'Show if version update available','SHOW_VERSION_UPDATE_IN_HEADER','true','Automatically check to see if a new version of Zen Cart is available. Enabling this can sometimes slow down the loading of Admin pages. (Displayed on main Index page after login, and Server Info page.)',1,44,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(23,'Store Status','STORE_STATUS','0','What is your Store Status<br />0= Normal Store<br />1= Showcase no prices<br />2= Showcase with prices',1,25,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(24,'Server Uptime','DISPLAY_SERVER_UPTIME','true','Displaying Server uptime can cause entries in error logs on some servers. (true = Display, false = don\'t display)',1,46,'2003-11-08 20:24:47','0001-01-01 00:00:00','','zen_cfg_select_option(array(\'true\', \'false\'),'),(25,'Missing Page Check','MISSING_PAGE_CHECK','Page Not Found','Zen Cart can check for missing pages in the URL and redirect to Index page. For debugging you may want to turn this off. <br /><br /><strong>Default=On</strong><br />On = Send missing pages to \'index\'<br />Off = Don\'t check for missing pages<br />Page Not Found = display the Page-Not-Found page',1,48,'2003-11-08 20:24:47','0001-01-01 00:00:00','','zen_cfg_select_option(array(\'On\', \'Off\', \'Page Not Found\'),'),(26,'CURL Proxy Status','CURL_PROXY_REQUIRED','False','Does your host require that you use a proxy for cURL communication?',6,50,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(27,'CURL Proxy Address','CURL_PROXY_SERVER_DETAILS','','If you have a hosting service that requires use of a proxy to zc_talk to zc_external sites via cURL, enter their proxy address here.<br />format: address:port<br />ie: 127.0.0.1:3128',6,51,NULL,'2009-05-30 08:43:46',NULL,NULL),(28,'HTML Editor','HTML_EDITOR_PREFERENCE','NONE','Please select the HTML/Rich-Text editor you wish to use for composing Admin-related emails, newsletters, and product descriptions',1,110,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_pull_down_htmleditors('),(29,'Enable phpBB linkage?','PHPBB_LINKS_ENABLED','','Should Zen Cart synchronize new account information to your (already-installed) phpBB forum?',1,120,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(30,'Show Category Counts - Admin','SHOW_COUNTS_ADMIN','true','Show Category Counts in Admin?',1,19,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(31,'Currency Conversion Ratio','CURRENCY_UPLIFT_RATIO','1.05','When auto-updating currencies, what \"uplift\" ratio should be used to calculate the exchange rate used by your store?<br />ie: the bank rate is obtained from the currency-exchange servers; how much extra do you want to charge in order to make up the difference between the bank rate and the consumer rate?<br /><br /><strong>Default: 1.05 </strong><br />This will cause the published bank rate to be multiplied by 1.05 to set the currency rates in your store.',1,55,NULL,'2009-05-30 08:43:46',NULL,NULL),(32,'First Name','ENTRY_FIRST_NAME_MIN_LENGTH','2','Minimum length of first name',2,1,NULL,'2009-05-30 08:43:46',NULL,NULL),(33,'Last Name','ENTRY_LAST_NAME_MIN_LENGTH','2','Minimum length of last name',2,2,NULL,'2009-05-30 08:43:46',NULL,NULL),(34,'Date of Birth','ENTRY_DOB_MIN_LENGTH','10','Minimum length of date of birth',2,3,NULL,'2009-05-30 08:43:46',NULL,NULL),(35,'E-Mail Address','ENTRY_EMAIL_ADDRESS_MIN_LENGTH','6','Minimum length of e-mail address',2,4,NULL,'2009-05-30 08:43:46',NULL,NULL),(36,'Street Address','ENTRY_STREET_ADDRESS_MIN_LENGTH','5','Minimum length of street address',2,5,NULL,'2009-05-30 08:43:46',NULL,NULL),(37,'Company','ENTRY_COMPANY_MIN_LENGTH','0','Minimum length of company name',2,6,'2013-09-06 13:06:38','2009-05-30 08:43:46',NULL,NULL),(38,'Post Code','ENTRY_POSTCODE_MIN_LENGTH','4','Minimum length of post code',2,7,NULL,'2009-05-30 08:43:46',NULL,NULL),(39,'City','ENTRY_CITY_MIN_LENGTH','2','Minimum length of city',2,8,NULL,'2009-05-30 08:43:46',NULL,NULL),(40,'State','ENTRY_STATE_MIN_LENGTH','2','Minimum length of state',2,9,NULL,'2009-05-30 08:43:46',NULL,NULL),(41,'Telephone Number','ENTRY_TELEPHONE_MIN_LENGTH','10','Minimum length of telephone number',2,10,'2013-09-06 13:07:23','2009-05-30 08:43:46',NULL,NULL),(42,'Password','ENTRY_PASSWORD_MIN_LENGTH','5','Minimum length of password',2,11,NULL,'2009-05-30 08:43:46',NULL,NULL),(43,'Credit Card Owner Name','CC_OWNER_MIN_LENGTH','3','Minimum length of credit card owner name',2,12,NULL,'2009-05-30 08:43:46',NULL,NULL),(44,'Credit Card Number','CC_NUMBER_MIN_LENGTH','10','Minimum length of credit card number',2,13,NULL,'2009-05-30 08:43:46',NULL,NULL),(45,'Credit Card CVV Number','CC_CVV_MIN_LENGTH','3','Minimum length of credit card CVV number',2,13,NULL,'2009-05-30 08:43:46',NULL,NULL),(46,'Product Review Text','REVIEW_TEXT_MIN_LENGTH','50','Minimum length of product review text',2,14,NULL,'2009-05-30 08:43:46',NULL,NULL),(47,'Best Sellers','MIN_DISPLAY_BESTSELLERS','1','Minimum number of best sellers to display',2,15,NULL,'2009-05-30 08:43:46',NULL,NULL),(48,'Also Purchased Products','MIN_DISPLAY_ALSO_PURCHASED','1','Minimum number of products to display in the \'This Customer Also Purchased\' box',2,16,NULL,'2009-05-30 08:43:46',NULL,NULL),(49,'Nick Name','ENTRY_NICK_MIN_LENGTH','3','Minimum length of Nick Name',2,1,NULL,'2009-05-30 08:43:46',NULL,NULL),(50,'Address Book Entries','MAX_ADDRESS_BOOK_ENTRIES','5','Maximum address book entries a customer is allowed to have',3,1,NULL,'2009-05-30 08:43:46',NULL,NULL),(51,'Admin Search Results Per Page','MAX_DISPLAY_SEARCH_RESULTS','20','Number of products to zc_list on an Admin search result page',3,2,NULL,'2009-05-30 08:43:46',NULL,NULL),(52,'Prev/Next Navigation Page Links','MAX_DISPLAY_PAGE_LINKS','5','Number of \'number\' links use for page-sets',3,3,NULL,'2009-05-30 08:43:46',NULL,NULL),(53,'Products on Special ','MAX_DISPLAY_SPECIAL_PRODUCTS','9','Number of products on special to display',3,4,NULL,'2009-05-30 08:43:46',NULL,NULL),(54,'New Products Module','MAX_DISPLAY_NEW_PRODUCTS','9','Number of new products to display in a category',3,5,NULL,'2009-05-30 08:43:46',NULL,NULL),(55,'Upcoming Products ','MAX_DISPLAY_UPCOMING_PRODUCTS','10','Number of \'upcoming\' products to display',3,6,NULL,'2009-05-30 08:43:46',NULL,NULL),(56,'Manufacturers List - Scroll Box Size/Style','MAX_MANUFACTURERS_LIST','3','Number of manufacturers names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.',3,7,NULL,'2009-05-30 08:43:46',NULL,NULL),(57,'Manufacturers List - Verify Product Exist','PRODUCTS_MANUFACTURERS_STATUS','1','Verify that at least 1 product exists and is active for the manufacturer name to show<br /><br />Note: When this feature is ON it can produce slower results on sites with a large number of products and/or manufacturers<br />0= off 1= on',3,7,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(58,'Music Genre List - Scroll Box Size/Style','MAX_MUSIC_GENRES_LIST','3','Number of music genre names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.',3,7,NULL,'2009-05-30 08:43:46',NULL,NULL),(59,'Record Company List - Scroll Box Size/Style','MAX_RECORD_COMPANY_LIST','3','Number of record company names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.',3,7,NULL,'2009-05-30 08:43:46',NULL,NULL),(60,'Length of Record Company Name','MAX_DISPLAY_RECORD_COMPANY_NAME_LEN','15','Used in record companies box; maximum length of record company name to display. Longer names will be truncated.',3,8,NULL,'2009-05-30 08:43:46',NULL,NULL),(61,'Length of Music Genre Name','MAX_DISPLAY_MUSIC_GENRES_NAME_LEN','15','Used in music genres box; maximum length of music genre name to display. Longer names will be truncated.',3,8,NULL,'2009-05-30 08:43:46',NULL,NULL),(62,'Length of Manufacturers Name','MAX_DISPLAY_MANUFACTURER_NAME_LEN','15','Used in manufacturers box; maximum length of manufacturers name to display. Longer names will be truncated.',3,8,NULL,'2009-05-30 08:43:46',NULL,NULL),(63,'New Product Reviews Per Page','MAX_DISPLAY_NEW_REVIEWS','6','Number of new reviews to display on each page',3,9,NULL,'2009-05-30 08:43:46',NULL,NULL),(64,'Random Product Reviews for SideBox','MAX_RANDOM_SELECT_REVIEWS','1','Number of random product REVIEWS to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?',3,10,NULL,'2009-05-30 08:43:46',NULL,NULL),(65,'Random New Products for SideBox','MAX_RANDOM_SELECT_NEW','3','Number of random NEW products to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?',3,11,NULL,'2009-05-30 08:43:46',NULL,NULL),(66,'Random Products On Special for SideBox','MAX_RANDOM_SELECT_SPECIALS','2','Number of random products on SPECIAL to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?',3,12,NULL,'2009-05-30 08:43:46',NULL,NULL),(67,'Categories To List Per Row','MAX_DISPLAY_CATEGORIES_PER_ROW','3','How many categories to list per row',3,13,NULL,'2009-05-30 08:43:46',NULL,NULL),(68,'New Products Listing- Number Per Page','MAX_DISPLAY_PRODUCTS_NEW','10','Number of new products listed per page',3,14,NULL,'2009-05-30 08:43:46',NULL,NULL),(69,'Best Sellers For Box','MAX_DISPLAY_BESTSELLERS','10','Number of best sellers to display in box',3,15,NULL,'2009-05-30 08:43:46',NULL,NULL),(70,'Also Purchased Products','MAX_DISPLAY_ALSO_PURCHASED','6','Number of products to display in the \'This Customer Also Purchased\' box',3,16,NULL,'2009-05-30 08:43:46',NULL,NULL),(71,'Recent Purchases Box- NOTE: box is disabled ','MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX','6','Number of products to display in the recent purchases box',3,17,NULL,'2009-05-30 08:43:46',NULL,NULL),(72,'Customer Order History List Per Page','MAX_DISPLAY_ORDER_HISTORY','10','Number of orders to display in the order history list in \'My Account\'',3,18,NULL,'2009-05-30 08:43:46',NULL,NULL),(73,'Maximum Display of Customers on Customers Page','MAX_DISPLAY_SEARCH_RESULTS_CUSTOMER','20','',3,19,NULL,'2009-05-30 08:43:46',NULL,NULL),(74,'Maximum Display of Orders on Orders Page','MAX_DISPLAY_SEARCH_RESULTS_ORDERS','20','',3,20,NULL,'2009-05-30 08:43:46',NULL,NULL),(75,'Maximum Display of Products on Reports','MAX_DISPLAY_SEARCH_RESULTS_REPORTS','20','',3,21,NULL,'2009-05-30 08:43:46',NULL,NULL),(76,'Maximum Categories Products Display List','MAX_DISPLAY_RESULTS_CATEGORIES','10','Number of products to list per screen',3,22,NULL,'2009-05-30 08:43:46',NULL,NULL),(77,'Products Listing- Number Per Page','MAX_DISPLAY_PRODUCTS_LISTING','10','Maximum Number of Products to list per page on main page',3,30,NULL,'2009-05-30 08:43:46',NULL,NULL),(78,'Products Attributes - Option Names and Values Display','MAX_ROW_LISTS_OPTIONS','10','Maximum number of option names and values to display in the products attributes page',3,24,NULL,'2009-05-30 08:43:46',NULL,NULL),(79,'Products Attributes - Attributes Controller Display','MAX_ROW_LISTS_ATTRIBUTES_CONTROLLER','30','Maximum number of attributes to display in the Attributes Controller page',3,25,NULL,'2009-05-30 08:43:46',NULL,NULL),(80,'Products Attributes - Downloads Manager Display','MAX_DISPLAY_SEARCH_RESULTS_DOWNLOADS_MANAGER','30','Maximum number of attributes downloads to display in the Downloads Manager page',3,26,NULL,'2009-05-30 08:43:46',NULL,NULL),(81,'Featured Products - Number to Display Admin','MAX_DISPLAY_SEARCH_RESULTS_FEATURED_ADMIN','10','Number of featured products to list per screen - Admin',3,27,NULL,'2009-05-30 08:43:46',NULL,NULL),(82,'Maximum Display of Featured Products - Main Page','MAX_DISPLAY_SEARCH_RESULTS_FEATURED','9','Number of featured products to list on main page',3,28,NULL,'2009-05-30 08:43:46',NULL,NULL),(83,'Maximum Display of Featured Products Page','MAX_DISPLAY_PRODUCTS_FEATURED_PRODUCTS','10','Number of featured products to list per screen',3,29,NULL,'2009-05-30 08:43:46',NULL,NULL),(84,'Random Featured Products for SideBox','MAX_RANDOM_SELECT_FEATURED_PRODUCTS','2','Number of random FEATURED products to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?',3,30,NULL,'2009-05-30 08:43:46',NULL,NULL),(85,'Maximum Display of Specials Products - Main Page','MAX_DISPLAY_SPECIAL_PRODUCTS_INDEX','9','Number of special products to list on main page',3,31,NULL,'2009-05-30 08:43:46',NULL,NULL),(86,'New Product Listing - Limited to ...','SHOW_NEW_PRODUCTS_LIMIT','0','Limit the New Product Listing to<br />0= All Products<br />1= Current Month<br />7= 7 Days<br />14= 14 Days<br />30= 30 Days<br />60= 60 Days<br />90= 90 Days<br />120= 120 Days',3,40,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'7\', \'14\', \'30\', \'60\', \'90\', \'120\'), '),(87,'Maximum Display of Products All Page','MAX_DISPLAY_PRODUCTS_ALL','10','Number of products to list per screen',3,45,NULL,'2009-05-30 08:43:46',NULL,NULL),(88,'Maximum Display of Language Flags in Language Side Box','MAX_LANGUAGE_FLAGS_COLUMNS','3','Number of Language Flags per Row',3,50,NULL,'2009-05-30 08:43:46',NULL,NULL),(89,'Maximum File Upload Size','MAX_FILE_UPLOAD_SIZE','2048000','What is the Maximum file size for uploads?<br />Default= 2048000',3,60,NULL,'2009-05-30 08:43:46',NULL,NULL),(90,'Allowed Filename Extensions for uploading','UPLOAD_FILENAME_EXTENSIONS','jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip','List the permissible filetypes (filename extensions) to be allowed when files are uploaded to your site by customers. Separate multiple values with commas(,). Do not include the dot(.).<br /><br />Suggested setting: \"jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip\"',3,61,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_textarea('),(91,'Maximum Orders Detail Display on Admin Orders Listing','MAX_DISPLAY_RESULTS_ORDERS_DETAILS_LISTING','0','Maximum number of Order Details<br />0 = Unlimited',3,65,NULL,'2009-05-30 08:43:46',NULL,NULL),(92,'Maximum PayPal IPN Display on Admin Listing','MAX_DISPLAY_SEARCH_RESULTS_PAYPAL_IPN','20','Maximum number of PayPal IPN Lisings in Admin<br />Default is 20',3,66,NULL,'2009-05-30 08:43:46',NULL,NULL),(93,'Maximum Display Columns Products to Multiple Categories Manager','MAX_DISPLAY_PRODUCTS_TO_CATEGORIES_COLUMNS','3','Maximum Display Columns Products to Multiple Categories Manager<br />3 = Default',3,70,NULL,'2009-05-30 08:43:46',NULL,NULL),(94,'Maximum Display EZ-Pages','MAX_DISPLAY_SEARCH_RESULTS_EZPAGE','20','Maximum Display EZ-Pages<br />20 = Default',3,71,NULL,'2009-05-30 08:43:46',NULL,NULL),(95,'Small Image Width','SMALL_IMAGE_WIDTH','100','The pixel width of small images',4,1,NULL,'2009-05-30 08:43:46',NULL,NULL),(96,'Small Image Height','SMALL_IMAGE_HEIGHT','80','The pixel height of small images',4,2,NULL,'2009-05-30 08:43:46',NULL,NULL),(97,'Heading Image Width - Admin','HEADING_IMAGE_WIDTH','57','The pixel width of heading images in the Admin<br />NOTE: Presently, this adjusts the spacing on the pages in the Admin Pages or could be used to add images to the heading in the Admin',4,3,NULL,'2009-05-30 08:43:46',NULL,NULL),(98,'Heading Image Height - Admin','HEADING_IMAGE_HEIGHT','40','The pixel height of heading images in the Admin<br />NOTE: Presently, this adjusts the spacing on the pages in the Admin Pages or could be used to add images to the heading in the Admin',4,4,NULL,'2009-05-30 08:43:46',NULL,NULL),(99,'Subcategory Image Width','SUBCATEGORY_IMAGE_WIDTH','100','The pixel width of subcategory images',4,5,NULL,'2009-05-30 08:43:46',NULL,NULL),(100,'Subcategory Image Height','SUBCATEGORY_IMAGE_HEIGHT','57','The pixel height of subcategory images',4,6,NULL,'2009-05-30 08:43:46',NULL,NULL),(101,'Calculate Image Size','CONFIG_CALCULATE_IMAGE_SIZE','true','Calculate the size of images?',4,7,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(102,'Image Required','IMAGE_REQUIRED','true','Enable to display broken images. Good for development.',4,8,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(103,'Image - Shopping Cart Status','IMAGE_SHOPPING_CART_STATUS','1','Show product image in the shopping cart?<br />0= off 1= on',4,9,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(104,'Image - Shopping Cart Width','IMAGE_SHOPPING_CART_WIDTH','50','Default = 50',4,10,NULL,'2009-05-30 08:43:46',NULL,NULL),(105,'Image - Shopping Cart Height','IMAGE_SHOPPING_CART_HEIGHT','40','Default = 40',4,11,NULL,'2009-05-30 08:43:46',NULL,NULL),(106,'Category Icon Image Width - Product Info Pages','CATEGORY_ICON_IMAGE_WIDTH','57','The pixel width of Category Icon heading images for Product Info Pages',4,13,NULL,'2009-05-30 08:43:46',NULL,NULL),(107,'Category Icon Image Height - Product Info Pages','CATEGORY_ICON_IMAGE_HEIGHT','40','The pixel height of Category Icon heading images for Product Info Pages',4,14,NULL,'2009-05-30 08:43:46',NULL,NULL),(108,'Top Subcategory Image Width','SUBCATEGORY_IMAGE_TOP_WIDTH','150','The pixel width of Top subcategory images<br />Top subcategory is when the Category contains subcategories',4,15,NULL,'2009-05-30 08:43:46',NULL,NULL),(109,'Top Subcategory Image Height','SUBCATEGORY_IMAGE_TOP_HEIGHT','85','The pixel height of Top subcategory images<br />Top subcategory is when the Category contains subcategories',4,16,NULL,'2009-05-30 08:43:46',NULL,NULL),(110,'Product Info - Image Width','MEDIUM_IMAGE_WIDTH','150','The pixel width of Product Info images',4,20,NULL,'2009-05-30 08:43:46',NULL,NULL),(111,'Product Info - Image Height','MEDIUM_IMAGE_HEIGHT','120','The pixel height of Product Info images',4,21,NULL,'2009-05-30 08:43:46',NULL,NULL),(112,'Product Info - Image Medium Suffix','IMAGE_SUFFIX_MEDIUM','_MED','Product Info Medium Image Suffix<br />Default = _MED',4,22,NULL,'2009-05-30 08:43:46',NULL,NULL),(113,'Product Info - Image Large Suffix','IMAGE_SUFFIX_LARGE','_LRG','Product Info Large Image Suffix<br />Default = _LRG',4,23,NULL,'2009-05-30 08:43:46',NULL,NULL),(114,'Product Info - Number of Additional Images per Row','IMAGES_AUTO_ADDED','3','Product Info - Enter the number of additional images to display per row<br />Default = 3',4,30,NULL,'2009-05-30 08:43:46',NULL,NULL),(115,'Image - Product Listing Width','IMAGE_PRODUCT_LISTING_WIDTH','100','Default = 100',4,40,NULL,'2009-05-30 08:43:46',NULL,NULL),(116,'Image - Product Listing Height','IMAGE_PRODUCT_LISTING_HEIGHT','80','Default = 80',4,41,NULL,'2009-05-30 08:43:46',NULL,NULL),(117,'Image - Product New Listing Width','IMAGE_PRODUCT_NEW_LISTING_WIDTH','100','Default = 100',4,42,NULL,'2009-05-30 08:43:46',NULL,NULL),(118,'Image - Product New Listing Height','IMAGE_PRODUCT_NEW_LISTING_HEIGHT','80','Default = 80',4,43,NULL,'2009-05-30 08:43:46',NULL,NULL),(119,'Image - New Products Width','IMAGE_PRODUCT_NEW_WIDTH','100','Default = 100',4,44,NULL,'2009-05-30 08:43:46',NULL,NULL),(120,'Image - New Products Height','IMAGE_PRODUCT_NEW_HEIGHT','80','Default = 80',4,45,NULL,'2009-05-30 08:43:46',NULL,NULL),(121,'Image - Featured Products Width','IMAGE_FEATURED_PRODUCTS_LISTING_WIDTH','100','Default = 100',4,46,NULL,'2009-05-30 08:43:46',NULL,NULL),(122,'Image - Featured Products Height','IMAGE_FEATURED_PRODUCTS_LISTING_HEIGHT','80','Default = 80',4,47,NULL,'2009-05-30 08:43:46',NULL,NULL),(123,'Image - Product All Listing Width','IMAGE_PRODUCT_ALL_LISTING_WIDTH','100','Default = 100',4,48,NULL,'2009-05-30 08:43:46',NULL,NULL),(124,'Image - Product All Listing Height','IMAGE_PRODUCT_ALL_LISTING_HEIGHT','80','Default = 80',4,49,NULL,'2009-05-30 08:43:46',NULL,NULL),(125,'Product Image - No Image Status','PRODUCTS_IMAGE_NO_IMAGE_STATUS','1','Use automatic No Image when none is added to product<br />0= off<br />1= On',4,60,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(126,'Product Image - No Image picture','PRODUCTS_IMAGE_NO_IMAGE','no_picture.gif','Use automatic No Image when none is added to product<br />Default = no_picture.gif',4,61,NULL,'2009-05-30 08:43:46',NULL,NULL),(127,'Image - Use Proportional Images on Products and Categories','PROPORTIONAL_IMAGES_STATUS','1','Use Proportional Images on Products and Categories?<br /><br />NOTE: Do not use 0 height or width settings for Proportion Images<br />0= off 1= on',4,75,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(128,'Email Salutation','ACCOUNT_GENDER','true','Display salutation choice during account creation and with account information',5,1,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(129,'Date of Birth','ACCOUNT_DOB','true','Display date of birth field during account creation and with account information<br />NOTE: Set Minimum Value Date of Birth to blank for not required<br />Set Minimum Value Date of Birth > 0 to require',5,2,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(130,'Company','ACCOUNT_COMPANY','true','Display company field during account creation and with account information',5,3,'2013-09-06 13:06:27','2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(131,'Address Line 2','ACCOUNT_SUBURB','true','Display address line 2 field during account creation and with account information',5,4,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(132,'State','ACCOUNT_STATE','true','Display state field during account creation and with account information',5,5,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(133,'State - Always display as pulldown?','ACCOUNT_STATE_DRAW_INITIAL_DROPDOWN','false','When state field is displayed, should it always be a pulldown menu?',5,5,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(134,'Create Account Default Country ID','SHOW_CREATE_ACCOUNT_DEFAULT_COUNTRY','150','Set Create Account Default Country ID to:<br />Default is 223',5,6,'2013-09-06 13:03:47','2009-05-30 08:43:46','zen_get_country_name','zen_cfg_pull_down_country_list_none('),(135,'Fax Number','ACCOUNT_FAX_NUMBER','false','Display fax number field during account creation and with account information',5,10,'2013-09-06 13:03:51','2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(136,'Show Newsletter Checkbox','ACCOUNT_NEWSLETTER_STATUS','2','Show Newsletter Checkbox<br />0= off<br />1= Display Unchecked<br />2= Display Checked<br /><strong>Note: Defaulting this to accepted may be in violation of certain regulations for your state or country</strong>',5,45,'2013-09-06 13:04:03','2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(137,'Customer Default Email Preference','ACCOUNT_EMAIL_PREFERENCE','1','Set the Default Customer Default Email Preference<br />0= Text<br />1= HTML<br />',5,46,'2013-09-06 13:04:17','2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(138,'Customer Product Notification Status','CUSTOMERS_PRODUCTS_NOTIFICATION_STATUS','0','Customer should be asked about product notifications after checkout success and in account preferences<br />0= Never ask<br />1= Ask (ignored on checkout if has already selected global notifications)<br /><br />Note: Sidebox must be turned off separately',5,50,'2013-09-06 13:04:36','2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(139,'Customer Shop Status - View Shop and Prices','CUSTOMERS_APPROVAL','0','Customer must be approved to shop<br />0= Not required<br />1= Must login to browse<br />2= May browse but no prices unless logged in<br />3= Showroom Only<br /><br />It is recommended that Option 2 be used for the purposes of Spiders if you wish customers to login to see prices.',5,55,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), '),(140,'Customer Approval Status - Authorization Pending','CUSTOMERS_APPROVAL_AUTHORIZATION','0','Customer must be Authorized to shop<br />0= Not required<br />1= Must be Authorized to Browse<br />2= May browse but no prices unless Authorized<br />3= Customer May Browse and May see Prices but Must be Authorized to Buy<br /><br />It is recommended that Option 2 or 3 be used for the purposes of Spiders',5,65,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), '),(141,'Customer Authorization: filename','CUSTOMERS_AUTHORIZATION_FILENAME','customers_authorization','Customer Authorization filename<br />Note: Do not include the extension<br />Default=customers_authorization',5,66,NULL,'2009-05-30 08:43:46',NULL,''),(142,'Customer Authorization: Hide Header','CUSTOMERS_AUTHORIZATION_HEADER_OFF','false','Customer Authorization: Hide Header <br />(true=hide false=show)',5,67,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(143,'Customer Authorization: Hide Column Left','CUSTOMERS_AUTHORIZATION_COLUMN_LEFT_OFF','false','Customer Authorization: Hide Column Left <br />(true=hide false=show)',5,68,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(144,'Customer Authorization: Hide Column Right','CUSTOMERS_AUTHORIZATION_COLUMN_RIGHT_OFF','false','Customer Authorization: Hide Column Right <br />(true=hide false=show)',5,69,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(145,'Customer Authorization: Hide Footer','CUSTOMERS_AUTHORIZATION_FOOTER_OFF','false','Customer Authorization: Hide Footer <br />(true=hide false=show)',5,70,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(146,'Customer Authorization: Hide Prices','CUSTOMERS_AUTHORIZATION_PRICES_OFF','false','Customer Authorization: Hide Prices <br />(true=hide false=show)',5,71,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(147,'Customers Referral Status','CUSTOMERS_REFERRAL_STATUS','0','Customers Referral Code is created from<br />0= Off<br />1= 1st Discount Coupon Code used<br />2= Customer can add during create account or edit if blank<br /><br />NOTE: Once the Customers Referral Code has been set it can only be changed in the Admin Customer',5,80,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(148,'Installed Modules','MODULE_PAYMENT_INSTALLED','moneyorder.php','List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: cc.php;cod.php;paypal.php)',6,0,'2013-09-06 12:25:18','2009-05-30 08:43:46',NULL,NULL),(149,'Installed Modules','MODULE_ORDER_TOTAL_INSTALLED','ot_subtotal.php;ot_shipping.php;ot_coupon.php;ot_group_pricing.php;ot_tax.php;ot_gv.php;ot_total.php','List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)',6,0,'2013-09-06 13:10:10','2009-05-30 08:43:46',NULL,NULL),(150,'Installed Modules','MODULE_SHIPPING_INSTALLED','zones.php','List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)',6,0,'2013-09-06 12:24:08','2009-05-30 08:43:46',NULL,NULL),(151,'Enable Credit Card Module','MODULE_PAYMENT_CC_STATUS','True','Do you want to accept credit card payments?',6,0,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(152,'Split Credit Card E-Mail Address','MODULE_PAYMENT_CC_EMAIL','','If an e-mail address is entered, the middle digits of the credit card number will be sent to the e-mail address (the outside digits are stored in the database with the middle digits censored)',6,0,NULL,'2009-05-30 08:43:46',NULL,NULL),(153,'Collect & store the CVV number','MODULE_PAYMENT_CC_COLLECT_CVV','False','Do you want to collect the CVV number. Note: If you do the CVV number will be stored in the database in an encoded format.',6,0,NULL,'2004-01-11 22:55:51',NULL,'zen_cfg_select_option(array(\'True\', \'False\'),'),(154,'Store the Credit Card Number','MODULE_PAYMENT_CC_STORE_NUMBER','False','Do you want to store the Credit Card Number. Note: The Credit Card Number will be stored unenecrypted, and as such may represent a security problem',6,0,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'True\', \'False\'),'),(155,'Sort order of display.','MODULE_PAYMENT_CC_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2009-05-30 08:43:46',NULL,NULL),(156,'Payment Zone','MODULE_PAYMENT_CC_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2009-05-30 08:43:46','zen_get_zone_class_title','zen_cfg_pull_down_zone_classes('),(157,'Set Order Status','MODULE_PAYMENT_CC_ORDER_STATUS_ID','0','Set the status of orders made with this payment module to this value',6,0,NULL,'2009-05-30 08:43:46','zen_get_order_status_name','zen_cfg_pull_down_order_statuses('),(181,'Enable Check/Money Order Module','MODULE_PAYMENT_MONEYORDER_STATUS','True','Do you want to accept Check/Money Order payments?',6,1,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(182,'Make Payable to:','MODULE_PAYMENT_MONEYORDER_PAYTO','the Store Owner/Website Name','Who should payments be made payable to?',6,1,NULL,'2009-05-30 08:43:46',NULL,NULL),(183,'Sort order of display.','MODULE_PAYMENT_MONEYORDER_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2009-05-30 08:43:46',NULL,NULL),(184,'Payment Zone','MODULE_PAYMENT_MONEYORDER_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2009-05-30 08:43:46','zen_get_zone_class_title','zen_cfg_pull_down_zone_classes('),(185,'Set Order Status','MODULE_PAYMENT_MONEYORDER_ORDER_STATUS_ID','0','Set the status of orders made with this payment module to this value',6,0,NULL,'2009-05-30 08:43:46','zen_get_order_status_name','zen_cfg_pull_down_order_statuses('),(186,'Include Tax','MODULE_ORDER_TOTAL_GROUP_PRICING_INC_TAX','false','Include Tax value in amount before discount calculation?',6,6,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(187,'This module is installed','MODULE_ORDER_TOTAL_GROUP_PRICING_STATUS','true','',6,1,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\'), '),(188,'Sort Order','MODULE_ORDER_TOTAL_GROUP_PRICING_SORT_ORDER','290','Sort order of display.',6,2,NULL,'2009-05-30 08:43:46',NULL,NULL),(189,'Include Shipping','MODULE_ORDER_TOTAL_GROUP_PRICING_INC_SHIPPING','false','Include Shipping value in amount before discount calculation?',6,5,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(190,'Re-calculate Tax','MODULE_ORDER_TOTAL_GROUP_PRICING_CALC_TAX','Standard','Re-Calculate Tax',6,7,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'), '),(191,'Tax Class','MODULE_ORDER_TOTAL_GROUP_PRICING_TAX_CLASS','0','Use the following tax class when treating Group Discount as Credit Note.',6,0,NULL,'2009-05-30 08:43:46','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes('),(198,'Default Currency','DEFAULT_CURRENCY','EUR','Default Currency',6,0,NULL,'2009-05-30 08:43:46',NULL,NULL),(199,'Default Language','DEFAULT_LANGUAGE','nl','Default Language',6,0,NULL,'2009-05-30 08:43:46',NULL,NULL),(200,'Default Order Status For New Orders','DEFAULT_ORDERS_STATUS_ID','5','When a new order is created, this order status will be assigned to it.',6,0,NULL,'2009-05-30 08:43:46',NULL,NULL),(201,'Admin configuration_key shows','ADMIN_CONFIGURATION_KEY_ON','0','Manually switch to value of 1 to see the configuration_key name in configuration displays',6,0,NULL,'2009-05-30 08:43:46',NULL,NULL),(202,'Country of Origin','SHIPPING_ORIGIN_COUNTRY','150','Select the country of origin to be used in shipping quotes.',7,1,'2013-09-06 13:15:49','2009-05-30 08:43:46','zen_get_country_name','zen_cfg_pull_down_country_list('),(203,'Postal Code','SHIPPING_ORIGIN_ZIP','2150AM','Enter the Postal Code (ZIP) of the Store to be used in shipping quotes. NOTE: For USA zip codes, only use your 5 digit zip code.',7,2,'2013-09-06 13:16:23','2009-05-30 08:43:46',NULL,NULL),(204,'Enter the Maximum Package Weight you will ship','SHIPPING_MAX_WEIGHT','50','Carriers have a max weight limit for a single package. This is a common one for all.',7,3,NULL,'2009-05-30 08:43:46',NULL,NULL),(205,'Package Tare Small to Medium - added percentage:weight','SHIPPING_BOX_WEIGHT','0:3','What is the weight of typical packaging of small to medium packages?<br />Example: 10% + 1lb 10:1<br />10% + 0lbs 10:0<br />0% + 5lbs 0:5<br />0% + 0lbs 0:0',7,4,NULL,'2009-05-30 08:43:46',NULL,NULL),(206,'Larger packages - added packaging percentage:weight','SHIPPING_BOX_PADDING','10:0','What is the weight of typical packaging for Large packages?<br />Example: 10% + 1lb 10:1<br />10% + 0lbs 10:0<br />0% + 5lbs 0:5<br />0% + 0lbs 0:0',7,5,NULL,'2009-05-30 08:43:46',NULL,NULL),(207,'Display Number of Boxes and Weight Status','SHIPPING_BOX_WEIGHT_DISPLAY','3','Display Shipping Weight and Number of Boxes?<br /><br />0= off<br />1= Boxes Only<br />2= Weight Only<br />3= Both Boxes and Weight',7,15,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), '),(208,'Shipping Estimator Display Settings for Shopping Cart','SHOW_SHIPPING_ESTIMATOR_BUTTON','1','<br />0= Off<br />1= Display as Button on Shopping Cart<br />2= Display as Listing on Shopping Cart Page',7,20,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(209,'Display Order Comments on Admin Invoice','ORDER_COMMENTS_INVOICE','0','Do you want to display the Order Comments on the Admin Invoice?<br />0= OFF<br />1= First Comment by Customer only<br />2= All Comments for the Order',7,25,'2013-09-06 13:17:36','2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(210,'Display Order Comments on Admin Packing Slip','ORDER_COMMENTS_PACKING_SLIP','0','Do you want to display the Order Comments on the Admin Packing Slip?<br />0= OFF<br />1= First Comment by Customer only<br />2= All Comments for the Order',7,26,'2013-09-06 13:17:45','2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(211,'Order Free Shipping 0 Weight Status','ORDER_WEIGHT_ZERO_STATUS','0','If there is no weight to the order, does the order have Free Shipping?<br />0= no<br />1= yes<br /><br />Note: When using Free Shipping, Enable the Free Shipping Module this will only show when shipping is free.',7,15,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(212,'Display Product Image','PRODUCT_LIST_IMAGE','1','Do you want to display the Product Image?',8,1,NULL,'2009-05-30 08:43:46',NULL,NULL),(213,'Display Product Manufacturer Name','PRODUCT_LIST_MANUFACTURER','0','Do you want to display the Product Manufacturer Name?',8,2,NULL,'2009-05-30 08:43:46',NULL,NULL),(214,'Display Product Model','PRODUCT_LIST_MODEL','0','Do you want to display the Product Model?',8,3,NULL,'2009-05-30 08:43:46',NULL,NULL),(215,'Display Product Name','PRODUCT_LIST_NAME','2','Do you want to display the Product Name?',8,4,NULL,'2009-05-30 08:43:46',NULL,NULL),(216,'Display Product Price/Add to Cart','PRODUCT_LIST_PRICE','3','Do you want to display the Product Price/Add to Cart',8,5,NULL,'2009-05-30 08:43:46',NULL,NULL),(217,'Display Product Quantity','PRODUCT_LIST_QUANTITY','0','Do you want to display the Product Quantity?',8,6,NULL,'2009-05-30 08:43:46',NULL,NULL),(218,'Display Product Weight','PRODUCT_LIST_WEIGHT','0','Do you want to display the Product Weight?',8,7,NULL,'2009-05-30 08:43:46',NULL,NULL),(219,'Display Product Price/Add to Cart Column Width','PRODUCTS_LIST_PRICE_WIDTH','125','Define the width of the Price/Add to Cart column<br />Default= 125',8,8,NULL,'2009-05-30 08:43:46',NULL,NULL),(220,'Display Category/Manufacturer Filter (0=off; 1=on)','PRODUCT_LIST_FILTER','1','Do you want to display the Category/Manufacturer Filter?',8,9,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(221,'Prev/Next Split Page Navigation (1-top, 2-bottom, 3-both)','PREV_NEXT_BAR_LOCATION','3','Sets the location of the Prev/Next Split Page Navigation',8,10,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), '),(222,'Display Product Listing Default Sort Order','PRODUCT_LISTING_DEFAULT_SORT_ORDER','','Product Listing Default sort order?<br />NOTE: Leave Blank for Product Sort Order. Sort the Product Listing in the order you wish for the default display to start in to get the sort order setting. Example: 2a',8,15,NULL,'2009-05-30 08:43:46',NULL,NULL),(223,'Display Product Add to Cart Button (0=off; 1=on; 2=on with Qty Box per Product)','PRODUCT_LIST_PRICE_BUY_NOW','1','Do you want to display the Add to Cart Button?<br /><br /><strong>NOTE:</strong> Turn OFF Display Multiple Products Qty Box Status to use Option 2 on with Qty Box per Product',8,20,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(224,'Display Multiple Products Qty Box Status and Set Button Location','PRODUCT_LISTING_MULTIPLE_ADD_TO_CART','3','Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both',8,25,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), '),(225,'Display Product Description','PRODUCT_LIST_DESCRIPTION','150','Do you want to display the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display',8,30,NULL,'2009-05-30 08:43:46',NULL,NULL),(226,'Product Listing Ascending Sort Order','PRODUCT_LIST_SORT_ORDER_ASCENDING','+','What do you want to use to indicate Sort Order Ascending?<br />Default = +',8,40,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_textarea_small('),(227,'Product Listing Descending Sort Order','PRODUCT_LIST_SORT_ORDER_DESCENDING','-','What do you want to use to indicate Sort Order Descending?<br />Default = -',8,41,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_textarea_small('),(228,'Include Product Listing Alpha Sorter Dropdown','PRODUCT_LIST_ALPHA_SORTER','true','Do you want to include an Alpha Filter dropdown on the Product Listing?',8,50,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(229,'Include Product Listing Sub Categories Image','PRODUCT_LIST_CATEGORIES_IMAGE_STATUS','true','Do you want to include the Sub Categories Image on the Product Listing?',8,52,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(230,'Include Product Listing Top Categories Image','PRODUCT_LIST_CATEGORIES_IMAGE_STATUS_TOP','true','Do you want to include the Top Categories Image on the Product Listing?',8,53,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(231,'Show SubCategories on Main Page while navigating','PRODUCT_LIST_CATEGORY_ROW_STATUS','1','Show Sub-Categories on Main Page while navigating through Categories<br /><br />0= off<br />1= on',8,60,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(232,'Check stock level','STOCK_CHECK','true','Check to see if sufficent stock is available',9,1,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(233,'Subtract stock','STOCK_LIMITED','true','Subtract product in stock by product orders',9,2,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(234,'Allow Checkout','STOCK_ALLOW_CHECKOUT','true','Allow customer to checkout even if there is insufficient stock',9,3,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(235,'Mark product out of stock','STOCK_MARK_PRODUCT_OUT_OF_STOCK','***','Display something on screen so customer can see which product has insufficient stock',9,4,NULL,'2009-05-30 08:43:46',NULL,NULL),(236,'Stock Re-order level','STOCK_REORDER_LEVEL','5','Define when stock needs to be re-ordered',9,5,NULL,'2009-05-30 08:43:46',NULL,NULL),(237,'Products status in Catalog when out of stock should be set to','SHOW_PRODUCTS_SOLD_OUT','0','Show Products when out of stock<br /><br />0= set product status to OFF<br />1= leave product status ON',9,10,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(238,'Show Sold Out Image in place of Add to Cart','SHOW_PRODUCTS_SOLD_OUT_IMAGE','1','Show Sold Out Image instead of Add to Cart Button<br /><br />0= off<br />1= on',9,11,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(239,'Product Quantity Decimals','QUANTITY_DECIMALS','0','Allow how many decimals on Quantity<br /><br />0= off',9,15,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), '),(240,'Show Shopping Cart - Delete Checkboxes or Delete Button','SHOW_SHOPPING_CART_DELETE','3','Show on Shopping Cart Delete Button and/or Checkboxes<br /><br />1= Delete Button Only<br />2= Checkbox Only<br />3= Both Delete Button and Checkbox',9,20,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), '),(241,'Show Shopping Cart - Update Cart Button Location','SHOW_SHOPPING_CART_UPDATE','3','Show on Shopping Cart Update Cart Button Location as:<br /><br />1= Next to each Qty Box<br />2= Below all Products<br />3= Both Next to each Qty Box and Below all Products',9,22,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), '),(242,'Show New Products on empty Shopping Cart Page','SHOW_SHOPPING_CART_EMPTY_NEW_PRODUCTS','1','Show New Products on empty Shopping Cart Page<br />0= off or set the sort order',9,30,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(243,'Show Featured Products on empty Shopping Cart Page','SHOW_SHOPPING_CART_EMPTY_FEATURED_PRODUCTS','2','Show Featured Products on empty Shopping Cart Page<br />0= off or set the sort order',9,31,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(244,'Show Special Products on empty Shopping Cart Page','SHOW_SHOPPING_CART_EMPTY_SPECIALS_PRODUCTS','3','Show Special Products on empty Shopping Cart Page<br />0= off or set the sort order',9,32,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(245,'Show Upcoming Products on empty Shopping Cart Page','SHOW_SHOPPING_CART_EMPTY_UPCOMING','4','Show Upcoming Products on empty Shopping Cart Page<br />0= off or set the sort order',9,33,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(246,'Show Notice of Combining Shopping Cart on Login','SHOW_SHOPPING_CART_COMBINED','1','When a customer logs in and has a previously stored shopping cart, the products are combined with the existing shopping cart.<br /><br />Do you wish to display a Notice to the customer?<br /><br />0= OFF, do not display a notice<br />1= Yes show notice and go to shopping cart<br />2= Yes show notice, but do not go to shopping cart',9,35,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(247,'Store Page Parse Time','STORE_PAGE_PARSE_TIME','false','Store the time it takes to parse a page',10,1,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(248,'Log Destination','STORE_PAGE_PARSE_TIME_LOG','/home/vandaae11/domains/vapor4life.nl/public_html/zcrt/cache/page_parse_time.log','Directory and filename of the page parse time log',10,2,NULL,'2009-05-30 08:43:46',NULL,NULL),(249,'Log Date Format','STORE_PARSE_DATE_TIME_FORMAT','%d/%m/%Y %H:%M:%S','The date format',10,3,NULL,'2009-05-30 08:43:46',NULL,NULL),(250,'Display The Page Parse Time','DISPLAY_PAGE_PARSE_TIME','false','Display the page parse time on the bottom of each page<br />You do not need to store the times to display them in the Catalog',10,4,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(251,'Store Database Queries','STORE_DB_TRANSACTIONS','false','Store the database queries in the page parse time log (PHP4 only)',10,5,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(252,'E-Mail Transport Method','EMAIL_TRANSPORT','PHP','Defines the method for sending mail.<br /><strong>PHP</strong> is the default, and uses built-in PHP wrappers for processing.<br />Servers running on Windows and MacOS should change this setting to <strong>SMTP</strong>.<br /><br /><strong>SMTPAUTH</strong> should only be used if your server requires SMTP authorization to send messages. You must also configure your SMTPAUTH settings in the appropriate fields in this admin section.<br /><br /><strong>sendmail</strong> is for linux/unix hosts using the sendmail program on the server<br /><strong>\"sendmail-f\"</strong> is only for servers which require the use of the -f parameter to send mail. This is a security setting often used to prevent spoofing. Will cause errors if your host mailserver is not configured to use it.<br /><br /><strong>Qmail</strong> is used for linux/unix hosts running Qmail as sendmail wrapper at /var/qmail/bin/sendmail.',12,1,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'PHP\', \'sendmail\', \'sendmail-f\', \'smtp\', \'smtpauth\', \'Qmail\'),'),(253,'SMTP Email Account Mailbox','EMAIL_SMTPAUTH_MAILBOX','YourEmailAccountNameHere','Enter the mailbox account name (me@mydomain.com) supplied by your host. This is the account name that your host requires for SMTP authentication.<br />Only required if using SMTP Authentication for email.',12,101,NULL,'2009-05-30 08:43:46',NULL,NULL),(254,'SMTP Email Account Password','EMAIL_SMTPAUTH_PASSWORD','YourPasswordHere','Enter the password for your SMTP mailbox. <br />Only required if using SMTP Authentication for email.',12,101,NULL,'2009-05-30 08:43:46','zen_cfg_password_display',NULL),(255,'SMTP Email Mail Host','EMAIL_SMTPAUTH_MAIL_SERVER','mail.EnterYourDomain.com','Enter the DNS name of your SMTP mail server.<br />ie: mail.mydomain.com<br />or 55.66.77.88<br />Only required if using SMTP Authentication for email.',12,101,NULL,'2009-05-30 08:43:46',NULL,NULL),(256,'SMTP Email Mail Server Port','EMAIL_SMTPAUTH_MAIL_SERVER_PORT','25','Enter the IP port number that your SMTP mailserver operates on.<br />Only required if using SMTP Authentication for email.',12,101,NULL,'2009-05-30 08:43:46',NULL,NULL),(257,'Convert currencies for Text emails','CURRENCIES_TRANSLATIONS','&pound;,¬£:&euro;,‚Ç¨','What currency conversions do you need for Text emails?<br />Default = &amp;pound;,¬£:&amp;euro;,‚Ç¨',12,120,NULL,'2003-11-21 00:00:00',NULL,'zen_cfg_textarea_small('),(258,'E-Mail Linefeeds','EMAIL_LINEFEED','LF','Defines the character sequence used to separate mail headers.',12,2,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'LF\', \'CRLF\'),'),(259,'Use MIME HTML When Sending Emails','EMAIL_USE_HTML','false','Send e-mails in HTML format',12,3,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(260,'Verify E-Mail Addresses Through DNS','ENTRY_EMAIL_ADDRESS_CHECK','false','Verify e-mail address through a DNS server',6,6,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(261,'Send E-Mails','SEND_EMAILS','true','Send out e-mails',12,5,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(262,'Email Archiving Active?','EMAIL_ARCHIVE','false','If you wish to have email messages archived/stored when sent, set this to \"true\".',12,6,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(263,'E-Mail Friendly-Errors','EMAIL_FRIENDLY_ERRORS','false','Do you want to display friendly errors if emails fail?  Setting this to false will display PHP errors and likely cause the script to fail. Only set to false while troubleshooting, and true for a live shop.',12,7,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(264,'Email Address (Displayed to Contact you)','STORE_OWNER_EMAIL_ADDRESS','root@localhost','Email address of Store Owner.  Used as \"display only\" when informing customers of how to contact you.',12,10,NULL,'2009-05-30 08:43:46',NULL,NULL),(265,'Email Address (sent FROM)','EMAIL_FROM','Zen Cart <root@localhost>','Address from which email messages will be \"sent\" by default. Can be over-ridden at compose-time in admin modules.',12,11,NULL,'2009-05-30 08:43:46',NULL,NULL),(266,'Emails must send from known domain?','EMAIL_SEND_MUST_BE_STORE','Yes','Does your mailserver require that all outgoing emails have their \"from\" address match a known domain that exists on your webserver?<br /><br />This is often required in order to prevent spoofing and spam broadcasts.  If set to Yes, this will cause the email address (sent FROM) to be used as the \"from\" address on all outgoing mail.',12,11,NULL,'0001-01-01 00:00:00',NULL,'zen_cfg_select_option(array(\'No\', \'Yes\'), '),(267,'Email Admin Format?','ADMIN_EXTRA_EMAIL_FORMAT','TEXT','Please select the Admin extra email format',12,12,NULL,'0001-01-01 00:00:00',NULL,'zen_cfg_select_option(array(\'TEXT\', \'HTML\'), '),(268,'Send Copy of Order Confirmation Emails To','SEND_EXTRA_ORDER_EMAILS_TO','','Send COPIES of order confirmation emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,12,NULL,'2009-05-30 08:43:46',NULL,NULL),(269,'Send Copy of Create Account Emails To - Status','SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO_STATUS','0','Send copy of Create Account Status<br />0= off 1= on',12,13,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(270,'Send Copy of Create Account Emails To','SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO','','Send copy of Create Account emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,14,NULL,'2009-05-30 08:43:46',NULL,NULL),(271,'Send Copy of Tell a Friend Emails To - Status','SEND_EXTRA_TELL_A_FRIEND_EMAILS_TO_STATUS','0','Send copy of Tell a Friend Status<br />0= off 1= on',12,15,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(272,'Send Copy of Tell a Friend Emails To','SEND_EXTRA_TELL_A_FRIEND_EMAILS_TO','','Send copy of Tell a Friend emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,16,NULL,'2009-05-30 08:43:46',NULL,NULL),(273,'Send Copy of Customer GV Send Emails To - Status','SEND_EXTRA_GV_CUSTOMER_EMAILS_TO_STATUS','0','Send copy of Customer GV Send Status<br />0= off 1= on',12,17,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(274,'Send Copy of Customer GV Send Emails To','SEND_EXTRA_GV_CUSTOMER_EMAILS_TO','','Send copy of Customer GV Send emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,18,NULL,'2009-05-30 08:43:46',NULL,NULL),(275,'Send Copy of Admin GV Mail Emails To - Status','SEND_EXTRA_GV_ADMIN_EMAILS_TO_STATUS','0','Send copy of Admin GV Mail Status<br />0= off 1= on',12,19,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(276,'Send Copy of Customer Admin GV Mail Emails To','SEND_EXTRA_GV_ADMIN_EMAILS_TO','','Send copy of Admin GV Mail emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,20,NULL,'2009-05-30 08:43:46',NULL,NULL),(277,'Send Copy of Admin Discount Coupon Mail Emails To - Status','SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO_STATUS','0','Send copy of Admin Discount Coupon Mail Status<br />0= off 1= on',12,21,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(278,'Send Copy of Customer Admin Discount Coupon Mail Emails To','SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO','','Send copy of Admin Discount Coupon Mail emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,22,NULL,'2009-05-30 08:43:46',NULL,NULL),(279,'Send Copy of Admin Orders Status Emails To - Status','SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO_STATUS','0','Send copy of Admin Orders Status Status<br />0= off 1= on',12,23,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(280,'Send Copy of Admin Orders Status Emails To','SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO','','Send copy of Admin Orders Status emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,24,NULL,'2009-05-30 08:43:46',NULL,NULL),(281,'Send Notice of Pending Reviews Emails To - Status','SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO_STATUS','0','Send copy of Pending Reviews Status<br />0= off 1= on',12,25,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(282,'Send Notice of Pending Reviews Emails To','SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO','','Send copy of Pending Reviews emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,26,NULL,'2009-05-30 08:43:46',NULL,NULL),(283,'Set \"Contact Us\" Email Dropdown List','CONTACT_US_LIST','','On the \"Contact Us\" Page, set the list of email addresses , in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,40,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_textarea('),(284,'Allow Guest To Tell A Friend','ALLOW_GUEST_TO_TELL_A_FRIEND','false','Allow guests to tell a friend about a product. <br />If set to [false], then tell-a-friend will prompt for login if user is not already logged in.',12,50,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(285,'Contact Us - Show Store Name and Address','CONTACT_US_STORE_NAME_ADDRESS','1','Include Store Name and Address<br />0= off 1= on',12,50,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(286,'Send Low Stock Emails','SEND_LOWSTOCK_EMAIL','0','When stock level is at or below low stock level send an email<br />0= off<br />1= on',12,60,'2009-05-30 08:43:46','2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(287,'Send Low Stock Emails To','SEND_EXTRA_LOW_STOCK_EMAILS_TO','','When stock level is at or below low stock level send an email to this address, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,61,NULL,'2009-05-30 08:43:46',NULL,NULL),(288,'Display \"Newsletter Unsubscribe\" Link?','SHOW_NEWSLETTER_UNSUBSCRIBE_LINK','true','Show \"Newsletter Unsubscribe\" link in the \"Information\" side-box?',12,70,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(289,'Audience-Select Count Display','AUDIENCE_SELECT_DISPLAY_COUNTS','true','When displaying lists of available audiences/recipients, should the recipients-count be included? <br /><em>(This may make things slower if you have a lot of customers or complex audience queries)</em>',12,90,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(290,'Enable Downloads','DOWNLOAD_ENABLED','true','Enable the products download functions.',13,1,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(291,'Download by Redirect','DOWNLOAD_BY_REDIRECT','true','Use browser redirection for download. Disable on non-Unix systems.<br /><br />Note: Set /pub to 777 when redirect is true',13,2,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(292,'Download by streaming','DOWNLOAD_IN_CHUNKS','false','If download-by-redirect is disabled, and your PHP memory_limit setting is under 8 MB, you might need to enable this setting so that files are streamed in smaller segments to the browser.<br /><br />Has no effect if Download By Redirect is enabled.',13,2,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(293,'Download Expiration (Number of Days)','DOWNLOAD_MAX_DAYS','7','Set number of days before the download link expires. 0 means no limit.',13,3,NULL,'2009-05-30 08:43:46',NULL,''),(294,'Number of Downloads Allowed - Per Product','DOWNLOAD_MAX_COUNT','5','Set the maximum number of downloads. 0 means no download authorized.',13,4,NULL,'2009-05-30 08:43:46',NULL,''),(295,'Downloads Controller Update Status Value','DOWNLOADS_ORDERS_STATUS_UPDATED_VALUE','4','What orders_status resets the Download days and Max Downloads - Default is 4',13,10,'2009-05-30 08:43:46','2009-05-30 08:43:46',NULL,NULL),(296,'Downloads Controller Order Status Value >= lower value','DOWNLOADS_CONTROLLER_ORDERS_STATUS','2','Downloads Controller Order Status Value - Default >= 2<br /><br />Downloads are available for checkout based on the orders status. Orders with orders status greater than this value will be available for download. The orders status is set for an order by the Payment Modules. Set the lower range for this range.',13,12,'2009-05-30 08:43:46','2009-05-30 08:43:46',NULL,NULL),(297,'Downloads Controller Order Status Value <= upper value','DOWNLOADS_CONTROLLER_ORDERS_STATUS_END','4','Downloads Controller Order Status Value - Default <= 4<br /><br />Downloads are available for checkout based on the orders status. Orders with orders status less than this value will be available for download. The orders status is set for an order by the Payment Modules.  Set the upper range for this range.',13,13,'2009-05-30 08:43:46','2009-05-30 08:43:46',NULL,NULL),(298,'Enable Price Factor','ATTRIBUTES_ENABLED_PRICE_FACTOR','true','Enable the Attributes Price Factor.',13,25,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(299,'Enable Qty Price Discount','ATTRIBUTES_ENABLED_QTY_PRICES','true','Enable the Attributes Quantity Price Discounts.',13,26,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(300,'Enable Attribute Images','ATTRIBUTES_ENABLED_IMAGES','true','Enable the Attributes Images.',13,28,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(301,'Enable Text Pricing by word or letter','ATTRIBUTES_ENABLED_TEXT_PRICES','true','Enable the Attributes Text Pricing by word or letter.',13,35,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(302,'Text Pricing - Spaces are Free','TEXT_SPACES_FREE','1','On Text pricing Spaces are Free<br /><br />0= off 1= on',13,36,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(303,'Read Only option type - Ignore for Add to Cart','PRODUCTS_OPTIONS_TYPE_READONLY_IGNORED','1','When a Product only uses READONLY attributes, should the Add to Cart button be On or Off?<br />0= OFF<br />1= ON',13,37,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(304,'Enable GZip Compression','GZIP_LEVEL','0','0= off 1= on',14,1,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(305,'Session Directory','SESSION_WRITE_DIRECTORY','/home/vandaae11/domains/vapor4life.nl/public_html/zcrt/cache','If sessions are file based, store them in this directory.',15,1,NULL,'2009-05-30 08:43:46',NULL,NULL),(306,'Cookie Domain','SESSION_USE_FQDN','True','If True the full domain name will be used to store the cookie, e.g. www.mydomain.com. If False only a partial domain name will be used, e.g. mydomain.com. If you are unsure about this, always leave set to true.',15,2,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(307,'Force Cookie Use','SESSION_FORCE_COOKIE_USE','False','Force the use of sessions when cookies are only enabled.',15,2,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(308,'Check SSL Session ID','SESSION_CHECK_SSL_SESSION_ID','False','Validate the SSL_SESSION_ID on every secure HTTPS page request.',15,3,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(309,'Check User Agent','SESSION_CHECK_USER_AGENT','False','Validate the clients browser user agent on every page request.',15,4,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(310,'Check IP Address','SESSION_CHECK_IP_ADDRESS','False','Validate the clients IP address on every page request.',15,5,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(311,'Prevent Spider Sessions','SESSION_BLOCK_SPIDERS','True','Prevent known spiders from starting a session.',15,6,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(312,'Recreate Session','SESSION_RECREATE','True','Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).',15,7,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(313,'IP to Host Conversion Status','SESSION_IP_TO_HOST_ADDRESS','true','Convert IP Address to Host Address<br /><br />Note: on some servers this can slow down the initial start of a session or execution of Emails',15,10,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(314,'Length of the redeem code','SECURITY_CODE_LENGTH','10','Enter the length of the redeem code<br />The longer the more secure',16,1,NULL,'2009-05-30 08:43:46',NULL,NULL),(315,'Default Order Status For Zero Balance Orders','DEFAULT_ZERO_BALANCE_ORDERS_STATUS_ID','2','When an order\'s balance is zero, this order status will be assigned to it.',16,0,NULL,'2009-05-30 08:43:46','zen_get_order_status_name','zen_cfg_pull_down_order_statuses('),(316,'New Signup Discount Coupon ID#','NEW_SIGNUP_DISCOUNT_COUPON','','Select the coupon<br />',16,75,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_coupon_id('),(317,'New Signup Gift Voucher Amount','NEW_SIGNUP_GIFT_VOUCHER_AMOUNT','','Leave blank for none<br />Or enter an amount ie. 10 for $10.00',16,76,NULL,'2009-05-30 08:43:46',NULL,NULL),(318,'Maximum Discount Coupons Per Page','MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS','20','Number of Discount Coupons to list per Page',16,81,NULL,'2009-05-30 08:43:46',NULL,NULL),(319,'Maximum Discount Coupon Report Results Per Page','MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS_REPORTS','20','Number of Discount Coupons to list on Reports Page',16,81,NULL,'2009-05-30 08:43:46',NULL,NULL),(320,'Credit Card Enable Status - VISA','CC_ENABLED_VISA','1','Accept VISA 0= off 1= on',17,1,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(321,'Credit Card Enable Status - MasterCard','CC_ENABLED_MC','1','Accept MasterCard 0= off 1= on',17,2,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(322,'Credit Card Enable Status - AmericanExpress','CC_ENABLED_AMEX','0','Accept AmericanExpress 0= off 1= on',17,3,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(323,'Credit Card Enable Status - Diners Club','CC_ENABLED_DINERS_CLUB','0','Accept Diners Club 0= off 1= on',17,4,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(324,'Credit Card Enable Status - Discover Card','CC_ENABLED_DISCOVER','0','Accept Discover Card 0= off 1= on',17,5,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(325,'Credit Card Enable Status - JCB','CC_ENABLED_JCB','0','Accept JCB 0= off 1= on',17,6,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(326,'Credit Card Enable Status - AUSTRALIAN BANKCARD','CC_ENABLED_AUSTRALIAN_BANKCARD','0','Accept AUSTRALIAN BANKCARD 0= off 1= on',17,7,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(327,'Credit Card Enable Status - SOLO','CC_ENABLED_SOLO','0','Accept SOLO Card 0= off 1= on',17,8,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(328,'Credit Card Enable Status - Switch','CC_ENABLED_SWITCH','0','Accept SWITCH Card 0= off 1= on',17,9,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(329,'Credit Card Enable Status - Maestro','CC_ENABLED_MAESTRO','0','Accept MAESTRO Card 0= off 1= on',17,10,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(330,'Credit Card Enabled - Show on Payment','SHOW_ACCEPTED_CREDIT_CARDS','0','Show accepted credit cards on Payment page?<br />0= off<br />1= As Text<br />2= As Images<br /><br />Note: images and text must be defined in both the database and language file for specific credit card types.',17,50,NULL,'2009-05-30 08:43:46',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(331,'This module is installed','MODULE_ORDER_TOTAL_GV_STATUS','true','',6,1,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'true\'),'),(332,'Sort Order','MODULE_ORDER_TOTAL_GV_SORT_ORDER','840','Sort order of display.',6,2,NULL,'2003-10-30 22:16:40',NULL,NULL),(333,'Queue Purchases','MODULE_ORDER_TOTAL_GV_QUEUE','true','Do you want to queue purchases of the Gift Voucher?',6,3,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(334,'Include Shipping','MODULE_ORDER_TOTAL_GV_INC_SHIPPING','true','Include Shipping in calculation',6,5,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(335,'Include Tax','MODULE_ORDER_TOTAL_GV_INC_TAX','true','Include Tax in calculation.',6,6,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(336,'Re-calculate Tax','MODULE_ORDER_TOTAL_GV_CALC_TAX','None','Re-Calculate Tax',6,7,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'),'),(337,'Tax Class','MODULE_ORDER_TOTAL_GV_TAX_CLASS','0','Use the following tax class when treating Gift Voucher as Credit Note.',6,0,NULL,'2003-10-30 22:16:40','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes('),(338,'Credit including Tax','MODULE_ORDER_TOTAL_GV_CREDIT_TAX','false','Add tax to purchased Gift Voucher when crediting to Account',6,8,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(339,'Set Order Status','MODULE_ORDER_TOTAL_GV_ORDER_STATUS_ID','0','Set the status of orders made where GV covers full payment',6,0,NULL,'2009-05-30 08:43:47','zen_get_order_status_name','zen_cfg_pull_down_order_statuses('),(349,'This module is installed','MODULE_ORDER_TOTAL_SHIPPING_STATUS','true','',6,1,NULL,'2003-10-30 22:16:46',NULL,'zen_cfg_select_option(array(\'true\'),'),(350,'Sort Order','MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER','200','Sort order of display.',6,2,NULL,'2003-10-30 22:16:46',NULL,NULL),(351,'Allow Free Shipping','MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING','false','Do you want to allow free shipping?',6,3,NULL,'2003-10-30 22:16:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(352,'Free Shipping For Orders Over','MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER','50','Provide free shipping for orders over the set amount.',6,4,NULL,'2003-10-30 22:16:46','currencies->format',NULL),(353,'Provide Free Shipping For Orders Made','MODULE_ORDER_TOTAL_SHIPPING_DESTINATION','national','Provide free shipping for orders sent to the set destination.',6,5,NULL,'2003-10-30 22:16:46',NULL,'zen_cfg_select_option(array(\'national\', \'international\', \'both\'),'),(354,'This module is installed','MODULE_ORDER_TOTAL_SUBTOTAL_STATUS','true','',6,1,NULL,'2003-10-30 22:16:49',NULL,'zen_cfg_select_option(array(\'true\'),'),(355,'Sort Order','MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER','100','Sort order of display.',6,2,NULL,'2003-10-30 22:16:49',NULL,NULL),(356,'This module is installed','MODULE_ORDER_TOTAL_TAX_STATUS','true','',6,1,NULL,'2003-10-30 22:16:52',NULL,'zen_cfg_select_option(array(\'true\'),'),(357,'Sort Order','MODULE_ORDER_TOTAL_TAX_SORT_ORDER','300','Sort order of display.',6,2,NULL,'2003-10-30 22:16:52',NULL,NULL),(358,'This module is installed','MODULE_ORDER_TOTAL_TOTAL_STATUS','true','',6,1,NULL,'2003-10-30 22:16:55',NULL,'zen_cfg_select_option(array(\'true\'),'),(359,'Sort Order','MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER','999','Sort order of display.',6,2,NULL,'2003-10-30 22:16:55',NULL,NULL),(360,'Tax Class','MODULE_ORDER_TOTAL_COUPON_TAX_CLASS','0','Use the following tax class when treating Discount Coupon as Credit Note.',6,0,NULL,'2003-10-30 22:16:36','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes('),(361,'Include Tax','MODULE_ORDER_TOTAL_COUPON_INC_TAX','false','Include Tax in calculation.',6,6,NULL,'2003-10-30 22:16:36',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(362,'Sort Order','MODULE_ORDER_TOTAL_COUPON_SORT_ORDER','280','Sort order of display.',6,2,NULL,'2003-10-30 22:16:36',NULL,NULL),(363,'Include Shipping','MODULE_ORDER_TOTAL_COUPON_INC_SHIPPING','false','Include Shipping in calculation',6,5,NULL,'2003-10-30 22:16:36',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(364,'This module is installed','MODULE_ORDER_TOTAL_COUPON_STATUS','true','',6,1,NULL,'2003-10-30 22:16:36',NULL,'zen_cfg_select_option(array(\'true\'),'),(365,'Re-calculate Tax','MODULE_ORDER_TOTAL_COUPON_CALC_TAX','Standard','Re-Calculate Tax',6,7,NULL,'2003-10-30 22:16:36',NULL,'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'),'),(366,'Admin Demo Status','ADMIN_DEMO','0','Admin Demo should be on?<br />0= off 1= on',6,0,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(367,'Product option type Select','PRODUCTS_OPTIONS_TYPE_SELECT','0','The number representing the Select type of product option.',0,NULL,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,NULL),(368,'Text product option type','PRODUCTS_OPTIONS_TYPE_TEXT','1','Numeric value of the text product option type',6,NULL,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,NULL),(369,'Radio button product option type','PRODUCTS_OPTIONS_TYPE_RADIO','2','Numeric value of the radio button product option type',6,NULL,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,NULL),(370,'Check box product option type','PRODUCTS_OPTIONS_TYPE_CHECKBOX','3','Numeric value of the check box product option type',6,NULL,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,NULL),(371,'File product option type','PRODUCTS_OPTIONS_TYPE_FILE','4','Numeric value of the file product option type',6,NULL,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,NULL),(372,'ID for text and file products options values','PRODUCTS_OPTIONS_VALUES_TEXT_ID','0','Numeric value of the products_options_values_id used by the text and file attributes.',6,NULL,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,NULL),(373,'Upload prefix','UPLOAD_PREFIX','upload_','Prefix used to differentiate between upload options and other options',0,NULL,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,NULL),(374,'Text prefix','TEXT_PREFIX','txt_','Prefix used to differentiate between text option values and other option values',0,NULL,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,NULL),(375,'Read Only option type','PRODUCTS_OPTIONS_TYPE_READONLY','5','Numeric value of the file product option type',6,NULL,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,NULL),(376,'Products Info - Products Option Name Sort Order','PRODUCTS_OPTIONS_SORT_ORDER','0','Sort order of Option Names for Products Info<br />0= Sort Order, Option Name<br />1= Option Name',18,35,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(377,'Products Info - Product Option Value of Attributes Sort Order','PRODUCTS_OPTIONS_SORT_BY_PRICE','1','Sort order of Product Option Values of Attributes for Products Info<br />0= Sort Order, Price<br />1= Sort Order, Option Value Name',18,36,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(378,'Product Info - Show Option Values Name Below Attributes Image','PRODUCT_IMAGES_ATTRIBUTES_NAMES','1','Product Info - Show the name of the Option Value beneath the Attribute Image?<br />0= off 1= on',18,41,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(379,'Product Info - Show Sales Discount Savings Status','SHOW_SALE_DISCOUNT_STATUS','1','Product Info - Show the amount of discount savings?<br />0= off 1= on',18,45,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(380,'Product Info - Show Sales Discount Savings Dollars or Percentage','SHOW_SALE_DISCOUNT','1','Product Info - Show the amount of discount savings display as:<br />1= % off 2= $amount off',18,46,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'1\', \'2\'), '),(381,'Product Info - Show Sales Discount Savings Percentage Decimals','SHOW_SALE_DISCOUNT_DECIMALS','0','Product Info - Show discount savings display as a Percentage with how many decimals?:<br />Default= 0',18,47,NULL,'2009-05-30 08:43:47',NULL,NULL),(382,'Product Info - Price is Free Image or Text Status','OTHER_IMAGE_PRICE_IS_FREE_ON','1','Product Info - Show the Price is Free Image or Text on Displayed Price<br />0= Text<br />1= Image',18,50,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(383,'Product Info - Price is Call for Price Image or Text Status','PRODUCTS_PRICE_IS_CALL_IMAGE_ON','1','Product Info - Show the Price is Call for Price Image or Text on Displayed Price<br />0= Text<br />1= Image',18,51,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(384,'Product Quantity Box Status - Adding New Products','PRODUCTS_QTY_BOX_STATUS','1','What should the Default Quantity Box Status be set to when adding New Products?<br /><br />0= off<br />1= on<br />NOTE: This will show a Qty Box when ON and default the Add to Cart to 1',18,55,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(385,'Product Reviews Require Approval','REVIEWS_APPROVAL','1','Do product reviews require approval?<br /><br />Note: When Review Status is off, it will also not show<br /><br />0= off 1= on',18,62,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(386,'Meta Tags - Include Product Model in Title','META_TAG_INCLUDE_MODEL','1','Do you want to include the Product Model in the Meta Tag Title?<br /><br />0= off 1= on',18,69,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(387,'Meta Tags - Include Product Price in Title','META_TAG_INCLUDE_PRICE','1','Do you want to include the Product Price in the Meta Tag Title?<br /><br />0= off 1= on',18,70,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(388,'Meta Tags Generated Description Maximum Length?','MAX_META_TAG_DESCRIPTION_LENGTH','50','Set Generated Meta Tag Description Maximum Length to (words) Default 50:',18,71,NULL,'2009-05-30 08:43:47','',''),(389,'Also Purchased Products Columns per Row','SHOW_PRODUCT_INFO_COLUMNS_ALSO_PURCHASED_PRODUCTS','3','Also Purchased Products Columns per Row<br />0= off or set the sort order',18,72,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), '),(390,'Previous Next - Navigation Bar Position','PRODUCT_INFO_PREVIOUS_NEXT','1','Location of Previous/Next Navigation Bar<br />0= off<br />1= Top of Page<br />2= Bottom of Page<br />3= Both Top and Bottom of Page',18,21,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Off\'), array(\'id\'=>\'1\', \'text\'=>\'Top of Page\'), array(\'id\'=>\'2\', \'text\'=>\'Bottom of Page\'), array(\'id\'=>\'3\', \'text\'=>\'Both Top & Bottom of Page\')),'),(391,'Previous Next - Sort Order','PRODUCT_INFO_PREVIOUS_NEXT_SORT','1','Products Display Order by<br />0= Product ID<br />1= Product Name<br />2= Model<br />3= Price, Product Name<br />4= Price, Model<br />5= Product Name, Model<br />6= Product Sort Order',18,22,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Product ID\'), array(\'id\'=>\'1\', \'text\'=>\'Name\'), array(\'id\'=>\'2\', \'text\'=>\'Product Model\'), array(\'id\'=>\'3\', \'text\'=>\'Product Price - Name\'), array(\'id\'=>\'4\', \'text\'=>\'Product Price - Model\'), array(\'id\'=>\'5\', \'text\'=>\'Product Name - Model\'), array(\'id\'=>\'6\', \'text\'=>\'Product Sort Order\')),'),(392,'Previous Next - Button and Image Status','SHOW_PREVIOUS_NEXT_STATUS','0','Button and Product Image status settings are:<br />0= Off<br />1= On',18,20,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Off\'), array(\'id\'=>\'1\', \'text\'=>\'On\')),'),(393,'Previous Next - Button and Image Settings','SHOW_PREVIOUS_NEXT_IMAGES','0','Show Previous/Next Button and Product Image Settings<br />0= Button Only<br />1= Button and Product Image<br />2= Product Image Only',18,21,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Button Only\'), array(\'id\'=>\'1\', \'text\'=>\'Button and Product Image\'), array(\'id\'=>\'2\', \'text\'=>\'Product Image Only\')),'),(394,'Previous Next - Image Width?','PREVIOUS_NEXT_IMAGE_WIDTH','50','Previous/Next Image Width?',18,22,NULL,'2009-05-30 08:43:47','',''),(395,'Previous Next - Image Height?','PREVIOUS_NEXT_IMAGE_HEIGHT','40','Previous/Next Image Height?',18,23,NULL,'2009-05-30 08:43:47','',''),(396,'Previous Next - Navigation Includes Category Position','PRODUCT_INFO_CATEGORIES','1','Product\'s Category Image and Name Alignment Above Previous/Next Navigation Bar<br />0= off<br />1= Align Left<br />2= Align Center<br />3= Align Right',18,20,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Off\'), array(\'id\'=>\'1\', \'text\'=>\'Align Left\'), array(\'id\'=>\'2\', \'text\'=>\'Align Center\'), array(\'id\'=>\'3\', \'text\'=>\'Align Right\')),'),(397,'Previous Next - Navigation Includes Category Name and Image Status','PRODUCT_INFO_CATEGORIES_IMAGE_STATUS','2','Product\'s Category Image and Name Status<br />0= Category Name and Image always shows<br />1= Category Name only<br />2= Category Name and Image when not blank',18,20,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Category Name and Image Always\'), array(\'id\'=>\'1\', \'text\'=>\'Category Name only\'), array(\'id\'=>\'2\', \'text\'=>\'Category Name and Image when not blank\')),'),(398,'Column Width - Left Boxes','BOX_WIDTH_LEFT','150px','Width of the Left Column Boxes<br />px may be included<br />Default = 150px',19,1,NULL,'2003-11-21 22:16:36',NULL,NULL),(399,'Column Width - Right Boxes','BOX_WIDTH_RIGHT','150px','Width of the Right Column Boxes<br />px may be included<br />Default = 150px',19,2,NULL,'2003-11-21 22:16:36',NULL,NULL),(400,'Bread Crumbs Navigation Separator','BREAD_CRUMBS_SEPARATOR','&nbsp;::&nbsp;','Enter the separator symbol to appear between the Navigation Bread Crumb trail<br />Note: Include spaces with the &amp;nbsp; symbol if you want them part of the separator.<br />Default = &amp;nbsp;::&amp;nbsp;',19,3,NULL,'2003-11-21 22:16:36',NULL,'zen_cfg_textarea_small('),(401,'Define Breadcrumb Status','DEFINE_BREADCRUMB_STATUS','1','Enable the Breadcrumb Trail Links?<br />0= OFF<br />1= ON<br />2= Off for Home Page Only',19,4,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(402,'Bestsellers - Number Padding','BEST_SELLERS_FILLER','&nbsp;','What do you want to Pad the numbers with?<br />Default = &amp;nbsp;',19,5,NULL,'2003-11-21 22:16:36',NULL,'zen_cfg_textarea_small('),(403,'Bestsellers - Truncate Product Names','BEST_SELLERS_TRUNCATE','35','What size do you want to truncate the Product Names?<br />Default = 35',19,6,NULL,'2003-11-21 22:16:36',NULL,NULL),(404,'Bestsellers - Truncate Product Names followed by ...','BEST_SELLERS_TRUNCATE_MORE','true','When truncated Product Names follow with ...<br />Default = true',19,7,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(405,'Categories Box - Show Specials Link','SHOW_CATEGORIES_BOX_SPECIALS','true','Show Specials Link in the Categories Box',19,8,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(406,'Categories Box - Show Products New Link','SHOW_CATEGORIES_BOX_PRODUCTS_NEW','true','Show Products New Link in the Categories Box',19,9,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(407,'Shopping Cart Box Status','SHOW_SHOPPING_CART_BOX_STATUS','1','Shopping Cart Shows<br />0= Always<br />1= Only when full<br />2= Only when full but not when viewing the Shopping Cart',19,10,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(408,'Categories Box - Show Featured Products Link','SHOW_CATEGORIES_BOX_FEATURED_PRODUCTS','true','Show Featured Products Link in the Categories Box',19,11,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(409,'Categories Box - Show Products All Link','SHOW_CATEGORIES_BOX_PRODUCTS_ALL','true','Show Products All Link in the Categories Box',19,12,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(410,'Column Left Status - Global','COLUMN_LEFT_STATUS','1','Show Column Left, unless page override exists?<br />0= Column Left is always off<br />1= Column Left is on, unless page override',19,15,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(411,'Column Right Status - Global','COLUMN_RIGHT_STATUS','1','Show Column Right, unless page override exists?<br />0= Column Right is always off<br />1= Column Right is on, unless page override',19,16,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(412,'Column Width - Left','COLUMN_WIDTH_LEFT','150px','Width of the Left Column<br />px may be included<br />Default = 150px',19,20,NULL,'2003-11-21 22:16:36',NULL,NULL),(413,'Column Width - Right','COLUMN_WIDTH_RIGHT','150px','Width of the Right Column<br />px may be included<br />Default = 150px',19,21,NULL,'2003-11-21 22:16:36',NULL,NULL),(414,'Categories Separator between links Status','SHOW_CATEGORIES_SEPARATOR_LINK','1','Show Category Separator between Category Names and Links?<br />0= off<br />1= on',19,24,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(415,'Categories Separator between the Category Name and Count','CATEGORIES_SEPARATOR','-&gt;','What separator do you want between the Category name and the count?<br />Default = -&amp;gt;',19,25,NULL,'2003-11-21 22:16:36',NULL,'zen_cfg_textarea_small('),(416,'Categories Separator between the Category Name and Sub Categories','CATEGORIES_SEPARATOR_SUBS','|_&nbsp;','What separator do you want between the Category name and Sub Category Name?<br />Default = |_&amp;nbsp;',19,26,NULL,'2004-03-25 22:16:36',NULL,'zen_cfg_textarea_small('),(417,'Categories Count Prefix','CATEGORIES_COUNT_PREFIX','&nbsp;(','What do you want to Prefix the count with?<br />Default= (',19,27,NULL,'2003-01-21 22:16:36',NULL,'zen_cfg_textarea_small('),(418,'Categories Count Suffix','CATEGORIES_COUNT_SUFFIX',')','What do you want as a Suffix to the count?<br />Default= )',19,28,NULL,'2003-01-21 22:16:36',NULL,'zen_cfg_textarea_small('),(419,'Categories SubCategories Indent','CATEGORIES_SUBCATEGORIES_INDENT','&nbsp;&nbsp;','What do you want to use as the subcategories indent?<br />Default= &nbsp;&nbsp;',19,29,NULL,'2004-06-24 22:16:36',NULL,'zen_cfg_textarea_small('),(420,'Categories with 0 Products Status','CATEGORIES_COUNT_ZERO','0','Show Category Count for 0 Products?<br />0= off<br />1= on',19,30,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(421,'Split Categories Box','CATEGORIES_SPLIT_DISPLAY','True','Split the categories box display by product type',19,31,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(422,'Shopping Cart - Show Totals','SHOW_TOTALS_IN_CART','1','Show Totals Above Shopping Cart?<br />0= off<br />1= on: Items Weight Amount<br />2= on: Items Weight Amount, but no weight when 0<br />3= on: Items Amount',19,31,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), '),(423,'Customer Greeting - Show on Index Page','SHOW_CUSTOMER_GREETING','1','Always Show Customer Greeting on Index?<br />0= off<br />1= on',19,40,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(424,'Categories - Always Show on Main Page','SHOW_CATEGORIES_ALWAYS','0','Always Show Categories on Main Page<br />0= off<br />1= on<br />Default category can be set to Top Level or a Specific Top Level',19,45,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(425,'Main Page - Opens with Category','CATEGORIES_START_MAIN','0','0= Top Level Categories<br />Or enter the Category ID#<br />Note: Sub Categories can also be used Example: 3_10',19,46,NULL,'2009-05-30 08:43:47','',''),(426,'Categories - Always Open to Show SubCategories','SHOW_CATEGORIES_SUBCATEGORIES_ALWAYS','1','Always Show Categories and SubCategories<br />0= off, just show Top Categories<br />1= on, Always show Categories and SubCategories when selected',19,47,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(427,'Banner Display Groups - Header Position 1','SHOW_BANNERS_GROUP_SET1','','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 1?<br />Leave blank for none',19,55,NULL,'2009-05-30 08:43:47','',''),(428,'Banner Display Groups - Header Position 2','SHOW_BANNERS_GROUP_SET2','','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 2?<br />Leave blank for none',19,56,NULL,'2009-05-30 08:43:47','',''),(429,'Banner Display Groups - Header Position 3','SHOW_BANNERS_GROUP_SET3','','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 3?<br />Leave blank for none',19,57,NULL,'2009-05-30 08:43:47','',''),(430,'Banner Display Groups - Footer Position 1','SHOW_BANNERS_GROUP_SET4','','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 1?<br />Leave blank for none',19,65,NULL,'2009-05-30 08:43:47','',''),(431,'Banner Display Groups - Footer Position 2','SHOW_BANNERS_GROUP_SET5','','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 2?<br />Leave blank for none',19,66,NULL,'2009-05-30 08:43:47','',''),(432,'Banner Display Groups - Footer Position 3','SHOW_BANNERS_GROUP_SET6','Wide-Banners','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />Default Group is Wide-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 3?<br />Leave blank for none',19,67,NULL,'2009-05-30 08:43:47','',''),(433,'Banner Display Groups - Side Box banner_box','SHOW_BANNERS_GROUP_SET7','SideBox-Banners','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br />Default Group is SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Side Box - banner_box?<br />Leave blank for none',19,70,NULL,'2009-05-30 08:43:47','',''),(434,'Banner Display Groups - Side Box banner_box2','SHOW_BANNERS_GROUP_SET8','SideBox-Banners','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br />Default Group is SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Side Box - banner_box2?<br />Leave blank for none',19,71,NULL,'2009-05-30 08:43:47','',''),(435,'Banner Display Group - Side Box banner_box_all','SHOW_BANNERS_GROUP_SET_ALL','BannersAll','The Banner Display Group may only be from one (1) Banner Group for the Banner All sidebox<br /><br />Default Group is BannersAll<br /><br />What Banner Group do you want to use in the Side Box - banner_box_all?<br />Leave blank for none',19,72,NULL,'2009-05-30 08:43:47','',''),(436,'Footer - Show IP Address status','SHOW_FOOTER_IP','1','Show Customer IP Address in the Footer<br />0= off<br />1= on<br />Should the Customer IP Address show in the footer?',19,80,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(437,'Product Discount Quantities - Add how many blank discounts?','DISCOUNT_QTY_ADD','5','How many blank discount quantities should be added for Product Pricing?',19,90,NULL,'2009-05-30 08:43:47','',''),(438,'Product Discount Quantities - Display how many per row?','DISCOUNT_QUANTITY_PRICES_COLUMN','5','How many discount quantities should show per row on Product Info Pages?',19,95,NULL,'2009-05-30 08:43:47','',''),(439,'Categories/Products Display Sort Order','CATEGORIES_PRODUCTS_SORT_ORDER','0','Categories/Products Display Sort Order<br />0= Categories/Products Sort Order/Name<br />1= Categories/Products Name<br />2= Products Model<br />3= Products Qty+, Products Name<br />4= Products Qty-, Products Name<br />5= Products Price+, Products Name<br />6= Products Price-, Products Name',19,100,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\', \'5\', \'6\'), '),(440,'Option Names and Values Global Add, Copy and Delete Features Status','OPTION_NAMES_VALUES_GLOBAL_STATUS','1','Option Names and Values Global Add, Copy and Delete Features Status<br />0= Hide Features<br />1= Show Features<br />(Default=1)',19,110,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(441,'Categories-Tabs Menu ON/OFF','CATEGORIES_TABS_STATUS','1','Categories-Tabs<br />This enables the display of your store\'s categories as a menu across the top of your header. There are many potential creative uses for this.<br />0= Hide Categories Tabs<br />1= Show Categories Tabs',19,112,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(442,'Site Map - include My Account Links?','SHOW_ACCOUNT_LINKS_ON_SITE_MAP','No','Should the links to My Account show up on the site-map?<br />Note: Spiders will try to index this page, and likely should not be sent to secure pages, since there is no benefit in indexing a login page.<br /><br />Default: false',19,115,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'Yes\', \'No\'), '),(443,'Skip 1-prod Categories','SKIP_SINGLE_PRODUCT_CATEGORIES','True','Skip single-product categories<br />If this option is set to True, then if the customer clicks on a link to a category which only contains a single item, then Zen Cart will take them directly to that product-page, rather than present them with another link to click in order to see the product.<br />Default: True',19,120,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(444,'Use split-login page','USE_SPLIT_LOGIN_MODE','False','The login page can be displayed in two modes: Split or Vertical.<br />In Split mode, the create-account options are accessed by clicking a button to get to the create-account page.  In Vertical mode, the create-account input fields are all displayed inline, below the login field, making one less click for the customer to create their account.<br />Default: False',19,121,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(445,'CSS Buttons','IMAGE_USE_CSS_BUTTONS','No','CSS Buttons<br />Use CSS buttons instead of images (GIF/JPG)?<br />Button styles must be configured in the stylesheet if you enable this option.',19,147,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'No\', \'Yes\'), '),(446,'<strong>Down for Maintenance: ON/OFF</strong>','DOWN_FOR_MAINTENANCE','false','Down for Maintenance <br />(true=on false=off)',20,1,'2013-09-05 17:39:36','2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(447,'Down for Maintenance: filename','DOWN_FOR_MAINTENANCE_FILENAME','down_for_maintenance','Down for Maintenance filename<br />Note: Do not include the extension<br />Default=down_for_maintenance',20,2,NULL,'2009-05-30 08:43:47',NULL,''),(448,'Down for Maintenance: Hide Header','DOWN_FOR_MAINTENANCE_HEADER_OFF','false','Down for Maintenance: Hide Header <br />(true=hide false=show)',20,3,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(449,'Down for Maintenance: Hide Column Left','DOWN_FOR_MAINTENANCE_COLUMN_LEFT_OFF','false','Down for Maintenance: Hide Column Left <br />(true=hide false=show)',20,4,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(450,'Down for Maintenance: Hide Column Right','DOWN_FOR_MAINTENANCE_COLUMN_RIGHT_OFF','false','Down for Maintenance: Hide Column Right <br />(true=hide false=show)',20,5,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(451,'Down for Maintenance: Hide Footer','DOWN_FOR_MAINTENANCE_FOOTER_OFF','false','Down for Maintenance: Hide Footer <br />(true=hide false=show)',20,6,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(452,'Down for Maintenance: Hide Prices','DOWN_FOR_MAINTENANCE_PRICES_OFF','false','Down for Maintenance: Hide Prices <br />(true=hide false=show)',20,7,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(453,'Down For Maintenance (exclude this IP-Address)','EXCLUDE_ADMIN_IP_FOR_MAINTENANCE','your IP (ADMIN)','This IP Address is able to access the website while it is Down For Maintenance (like webmaster)<br />To enter multiple IP Addresses, separate with a comma. If you do not know your IP Address, check in the Footer of your Shop.',20,8,'2003-03-21 13:43:22','2003-03-21 21:20:07',NULL,NULL),(454,'NOTICE PUBLIC Before going Down for Maintenance: ON/OFF','WARN_BEFORE_DOWN_FOR_MAINTENANCE','false','Give a WARNING some time before you put your website Down for Maintenance<br />(true=on false=off)<br />If you set the \'Down For Maintenance: ON/OFF\' to true this will automaticly be updated to false',20,9,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(455,'Date and hours for notice before maintenance','PERIOD_BEFORE_DOWN_FOR_MAINTENANCE','15/05/2003  2-3 PM','Date and hours for notice before maintenance website, enter date and hours for maintenance website',20,10,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,NULL),(456,'Display when webmaster has enabled maintenance','DISPLAY_MAINTENANCE_TIME','false','Display when Webmaster has enabled maintenance <br />(true=on false=off)<br />',20,11,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(457,'Display website maintenance period','DISPLAY_MAINTENANCE_PERIOD','false','Display Website maintenance period <br />(true=on false=off)<br />',20,12,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),'),(458,'Website maintenance period','TEXT_MAINTENANCE_PERIOD_TIME','2h00','Enter Website Maintenance period (hh:mm)',20,13,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,NULL),(459,'Confirm Terms and Conditions During Checkout Procedure','DISPLAY_CONDITIONS_ON_CHECKOUT','false','Show the Terms and Conditions during the checkout procedure which the customer must agree to.',11,1,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(460,'Confirm Privacy Notice During Account Creation Procedure','DISPLAY_PRIVACY_CONDITIONS','false','Show the Privacy Notice during the account creation procedure which the customer must agree to.',11,2,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(461,'Display Product Image','PRODUCT_NEW_LIST_IMAGE','1102','Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,1,NULL,'2009-05-30 08:43:47',NULL,NULL),(462,'Display Product Quantity','PRODUCT_NEW_LIST_QUANTITY','1202','Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,2,NULL,'2009-05-30 08:43:47',NULL,NULL),(463,'Display Product Buy Now Button','PRODUCT_NEW_BUY_NOW','1300','Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,3,NULL,'2009-05-30 08:43:47',NULL,NULL),(464,'Display Product Name','PRODUCT_NEW_LIST_NAME','2101','Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,4,NULL,'2009-05-30 08:43:47',NULL,NULL),(465,'Display Product Model','PRODUCT_NEW_LIST_MODEL','2201','Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,5,NULL,'2009-05-30 08:43:47',NULL,NULL),(466,'Display Product Manufacturer Name','PRODUCT_NEW_LIST_MANUFACTURER','2302','Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,6,NULL,'2009-05-30 08:43:47',NULL,NULL),(467,'Display Product Price','PRODUCT_NEW_LIST_PRICE','2402','Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,7,NULL,'2009-05-30 08:43:47',NULL,NULL),(468,'Display Product Weight','PRODUCT_NEW_LIST_WEIGHT','2502','Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,8,NULL,'2009-05-30 08:43:47',NULL,NULL),(469,'Display Product Date Added','PRODUCT_NEW_LIST_DATE_ADDED','2601','Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,9,NULL,'2009-05-30 08:43:47',NULL,NULL),(470,'Display Product Description','PRODUCT_NEW_LIST_DESCRIPTION','150','How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display',21,10,NULL,'2009-05-30 08:43:47',NULL,NULL),(471,'Display Product Display - Default Sort Order','PRODUCT_NEW_LIST_SORT_DEFAULT','6','What Sort Order Default should be used for New Products Display?<br />Default= 6 for Date New to Old<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order',21,11,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), '),(472,'Default Products New Group ID','PRODUCT_NEW_LIST_GROUP_ID','21','Warning: Only change this if your Products New Group ID has changed from the default of 21<br />What is the configuration_group_id for New Products Listings?',21,12,NULL,'2009-05-30 08:43:47',NULL,NULL),(473,'Display Multiple Products Qty Box Status and Set Button Location','PRODUCT_NEW_LISTING_MULTIPLE_ADD_TO_CART','3','Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both',21,25,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), '),(474,'Mask Upcoming Products from being include as New Products','SHOW_NEW_PRODUCTS_UPCOMING_MASKED','0','Do you want to mask Upcoming Products from being included as New Products in Listing, Sideboxes and Centerbox?<br />0= off<br />1= on',21,30,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(475,'Display Product Image','PRODUCT_FEATURED_LIST_IMAGE','1102','Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,1,NULL,'2009-05-30 08:43:47',NULL,NULL),(476,'Display Product Quantity','PRODUCT_FEATURED_LIST_QUANTITY','1202','Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,2,NULL,'2009-05-30 08:43:47',NULL,NULL),(477,'Display Product Buy Now Button','PRODUCT_FEATURED_BUY_NOW','1300','Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,3,NULL,'2009-05-30 08:43:47',NULL,NULL),(478,'Display Product Name','PRODUCT_FEATURED_LIST_NAME','2101','Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,4,NULL,'2009-05-30 08:43:47',NULL,NULL),(479,'Display Product Model','PRODUCT_FEATURED_LIST_MODEL','2201','Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,5,NULL,'2009-05-30 08:43:47',NULL,NULL),(480,'Display Product Manufacturer Name','PRODUCT_FEATURED_LIST_MANUFACTURER','2302','Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,6,NULL,'2009-05-30 08:43:47',NULL,NULL),(481,'Display Product Price','PRODUCT_FEATURED_LIST_PRICE','2402','Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,7,NULL,'2009-05-30 08:43:47',NULL,NULL),(482,'Display Product Weight','PRODUCT_FEATURED_LIST_WEIGHT','2502','Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,8,NULL,'2009-05-30 08:43:47',NULL,NULL),(483,'Display Product Date Added','PRODUCT_FEATURED_LIST_DATE_ADDED','2601','Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,9,NULL,'2009-05-30 08:43:47',NULL,NULL),(484,'Display Product Description','PRODUCT_FEATURED_LIST_DESCRIPTION','150','How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display',22,10,NULL,'2009-05-30 08:43:47',NULL,NULL),(485,'Display Product Display - Default Sort Order','PRODUCT_FEATURED_LIST_SORT_DEFAULT','1','What Sort Order Default should be used for Featured Product Display?<br />Default= 1 for Product Name<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order',22,11,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), '),(486,'Default Featured Products Group ID','PRODUCT_FEATURED_LIST_GROUP_ID','22','Warning: Only change this if your Featured Products Group ID has changed from the default of 22<br />What is the configuration_group_id for Featured Products Listings?',22,12,NULL,'2009-05-30 08:43:47',NULL,NULL),(487,'Display Multiple Products Qty Box Status and Set Button Location','PRODUCT_FEATURED_LISTING_MULTIPLE_ADD_TO_CART','3','Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both',22,25,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), '),(488,'Display Product Image','PRODUCT_ALL_LIST_IMAGE','1102','Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,1,NULL,'2009-05-30 08:43:47',NULL,NULL),(489,'Display Product Quantity','PRODUCT_ALL_LIST_QUANTITY','1202','Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,2,NULL,'2009-05-30 08:43:47',NULL,NULL),(490,'Display Product Buy Now Button','PRODUCT_ALL_BUY_NOW','1300','Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,3,NULL,'2009-05-30 08:43:47',NULL,NULL),(491,'Display Product Name','PRODUCT_ALL_LIST_NAME','2101','Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,4,NULL,'2009-05-30 08:43:47',NULL,NULL),(492,'Display Product Model','PRODUCT_ALL_LIST_MODEL','2201','Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,5,NULL,'2009-05-30 08:43:47',NULL,NULL),(493,'Display Product Manufacturer Name','PRODUCT_ALL_LIST_MANUFACTURER','2302','Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,6,NULL,'2009-05-30 08:43:47',NULL,NULL),(494,'Display Product Price','PRODUCT_ALL_LIST_PRICE','2402','Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,7,NULL,'2009-05-30 08:43:47',NULL,NULL),(495,'Display Product Weight','PRODUCT_ALL_LIST_WEIGHT','2502','Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,8,NULL,'2009-05-30 08:43:47',NULL,NULL),(496,'Display Product Date Added','PRODUCT_ALL_LIST_DATE_ADDED','2601','Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,9,NULL,'2009-05-30 08:43:47',NULL,NULL),(497,'Display Product Description','PRODUCT_ALL_LIST_DESCRIPTION','150','How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display',23,10,NULL,'2009-05-30 08:43:47',NULL,NULL),(498,'Display Product Display - Default Sort Order','PRODUCT_ALL_LIST_SORT_DEFAULT','1','What Sort Order Default should be used for All Products Display?<br />Default= 1 for Product Name<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order',23,11,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), '),(499,'Default Products All Group ID','PRODUCT_ALL_LIST_GROUP_ID','23','Warning: Only change this if your Products All Group ID has changed from the default of 23<br />What is the configuration_group_id for Products All Listings?',23,12,NULL,'2009-05-30 08:43:47',NULL,NULL),(500,'Display Multiple Products Qty Box Status and Set Button Location','PRODUCT_ALL_LISTING_MULTIPLE_ADD_TO_CART','3','Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both',23,25,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), '),(501,'Show New Products on Main Page','SHOW_PRODUCT_INFO_MAIN_NEW_PRODUCTS','1','Show New Products on Main Page<br />0= off or set the sort order',24,65,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(502,'Show Featured Products on Main Page','SHOW_PRODUCT_INFO_MAIN_FEATURED_PRODUCTS','2','Show Featured Products on Main Page<br />0= off or set the sort order',24,66,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(503,'Show Special Products on Main Page','SHOW_PRODUCT_INFO_MAIN_SPECIALS_PRODUCTS','3','Show Special Products on Main Page<br />0= off or set the sort order',24,67,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(504,'Show Upcoming Products on Main Page','SHOW_PRODUCT_INFO_MAIN_UPCOMING','4','Show Upcoming Products on Main Page<br />0= off or set the sort order',24,68,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(505,'Show New Products on Main Page - Category with SubCategories','SHOW_PRODUCT_INFO_CATEGORY_NEW_PRODUCTS','1','Show New Products on Main Page - Category with SubCategories<br />0= off or set the sort order',24,70,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(506,'Show Featured Products on Main Page - Category with SubCategories','SHOW_PRODUCT_INFO_CATEGORY_FEATURED_PRODUCTS','2','Show Featured Products on Main Page - Category with SubCategories<br />0= off or set the sort order',24,71,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(507,'Show Special Products on Main Page - Category with SubCategories','SHOW_PRODUCT_INFO_CATEGORY_SPECIALS_PRODUCTS','3','Show Special Products on Main Page - Category with SubCategories<br />0= off or set the sort order',24,72,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(508,'Show Upcoming Products on Main Page - Category with SubCategories','SHOW_PRODUCT_INFO_CATEGORY_UPCOMING','4','Show Upcoming Products on Main Page - Category with SubCategories<br />0= off or set the sort order',24,73,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(509,'Show New Products on Main Page - Errors and Missing Products Page','SHOW_PRODUCT_INFO_MISSING_NEW_PRODUCTS','1','Show New Products on Main Page - Errors and Missing Product<br />0= off or set the sort order',24,75,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(510,'Show Featured Products on Main Page - Errors and Missing Products Page','SHOW_PRODUCT_INFO_MISSING_FEATURED_PRODUCTS','2','Show Featured Products on Main Page - Errors and Missing Product<br />0= off or set the sort order',24,76,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(511,'Show Special Products on Main Page - Errors and Missing Products Page','SHOW_PRODUCT_INFO_MISSING_SPECIALS_PRODUCTS','3','Show Special Products on Main Page - Errors and Missing Product<br />0= off or set the sort order',24,77,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(512,'Show Upcoming Products on Main Page - Errors and Missing Products Page','SHOW_PRODUCT_INFO_MISSING_UPCOMING','4','Show Upcoming Products on Main Page - Errors and Missing Product<br />0= off or set the sort order',24,78,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(513,'Show New Products - below Product Listing','SHOW_PRODUCT_INFO_LISTING_BELOW_NEW_PRODUCTS','1','Show New Products below Product Listing<br />0= off or set the sort order',24,85,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(514,'Show Featured Products - below Product Listing','SHOW_PRODUCT_INFO_LISTING_BELOW_FEATURED_PRODUCTS','2','Show Featured Products below Product Listing<br />0= off or set the sort order',24,86,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(515,'Show Special Products - below Product Listing','SHOW_PRODUCT_INFO_LISTING_BELOW_SPECIALS_PRODUCTS','3','Show Special Products below Product Listing<br />0= off or set the sort order',24,87,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(516,'Show Upcoming Products - below Product Listing','SHOW_PRODUCT_INFO_LISTING_BELOW_UPCOMING','4','Show Upcoming Products below Product Listing<br />0= off or set the sort order',24,88,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), '),(517,'New Products Columns per Row','SHOW_PRODUCT_INFO_COLUMNS_NEW_PRODUCTS','3','New Products Columns per Row',24,95,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), '),(518,'Featured Products Columns per Row','SHOW_PRODUCT_INFO_COLUMNS_FEATURED_PRODUCTS','3','Featured Products Columns per Row',24,96,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), '),(519,'Special Products Columns per Row','SHOW_PRODUCT_INFO_COLUMNS_SPECIALS_PRODUCTS','3','Special Products Columns per Row',24,97,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), '),(520,'Filter Product Listing for Current Top Level Category When Enabled','SHOW_PRODUCT_INFO_ALL_PRODUCTS','1','Filter the products when Product Listing is enabled for current Main Category or show products from all categories?<br />0= Filter Off 1=Filter On ',24,100,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), '),(521,'Define Main Page Status','DEFINE_MAIN_PAGE_STATUS','1','Enable the Defined Main Page Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,60,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(522,'Define Contact Us Status','DEFINE_CONTACT_US_STATUS','1','Enable the Defined Contact Us Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,61,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(523,'Define Privacy Status','DEFINE_PRIVACY_STATUS','1','Enable the Defined Privacy Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,62,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(524,'Define Shipping & Returns','DEFINE_SHIPPINGINFO_STATUS','1','Enable the Defined Shipping & Returns Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,63,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(525,'Define Conditions of Use','DEFINE_CONDITIONS_STATUS','1','Enable the Defined Conditions of Use Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,64,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(526,'Define Checkout Success','DEFINE_CHECKOUT_SUCCESS_STATUS','1','Enable the Defined Checkout Success Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,65,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(527,'Define Discount Coupon','DEFINE_DISCOUNT_COUPON_STATUS','1','Enable the Defined Discount Coupon Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,66,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(528,'Define Site Map Status','DEFINE_SITE_MAP_STATUS','1','Enable the Defined Site Map Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,67,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(529,'Define Page-Not-Found Status','DEFINE_PAGE_NOT_FOUND_STATUS','1','Enable the Defined Page-Not-Found Text from define-pages?<br />0= Define Text OFF<br />1= Define Text ON',25,67,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(530,'Define Page 2','DEFINE_PAGE_2_STATUS','1','Enable the Defined Page 2 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,82,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(531,'Define Page 3','DEFINE_PAGE_3_STATUS','1','Enable the Defined Page 3 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,83,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(532,'Define Page 4','DEFINE_PAGE_4_STATUS','1','Enable the Defined Page 4 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,84,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),'),(533,'EZ-Pages Display Status - HeaderBar','EZPAGES_STATUS_HEADER','1','Display of EZ-Pages content can be Globally enabled/disabled for the Header Bar<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public',30,10,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(534,'EZ-Pages Display Status - FooterBar','EZPAGES_STATUS_FOOTER','1','Display of EZ-Pages content can be Globally enabled/disabled for the Footer Bar<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public',30,11,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(535,'EZ-Pages Display Status - Sidebox','EZPAGES_STATUS_SIDEBOX','1','Display of EZ-Pages content can be Globally enabled/disabled for the Sidebox<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public',30,12,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(536,'EZ-Pages Header Link Separator','EZPAGES_SEPARATOR_HEADER','&nbsp;::&nbsp;','EZ-Pages Header Link Separator<br />Default = &amp;nbsp;::&amp;nbsp;',30,20,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_textarea_small('),(537,'EZ-Pages Footer Link Separator','EZPAGES_SEPARATOR_FOOTER','&nbsp;::&nbsp;','EZ-Pages Footer Link Separator<br />Default = &amp;nbsp;::&amp;nbsp;',30,21,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_textarea_small('),(538,'EZ-Pages Prev/Next Buttons','EZPAGES_SHOW_PREV_NEXT_BUTTONS','2','Display Prev/Continue/Next buttons on EZ-Pages pages?<br />0=OFF (no buttons)<br />1=\"Continue\"<br />2=\"Prev/Continue/Next\"<br /><br />Default setting: 2.',30,30,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), '),(539,'EZ-Pages Table of Contents for Chapters Status','EZPAGES_SHOW_TABLE_CONTENTS','1','Enable EZ-Pages Table of Contents for Chapters?<br />0= OFF<br />1= ON',30,35,'2009-05-30 08:43:47','2009-05-30 08:43:47',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),'),(540,'EZ-Pages Pages to disable headers','EZPAGES_DISABLE_HEADER_DISPLAY_LIST','','EZ-Pages \"pages\" on which to NOT display the normal \"header\" for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 1,5,2<br />or leave blank.',30,40,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_textarea_small('),(541,'EZ-Pages Pages to disable footers','EZPAGES_DISABLE_FOOTER_DISPLAY_LIST','','EZ-Pages \"pages\" on which to NOT display the normal \"footer\" for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 3,7<br />or leave blank.',30,41,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_textarea_small('),(542,'EZ-Pages Pages to disable left-column','EZPAGES_DISABLE_LEFTCOLUMN_DISPLAY_LIST','','EZ-Pages \"pages\" on which to NOT display the normal \"left\" column (of sideboxes) for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 21<br />or leave blank.',30,42,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_textarea_small('),(543,'EZ-Pages Pages to disable right-column','EZPAGES_DISABLE_RIGHTCOLUMN_DISPLAY_LIST','','EZ-Pages \"pages\" on which to NOT display the normal \"right\" column (of sideboxes) for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 3,82,13<br />or leave blank.',30,43,NULL,'2009-05-30 08:43:47',NULL,'zen_cfg_textarea_small('),(544,'Show Split Tax Lines','SHOW_SPLIT_TAX_CHECKOUT','false','If multiple tax rates apply, show each rate as a separate line at checkout',1,22,NULL,'2011-12-30 23:56:11',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), '),(545,'Use root path for cookie path','SESSION_USE_ROOT_COOKIE_PATH','False','Normally Zen Cart will use the directory that a store resides in as the cookie path. This can cause problems with some servers. This setting allows you to set the cookie path to the root of the server, rather than the store directory. It should only be used if you have problems with sessions. <strong>Default Value = False</strong><br /><br /><strong>Changing this setting may mean you have problems logging into your admin, you should clear your browser cookies to overcome this.</strong>',15,999,NULL,'0001-01-01 00:00:00',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(546,'Add period prefix to cookie domain','SESSION_ADD_PERIOD_PREFIX','True','Normally Zen Cart will add a period prefix to the cookie domain, e.g.  .www.mydomain.com. This can sometimes cause problems with some server configurations. If you are having session problems you may want to try setting this to False. <strong>Default Value = True</strong>',15,999,NULL,'0001-01-01 00:00:00',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(547,'Telephone - Customer Service','STORE_TELEPHONE_CUSTSERVICE','','Enter a telephone number for customers to zc_reach your Customer Service department. This number may be sent as part of payment transaction details.',1,7,NULL,'2011-12-30 23:57:31',NULL,NULL),(548,'login mode https','SSLPWSTATUSCHECK','','System setting. Do not edit.',6,99,NULL,'2011-12-30 23:57:31',NULL,NULL),(549,'Enable Zones Method','MODULE_SHIPPING_ZONES_STATUS','True','Do you want to offer zone rate shipping?',6,0,NULL,'2013-09-06 12:23:07',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), '),(550,'Calculation Method','MODULE_SHIPPING_ZONES_METHOD','Price','Calculate cost based on Weight, Price or Item?',6,0,NULL,'2013-09-06 12:23:07',NULL,'zen_cfg_select_option(array(\'Weight\', \'Price\', \'Item\'), '),(551,'Tax Class','MODULE_SHIPPING_ZONES_TAX_CLASS','2','Use the following tax class on the shipping fee.',6,0,NULL,'2013-09-06 12:23:07','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes('),(552,'Tax Basis','MODULE_SHIPPING_ZONES_TAX_BASIS','Shipping','On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone',6,0,NULL,'2013-09-06 12:23:07',NULL,'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), '),(553,'Sort Order','MODULE_SHIPPING_ZONES_SORT_ORDER','1','Sort order of display.',6,0,NULL,'2013-09-06 12:23:07',NULL,NULL),(554,'Skip Countries, use a comma separated list of the two character ISO country codes','MODULE_SHIPPING_ZONES_SKIPPED','','Disable for the following Countries:',6,0,NULL,'2013-09-06 12:23:07',NULL,'zen_cfg_textarea('),(555,'Zone 1 Countries','MODULE_SHIPPING_ZONES_COUNTRIES_1','NL,BE,DE','Comma separated list of two character ISO country codes that are part of Zone 1.<br />Set as 00 to indicate all two character ISO country codes that are not specifically defined.',6,0,NULL,'2013-09-06 12:23:07',NULL,'zen_cfg_textarea('),(556,'Zone 1 Shipping Table','MODULE_SHIPPING_ZONES_COST_1','100:5.67226','Shipping rates to Zone 1 destinations based on a group of maximum order weights/prices. Example: 3:8.50,7:10.50,... Weight/Price less than or equal to 3 would cost 8.50 for Zone 1 destinations.<br />You can also use percentage amounts, such 25:8.50,35:5%,40:9.50,10000:7% to charge a percentage value of the Order Total',6,0,NULL,'2013-09-06 12:23:07',NULL,'zen_cfg_textarea('),(557,'Zone 1 Handling Fee','MODULE_SHIPPING_ZONES_HANDLING_1','0','Handling Fee for this shipping zone',6,0,NULL,'2013-09-06 12:23:07',NULL,NULL),(558,'Handling Per Order or Per Box Zone 1 (when by weight)','MODULE_SHIPPING_ZONES_HANDLING_METHOD_1','Order','Do you want to charge Handling Fee Per Order or Per Box?',6,0,NULL,'2013-09-06 12:23:07',NULL,'zen_cfg_select_option(array(\'Order\', \'Box\'), '),(559,'Zone 2 Countries','MODULE_SHIPPING_ZONES_COUNTRIES_2','','Comma separated list of two character ISO country codes that are part of Zone 2.<br />Set as 00 to indicate all two character ISO country codes that are not specifically defined.',6,0,NULL,'2013-09-06 12:23:07',NULL,'zen_cfg_textarea('),(560,'Zone 2 Shipping Table','MODULE_SHIPPING_ZONES_COST_2','','Shipping rates to Zone 2 destinations based on a group of maximum order weights/prices. Example: 3:8.50,7:10.50,... Weight/Price less than or equal to 3 would cost 8.50 for Zone 2 destinations.<br />You can also use percentage amounts, such 25:8.50,35:5%,40:9.50,10000:7% to charge a percentage value of the Order Total',6,0,NULL,'2013-09-06 12:23:07',NULL,'zen_cfg_textarea('),(561,'Zone 2 Handling Fee','MODULE_SHIPPING_ZONES_HANDLING_2','0','Handling Fee for this shipping zone',6,0,NULL,'2013-09-06 12:23:07',NULL,NULL),(562,'Handling Per Order or Per Box Zone 2 (when by weight)','MODULE_SHIPPING_ZONES_HANDLING_METHOD_2','Order','Do you want to charge Handling Fee Per Order or Per Box?',6,0,NULL,'2013-09-06 12:23:07',NULL,'zen_cfg_select_option(array(\'Order\', \'Box\'), '),(563,'Zone 3 Countries','MODULE_SHIPPING_ZONES_COUNTRIES_3','','Comma separated list of two character ISO country codes that are part of Zone 3.<br />Set as 00 to indicate all two character ISO country codes that are not specifically defined.',6,0,NULL,'2013-09-06 12:23:07',NULL,'zen_cfg_textarea('),(564,'Zone 3 Shipping Table','MODULE_SHIPPING_ZONES_COST_3','','Shipping rates to Zone 3 destinations based on a group of maximum order weights/prices. Example: 3:8.50,7:10.50,... Weight/Price less than or equal to 3 would cost 8.50 for Zone 3 destinations.<br />You can also use percentage amounts, such 25:8.50,35:5%,40:9.50,10000:7% to charge a percentage value of the Order Total',6,0,NULL,'2013-09-06 12:23:07',NULL,'zen_cfg_textarea('),(565,'Zone 3 Handling Fee','MODULE_SHIPPING_ZONES_HANDLING_3','0','Handling Fee for this shipping zone',6,0,NULL,'2013-09-06 12:23:07',NULL,NULL),(566,'Handling Per Order or Per Box Zone 3 (when by weight)','MODULE_SHIPPING_ZONES_HANDLING_METHOD_3','Order','Do you want to charge Handling Fee Per Order or Per Box?',6,0,NULL,'2013-09-06 12:23:07',NULL,'zen_cfg_select_option(array(\'Order\', \'Box\'), ');
/*!40000 ALTER TABLE `zc_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_configuration_group`
--

DROP TABLE IF EXISTS `zc_configuration_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_configuration_group` (
  `configuration_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_group_title` varchar(64) NOT NULL DEFAULT '',
  `configuration_group_description` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(5) DEFAULT NULL,
  `visible` int(1) DEFAULT '1',
  PRIMARY KEY (`configuration_group_id`),
  KEY `idx_visible_zen` (`visible`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_configuration_group`
--

LOCK TABLES `zc_configuration_group` WRITE;
/*!40000 ALTER TABLE `zc_configuration_group` DISABLE KEYS */;
INSERT INTO `zc_configuration_group` VALUES (1,'My Store','General information about my store',1,1),(2,'Minimum Values','The minimum values for functions / data',2,1),(3,'Maximum Values','The maximum values for functions / data',3,1),(4,'Images','Image parameters',4,1),(5,'Customer Details','Customer account configuration',5,1),(6,'Module Options','Hidden from configuration',6,0),(7,'Shipping/Packaging','Shipping options available at my store',7,1),(8,'Product Listing','Product Listing configuration options',8,1),(9,'Stock','Stock configuration options',9,1),(10,'Logging','Logging configuration options',10,1),(11,'Regulations','Regulation options',16,1),(12,'E-Mail Options','General settings for E-Mail transport and HTML E-Mails',12,1),(13,'Attribute Settings','Configure products attributes settings',13,1),(14,'GZip Compression','GZip compression options',14,1),(15,'Sessions','Session options',15,1),(16,'GV Coupons','Gift Vouchers and Coupons',16,1),(17,'Credit Cards','Credit Cards Accepted',17,1),(18,'Product Info','Product Info Display Options',18,1),(19,'Layout Settings','Layout Options',19,1),(20,'Website Maintenance','Website Maintenance Options',20,1),(21,'New Listing','New Products Listing',21,1),(22,'Featured Listing','Featured Products Listing',22,1),(23,'All Listing','All Products Listing',23,1),(24,'Index Listing','Index Products Listing',24,1),(25,'Define Page Status','Define Main Pages and HTMLArea Options',25,1),(30,'EZ-Pages Settings','EZ-Pages Settings',30,1);
/*!40000 ALTER TABLE `zc_configuration_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_counter`
--

DROP TABLE IF EXISTS `zc_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_counter` (
  `startdate` char(8) DEFAULT NULL,
  `counter` int(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_counter`
--

LOCK TABLES `zc_counter` WRITE;
/*!40000 ALTER TABLE `zc_counter` DISABLE KEYS */;
INSERT INTO `zc_counter` VALUES ('20130905',68);
/*!40000 ALTER TABLE `zc_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_counter_history`
--

DROP TABLE IF EXISTS `zc_counter_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_counter_history` (
  `startdate` char(8) NOT NULL DEFAULT '',
  `counter` int(12) DEFAULT NULL,
  `session_counter` int(12) DEFAULT NULL,
  PRIMARY KEY (`startdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_counter_history`
--

LOCK TABLES `zc_counter_history` WRITE;
/*!40000 ALTER TABLE `zc_counter_history` DISABLE KEYS */;
INSERT INTO `zc_counter_history` VALUES ('20130905',16,2),('20130906',51,1),('20130907',1,1);
/*!40000 ALTER TABLE `zc_counter_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_countries`
--

DROP TABLE IF EXISTS `zc_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_countries` (
  `countries_id` int(11) NOT NULL AUTO_INCREMENT,
  `countries_name` varchar(64) NOT NULL DEFAULT '',
  `countries_iso_code_2` char(2) NOT NULL DEFAULT '',
  `countries_iso_code_3` char(3) NOT NULL DEFAULT '',
  `address_format_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`countries_id`),
  KEY `idx_countries_name_zen` (`countries_name`),
  KEY `idx_address_format_id_zen` (`address_format_id`),
  KEY `idx_iso_2_zen` (`countries_iso_code_2`),
  KEY `idx_iso_3_zen` (`countries_iso_code_3`)
) ENGINE=MyISAM AUTO_INCREMENT=246 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_countries`
--

LOCK TABLES `zc_countries` WRITE;
/*!40000 ALTER TABLE `zc_countries` DISABLE KEYS */;
INSERT INTO `zc_countries` VALUES (240,'Aaland Islands','AX','ALA',1),(1,'Afghanistan','AF','AFG',1),(2,'Albania','AL','ALB',1),(3,'Algeria','DZ','DZA',1),(4,'American Samoa','AS','ASM',1),(5,'Andorra','AD','AND',1),(6,'Angola','AO','AGO',1),(7,'Anguilla','AI','AIA',1),(8,'Antarctica','AQ','ATA',1),(9,'Antigua and Barbuda','AG','ATG',1),(10,'Argentina','AR','ARG',1),(11,'Armenia','AM','ARM',1),(12,'Aruba','AW','ABW',1),(13,'Australia','AU','AUS',1),(14,'Austria','AT','AUT',5),(15,'Azerbaijan','AZ','AZE',1),(16,'Bahamas','BS','BHS',1),(17,'Bahrain','BH','BHR',1),(18,'Bangladesh','BD','BGD',1),(19,'Barbados','BB','BRB',1),(20,'Belarus','BY','BLR',1),(21,'Belgium','BE','BEL',1),(22,'Belize','BZ','BLZ',1),(23,'Benin','BJ','BEN',1),(24,'Bermuda','BM','BMU',1),(25,'Bhutan','BT','BTN',1),(26,'Bolivia','BO','BOL',1),(27,'Bosnia and Herzegowina','BA','BIH',1),(28,'Botswana','BW','BWA',1),(29,'Bouvet Island','BV','BVT',1),(30,'Brazil','BR','BRA',1),(31,'British Indian Ocean Territory','IO','IOT',1),(32,'Brunei Darussalam','BN','BRN',1),(33,'Bulgaria','BG','BGR',1),(34,'Burkina Faso','BF','BFA',1),(35,'Burundi','BI','BDI',1),(36,'Cambodia','KH','KHM',1),(37,'Cameroon','CM','CMR',1),(38,'Canada','CA','CAN',2),(39,'Cape Verde','CV','CPV',1),(40,'Cayman Islands','KY','CYM',1),(41,'Central African Republic','CF','CAF',1),(42,'Chad','TD','TCD',1),(43,'Chile','CL','CHL',1),(44,'China','CN','CHN',1),(45,'Christmas Island','CX','CXR',1),(46,'Cocos (Keeling) Islands','CC','CCK',1),(47,'Colombia','CO','COL',1),(48,'Comoros','KM','COM',1),(49,'Congo','CG','COG',1),(50,'Cook Islands','CK','COK',1),(51,'Costa Rica','CR','CRI',1),(52,'Cote D\'Ivoire','CI','CIV',1),(53,'Croatia','HR','HRV',1),(54,'Cuba','CU','CUB',1),(55,'Cyprus','CY','CYP',1),(56,'Czech Republic','CZ','CZE',1),(57,'Denmark','DK','DNK',1),(58,'Djibouti','DJ','DJI',1),(59,'Dominica','DM','DMA',1),(60,'Dominican Republic','DO','DOM',1),(61,'Timor-Leste','TL','TLS',1),(62,'Ecuador','EC','ECU',1),(63,'Egypt','EG','EGY',1),(64,'El Salvador','SV','SLV',1),(65,'Equatorial Guinea','GQ','GNQ',1),(66,'Eritrea','ER','ERI',1),(67,'Estonia','EE','EST',1),(68,'Ethiopia','ET','ETH',1),(69,'Falkland Islands (Malvinas)','FK','FLK',1),(70,'Faroe Islands','FO','FRO',1),(71,'Fiji','FJ','FJI',1),(72,'Finland','FI','FIN',1),(73,'France','FR','FRA',1),(75,'French Guiana','GF','GUF',1),(76,'French Polynesia','PF','PYF',1),(77,'French Southern Territories','TF','ATF',1),(78,'Gabon','GA','GAB',1),(79,'Gambia','GM','GMB',1),(80,'Georgia','GE','GEO',1),(81,'Germany','DE','DEU',5),(82,'Ghana','GH','GHA',1),(83,'Gibraltar','GI','GIB',1),(84,'Greece','GR','GRC',1),(85,'Greenland','GL','GRL',1),(86,'Grenada','GD','GRD',1),(87,'Guadeloupe','GP','GLP',1),(88,'Guam','GU','GUM',1),(89,'Guatemala','GT','GTM',1),(90,'Guinea','GN','GIN',1),(91,'Guinea-bissau','GW','GNB',1),(92,'Guyana','GY','GUY',1),(93,'Haiti','HT','HTI',1),(94,'Heard and Mc Donald Islands','HM','HMD',1),(95,'Honduras','HN','HND',1),(96,'Hong Kong','HK','HKG',1),(97,'Hungary','HU','HUN',1),(98,'Iceland','IS','ISL',1),(99,'India','IN','IND',1),(100,'Indonesia','ID','IDN',1),(101,'Iran (Islamic Republic of)','IR','IRN',1),(102,'Iraq','IQ','IRQ',1),(103,'Ireland','IE','IRL',1),(104,'Israel','IL','ISR',1),(105,'Italy','IT','ITA',1),(106,'Jamaica','JM','JAM',1),(107,'Japan','JP','JPN',1),(108,'Jordan','JO','JOR',1),(109,'Kazakhstan','KZ','KAZ',1),(110,'Kenya','KE','KEN',1),(111,'Kiribati','KI','KIR',1),(112,'Korea, Democratic People\'s Republic of','KP','PRK',1),(113,'Korea, Republic of','KR','KOR',1),(114,'Kuwait','KW','KWT',1),(115,'Kyrgyzstan','KG','KGZ',1),(116,'Lao People\'s Democratic Republic','LA','LAO',1),(117,'Latvia','LV','LVA',1),(118,'Lebanon','LB','LBN',1),(119,'Lesotho','LS','LSO',1),(120,'Liberia','LR','LBR',1),(121,'Libyan Arab Jamahiriya','LY','LBY',1),(122,'Liechtenstein','LI','LIE',1),(123,'Lithuania','LT','LTU',1),(124,'Luxembourg','LU','LUX',1),(125,'Macao','MO','MAC',1),(126,'Macedonia, The Former Yugoslav Republic of','MK','MKD',1),(127,'Madagascar','MG','MDG',1),(128,'Malawi','MW','MWI',1),(129,'Malaysia','MY','MYS',1),(130,'Maldives','MV','MDV',1),(131,'Mali','ML','MLI',1),(132,'Malta','MT','MLT',1),(133,'Marshall Islands','MH','MHL',1),(134,'Martinique','MQ','MTQ',1),(135,'Mauritania','MR','MRT',1),(136,'Mauritius','MU','MUS',1),(137,'Mayotte','YT','MYT',1),(138,'Mexico','MX','MEX',1),(139,'Micronesia, Federated States of','FM','FSM',1),(140,'Moldova','MD','MDA',1),(141,'Monaco','MC','MCO',1),(142,'Mongolia','MN','MNG',1),(143,'Montserrat','MS','MSR',1),(144,'Morocco','MA','MAR',1),(145,'Mozambique','MZ','MOZ',1),(146,'Myanmar','MM','MMR',1),(147,'Namibia','NA','NAM',1),(148,'Nauru','NR','NRU',1),(149,'Nepal','NP','NPL',1),(150,'Netherlands','NL','NLD',1),(151,'Netherlands Antilles','AN','ANT',1),(152,'New Caledonia','NC','NCL',1),(153,'New Zealand','NZ','NZL',1),(154,'Nicaragua','NI','NIC',1),(155,'Niger','NE','NER',1),(156,'Nigeria','NG','NGA',1),(157,'Niue','NU','NIU',1),(158,'Norfolk Island','NF','NFK',1),(159,'Northern Mariana Islands','MP','MNP',1),(160,'Norway','NO','NOR',1),(161,'Oman','OM','OMN',1),(162,'Pakistan','PK','PAK',1),(163,'Palau','PW','PLW',1),(164,'Panama','PA','PAN',1),(165,'Papua New Guinea','PG','PNG',1),(166,'Paraguay','PY','PRY',1),(167,'Peru','PE','PER',1),(168,'Philippines','PH','PHL',1),(169,'Pitcairn','PN','PCN',1),(170,'Poland','PL','POL',1),(171,'Portugal','PT','PRT',1),(172,'Puerto Rico','PR','PRI',1),(173,'Qatar','QA','QAT',1),(174,'Reunion','RE','REU',1),(175,'Romania','RO','ROU',1),(176,'Russian Federation','RU','RUS',1),(177,'Rwanda','RW','RWA',1),(178,'Saint Kitts and Nevis','KN','KNA',1),(179,'Saint Lucia','LC','LCA',1),(180,'Saint Vincent and the Grenadines','VC','VCT',1),(181,'Samoa','WS','WSM',1),(182,'San Marino','SM','SMR',1),(183,'Sao Tome and Principe','ST','STP',1),(184,'Saudi Arabia','SA','SAU',1),(185,'Senegal','SN','SEN',1),(186,'Seychelles','SC','SYC',1),(187,'Sierra Leone','SL','SLE',1),(188,'Singapore','SG','SGP',4),(189,'Slovakia (Slovak Republic)','SK','SVK',1),(190,'Slovenia','SI','SVN',1),(191,'Solomon Islands','SB','SLB',1),(192,'Somalia','SO','SOM',1),(193,'South Africa','ZA','ZAF',1),(194,'South Georgia and the South Sandwich Islands','GS','SGS',1),(195,'Spain','ES','ESP',3),(196,'Sri Lanka','LK','LKA',1),(197,'St. Helena','SH','SHN',1),(198,'St. Pierre and Miquelon','PM','SPM',1),(199,'Sudan','SD','SDN',1),(200,'Suriname','SR','SUR',1),(201,'Svalbard and Jan Mayen Islands','SJ','SJM',1),(202,'Swaziland','SZ','SWZ',1),(203,'Sweden','SE','SWE',1),(204,'Switzerland','CH','CHE',1),(205,'Syrian Arab Republic','SY','SYR',1),(206,'Taiwan','TW','TWN',1),(207,'Tajikistan','TJ','TJK',1),(208,'Tanzania, United Republic of','TZ','TZA',1),(209,'Thailand','TH','THA',1),(210,'Togo','TG','TGO',1),(211,'Tokelau','TK','TKL',1),(212,'Tonga','TO','TON',1),(213,'Trinidad and Tobago','TT','TTO',1),(214,'Tunisia','TN','TUN',1),(215,'Turkey','TR','TUR',1),(216,'Turkmenistan','TM','TKM',1),(217,'Turks and Caicos Islands','TC','TCA',1),(218,'Tuvalu','TV','TUV',1),(219,'Uganda','UG','UGA',1),(220,'Ukraine','UA','UKR',1),(221,'United Arab Emirates','AE','ARE',1),(222,'United Kingdom','GB','GBR',6),(223,'United States','US','USA',2),(224,'United States Minor Outlying Islands','UM','UMI',1),(225,'Uruguay','UY','URY',1),(226,'Uzbekistan','UZ','UZB',1),(227,'Vanuatu','VU','VUT',1),(228,'Vatican City State (Holy See)','VA','VAT',1),(229,'Venezuela','VE','VEN',1),(230,'Viet Nam','VN','VNM',1),(231,'Virgin Islands (British)','VG','VGB',1),(232,'Virgin Islands (U.S.)','VI','VIR',1),(233,'Wallis and Futuna Islands','WF','WLF',1),(234,'Western Sahara','EH','ESH',1),(235,'Yemen','YE','YEM',1),(236,'Serbia','RS','SRB',1),(241,'Palestinian Territory','PS','PSE',1),(238,'Zambia','ZM','ZMB',1),(239,'Zimbabwe','ZW','ZWE',1),(242,'Montenegro','ME','MNE',1),(243,'Guernsey','GG','GGY',1),(244,'Isle of Man','IM','IMN',1),(245,'Jersey','JE','JEY',1);
/*!40000 ALTER TABLE `zc_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_coupon_email_track`
--

DROP TABLE IF EXISTS `zc_coupon_email_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_coupon_email_track` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id_sent` int(11) NOT NULL DEFAULT '0',
  `sent_firstname` varchar(32) DEFAULT NULL,
  `sent_lastname` varchar(32) DEFAULT NULL,
  `emailed_to` varchar(32) DEFAULT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`unique_id`),
  KEY `idx_coupon_id_zen` (`coupon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_coupon_email_track`
--

LOCK TABLES `zc_coupon_email_track` WRITE;
/*!40000 ALTER TABLE `zc_coupon_email_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_coupon_email_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_coupon_gv_customer`
--

DROP TABLE IF EXISTS `zc_coupon_gv_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_coupon_gv_customer` (
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_coupon_gv_customer`
--

LOCK TABLES `zc_coupon_gv_customer` WRITE;
/*!40000 ALTER TABLE `zc_coupon_gv_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_coupon_gv_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_coupon_gv_queue`
--

DROP TABLE IF EXISTS `zc_coupon_gv_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_coupon_gv_queue` (
  `unique_id` int(5) NOT NULL AUTO_INCREMENT,
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `order_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `ipaddr` varchar(45) NOT NULL DEFAULT '',
  `release_flag` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`unique_id`),
  KEY `idx_cust_id_order_id_zen` (`customer_id`,`order_id`),
  KEY `idx_release_flag_zen` (`release_flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_coupon_gv_queue`
--

LOCK TABLES `zc_coupon_gv_queue` WRITE;
/*!40000 ALTER TABLE `zc_coupon_gv_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_coupon_gv_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_coupon_redeem_track`
--

DROP TABLE IF EXISTS `zc_coupon_redeem_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_coupon_redeem_track` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `redeem_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `redeem_ip` varchar(45) NOT NULL DEFAULT '',
  `order_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`unique_id`),
  KEY `idx_coupon_id_zen` (`coupon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_coupon_redeem_track`
--

LOCK TABLES `zc_coupon_redeem_track` WRITE;
/*!40000 ALTER TABLE `zc_coupon_redeem_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_coupon_redeem_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_coupon_restrict`
--

DROP TABLE IF EXISTS `zc_coupon_restrict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_coupon_restrict` (
  `restrict_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `coupon_restrict` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`restrict_id`),
  KEY `idx_coup_id_prod_id_zen` (`coupon_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_coupon_restrict`
--

LOCK TABLES `zc_coupon_restrict` WRITE;
/*!40000 ALTER TABLE `zc_coupon_restrict` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_coupon_restrict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_coupons`
--

DROP TABLE IF EXISTS `zc_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_coupons` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_type` char(1) NOT NULL DEFAULT 'F',
  `coupon_code` varchar(32) NOT NULL DEFAULT '',
  `coupon_amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_minimum_order` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_start_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_expire_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `uses_per_coupon` int(5) NOT NULL DEFAULT '1',
  `uses_per_user` int(5) NOT NULL DEFAULT '0',
  `restrict_to_products` varchar(255) DEFAULT NULL,
  `restrict_to_categories` varchar(255) DEFAULT NULL,
  `restrict_to_customers` text,
  `coupon_active` char(1) NOT NULL DEFAULT 'Y',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_zone_restriction` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupon_id`),
  KEY `idx_active_type_zen` (`coupon_active`,`coupon_type`),
  KEY `idx_coupon_code_zen` (`coupon_code`),
  KEY `idx_coupon_type_zen` (`coupon_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_coupons`
--

LOCK TABLES `zc_coupons` WRITE;
/*!40000 ALTER TABLE `zc_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_coupons_description`
--

DROP TABLE IF EXISTS `zc_coupons_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_coupons_description` (
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `coupon_name` varchar(32) NOT NULL DEFAULT '',
  `coupon_description` text,
  PRIMARY KEY (`coupon_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_coupons_description`
--

LOCK TABLES `zc_coupons_description` WRITE;
/*!40000 ALTER TABLE `zc_coupons_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_coupons_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_currencies`
--

DROP TABLE IF EXISTS `zc_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_currencies` (
  `currencies_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  `code` char(3) NOT NULL DEFAULT '',
  `symbol_left` varchar(24) DEFAULT NULL,
  `symbol_right` varchar(24) DEFAULT NULL,
  `decimal_point` char(1) DEFAULT NULL,
  `thousands_point` char(1) DEFAULT NULL,
  `decimal_places` char(1) DEFAULT NULL,
  `value` float(13,8) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`currencies_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_currencies`
--

LOCK TABLES `zc_currencies` WRITE;
/*!40000 ALTER TABLE `zc_currencies` DISABLE KEYS */;
INSERT INTO `zc_currencies` VALUES (2,'Euro','EUR','&euro;','','.',',','2',1.00000000,'2009-05-30 08:43:47');
/*!40000 ALTER TABLE `zc_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_customers`
--

DROP TABLE IF EXISTS `zc_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_customers` (
  `customers_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_gender` char(1) NOT NULL DEFAULT '',
  `customers_firstname` varchar(32) NOT NULL DEFAULT '',
  `customers_lastname` varchar(32) NOT NULL DEFAULT '',
  `customers_dob` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customers_email_address` varchar(96) NOT NULL DEFAULT '',
  `customers_nick` varchar(96) NOT NULL DEFAULT '',
  `customers_default_address_id` int(11) NOT NULL DEFAULT '0',
  `customers_telephone` varchar(32) NOT NULL DEFAULT '',
  `customers_fax` varchar(32) DEFAULT NULL,
  `customers_password` varchar(40) NOT NULL DEFAULT '',
  `customers_newsletter` char(1) DEFAULT NULL,
  `customers_group_pricing` int(11) NOT NULL DEFAULT '0',
  `customers_email_format` varchar(4) NOT NULL DEFAULT 'TEXT',
  `customers_authorization` int(1) NOT NULL DEFAULT '0',
  `customers_referral` varchar(32) NOT NULL DEFAULT '',
  `customers_paypal_payerid` varchar(20) NOT NULL DEFAULT '',
  `customers_paypal_ec` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`customers_id`),
  KEY `idx_email_address_zen` (`customers_email_address`),
  KEY `idx_referral_zen` (`customers_referral`(10)),
  KEY `idx_grp_pricing_zen` (`customers_group_pricing`),
  KEY `idx_nick_zen` (`customers_nick`),
  KEY `idx_newsletter_zen` (`customers_newsletter`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_customers`
--

LOCK TABLES `zc_customers` WRITE;
/*!40000 ALTER TABLE `zc_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_customers_basket`
--

DROP TABLE IF EXISTS `zc_customers_basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_customers_basket` (
  `customers_basket_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext NOT NULL,
  `customers_basket_quantity` float NOT NULL DEFAULT '0',
  `final_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `customers_basket_date_added` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`customers_basket_id`),
  KEY `idx_customers_id_zen` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_customers_basket`
--

LOCK TABLES `zc_customers_basket` WRITE;
/*!40000 ALTER TABLE `zc_customers_basket` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_customers_basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_customers_basket_attributes`
--

DROP TABLE IF EXISTS `zc_customers_basket_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_customers_basket_attributes` (
  `customers_basket_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext NOT NULL,
  `products_options_id` varchar(64) NOT NULL DEFAULT '0',
  `products_options_value_id` int(11) NOT NULL DEFAULT '0',
  `products_options_value_text` blob,
  `products_options_sort_order` text NOT NULL,
  PRIMARY KEY (`customers_basket_attributes_id`),
  KEY `idx_cust_id_prod_id_zen` (`customers_id`,`products_id`(36))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_customers_basket_attributes`
--

LOCK TABLES `zc_customers_basket_attributes` WRITE;
/*!40000 ALTER TABLE `zc_customers_basket_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_customers_basket_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_customers_info`
--

DROP TABLE IF EXISTS `zc_customers_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_customers_info` (
  `customers_info_id` int(11) NOT NULL DEFAULT '0',
  `customers_info_date_of_last_logon` datetime DEFAULT NULL,
  `customers_info_number_of_logons` int(5) DEFAULT NULL,
  `customers_info_date_account_created` datetime DEFAULT NULL,
  `customers_info_date_account_last_modified` datetime DEFAULT NULL,
  `global_product_notifications` int(1) DEFAULT '0',
  PRIMARY KEY (`customers_info_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_customers_info`
--

LOCK TABLES `zc_customers_info` WRITE;
/*!40000 ALTER TABLE `zc_customers_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_customers_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_customers_wishlist`
--

DROP TABLE IF EXISTS `zc_customers_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_customers_wishlist` (
  `products_id` int(13) NOT NULL DEFAULT '0',
  `customers_id` int(13) NOT NULL DEFAULT '0',
  `products_model` varchar(13) DEFAULT NULL,
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `final_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `products_quantity` int(2) NOT NULL DEFAULT '0',
  `wishlist_name` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_customers_wishlist`
--

LOCK TABLES `zc_customers_wishlist` WRITE;
/*!40000 ALTER TABLE `zc_customers_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_customers_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_db_cache`
--

DROP TABLE IF EXISTS `zc_db_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_db_cache` (
  `cache_entry_name` varchar(64) NOT NULL DEFAULT '',
  `cache_data` mediumblob,
  `cache_entry_created` int(15) DEFAULT NULL,
  PRIMARY KEY (`cache_entry_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_db_cache`
--

LOCK TABLES `zc_db_cache` WRITE;
/*!40000 ALTER TABLE `zc_db_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_db_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_email_archive`
--

DROP TABLE IF EXISTS `zc_email_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_email_archive` (
  `archive_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_to_name` varchar(96) NOT NULL DEFAULT '',
  `email_to_address` varchar(96) NOT NULL DEFAULT '',
  `email_from_name` varchar(96) NOT NULL DEFAULT '',
  `email_from_address` varchar(96) NOT NULL DEFAULT '',
  `email_subject` varchar(255) NOT NULL DEFAULT '',
  `email_html` text NOT NULL,
  `email_text` text NOT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `module` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`archive_id`),
  KEY `idx_email_to_address_zen` (`email_to_address`),
  KEY `idx_module_zen` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_email_archive`
--

LOCK TABLES `zc_email_archive` WRITE;
/*!40000 ALTER TABLE `zc_email_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_email_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_ezpages`
--

DROP TABLE IF EXISTS `zc_ezpages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_ezpages` (
  `pages_id` int(11) NOT NULL AUTO_INCREMENT,
  `languages_id` int(11) NOT NULL DEFAULT '1',
  `pages_title` varchar(64) NOT NULL DEFAULT '',
  `alt_url` varchar(255) NOT NULL DEFAULT '',
  `alt_url_external` varchar(255) NOT NULL DEFAULT '',
  `pages_html_text` mediumtext,
  `status_header` int(1) NOT NULL DEFAULT '1',
  `status_sidebox` int(1) NOT NULL DEFAULT '1',
  `status_footer` int(1) NOT NULL DEFAULT '1',
  `status_toc` int(1) NOT NULL DEFAULT '1',
  `header_sort_order` int(3) NOT NULL DEFAULT '0',
  `sidebox_sort_order` int(3) NOT NULL DEFAULT '0',
  `footer_sort_order` int(3) NOT NULL DEFAULT '0',
  `toc_sort_order` int(3) NOT NULL DEFAULT '0',
  `page_open_new_window` int(1) NOT NULL DEFAULT '0',
  `page_is_ssl` int(1) NOT NULL DEFAULT '0',
  `toc_chapter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`),
  KEY `idx_lang_id_zen` (`languages_id`),
  KEY `idx_ezp_status_header_zen` (`status_header`),
  KEY `idx_ezp_status_sidebox_zen` (`status_sidebox`),
  KEY `idx_ezp_status_footer_zen` (`status_footer`),
  KEY `idx_ezp_status_toc_zen` (`status_toc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_ezpages`
--

LOCK TABLES `zc_ezpages` WRITE;
/*!40000 ALTER TABLE `zc_ezpages` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_ezpages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_featured`
--

DROP TABLE IF EXISTS `zc_featured`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_featured` (
  `featured_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `featured_date_added` datetime DEFAULT NULL,
  `featured_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `featured_date_available` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`featured_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_date_avail_zen` (`featured_date_available`),
  KEY `idx_expires_date_zen` (`expires_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_featured`
--

LOCK TABLES `zc_featured` WRITE;
/*!40000 ALTER TABLE `zc_featured` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_featured` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_files_uploaded`
--

DROP TABLE IF EXISTS `zc_files_uploaded`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_files_uploaded` (
  `files_uploaded_id` int(11) NOT NULL AUTO_INCREMENT,
  `sesskey` varchar(32) DEFAULT NULL,
  `customers_id` int(11) DEFAULT NULL,
  `files_uploaded_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`files_uploaded_id`),
  KEY `idx_customers_id_zen` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Must always have either a sesskey or customers_id';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_files_uploaded`
--

LOCK TABLES `zc_files_uploaded` WRITE;
/*!40000 ALTER TABLE `zc_files_uploaded` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_files_uploaded` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_geo_zones`
--

DROP TABLE IF EXISTS `zc_geo_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_geo_zones` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_name` varchar(32) NOT NULL DEFAULT '',
  `geo_zone_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_geo_zones`
--

LOCK TABLES `zc_geo_zones` WRITE;
/*!40000 ALTER TABLE `zc_geo_zones` DISABLE KEYS */;
INSERT INTO `zc_geo_zones` VALUES (1,'Florida','Florida local sales tax zone',NULL,'2009-05-30 08:43:47'),(2,'EU','EU BTW','2013-09-06 12:13:48','2013-09-06 12:11:52');
/*!40000 ALTER TABLE `zc_geo_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_get_terms_to_filter`
--

DROP TABLE IF EXISTS `zc_get_terms_to_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_get_terms_to_filter` (
  `get_term_name` varchar(255) NOT NULL DEFAULT '',
  `get_term_table` varchar(64) NOT NULL,
  `get_term_name_field` varchar(64) NOT NULL,
  PRIMARY KEY (`get_term_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_get_terms_to_filter`
--

LOCK TABLES `zc_get_terms_to_filter` WRITE;
/*!40000 ALTER TABLE `zc_get_terms_to_filter` DISABLE KEYS */;
INSERT INTO `zc_get_terms_to_filter` VALUES ('manufacturers_id','TABLE_MANUFACTURERS','manufacturers_name'),('music_genre_id','TABLE_MUSIC_GENRE','music_genre_name'),('record_company_id','TABLE_RECORD_COMPANY','record_company_name');
/*!40000 ALTER TABLE `zc_get_terms_to_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_group_pricing`
--

DROP TABLE IF EXISTS `zc_group_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_group_pricing` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(32) NOT NULL DEFAULT '',
  `group_percentage` decimal(5,2) NOT NULL DEFAULT '0.00',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_group_pricing`
--

LOCK TABLES `zc_group_pricing` WRITE;
/*!40000 ALTER TABLE `zc_group_pricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_group_pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_languages`
--

DROP TABLE IF EXISTS `zc_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_languages` (
  `languages_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `code` char(2) NOT NULL DEFAULT '',
  `image` varchar(64) DEFAULT NULL,
  `directory` varchar(32) DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  PRIMARY KEY (`languages_id`),
  KEY `idx_languages_name_zen` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_languages`
--

LOCK TABLES `zc_languages` WRITE;
/*!40000 ALTER TABLE `zc_languages` DISABLE KEYS */;
INSERT INTO `zc_languages` VALUES (1,'English','en','icon.gif','english',1),(2,'Nederlands (Dutch)','nl','icon.gif','dutch',0);
/*!40000 ALTER TABLE `zc_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_layout_boxes`
--

DROP TABLE IF EXISTS `zc_layout_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_layout_boxes` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_template` varchar(64) NOT NULL DEFAULT '',
  `layout_box_name` varchar(64) NOT NULL DEFAULT '',
  `layout_box_status` tinyint(1) NOT NULL DEFAULT '0',
  `layout_box_location` tinyint(1) NOT NULL DEFAULT '0',
  `layout_box_sort_order` int(11) NOT NULL DEFAULT '0',
  `layout_box_sort_order_single` int(11) NOT NULL DEFAULT '0',
  `layout_box_status_single` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`layout_id`),
  KEY `idx_name_template_zen` (`layout_template`,`layout_box_name`),
  KEY `idx_layout_box_status_zen` (`layout_box_status`),
  KEY `idx_layout_box_sort_order_zen` (`layout_box_sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_layout_boxes`
--

LOCK TABLES `zc_layout_boxes` WRITE;
/*!40000 ALTER TABLE `zc_layout_boxes` DISABLE KEYS */;
INSERT INTO `zc_layout_boxes` VALUES (1,'default_template_settings','banner_box_all.php',1,1,5,0,0),(2,'default_template_settings','banner_box.php',1,0,300,1,127),(3,'default_template_settings','banner_box2.php',1,1,15,1,15),(4,'default_template_settings','best_sellers.php',1,1,30,70,1),(5,'default_template_settings','categories.php',1,0,10,10,1),(6,'default_template_settings','currencies.php',1,1,80,60,1),(7,'default_template_settings','document_categories.php',1,0,0,0,0),(8,'default_template_settings','ezpages.php',1,1,-1,2,1),(9,'default_template_settings','featured.php',1,0,45,0,0),(10,'default_template_settings','information.php',1,0,50,40,1),(11,'default_template_settings','languages.php',1,1,70,50,1),(12,'default_template_settings','manufacturers.php',1,0,30,20,1),(13,'default_template_settings','manufacturer_info.php',1,1,35,95,1),(14,'default_template_settings','more_information.php',1,0,200,200,1),(15,'default_template_settings','music_genres.php',1,1,0,0,0),(16,'default_template_settings','order_history.php',1,1,0,0,0),(17,'default_template_settings','product_notifications.php',1,1,55,85,1),(18,'default_template_settings','record_companies.php',1,1,0,0,0),(19,'default_template_settings','reviews.php',1,0,40,0,0),(20,'default_template_settings','search.php',1,1,10,0,0),(21,'default_template_settings','search_header.php',0,0,0,0,1),(22,'default_template_settings','shopping_cart.php',1,1,20,30,1),(23,'default_template_settings','specials.php',1,1,45,0,0),(24,'default_template_settings','tell_a_friend.php',1,1,65,0,0),(25,'default_template_settings','whats_new.php',1,0,20,0,0),(26,'default_template_settings','whos_online.php',1,1,200,200,1),(27,'template_default','banner_box_all.php',1,1,5,0,0),(28,'template_default','banner_box.php',1,0,300,1,127),(29,'template_default','banner_box2.php',1,1,15,1,15),(30,'template_default','best_sellers.php',1,1,30,70,1),(31,'template_default','categories.php',1,0,10,10,1),(32,'template_default','currencies.php',1,1,80,60,1),(33,'template_default','ezpages.php',1,1,-1,2,1),(34,'template_default','featured.php',1,0,45,0,0),(35,'template_default','information.php',1,0,50,40,1),(36,'template_default','languages.php',1,1,70,50,1),(37,'template_default','manufacturers.php',1,0,30,20,1),(38,'template_default','manufacturer_info.php',1,1,35,95,1),(39,'template_default','more_information.php',1,0,200,200,1),(40,'template_default','my_broken_box.php',1,0,0,0,0),(41,'template_default','order_history.php',1,1,0,0,0),(42,'template_default','product_notifications.php',1,1,55,85,1),(43,'template_default','reviews.php',1,0,40,0,0),(44,'template_default','search.php',1,1,10,0,0),(45,'template_default','search_header.php',0,0,0,0,1),(46,'template_default','shopping_cart.php',1,1,20,30,1),(47,'template_default','specials.php',1,1,45,0,0),(48,'template_default','tell_a_friend.php',1,1,65,0,0),(49,'template_default','whats_new.php',1,0,20,0,0),(50,'template_default','whos_online.php',1,1,200,200,1),(51,'classic','banner_box.php',0,0,300,1,0),(52,'classic','banner_box2.php',1,0,15,50,1),(53,'classic','banner_box_all.php',0,1,5,0,0),(54,'classic','best_sellers.php',0,1,30,70,0),(55,'classic','categories.php',1,0,10,10,1),(56,'classic','currencies.php',0,1,80,60,0),(57,'classic','document_categories.php',1,0,0,0,0),(58,'classic','ezpages.php',1,1,0,0,1),(59,'classic','featured.php',1,1,45,0,1),(60,'classic','information.php',1,0,50,30,1),(61,'classic','languages.php',0,1,70,50,0),(62,'classic','manufacturers.php',0,0,30,20,0),(63,'classic','manufacturer_info.php',0,1,35,95,0),(64,'classic','more_information.php',0,0,200,200,0),(65,'classic','music_genres.php',0,1,0,0,0),(66,'classic','order_history.php',1,1,0,0,0),(67,'classic','product_notifications.php',0,1,55,85,0),(68,'classic','record_companies.php',0,1,0,0,0),(69,'classic','reviews.php',0,0,40,0,0),(70,'classic','search.php',1,1,1,0,0),(71,'classic','search_header.php',0,0,0,0,0),(72,'classic','shopping_cart.php',1,1,15,15,1),(73,'classic','specials.php',1,1,45,0,1),(74,'classic','tell_a_friend.php',1,1,65,0,0),(75,'classic','whats_new.php',1,1,20,20,1),(76,'classic','whos_online.php',0,1,200,200,0);
/*!40000 ALTER TABLE `zc_layout_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_manufacturers`
--

DROP TABLE IF EXISTS `zc_manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_manufacturers` (
  `manufacturers_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturers_name` varchar(32) NOT NULL DEFAULT '',
  `manufacturers_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`),
  KEY `idx_mfg_name_zen` (`manufacturers_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_manufacturers`
--

LOCK TABLES `zc_manufacturers` WRITE;
/*!40000 ALTER TABLE `zc_manufacturers` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_manufacturers_info`
--

DROP TABLE IF EXISTS `zc_manufacturers_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_manufacturers_info` (
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_manufacturers_info`
--

LOCK TABLES `zc_manufacturers_info` WRITE;
/*!40000 ALTER TABLE `zc_manufacturers_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_manufacturers_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_media_clips`
--

DROP TABLE IF EXISTS `zc_media_clips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_media_clips` (
  `clip_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL DEFAULT '0',
  `clip_type` smallint(6) NOT NULL DEFAULT '0',
  `clip_filename` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`clip_id`),
  KEY `idx_media_id_zen` (`media_id`),
  KEY `idx_clip_type_zen` (`clip_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_media_clips`
--

LOCK TABLES `zc_media_clips` WRITE;
/*!40000 ALTER TABLE `zc_media_clips` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_media_clips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_media_manager`
--

DROP TABLE IF EXISTS `zc_media_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_media_manager` (
  `media_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_name` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`media_id`),
  KEY `idx_media_name_zen` (`media_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_media_manager`
--

LOCK TABLES `zc_media_manager` WRITE;
/*!40000 ALTER TABLE `zc_media_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_media_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_media_to_products`
--

DROP TABLE IF EXISTS `zc_media_to_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_media_to_products` (
  `media_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  KEY `idx_media_product_zen` (`media_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_media_to_products`
--

LOCK TABLES `zc_media_to_products` WRITE;
/*!40000 ALTER TABLE `zc_media_to_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_media_to_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_media_types`
--

DROP TABLE IF EXISTS `zc_media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_media_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(64) NOT NULL DEFAULT '',
  `type_ext` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_id`),
  KEY `idx_type_name_zen` (`type_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_media_types`
--

LOCK TABLES `zc_media_types` WRITE;
/*!40000 ALTER TABLE `zc_media_types` DISABLE KEYS */;
INSERT INTO `zc_media_types` VALUES (1,'MP3','.mp3');
/*!40000 ALTER TABLE `zc_media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_meta_tags_categories_description`
--

DROP TABLE IF EXISTS `zc_meta_tags_categories_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_meta_tags_categories_description` (
  `categories_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) NOT NULL DEFAULT '',
  `metatags_keywords` text,
  `metatags_description` text,
  PRIMARY KEY (`categories_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_meta_tags_categories_description`
--

LOCK TABLES `zc_meta_tags_categories_description` WRITE;
/*!40000 ALTER TABLE `zc_meta_tags_categories_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_meta_tags_categories_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_meta_tags_products_description`
--

DROP TABLE IF EXISTS `zc_meta_tags_products_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_meta_tags_products_description` (
  `products_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) NOT NULL DEFAULT '',
  `metatags_keywords` text,
  `metatags_description` text,
  PRIMARY KEY (`products_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_meta_tags_products_description`
--

LOCK TABLES `zc_meta_tags_products_description` WRITE;
/*!40000 ALTER TABLE `zc_meta_tags_products_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_meta_tags_products_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_music_genre`
--

DROP TABLE IF EXISTS `zc_music_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_music_genre` (
  `music_genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `music_genre_name` varchar(32) NOT NULL DEFAULT '',
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`music_genre_id`),
  KEY `idx_music_genre_name_zen` (`music_genre_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_music_genre`
--

LOCK TABLES `zc_music_genre` WRITE;
/*!40000 ALTER TABLE `zc_music_genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_music_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_newsletters`
--

DROP TABLE IF EXISTS `zc_newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_newsletters` (
  `newsletters_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `content_html` text NOT NULL,
  `module` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_sent` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `locked` int(1) DEFAULT '0',
  PRIMARY KEY (`newsletters_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_newsletters`
--

LOCK TABLES `zc_newsletters` WRITE;
/*!40000 ALTER TABLE `zc_newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_nochex_apc_transactions`
--

DROP TABLE IF EXISTS `zc_nochex_apc_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_nochex_apc_transactions` (
  `nochex_apc_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `nc_transaction_id` varchar(30) NOT NULL,
  `nc_transaction_date` varchar(100) NOT NULL,
  `nc_to_email` varchar(255) NOT NULL,
  `nc_from_email` varchar(255) NOT NULL,
  `nc_order_id` varchar(255) NOT NULL,
  `nc_custom` varchar(255) NOT NULL,
  `nc_amount` decimal(9,2) NOT NULL,
  `nc_security_key` varchar(255) NOT NULL,
  `nc_status` varchar(15) NOT NULL,
  `nochex_response` varchar(255) NOT NULL,
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text,
  PRIMARY KEY (`nochex_apc_id`),
  KEY `idx_order_id_zen` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_nochex_apc_transactions`
--

LOCK TABLES `zc_nochex_apc_transactions` WRITE;
/*!40000 ALTER TABLE `zc_nochex_apc_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_nochex_apc_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_nochex_sessions`
--

DROP TABLE IF EXISTS `zc_nochex_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_nochex_sessions` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` text NOT NULL,
  `saved_session` mediumblob NOT NULL,
  `expiry` int(17) NOT NULL DEFAULT '0',
  PRIMARY KEY (`unique_id`),
  KEY `idx_session_id_zen` (`session_id`(36))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_nochex_sessions`
--

LOCK TABLES `zc_nochex_sessions` WRITE;
/*!40000 ALTER TABLE `zc_nochex_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_nochex_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_orders`
--

DROP TABLE IF EXISTS `zc_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_orders` (
  `orders_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `customers_name` varchar(64) NOT NULL DEFAULT '',
  `customers_company` varchar(64) DEFAULT NULL,
  `customers_street_address` varchar(64) NOT NULL DEFAULT '',
  `customers_suburb` varchar(32) DEFAULT NULL,
  `customers_city` varchar(32) NOT NULL DEFAULT '',
  `customers_postcode` varchar(10) NOT NULL DEFAULT '',
  `customers_state` varchar(32) DEFAULT NULL,
  `customers_country` varchar(32) NOT NULL DEFAULT '',
  `customers_telephone` varchar(32) NOT NULL DEFAULT '',
  `customers_email_address` varchar(96) NOT NULL DEFAULT '',
  `customers_address_format_id` int(5) NOT NULL DEFAULT '0',
  `delivery_name` varchar(64) NOT NULL DEFAULT '',
  `delivery_company` varchar(64) DEFAULT NULL,
  `delivery_street_address` varchar(64) NOT NULL DEFAULT '',
  `delivery_suburb` varchar(32) DEFAULT NULL,
  `delivery_city` varchar(32) NOT NULL DEFAULT '',
  `delivery_postcode` varchar(10) NOT NULL DEFAULT '',
  `delivery_state` varchar(32) DEFAULT NULL,
  `delivery_country` varchar(32) NOT NULL DEFAULT '',
  `delivery_address_format_id` int(5) NOT NULL DEFAULT '0',
  `billing_name` varchar(64) NOT NULL DEFAULT '',
  `billing_company` varchar(64) DEFAULT NULL,
  `billing_street_address` varchar(64) NOT NULL DEFAULT '',
  `billing_suburb` varchar(32) DEFAULT NULL,
  `billing_city` varchar(32) NOT NULL DEFAULT '',
  `billing_postcode` varchar(10) NOT NULL DEFAULT '',
  `billing_state` varchar(32) DEFAULT NULL,
  `billing_country` varchar(32) NOT NULL DEFAULT '',
  `billing_address_format_id` int(5) NOT NULL DEFAULT '0',
  `payment_method` varchar(128) NOT NULL DEFAULT '',
  `payment_module_code` varchar(32) NOT NULL DEFAULT '',
  `shipping_method` varchar(128) NOT NULL DEFAULT '',
  `shipping_module_code` varchar(32) NOT NULL DEFAULT '',
  `coupon_code` varchar(32) NOT NULL DEFAULT '',
  `cc_type` varchar(20) DEFAULT NULL,
  `cc_owner` varchar(64) DEFAULT NULL,
  `cc_number` varchar(32) DEFAULT NULL,
  `cc_expires` varchar(4) DEFAULT NULL,
  `cc_cvv` blob,
  `last_modified` datetime DEFAULT NULL,
  `date_purchased` datetime DEFAULT NULL,
  `orders_status` int(5) NOT NULL DEFAULT '0',
  `orders_date_finished` datetime DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `currency_value` decimal(14,6) DEFAULT NULL,
  `order_total` decimal(14,2) DEFAULT NULL,
  `order_tax` decimal(14,2) DEFAULT NULL,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(96) NOT NULL DEFAULT '',
  PRIMARY KEY (`orders_id`),
  KEY `idx_status_orders_cust_zen` (`orders_status`,`orders_id`,`customers_id`),
  KEY `idx_date_purchased_zen` (`date_purchased`),
  KEY `idx_cust_id_orders_id_zen` (`customers_id`,`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_orders`
--

LOCK TABLES `zc_orders` WRITE;
/*!40000 ALTER TABLE `zc_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_orders_products`
--

DROP TABLE IF EXISTS `zc_orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_orders_products` (
  `orders_products_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `products_model` varchar(32) DEFAULT NULL,
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `final_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_tax` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `products_quantity` float NOT NULL DEFAULT '0',
  `onetime_charges` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  PRIMARY KEY (`orders_products_id`),
  KEY `idx_orders_id_prod_id_zen` (`orders_id`,`products_id`),
  KEY `idx_prod_id_orders_id_zen` (`products_id`,`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_orders_products`
--

LOCK TABLES `zc_orders_products` WRITE;
/*!40000 ALTER TABLE `zc_orders_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_orders_products_attributes`
--

DROP TABLE IF EXISTS `zc_orders_products_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_orders_products_attributes` (
  `orders_products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `products_options` varchar(32) NOT NULL DEFAULT '',
  `products_options_values` text NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) NOT NULL DEFAULT '',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) NOT NULL DEFAULT '',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text,
  `attributes_qty_prices_onetime` text,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  PRIMARY KEY (`orders_products_attributes_id`),
  KEY `idx_orders_id_prod_id_zen` (`orders_id`,`orders_products_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_orders_products_attributes`
--

LOCK TABLES `zc_orders_products_attributes` WRITE;
/*!40000 ALTER TABLE `zc_orders_products_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_orders_products_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_orders_products_download`
--

DROP TABLE IF EXISTS `zc_orders_products_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_orders_products_download` (
  `orders_products_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_filename` varchar(255) NOT NULL DEFAULT '',
  `download_maxdays` int(2) NOT NULL DEFAULT '0',
  `download_count` int(2) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  PRIMARY KEY (`orders_products_download_id`),
  KEY `idx_orders_id_zen` (`orders_id`),
  KEY `idx_orders_products_id_zen` (`orders_products_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_orders_products_download`
--

LOCK TABLES `zc_orders_products_download` WRITE;
/*!40000 ALTER TABLE `zc_orders_products_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_orders_products_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_orders_status`
--

DROP TABLE IF EXISTS `zc_orders_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_orders_status` (
  `orders_status_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `orders_status_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`orders_status_id`,`language_id`),
  KEY `idx_orders_status_name_zen` (`orders_status_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_orders_status`
--

LOCK TABLES `zc_orders_status` WRITE;
/*!40000 ALTER TABLE `zc_orders_status` DISABLE KEYS */;
INSERT INTO `zc_orders_status` VALUES (1,1,'Pending'),(2,1,'Processing'),(3,1,'Delivered'),(4,1,'Update'),(5,2,'Ontvangen'),(5,1,'Pending'),(6,2,'In verwerking'),(6,1,''),(7,2,'Verzonden'),(7,1,'Shipped'),(8,2,'Bijgewerkt'),(8,1,'Update'),(9,2,'TEST'),(9,1,''),(13,1,''),(13,2,'Dubbele Bestelling'),(12,2,'Niet Betaald'),(12,1,'');
/*!40000 ALTER TABLE `zc_orders_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_orders_status_history`
--

DROP TABLE IF EXISTS `zc_orders_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_orders_status_history` (
  `orders_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_status_id` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customer_notified` int(1) DEFAULT '0',
  `comments` text,
  PRIMARY KEY (`orders_status_history_id`),
  KEY `idx_orders_id_status_id_zen` (`orders_id`,`orders_status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_orders_status_history`
--

LOCK TABLES `zc_orders_status_history` WRITE;
/*!40000 ALTER TABLE `zc_orders_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_orders_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_orders_total`
--

DROP TABLE IF EXISTS `zc_orders_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_orders_total` (
  `orders_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `text` varchar(255) NOT NULL DEFAULT '',
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `class` varchar(32) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orders_total_id`),
  KEY `idx_ot_orders_id_zen` (`orders_id`),
  KEY `idx_ot_class_zen` (`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_orders_total`
--

LOCK TABLES `zc_orders_total` WRITE;
/*!40000 ALTER TABLE `zc_orders_total` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_orders_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_paypal`
--

DROP TABLE IF EXISTS `zc_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_paypal` (
  `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `txn_type` varchar(40) NOT NULL DEFAULT '',
  `module_name` varchar(40) NOT NULL DEFAULT '',
  `module_mode` varchar(40) NOT NULL DEFAULT '',
  `reason_code` varchar(40) DEFAULT NULL,
  `payment_type` varchar(40) NOT NULL DEFAULT '',
  `payment_status` varchar(32) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `invoice` varchar(128) DEFAULT NULL,
  `mc_currency` char(3) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) DEFAULT NULL,
  `address_name` varchar(64) DEFAULT NULL,
  `address_street` varchar(254) DEFAULT NULL,
  `address_city` varchar(120) DEFAULT NULL,
  `address_state` varchar(120) DEFAULT NULL,
  `address_zip` varchar(10) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_status` varchar(11) DEFAULT NULL,
  `payer_email` varchar(128) NOT NULL DEFAULT '',
  `payer_id` varchar(32) NOT NULL DEFAULT '',
  `payer_status` varchar(10) NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) NOT NULL DEFAULT '',
  `receiver_email` varchar(128) NOT NULL DEFAULT '',
  `receiver_id` varchar(32) NOT NULL DEFAULT '',
  `txn_id` varchar(20) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(7,2) NOT NULL DEFAULT '0.00',
  `mc_fee` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_gross` decimal(7,2) DEFAULT NULL,
  `payment_fee` decimal(7,2) DEFAULT NULL,
  `settle_amount` decimal(7,2) DEFAULT NULL,
  `settle_currency` char(3) DEFAULT NULL,
  `exchange_rate` decimal(4,2) DEFAULT NULL,
  `notify_version` varchar(6) NOT NULL DEFAULT '',
  `verify_sign` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text,
  PRIMARY KEY (`paypal_ipn_id`,`txn_id`),
  KEY `idx_order_id_zen` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_paypal`
--

LOCK TABLES `zc_paypal` WRITE;
/*!40000 ALTER TABLE `zc_paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_paypal_payment_status`
--

DROP TABLE IF EXISTS `zc_paypal_payment_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_paypal_payment_status` (
  `payment_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_status_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`payment_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_paypal_payment_status`
--

LOCK TABLES `zc_paypal_payment_status` WRITE;
/*!40000 ALTER TABLE `zc_paypal_payment_status` DISABLE KEYS */;
INSERT INTO `zc_paypal_payment_status` VALUES (1,'Completed'),(2,'Pending'),(3,'Failed'),(4,'Denied'),(5,'Refunded'),(6,'Canceled_Reversal'),(7,'Reversed');
/*!40000 ALTER TABLE `zc_paypal_payment_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_paypal_payment_status_history`
--

DROP TABLE IF EXISTS `zc_paypal_payment_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_paypal_payment_status_history` (
  `payment_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `txn_id` varchar(64) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(64) NOT NULL DEFAULT '',
  `payment_status` varchar(17) NOT NULL DEFAULT '',
  `pending_reason` varchar(14) DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`payment_status_history_id`),
  KEY `idx_paypal_ipn_id_zen` (`paypal_ipn_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_paypal_payment_status_history`
--

LOCK TABLES `zc_paypal_payment_status_history` WRITE;
/*!40000 ALTER TABLE `zc_paypal_payment_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_paypal_payment_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_paypal_session`
--

DROP TABLE IF EXISTS `zc_paypal_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_paypal_session` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` text NOT NULL,
  `saved_session` mediumblob NOT NULL,
  `expiry` int(17) NOT NULL DEFAULT '0',
  PRIMARY KEY (`unique_id`),
  KEY `idx_session_id_zen` (`session_id`(36))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_paypal_session`
--

LOCK TABLES `zc_paypal_session` WRITE;
/*!40000 ALTER TABLE `zc_paypal_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_paypal_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_paypal_testing`
--

DROP TABLE IF EXISTS `zc_paypal_testing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_paypal_testing` (
  `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `custom` varchar(255) NOT NULL DEFAULT '',
  `txn_type` varchar(40) NOT NULL DEFAULT '',
  `module_name` varchar(40) NOT NULL DEFAULT '',
  `module_mode` varchar(40) NOT NULL DEFAULT '',
  `reason_code` varchar(40) DEFAULT NULL,
  `payment_type` varchar(40) NOT NULL DEFAULT '',
  `payment_status` varchar(32) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `invoice` varchar(128) DEFAULT NULL,
  `mc_currency` char(3) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) DEFAULT NULL,
  `address_name` varchar(64) DEFAULT NULL,
  `address_street` varchar(254) DEFAULT NULL,
  `address_city` varchar(120) DEFAULT NULL,
  `address_state` varchar(120) DEFAULT NULL,
  `address_zip` varchar(10) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_status` varchar(11) DEFAULT NULL,
  `payer_email` varchar(128) NOT NULL DEFAULT '',
  `payer_id` varchar(32) NOT NULL DEFAULT '',
  `payer_status` varchar(10) NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) NOT NULL DEFAULT '',
  `receiver_email` varchar(128) NOT NULL DEFAULT '',
  `receiver_id` varchar(32) NOT NULL DEFAULT '',
  `txn_id` varchar(20) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(7,2) NOT NULL DEFAULT '0.00',
  `mc_fee` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_gross` decimal(7,2) DEFAULT NULL,
  `payment_fee` decimal(7,2) DEFAULT NULL,
  `settle_amount` decimal(7,2) DEFAULT NULL,
  `settle_currency` char(3) DEFAULT NULL,
  `exchange_rate` decimal(4,2) DEFAULT NULL,
  `notify_version` decimal(2,1) NOT NULL DEFAULT '0.0',
  `verify_sign` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text,
  PRIMARY KEY (`paypal_ipn_id`,`txn_id`),
  KEY `idx_order_id_zen` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_paypal_testing`
--

LOCK TABLES `zc_paypal_testing` WRITE;
/*!40000 ALTER TABLE `zc_paypal_testing` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_paypal_testing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_product_music_extra`
--

DROP TABLE IF EXISTS `zc_product_music_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_product_music_extra` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `music_genre_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`),
  KEY `idx_music_genre_id_zen` (`music_genre_id`),
  KEY `idx_artists_id_zen` (`artists_id`),
  KEY `idx_record_company_id_zen` (`record_company_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_product_music_extra`
--

LOCK TABLES `zc_product_music_extra` WRITE;
/*!40000 ALTER TABLE `zc_product_music_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_product_music_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_product_type_layout`
--

DROP TABLE IF EXISTS `zc_product_type_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_product_type_layout` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` text NOT NULL,
  `configuration_key` varchar(255) NOT NULL DEFAULT '',
  `configuration_value` text NOT NULL,
  `configuration_description` text NOT NULL,
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text,
  `set_function` text,
  PRIMARY KEY (`configuration_id`),
  UNIQUE KEY `unq_config_key_zen` (`configuration_key`),
  KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)),
  KEY `idx_type_id_sort_order_zen` (`product_type_id`,`sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_product_type_layout`
--

LOCK TABLES `zc_product_type_layout` WRITE;
/*!40000 ALTER TABLE `zc_product_type_layout` DISABLE KEYS */;
INSERT INTO `zc_product_type_layout` VALUES (1,'Show Model Number','SHOW_PRODUCT_INFO_MODEL','1','Display Model Number on Product Info 0= off 1= on',1,1,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(2,'Show Weight','SHOW_PRODUCT_INFO_WEIGHT','1','Display Weight on Product Info 0= off 1= on',1,2,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(3,'Show Attribute Weight','SHOW_PRODUCT_INFO_WEIGHT_ATTRIBUTES','1','Display Attribute Weight on Product Info 0= off 1= on',1,3,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(4,'Show Manufacturer','SHOW_PRODUCT_INFO_MANUFACTURER','1','Display Manufacturer Name on Product Info 0= off 1= on',1,4,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(5,'Show Quantity in Shopping Cart','SHOW_PRODUCT_INFO_IN_CART_QTY','1','Display Quantity in Current Shopping Cart on Product Info 0= off 1= on',1,5,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(6,'Show Quantity in Stock','SHOW_PRODUCT_INFO_QUANTITY','1','Display Quantity in Stock on Product Info 0= off 1= on',1,6,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(7,'Show Product Reviews Count','SHOW_PRODUCT_INFO_REVIEWS_COUNT','1','Display Product Reviews Count on Product Info 0= off 1= on',1,7,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(8,'Show Product Reviews Button','SHOW_PRODUCT_INFO_REVIEWS','1','Display Product Reviews Button on Product Info 0= off 1= on',1,8,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(9,'Show Date Available','SHOW_PRODUCT_INFO_DATE_AVAILABLE','1','Display Date Available on Product Info 0= off 1= on',1,9,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(10,'Show Date Added','SHOW_PRODUCT_INFO_DATE_ADDED','1','Display Date Added on Product Info 0= off 1= on',1,10,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(11,'Show Product URL','SHOW_PRODUCT_INFO_URL','1','Display URL on Product Info 0= off 1= on',1,11,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(12,'Show Product Additional Images','SHOW_PRODUCT_INFO_ADDITIONAL_IMAGES','1','Display Additional Images on Product Info 0= off 1= on',1,13,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(13,'Show Starting At text on Price','SHOW_PRODUCT_INFO_STARTING_AT','1','Display Starting At text on products with attributes Product Info 0= off 1= on',1,12,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(14,'Show Product Tell a Friend button','SHOW_PRODUCT_INFO_TELL_A_FRIEND','1','Display the Tell a Friend button on Product Info<br /><br />Note: Turning this setting off does not affect the Tell a Friend box in the columns and turning off the Tell a Friend box does not affect the button<br />0= off 1= on',1,15,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(15,'Product Free Shipping Image Status - Catalog','SHOW_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH','0','Show the Free Shipping image/text in the catalog?',1,16,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(16,'Product Price Tax Class Default - When adding new products?','DEFAULT_PRODUCT_TAX_CLASS_ID','0','What should the Product Price Tax Class Default ID be when adding new products?',1,100,NULL,'2009-05-30 08:43:48','',''),(17,'Product Virtual Default Status - Skip Shipping Address - When adding new products?','DEFAULT_PRODUCT_PRODUCTS_VIRTUAL','0','Default Virtual Product status to be ON when adding new products?',1,101,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(18,'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?','DEFAULT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING','0','What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping',1,102,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), '),(19,'Show Model Number','SHOW_PRODUCT_MUSIC_INFO_MODEL','1','Display Model Number on Product Info 0= off 1= on',2,1,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(20,'Show Weight','SHOW_PRODUCT_MUSIC_INFO_WEIGHT','0','Display Weight on Product Info 0= off 1= on',2,2,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(21,'Show Attribute Weight','SHOW_PRODUCT_MUSIC_INFO_WEIGHT_ATTRIBUTES','1','Display Attribute Weight on Product Info 0= off 1= on',2,3,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(22,'Show Artist','SHOW_PRODUCT_MUSIC_INFO_ARTIST','1','Display Artists Name on Product Info 0= off 1= on',2,4,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(23,'Show Music Genre','SHOW_PRODUCT_MUSIC_INFO_GENRE','1','Display Music Genre on Product Info 0= off 1= on',2,4,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(24,'Show Record Company','SHOW_PRODUCT_MUSIC_INFO_RECORD_COMPANY','1','Display Record Company on Product Info 0= off 1= on',2,4,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(25,'Show Quantity in Shopping Cart','SHOW_PRODUCT_MUSIC_INFO_IN_CART_QTY','1','Display Quantity in Current Shopping Cart on Product Info 0= off 1= on',2,5,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(26,'Show Quantity in Stock','SHOW_PRODUCT_MUSIC_INFO_QUANTITY','0','Display Quantity in Stock on Product Info 0= off 1= on',2,6,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(27,'Show Product Reviews Count','SHOW_PRODUCT_MUSIC_INFO_REVIEWS_COUNT','1','Display Product Reviews Count on Product Info 0= off 1= on',2,7,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(28,'Show Product Reviews Button','SHOW_PRODUCT_MUSIC_INFO_REVIEWS','1','Display Product Reviews Button on Product Info 0= off 1= on',2,8,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(29,'Show Date Available','SHOW_PRODUCT_MUSIC_INFO_DATE_AVAILABLE','1','Display Date Available on Product Info 0= off 1= on',2,9,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(30,'Show Date Added','SHOW_PRODUCT_MUSIC_INFO_DATE_ADDED','1','Display Date Added on Product Info 0= off 1= on',2,10,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(31,'Show Starting At text on Price','SHOW_PRODUCT_MUSIC_INFO_STARTING_AT','1','Display Starting At text on products with attributes Product Info 0= off 1= on',2,12,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(32,'Show Product Additional Images','SHOW_PRODUCT_MUSIC_INFO_ADDITIONAL_IMAGES','1','Display Additional Images on Product Info 0= off 1= on',2,13,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(33,'Show Product Tell a Friend button','SHOW_PRODUCT_MUSIC_INFO_TELL_A_FRIEND','1','Display the Tell a Friend button on Product Info<br /><br />Note: Turning this setting off does not affect the Tell a Friend box in the columns and turning off the Tell a Friend box does not affect the button<br />0= off 1= on',2,15,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(34,'Product Free Shipping Image Status - Catalog','SHOW_PRODUCT_MUSIC_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH','0','Show the Free Shipping image/text in the catalog?',2,16,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(35,'Product Price Tax Class Default - When adding new products?','DEFAULT_PRODUCT_MUSIC_TAX_CLASS_ID','0','What should the Product Price Tax Class Default ID be when adding new products?',2,100,NULL,'2009-05-30 08:43:48','',''),(36,'Product Virtual Default Status - Skip Shipping Address - When adding new products?','DEFAULT_PRODUCT_MUSIC_PRODUCTS_VIRTUAL','0','Default Virtual Product status to be ON when adding new products?',2,101,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(37,'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?','DEFAULT_PRODUCT_MUSIC_PRODUCTS_IS_ALWAYS_FREE_SHIPPING','0','What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping',2,102,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), '),(38,'Show Product Reviews Count','SHOW_DOCUMENT_GENERAL_INFO_REVIEWS_COUNT','1','Display Product Reviews Count on Product Info 0= off 1= on',3,7,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(39,'Show Product Reviews Button','SHOW_DOCUMENT_GENERAL_INFO_REVIEWS','1','Display Product Reviews Button on Product Info 0= off 1= on',3,8,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(40,'Show Date Available','SHOW_DOCUMENT_GENERAL_INFO_DATE_AVAILABLE','1','Display Date Available on Product Info 0= off 1= on',3,9,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(41,'Show Date Added','SHOW_DOCUMENT_GENERAL_INFO_DATE_ADDED','1','Display Date Added on Product Info 0= off 1= on',3,10,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(42,'Show Product Tell a Friend button','SHOW_DOCUMENT_GENERAL_INFO_TELL_A_FRIEND','1','Display the Tell a Friend button on Product Info<br /><br />Note: Turning this setting off does not affect the Tell a Friend box in the columns and turning off the Tell a Friend box does not affect the button<br />0= off 1= on',3,15,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(43,'Show Product URL','SHOW_DOCUMENT_GENERAL_INFO_URL','1','Display URL on Product Info 0= off 1= on',3,11,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(44,'Show Product Additional Images','SHOW_DOCUMENT_GENERAL_INFO_ADDITIONAL_IMAGES','1','Display Additional Images on Product Info 0= off 1= on',3,13,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(45,'Show Model Number','SHOW_DOCUMENT_PRODUCT_INFO_MODEL','1','Display Model Number on Product Info 0= off 1= on',4,1,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(46,'Show Weight','SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT','0','Display Weight on Product Info 0= off 1= on',4,2,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(47,'Show Attribute Weight','SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT_ATTRIBUTES','1','Display Attribute Weight on Product Info 0= off 1= on',4,3,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(48,'Show Manufacturer','SHOW_DOCUMENT_PRODUCT_INFO_MANUFACTURER','1','Display Manufacturer Name on Product Info 0= off 1= on',4,4,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(49,'Show Quantity in Shopping Cart','SHOW_DOCUMENT_PRODUCT_INFO_IN_CART_QTY','1','Display Quantity in Current Shopping Cart on Product Info 0= off 1= on',4,5,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(50,'Show Quantity in Stock','SHOW_DOCUMENT_PRODUCT_INFO_QUANTITY','0','Display Quantity in Stock on Product Info 0= off 1= on',4,6,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(51,'Show Product Reviews Count','SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS_COUNT','1','Display Product Reviews Count on Product Info 0= off 1= on',4,7,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(52,'Show Product Reviews Button','SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS','1','Display Product Reviews Button on Product Info 0= off 1= on',4,8,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(53,'Show Date Available','SHOW_DOCUMENT_PRODUCT_INFO_DATE_AVAILABLE','1','Display Date Available on Product Info 0= off 1= on',4,9,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(54,'Show Date Added','SHOW_DOCUMENT_PRODUCT_INFO_DATE_ADDED','1','Display Date Added on Product Info 0= off 1= on',4,10,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(55,'Show Product URL','SHOW_DOCUMENT_PRODUCT_INFO_URL','1','Display URL on Product Info 0= off 1= on',4,11,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(56,'Show Product Additional Images','SHOW_DOCUMENT_PRODUCT_INFO_ADDITIONAL_IMAGES','1','Display Additional Images on Product Info 0= off 1= on',4,13,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(57,'Show Starting At text on Price','SHOW_DOCUMENT_PRODUCT_INFO_STARTING_AT','1','Display Starting At text on products with attributes Product Info 0= off 1= on',4,12,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(58,'Show Product Tell a Friend button','SHOW_DOCUMENT_PRODUCT_INFO_TELL_A_FRIEND','1','Display the Tell a Friend button on Product Info<br /><br />Note: Turning this setting off does not affect the Tell a Friend box in the columns and turning off the Tell a Friend box does not affect the button<br />0= off 1= on',4,15,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(59,'Product Free Shipping Image Status - Catalog','SHOW_DOCUMENT_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH','0','Show the Free Shipping image/text in the catalog?',4,16,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(60,'Product Price Tax Class Default - When adding new products?','DEFAULT_DOCUMENT_PRODUCT_TAX_CLASS_ID','0','What should the Product Price Tax Class Default ID be when adding new products?',4,100,NULL,'2009-05-30 08:43:48','',''),(61,'Product Virtual Default Status - Skip Shipping Address - When adding new products?','DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_VIRTUAL','0','Default Virtual Product status to be ON when adding new products?',4,101,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(62,'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?','DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING','0','What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping',4,102,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), '),(63,'Show Model Number','SHOW_PRODUCT_FREE_SHIPPING_INFO_MODEL','1','Display Model Number on Product Info 0= off 1= on',5,1,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(64,'Show Weight','SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT','0','Display Weight on Product Info 0= off 1= on',5,2,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(65,'Show Attribute Weight','SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT_ATTRIBUTES','1','Display Attribute Weight on Product Info 0= off 1= on',5,3,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(66,'Show Manufacturer','SHOW_PRODUCT_FREE_SHIPPING_INFO_MANUFACTURER','1','Display Manufacturer Name on Product Info 0= off 1= on',5,4,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(67,'Show Quantity in Shopping Cart','SHOW_PRODUCT_FREE_SHIPPING_INFO_IN_CART_QTY','1','Display Quantity in Current Shopping Cart on Product Info 0= off 1= on',5,5,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(68,'Show Quantity in Stock','SHOW_PRODUCT_FREE_SHIPPING_INFO_QUANTITY','1','Display Quantity in Stock on Product Info 0= off 1= on',5,6,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(69,'Show Product Reviews Count','SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS_COUNT','1','Display Product Reviews Count on Product Info 0= off 1= on',5,7,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(70,'Show Product Reviews Button','SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS','1','Display Product Reviews Button on Product Info 0= off 1= on',5,8,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(71,'Show Date Available','SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_AVAILABLE','0','Display Date Available on Product Info 0= off 1= on',5,9,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(72,'Show Date Added','SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_ADDED','1','Display Date Added on Product Info 0= off 1= on',5,10,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(73,'Show Product URL','SHOW_PRODUCT_FREE_SHIPPING_INFO_URL','1','Display URL on Product Info 0= off 1= on',5,11,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(74,'Show Product Additional Images','SHOW_PRODUCT_FREE_SHIPPING_INFO_ADDITIONAL_IMAGES','1','Display Additional Images on Product Info 0= off 1= on',5,13,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(75,'Show Starting At text on Price','SHOW_PRODUCT_FREE_SHIPPING_INFO_STARTING_AT','1','Display Starting At text on products with attributes Product Info 0= off 1= on',5,12,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(76,'Show Product Tell a Friend button','SHOW_PRODUCT_FREE_SHIPPING_INFO_TELL_A_FRIEND','1','Display the Tell a Friend button on Product Info<br /><br />Note: Turning this setting off does not affect the Tell a Friend box in the columns and turning off the Tell a Friend box does not affect the button<br />0= off 1= on',5,15,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(77,'Product Free Shipping Image Status - Catalog','SHOW_PRODUCT_FREE_SHIPPING_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH','1','Show the Free Shipping image/text in the catalog?',5,16,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(78,'Product Price Tax Class Default - When adding new products?','DEFAULT_PRODUCT_FREE_SHIPPING_TAX_CLASS_ID','0','What should the Product Price Tax Class Default ID be when adding new products?',5,100,NULL,'2009-05-30 08:43:48','',''),(79,'Product Virtual Default Status - Skip Shipping Address - When adding new products?','DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_VIRTUAL','0','Default Virtual Product status to be ON when adding new products?',5,101,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(80,'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?','DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_IS_ALWAYS_FREE_SHIPPING','1','What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping',5,102,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), '),(81,'Show Metatags Title Default - Product Title','SHOW_PRODUCT_INFO_METATAGS_TITLE_STATUS','1','Display Product Title in Meta Tags Title 0= off 1= on',1,50,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(82,'Show Metatags Title Default - Product Name','SHOW_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS','1','Display Product Name in Meta Tags Title 0= off 1= on',1,51,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(83,'Show Metatags Title Default - Product Model','SHOW_PRODUCT_INFO_METATAGS_MODEL_STATUS','1','Display Product Model in Meta Tags Title 0= off 1= on',1,52,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(84,'Show Metatags Title Default - Product Price','SHOW_PRODUCT_INFO_METATAGS_PRICE_STATUS','1','Display Product Price in Meta Tags Title 0= off 1= on',1,53,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(85,'Show Metatags Title Default - Product Tagline','SHOW_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS','1','Display Product Tagline in Meta Tags Title 0= off 1= on',1,54,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(86,'Show Metatags Title Default - Product Title','SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_STATUS','1','Display Product Title in Meta Tags Title 0= off 1= on',2,50,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(87,'Show Metatags Title Default - Product Name','SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRODUCTS_NAME_STATUS','1','Display Product Name in Meta Tags Title 0= off 1= on',2,51,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(88,'Show Metatags Title Default - Product Model','SHOW_PRODUCT_MUSIC_INFO_METATAGS_MODEL_STATUS','1','Display Product Model in Meta Tags Title 0= off 1= on',2,52,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(89,'Show Metatags Title Default - Product Price','SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRICE_STATUS','1','Display Product Price in Meta Tags Title 0= off 1= on',2,53,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(90,'Show Metatags Title Default - Product Tagline','SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_TAGLINE_STATUS','1','Display Product Tagline in Meta Tags Title 0= off 1= on',2,54,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(91,'Show Metatags Title Default - Document Title','SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_STATUS','1','Display Document Title in Meta Tags Title 0= off 1= on',3,50,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(92,'Show Metatags Title Default - Document Name','SHOW_DOCUMENT_GENERAL_INFO_METATAGS_PRODUCTS_NAME_STATUS','1','Display Document Name in Meta Tags Title 0= off 1= on',3,51,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(93,'Show Metatags Title Default - Document Tagline','SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_TAGLINE_STATUS','1','Display Document Tagline in Meta Tags Title 0= off 1= on',3,54,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(94,'Show Metatags Title Default - Document Title','SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_STATUS','1','Display Document Title in Meta Tags Title 0= off 1= on',4,50,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(95,'Show Metatags Title Default - Document Name','SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS','1','Display Document Name in Meta Tags Title 0= off 1= on',4,51,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(96,'Show Metatags Title Default - Document Model','SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_MODEL_STATUS','1','Display Document Model in Meta Tags Title 0= off 1= on',4,52,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(97,'Show Metatags Title Default - Document Price','SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRICE_STATUS','1','Display Document Price in Meta Tags Title 0= off 1= on',4,53,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(98,'Show Metatags Title Default - Document Tagline','SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS','1','Display Document Tagline in Meta Tags Title 0= off 1= on',4,54,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(99,'Show Metatags Title Default - Product Title','SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_STATUS','1','Display Product Title in Meta Tags Title 0= off 1= on',5,50,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(100,'Show Metatags Title Default - Product Name','SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRODUCTS_NAME_STATUS','1','Display Product Name in Meta Tags Title 0= off 1= on',5,51,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(101,'Show Metatags Title Default - Product Model','SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_MODEL_STATUS','1','Display Product Model in Meta Tags Title 0= off 1= on',5,52,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(102,'Show Metatags Title Default - Product Price','SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRICE_STATUS','1','Display Product Price in Meta Tags Title 0= off 1= on',5,53,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(103,'Show Metatags Title Default - Product Tagline','SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_TAGLINE_STATUS','1','Display Product Tagline in Meta Tags Title 0= off 1= on',5,54,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(104,'PRODUCT Attribute is Display Only - Default','DEFAULT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY','0','PRODUCT Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes',1,200,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(105,'PRODUCT Attribute is Free - Default','DEFAULT_PRODUCT_ATTRIBUTE_IS_FREE','1','PRODUCT Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes',1,201,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(106,'PRODUCT Attribute is Default - Default','DEFAULT_PRODUCT_ATTRIBUTES_DEFAULT','0','PRODUCT Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes',1,202,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(107,'PRODUCT Attribute is Discounted - Default','DEFAULT_PRODUCT_ATTRIBUTES_DISCOUNTED','1','PRODUCT Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes',1,203,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(108,'PRODUCT Attribute is Included in Base Price - Default','DEFAULT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED','1','PRODUCT Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes',1,204,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(109,'PRODUCT Attribute is Required - Default','DEFAULT_PRODUCT_ATTRIBUTES_REQUIRED','0','PRODUCT Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes',1,205,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(110,'PRODUCT Attribute Price Prefix - Default','DEFAULT_PRODUCT_PRICE_PREFIX','1','PRODUCT Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -',1,206,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(111,'PRODUCT Attribute Weight Prefix - Default','DEFAULT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX','1','PRODUCT Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -',1,207,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(112,'MUSIC Attribute is Display Only - Default','DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISPLAY_ONLY','0','MUSIC Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes',2,200,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(113,'MUSIC Attribute is Free - Default','DEFAULT_PRODUCT_MUSIC_ATTRIBUTE_IS_FREE','1','MUSIC Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes',2,201,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(114,'MUSIC Attribute is Default - Default','DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DEFAULT','0','MUSIC Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes',2,202,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(115,'MUSIC Attribute is Discounted - Default','DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISCOUNTED','1','MUSIC Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes',2,203,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(116,'MUSIC Attribute is Included in Base Price - Default','DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_PRICE_BASE_INCLUDED','1','MUSIC Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes',2,204,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(117,'MUSIC Attribute is Required - Default','DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_REQUIRED','0','MUSIC Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes',2,205,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(118,'MUSIC Attribute Price Prefix - Default','DEFAULT_PRODUCT_MUSIC_PRICE_PREFIX','1','MUSIC Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -',2,206,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(119,'MUSIC Attribute Weight Prefix - Default','DEFAULT_PRODUCT_MUSIC_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX','1','MUSIC Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -',2,207,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(120,'DOCUMENT GENERAL Attribute is Display Only - Default','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISPLAY_ONLY','0','DOCUMENT GENERAL Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes',3,200,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(121,'DOCUMENT GENERAL Attribute is Free - Default','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTE_IS_FREE','1','DOCUMENT GENERAL Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes',3,201,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(122,'DOCUMENT GENERAL Attribute is Default - Default','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DEFAULT','0','DOCUMENT GENERAL Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes',3,202,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(123,'DOCUMENT GENERAL Attribute is Discounted - Default','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISCOUNTED','1','DOCUMENT GENERAL Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes',3,203,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(124,'DOCUMENT GENERAL Attribute is Included in Base Price - Default','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_PRICE_BASE_INCLUDED','1','DOCUMENT GENERAL Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes',3,204,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(125,'DOCUMENT GENERAL Attribute is Required - Default','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_REQUIRED','0','DOCUMENT GENERAL Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes',3,205,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(126,'DOCUMENT GENERAL Attribute Price Prefix - Default','DEFAULT_DOCUMENT_GENERAL_PRICE_PREFIX','1','DOCUMENT GENERAL Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -',3,206,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(127,'DOCUMENT GENERAL Attribute Weight Prefix - Default','DEFAULT_DOCUMENT_GENERAL_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX','1','DOCUMENT GENERAL Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -',3,207,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(128,'DOCUMENT PRODUCT Attribute is Display Only - Default','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY','0','DOCUMENT PRODUCT Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes',4,200,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(129,'DOCUMENT PRODUCT Attribute is Free - Default','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTE_IS_FREE','1','DOCUMENT PRODUCT Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes',4,201,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(130,'DOCUMENT PRODUCT Attribute is Default - Default','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DEFAULT','0','DOCUMENT PRODUCT Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes',4,202,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(131,'DOCUMENT PRODUCT Attribute is Discounted - Default','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISCOUNTED','1','DOCUMENT PRODUCT Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes',4,203,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(132,'DOCUMENT PRODUCT Attribute is Included in Base Price - Default','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED','1','DOCUMENT PRODUCT Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes',4,204,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(133,'DOCUMENT PRODUCT Attribute is Required - Default','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_REQUIRED','0','DOCUMENT PRODUCT Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes',4,205,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(134,'DOCUMENT PRODUCT Attribute Price Prefix - Default','DEFAULT_DOCUMENT_PRODUCT_PRICE_PREFIX','1','DOCUMENT PRODUCT Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -',4,206,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(135,'DOCUMENT PRODUCT Attribute Weight Prefix - Default','DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX','1','DOCUMENT PRODUCT Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -',4,207,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(136,'PRODUCT FREE SHIPPING Attribute is Display Only - Default','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISPLAY_ONLY','0','PRODUCT FREE SHIPPING Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes',5,201,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(137,'PRODUCT FREE SHIPPING Attribute is Free - Default','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTE_IS_FREE','1','PRODUCT FREE SHIPPING Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes',5,201,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(138,'PRODUCT FREE SHIPPING Attribute is Default - Default','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DEFAULT','0','PRODUCT FREE SHIPPING Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes',5,202,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(139,'PRODUCT FREE SHIPPING Attribute is Discounted - Default','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISCOUNTED','1','PRODUCT FREE SHIPPING Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes',5,203,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(140,'PRODUCT FREE SHIPPING Attribute is Included in Base Price - Default','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_PRICE_BASE_INCLUDED','1','PRODUCT FREE SHIPPING Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes',5,204,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(141,'PRODUCT FREE SHIPPING Attribute is Required - Default','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_REQUIRED','0','PRODUCT FREE SHIPPING Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes',5,205,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(142,'PRODUCT FREE SHIPPING Attribute Price Prefix - Default','DEFAULT_PRODUCT_FREE_SHIPPING_PRICE_PREFIX','1','PRODUCT FREE SHIPPING Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -',5,206,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(143,'PRODUCT FREE SHIPPING Attribute Weight Prefix - Default','DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX','1','PRODUCT FREE SHIPPING Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -',5,207,NULL,'2009-05-30 08:43:48',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
/*!40000 ALTER TABLE `zc_product_type_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_product_types`
--

DROP TABLE IF EXISTS `zc_product_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_product_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL DEFAULT '',
  `type_handler` varchar(255) NOT NULL DEFAULT '',
  `type_master_type` int(11) NOT NULL DEFAULT '1',
  `allow_add_to_cart` char(1) NOT NULL DEFAULT 'Y',
  `default_image` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`type_id`),
  KEY `idx_type_master_type_zen` (`type_master_type`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_product_types`
--

LOCK TABLES `zc_product_types` WRITE;
/*!40000 ALTER TABLE `zc_product_types` DISABLE KEYS */;
INSERT INTO `zc_product_types` VALUES (1,'Product - General','product',1,'Y','','2009-05-30 08:43:47','2009-05-30 08:43:47'),(2,'Product - Music','product_music',1,'Y','','2009-05-30 08:43:47','2009-05-30 08:43:47'),(3,'Document - General','document_general',3,'N','','2009-05-30 08:43:47','2009-05-30 08:43:47'),(4,'Document - Product','document_product',3,'Y','','2009-05-30 08:43:47','2009-05-30 08:43:47'),(5,'Product - Free Shipping','product_free_shipping',1,'Y','','2009-05-30 08:43:47','2009-05-30 08:43:47');
/*!40000 ALTER TABLE `zc_product_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_product_types_to_category`
--

DROP TABLE IF EXISTS `zc_product_types_to_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_product_types_to_category` (
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  KEY `idx_category_id_zen` (`category_id`),
  KEY `idx_product_type_id_zen` (`product_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_product_types_to_category`
--

LOCK TABLES `zc_product_types_to_category` WRITE;
/*!40000 ALTER TABLE `zc_product_types_to_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_product_types_to_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_products`
--

DROP TABLE IF EXISTS `zc_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_products` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_type` int(11) NOT NULL DEFAULT '1',
  `products_quantity` float NOT NULL DEFAULT '0',
  `products_model` varchar(32) DEFAULT NULL,
  `products_image` varchar(64) DEFAULT NULL,
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_virtual` tinyint(1) NOT NULL DEFAULT '0',
  `products_date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `products_last_modified` datetime DEFAULT NULL,
  `products_date_available` datetime DEFAULT NULL,
  `products_weight` float NOT NULL DEFAULT '0',
  `products_status` tinyint(1) NOT NULL DEFAULT '0',
  `products_tax_class_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) DEFAULT NULL,
  `products_ordered` float NOT NULL DEFAULT '0',
  `products_quantity_order_min` float NOT NULL DEFAULT '1',
  `products_quantity_order_units` float NOT NULL DEFAULT '1',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_call` tinyint(1) NOT NULL DEFAULT '0',
  `products_quantity_mixed` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_always_free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `products_qty_box_status` tinyint(1) NOT NULL DEFAULT '1',
  `products_quantity_order_max` float NOT NULL DEFAULT '0',
  `products_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_price_sorter` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `master_categories_id` int(11) NOT NULL DEFAULT '0',
  `products_mixed_discount_quantity` tinyint(1) NOT NULL DEFAULT '1',
  `metatags_title_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_products_name_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_model_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_price_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_title_tagline_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`),
  KEY `idx_products_date_added_zen` (`products_date_added`),
  KEY `idx_products_status_zen` (`products_status`),
  KEY `idx_products_date_available_zen` (`products_date_available`),
  KEY `idx_products_ordered_zen` (`products_ordered`),
  KEY `idx_products_model_zen` (`products_model`),
  KEY `idx_products_price_sorter_zen` (`products_price_sorter`),
  KEY `idx_master_categories_id_zen` (`master_categories_id`),
  KEY `idx_products_sort_order_zen` (`products_sort_order`),
  KEY `idx_manufacturers_id_zen` (`manufacturers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_products`
--

LOCK TABLES `zc_products` WRITE;
/*!40000 ALTER TABLE `zc_products` DISABLE KEYS */;
INSERT INTO `zc_products` VALUES (1,1,10,'','',82.6446,0,'2013-09-06 12:50:07','2013-09-06 12:59:32',NULL,0,1,2,0,0,1,1,0,0,0,1,0,0,0,1,0,0,82.6446,1,1,0,0,0,0,0);
/*!40000 ALTER TABLE `zc_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_products_attributes`
--

DROP TABLE IF EXISTS `zc_products_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_products_attributes` (
  `products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `options_id` int(11) NOT NULL DEFAULT '0',
  `options_values_id` int(11) NOT NULL DEFAULT '0',
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) NOT NULL DEFAULT '',
  `attributes_display_only` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_default` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_image` varchar(64) DEFAULT NULL,
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text,
  `attributes_qty_prices_onetime` text,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `attributes_required` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_attributes_id`),
  KEY `idx_id_options_id_values_zen` (`products_id`,`options_id`,`options_values_id`),
  KEY `idx_opt_sort_order_zen` (`products_options_sort_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_products_attributes`
--

LOCK TABLES `zc_products_attributes` WRITE;
/*!40000 ALTER TABLE `zc_products_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_products_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_products_attributes_download`
--

DROP TABLE IF EXISTS `zc_products_attributes_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_products_attributes_download` (
  `products_attributes_id` int(11) NOT NULL DEFAULT '0',
  `products_attributes_filename` varchar(255) NOT NULL DEFAULT '',
  `products_attributes_maxdays` int(2) DEFAULT '0',
  `products_attributes_maxcount` int(2) DEFAULT '0',
  PRIMARY KEY (`products_attributes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_products_attributes_download`
--

LOCK TABLES `zc_products_attributes_download` WRITE;
/*!40000 ALTER TABLE `zc_products_attributes_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_products_attributes_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_products_description`
--

DROP TABLE IF EXISTS `zc_products_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_products_description` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_description` text,
  `products_url` varchar(255) DEFAULT NULL,
  `products_viewed` int(5) DEFAULT '0',
  PRIMARY KEY (`products_id`,`language_id`),
  KEY `idx_products_name_zen` (`products_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_products_description`
--

LOCK TABLES `zc_products_description` WRITE;
/*!40000 ALTER TABLE `zc_products_description` DISABLE KEYS */;
INSERT INTO `zc_products_description` VALUES (1,2,'Start Kit','Test kit','',8),(1,1,'','','',0);
/*!40000 ALTER TABLE `zc_products_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_products_discount_quantity`
--

DROP TABLE IF EXISTS `zc_products_discount_quantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_products_discount_quantity` (
  `discount_id` int(4) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `discount_qty` float NOT NULL DEFAULT '0',
  `discount_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  KEY `idx_id_qty_zen` (`products_id`,`discount_qty`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_products_discount_quantity`
--

LOCK TABLES `zc_products_discount_quantity` WRITE;
/*!40000 ALTER TABLE `zc_products_discount_quantity` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_products_discount_quantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_products_notifications`
--

DROP TABLE IF EXISTS `zc_products_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_products_notifications` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`products_id`,`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_products_notifications`
--

LOCK TABLES `zc_products_notifications` WRITE;
/*!40000 ALTER TABLE `zc_products_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_products_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_products_options`
--

DROP TABLE IF EXISTS `zc_products_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_products_options` (
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_name` varchar(32) NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_options_type` int(5) NOT NULL DEFAULT '0',
  `products_options_length` smallint(2) NOT NULL DEFAULT '32',
  `products_options_comment` varchar(64) DEFAULT NULL,
  `products_options_size` smallint(2) NOT NULL DEFAULT '32',
  `products_options_images_per_row` int(2) DEFAULT '5',
  `products_options_images_style` int(1) DEFAULT '0',
  `products_options_rows` smallint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`products_options_id`,`language_id`),
  KEY `idx_lang_id_zen` (`language_id`),
  KEY `idx_products_options_sort_order_zen` (`products_options_sort_order`),
  KEY `idx_products_options_name_zen` (`products_options_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_products_options`
--

LOCK TABLES `zc_products_options` WRITE;
/*!40000 ALTER TABLE `zc_products_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_products_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_products_options_types`
--

DROP TABLE IF EXISTS `zc_products_options_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_products_options_types` (
  `products_options_types_id` int(11) NOT NULL DEFAULT '0',
  `products_options_types_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`products_options_types_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Track products_options_types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_products_options_types`
--

LOCK TABLES `zc_products_options_types` WRITE;
/*!40000 ALTER TABLE `zc_products_options_types` DISABLE KEYS */;
INSERT INTO `zc_products_options_types` VALUES (0,'Dropdown'),(1,'Text'),(2,'Radio'),(3,'Checkbox'),(4,'File'),(5,'Read Only');
/*!40000 ALTER TABLE `zc_products_options_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_products_options_values`
--

DROP TABLE IF EXISTS `zc_products_options_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_products_options_values` (
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_values_name` varchar(64) NOT NULL DEFAULT '',
  `products_options_values_sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_options_values_id`,`language_id`),
  KEY `idx_products_options_values_name_zen` (`products_options_values_name`),
  KEY `idx_products_options_values_sort_order_zen` (`products_options_values_sort_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_products_options_values`
--

LOCK TABLES `zc_products_options_values` WRITE;
/*!40000 ALTER TABLE `zc_products_options_values` DISABLE KEYS */;
INSERT INTO `zc_products_options_values` VALUES (0,1,'TEXT',0);
/*!40000 ALTER TABLE `zc_products_options_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_products_options_values_to_products_options`
--

DROP TABLE IF EXISTS `zc_products_options_values_to_products_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_products_options_values_to_products_options` (
  `products_options_values_to_products_options_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_options_values_to_products_options_id`),
  KEY `idx_products_options_id_zen` (`products_options_id`),
  KEY `idx_products_options_values_id_zen` (`products_options_values_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_products_options_values_to_products_options`
--

LOCK TABLES `zc_products_options_values_to_products_options` WRITE;
/*!40000 ALTER TABLE `zc_products_options_values_to_products_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_products_options_values_to_products_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_products_to_categories`
--

DROP TABLE IF EXISTS `zc_products_to_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_products_to_categories` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `categories_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`,`categories_id`),
  KEY `idx_cat_prod_id_zen` (`categories_id`,`products_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_products_to_categories`
--

LOCK TABLES `zc_products_to_categories` WRITE;
/*!40000 ALTER TABLE `zc_products_to_categories` DISABLE KEYS */;
INSERT INTO `zc_products_to_categories` VALUES (1,1);
/*!40000 ALTER TABLE `zc_products_to_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_project_version`
--

DROP TABLE IF EXISTS `zc_project_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_project_version` (
  `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `project_version_key` varchar(40) NOT NULL DEFAULT '',
  `project_version_major` varchar(20) NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch1` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch2` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch1_source` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch2_source` varchar(20) NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01',
  PRIMARY KEY (`project_version_id`),
  UNIQUE KEY `idx_project_version_key_zen` (`project_version_key`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Database Version Tracking';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_project_version`
--

LOCK TABLES `zc_project_version` WRITE;
/*!40000 ALTER TABLE `zc_project_version` DISABLE KEYS */;
INSERT INTO `zc_project_version` VALUES (1,'Zen-Cart Main','1','5.1','','','','','Version Update zc_1.5.0->1.5.1','2013-09-05 17:27:30'),(2,'Zen-Cart Database','1','5.1','','','','','Version Update zc_1.5.0->1.5.1','2013-09-05 17:27:30');
/*!40000 ALTER TABLE `zc_project_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_project_version_history`
--

DROP TABLE IF EXISTS `zc_project_version_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_project_version_history` (
  `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `project_version_key` varchar(40) NOT NULL DEFAULT '',
  `project_version_major` varchar(20) NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch` varchar(20) NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01',
  PRIMARY KEY (`project_version_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Database Version Tracking History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_project_version_history`
--

LOCK TABLES `zc_project_version_history` WRITE;
/*!40000 ALTER TABLE `zc_project_version_history` DISABLE KEYS */;
INSERT INTO `zc_project_version_history` VALUES (1,'Zen-Cart Main','1','3.8','','Fresh Installation','2009-05-30 08:43:48'),(2,'Zen-Cart Database','1','3.8','','Fresh Installation','2009-05-30 08:43:48'),(3,'Zen-Cart Main','1','3.8','','Fresh Installation','2009-05-30 08:43:48'),(4,'Zen-Cart Database','1','3.8','','Fresh Installation','2009-05-30 08:43:48'),(5,'Zen-Cart Main','1','3.9h','','Version Update zc_1.3.8->1.3.9h','2011-12-30 23:56:11'),(6,'Zen-Cart Database','1','3.9h','','Version Update zc_1.3.8->1.3.9h','2011-12-30 23:56:11'),(7,'Zen-Cart Main','1','5.0','','Version Update zc_1.3.9->1.5.0','2011-12-30 23:57:33'),(8,'Zen-Cart Database','1','5.0','','Version Update zc_1.3.9->1.5.0','2011-12-30 23:57:33');
/*!40000 ALTER TABLE `zc_project_version_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_query_builder`
--

DROP TABLE IF EXISTS `zc_query_builder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_query_builder` (
  `query_id` int(11) NOT NULL AUTO_INCREMENT,
  `query_category` varchar(40) NOT NULL DEFAULT '',
  `query_name` varchar(80) NOT NULL DEFAULT '',
  `query_description` text NOT NULL,
  `query_string` text NOT NULL,
  `query_keys_list` text NOT NULL,
  PRIMARY KEY (`query_id`),
  UNIQUE KEY `query_name` (`query_name`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Stores queries for re-use in Admin email and report modules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_query_builder`
--

LOCK TABLES `zc_query_builder` WRITE;
/*!40000 ALTER TABLE `zc_query_builder` DISABLE KEYS */;
INSERT INTO `zc_query_builder` VALUES (1,'email','All Customers','Returns all customers name and email address for sending mass emails (ie: for newsletters, coupons, GVs, messages, etc).','select customers_email_address, customers_firstname, customers_lastname from TABLE_CUSTOMERS order by customers_lastname, customers_firstname, customers_email_address',''),(2,'email,newsletters','All Newsletter Subscribers','Returns name and email address of newsletter subscribers','select customers_firstname, customers_lastname, customers_email_address from TABLE_CUSTOMERS where customers_newsletter = \'1\'',''),(3,'email,newsletters','Dormant Customers (>3months) (Subscribers)','Subscribers who HAVE purchased something, but have NOT purchased for at least three months.','select o.date_purchased, c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id AND c.customers_newsletter = 1 GROUP BY c.customers_email_address HAVING max(o.date_purchased) <= subdate(now(),INTERVAL 3 MONTH) ORDER BY c.customers_lastname, c.customers_firstname ASC',''),(4,'email,newsletters','Active customers in past 3 months (Subscribers)','Newsletter subscribers who are also active customers (purchased something) in last 3 months.','select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o where c.customers_newsletter = \'1\' AND c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC',''),(5,'email,newsletters','Active customers in past 3 months (Regardless of subscription status)','All active customers (purchased something) in last 3 months, ignoring newsletter-subscription status.','select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC',''),(6,'email,newsletters','Administrator','Just the email account of the current administrator','select \'ADMIN\' as customers_firstname, admin_name as customers_lastname, admin_email as customers_email_address from TABLE_ADMIN where admin_id = $SESSION:admin_id',''),(7,'email,newsletters','Customers who have never completed a purchase','For sending newsletter to all customers who registered but have never completed a purchase','SELECT DISTINCT c.customers_email_address as customers_email_address, c.customers_lastname as customers_lastname, c.customers_firstname as customers_firstname FROM TABLE_CUSTOMERS c LEFT JOIN  TABLE_ORDERS o ON c.customers_id=o.customers_id WHERE o.date_purchased IS NULL','');
/*!40000 ALTER TABLE `zc_query_builder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_record_artists`
--

DROP TABLE IF EXISTS `zc_record_artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_record_artists` (
  `artists_id` int(11) NOT NULL AUTO_INCREMENT,
  `artists_name` varchar(32) NOT NULL DEFAULT '',
  `artists_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`artists_id`),
  KEY `idx_rec_artists_name_zen` (`artists_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_record_artists`
--

LOCK TABLES `zc_record_artists` WRITE;
/*!40000 ALTER TABLE `zc_record_artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_record_artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_record_artists_info`
--

DROP TABLE IF EXISTS `zc_record_artists_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_record_artists_info` (
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `artists_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`artists_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_record_artists_info`
--

LOCK TABLES `zc_record_artists_info` WRITE;
/*!40000 ALTER TABLE `zc_record_artists_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_record_artists_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_record_company`
--

DROP TABLE IF EXISTS `zc_record_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_record_company` (
  `record_company_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_company_name` varchar(32) NOT NULL DEFAULT '',
  `record_company_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`record_company_id`),
  KEY `idx_rec_company_name_zen` (`record_company_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_record_company`
--

LOCK TABLES `zc_record_company` WRITE;
/*!40000 ALTER TABLE `zc_record_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_record_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_record_company_info`
--

DROP TABLE IF EXISTS `zc_record_company_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_record_company_info` (
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `record_company_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`record_company_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_record_company_info`
--

LOCK TABLES `zc_record_company_info` WRITE;
/*!40000 ALTER TABLE `zc_record_company_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_record_company_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_reviews`
--

DROP TABLE IF EXISTS `zc_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_reviews` (
  `reviews_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) DEFAULT NULL,
  `customers_name` varchar(64) NOT NULL DEFAULT '',
  `reviews_rating` int(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reviews_read` int(5) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`reviews_id`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_customers_id_zen` (`customers_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_date_added_zen` (`date_added`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_reviews`
--

LOCK TABLES `zc_reviews` WRITE;
/*!40000 ALTER TABLE `zc_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_reviews_description`
--

DROP TABLE IF EXISTS `zc_reviews_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_reviews_description` (
  `reviews_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `reviews_text` text NOT NULL,
  PRIMARY KEY (`reviews_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_reviews_description`
--

LOCK TABLES `zc_reviews_description` WRITE;
/*!40000 ALTER TABLE `zc_reviews_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_reviews_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_salemaker_sales`
--

DROP TABLE IF EXISTS `zc_salemaker_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_salemaker_sales` (
  `sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_status` tinyint(4) NOT NULL DEFAULT '0',
  `sale_name` varchar(30) NOT NULL DEFAULT '',
  `sale_deduction_value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_deduction_type` tinyint(4) NOT NULL DEFAULT '0',
  `sale_pricerange_from` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_pricerange_to` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_specials_condition` tinyint(4) NOT NULL DEFAULT '0',
  `sale_categories_selected` text,
  `sale_categories_all` text,
  `sale_date_start` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_end` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_added` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_last_modified` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_status_change` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`sale_id`),
  KEY `idx_sale_status_zen` (`sale_status`),
  KEY `idx_sale_date_start_zen` (`sale_date_start`),
  KEY `idx_sale_date_end_zen` (`sale_date_end`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_salemaker_sales`
--

LOCK TABLES `zc_salemaker_sales` WRITE;
/*!40000 ALTER TABLE `zc_salemaker_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_salemaker_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_sessions`
--

DROP TABLE IF EXISTS `zc_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_sessions` (
  `sesskey` varchar(64) NOT NULL DEFAULT '',
  `expiry` int(11) unsigned NOT NULL DEFAULT '0',
  `value` mediumblob NOT NULL,
  PRIMARY KEY (`sesskey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_sessions`
--

LOCK TABLES `zc_sessions` WRITE;
/*!40000 ALTER TABLE `zc_sessions` DISABLE KEYS */;
INSERT INTO `zc_sessions` VALUES ('ca93111b97d4c564570b8954d1b84bed',1378547724,'c2VjdXJpdHlUb2tlbnxzOjMyOiIwM2QyYTJhNWI1MTU0MmFiOTU5MTE3MDA3YzkzNTkwOSI7bGFuZ3VhZ2V8czo1OiJkdXRjaCI7bGFuZ3VhZ2VzX2lkfHM6MToiMiI7bGFuZ3VhZ2VzX2NvZGV8czoyOiJubCI7c2VsZWN0ZWRfYm94fHM6MTM6ImNvbmZpZ3VyYXRpb24iO2h0bWxfZWRpdG9yX3ByZWZlcmVuY2Vfc3RhdHVzfHM6NDoiTk9ORSI7'),('0d9596d61752f67418b308294d6f5238',1378573692,'c2VjdXJpdHlUb2tlbnxzOjMyOiI3ZmU2NDM2ODcxZmNmZTQ5ZDYxYTE4ZjczOWFhMDJmYyI7Y3VzdG9tZXJzX2hvc3RfYWRkcmVzc3xzOjMzOiJEOTdBNjg4OC5jbS0zLTNiLmR5bmFtaWMuemlnZ28ubmwiO2NhcnRJRHxzOjA6IiI7Y2FydHxPOjEyOiJzaG9wcGluZ0NhcnQiOjc6e3M6ODoiY29udGVudHMiO2E6MDp7fXM6NToidG90YWwiO2k6MDtzOjY6IndlaWdodCI7aTowO3M6MTI6ImNvbnRlbnRfdHlwZSI7YjowO3M6MTg6ImZyZWVfc2hpcHBpbmdfaXRlbSI7aTowO3M6MjA6ImZyZWVfc2hpcHBpbmdfd2VpZ2h0IjtpOjA7czoxOToiZnJlZV9zaGlwcGluZ19wcmljZSI7aTowO31uYXZpZ2F0aW9ufE86MTc6Im5hdmlnYXRpb25IaXN0b3J5IjoyOntzOjQ6InBhdGgiO2E6MTp7aTowO2E6NDp7czo0OiJwYWdlIjtzOjU6ImluZGV4IjtzOjQ6Im1vZGUiO3M6NjoiTk9OU1NMIjtzOjM6ImdldCI7czowOiIiO3M6NDoicG9zdCI7YTowOnt9fX1zOjg6InNuYXBzaG90IjthOjA6e319Y2hlY2tfdmFsaWR8czo0OiJ0cnVlIjtsYW5ndWFnZXxzOjU6ImR1dGNoIjtsYW5ndWFnZXNfaWR8czoxOiIyIjtsYW5ndWFnZXNfY29kZXxzOjI6Im5sIjtjdXJyZW5jeXxzOjM6IkVVUiI7dG9kYXlfaXN8czoxMDoiMjAxMy0wOS0wNyI7dXBkYXRlRXhwaXJhdGlvbnN8YjoxO3Nlc3Npb25fY291bnRlcnxiOjE7Y3VzdG9tZXJzX2lwX2FkZHJlc3N8czoxNToiMjE3LjEyMi4xMDQuMTM2Ijs=');
/*!40000 ALTER TABLE `zc_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_specials`
--

DROP TABLE IF EXISTS `zc_specials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_specials` (
  `specials_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `specials_new_products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `specials_date_added` datetime DEFAULT NULL,
  `specials_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `specials_date_available` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`specials_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_date_avail_zen` (`specials_date_available`),
  KEY `idx_expires_date_zen` (`expires_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_specials`
--

LOCK TABLES `zc_specials` WRITE;
/*!40000 ALTER TABLE `zc_specials` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_specials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_tax_class`
--

DROP TABLE IF EXISTS `zc_tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_title` varchar(32) NOT NULL DEFAULT '',
  `tax_class_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_tax_class`
--

LOCK TABLES `zc_tax_class` WRITE;
/*!40000 ALTER TABLE `zc_tax_class` DISABLE KEYS */;
INSERT INTO `zc_tax_class` VALUES (1,'Taxable Goods','The following types of products are included: non-food, services, etc',NULL,'2009-05-30 08:43:47'),(2,'BTW','',NULL,'2013-09-06 12:08:24');
/*!40000 ALTER TABLE `zc_tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_tax_rates`
--

DROP TABLE IF EXISTS `zc_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_tax_rates` (
  `tax_rates_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_zone_id` int(11) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL DEFAULT '0',
  `tax_priority` int(5) DEFAULT '1',
  `tax_rate` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `tax_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`tax_rates_id`),
  KEY `idx_tax_zone_id_zen` (`tax_zone_id`),
  KEY `idx_tax_class_id_zen` (`tax_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_tax_rates`
--

LOCK TABLES `zc_tax_rates` WRITE;
/*!40000 ALTER TABLE `zc_tax_rates` DISABLE KEYS */;
INSERT INTO `zc_tax_rates` VALUES (2,2,2,0,21.0000,'NL BTW',NULL,'2013-09-06 12:13:14');
/*!40000 ALTER TABLE `zc_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_template_select`
--

DROP TABLE IF EXISTS `zc_template_select`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_template_select` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_dir` varchar(64) NOT NULL DEFAULT '',
  `template_language` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `idx_tpl_lang_zen` (`template_language`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_template_select`
--

LOCK TABLES `zc_template_select` WRITE;
/*!40000 ALTER TABLE `zc_template_select` DISABLE KEYS */;
INSERT INTO `zc_template_select` VALUES (1,'classic','0');
/*!40000 ALTER TABLE `zc_template_select` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_upgrade_exceptions`
--

DROP TABLE IF EXISTS `zc_upgrade_exceptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_upgrade_exceptions` (
  `upgrade_exception_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `sql_file` varchar(50) DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `errordate` datetime DEFAULT '0001-01-01 00:00:00',
  `sqlstatement` text,
  PRIMARY KEY (`upgrade_exception_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_upgrade_exceptions`
--

LOCK TABLES `zc_upgrade_exceptions` WRITE;
/*!40000 ALTER TABLE `zc_upgrade_exceptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `zc_upgrade_exceptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_whos_online`
--

DROP TABLE IF EXISTS `zc_whos_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_whos_online` (
  `customer_id` int(11) DEFAULT NULL,
  `full_name` varchar(64) NOT NULL DEFAULT '',
  `session_id` varchar(128) NOT NULL DEFAULT '',
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `time_entry` varchar(14) NOT NULL DEFAULT '',
  `time_last_click` varchar(14) NOT NULL DEFAULT '',
  `last_page_url` varchar(255) NOT NULL DEFAULT '',
  `host_address` text NOT NULL,
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  KEY `idx_ip_address_zen` (`ip_address`),
  KEY `idx_session_id_zen` (`session_id`),
  KEY `idx_customer_id_zen` (`customer_id`),
  KEY `idx_time_entry_zen` (`time_entry`),
  KEY `idx_time_last_click_zen` (`time_last_click`),
  KEY `idx_last_page_url_zen` (`last_page_url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_whos_online`
--

LOCK TABLES `zc_whos_online` WRITE;
/*!40000 ALTER TABLE `zc_whos_online` DISABLE KEYS */;
INSERT INTO `zc_whos_online` VALUES (0,'&yen;Guest','0d9596d61752f67418b308294d6f5238','217.122.104.136','1378572249','1378572249','/zcrt/','D97A6888.cm-3-3b.dynamic.ziggo.nl','Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/28.0.1500.71 Chrome/28.0.1500.71 Safari/537.36');
/*!40000 ALTER TABLE `zc_whos_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_zones`
--

DROP TABLE IF EXISTS `zc_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_zones` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_code` varchar(32) NOT NULL DEFAULT '',
  `zone_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`zone_id`),
  KEY `idx_zone_country_id_zen` (`zone_country_id`),
  KEY `idx_zone_code_zen` (`zone_code`)
) ENGINE=MyISAM AUTO_INCREMENT=190 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_zones`
--

LOCK TABLES `zc_zones` WRITE;
/*!40000 ALTER TABLE `zc_zones` DISABLE KEYS */;
INSERT INTO `zc_zones` VALUES (1,223,'AL','Alabama'),(2,223,'AK','Alaska'),(3,223,'AS','American Samoa'),(4,223,'AZ','Arizona'),(5,223,'AR','Arkansas'),(7,223,'AA','Armed Forces Americas'),(9,223,'AE','Armed Forces Europe'),(11,223,'AP','Armed Forces Pacific'),(12,223,'CA','California'),(13,223,'CO','Colorado'),(14,223,'CT','Connecticut'),(15,223,'DE','Delaware'),(16,223,'DC','District of Columbia'),(17,223,'FM','Federated States Of Micronesia'),(18,223,'FL','Florida'),(19,223,'GA','Georgia'),(20,223,'GU','Guam'),(21,223,'HI','Hawaii'),(22,223,'ID','Idaho'),(23,223,'IL','Illinois'),(24,223,'IN','Indiana'),(25,223,'IA','Iowa'),(26,223,'KS','Kansas'),(27,223,'KY','Kentucky'),(28,223,'LA','Louisiana'),(29,223,'ME','Maine'),(30,223,'MH','Marshall Islands'),(31,223,'MD','Maryland'),(32,223,'MA','Massachusetts'),(33,223,'MI','Michigan'),(34,223,'MN','Minnesota'),(35,223,'MS','Mississippi'),(36,223,'MO','Missouri'),(37,223,'MT','Montana'),(38,223,'NE','Nebraska'),(39,223,'NV','Nevada'),(40,223,'NH','New Hampshire'),(41,223,'NJ','New Jersey'),(42,223,'NM','New Mexico'),(43,223,'NY','New York'),(44,223,'NC','North Carolina'),(45,223,'ND','North Dakota'),(46,223,'MP','Northern Mariana Islands'),(47,223,'OH','Ohio'),(48,223,'OK','Oklahoma'),(49,223,'OR','Oregon'),(50,163,'PW','Palau'),(51,223,'PA','Pennsylvania'),(52,223,'PR','Puerto Rico'),(53,223,'RI','Rhode Island'),(54,223,'SC','South Carolina'),(55,223,'SD','South Dakota'),(56,223,'TN','Tennessee'),(57,223,'TX','Texas'),(58,223,'UT','Utah'),(59,223,'VT','Vermont'),(60,223,'VI','Virgin Islands'),(61,223,'VA','Virginia'),(62,223,'WA','Washington'),(63,223,'WV','West Virginia'),(64,223,'WI','Wisconsin'),(65,223,'WY','Wyoming'),(66,38,'AB','Alberta'),(67,38,'BC','British Columbia'),(68,38,'MB','Manitoba'),(69,38,'NL','Newfoundland'),(70,38,'NB','New Brunswick'),(71,38,'NS','Nova Scotia'),(72,38,'NT','Northwest Territories'),(73,38,'NU','Nunavut'),(74,38,'ON','Ontario'),(75,38,'PE','Prince Edward Island'),(76,38,'QC','Quebec'),(77,38,'SK','Saskatchewan'),(78,38,'YT','Yukon Territory'),(79,81,'NDS','Niedersachsen'),(80,81,'BAW','Baden W√ºrtemberg'),(81,81,'BAY','Bayern'),(82,81,'BER','Berlin'),(83,81,'BRG','Brandenburg'),(84,81,'BRE','Bremen'),(85,81,'HAM','Hamburg'),(86,81,'HES','Hessen'),(87,81,'MEC','Mecklenburg-Vorpommern'),(88,81,'NRW','Nordrhein-Westfalen'),(89,81,'RHE','Rheinland-Pfalz'),(90,81,'SAR','Saarland'),(91,81,'SAS','Sachsen'),(92,81,'SAC','Sachsen-Anhalt'),(93,81,'SCN','Schleswig-Holstein'),(94,81,'THE','Thringen'),(95,14,'WI','Wien'),(96,14,'NO','Niedersterreich'),(97,14,'OO','Obersterreich'),(98,14,'SB','Salzburg'),(99,14,'KN','K√§rnten'),(100,14,'ST','Steiermark'),(101,14,'TI','Tirol'),(102,14,'BL','Burgenland'),(103,14,'VB','Voralberg'),(104,204,'AG','Aargau'),(105,204,'AI','Appenzell Innerrhoden'),(106,204,'AR','Appenzell Ausserrhoden'),(107,204,'BE','Bern'),(108,204,'BL','Basel-Landschaft'),(109,204,'BS','Basel-Stadt'),(110,204,'FR','Freiburg'),(111,204,'GE','Genf'),(112,204,'GL','Glarus'),(113,204,'JU','Graubnden'),(114,204,'JU','Jura'),(115,204,'LU','Luzern'),(116,204,'NE','Neuenburg'),(117,204,'NW','Nidwalden'),(118,204,'OW','Obwalden'),(119,204,'SG','St. Gallen'),(120,204,'SH','Schaffhausen'),(121,204,'SO','Solothurn'),(122,204,'SZ','Schwyz'),(123,204,'TG','Thurgau'),(124,204,'TI','Tessin'),(125,204,'UR','Uri'),(126,204,'VD','Waadt'),(127,204,'VS','Wallis'),(128,204,'ZG','Zug'),(129,204,'ZH','Zrich'),(130,195,'A Corua','A Corua'),(131,195,'Alava','Alava'),(132,195,'Albacete','Albacete'),(133,195,'Alicante','Alicante'),(134,195,'Almeria','Almeria'),(135,195,'Asturias','Asturias'),(136,195,'Avila','Avila'),(137,195,'Badajoz','Badajoz'),(138,195,'Baleares','Baleares'),(139,195,'Barcelona','Barcelona'),(140,195,'Burgos','Burgos'),(141,195,'Caceres','Caceres'),(142,195,'Cadiz','Cadiz'),(143,195,'Cantabria','Cantabria'),(144,195,'Castellon','Castellon'),(145,195,'Ceuta','Ceuta'),(146,195,'Ciudad Real','Ciudad Real'),(147,195,'Cordoba','Cordoba'),(148,195,'Cuenca','Cuenca'),(149,195,'Girona','Girona'),(150,195,'Granada','Granada'),(151,195,'Guadalajara','Guadalajara'),(152,195,'Guipuzcoa','Guipuzcoa'),(153,195,'Huelva','Huelva'),(154,195,'Huesca','Huesca'),(155,195,'Jaen','Jaen'),(156,195,'La Rioja','La Rioja'),(157,195,'Las Palmas','Las Palmas'),(158,195,'Leon','Leon'),(159,195,'Lleida','Lleida'),(160,195,'Lugo','Lugo'),(161,195,'Madrid','Madrid'),(162,195,'Malaga','Malaga'),(163,195,'Melilla','Melilla'),(164,195,'Murcia','Murcia'),(165,195,'Navarra','Navarra'),(166,195,'Ourense','Ourense'),(167,195,'Palencia','Palencia'),(168,195,'Pontevedra','Pontevedra'),(169,195,'Salamanca','Salamanca'),(170,195,'Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,195,'Segovia','Segovia'),(172,195,'Sevilla','Sevilla'),(173,195,'Soria','Soria'),(174,195,'Tarragona','Tarragona'),(175,195,'Teruel','Teruel'),(176,195,'Toledo','Toledo'),(177,195,'Valencia','Valencia'),(178,195,'Valladolid','Valladolid'),(179,195,'Vizcaya','Vizcaya'),(180,195,'Zamora','Zamora'),(181,195,'Zaragoza','Zaragoza'),(182,13,'ACT','Australian Capital Territory'),(183,13,'NSW','New South Wales'),(184,13,'NT','Northern Territory'),(185,13,'QLD','Queensland'),(186,13,'SA','South Australia'),(187,13,'TAS','Tasmania'),(188,13,'VIC','Victoria'),(189,13,'WA','Western Australia');
/*!40000 ALTER TABLE `zc_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zc_zones_to_geo_zones`
--

DROP TABLE IF EXISTS `zc_zones_to_geo_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zc_zones_to_geo_zones` (
  `association_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) DEFAULT NULL,
  `geo_zone_id` int(11) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`association_id`),
  KEY `idx_zones_zen` (`geo_zone_id`,`zone_country_id`,`zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zc_zones_to_geo_zones`
--

LOCK TABLES `zc_zones_to_geo_zones` WRITE;
/*!40000 ALTER TABLE `zc_zones_to_geo_zones` DISABLE KEYS */;
INSERT INTO `zc_zones_to_geo_zones` VALUES (1,223,18,1,NULL,'2009-05-30 08:43:47'),(2,150,0,2,NULL,'2013-09-06 12:14:15'),(3,21,0,2,NULL,'2013-09-06 12:14:27'),(4,81,0,2,NULL,'2013-09-06 12:14:48'),(5,73,0,2,NULL,'2013-09-06 12:15:06');
/*!40000 ALTER TABLE `zc_zones_to_geo_zones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-07 18:53:59
