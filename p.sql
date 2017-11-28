-- MySQL dump 10.11
--
-- Host: localhost    Database: contactSolution
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt

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
-- Table structure for table `contact_info`
--

DROP TABLE IF EXISTS `contact_info`;
CREATE TABLE `contact_info` (
  `id` int(11) NOT NULL auto_increment,
  `first_name` char(25) default NULL,
  `last_name` char(25) default NULL,
  `email_id` char(50) default NULL,
  `date_of_birth` char(12) default NULL,
  `address` char(200) default NULL,
  `contact_number` char(15) default NULL,
  `occupation` char(15) default NULL,
  `contact_group` char(20) default NULL,
  `contact` char(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_info`
--

LOCK TABLES `contact_info` WRITE;
/*!40000 ALTER TABLE `contact_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `draft_info`
--

DROP TABLE IF EXISTS `draft_info`;
CREATE TABLE `draft_info` (
  `sender_email_id` char(50) default NULL,
  `receiver_email_id` char(50) default NULL,
  `message` char(140) default NULL,
  `date_of_message` datetime default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `draft_info`
--

LOCK TABLES `draft_info` WRITE;
/*!40000 ALTER TABLE `draft_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `draft_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbox_info`
--

DROP TABLE IF EXISTS `inbox_info`;
CREATE TABLE `inbox_info` (
  `sender_email_id` char(50) default NULL,
  `receiver_email_id` char(50) default NULL,
  `message` char(140) default NULL,
  `date_of_message` datetime default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inbox_info`
--

LOCK TABLES `inbox_info` WRITE;
/*!40000 ALTER TABLE `inbox_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbox_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_details`
--

DROP TABLE IF EXISTS `login_details`;
CREATE TABLE `login_details` (
  `email_id` char(50) default NULL,
  `gmail_id` char(50) default NULL,
  `password` char(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_details`
--

LOCK TABLES `login_details` WRITE;
/*!40000 ALTER TABLE `login_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `login_info`
--

DROP TABLE IF EXISTS `login_info`;
/*!50001 DROP VIEW IF EXISTS `login_info`*/;
/*!50001 CREATE TABLE `login_info` (
  `First_Name` char(25),
  `Email_Id` char(50),
  `Password` char(25)
) */;

--
-- Table structure for table `sent_info`
--

DROP TABLE IF EXISTS `sent_info`;
CREATE TABLE `sent_info` (
  `sender_email_id` char(50) default NULL,
  `receiver_email_id` char(50) default NULL,
  `message` char(140) default NULL,
  `date_of_message` datetime default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sent_info`
--

LOCK TABLES `sent_info` WRITE;
/*!40000 ALTER TABLE `sent_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `sent_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `Email_Id` char(50) NOT NULL,
  `Password` char(25) default NULL,
  `First_Name` char(25) default NULL,
  `Last_Name` char(25) default NULL,
  `sex` char(1) default NULL,
  `date_of_birth` char(11) default NULL,
  `Address` char(200) default NULL,
  `contact_number` char(15) default NULL,
  `Occupation` char(25) default NULL,
  PRIMARY KEY  (`Email_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `login_info`
--

/*!50001 DROP TABLE IF EXISTS `login_info`*/;
/*!50001 DROP VIEW IF EXISTS `login_info`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `login_info` AS select `user_info`.`First_Name` AS `First_Name`,`user_info`.`Email_Id` AS `Email_Id`,`user_info`.`Password` AS `Password` from `user_info` */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-04  9:08:46
