-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: foodbear
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
-- Table structure for table `Package_History`
--

DROP TABLE IF EXISTS `Package_History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Package_History` (
  `ph_id` int(11) NOT NULL AUTO_INCREMENT,
  `duration` varchar(255) NOT NULL,
  `Restaurant_r_id` int(11) NOT NULL,
  PRIMARY KEY (`ph_id`),
  KEY `Package_History_Restaurant` (`Restaurant_r_id`),
  CONSTRAINT `Package_History_Restaurant` FOREIGN KEY (`Restaurant_r_id`) REFERENCES `Restaurant` (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Package_History`
--

LOCK TABLES `Package_History` WRITE;
/*!40000 ALTER TABLE `Package_History` DISABLE KEYS */;
/*!40000 ALTER TABLE `Package_History` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rating`
--

DROP TABLE IF EXISTS `Rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rating` (
  `rat_id` int(11) NOT NULL AUTO_INCREMENT,
  `stars` int(11) NOT NULL,
  `User_u_id` int(11) NOT NULL,
  `food_f_id` int(11) NOT NULL,
  PRIMARY KEY (`rat_id`),
  KEY `Rating_User` (`User_u_id`),
  KEY `Rating_food` (`food_f_id`),
  CONSTRAINT `Rating_User` FOREIGN KEY (`User_u_id`) REFERENCES `User` (`u_id`),
  CONSTRAINT `Rating_food` FOREIGN KEY (`food_f_id`) REFERENCES `food` (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rating`
--

LOCK TABLES `Rating` WRITE;
/*!40000 ALTER TABLE `Rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Restaurant`
--

DROP TABLE IF EXISTS `Restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Restaurant` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_name` varchar(255) NOT NULL,
  `r_location` varchar(255) NOT NULL,
  `Restaurant_Packages_p_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `food_category_cat_id` int(11) NOT NULL,
  `r_image` varchar(255) NOT NULL,
  PRIMARY KEY (`r_id`),
  KEY `Restaurant_Restaurant_Packages` (`Restaurant_Packages_p_id`),
  KEY `Restaurant_food_category` (`food_category_cat_id`),
  CONSTRAINT `Restaurant_Restaurant_Packages` FOREIGN KEY (`Restaurant_Packages_p_id`) REFERENCES `Restaurant_Packages` (`p_id`),
  CONSTRAINT `Restaurant_food_category` FOREIGN KEY (`food_category_cat_id`) REFERENCES `food_category` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Restaurant`
--

LOCK TABLES `Restaurant` WRITE;
/*!40000 ALTER TABLE `Restaurant` DISABLE KEYS */;
INSERT INTO `Restaurant` VALUES (1,'Hardees','DHA Phase 2',2,3,'2018-12-22 05:17:29',2,'https://www.visitsedaliamo.com/wp-content/uploads/2017/10/Hardees-Fast-Food-Burgers-Hwy-50-Sedalia-Missouri.png'),(2,'OPTP','Tariq Road',2,2,'2018-12-23 02:42:44',2,'https://headfastco.files.wordpress.com/2011/09/optp.jpg'),(3,'Bamboo','Sindhi Muslim',1,4,'2018-12-23 02:41:49',3,'https://img.grouponcdn.com/deal/29tsw2p5UAh1rPsQrPVztAEHbN8E/29-700x420/v1/c700x420.jpg');
/*!40000 ALTER TABLE `Restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Restaurant_Packages`
--

DROP TABLE IF EXISTS `Restaurant_Packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Restaurant_Packages` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(255) NOT NULL,
  `p_price` int(11) NOT NULL,
  `p_duration` varchar(255) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Restaurant_Packages`
--

LOCK TABLES `Restaurant_Packages` WRITE;
/*!40000 ALTER TABLE `Restaurant_Packages` DISABLE KEYS */;
INSERT INTO `Restaurant_Packages` VALUES (1,'Silver',10000,'1 month'),(2,'Gold',50000,'6 month'),(3,'Platinum',100000,'12 month');
/*!40000 ALTER TABLE `Restaurant_Packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `p_number` int(11) NOT NULL,
  `CNIC` int(11) NOT NULL,
  `Address` varchar(255) NOT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add account emailaddress',7,'add_accountemailaddress'),(26,'Can change account emailaddress',7,'change_accountemailaddress'),(27,'Can delete account emailaddress',7,'delete_accountemailaddress'),(28,'Can view account emailaddress',7,'view_accountemailaddress'),(29,'Can add account emailconfirmation',8,'add_accountemailconfirmation'),(30,'Can change account emailconfirmation',8,'change_accountemailconfirmation'),(31,'Can delete account emailconfirmation',8,'delete_accountemailconfirmation'),(32,'Can view account emailconfirmation',8,'view_accountemailconfirmation'),(33,'Can add auth group',9,'add_authgroup'),(34,'Can change auth group',9,'change_authgroup'),(35,'Can delete auth group',9,'delete_authgroup'),(36,'Can view auth group',9,'view_authgroup'),(37,'Can add auth group permissions',10,'add_authgrouppermissions'),(38,'Can change auth group permissions',10,'change_authgrouppermissions'),(39,'Can delete auth group permissions',10,'delete_authgrouppermissions'),(40,'Can view auth group permissions',10,'view_authgrouppermissions'),(41,'Can add auth permission',11,'add_authpermission'),(42,'Can change auth permission',11,'change_authpermission'),(43,'Can delete auth permission',11,'delete_authpermission'),(44,'Can view auth permission',11,'view_authpermission'),(45,'Can add authtoken token',12,'add_authtokentoken'),(46,'Can change authtoken token',12,'change_authtokentoken'),(47,'Can delete authtoken token',12,'delete_authtokentoken'),(48,'Can view authtoken token',12,'view_authtokentoken'),(49,'Can add auth user',13,'add_authuser'),(50,'Can change auth user',13,'change_authuser'),(51,'Can delete auth user',13,'delete_authuser'),(52,'Can view auth user',13,'view_authuser'),(53,'Can add auth user groups',14,'add_authusergroups'),(54,'Can change auth user groups',14,'change_authusergroups'),(55,'Can delete auth user groups',14,'delete_authusergroups'),(56,'Can view auth user groups',14,'view_authusergroups'),(57,'Can add auth user user permissions',15,'add_authuseruserpermissions'),(58,'Can change auth user user permissions',15,'change_authuseruserpermissions'),(59,'Can delete auth user user permissions',15,'delete_authuseruserpermissions'),(60,'Can view auth user user permissions',15,'view_authuseruserpermissions'),(61,'Can add comment',16,'add_comment'),(62,'Can change comment',16,'change_comment'),(63,'Can delete comment',16,'delete_comment'),(64,'Can view comment',16,'view_comment'),(65,'Can add django admin log',17,'add_djangoadminlog'),(66,'Can change django admin log',17,'change_djangoadminlog'),(67,'Can delete django admin log',17,'delete_djangoadminlog'),(68,'Can view django admin log',17,'view_djangoadminlog'),(69,'Can add django content type',18,'add_djangocontenttype'),(70,'Can change django content type',18,'change_djangocontenttype'),(71,'Can delete django content type',18,'delete_djangocontenttype'),(72,'Can view django content type',18,'view_djangocontenttype'),(73,'Can add django migrations',19,'add_djangomigrations'),(74,'Can change django migrations',19,'change_djangomigrations'),(75,'Can delete django migrations',19,'delete_djangomigrations'),(76,'Can view django migrations',19,'view_djangomigrations'),(77,'Can add django session',20,'add_djangosession'),(78,'Can change django session',20,'change_djangosession'),(79,'Can delete django session',20,'delete_djangosession'),(80,'Can view django session',20,'view_djangosession'),(81,'Can add django site',21,'add_djangosite'),(82,'Can change django site',21,'change_djangosite'),(83,'Can delete django site',21,'delete_djangosite'),(84,'Can view django site',21,'view_djangosite'),(85,'Can add food',22,'add_food'),(86,'Can change food',22,'change_food'),(87,'Can delete food',22,'delete_food'),(88,'Can view food',22,'view_food'),(89,'Can add food category',23,'add_foodcategory'),(90,'Can change food category',23,'change_foodcategory'),(91,'Can delete food category',23,'delete_foodcategory'),(92,'Can view food category',23,'view_foodcategory'),(93,'Can add invoice',24,'add_invoice'),(94,'Can change invoice',24,'change_invoice'),(95,'Can delete invoice',24,'delete_invoice'),(96,'Can view invoice',24,'view_invoice'),(97,'Can add order',25,'add_order'),(98,'Can change order',25,'change_order'),(99,'Can delete order',25,'delete_order'),(100,'Can view order',25,'view_order'),(101,'Can add package history',26,'add_packagehistory'),(102,'Can change package history',26,'change_packagehistory'),(103,'Can delete package history',26,'delete_packagehistory'),(104,'Can view package history',26,'view_packagehistory'),(105,'Can add payment',27,'add_payment'),(106,'Can change payment',27,'change_payment'),(107,'Can delete payment',27,'delete_payment'),(108,'Can view payment',27,'view_payment'),(109,'Can add rating',28,'add_rating'),(110,'Can change rating',28,'change_rating'),(111,'Can delete rating',28,'delete_rating'),(112,'Can view rating',28,'view_rating'),(113,'Can add restaurant',29,'add_restaurant'),(114,'Can change restaurant',29,'change_restaurant'),(115,'Can delete restaurant',29,'delete_restaurant'),(116,'Can view restaurant',29,'view_restaurant'),(117,'Can add restaurant packages',30,'add_restaurantpackages'),(118,'Can change restaurant packages',30,'change_restaurantpackages'),(119,'Can delete restaurant packages',30,'delete_restaurantpackages'),(120,'Can view restaurant packages',30,'view_restaurantpackages'),(121,'Can add user',31,'add_user'),(122,'Can change user',31,'change_user'),(123,'Can delete user',31,'delete_user'),(124,'Can view user',31,'view_user'),(125,'Can add Token',32,'add_token'),(126,'Can change Token',32,'change_token'),(127,'Can delete Token',32,'delete_token'),(128,'Can view Token',32,'view_token'),(129,'Can add site',33,'add_site'),(130,'Can change site',33,'change_site'),(131,'Can delete site',33,'delete_site'),(132,'Can view site',33,'view_site'),(133,'Can add social application',34,'add_socialapp'),(134,'Can change social application',34,'change_socialapp'),(135,'Can delete social application',34,'delete_socialapp'),(136,'Can view social application',34,'view_socialapp'),(137,'Can add social account',35,'add_socialaccount'),(138,'Can change social account',35,'change_socialaccount'),(139,'Can delete social account',35,'delete_socialaccount'),(140,'Can view social account',35,'view_socialaccount'),(141,'Can add social application token',36,'add_socialtoken'),(142,'Can change social application token',36,'change_socialtoken'),(143,'Can delete social application token',36,'delete_socialtoken'),(144,'Can view social application token',36,'view_socialtoken'),(145,'Can add email address',37,'add_emailaddress'),(146,'Can change email address',37,'change_emailaddress'),(147,'Can delete email address',37,'delete_emailaddress'),(148,'Can view email address',37,'view_emailaddress'),(149,'Can add email confirmation',38,'add_emailconfirmation'),(150,'Can change email confirmation',38,'change_emailconfirmation'),(151,'Can delete email confirmation',38,'delete_emailconfirmation'),(152,'Can view email confirmation',38,'view_emailconfirmation');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$PwamOqk35ATC$/Gc99bcetQWh69cShxyHmsNrUjaepWrMKafWQ1XfcVE=','2018-12-25 13:21:13.982952',1,'zohaib','','','za@za.com',1,1,'2018-12-22 10:10:12.652225');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) NOT NULL,
  `User_u_id` int(11) NOT NULL,
  `food_f_id` int(11) NOT NULL,
  PRIMARY KEY (`com_id`),
  KEY `comment_User` (`User_u_id`),
  KEY `comment_food` (`food_f_id`),
  CONSTRAINT `comment_User` FOREIGN KEY (`User_u_id`) REFERENCES `User` (`u_id`),
  CONSTRAINT `comment_food` FOREIGN KEY (`food_f_id`) REFERENCES `food` (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-12-22 10:10:57.661230','1','RestaurantPackages object (1)',1,'[{\"added\": {}}]',30,1),(2,'2018-12-22 10:11:30.644145','2','RestaurantPackages object (2)',1,'[{\"added\": {}}]',30,1),(3,'2018-12-22 10:11:49.155590','3','RestaurantPackages object (3)',1,'[{\"added\": {}}]',30,1),(4,'2018-12-22 10:13:06.698778','1','FoodCategory object (1)',1,'[{\"added\": {}}]',23,1),(5,'2018-12-22 10:13:50.753832','2','FoodCategory object (2)',1,'[{\"added\": {}}]',23,1),(6,'2018-12-22 10:15:29.150201','3','FoodCategory object (3)',1,'[{\"added\": {}}]',23,1),(7,'2018-12-22 10:17:29.437055','1','Restaurant object (1)',1,'[{\"added\": {}}]',29,1),(8,'2018-12-22 10:18:21.250791','2','Restaurant object (2)',1,'[{\"added\": {}}]',29,1),(9,'2018-12-22 10:19:36.829055','3','Restaurant object (3)',1,'[{\"added\": {}}]',29,1),(10,'2018-12-22 10:21:52.848011','1','Food object (1)',1,'[{\"added\": {}}]',22,1),(11,'2018-12-22 10:22:38.194038','2','Food object (2)',1,'[{\"added\": {}}]',22,1),(12,'2018-12-22 10:23:12.926900','3','Food object (3)',1,'[{\"added\": {}}]',22,1),(13,'2018-12-23 07:41:49.737311','3','Restaurant object (3)',2,'[{\"changed\": {\"fields\": [\"r_image\"]}}]',29,1),(14,'2018-12-23 07:42:44.379077','2','Restaurant object (2)',2,'[{\"changed\": {\"fields\": [\"r_image\"]}}]',29,1),(15,'2018-12-23 08:21:37.433710','4','FoodCategory object (4)',1,'[{\"added\": {}}]',23,1),(16,'2018-12-23 19:41:49.217748','4','Food object (4)',1,'[{\"added\": {}}]',22,1),(17,'2018-12-24 05:25:29.959334','5','FoodCategory object (5)',1,'[{\"added\": {}}]',23,1),(18,'2018-12-24 05:27:54.894439','5','FoodCategory object (5)',3,'',23,1),(19,'2018-12-24 06:22:53.093514','6','FoodCategory object (6)',1,'[{\"added\": {}}]',23,1),(20,'2018-12-24 10:23:41.666633','6','FoodCategory object (6)',3,'',23,1),(21,'2018-12-24 10:24:03.390417','7','FoodCategory object (7)',1,'[{\"added\": {}}]',23,1),(22,'2018-12-24 10:24:18.387042','7','FoodCategory object (7)',3,'',23,1),(23,'2018-12-26 05:44:12.091427','4','FoodCategory object (4)',3,'',23,1),(24,'2018-12-26 07:52:55.395006','5','FoodCategory object (5)',1,'[{\"added\": {}}]',23,1),(25,'2018-12-26 07:53:33.297443','5','FoodCategory object (5)',3,'',23,1),(26,'2018-12-26 08:08:54.660184','6','FoodCategory object (6)',1,'[{\"added\": {}}]',23,1),(27,'2018-12-26 08:09:12.799183','6','FoodCategory object (6)',3,'',23,1),(28,'2018-12-26 09:23:45.434949','7','FoodCategory object (7)',1,'[{\"added\": {}}]',23,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (37,'account','emailaddress'),(38,'account','emailconfirmation'),(1,'admin','logentry'),(35,'allauth','socialaccount'),(34,'allauth','socialapp'),(36,'allauth','socialtoken'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(32,'authtoken','token'),(5,'contenttypes','contenttype'),(7,'foodbear','accountemailaddress'),(8,'foodbear','accountemailconfirmation'),(9,'foodbear','authgroup'),(10,'foodbear','authgrouppermissions'),(11,'foodbear','authpermission'),(12,'foodbear','authtokentoken'),(13,'foodbear','authuser'),(14,'foodbear','authusergroups'),(15,'foodbear','authuseruserpermissions'),(16,'foodbear','comment'),(17,'foodbear','djangoadminlog'),(18,'foodbear','djangocontenttype'),(19,'foodbear','djangomigrations'),(20,'foodbear','djangosession'),(21,'foodbear','djangosite'),(22,'foodbear','food'),(23,'foodbear','foodcategory'),(24,'foodbear','invoice'),(25,'foodbear','order'),(26,'foodbear','packagehistory'),(27,'foodbear','payment'),(28,'foodbear','rating'),(29,'foodbear','restaurant'),(30,'foodbear','restaurantpackages'),(31,'foodbear','user'),(6,'sessions','session'),(33,'sites','site');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-12-22 10:06:51.378612'),(2,'auth','0001_initial','2018-12-22 10:07:00.430012'),(3,'account','0001_initial','2018-12-22 10:07:03.302946'),(4,'account','0002_email_max_length','2018-12-22 10:07:03.481539'),(5,'admin','0001_initial','2018-12-22 10:07:05.442751'),(6,'admin','0002_logentry_remove_auto_add','2018-12-22 10:07:05.505275'),(7,'admin','0003_logentry_add_action_flag_choices','2018-12-22 10:07:05.566946'),(8,'contenttypes','0002_remove_content_type_name','2018-12-22 10:07:06.731779'),(9,'auth','0002_alter_permission_name_max_length','2018-12-22 10:07:06.868859'),(10,'auth','0003_alter_user_email_max_length','2018-12-22 10:07:06.992379'),(11,'auth','0004_alter_user_username_opts','2018-12-22 10:07:07.052969'),(12,'auth','0005_alter_user_last_login_null','2018-12-22 10:07:07.669617'),(13,'auth','0006_require_contenttypes_0002','2018-12-22 10:07:07.714823'),(14,'auth','0007_alter_validators_add_error_messages','2018-12-22 10:07:07.773623'),(15,'auth','0008_alter_user_username_max_length','2018-12-22 10:07:07.917068'),(16,'auth','0009_alter_user_last_name_max_length','2018-12-22 10:07:08.072547'),(17,'authtoken','0001_initial','2018-12-22 10:07:09.207753'),(18,'authtoken','0002_auto_20160226_1747','2018-12-22 10:07:10.176857'),(19,'foodbear','0001_initial','2018-12-22 10:07:10.269521'),(20,'sessions','0001_initial','2018-12-22 10:07:10.867935'),(21,'sites','0001_initial','2018-12-22 10:07:11.222840'),(22,'sites','0002_alter_domain_unique','2018-12-22 10:07:11.525223');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6syo2v1onepbc4atmz82vntiirbl7ni4','ODQyMTc0YTczMTFlZDFjOTk2YjcwMTdkYjAyNTBmNTk4MTlmNjkyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRjMWZkN2QzYTYwZmEwY2E4MzJhMTQwMzM0NzQ4NGRjOWIzNTJiIn0=','2019-01-08 13:21:14.228772'),('uyd7zos95goosnfbkr430hetvpcql9ci','ODQyMTc0YTczMTFlZDFjOTk2YjcwMTdkYjAyNTBmNTk4MTlmNjkyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRjMWZkN2QzYTYwZmEwY2E4MzJhMTQwMzM0NzQ4NGRjOWIzNTJiIn0=','2019-01-06 19:40:41.041505');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `image_link` varchar(255) NOT NULL,
  `Restaurant_r_id` int(11) NOT NULL,
  `food_category_cat_id` int(11) NOT NULL,
  `food_type` varchar(255) NOT NULL,
  PRIMARY KEY (`f_id`),
  KEY `food_Restaurant` (`Restaurant_r_id`),
  KEY `food_food_category` (`food_category_cat_id`),
  CONSTRAINT `food_Restaurant` FOREIGN KEY (`Restaurant_r_id`) REFERENCES `Restaurant` (`r_id`),
  CONSTRAINT `food_food_category` FOREIGN KEY (`food_category_cat_id`) REFERENCES `food_category` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'Zinger',370,'https://i.ytimg.com/vi/efVgSHUzY_Y/maxresdefault.jpg',1,2,'Burger'),(2,'Fire Fries',170,'https://optp.biz/cms/Uploads/2018/Jul/050720180148047522379.jpg',2,2,'Fries'),(3,'Spagetti',450,'https://img.taste.com.au/O1ofwjUO/w1200-h630-cfill/taste/2016/11/spaghetti-with-meatballs-and-spicy-tomato-sauce-102298-1.jpeg',3,3,'Noodles'),(4,'Spicy roll',80,'Google.com/images',1,2,'Roll');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_category`
--

DROP TABLE IF EXISTS `food_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL,
  `cat_image` varchar(255) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_category`
--

LOCK TABLES `food_category` WRITE;
/*!40000 ALTER TABLE `food_category` DISABLE KEYS */;
INSERT INTO `food_category` VALUES (1,'Desi','https://d27k8xmh3cuzik.cloudfront.net/wp-content/uploads/2018/11/kathmandu-indian-restuarants.jpg'),(2,'Fast Food','https://assets.londonist.com/uploads/2016/10/i875/trump_burger_pic_resized.jpg'),(3,'Chinese','https://i.ndtvimg.com/i/2016-06/noodles-625_625x350_41465896870.jpg'),(7,'Italian','https://www.iloveqatar.net/public/images/slider/_760x500_clip_center-center_none/Top-five-spots-for-Mexican-food-in-Qatar.jpg');
/*!40000 ALTER TABLE `food_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `invoice_inv_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`o_id`),
  KEY `order_invoice` (`invoice_inv_id`),
  CONSTRAINT `order_invoice` FOREIGN KEY (`invoice_inv_id`) REFERENCES `order` (`inv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `inv_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) NOT NULL,
  `delivery` varchar(255) NOT NULL,
  `food_f_id` int(11) NOT NULL,
  `User_u_id` int(11) NOT NULL,
  `payment_pay_id` int(11) NOT NULL,
  PRIMARY KEY (`inv_id`),
  KEY `invoice_food` (`food_f_id`),
  KEY `order_User` (`User_u_id`),
  KEY `order_payment` (`payment_pay_id`),
  CONSTRAINT `invoice_food` FOREIGN KEY (`food_f_id`) REFERENCES `food` (`f_id`),
  CONSTRAINT `order_User` FOREIGN KEY (`User_u_id`) REFERENCES `User` (`u_id`),
  CONSTRAINT `order_payment` FOREIGN KEY (`payment_pay_id`) REFERENCES `payment` (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_method` varchar(255) NOT NULL,
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-28 23:19:47
