-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: mysite
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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add catalog product',7,'add_catalogproduct'),(26,'Can change catalog product',7,'change_catalogproduct'),(27,'Can delete catalog product',7,'delete_catalogproduct'),(28,'Can view catalog product',7,'view_catalogproduct'),(29,'Can add product',8,'add_product'),(30,'Can change product',8,'change_product'),(31,'Can delete product',8,'delete_product'),(32,'Can view product',8,'view_product'),(33,'Can add user',9,'add_user'),(34,'Can change user',9,'change_user'),(35,'Can delete user',9,'delete_user'),(36,'Can view user',9,'view_user'),(37,'Can add product system requirement',10,'add_productsystemrequirement'),(38,'Can change product system requirement',10,'change_productsystemrequirement'),(39,'Can delete product system requirement',10,'delete_productsystemrequirement'),(40,'Can view product system requirement',10,'view_productsystemrequirement'),(41,'Can add product photo',11,'add_productphoto'),(42,'Can change product photo',11,'change_productphoto'),(43,'Can delete product photo',11,'delete_productphoto'),(44,'Can view product photo',11,'view_productphoto'),(45,'Can add products day',12,'add_productsday'),(46,'Can change products day',12,'change_productsday'),(47,'Can delete products day',12,'delete_productsday'),(48,'Can view products day',12,'view_productsday'),(49,'Can add comment product',13,'add_commentproduct'),(50,'Can change comment product',13,'change_commentproduct'),(51,'Can delete comment product',13,'delete_commentproduct'),(52,'Can view comment product',13,'view_commentproduct'),(53,'Can add order',14,'add_order'),(54,'Can change order',14,'change_order'),(55,'Can delete order',14,'delete_order'),(56,'Can view order',14,'view_order'),(57,'Can add orders list',15,'add_orderslist'),(58,'Can change orders list',15,'change_orderslist'),(59,'Can delete orders list',15,'delete_orderslist'),(60,'Can view orders list',15,'view_orderslist'),(61,'Can add product key',16,'add_productkey'),(62,'Can change product key',16,'change_productkey'),(63,'Can delete product key',16,'delete_productkey'),(64,'Can view product key',16,'view_productkey'),(65,'Can add shop user',9,'add_shopuser'),(66,'Can change shop user',9,'change_shopuser'),(67,'Can delete shop user',9,'delete_shopuser'),(68,'Can view shop user',9,'view_shopuser');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$GaKfDV1CUWLP2gAdsiSuAb$d9pUSZvP9MgLvIMxtbgbv+iT5TBgZT38bfK5/ZMnNSs=','2023-05-21 19:18:01.625496',1,'admin','','','kek@gmail.com',1,1,'2023-05-17 19:01:08.105395'),(10,'pbkdf2_sha256$390000$VRPejmjrbyL3ZW5GpD9QzV$NWKMQkYvV32bxgp4YjLh5Ts6HboJG/9s7znyX9+Dwrc=','2023-05-24 20:16:55.892668',0,'bigtigerlesha@gmail.com','','','bigtigerlesha@gmail.com',0,1,'2023-05-21 09:01:06.614775'),(11,'pbkdf2_sha256$390000$0ixTy5Sa2EjrZVMVnAmgE6$xX/WnVU2sJBcPAIRn2wLEFLdjaprtb8OTfost7U34qE=','2023-05-24 20:19:52.907036',0,'alexey.holenko@gmail.com','','','alexey.holenko@gmail.com',0,1,'2023-05-24 20:19:52.682905');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-05-18 16:52:47.084276','2','Product object (2)',2,'[]',8,1),(2,'2023-05-18 16:52:58.650567','2','Product object (2)',2,'[{\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (4)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (5)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (6)\"}}]',8,1),(3,'2023-05-18 16:56:23.454481','1','Product object (1)',2,'[{\"changed\": {\"fields\": [\"Main image\"]}}, {\"changed\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (1)\", \"fields\": [\"Image\"]}}, {\"changed\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (2)\", \"fields\": [\"Image\"]}}, {\"changed\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (3)\", \"fields\": [\"Image\"]}}]',8,1),(4,'2023-05-18 17:11:54.273851','1','Product object (1)',2,'[{\"changed\": {\"fields\": [\"Main image\"]}}, {\"changed\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (1)\", \"fields\": [\"Image\"]}}, {\"changed\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (2)\", \"fields\": [\"Image\"]}}, {\"changed\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (3)\", \"fields\": [\"Image\"]}}]',8,1),(5,'2023-05-18 17:16:25.205390','1','Product object (1)',2,'[{\"deleted\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (None)\"}}, {\"deleted\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (None)\"}}, {\"deleted\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (None)\"}}]',8,1),(6,'2023-05-18 17:18:06.090013','1','Product object (1)',2,'[{\"changed\": {\"fields\": [\"Main image\"]}}]',8,1),(7,'2023-05-18 17:18:49.762963','1','Product object (1)',2,'[{\"changed\": {\"fields\": [\"Main image\"]}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (7)\"}}]',8,1),(8,'2023-05-18 17:18:57.735593','1','Product object (1)',2,'[{\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (8)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (9)\"}}]',8,1),(9,'2023-05-18 17:19:29.290619','1','Product object (1)',2,'[{\"changed\": {\"fields\": [\"Main image\"]}}, {\"changed\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (7)\", \"fields\": [\"Image\"]}}, {\"changed\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (8)\", \"fields\": [\"Image\"]}}, {\"changed\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (9)\", \"fields\": [\"Image\"]}}]',8,1),(10,'2023-05-18 17:19:49.559123','2','Product object (2)',2,'[{\"changed\": {\"fields\": [\"Main image\"]}}, {\"changed\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (4)\", \"fields\": [\"Image\"]}}, {\"changed\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (5)\", \"fields\": [\"Image\"]}}, {\"changed\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (6)\", \"fields\": [\"Image\"]}}]',8,1),(11,'2023-05-18 17:20:34.016412','3','Product object (3)',2,'[{\"changed\": {\"fields\": [\"Main image\"]}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (10)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (11)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (12)\"}}]',8,1),(12,'2023-05-18 17:21:21.075291','2','Product object (2)',2,'[{\"changed\": {\"fields\": [\"Main image\"]}}, {\"changed\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (4)\", \"fields\": [\"Image\"]}}, {\"changed\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (5)\", \"fields\": [\"Image\"]}}, {\"changed\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (6)\", \"fields\": [\"Image\"]}}]',8,1),(13,'2023-05-18 17:29:30.444144','2','Product object (2)',2,'[]',8,1),(14,'2023-05-18 17:30:45.496754','1','Product object (1)',2,'[]',8,1),(15,'2023-05-18 17:33:24.867556','1','Product object (1)',2,'[]',8,1),(16,'2023-05-18 17:35:50.972876','1','Product object (1)',2,'[]',8,1),(17,'2023-05-18 17:44:19.213062','4','Product object (4)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (13)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (14)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (15)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (4)\"}}]',8,1),(18,'2023-05-18 18:03:55.771692','5','Wreckfest, Racing',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (16)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (17)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (18)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (5)\"}}]',8,1),(19,'2023-05-18 18:07:15.874046','6','CarX Drift Racing Online, Racing',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (19)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (20)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (21)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (6)\"}}]',8,1),(20,'2023-05-18 18:11:27.361475','7','Amanda the Adventurer, Horror',1,'[{\"added\": {}}]',8,1),(21,'2023-05-18 18:11:46.141688','7','Amanda the Adventurer, Horror',2,'[{\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (22)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (23)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (24)\"}}]',8,1),(22,'2023-05-18 18:12:15.809930','7','Amanda the Adventurer, Horror',2,'[{\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (7)\"}}]',8,1),(23,'2023-05-18 18:26:30.371001','8','Dead Estate, Horror',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (25)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (26)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (27)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (8)\"}}]',8,1),(24,'2023-05-18 18:28:18.220420','9','Hello Neighbor 2, Horror',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (28)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (29)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (30)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (9)\"}}]',8,1),(25,'2023-05-18 18:30:05.406964','10','DREDGE, Horror',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (31)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (32)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (33)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (10)\"}}]',8,1),(26,'2023-05-18 18:37:17.739462','12','WWE 2K23, Fighting',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (34)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (35)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (36)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (11)\"}}]',8,1),(27,'2023-05-18 18:39:02.456709','13','The King of Fighters 15 (XV), Fighting',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (37)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (38)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (39)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (12)\"}}]',8,1),(28,'2023-05-18 18:42:33.586565','14','Punch A Bunch, Fighting',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (40)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (41)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (42)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (13)\"}}]',8,1),(29,'2023-05-18 18:44:30.203330','15','Sclash, Fighting',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (43)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (44)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (45)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (14)\"}}]',8,1),(30,'2023-05-18 18:46:22.041182','16','Rubber Bandits, Fighting',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (46)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (47)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (48)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (15)\"}}]',8,1),(31,'2023-05-18 18:50:13.364861','17','Black Skylands, Survival',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (49)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (50)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (51)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (16)\"}}]',8,1),(32,'2023-05-18 18:51:35.996777','18','Surviving the Abyss, Survival',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (52)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (53)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (54)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (17)\"}}]',8,1),(33,'2023-05-18 18:53:29.806922','19','Dysmantle, Survival',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (18)\"}}]',8,1),(34,'2023-05-18 18:55:11.390088','20','Tunguska The Visitation, Survival',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (55)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (56)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (57)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (19)\"}}]',8,1),(35,'2023-05-18 18:56:43.478161','21','ICARUS, Survival',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (58)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (59)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (60)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (20)\"}}]',8,1),(36,'2023-05-18 18:57:59.478326','22','ICARUS, Survival',1,'[{\"added\": {}}]',8,1),(37,'2023-05-18 18:59:29.837889','23','Foundation, Strategies',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (61)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (62)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (63)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (21)\"}}]',8,1),(38,'2023-05-18 19:00:54.315456','24','Unity of Command 2, Strategies',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (64)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (65)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (66)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (22)\"}}]',8,1),(39,'2023-05-18 19:02:13.551471','25','The Farmer Was Replaced, Strategies',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (67)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (68)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (69)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (23)\"}}]',8,1),(40,'2023-05-18 19:03:27.786489','26','Pan\'orama, Strategies',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (70)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (71)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (72)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (24)\"}}]',8,1),(41,'2023-05-18 19:04:39.863869','27','Ostranauts, Strategies',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (73)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (74)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (75)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (25)\"}}]',8,1),(42,'2023-05-20 09:09:02.300916','2','bigtigerlesha@gmail.com',3,'',4,1),(43,'2023-05-20 09:09:11.405054','3','',3,'',4,1),(44,'2023-05-21 08:20:47.397821','1','Race',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',7,1),(45,'2023-05-21 08:20:50.552942','2','Horror',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',7,1),(46,'2023-05-21 08:20:53.404550','10','Role Plaing',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',7,1),(47,'2023-05-21 08:21:02.574499','3','Fighting',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',7,1),(48,'2023-05-21 08:21:05.507519','4','Survival',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',7,1),(49,'2023-05-21 08:21:08.246826','5','Strategies',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',7,1),(50,'2023-05-21 08:21:10.727405','6','Sports',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',7,1),(51,'2023-05-21 08:21:13.482694','7','Simulator',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',7,1),(52,'2023-05-21 08:21:16.206640','8','Adventure',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',7,1),(53,'2023-05-21 08:21:18.818691','9','Action',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',7,1),(54,'2023-05-21 08:21:21.528110','10','Role Plaing',2,'[]',7,1),(55,'2023-05-21 09:11:22.649485','1','Forza Horizon 5, Race',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(56,'2023-05-21 09:11:27.837090','2','CarX Drift Racing Online, Race',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(57,'2023-05-21 09:11:35.867425','3','Dakar Desert Rally, Race',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}, {\"changed\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (3)\", \"fields\": [\"Processor\", \"Video card\"]}}]',8,1),(58,'2023-05-21 09:13:02.980379','4','BeamNG DRIVE, Race',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(59,'2023-05-21 09:13:06.979029','27','Ostranauts, Strategies',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(60,'2023-05-21 09:13:09.849961','26','Pan\'orama, Strategies',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(61,'2023-05-21 09:13:12.710872','25','The Farmer Was Replaced, Strategies',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(62,'2023-05-21 09:13:17.223138','24','Unity of Command 2, Strategies',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(63,'2023-05-21 09:13:23.714761','23','Foundation, Strategies',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(64,'2023-05-21 09:13:27.970697','22','ICARUS, Survival',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(65,'2023-05-21 09:13:31.837314','21','ICARUS, Survival',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(66,'2023-05-21 09:13:34.431597','20','Tunguska The Visitation, Survival',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(67,'2023-05-21 09:13:37.888211','19','Dysmantle, Survival',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(68,'2023-05-21 09:13:40.777748','18','Surviving the Abyss, Survival',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(69,'2023-05-21 09:13:47.071961','17','Black Skylands, Survival',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(70,'2023-05-21 09:13:50.326437','16','Rubber Bandits, Fighting',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(71,'2023-05-21 09:13:59.592252','15','Sclash, Fighting',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(72,'2023-05-21 09:14:03.100769','14','Punch A Bunch, Fighting',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(73,'2023-05-21 09:14:07.891753','13','The King of Fighters 15 (XV), Fighting',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(74,'2023-05-21 09:14:11.594395','12','WWE 2K23, Fighting',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(75,'2023-05-21 09:14:14.829034','10','DREDGE, Horror',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(76,'2023-05-21 09:14:18.444299','9','Hello Neighbor 2, Horror',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(77,'2023-05-21 09:14:21.815935','8','Dead Estate, Horror',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(78,'2023-05-21 09:14:46.326413','5','Wreckfest, Race',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(79,'2023-05-21 09:14:52.414847','6','Dead Island 2, Horror',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(80,'2023-05-21 09:14:56.113872','7','Amanda the Adventurer, Horror',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,1),(81,'2023-05-21 14:36:22.395141','28','FIFA 23, Sports',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (76)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (77)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (78)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (26)\"}}]',8,1),(82,'2023-05-21 14:43:48.844313','29','World of Tanks, Strategies',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (79)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (80)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (81)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (27)\"}}]',8,1),(83,'2023-05-21 14:45:16.522127','30','Paleon, Survival',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (82)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (83)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (84)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (28)\"}}]',8,1),(84,'2023-05-21 14:46:38.146670','31','Atomic Heart, Role Plaing',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (85)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (86)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (87)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (29)\"}}]',8,1),(85,'2023-05-21 14:47:19.638715','21','ICARUS, Survival',3,'',8,1),(86,'2023-05-21 14:48:26.679034','32','Star Wars Jedi Survivor, Action',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (88)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (89)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (90)\"}}, {\"added\": {\"name\": \"product system requirement\", \"object\": \"ProductSystemRequirement object (30)\"}}]',8,1),(87,'2023-05-21 14:49:04.044267','30','Paleon, Adventure',2,'[{\"changed\": {\"fields\": [\"Catalog\"]}}]',8,1),(88,'2023-05-21 14:49:27.646061','29','World of Tanks, Simulator',2,'[{\"changed\": {\"fields\": [\"Catalog\"]}}]',8,1),(89,'2023-05-21 19:18:20.043505','19','Dysmantle, Survival',2,'[{\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (91)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (92)\"}}, {\"added\": {\"name\": \"product photo\", \"object\": \"ProductPhoto object (93)\"}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'shop','catalogproduct'),(13,'shop','commentproduct'),(14,'shop','order'),(15,'shop','orderslist'),(8,'shop','product'),(16,'shop','productkey'),(11,'shop','productphoto'),(12,'shop','productsday'),(10,'shop','productsystemrequirement'),(9,'shop','shopuser');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-05-17 17:51:04.609250'),(2,'auth','0001_initial','2023-05-17 17:51:04.930962'),(3,'admin','0001_initial','2023-05-17 17:51:05.018243'),(4,'admin','0002_logentry_remove_auto_add','2023-05-17 17:51:05.026765'),(5,'admin','0003_logentry_add_action_flag_choices','2023-05-17 17:51:05.034673'),(6,'contenttypes','0002_remove_content_type_name','2023-05-17 17:51:05.086082'),(7,'auth','0002_alter_permission_name_max_length','2023-05-17 17:51:05.117418'),(8,'auth','0003_alter_user_email_max_length','2023-05-17 17:51:05.138363'),(9,'auth','0004_alter_user_username_opts','2023-05-17 17:51:05.146014'),(10,'auth','0005_alter_user_last_login_null','2023-05-17 17:51:05.181557'),(11,'auth','0006_require_contenttypes_0002','2023-05-17 17:51:05.185810'),(12,'auth','0007_alter_validators_add_error_messages','2023-05-17 17:51:05.194100'),(13,'auth','0008_alter_user_username_max_length','2023-05-17 17:51:05.244880'),(14,'auth','0009_alter_user_last_name_max_length','2023-05-17 17:51:05.280103'),(15,'auth','0010_alter_group_name_max_length','2023-05-17 17:51:05.297235'),(16,'auth','0011_update_proxy_permissions','2023-05-17 17:51:05.306070'),(17,'auth','0012_alter_user_first_name_max_length','2023-05-17 17:51:05.341172'),(18,'sessions','0001_initial','2023-05-17 17:51:05.365965'),(19,'shop','0001_initial','2023-05-17 17:51:05.546712'),(20,'shop','0002_commentproduct','2023-05-17 17:54:37.758467'),(21,'shop','0003_order_productsday_orderslist','2023-05-17 17:54:37.895838'),(22,'shop','0004_productkey','2023-05-17 18:05:38.474613'),(23,'shop','0005_product_catalog','2023-05-17 18:12:49.230403'),(24,'shop','0006_product_main_image','2023-05-17 19:23:40.018790'),(25,'shop','0007_alter_product_description_alter_product_main_image','2023-05-18 17:11:05.461273'),(26,'shop','0008_alter_productphoto_image','2023-05-18 17:15:32.886262'),(27,'shop','0009_alter_productphoto_image','2023-05-18 17:47:46.962720'),(28,'shop','0010_remove_product_genre','2023-05-18 18:12:37.456747'),(29,'shop','0011_rename_user_shopuser','2023-05-20 09:03:20.348644'),(30,'shop','0012_catalogproduct_slug','2023-05-20 20:55:23.974003'),(31,'shop','0013_remove_catalogproduct_slug_catalogproduct_slug_cat_and_more','2023-05-21 07:35:38.121315'),(32,'shop','0013_remove_catalogproduct_slug','2023-05-21 07:40:50.962751'),(33,'shop','0014_catalogproduct_slug','2023-05-21 07:40:51.033115'),(34,'shop','0015_product_slug','2023-05-21 09:06:11.574710'),(35,'shop','0016_remove_order_quantity','2023-05-22 19:35:14.116945'),(36,'shop','0017_remove_order_total_cost_order_total_amount_and_more','2023-05-23 17:05:57.697777'),(37,'shop','0018_shopuser_phone','2023-05-23 18:18:27.600517'),(38,'shop','0019_productkey_order','2023-05-23 19:11:20.036259');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('c7myd7gf62p85che0yk6m8rn8g3eb95f','.eJxVjDsOwjAQBe_iGlnrv0NJnzNYXnuNA8iR4qRC3J1ESgHtm5n3ZiFuaw1bpyVMmV2ZAHb5HTGmJ7WD5Eds95mnua3LhPxQ-Ek7H-dMr9vp_h3U2OtekyKUSCY6cCCs0GpQpoCxsmBx2WcXNSYtZXZaKZUATZK7a7wfrAXHPl_34zcQ:1q1X14:HyDh7XhZnLMFbMOGka8NFC2gDVF-vjo-gDs1nU-mj0o','2023-06-06 18:45:50.624862'),('d796m6rq1og5v5931y4dacugj3g4yk52','e30:1pzkFY:gyiYT_osaofmIVnnKoA0c_ngZRg8HU5-8AF3wbdN8uw','2023-06-01 20:29:24.622711'),('fx7327stg12ghzde777q8g5g4lmnhfc5','.eJxVjDsOwjAQBe_iGlnGm_hDSZ8zWOvdNQ6gRIqTCnF3iJQC2jcz76USbmtNW5MljawuKqrT75aRHjLtgO843WZN87QuY9a7og_a9DCzPK-H-3dQsdVvbTOLOMrWGELoChQGLwy9eONdJhcKWYyWA-buDC4Cmr6znlyPaEJQ7w8KGzgs:1q0Lvp:MFY5gDgIQ2mchB_7Ol8h35GLUc2gg5j-HKlkUMQEJcw','2023-06-03 12:43:33.607758'),('re84gltnmyx43zm4k6vnxwcprvho9ldi','.eJxVjDsOwjAQBe_iGlnx-k9JzxmstXeDA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibNQSpx-x4zlwW0ndMd2m2WZ27pMWe6KPGiX15n4eTncv4OKvX5rZ3TMA2G06FAVBh9cUA79qEFHVmzLEFFTML6AN0Q0AgdyGgxbB168P_pNN7M:1q1uxc:U3OVcb8pGyDq0kt6BMjZmCRKVgP_zCbS853yBpI8p8s','2023-06-07 20:19:52.910502'),('yv3zlwgkr3b02i2e42irzcw9x2q0hhx5','.eJxVjDsOwjAQBe_iGlnrv0NJnzNYXnuNA8iR4qRC3J1ESgHtm5n3ZiFuaw1bpyVMmV2ZAHb5HTGmJ7WD5Eds95mnua3LhPxQ-Ek7H-dMr9vp_h3U2OtekyKUSCY6cCCs0GpQpoCxsmBx2WcXNSYtZXZaKZUATZK7a7wfrAXHPl_34zcQ:1q19w8:nyCjfDWLf8eOV-JImBgGGTjlIxNuvinsH8hNW56NOwY','2023-06-05 18:07:12.046797');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_catalogproduct`
--

DROP TABLE IF EXISTS `shop_catalogproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_catalogproduct` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_catalogproduct_slug_555754e1` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_catalogproduct`
--

LOCK TABLES `shop_catalogproduct` WRITE;
/*!40000 ALTER TABLE `shop_catalogproduct` DISABLE KEYS */;
INSERT INTO `shop_catalogproduct` VALUES (1,'race','race'),(2,'horror','horror'),(3,'fighting','fighting'),(4,'survival','survival'),(5,'strategies','strategies'),(6,'sports','sports'),(7,'simulator','simulator'),(8,'adventure','adventure'),(9,'action','action'),(10,'role plaing','role-plaing');
/*!40000 ALTER TABLE `shop_catalogproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_commentproduct`
--

DROP TABLE IF EXISTS `shop_commentproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_commentproduct` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(100) NOT NULL,
  `date` datetime(6) NOT NULL,
  `auth_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_commentproduct_product_id_c012b30a_fk_shop_product_id` (`product_id`),
  KEY `shop_commentproduct_auth_id_e5badea9_fk_shop_shopuser_id` (`auth_id`),
  CONSTRAINT `shop_commentproduct_auth_id_e5badea9_fk_shop_shopuser_id` FOREIGN KEY (`auth_id`) REFERENCES `shop_shopuser` (`id`),
  CONSTRAINT `shop_commentproduct_product_id_c012b30a_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_commentproduct`
--

LOCK TABLES `shop_commentproduct` WRITE;
/*!40000 ALTER TABLE `shop_commentproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_commentproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_order`
--

DROP TABLE IF EXISTS `shop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complete` tinyint(1) NOT NULL,
  `date_order` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_order_user_id_00aba627_fk_shop_shopuser_id` (`user_id`),
  CONSTRAINT `shop_order_user_id_00aba627_fk_shop_shopuser_id` FOREIGN KEY (`user_id`) REFERENCES `shop_shopuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_order`
--

LOCK TABLES `shop_order` WRITE;
/*!40000 ALTER TABLE `shop_order` DISABLE KEYS */;
INSERT INTO `shop_order` VALUES (26,1,'2023-05-23 19:40:29.607603',5,522.00),(29,1,'2023-05-23 20:07:40.447696',5,55.00),(30,0,'2023-05-24 20:17:18.813787',5,0.00),(32,0,'2023-05-24 21:46:09.777101',6,500.00);
/*!40000 ALTER TABLE `shop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_orderslist`
--

DROP TABLE IF EXISTS `shop_orderslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_orderslist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `quantity` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_orderslist_order_id_c4bef68e_fk_shop_order_id` (`order_id`),
  KEY `shop_orderslist_product_id_b3603f5b_fk_shop_product_id` (`product_id`),
  CONSTRAINT `shop_orderslist_order_id_c4bef68e_fk_shop_order_id` FOREIGN KEY (`order_id`) REFERENCES `shop_order` (`id`),
  CONSTRAINT `shop_orderslist_product_id_b3603f5b_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`),
  CONSTRAINT `shop_orderslist_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_orderslist`
--

LOCK TABLES `shop_orderslist` WRITE;
/*!40000 ALTER TABLE `shop_orderslist` DISABLE KEYS */;
INSERT INTO `shop_orderslist` VALUES (26,26,1,1),(27,26,4,1),(28,26,3,1),(29,26,30,1),(31,29,28,1),(47,32,2,1);
/*!40000 ALTER TABLE `shop_orderslist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product`
--

DROP TABLE IF EXISTS `shop_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `developer` varchar(255) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `catalog_id` bigint NOT NULL,
  `main_image` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_product_catalog_id_d753a4fe_fk_shop_catalogproduct_id` (`catalog_id`),
  KEY `shop_product_slug_30bd2d5d` (`slug`),
  CONSTRAINT `shop_product_catalog_id_d753a4fe_fk_shop_catalogproduct_id` FOREIGN KEY (`catalog_id`) REFERENCES `shop_catalogproduct` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product`
--

LOCK TABLES `shop_product` WRITE;
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
INSERT INTO `shop_product` VALUES (1,'Forza Horizon 5',300.00,'Playground Games','PC','English','Racing adventures have always been full of varied and interesting adventures that allow you to enjoy the beautiful surroundings and other interesting innovations. This time we invite you to go on a new adventure that will delight not only with its new spaces, but also with amazing car details. By right, this game series is considered the best among racing due to realism and beautiful graphics. You have to go on an amazing adventure with deep potential and great prospects. You just have to use your abilities correctly and you can enjoy the game.',1,'shop/Racing/Forza Horizon 5/forza.jpg','forza-horizon-5'),(2,'CarX Drift Racing Online',500.00,'CarX Technologies, LLC','PC','English','Racing entertainment offers every time to plunge into extraordinary adventures, ride beautiful cars and just have a good time. This time you will have the opportunity to show your skill and dexterity in drifting - a universal type of sliding that allows you to overcome turns without slowing down the speed of the vehicle. This is the highest level of driving skills, so there will be many difficult tracks in the game. It remains only to download CarX Drift Racing Online and start becoming a professional racer, along the way fighting with other players. Now success will depend on the reaction and the ability to smoothly enter the turns.  The choice will be given about 60 unique racing cars, multiplayer, accommodating up to 16 players, more than 11 tracks and small customization elements. The main feature of the gaming adventure will be the confrontation mechanic itself, which is based on the skill of the right drift. You have to think not only about how to overtake an opponent, but also h',1,'shop/Racing/CarX Drift Racing Online/CarX_Drift_Racing_Online.webp','carx-drift-racing-online'),(3,'Dakar Desert Rally',50.00,'Saber Interactive','PC','English','Dakar Desert Rally is an arcade rally in which each of you can go to conquer a huge desert and try to reach the finish line among the leaders. This race is based on a real prototype and has the same real dimensions. You have to choose what kind of transport you want to cross the desert: a truck, a buggy or a motorcycle, and go on an exciting journey to prove your level of professionalism and skills. And for this it will be necessary to download the Dakar Desert Rally game via torrent in order to get all the necessary features in the race.',1,'shop/Racing/Dakar Desert Rally/Dakar.jpg','dakar-desert-rally'),(4,'BeamNG DRIVE',150.00,'BeamNG','PC','English','Meet us at itorrents-igruha.org game BeamNG drive is a car simulator, but very unusual. He\'s very likely to ruin cars. It takes into account speed, impact angle, type of doctors and much more. Such an unusual game was created by an impressive company - BeamNG. A video about the project, which appeared back in 2012, an alpha version was released in 2013, at the beginning of 2015, the current stable (current stable) version appeared, as well as an experimental version for even more deepening into the process. In the future, the project expects improvements, but now BeamNG drive is a must for those who love good graphics and future ability - this is a real source of beauty. Yes, the cars are falling apart in pieces extremely spectacular!',1,'shop/Racing/BeamNG DRIVE/BeamNG_DRIVE.jpg','beamng-drive'),(5,'Wreckfest',40.00,'Bugbear','PC','English','In early December, the official representative of Bugbear Entertainment announced that the working title of the racing project \"Next Car Game\" had been renamed to the commercial name \"Wreckfest\", which more conveys the spirit of the game. The company is already known for the sensational series of games \"FlatOut\", the improved ideological continuation of which was \"Wreckfest\". But, if earlier everything was somewhat computerized, then this time everything is extremely realistic.',1,'shop/Racing/Wreckfest/Wreckfest.webp','wreckfest'),(6,'Dead Island 2',200.00,'Deep Silver Dambuster Studios','PC','English','Who can download the game dead island 2 from a torrent for those horror will continue! And it continues not on the islands where the events of the first part and Escape Dead Island unfolded, but on a more civilized land - in the US state of California. The new developer, the German company Yager Development, familiar to the audience from Spec Ops: The Line, probably decided to change course. Plus, she changed not only the geography, but promised to add lightness and dynamics to the project. You can offer something like this motto: relax, destroying zombies!',2,'shop/Horror/Dead Island 2/deadisland.webp','dead-island-2'),(7,'Amanda the Adventurer',34.00,'MANGLEDmaw Games','PC','English','Amanda the Adventurer - Amanda, along with her friend named Curly, goes on an exciting adventure. At the same time, completely new and funny episodes await her. So there will definitely be no time to be bored here! It\'s just worth doing everything that you are told and it\'s better not to make her angry.',2,'shop/Horror/Amanda the Adventurer/Amanda_the_Adventurer.webp','amanda-the-adventurer'),(8,'Dead Estate',101.00,'Milkbar Lads','PC','English','Dead Estate - you are in a rather creepy place, in a mansion filled with terrible monsters. Do you think you can stay alive? After all, in fact, in a bloody and at the same time dynamic shooter, not everything is so simple.',2,'shop/Horror/Dead Estate/Dead_Estate.webp','dead-estate'),(9,'Hello Neighbor 2',200.00,'Eerie Guest, tinyBuild','PC','English','Surely you never suspected that your neighbor could be a bloodthirsty and dangerous person. In today\'s game, you have to face such a character and try to rescue your friend who he has kidnapped. True, you should not rush too much, as the neighbor is already aware that you are going to visit him and is preparing traps, tests for you, and he himself is not averse to running after you. You have to make a lot of efforts to cope with all the dangers and try to achieve success. Be vigilant, do not let yourself be caught and try to achieve a favorable result.',2,'shop/Horror/Hello Neighbor 2/Hello_Neighbor_2.jpg','hello-neighbor-2'),(10,'DREDGE',46.00,'Black Salt Games','PC','English','DREDGE - Embark on an incredible single player fishing adventure complete with a terrifying undercurrent! Try to collect as much catch as possible, sell it in the store, upgrade your own boat and of course explore the mysterious archipelago. But maybe not worth it?',2,'shop/Horror/DREDGE/DREDGE.webp','dredge'),(12,'WWE 2K23',34.00,'Visual Concepts','PC','English','The previous version of the expected novelty WWE 2K23 was well received by gamers. The game also received a lot of positive reviews from critics. The developer of the series promises to please fans with a new release in the very near future. Gamers will be able to enjoy the game not only on PC. On the assurances of the authors will provide support for the consoles Xbox and PlayStation.',3,'shop/Fighting/WWE 2K23/WWE.webp','wwe-2k23'),(13,'The King of Fighters 15 (XV)',56.00,'SNK CORPORATION','PC','English','Fighting games continue to evolve despite the fact that players have to use a variety of resources to popularize the genre, thinking that such games are no longer attractive. In fact, the developers continue to develop such areas and this time you will have a unique opportunity to enjoy a fairly high-quality and interesting adventure. This time, it will be enough for you to just actively use your nimble fingers, assess the situation and try to correctly use any opportunities to achieve a good result. You have to fight with different characters and you should not hope that it will be easy to do this.',3,'shop/Fighting/The King of Fighters 15 (XV)/The_King_of_Fighters_15_XV.webp','the-king-of-fighters-15-xv'),(14,'Punch A Bunch',67.00,'Pontypants','PC','English','Punch A Bunch - dive headlong into a challenging boxing fighting game where the outcome will depend on your skill! Try to get through 3 different championships and meet various opponents on your way. Are you up to the task?',3,'shop/Fighting/Punch A Bunch/Punch_A_Bunch.webp','punch-a-bunch'),(15,'Sclash',23.00,'Just For Games, Abiding Bridge','PC','English','Sclash - dive headlong into fairly dynamic battles with samurai, where, in order to kill the enemy, you need to deliver just one decisive blow! Try to show your skills as efficiently as possible, get together in epic battles and calculate all your steps in advance. In addition, the game has stamina, you need to monitor your breathing and even pick up coins for attacks. Well, you just have to download Sclash via torrent on PC.',3,'shop/Fighting/Sclash/Sclash.jpg','sclash'),(16,'Rubber Bandits',55.00,'Flashbulb','PC','English','Rubber Bandits is a crazy action game featuring ridiculous, funny heroes ready to fight for a share of their loot.',3,'shop/Fighting/Rubber Bandits/Rubber_Bandits.webp','rubber-bandits'),(17,'Black Skylands',11.00,'Hungry Couch Games','PC','English','Action adventure Black Skylands is the first exciting game created in the genre called skypunk. It perfectly combines elements of the surrounding open world, sandbox and exciting top-down shooter. In the sky, you can find spaces with various secrets and magnificent treasures.',4,'shop/Survival/Black Skylands/Black_Skylands.webp','black-skylands'),(18,'Surviving the Abyss',45.00,'Rocket Flair Studios','PC','English','urviving the Abyss - our planet, 1976 The Cold War is on and you are building a unique deep-sea research facility. Who will then work on the development of a special weapon capable of creating clones.',4,'shop/Survival/Surviving the Abyss/Surviving_the_Abyss.webp','surviving-the-abyss'),(19,'Dysmantle',44.00,'10tons Ltd','PC','English','Apocalypse survival simulators continue to come out and are almost devoid of new ideas. True, do not rush to make hasty conclusions, since now you will have the opportunity to download the DYSMANTLE torrent. A brand new adventure will let you become a survivor who decided to leave the shelter and pursue personal development against the backdrop of the doomsday caused by zombies. A high proportion of danger does not frighten the main character at all, so you can help him get all the necessary resources and change this world for the better.',4,'shop/Survival/Dysmantle/Dysmantle.webp','dysmantle'),(20,'Tunguska The Visitation',66.00,'Rotorist Workshop','PC','English','The Rotorist Workshop developer studio decided to slightly improve the mood of the fans of the famous Stalker game series and released a game called Tunguska: The Visitation, which is very similar in atmosphere to the legendary series, however, it is presented in an isometric format and offers to go not to Chernobyl, but to the territory of the fall Tunguska meteorite. Intrigued? Then you should not waste time and rather take the opportunity to download Tunguska The Visitation via torrent for free on your PC. Now you will witness strange events, fight zombies, encounter anomalies and try to survive.',4,'shop/Survival/Tunguska The Visitation/Tunguska_The_Visitation.jpg','tunguska-the-visitation'),(22,'ICARUS',77.00,'RocketWerkz','PC','English','ICARUS is a survival simulator that is focused solely not on creating conditions for survival, but on organizing the extraction of a rare and expensive resource on an uninhabited planet. Despite the fact that the planet Icarus has an almost identical climate, like on Earth, you should not relax. After all, the atmosphere of the planet has long been poisoned and people cannot exist on it. And in order to somehow change the situation, you will first have to download the ICARUS game via torrent, and only then master all the functions and features in this game adventure. Remember that any mistake on this planet can cost you your life.',4,'shop/Survival/ICARUS/ICARUS_UUqAycq.jpg','icarus'),(23,'Foundation',33.00,'Polymorph Games','PC','English','We can already safely say that somewhere at the end of this year it will be possible to download the Foundation torrent for free - a city-building simulator dedicated to Romanesque and Gothic architecture, because we are talking about the Middle Ages. But do not expect primitiveness, because the developer, a young Canadian company Polymorph Games, drew the best from such classics as Settlers, SimCity, Anno, Crusader Kings. It becomes clear that it is not only about construction, the Foundation should have wars and the development of new territories.',5,'shop/Strategies/Foundation/Foundation.jpg','foundation'),(24,'Unity of Command 2',44.00,'2x2 Games, Croteam','PC','English','The Second World War always introduces a lot of awkward moments, which eventually become the cause of colossal clashes and unpleasant wars. Today you will have the opportunity to go on an exciting adventure and try to show all your skills as a commander in order to succeed in an unequal confrontation. To do this, it will be enough just to download the Unity of Command 2 torrent and you can go on an exciting adventure, which will surely seem not only original, but also quite interesting.',5,'shop/Strategies/Unity of Command 2/Unity_of_Command_2.webp','unity-of-command-2'),(25,'The Farmer Was Replaced',55.00,'Timon Herzog','PC','English','The Farmer Was Replaced is an unusual adventure with elements of farming and programming. You will take on the role of a drone programmer who needs to be automated for harvesting and sowing fields. To do this, you have to carefully study the programming language and try to achieve a favorable result. In the meantime, we want to invite you to download The Farmer Was Replaced torrent on your PC and after that you can go on an exciting adventure. Just get ready to think a lot, because not only the result, but also the other available result depends on it.',5,'shop/Strategies/The Farmer Was Replaced/The_Farmer_Was_Replaced.jpg','the-farmer-was-replaced'),(26,'Pan\'orama',66.00,'Chicken Launcher','PC','English','Pan\'orama is an unusual entertainment with elements of tactics. This time you have to go on an exciting adventure that will delight you not only with a variety of opportunities, but will also become the basis for a pleasant pastime. To begin with, we want to recommend that you download the Pan\'orama torrent on your PC, and after that you can begin to actively use any of your features for a pleasant game. You will manage a large number of different tiles, compare them with each other and try by any means to achieve a good result. Just take your time, even contemplation requires concentration and the ability to correctly compare various elements.',5,'shop/Strategies/Pan\'orama/Panorama.webp','panorama'),(27,'Ostranauts',88.00,'Blue Bottle Games','PC','English','The game is a detailed simulation of survival on a spaceship that has entered the solar system. Download Ostranauts torrent for free in Russian and find yourself in the NEO Scavenger universe at a time when the Earth was on the verge of destruction, and the rest of the solar system is trying to survive in a capitalist dystopia. Players will create and develop their ship, choose a captain, extract resources and develop the economy between the team.',5,'shop/Strategies/Ostranauts/Ostranauts.webp','ostranauts'),(28,'FIFA 23',55.00,'Electronic Arts','PC','English','FIFA 23 is a sports simulator that offers an exciting adventure and will try to achieve a good result that will surely please you. Series discovery has been going on for a long time and getting better every time. All you need to do is download the Fifa 23 torrent on PC and after that you can start the adventure to gradually achieve a good result and strive to achieve a result. The main thing is to be ready for tough competition, as this time the designers have again worked on AI, which will definitely make you learn tricks, tactics and strive for self-development.',6,'shop/Sports/FIFA 23/fifa-23.jpg','fifa-23'),(29,'World of Tanks',77.00,'Wargaming.net','PC','English','World of Tanks is a client-based massively multiplayer real-time online game in the genre of an arcade tank simulator in the historical setting of World War II, developed by the Belarusian studio Wargaming.net  Why is it worth downloading the World of Tanks version 9.11 torrent from the official website? In the game World of Tanks, players join the battles immediately, without preliminary games in single player mode. Initially, the player gets at his disposal one tank of the first level of each nation: USSR (MS-1), Germany (Leichttraktor), USA (T1 Cunningham), France (Renault FT), China (NC-31), Japan (Renault Otsu) - light tanks, Great Britain - a medium tank (Vickers Medium Mark I) with a fully trained crew. By participating in battles, the player earns \"credits\", trains the crew and accumulates experience points to gain access to new units and combat vehicles.  Each model of armored vehicles has a number of components - a gun, a turret, a chassis, an engine and a radio station - tha',7,'shop/Strategies/World of Tanks/World_of_Tanks.jpg','world-of-tanks'),(30,'Paleon',22.00,'Paleodev','PC','English','A game that allows you to imagine yourself as a time traveler stuck in the past and forced to develop technology to return home. To start building your civilization, just download Paleon via torrent in Russian.',8,'shop/Survival/Paleon/Paleon.jpg','paleon'),(31,'Atomic Heart',99.00,'Mundfish','PC','English','The USSR was a great power, but still today, many people continue to reveal the terrible secrets of that era, especially when it comes to the KGB investigation. This time you will take on the role of a KGB operative who was sent to a closed area to investigate strange and dangerous facts. Information has appeared that forbidden research is taking place in this territory, based on human modification of the body, the creation of clones and dangerous creatures. And in order to study this place in more detail, you will have to become one of the experimental subjects and try to survive in this hell, but first we recommend that you download Atomic Heart via torrent on a PC in Russian, which will allow you to reveal this secret.',10,'shop/Role Plaing/Atomic Heart/Atomic_Heart.webp','atomic-heart'),(32,'Star Wars Jedi Survivor',88.00,'Electronic Arts','PC','English','Star Wars Jedi Survivor is a third-person adventure that invites you to re-immerse yourself in the Star Wars universe and get to know the next narrative. This game adventure promises you to go on an amazing adventure and try to save the world. After all, the Jedi have been carrying this burden for a long time and are trying to comply with all relevant points of the hero\'s code. As before, you will find furious action, the opportunity to have a good time and even more battles. Try to use all your skills correctly and try to remind that the Jedi are alive. And to get started, we recommend that you download the Star Wars Jedi Survivor torrent on your PC. The world of the Jedi is large and will definitely please with its features, so you can safely move.',9,'shop/Action/Star Wars Jedi Survivor/Star_Wars_Jedi_Survivor.jpg','star-wars-jedi-survivor');
/*!40000 ALTER TABLE `shop_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_productkey`
--

DROP TABLE IF EXISTS `shop_productkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_productkey` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `products_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_productkey_products_id_c32750a8_fk_shop_product_id` (`products_id`),
  KEY `shop_productkey_order_id_2f914e91_fk_shop_order_id` (`order_id`),
  CONSTRAINT `shop_productkey_order_id_2f914e91_fk_shop_order_id` FOREIGN KEY (`order_id`) REFERENCES `shop_order` (`id`),
  CONSTRAINT `shop_productkey_products_id_c32750a8_fk_shop_product_id` FOREIGN KEY (`products_id`) REFERENCES `shop_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_productkey`
--

LOCK TABLES `shop_productkey` WRITE;
/*!40000 ALTER TABLE `shop_productkey` DISABLE KEYS */;
INSERT INTO `shop_productkey` VALUES (6,'S83I3M1JXH',1,26),(7,'Y1TCN9NP5F',4,26),(8,'IPL2VPH5VE',3,26),(9,'EAJNIWPBCS',30,26),(17,'EKHJKFXV3R',2,32),(18,'U6AJHUJOCA',2,32),(19,'MVEOKMMXNF',2,32),(20,'NCRDFIJETX',2,32),(21,'2OS0KSZA2K',2,32),(22,'QHTZIV4XKU',2,32),(23,'HJOUYVKMZE',2,32),(24,'JMYOGLX5UM',2,32),(25,'IXW7P3QTIK',2,32),(26,'OVEQ5WEELI',2,32),(27,'SBZNPHVP3N',2,32);
/*!40000 ALTER TABLE `shop_productkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_productphoto`
--

DROP TABLE IF EXISTS `shop_productphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_productphoto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `products_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_productphoto_products_id_25378668_fk_shop_product_id` (`products_id`),
  CONSTRAINT `shop_productphoto_products_id_25378668_fk_shop_product_id` FOREIGN KEY (`products_id`) REFERENCES `shop_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_productphoto`
--

LOCK TABLES `shop_productphoto` WRITE;
/*!40000 ALTER TABLE `shop_productphoto` DISABLE KEYS */;
INSERT INTO `shop_productphoto` VALUES (4,'shop/Horror/Dead Island 2/di2_1.jpg',6),(5,'shop/Horror/Dead Island 2/di2_2.jpg',6),(6,'shop/Horror/Dead Island 2/di2_3.jpeg',6),(7,'shop/Racing/Forza Horizon 5/forza5_1.jpg',1),(8,'shop/Racing/Forza Horizon 5/forza5_2.jpg',1),(9,'shop/Racing/Forza Horizon 5/forza5_3.jpg',1),(10,'shop/Racing/Dakar Desert Rally/dakar_1.jpg',3),(11,'shop/Racing/Dakar Desert Rally/dakar_2.jpg',3),(12,'shop/Racing/Dakar Desert Rally/dakar_3.jpg',3),(13,'shop/Racing/BeamNG DRIVE/BeamNG_DRIVE_1.jpg',4),(14,'shop/Racing/BeamNG DRIVE/BeamNG_DRIVE_2.jpg',4),(15,'shop/Racing/BeamNG DRIVE/BeamNG_DRIVE_3.jpg',4),(16,'shop/Racing/Wreckfest/Wreckfest_1.jpg',5),(17,'shop/Racing/Wreckfest/Wreckfest_2.jpg',5),(18,'shop/Racing/Wreckfest/Wreckfest_3.jpg',5),(19,'shop/Racing/CarX Drift Racing Online/CarX_Drift_Racing_Online_1.jpg',2),(20,'shop/Racing/CarX Drift Racing Online/CarX_Drift_Racing_Online_2.jpg',2),(21,'shop/Racing/CarX Drift Racing Online/CarX_Drift_Racing_Online_3.jpg',2),(22,'shop/Horror/Amanda the Adventurer/Amanda_the_Adventurer_1.webp',7),(23,'shop/Horror/Amanda the Adventurer/Amanda_the_Adventurer_2.webp',7),(24,'shop/Horror/Amanda the Adventurer/Amanda_the_Adventurer_3.webp',7),(25,'shop/Horror/Dead Estate/Dead_Estate_1.jpg',8),(26,'shop/Horror/Dead Estate/Dead_Estate_2.jpg',8),(27,'shop/Horror/Dead Estate/Dead_Estate_3.jpg',8),(28,'shop/Horror/Hello Neighbor 2/Hello_Neighbor_2_1.jpg',9),(29,'shop/Horror/Hello Neighbor 2/Hello_Neighbor_2_2.webp',9),(30,'shop/Horror/Hello Neighbor 2/Hello_Neighbor_2_3.webp',9),(31,'shop/Horror/DREDGE/DREDGE_1.jpg',10),(32,'shop/Horror/DREDGE/DREDGE_2.jpg',10),(33,'shop/Horror/DREDGE/DREDGE_3.jpg',10),(34,'shop/Fighting/WWE 2K23/WWE_1.jpg',12),(35,'shop/Fighting/WWE 2K23/WWE_2.webp',12),(36,'shop/Fighting/WWE 2K23/WWE_3.webp',12),(37,'shop/Fighting/The King of Fighters 15 (XV)/The_King_of_Fighters_15_XV_1.jpg',13),(38,'shop/Fighting/The King of Fighters 15 (XV)/The_King_of_Fighters_15_XV_2.jpg',13),(39,'shop/Fighting/The King of Fighters 15 (XV)/The_King_of_Fighters_15_XV_3.jpg',13),(40,'shop/Fighting/Punch A Bunch/Punch_A_Bunch_1.webp',14),(41,'shop/Fighting/Punch A Bunch/Punch_A_Bunch_2.webp',14),(42,'shop/Fighting/Punch A Bunch/Punch_A_Bunch_3.webp',14),(43,'shop/Fighting/Sclash/Sclash_1.jpg',15),(44,'shop/Fighting/Sclash/Sclash_2.jpg',15),(45,'shop/Fighting/Sclash/Sclash_3.jpg',15),(46,'shop/Fighting/Rubber Bandits/Rubber_Bandits_1.jpg',16),(47,'shop/Fighting/Rubber Bandits/Rubber_Bandits_2.jpg',16),(48,'shop/Fighting/Rubber Bandits/Rubber_Bandits_3.jpg',16),(49,'shop/Survival/Black Skylands/Black_Skylands_1.jpg',17),(50,'shop/Survival/Black Skylands/Black_Skylands_2.jpg',17),(51,'shop/Survival/Black Skylands/Black_Skylands_3.jpg',17),(52,'shop/Survival/Surviving the Abyss/Surviving_the_Abyss_1.webp',18),(53,'shop/Survival/Surviving the Abyss/Surviving_the_Abyss_2.webp',18),(54,'shop/Survival/Surviving the Abyss/Surviving_the_Abyss_3.webp',18),(55,'shop/Survival/Tunguska The Visitation/Tunguska_The_Visitation_1.webp',20),(56,'shop/Survival/Tunguska The Visitation/Tunguska_The_Visitation_2.webp',20),(57,'shop/Survival/Tunguska The Visitation/Tunguska_The_Visitation_3.webp',20),(61,'shop/Strategies/Foundation/Foundation_1.webp',23),(62,'shop/Strategies/Foundation/Foundation_2.webp',23),(63,'shop/Strategies/Foundation/Foundation_3.webp',23),(64,'shop/Strategies/Unity of Command 2/Unity_of_Command_2_1.jpg',24),(65,'shop/Strategies/Unity of Command 2/Unity_of_Command_2_2.jpg',24),(66,'shop/Strategies/Unity of Command 2/Unity_of_Command_2_3.jpg',24),(67,'shop/Strategies/The Farmer Was Replaced/The_Farmer_Was_Replaced_1.jpg',25),(68,'shop/Strategies/The Farmer Was Replaced/The_Farmer_Was_Replaced_2.jpg',25),(69,'shop/Strategies/The Farmer Was Replaced/The_Farmer_Was_Replaced_3.jpg',25),(70,'shop/Strategies/Pan\'orama/Panorama_1.jpg',26),(71,'shop/Strategies/Pan\'orama/Panorama_2.jpg',26),(72,'shop/Strategies/Pan\'orama/Panorama_3.jpg',26),(73,'shop/Strategies/Ostranauts/Ostranauts_1.jpg',27),(74,'shop/Strategies/Ostranauts/Ostranauts_2.jpg',27),(75,'shop/Strategies/Ostranauts/Ostranauts_3.jpg',27),(76,'shop/Sports/FIFA 23/fifa-23-1.jpg',28),(77,'shop/Sports/FIFA 23/fifa-23-2.jpg',28),(78,'shop/Sports/FIFA 23/fifa-23-3.jpg',28),(79,'shop/Strategies/World of Tanks/World_of_Tanks-1.jpg',29),(80,'shop/Strategies/World of Tanks/World_of_Tanks-2.jpg',29),(81,'shop/Strategies/World of Tanks/World_of_Tanks-3.jpg',29),(82,'shop/Survival/Paleon/Paleon-1.jpg',30),(83,'shop/Survival/Paleon/Paleon-2.jpg',30),(84,'shop/Survival/Paleon/Paleon-3.webp',30),(85,'shop/Role Plaing/Atomic Heart/Atomic_Heart-1.webp',31),(86,'shop/Role Plaing/Atomic Heart/Atomic_Heart-2.webp',31),(87,'shop/Role Plaing/Atomic Heart/Atomic_Heart-3.jpg',31),(88,'shop/Action/Star Wars Jedi Survivor/Star_Wars_Jedi_Survivor-1.webp',32),(89,'shop/Action/Star Wars Jedi Survivor/Star_Wars_Jedi_Survivor-2.webp',32),(90,'shop/Action/Star Wars Jedi Survivor/Star_Wars_Jedi_Survivor-3.webp',32),(91,'shop/Survival/Dysmantle/Dysmantle-1.jpg',19),(92,'shop/Survival/Dysmantle/Dysmantle-2.jpg',19),(93,'shop/Survival/Dysmantle/Dysmantle-3.jpg',19);
/*!40000 ALTER TABLE `shop_productphoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_productsday`
--

DROP TABLE IF EXISTS `shop_productsday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_productsday` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_productsday_product_id_ee0ec332_fk_shop_product_id` (`product_id`),
  CONSTRAINT `shop_productsday_product_id_ee0ec332_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_productsday`
--

LOCK TABLES `shop_productsday` WRITE;
/*!40000 ALTER TABLE `shop_productsday` DISABLE KEYS */;
INSERT INTO `shop_productsday` VALUES (1,1),(2,6),(4,12);
/*!40000 ALTER TABLE `shop_productsday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_productsystemrequirement`
--

DROP TABLE IF EXISTS `shop_productsystemrequirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_productsystemrequirement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `operating_system` varchar(255) NOT NULL,
  `processor` varchar(255) NOT NULL,
  `ram` varchar(255) NOT NULL,
  `video_card` varchar(255) NOT NULL,
  `free_hard_disk_space` varchar(255) NOT NULL,
  `products_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_productsystemre_products_id_6ec5c378_fk_shop_prod` (`products_id`),
  CONSTRAINT `shop_productsystemre_products_id_6ec5c378_fk_shop_prod` FOREIGN KEY (`products_id`) REFERENCES `shop_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_productsystemrequirement`
--

LOCK TABLES `shop_productsystemrequirement` WRITE;
/*!40000 ALTER TABLE `shop_productsystemrequirement` DISABLE KEYS */;
INSERT INTO `shop_productsystemrequirement` VALUES (1,'Windows 10 (64-bit) version 15063 or later','AMD Ryzen 3 1200 or Intel Core i5-4460','8 GB','AMD Radeon RX 470 or NVIDIA GeForce GTX 970','160 GB',1),(2,'Windows 10 (64-bit) version 15063 or later','AMD Ryzen 3 1200 or Intel Core i5-4460','8 GB','AMD Radeon RX 470 or NVIDIA GeForce GTX 970','160 GB',2),(3,'Windows 10 / 11 (64-bit)','Core i5 -2300 / FX-6300','8 GB','4 GB, DirectX 12','34 GB',3),(4,'Windows 7, 8, 10, 11 (64-bit)','Intel Core 2 Duo 3.0 GHz','8 GB','Radeon HD 7750 / Nvidia GeForce GTX 550 Ti','45 GB',4),(5,'Windows 7, 8, 10','Intel Core 2 Duo 2.4 GHz or AMD','6 GB','Geforce GTX 560 / Radeon HD 6850','25 GB',5),(6,'Windows 7 / 8 / 10 (64-bit)','Intel i5 4590 / AMD Ryzen3 1200','4 GB','GeForce 950GT / AMD R9 270','7 GB',6),(7,'Windows 7, 8, 10 (64-bit)','Dual-core 2.0 GHz','4 GB','GeForce 470 GTX','2 GB',7),(8,'Windows 7 / 8 / 10 (64-bit)','Intel Core 2 Duo E6320','2 GB','GeForce 7600 GS','300 MB',8),(9,'Windows 10/11 (64-bit)','Intel i3 4th gen / AMD Athlon X4 880K','6 GB','GeForce GTX 750 Ti / AMD Radeon HD 7850','20 GB',9),(10,'Windows 10 (64-bit)','Intel Core i3-2100 / AMD Phenom II X4 965','4 GB','Nvidia 8800 GT / Radeon HD 6570','2 GB',10),(11,'Windows 10 (64-bit)','Intel Core i5-3550 / AMD FX 8150','8 GB','GeForce GTX 1060 / Radeon RX 480','80 GB',12),(12,'Windows 7 / 8 / 10 (64-bit)','Intel Core i5','8 GB','GeForce GTX 770 2GB / Radeon R9 280 3GB','65 GB',13),(13,'Windows 7 / 8 / 10 (64-bit)','2nd generation Core i3 / AMD A6','4 GB','Nvidia 8800 GT / Intel HD 3000','2 GB',14),(14,'Windows 7 / 8 / 10 (64-bit)','3.0 Ghz','6 GB','DirectX 10','800 MB',15),(15,'Windows 7 / 8 / 10 (64-bit)','i3 or equivelant','4 GB','Integrated Graphics Card will do','1 GB',16),(16,'Windows 7 / 8 / 10 (64-bit)','Intel i3 2125 3.30 GHz','4 GB','GT 750M','1.6 GB',17),(17,'Windows 7 / 8 / 10 (64-bit)','Intel Core i5-3570K','8 GB','GeForce GTX 950','5 GB',18),(18,'Windows 7 / 8 / 10 (64-bit)','2 GHz','2 GB','SM 3.0+','2 GB',19),(19,'Windows 7 / 8 / 10 (64-bit)','Intel Core i7','4 GB','GeForce GT 1030','7 GB',20),(21,'Windows 7 / 8 / 10 (64-bit)','Intel i5 4590 / AMD Ryzen3 1200','8 GB','GeForce GTX 750 Ti / AMD Radeon HD 7850','45 GB',23),(22,'Windows 7 / 8 / 10 (64-bit)','Intel i5 4590 / AMD Ryzen3 1200','4 GB','GeForce GTX 750 Ti / AMD Radeon HD 7850','2 GB',24),(23,'Windows 7 / 8 / 10 (64-bit)','Intel i5 4590 / AMD Ryzen3 1200','4 GB','GeForce GTX 750 Ti / AMD Radeon HD 7850','25 GB',25),(24,'Windows 7 / 8 / 10 (64-bit)','Intel Core 2 Duo 3.0 GHz','8 GB','GeForce GTX 750 Ti / AMD Radeon HD 7850','20 GB',26),(25,'Windows 7, 8, 10 (64-bit)','Intel Core 2 Duo E6320','6 GB','GeForce GTX 750 Ti / AMD Radeon HD 7850','20 GB',27),(26,'Windows 7 / 8 / 10 (64-bit)','Intel i5 4590 / AMD Ryzen3 1200','4 GB','GeForce 7600 GS','45 GB',28),(27,'Windows 7 / 8 / 10 (64-bit)','Intel i5 4590 / AMD Ryzen3 1200','4 GB','GeForce 950GT / AMD R9 270','25 GB',29),(28,'Windows 7 / 8 / 10 (64-bit)','Intel Core 2 Duo 3.0 GHz','4 GB','GeForce 470 GTX','7 GB',30),(29,'Windows 7 / 8 / 10 (64-bit)','Intel i5 4590 / AMD Ryzen3 1200','4 GB','Radeon HD 7750 / Nvidia GeForce GTX 550 Ti','45 GB',31),(30,'Windows 7 / 8 / 10 (64-bit)','Intel i5 4590 / AMD Ryzen3 1200','8 GB','Geforce GTX 560 / Radeon HD 6850','20 GB',32);
/*!40000 ALTER TABLE `shop_productsystemrequirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_shopuser`
--

DROP TABLE IF EXISTS `shop_shopuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_shopuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_create` datetime(6) NOT NULL,
  `phone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_shopuser`
--

LOCK TABLES `shop_shopuser` WRITE;
/*!40000 ALTER TABLE `shop_shopuser` DISABLE KEYS */;
INSERT INTO `shop_shopuser` VALUES (5,'Alexey','Holenko','bigtigerlesha@gmail.com','1234','2023-05-24 20:12:52.481970','+380986074515'),(6,'Laki','Lakovich','alexey.holenko@gmail.com','1111','2023-05-24 21:24:50.875307','0986074515');
/*!40000 ALTER TABLE `shop_shopuser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-25  0:48:19
