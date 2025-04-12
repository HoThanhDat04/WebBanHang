CREATE DATABASE  IF NOT EXISTS `cosmetic_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cosmetic_db`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: cosmetic_db
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address_line` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `country` varchar(50) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Addresses_user_id_d84cc79d_fk_auth_user_id` (`user_id`),
  CONSTRAINT `Addresses_user_id_d84cc79d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'123 Đường Láng','Hà Nội','100000','Vietnam',1,5);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add address',7,'add_address'),(26,'Can change address',7,'change_address'),(27,'Can delete address',7,'delete_address'),(28,'Can view address',7,'view_address'),(29,'Can add brand',8,'add_brand'),(30,'Can change brand',8,'change_brand'),(31,'Can delete brand',8,'delete_brand'),(32,'Can view brand',8,'view_brand'),(33,'Can add cart',9,'add_cart'),(34,'Can change cart',9,'change_cart'),(35,'Can delete cart',9,'delete_cart'),(36,'Can view cart',9,'view_cart'),(37,'Can add user',10,'add_user'),(38,'Can change user',10,'change_user'),(39,'Can delete user',10,'delete_user'),(40,'Can view user',10,'view_user'),(41,'Can add category',11,'add_category'),(42,'Can change category',11,'change_category'),(43,'Can delete category',11,'delete_category'),(44,'Can view category',11,'view_category'),(45,'Can add order',12,'add_order'),(46,'Can change order',12,'change_order'),(47,'Can delete order',12,'delete_order'),(48,'Can view order',12,'view_order'),(49,'Can add product',13,'add_product'),(50,'Can change product',13,'change_product'),(51,'Can delete product',13,'delete_product'),(52,'Can view product',13,'view_product'),(53,'Can add product image',14,'add_productimage'),(54,'Can change product image',14,'change_productimage'),(55,'Can delete product image',14,'delete_productimage'),(56,'Can view product image',14,'view_productimage'),(57,'Can add product variant',15,'add_productvariant'),(58,'Can change product variant',15,'change_productvariant'),(59,'Can delete product variant',15,'delete_productvariant'),(60,'Can view product variant',15,'view_productvariant'),(61,'Can add order item',16,'add_orderitem'),(62,'Can change order item',16,'change_orderitem'),(63,'Can delete order item',16,'delete_orderitem'),(64,'Can view order item',16,'view_orderitem'),(65,'Can add cart item',17,'add_cartitem'),(66,'Can change cart item',17,'change_cartitem'),(67,'Can delete cart item',17,'delete_cartitem'),(68,'Can view cart item',17,'view_cartitem'),(69,'Can add wishlist',18,'add_wishlist'),(70,'Can change wishlist',18,'change_wishlist'),(71,'Can delete wishlist',18,'delete_wishlist'),(72,'Can view wishlist',18,'view_wishlist');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'!XUoM68I5ojkahnYtX2Fl9zL7QpOyHmDzoqaW8Lv2',NULL,0,'customer1','Nguyen','Van A','customer1@example.com',0,1,'2025-04-09 12:33:04.161200'),(2,'!RIbjjukaE8m61DChCSNndMpg1r4QIa9e5Xn004DS',NULL,0,'customer2','Nguyen','Van B','customer2@example.com',0,1,'2025-04-09 12:42:01.283616'),(3,'!Va371ksxD4KEau7slYCBhdGGPkUcnloJPcWIzPZ2',NULL,0,'customer3','Nguyen','Van C','customer3@example.com',0,1,'2025-04-09 12:44:08.944301'),(4,'pbkdf2_sha256$870000$NfGa4Y24dKXmvksnuayhQY$ELkACqLi7Xs/IHD8436wssBOzKlGZQYn3uhaLMe4LnY=',NULL,0,'customer4','Nguyen','Van D','customer4@example.com',0,1,'2025-04-09 12:47:13.851068'),(5,'pbkdf2_sha256$870000$IbFch6B4YRH6dYKfJfMNjz$srEv3OAbDbA7L+q3kOMr/IaFBoXy8LyPK1kuv3wxOVE=',NULL,0,'customer5','Nguyen Updated','Van Updated','customer5@example.com',0,1,'2025-04-09 12:48:53.981693'),(6,'pbkdf2_sha256$870000$djHuF5HY7j4ABkr6QWVklY$jo5v59W/b4c120rn8IsxYWhHppEt2vb7Yp+nYXVeCHE=','2025-04-09 17:11:57.190266',1,'admin','','','admin@example.com',1,1,'2025-04-09 17:10:39.453181'),(7,'pbkdf2_sha256$870000$QKNgMn9IfPK6qltQcEegLc$NF1KPvHuSaDW6OUVV/yLne3yGPW605zJdxg41Tl84NA=',NULL,0,'hothanhdat','','','tuilahothanhdatday@gmail.com',0,1,'2025-04-11 08:54:43.464114'),(8,'pbkdf2_sha256$870000$ZQpqHHYJrKGMRTMSrCuYI2$nKg05p2+tgv48QvswxYpO6aoyoz20s7eLn77BEg3Sck=',NULL,0,'lemy','','','my@gmail.com',0,1,'2025-04-11 09:53:45.461563'),(9,'pbkdf2_sha256$870000$aEEiUwSAzVEu3XQE4iXh46$iFq7HAABWxT2KI3mIYMWYXBMNV99auw733T0gDQd7L4=',NULL,0,'dat','','','Thuhuynh909@gmail.com',0,1,'2025-04-11 10:04:58.240141'),(10,'pbkdf2_sha256$870000$UI3c5tBFROGuz8ZHyJKFxp$oYwYnPEb9DL++4yToBHJIPGMRSRYNbHuTMZuDe49wow=',NULL,0,'my','','','ha@gmail.com',0,1,'2025-04-11 11:46:28.166247');
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
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (2,'Chanel'),(1,'MAC'),(3,'Maybelline');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `session_id` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Cart_user_id_c44ac99e_fk_auth_user_id` (`user_id`),
  CONSTRAINT `Cart_user_id_c44ac99e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'abc123','2025-04-09 13:05:20.458113',5),(2,'','2025-04-11 10:16:57.260809',9),(3,'','2025-04-11 11:46:54.095921',10);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `cart_id` bigint NOT NULL,
  `variant_id` bigint DEFAULT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Cart_Items_cart_id_457018cd_fk_Cart_id` (`cart_id`),
  KEY `Cart_Items_variant_id_1519ed63_fk_Product_Variants_id` (`variant_id`),
  KEY `Cart_Items_product_id_eea21c10_fk_Products_id` (`product_id`),
  CONSTRAINT `Cart_Items_cart_id_457018cd_fk_Cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `Cart_Items_product_id_eea21c10_fk_Products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `Cart_Items_variant_id_1519ed63_fk_Product_Variants_id` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (8,1,2,1,1),(9,1,2,NULL,3);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Categories_parent_id_75f878a6_fk_Categories_id` (`parent_id`),
  CONSTRAINT `Categories_parent_id_75f878a6_fk_Categories_id` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Son môi',NULL,NULL),(2,'Son lì',1,NULL),(3,'Son bóng',1,NULL),(4,'Kem dưỡng da',NULL,NULL),(5,'Phấn mắt',NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'api_cosmetics','address'),(8,'api_cosmetics','brand'),(9,'api_cosmetics','cart'),(17,'api_cosmetics','cartitem'),(11,'api_cosmetics','category'),(12,'api_cosmetics','order'),(16,'api_cosmetics','orderitem'),(13,'api_cosmetics','product'),(14,'api_cosmetics','productimage'),(15,'api_cosmetics','productvariant'),(10,'api_cosmetics','user'),(18,'api_cosmetics','wishlist'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-04-09 12:16:46.141290'),(2,'auth','0001_initial','2025-04-09 12:16:46.732093'),(3,'admin','0001_initial','2025-04-09 12:16:46.902299'),(4,'admin','0002_logentry_remove_auto_add','2025-04-09 12:16:46.908513'),(5,'admin','0003_logentry_add_action_flag_choices','2025-04-09 12:16:46.913773'),(6,'api_cosmetics','0001_initial','2025-04-09 12:16:47.977301'),(7,'contenttypes','0002_remove_content_type_name','2025-04-09 12:16:48.045148'),(8,'auth','0002_alter_permission_name_max_length','2025-04-09 12:16:48.099803'),(9,'auth','0003_alter_user_email_max_length','2025-04-09 12:16:48.116818'),(10,'auth','0004_alter_user_username_opts','2025-04-09 12:16:48.121819'),(11,'auth','0005_alter_user_last_login_null','2025-04-09 12:16:48.173777'),(12,'auth','0006_require_contenttypes_0002','2025-04-09 12:16:48.176612'),(13,'auth','0007_alter_validators_add_error_messages','2025-04-09 12:16:48.182066'),(14,'auth','0008_alter_user_username_max_length','2025-04-09 12:16:48.246392'),(15,'auth','0009_alter_user_last_name_max_length','2025-04-09 12:16:48.310247'),(16,'auth','0010_alter_group_name_max_length','2025-04-09 12:16:48.326762'),(17,'auth','0011_update_proxy_permissions','2025-04-09 12:16:48.336797'),(18,'auth','0012_alter_user_first_name_max_length','2025-04-09 12:16:48.395480'),(19,'sessions','0001_initial','2025-04-09 12:16:48.432887'),(20,'api_cosmetics','0002_alter_address_user_alter_cart_user_alter_order_user_and_more','2025-04-09 12:21:04.865807'),(21,'api_cosmetics','0003_cartitem_product_alter_cartitem_cart_and_more','2025-04-11 17:46:46.280750'),(22,'api_cosmetics','0004_category_image','2025-04-12 07:22:46.800439');
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
INSERT INTO `django_session` VALUES ('igxk0trz1ewi0atf0735gfgq6f55umol','.eJxVjMEOwiAQRP-FsyGAdst69N5vIMvCStXQpLQn47_bJj3ocea9mbcKtC4lrC3PYUzqqkCdfrtI_Mx1B-lB9T5pnuoyj1Hvij5o08OU8ut2uH8HhVrZ1tGnzptM7C_i2HbYO0kevEXgHpgYBK3ztEVxZ-vQgiEUAUQxzKQ-X-ajN_g:1u2Yxx:PnIaFntyvM3aL_DuMqYhRWo1pALCE5hyauxNLd0_oas','2025-04-23 17:11:57.202544');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `price_at_time` decimal(10,2) NOT NULL,
  `order_id` bigint NOT NULL,
  `variant_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Order_Items_order_id_9d1c65f8_fk_Orders_id` (`order_id`),
  KEY `Order_Items_variant_id_37c8fd60_fk_Product_Variants_id` (`variant_id`),
  CONSTRAINT `Order_Items_order_id_9d1c65f8_fk_Orders_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `Order_Items_variant_id_37c8fd60_fk_Product_Variants_id` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `address_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Orders_address_id_b6e0fa75_fk_Addresses_id` (`address_id`),
  KEY `Orders_user_id_fae80d4a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `Orders_address_id_b6e0fa75_fk_Addresses_id` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  CONSTRAINT `Orders_user_id_fae80d4a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1000000.00,'pending','cash','2025-04-09 13:38:41.990732','2025-04-09 13:38:41.990732',1,5);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) NOT NULL,
  `is_primary` tinyint(1) NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Product_Images_product_id_f0b5d304_fk_Products_id` (`product_id`),
  CONSTRAINT `Product_Images_product_id_f0b5d304_fk_Products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,'images/R.jpg',1,1),(2,'images/A.jpg',1,2),(3,'images/B.jpg',1,3),(4,'images/C.jpg',1,1),(5,'images/C.jpg',1,4),(6,'images/D.jpg',1,5),(7,'images/D.jpg',1,5);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variants`
--

DROP TABLE IF EXISTS `product_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variants` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `color` varchar(50) NOT NULL,
  `size` varchar(50) NOT NULL,
  `additional_price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Product_Variants_product_id_7326878e_fk_Products_id` (`product_id`),
  CONSTRAINT `Product_Variants_product_id_7326878e_fk_Products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variants`
--

LOCK TABLES `product_variants` WRITE;
/*!40000 ALTER TABLE `product_variants` DISABLE KEYS */;
INSERT INTO `product_variants` VALUES (1,'Đỏ Ruby','3g',0.00,50,1),(2,'Đỏ Cam','3g',0.00,50,1),(3,'','50ml',0.00,50,2);
/*!40000 ALTER TABLE `product_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `brand_id` bigint DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Products_brand_id_885ad7a3_fk_Brands_id` (`brand_id`),
  KEY `Products_category_id_448621b5_fk_Categories_id` (`category_id`),
  CONSTRAINT `Products_brand_id_885ad7a3_fk_Brands_id` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `Products_category_id_448621b5_fk_Categories_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Son MAC Ruby Woo','Son MAC Ruby Woo là thỏi son huyền thoại của thương hiệu MAC, được yêu thích bởi màu đỏ cổ điển quyến rũ và chất son lì tuyệt vời. Màu sắc Ruby Woo mang đến vẻ đẹp sang trọng, phù hợp với nhiều tông da và dễ dàng phối hợp với mọi phong cách trang điểm. Với kết cấu Retro Matte, son có độ bám màu cực lâu, không bóng và không gây khô môi, giúp bạn tự tin suốt cả ngày dài mà không lo màu son bị phai. Chất son mịn màng, che phủ hoàn hảo, mang lại cảm giác thoải mái và dễ chịu khi sử dụng. Thiết kế vỏ đen bóng với logo MAC sang trọng càng làm tăng thêm vẻ đẹp tinh tế cho thỏi son này. Đây là lựa chọn lý tưởng cho những ai yêu thích sự quyến rũ và bền lâu trong một thỏi son.',500000.00,100,'2025-04-09 12:28:36.505830','2025-04-12 06:43:22.756055',1,2),(2,'Kem dưỡng Chanel Hydra','Mô Tả Sản Phẩm\r\nBảng phấn mắt Maybelline The Nudes là một trong những bảng màu nổi bật nhất đến từ thương hiệu Maybelline New York. Với 12 tông màu trung tính từ sáng đến tối, sản phẩm giúp bạn dễ dàng tạo nên nhiều phong cách trang điểm khác nhau – từ tự nhiên, nhẹ nhàng đến sắc sảo và quyến rũ.\r\n\r\nTính Năng Nổi Bật\r\n\r\nGồm 12 màu mắt kết hợp giữa nhũ và lì.\r\n\r\nMàu sắc dễ sử dụng, phù hợp nhiều tông da.\r\n\r\nChất phấn mềm mịn, dễ tán, không gây bột.\r\n\r\nGiữ màu lâu, hạn chế lem và trôi.\r\n\r\nThiết kế gọn nhẹ, dễ dàng mang theo bên mình.\r\n\r\nThông Tin Chi Tiết\r\n\r\nThương hiệu: Maybelline New York\r\n\r\nXuất xứ: Mỹ\r\n\r\nTrọng lượng: 9.6g\r\n\r\nLoại da phù hợp: Mọi loại da\r\n\r\nHạn sử dụng: 3 năm kể từ ngày sản xuất',1500000.00,50,'2025-04-09 12:28:36.508830','2025-04-12 06:38:23.454137',2,4),(3,'Phấn mắt Maybelline Nudes','Mô Tả Sản Phẩm\r\nBảng phấn mắt Maybelline The Nudes là một trong những bảng màu nổi bật nhất đến từ thương hiệu Maybelline New York. Với 12 tông màu trung tính từ sáng đến tối, sản phẩm giúp bạn dễ dàng tạo nên nhiều phong cách trang điểm khác nhau – từ tự nhiên, nhẹ nhàng đến sắc sảo và quyến rũ.\r\n\r\nTính Năng Nổi Bật\r\n\r\nGồm 12 màu mắt kết hợp giữa nhũ và lì.\r\n\r\nMàu sắc dễ sử dụng, phù hợp nhiều tông da.\r\n\r\nChất phấn mềm mịn, dễ tán, không gây bột.\r\n\r\nGiữ màu lâu, hạn chế lem và trôi.\r\n\r\nThiết kế gọn nhẹ, dễ dàng mang theo bên mình.\r\n\r\nThông Tin Chi Tiết\r\n\r\nThương hiệu: Maybelline New York\r\n\r\nXuất xứ: Mỹ\r\n\r\nTrọng lượng: 9.6g\r\n\r\nLoại da phù hợp: Mọi loại da\r\n\r\nHạn sử dụng: 3 năm kể từ ngày sản xuất',300000.00,80,'2025-04-09 12:28:36.511828','2025-04-12 06:38:56.557519',3,5),(4,'Son Moi Xin','Son môi lì ABC với màu đỏ ruby quyến rũ mang đến vẻ ngoài lộng lẫy và sang trọng cho mọi cô gái. Được chiết xuất từ bơ shea và dầu jojoba, sản phẩm không chỉ giúp tô điểm cho đôi môi mà còn dưỡng ẩm, giữ cho môi luôn mềm mại, mịn màng suốt cả ngày dài. Chất son lì mịn màng, không bị vón cục, giúp màu lên chuẩn ngay từ lần thoa đầu tiên và không bị trôi hay phai màu, cho bạn tự tin trong mọi hoạt động.\r\n\r\nĐặc điểm nổi bật:\r\n\r\nMàu sắc: Đỏ ruby – sắc đỏ quyến rũ, dễ dàng kết hợp với nhiều phong cách trang điểm.\r\n\r\nChất son: Lì mịn, lâu trôi, không bóng nhờ dưỡng chất giúp duy trì màu lâu dài.\r\n\r\nThành phần: Chứa bơ shea và dầu jojoba giúp dưỡng ẩm, ngăn ngừa tình trạng khô môi.\r\n\r\nDung tích: 4g, phù hợp để mang theo trong túi xách mọi lúc mọi nơi.\r\n\r\nGiá: 250.000 VND.\r\n\r\nSon môi ABC không chỉ mang đến màu sắc đẹp mắt mà còn bảo vệ và nuôi dưỡng đôi môi, là lựa chọn hoàn hảo cho các cô nàng yêu thích sự tiện dụng và sang trọng.',40000.00,6,'2025-04-11 08:34:16.910513','2025-04-12 06:41:24.731876',NULL,NULL),(5,'Sữa rửa mặt Carave','Sữa rửa mặt CeraVe là dòng sản phẩm chăm sóc da nổi bật đến từ thương hiệu dược mỹ phẩm của Mỹ, được phát triển cùng các bác sĩ da liễu. Với công thức dịu nhẹ, không chứa xà phòng, không hương liệu và không gây kích ứng, CeraVe giúp làm sạch sâu bụi bẩn, dầu thừa mà vẫn duy trì độ ẩm tự nhiên cho da. Nhờ sự kết hợp của 3 loại ceramide thiết yếu cùng công nghệ MVE độc quyền, sản phẩm hỗ trợ phục hồi hàng rào bảo vệ da, mang lại làn da mềm mại, khỏe mạnh và tươi sáng. Sữa rửa mặt CeraVe phù hợp với nhiều loại da, đặc biệt là da nhạy cảm, da dầu mụn hoặc da khô.',100000.00,50,'2025-04-12 05:38:32.085433','2025-04-12 06:40:12.037375',NULL,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `added_at` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Wishlist_product_id_d16bd92c_fk_Products_id` (`product_id`),
  KEY `Wishlist_user_id_932dfbf2_fk_auth_user_id` (`user_id`),
  CONSTRAINT `Wishlist_product_id_d16bd92c_fk_Products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `Wishlist_user_id_932dfbf2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1,'2025-04-09 13:23:03.942281',1,5);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cosmetic_db'
--

--
-- Dumping routines for database 'cosmetic_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-12 15:32:46
