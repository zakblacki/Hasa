-- MySQL dump 10.13  Distrib 8.1.0, for macos14.0 (arm64)
--
-- Host: localhost    Database: hasa
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'ib7t0tD5n0Nsc8YMC72MJBg9vMbmcOcM',1,'2024-01-31 02:40:48','2024-01-31 02:40:48','2024-01-31 02:40:48'),(2,2,'WB2k5gV9RZJI3Usl2FlEjf7cBzqH2uq7',1,'2024-01-31 02:40:49','2024-01-31 02:40:49','2024-01-31 02:40:49');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Ecommerce',0,'Reprehenderit quo rerum repellat ut qui repudiandae. Natus consequatur iste non voluptatum saepe. Harum nisi nobis aut repudiandae quisquam deserunt ut.','published',2,'Botble\\ACL\\Models\\User',NULL,0,0,1,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(2,'Fashion',0,'Veniam consequatur qui inventore laboriosam. Fugit est sequi aut qui enim. Laboriosam et repellat est tenetur necessitatibus.','published',2,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(3,'Electronic',0,'Hic ea est quia dolores est. Eos iure tempora magnam omnis. Non ut non labore. Voluptatem alias sit nemo maxime expedita.','published',2,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(4,'Commercial',0,'Expedita maxime perspiciatis quo facere quisquam blanditiis deleniti. Voluptates voluptatem velit quia corrupti dolorum reprehenderit aut. Delectus architecto at ducimus at qui quae quae.','published',2,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-01-31 02:40:49','2024-01-31 02:40:49');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint unsigned DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cities_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_translations`
--

DROP TABLE IF EXISTS `cities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`cities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_translations`
--

LOCK TABLES `cities_translations` WRITE;
/*!40000 ALTER TABLE `cities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_translations`
--

DROP TABLE IF EXISTS `countries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_translations`
--

LOCK TABLES `countries_translations` WRITE;
/*!40000 ALTER TABLE `countries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_brands`
--

DROP TABLE IF EXISTS `ec_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands`
--

LOCK TABLES `ec_brands` WRITE;
/*!40000 ALTER TABLE `ec_brands` DISABLE KEYS */;
INSERT INTO `ec_brands` VALUES (1,'Fashion live',NULL,NULL,'brands/1.png','published',0,1,'2024-01-31 02:40:38','2024-01-31 02:40:38'),(2,'Hand crafted',NULL,NULL,'brands/2.png','published',1,1,'2024-01-31 02:40:38','2024-01-31 02:40:38'),(3,'Mestonix',NULL,NULL,'brands/3.png','published',2,1,'2024-01-31 02:40:38','2024-01-31 02:40:38'),(4,'Sunshine',NULL,NULL,'brands/4.png','published',3,1,'2024-01-31 02:40:38','2024-01-31 02:40:38'),(5,'Pure',NULL,NULL,'brands/5.png','published',4,1,'2024-01-31 02:40:38','2024-01-31 02:40:38'),(6,'Anfold',NULL,NULL,'brands/6.png','published',5,1,'2024-01-31 02:40:38','2024-01-31 02:40:38'),(7,'Automotive',NULL,NULL,'brands/7.png','published',6,1,'2024-01-31 02:40:38','2024-01-31 02:40:38');
/*!40000 ALTER TABLE `ec_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_brands_translations`
--

DROP TABLE IF EXISTS `ec_brands_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_brands_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_brands_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_brands_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands_translations`
--

LOCK TABLES `ec_brands_translations` WRITE;
/*!40000 ALTER TABLE `ec_brands_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_brands_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_cart`
--

DROP TABLE IF EXISTS `ec_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_cart` (
  `identifier` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`identifier`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_cart`
--

LOCK TABLES `ec_cart` WRITE;
/*!40000 ALTER TABLE `ec_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_currencies`
--

DROP TABLE IF EXISTS `ec_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned DEFAULT '0',
  `order` int unsigned DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_currencies`
--

LOCK TABLES `ec_currencies` WRITE;
/*!40000 ALTER TABLE `ec_currencies` DISABLE KEYS */;
INSERT INTO `ec_currencies` VALUES (1,'USD','$',1,2,0,1,1,'2024-01-31 02:40:38','2024-01-31 02:40:38'),(2,'EUR','€',0,2,1,0,0.84,'2024-01-31 02:40:38','2024-01-31 02:40:38'),(3,'VND','₫',0,0,2,0,23203,'2024-01-31 02:40:38','2024-01-31 02:40:38'),(4,'NGN','₦',1,2,2,0,895.52,'2024-01-31 02:40:38','2024-01-31 02:40:38');
/*!40000 ALTER TABLE `ec_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_addresses`
--

DROP TABLE IF EXISTS `ec_customer_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint unsigned NOT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_addresses`
--

LOCK TABLES `ec_customer_addresses` WRITE;
/*!40000 ALTER TABLE `ec_customer_addresses` DISABLE KEYS */;
INSERT INTO `ec_customer_addresses` VALUES (1,'Ceasar Rempel','customer@botble.com','+17377716926','DO','Alabama','Kayleefurt','43306 Bartell Skyway',1,1,'2024-01-31 02:40:42','2024-01-31 02:40:42','87283-4412'),(2,'Ceasar Rempel','customer@botble.com','+19162548625','VE','Rhode Island','Ricetown','765 Gina Village Suite 455',1,0,'2024-01-31 02:40:42','2024-01-31 02:40:42','59203-9562'),(3,'Colin Kub','john.smith@botble.com','+13474479491','QA','Mississippi','Bartview','693 Borer Hollow',2,1,'2024-01-31 02:40:42','2024-01-31 02:40:42','08085-2074'),(4,'Colin Kub','john.smith@botble.com','+14808575339','MH','Maine','West Jeremyberg','712 Jack Freeway Apt. 166',2,0,'2024-01-31 02:40:42','2024-01-31 02:40:42','00672'),(5,'Lia Hickle','marina45@example.net','+19127180212','CC','Montana','Port Bettye','8465 Shane Locks Apt. 967',3,1,'2024-01-31 02:40:42','2024-01-31 02:40:42','29328-3023'),(6,'Miss Agustina Dooley IV','mustafa76@example.net','+14088504551','GT','Washington','Eddiemouth','5842 Domenic Stravenue',4,1,'2024-01-31 02:40:42','2024-01-31 02:40:42','24812'),(7,'Lucinda Hills','adella.schimmel@example.org','+15742804463','SJ','North Dakota','East Jarrett','823 Schumm Mountains Apt. 335',5,1,'2024-01-31 02:40:43','2024-01-31 02:40:43','48818'),(8,'Angeline Gerhold','shawn01@example.com','+15866818050','CA','Arkansas','Sporerhaven','94082 Schneider Plaza Suite 231',6,1,'2024-01-31 02:40:43','2024-01-31 02:40:43','01762'),(9,'Juana Pacocha','lmayer@example.net','+18726037252','KG','Pennsylvania','North Cayla','22591 Antwan Vista',7,1,'2024-01-31 02:40:43','2024-01-31 02:40:43','01156-5823'),(10,'Alberto Heller DVM','flueilwitz@example.org','+12017007315','PL','Montana','Port Ottofurt','17722 Wisozk Roads Suite 861',8,1,'2024-01-31 02:40:43','2024-01-31 02:40:43','74302-0170'),(11,'Jaylin Thompson','talon.fisher@example.org','+15317903359','KH','Montana','Kulasbury','7841 Maymie Turnpike',9,1,'2024-01-31 02:40:44','2024-01-31 02:40:44','91209-6279'),(12,'Dr. Herminia Lindgren','kianna91@example.net','+19497946448','PN','Wisconsin','Itzelchester','98479 Cartwright Pass Suite 259',10,1,'2024-01-31 02:40:44','2024-01-31 02:40:44','86237');
/*!40000 ALTER TABLE `ec_customer_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_password_resets`
--

DROP TABLE IF EXISTS `ec_customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `ec_customer_password_resets_email_index` (`email`),
  KEY `ec_customer_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_password_resets`
--

LOCK TABLES `ec_customer_password_resets` WRITE;
/*!40000 ALTER TABLE `ec_customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_recently_viewed_products`
--

DROP TABLE IF EXISTS `ec_customer_recently_viewed_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_recently_viewed_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_recently_viewed_products`
--

LOCK TABLES `ec_customer_recently_viewed_products` WRITE;
/*!40000 ALTER TABLE `ec_customer_recently_viewed_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_recently_viewed_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_used_coupons`
--

DROP TABLE IF EXISTS `ec_customer_used_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_used_coupons` (
  `discount_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_used_coupons`
--

LOCK TABLES `ec_customer_used_coupons` WRITE;
/*!40000 ALTER TABLE `ec_customer_used_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_used_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customers`
--

DROP TABLE IF EXISTS `ec_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activated',
  `private_notes` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_customers_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customers`
--

LOCK TABLES `ec_customers` WRITE;
/*!40000 ALTER TABLE `ec_customers` DISABLE KEYS */;
INSERT INTO `ec_customers` VALUES (1,'Ceasar Rempel','customer@botble.com','$2y$12$oEQHN1A4WFWVrJzs0X1okO65.boG/TZcag7yZ.xlYRSwqbD8xIR4u','customers/2.jpg','1996-01-12','+13642399407',NULL,'2024-01-31 02:40:42','2024-01-31 02:40:42','2024-01-31 09:40:42',NULL,'activated',NULL),(2,'Colin Kub','john.smith@botble.com','$2y$12$Us0zs0XmmLYIugNpQN2Tfelw2AkhfK2d/gNXJgGqHr0yQjmHtQr26','customers/4.jpg','1975-01-24','+15519169422',NULL,'2024-01-31 02:40:42','2024-01-31 02:40:42','2024-01-31 09:40:42',NULL,'activated',NULL),(3,'Lia Hickle','marina45@example.net','$2y$12$l0uEEhqCmvep9pUCZ1p9m.TLZTAgVognBs2JwXGe4GcdOGq78HHyO','customers/1.jpg','1995-01-04','+17024075560',NULL,'2024-01-31 02:40:42','2024-01-31 02:40:42','2024-01-31 09:40:42',NULL,'activated',NULL),(4,'Miss Agustina Dooley IV','mustafa76@example.net','$2y$12$BKsnvSPHA10Glz9pWJ2nBu96osgF.glzgMH.E2Wz0Khuufl7I/fjC','customers/2.jpg','1998-01-04','+16238708896',NULL,'2024-01-31 02:40:42','2024-01-31 02:40:42','2024-01-31 09:40:42',NULL,'activated',NULL),(5,'Lucinda Hills','adella.schimmel@example.org','$2y$12$UQI9QFAo99IcB/Qyn0X7aOHyGfeOJQ1ZyIDnUM4XjJGpvjoNBWlcy','customers/3.jpg','2000-01-15','+18136102662',NULL,'2024-01-31 02:40:43','2024-01-31 02:40:43','2024-01-31 09:40:43',NULL,'activated',NULL),(6,'Angeline Gerhold','shawn01@example.com','$2y$12$5QcAUHuTxcwC2J0gWgVHmOzbwR5jxZ62eUtoc5dFvXUefuEoc6alG','customers/4.jpg','1975-01-10','+17158167917',NULL,'2024-01-31 02:40:43','2024-01-31 02:40:43','2024-01-31 09:40:43',NULL,'activated',NULL),(7,'Juana Pacocha','lmayer@example.net','$2y$12$hQDu2eUwLLlHd/pdoOkUjOS6THSqJOphL0bg6IJ8YKZOGQwldyjOi','customers/5.jpg','1990-01-06','+17437533228',NULL,'2024-01-31 02:40:43','2024-01-31 02:40:43','2024-01-31 09:40:43',NULL,'activated',NULL),(8,'Alberto Heller DVM','flueilwitz@example.org','$2y$12$jFIQRRc8Ef.5f4ef4gt/au0c1Hf5bNFUSGI0i7c4i4ZTPhGs2CPKG','customers/6.jpg','1977-01-18','+16628227680',NULL,'2024-01-31 02:40:43','2024-01-31 02:40:43','2024-01-31 09:40:43',NULL,'activated',NULL),(9,'Jaylin Thompson','talon.fisher@example.org','$2y$12$oYIDAPxJUXZHZOqNHisOx.NFOK9oYGRWz2km8RaKP/uV7KYbyuwKW','customers/7.jpg','1990-01-02','+14459714512',NULL,'2024-01-31 02:40:44','2024-01-31 02:40:44','2024-01-31 09:40:44',NULL,'activated',NULL),(10,'Dr. Herminia Lindgren','kianna91@example.net','$2y$12$f06VURI9Fu8Fe4zfrWhQje69NMXuyDJAzPygaaYNM/ZASNpns/o.G','customers/8.jpg','1977-01-12','+18106139154',NULL,'2024-01-31 02:40:44','2024-01-31 02:40:44','2024-01-31 09:40:44',NULL,'activated',NULL);
/*!40000 ALTER TABLE `ec_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_customers`
--

DROP TABLE IF EXISTS `ec_discount_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_customers` (
  `discount_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_customers`
--

LOCK TABLES `ec_discount_customers` WRITE;
/*!40000 ALTER TABLE `ec_discount_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_product_categories`
--

DROP TABLE IF EXISTS `ec_discount_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_product_categories` (
  `discount_id` bigint unsigned NOT NULL,
  `product_category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_product_categories`
--

LOCK TABLES `ec_discount_product_categories` WRITE;
/*!40000 ALTER TABLE `ec_discount_product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_product_collections`
--

DROP TABLE IF EXISTS `ec_discount_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_product_collections` (
  `discount_id` bigint unsigned NOT NULL,
  `product_collection_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_product_collections`
--

LOCK TABLES `ec_discount_product_collections` WRITE;
/*!40000 ALTER TABLE `ec_discount_product_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_products`
--

DROP TABLE IF EXISTS `ec_discount_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_products` (
  `discount_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_products`
--

LOCK TABLES `ec_discount_products` WRITE;
/*!40000 ALTER TABLE `ec_discount_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discounts`
--

DROP TABLE IF EXISTS `ec_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `total_used` int unsigned NOT NULL DEFAULT '0',
  `value` double DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'coupon',
  `can_use_with_promotion` tinyint(1) NOT NULL DEFAULT '0',
  `discount_on` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int unsigned DEFAULT NULL,
  `type_option` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `target` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all-orders',
  `min_order_price` decimal(15,2) DEFAULT NULL,
  `apply_via_url` tinyint(1) NOT NULL DEFAULT '0',
  `display_at_checkout` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_discounts_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discounts`
--

LOCK TABLES `ec_discounts` WRITE;
/*!40000 ALTER TABLE `ec_discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sale_products`
--

DROP TABLE IF EXISTS `ec_flash_sale_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sale_products` (
  `flash_sale_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `price` double unsigned DEFAULT NULL,
  `quantity` int unsigned DEFAULT NULL,
  `sold` int unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sale_products`
--

LOCK TABLES `ec_flash_sale_products` WRITE;
/*!40000 ALTER TABLE `ec_flash_sale_products` DISABLE KEYS */;
INSERT INTO `ec_flash_sale_products` VALUES (1,7,40.29,12,3),(2,6,30.1,16,3);
/*!40000 ALTER TABLE `ec_flash_sale_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sales`
--

DROP TABLE IF EXISTS `ec_flash_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` datetime NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sales`
--

LOCK TABLES `ec_flash_sales` WRITE;
/*!40000 ALTER TABLE `ec_flash_sales` DISABLE KEYS */;
INSERT INTO `ec_flash_sales` VALUES (1,'Deal of the Day.','2024-03-13 00:00:00','published','2024-01-31 02:40:48','2024-01-31 02:40:48'),(2,'Gadgets &amp; Accessories','2024-03-01 00:00:00','published','2024-01-31 02:40:48','2024-01-31 02:40:48');
/*!40000 ALTER TABLE `ec_flash_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sales_translations`
--

DROP TABLE IF EXISTS `ec_flash_sales_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sales_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_flash_sales_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_flash_sales_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sales_translations`
--

LOCK TABLES `ec_flash_sales_translations` WRITE;
/*!40000 ALTER TABLE `ec_flash_sales_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_flash_sales_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_option_value`
--

DROP TABLE IF EXISTS `ec_global_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_option_value` (
  `option_id` bigint unsigned NOT NULL COMMENT 'option id',
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `option_value` tinytext COLLATE utf8mb4_unicode_ci COMMENT 'option value',
  `affect_price` double DEFAULT NULL COMMENT 'value of price of this option affect',
  `order` int NOT NULL DEFAULT '9999',
  `affect_type` tinyint NOT NULL DEFAULT '0' COMMENT '0. fixed 1. percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_option_value`
--

LOCK TABLES `ec_global_option_value` WRITE;
/*!40000 ALTER TABLE `ec_global_option_value` DISABLE KEYS */;
INSERT INTO `ec_global_option_value` VALUES (1,1,'1 Year',0,9999,0,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(1,2,'2 Year',10,9999,0,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(1,3,'3 Year',20,9999,0,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(2,4,'4GB',0,9999,0,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(2,5,'8GB',10,9999,0,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(2,6,'16GB',20,9999,0,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(3,7,'Core i5',0,9999,0,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(3,8,'Core i7',10,9999,0,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(3,9,'Core i9',20,9999,0,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(4,10,'128GB',0,9999,0,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(4,11,'256GB',10,9999,0,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(4,12,'512GB',20,9999,0,'2024-01-31 02:40:49','2024-01-31 02:40:49');
/*!40000 ALTER TABLE `ec_global_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_option_value_translations`
--

DROP TABLE IF EXISTS `ec_global_option_value_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_option_value_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_global_option_value_id` bigint unsigned NOT NULL,
  `option_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_global_option_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_option_value_translations`
--

LOCK TABLES `ec_global_option_value_translations` WRITE;
/*!40000 ALTER TABLE `ec_global_option_value_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_global_option_value_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_options`
--

DROP TABLE IF EXISTS `ec_global_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of options',
  `option_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'option type',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Checked if this option is required',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_options`
--

LOCK TABLES `ec_global_options` WRITE;
/*!40000 ALTER TABLE `ec_global_options` DISABLE KEYS */;
INSERT INTO `ec_global_options` VALUES (1,'Warranty','Botble\\Ecommerce\\Option\\OptionType\\RadioButton',1,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(2,'RAM','Botble\\Ecommerce\\Option\\OptionType\\RadioButton',1,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(3,'CPU','Botble\\Ecommerce\\Option\\OptionType\\RadioButton',1,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(4,'HDD','Botble\\Ecommerce\\Option\\OptionType\\Dropdown',0,'2024-01-31 02:40:49','2024-01-31 02:40:49');
/*!40000 ALTER TABLE `ec_global_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_options_translations`
--

DROP TABLE IF EXISTS `ec_global_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_options_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_global_options_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_global_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_options_translations`
--

LOCK TABLES `ec_global_options_translations` WRITE;
/*!40000 ALTER TABLE `ec_global_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_global_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_grouped_products`
--

DROP TABLE IF EXISTS `ec_grouped_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_grouped_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_product_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `fixed_qty` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_grouped_products`
--

LOCK TABLES `ec_grouped_products` WRITE;
/*!40000 ALTER TABLE `ec_grouped_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_grouped_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_invoice_items`
--

DROP TABLE IF EXISTS `ec_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int unsigned NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_invoice_items_reference_type_reference_id_index` (`reference_type`,`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_invoice_items`
--

LOCK TABLES `ec_invoice_items` WRITE;
/*!40000 ALTER TABLE `ec_invoice_items` DISABLE KEYS */;
INSERT INTO `ec_invoice_items` VALUES (1,1,'Botble\\Ecommerce\\Models\\Product',11,'Clutch handmade',NULL,'products/2.jpg',1,461.00,461.00,0.00,0.00,461.00,'{\"sku\":\"HS-130-A0\",\"attributes\":\"(Size: L, Color: Black)\"}','2024-01-31 02:40:44','2024-01-31 02:40:44'),(2,1,'Botble\\Ecommerce\\Models\\Product',26,'The Marc Jacobs',NULL,'products/7.jpg',3,51.00,153.00,0.00,0.00,153.00,'{\"sku\":\"HS-138-A0\",\"attributes\":\"(Size: XL, Color: Brown)\"}','2024-01-31 02:40:44','2024-01-31 02:40:44'),(3,1,'Botble\\Ecommerce\\Models\\Product',28,'The Marc Jacobs',NULL,'products/7-2.jpg',1,51.00,51.00,0.00,0.00,51.00,'{\"sku\":\"HS-138-A0-A2\",\"attributes\":\"(Size: S, Color: Red)\"}','2024-01-31 02:40:44','2024-01-31 02:40:44'),(4,2,'Botble\\Ecommerce\\Models\\Product',15,'Gucci Zip Around Wallet',NULL,'products/3-1.jpg',1,202.00,202.00,0.00,0.00,202.00,'{\"sku\":\"HS-153-A0-A1\",\"attributes\":\"(Size: S, Color: Red)\"}','2024-01-31 02:40:44','2024-01-31 02:40:44'),(5,2,'Botble\\Ecommerce\\Models\\Product',18,'Snapshot Standard',NULL,'products/4-1.jpg',3,243.00,729.00,0.00,0.00,729.00,'{\"sku\":\"HS-152-A0-A1\",\"attributes\":\"(Color: Red, Size: L)\"}','2024-01-31 02:40:44','2024-01-31 02:40:44'),(6,2,'Botble\\Ecommerce\\Models\\Product',20,'Joan Mini Camera Bag',NULL,'products/5.jpg',1,89.00,89.00,0.00,0.00,89.00,'{\"sku\":\"HS-157-A0\",\"attributes\":\"(Color: Black, Size: XL)\"}','2024-01-31 02:40:44','2024-01-31 02:40:44'),(7,3,'Botble\\Ecommerce\\Models\\Product',20,'Joan Mini Camera Bag',NULL,'products/5.jpg',3,89.00,267.00,0.00,0.00,267.00,'{\"sku\":\"HS-157-A0\",\"attributes\":\"(Color: Black, Size: XL)\"}','2024-01-31 02:40:44','2024-01-31 02:40:44'),(8,3,'Botble\\Ecommerce\\Models\\Product',22,'Cyan Boheme',NULL,'products/6.jpg',3,43.00,129.00,0.00,0.00,129.00,'{\"sku\":\"HS-118-A0\",\"attributes\":\"(Color: Blue, Size: XXL)\"}','2024-01-31 02:40:44','2024-01-31 02:40:44'),(9,4,'Botble\\Ecommerce\\Models\\Product',16,'Gucci Zip Around Wallet',NULL,'products/3-2.jpg',3,202.00,606.00,0.00,0.00,606.00,'{\"sku\":\"HS-153-A0-A2\",\"attributes\":\"(Color: Red, Size: XL)\"}','2024-01-31 02:40:45','2024-01-31 02:40:45'),(10,4,'Botble\\Ecommerce\\Models\\Product',25,'Cyan Boheme',NULL,'products/6.jpg',3,43.00,129.00,0.00,0.00,129.00,'{\"sku\":\"HS-118-A0-A3\",\"attributes\":\"(Color: Green, Size: XL)\"}','2024-01-31 02:40:45','2024-01-31 02:40:45'),(11,4,'Botble\\Ecommerce\\Models\\Product',27,'The Marc Jacobs',NULL,'products/7-1.jpg',3,51.00,153.00,0.00,0.00,153.00,'{\"sku\":\"HS-138-A0-A1\",\"attributes\":\"(Color: Green, Size: XL)\"}','2024-01-31 02:40:45','2024-01-31 02:40:45'),(12,5,'Botble\\Ecommerce\\Models\\Product',18,'Snapshot Standard',NULL,'products/4-1.jpg',3,243.00,729.00,0.00,0.00,729.00,'{\"sku\":\"HS-152-A0-A1\",\"attributes\":\"(Color: Red, Size: L)\"}','2024-01-31 02:40:45','2024-01-31 02:40:45'),(13,5,'Botble\\Ecommerce\\Models\\Product',26,'The Marc Jacobs',NULL,'products/7.jpg',2,51.00,102.00,0.00,0.00,102.00,'{\"sku\":\"HS-138-A0\",\"attributes\":\"(Size: XL, Color: Brown)\"}','2024-01-31 02:40:45','2024-01-31 02:40:45'),(14,6,'Botble\\Ecommerce\\Models\\Product',21,'Joan Mini Camera Bag',NULL,'products/5-1.jpg',3,89.00,267.00,0.00,0.00,267.00,'{\"sku\":\"HS-157-A0-A1\",\"attributes\":\"(Color: Green, Size: S)\"}','2024-01-31 02:40:45','2024-01-31 02:40:45'),(15,6,'Botble\\Ecommerce\\Models\\Product',30,'Round Cross body Bag',NULL,'products/8.jpg',2,121.00,242.00,0.00,0.00,242.00,'{\"sku\":\"HS-175-A0-A1\",\"attributes\":\"(Color: Green, Size: M)\"}','2024-01-31 02:40:45','2024-01-31 02:40:45'),(16,7,'Botble\\Ecommerce\\Models\\Product',10,'Wallet handmade',NULL,'products/1-1.jpg',2,285.00,570.00,0.00,0.00,570.00,'{\"sku\":\"HS-199-A0-A1\",\"attributes\":\"(Color: Green, Size: S)\"}','2024-01-31 02:40:45','2024-01-31 02:40:45'),(17,7,'Botble\\Ecommerce\\Models\\Product',19,'Snapshot Standard',NULL,'products/4-2.jpg',3,243.00,729.00,0.00,0.00,729.00,'{\"sku\":\"HS-152-A0-A2\",\"attributes\":\"(Size: S, Color: Brown)\"}','2024-01-31 02:40:45','2024-01-31 02:40:45'),(18,7,'Botble\\Ecommerce\\Models\\Product',23,'Cyan Boheme',NULL,'products/6-1.jpg',2,43.00,86.00,0.00,0.00,86.00,'{\"sku\":\"HS-118-A0-A1\",\"attributes\":\"(Size: XL, Color: Brown)\"}','2024-01-31 02:40:45','2024-01-31 02:40:45'),(19,7,'Botble\\Ecommerce\\Models\\Product',27,'The Marc Jacobs',NULL,'products/7-1.jpg',1,51.00,51.00,0.00,0.00,51.00,'{\"sku\":\"HS-138-A0-A1\",\"attributes\":\"(Color: Green, Size: XL)\"}','2024-01-31 02:40:45','2024-01-31 02:40:45'),(20,8,'Botble\\Ecommerce\\Models\\Product',13,'Clutch handmade',NULL,'products/2-2.jpg',2,461.00,922.00,0.00,0.00,922.00,'{\"sku\":\"HS-130-A0-A2\",\"attributes\":\"(Color: Green, Size: XXL)\"}','2024-01-31 02:40:45','2024-01-31 02:40:45'),(21,8,'Botble\\Ecommerce\\Models\\Product',17,'Snapshot Standard',NULL,'products/4.jpg',1,243.00,243.00,0.00,0.00,243.00,'{\"sku\":\"HS-152-A0\",\"attributes\":\"(Color: Green, Size: S)\"}','2024-01-31 02:40:45','2024-01-31 02:40:45'),(22,8,'Botble\\Ecommerce\\Models\\Product',19,'Snapshot Standard',NULL,'products/4-2.jpg',1,243.00,243.00,0.00,0.00,243.00,'{\"sku\":\"HS-152-A0-A2\",\"attributes\":\"(Size: S, Color: Brown)\"}','2024-01-31 02:40:45','2024-01-31 02:40:45'),(23,8,'Botble\\Ecommerce\\Models\\Product',30,'Round Cross body Bag',NULL,'products/8.jpg',3,121.00,363.00,0.00,0.00,363.00,'{\"sku\":\"HS-175-A0-A1\",\"attributes\":\"(Color: Green, Size: M)\"}','2024-01-31 02:40:45','2024-01-31 02:40:45'),(24,9,'Botble\\Ecommerce\\Models\\Product',20,'Joan Mini Camera Bag',NULL,'products/5.jpg',2,89.00,178.00,0.00,0.00,178.00,'{\"sku\":\"HS-157-A0\",\"attributes\":\"(Color: Black, Size: XL)\"}','2024-01-31 02:40:46','2024-01-31 02:40:46'),(25,9,'Botble\\Ecommerce\\Models\\Product',24,'Cyan Boheme',NULL,'products/6.jpg',2,43.00,86.00,0.00,0.00,86.00,'{\"sku\":\"HS-118-A0-A2\",\"attributes\":\"(Size: S, Color: Black)\"}','2024-01-31 02:40:46','2024-01-31 02:40:46'),(26,10,'Botble\\Ecommerce\\Models\\Product',9,'Wallet handmade',NULL,'products/1.jpg',1,285.00,285.00,0.00,0.00,285.00,'{\"sku\":\"HS-199-A0\",\"attributes\":\"(Color: Black, Size: XXL)\"}','2024-01-31 02:40:46','2024-01-31 02:40:46'),(27,10,'Botble\\Ecommerce\\Models\\Product',27,'The Marc Jacobs',NULL,'products/7-1.jpg',1,51.00,51.00,0.00,0.00,51.00,'{\"sku\":\"HS-138-A0-A1\",\"attributes\":\"(Color: Green, Size: XL)\"}','2024-01-31 02:40:46','2024-01-31 02:40:46'),(28,11,'Botble\\Ecommerce\\Models\\Product',12,'Clutch handmade',NULL,'products/2-1.jpg',1,461.00,461.00,0.00,0.00,461.00,'{\"sku\":\"HS-130-A0-A1\",\"attributes\":\"(Color: Green, Size: L)\"}','2024-01-31 02:40:46','2024-01-31 02:40:46'),(29,11,'Botble\\Ecommerce\\Models\\Product',19,'Snapshot Standard',NULL,'products/4-2.jpg',1,243.00,243.00,0.00,0.00,243.00,'{\"sku\":\"HS-152-A0-A2\",\"attributes\":\"(Size: S, Color: Brown)\"}','2024-01-31 02:40:46','2024-01-31 02:40:46'),(30,11,'Botble\\Ecommerce\\Models\\Product',26,'The Marc Jacobs',NULL,'products/7.jpg',3,51.00,153.00,0.00,0.00,153.00,'{\"sku\":\"HS-138-A0\",\"attributes\":\"(Size: XL, Color: Brown)\"}','2024-01-31 02:40:46','2024-01-31 02:40:46'),(31,12,'Botble\\Ecommerce\\Models\\Product',12,'Clutch handmade',NULL,'products/2-1.jpg',2,461.00,922.00,0.00,0.00,922.00,'{\"sku\":\"HS-130-A0-A1\",\"attributes\":\"(Color: Green, Size: L)\"}','2024-01-31 02:40:46','2024-01-31 02:40:46'),(32,12,'Botble\\Ecommerce\\Models\\Product',13,'Clutch handmade',NULL,'products/2-2.jpg',2,461.00,922.00,0.00,0.00,922.00,'{\"sku\":\"HS-130-A0-A2\",\"attributes\":\"(Color: Green, Size: XXL)\"}','2024-01-31 02:40:46','2024-01-31 02:40:46'),(33,13,'Botble\\Ecommerce\\Models\\Product',13,'Clutch handmade',NULL,'products/2-2.jpg',1,461.00,461.00,0.00,0.00,461.00,'{\"sku\":\"HS-130-A0-A2\",\"attributes\":\"(Color: Green, Size: XXL)\"}','2024-01-31 02:40:46','2024-01-31 02:40:46'),(34,13,'Botble\\Ecommerce\\Models\\Product',21,'Joan Mini Camera Bag',NULL,'products/5-1.jpg',3,89.00,267.00,0.00,0.00,267.00,'{\"sku\":\"HS-157-A0-A1\",\"attributes\":\"(Color: Green, Size: S)\"}','2024-01-31 02:40:46','2024-01-31 02:40:46'),(35,13,'Botble\\Ecommerce\\Models\\Product',28,'The Marc Jacobs',NULL,'products/7-2.jpg',2,51.00,102.00,0.00,0.00,102.00,'{\"sku\":\"HS-138-A0-A2\",\"attributes\":\"(Size: S, Color: Red)\"}','2024-01-31 02:40:46','2024-01-31 02:40:46'),(36,14,'Botble\\Ecommerce\\Models\\Product',16,'Gucci Zip Around Wallet',NULL,'products/3-2.jpg',2,202.00,404.00,0.00,0.00,404.00,'{\"sku\":\"HS-153-A0-A2\",\"attributes\":\"(Color: Red, Size: XL)\"}','2024-01-31 02:40:46','2024-01-31 02:40:46'),(37,14,'Botble\\Ecommerce\\Models\\Product',20,'Joan Mini Camera Bag',NULL,'products/5.jpg',2,89.00,178.00,0.00,0.00,178.00,'{\"sku\":\"HS-157-A0\",\"attributes\":\"(Color: Black, Size: XL)\"}','2024-01-31 02:40:46','2024-01-31 02:40:46'),(38,14,'Botble\\Ecommerce\\Models\\Product',22,'Cyan Boheme',NULL,'products/6.jpg',1,43.00,43.00,0.00,0.00,43.00,'{\"sku\":\"HS-118-A0\",\"attributes\":\"(Color: Blue, Size: XXL)\"}','2024-01-31 02:40:46','2024-01-31 02:40:46'),(39,15,'Botble\\Ecommerce\\Models\\Product',15,'Gucci Zip Around Wallet',NULL,'products/3-1.jpg',3,202.00,606.00,0.00,0.00,606.00,'{\"sku\":\"HS-153-A0-A1\",\"attributes\":\"(Size: S, Color: Red)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47'),(40,15,'Botble\\Ecommerce\\Models\\Product',16,'Gucci Zip Around Wallet',NULL,'products/3-2.jpg',2,202.00,404.00,0.00,0.00,404.00,'{\"sku\":\"HS-153-A0-A2\",\"attributes\":\"(Color: Red, Size: XL)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47'),(41,15,'Botble\\Ecommerce\\Models\\Product',25,'Cyan Boheme',NULL,'products/6.jpg',3,43.00,129.00,0.00,0.00,129.00,'{\"sku\":\"HS-118-A0-A3\",\"attributes\":\"(Color: Green, Size: XL)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47'),(42,15,'Botble\\Ecommerce\\Models\\Product',27,'The Marc Jacobs',NULL,'products/7-1.jpg',3,51.00,153.00,0.00,0.00,153.00,'{\"sku\":\"HS-138-A0-A1\",\"attributes\":\"(Color: Green, Size: XL)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47'),(43,16,'Botble\\Ecommerce\\Models\\Product',10,'Wallet handmade',NULL,'products/1-1.jpg',3,285.00,855.00,0.00,0.00,855.00,'{\"sku\":\"HS-199-A0-A1\",\"attributes\":\"(Color: Green, Size: S)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47'),(44,16,'Botble\\Ecommerce\\Models\\Product',22,'Cyan Boheme',NULL,'products/6.jpg',1,43.00,43.00,0.00,0.00,43.00,'{\"sku\":\"HS-118-A0\",\"attributes\":\"(Color: Blue, Size: XXL)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47'),(45,16,'Botble\\Ecommerce\\Models\\Product',30,'Round Cross body Bag',NULL,'products/8.jpg',3,121.00,363.00,0.00,0.00,363.00,'{\"sku\":\"HS-175-A0-A1\",\"attributes\":\"(Color: Green, Size: M)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47'),(46,17,'Botble\\Ecommerce\\Models\\Product',15,'Gucci Zip Around Wallet',NULL,'products/3-1.jpg',3,202.00,606.00,0.00,0.00,606.00,'{\"sku\":\"HS-153-A0-A1\",\"attributes\":\"(Size: S, Color: Red)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47'),(47,17,'Botble\\Ecommerce\\Models\\Product',20,'Joan Mini Camera Bag',NULL,'products/5.jpg',3,89.00,267.00,0.00,0.00,267.00,'{\"sku\":\"HS-157-A0\",\"attributes\":\"(Color: Black, Size: XL)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47'),(48,17,'Botble\\Ecommerce\\Models\\Product',27,'The Marc Jacobs',NULL,'products/7-1.jpg',1,51.00,51.00,0.00,0.00,51.00,'{\"sku\":\"HS-138-A0-A1\",\"attributes\":\"(Color: Green, Size: XL)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47'),(49,17,'Botble\\Ecommerce\\Models\\Product',29,'Round Cross body Bag',NULL,'products/8.jpg',1,121.00,121.00,0.00,0.00,121.00,'{\"sku\":\"HS-175-A0\",\"attributes\":\"(Color: Red, Size: XXL)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47'),(50,18,'Botble\\Ecommerce\\Models\\Product',15,'Gucci Zip Around Wallet',NULL,'products/3-1.jpg',3,202.00,606.00,0.00,0.00,606.00,'{\"sku\":\"HS-153-A0-A1\",\"attributes\":\"(Size: S, Color: Red)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47'),(51,18,'Botble\\Ecommerce\\Models\\Product',20,'Joan Mini Camera Bag',NULL,'products/5.jpg',1,89.00,89.00,0.00,0.00,89.00,'{\"sku\":\"HS-157-A0\",\"attributes\":\"(Color: Black, Size: XL)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47'),(52,18,'Botble\\Ecommerce\\Models\\Product',21,'Joan Mini Camera Bag',NULL,'products/5-1.jpg',2,89.00,178.00,0.00,0.00,178.00,'{\"sku\":\"HS-157-A0-A1\",\"attributes\":\"(Color: Green, Size: S)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47'),(53,18,'Botble\\Ecommerce\\Models\\Product',27,'The Marc Jacobs',NULL,'products/7-1.jpg',2,51.00,102.00,0.00,0.00,102.00,'{\"sku\":\"HS-138-A0-A1\",\"attributes\":\"(Color: Green, Size: XL)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47'),(54,19,'Botble\\Ecommerce\\Models\\Product',12,'Clutch handmade',NULL,'products/2-1.jpg',2,461.00,922.00,0.00,0.00,922.00,'{\"sku\":\"HS-130-A0-A1\",\"attributes\":\"(Color: Green, Size: L)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47'),(55,19,'Botble\\Ecommerce\\Models\\Product',18,'Snapshot Standard',NULL,'products/4-1.jpg',2,243.00,486.00,0.00,0.00,486.00,'{\"sku\":\"HS-152-A0-A1\",\"attributes\":\"(Color: Red, Size: L)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47'),(56,19,'Botble\\Ecommerce\\Models\\Product',22,'Cyan Boheme',NULL,'products/6.jpg',1,43.00,43.00,0.00,0.00,43.00,'{\"sku\":\"HS-118-A0\",\"attributes\":\"(Color: Blue, Size: XXL)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47'),(57,19,'Botble\\Ecommerce\\Models\\Product',26,'The Marc Jacobs',NULL,'products/7.jpg',1,51.00,51.00,0.00,0.00,51.00,'{\"sku\":\"HS-138-A0\",\"attributes\":\"(Size: XL, Color: Brown)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47'),(58,20,'Botble\\Ecommerce\\Models\\Product',14,'Gucci Zip Around Wallet',NULL,'products/3.jpg',3,202.00,606.00,0.00,0.00,606.00,'{\"sku\":\"HS-153-A0\",\"attributes\":\"(Color: Red, Size: XL)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47'),(59,20,'Botble\\Ecommerce\\Models\\Product',17,'Snapshot Standard',NULL,'products/4.jpg',2,243.00,486.00,0.00,0.00,486.00,'{\"sku\":\"HS-152-A0\",\"attributes\":\"(Color: Green, Size: S)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47'),(60,20,'Botble\\Ecommerce\\Models\\Product',27,'The Marc Jacobs',NULL,'products/7-1.jpg',1,51.00,51.00,0.00,0.00,51.00,'{\"sku\":\"HS-138-A0-A1\",\"attributes\":\"(Color: Green, Size: XL)\"}','2024-01-31 02:40:47','2024-01-31 02:40:47');
/*!40000 ALTER TABLE `ec_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_invoices`
--

DROP TABLE IF EXISTS `ec_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_tax_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `payment_id` bigint unsigned DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_invoices_code_unique` (`code`),
  KEY `ec_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `ec_invoices_payment_id_index` (`payment_id`),
  KEY `ec_invoices_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_invoices`
--

LOCK TABLES `ec_invoices` WRITE;
/*!40000 ALTER TABLE `ec_invoices` DISABLE KEYS */;
INSERT INTO `ec_invoices` VALUES (1,'Botble\\Ecommerce\\Models\\Order',1,'INV-1','Miss Agustina Dooley IV','',NULL,'mustafa76@example.net','+14088504551','5842 Domenic Stravenue, Eddiemouth, Washington, GT',NULL,665.00,0.00,0.00,0.00,'1','default',NULL,NULL,665.00,NULL,1,'completed','2024-01-31 02:40:44','2024-01-29 10:40:44','2024-01-31 02:40:44'),(2,'Botble\\Ecommerce\\Models\\Order',2,'INV-2','Lucinda Hills','',NULL,'adella.schimmel@example.org','+15742804463','823 Schumm Mountains Apt. 335, East Jarrett, North Dakota, SJ',NULL,1020.00,0.00,0.00,0.00,'1','default',NULL,NULL,1020.00,NULL,2,'completed','2024-01-31 02:40:44','2024-01-15 06:40:44','2024-01-31 02:40:44'),(3,'Botble\\Ecommerce\\Models\\Order',3,'INV-3','Colin Kub','',NULL,'john.smith@botble.com','+13474479491','693 Borer Hollow, Bartview, Mississippi, QA',NULL,396.00,0.00,0.00,0.00,'1','default',NULL,NULL,396.00,NULL,3,'completed','2024-01-31 02:40:44','2024-01-16 02:40:44','2024-01-31 02:40:44'),(4,'Botble\\Ecommerce\\Models\\Order',4,'INV-4','Ceasar Rempel','',NULL,'customer@botble.com','+17377716926','43306 Bartell Skyway, Kayleefurt, Alabama, DO',NULL,888.00,0.00,0.00,0.00,'1','default',NULL,NULL,888.00,NULL,4,'completed','2024-01-31 02:40:45','2024-01-22 14:40:45','2024-01-31 02:40:45'),(5,'Botble\\Ecommerce\\Models\\Order',5,'INV-5','Lia Hickle','',NULL,'marina45@example.net','+19127180212','8465 Shane Locks Apt. 967, Port Bettye, Montana, CC',NULL,831.00,0.00,0.00,0.00,'1','default',NULL,NULL,831.00,NULL,5,'completed','2024-01-31 02:40:45','2024-01-28 10:40:45','2024-01-31 02:40:45'),(6,'Botble\\Ecommerce\\Models\\Order',6,'INV-6','Alberto Heller DVM','',NULL,'flueilwitz@example.org','+12017007315','17722 Wisozk Roads Suite 861, Port Ottofurt, Montana, PL',NULL,509.00,0.00,0.00,0.00,'1','default',NULL,NULL,509.00,NULL,6,'completed','2024-01-31 02:40:45','2024-01-23 14:40:45','2024-01-31 02:40:45'),(7,'Botble\\Ecommerce\\Models\\Order',7,'INV-7','Lucinda Hills','',NULL,'adella.schimmel@example.org','+15742804463','823 Schumm Mountains Apt. 335, East Jarrett, North Dakota, SJ',NULL,1436.00,0.00,0.00,0.00,'1','default',NULL,NULL,1436.00,NULL,7,'completed','2024-01-31 02:40:45','2024-01-29 22:40:45','2024-01-31 02:40:45'),(8,'Botble\\Ecommerce\\Models\\Order',8,'INV-8','Dr. Herminia Lindgren','',NULL,'kianna91@example.net','+19497946448','98479 Cartwright Pass Suite 259, Itzelchester, Wisconsin, PN',NULL,1771.00,0.00,0.00,0.00,'1','default',NULL,NULL,1771.00,NULL,8,'completed','2024-01-31 02:40:45','2024-01-30 00:40:45','2024-01-31 02:40:45'),(9,'Botble\\Ecommerce\\Models\\Order',9,'INV-9','Colin Kub','',NULL,'john.smith@botble.com','+13474479491','693 Borer Hollow, Bartview, Mississippi, QA',NULL,264.00,0.00,0.00,0.00,'1','default',NULL,NULL,264.00,NULL,9,'completed','2024-01-31 02:40:46','2024-01-24 02:40:45','2024-01-31 02:40:46'),(10,'Botble\\Ecommerce\\Models\\Order',10,'INV-10','Ceasar Rempel','',NULL,'customer@botble.com','+17377716926','43306 Bartell Skyway, Kayleefurt, Alabama, DO',NULL,336.00,0.00,0.00,0.00,'1','default',NULL,NULL,336.00,NULL,10,'completed','2024-01-31 02:40:46','2024-01-25 14:40:46','2024-01-31 02:40:46'),(11,'Botble\\Ecommerce\\Models\\Order',11,'INV-11','Ceasar Rempel','',NULL,'customer@botble.com','+17377716926','43306 Bartell Skyway, Kayleefurt, Alabama, DO',NULL,857.00,0.00,0.00,0.00,'1','default',NULL,NULL,857.00,NULL,11,'completed','2024-01-31 02:40:46','2024-01-25 06:40:46','2024-01-31 02:40:46'),(12,'Botble\\Ecommerce\\Models\\Order',12,'INV-12','Lucinda Hills','',NULL,'adella.schimmel@example.org','+15742804463','823 Schumm Mountains Apt. 335, East Jarrett, North Dakota, SJ',NULL,1844.00,0.00,0.00,0.00,'1','default',NULL,NULL,1844.00,NULL,12,'pending',NULL,'2024-01-28 20:40:46','2024-01-31 02:40:46'),(13,'Botble\\Ecommerce\\Models\\Order',13,'INV-13','Alberto Heller DVM','',NULL,'flueilwitz@example.org','+12017007315','17722 Wisozk Roads Suite 861, Port Ottofurt, Montana, PL',NULL,830.00,0.00,0.00,0.00,'1','default',NULL,NULL,830.00,NULL,13,'completed','2024-01-31 02:40:46','2024-01-28 10:40:46','2024-01-31 02:40:46'),(14,'Botble\\Ecommerce\\Models\\Order',14,'INV-14','Angeline Gerhold','',NULL,'shawn01@example.com','+15866818050','94082 Schneider Plaza Suite 231, Sporerhaven, Arkansas, CA',NULL,625.00,0.00,0.00,0.00,'1','default',NULL,NULL,625.00,NULL,14,'pending',NULL,'2024-01-26 10:40:46','2024-01-31 02:40:46'),(15,'Botble\\Ecommerce\\Models\\Order',15,'INV-15','Colin Kub','',NULL,'john.smith@botble.com','+13474479491','693 Borer Hollow, Bartview, Mississippi, QA',NULL,1292.00,0.00,0.00,0.00,'1','default',NULL,NULL,1292.00,NULL,15,'completed','2024-01-31 02:40:47','2024-01-28 02:40:47','2024-01-31 02:40:47'),(16,'Botble\\Ecommerce\\Models\\Order',16,'INV-16','Angeline Gerhold','',NULL,'shawn01@example.com','+15866818050','94082 Schneider Plaza Suite 231, Sporerhaven, Arkansas, CA',NULL,1261.00,0.00,0.00,0.00,'1','default',NULL,NULL,1261.00,NULL,16,'completed','2024-01-31 02:40:47','2024-01-30 16:40:47','2024-01-31 02:40:47'),(17,'Botble\\Ecommerce\\Models\\Order',17,'INV-17','Lia Hickle','',NULL,'marina45@example.net','+19127180212','8465 Shane Locks Apt. 967, Port Bettye, Montana, CC',NULL,1045.00,0.00,0.00,0.00,'1','default',NULL,NULL,1045.00,NULL,17,'pending',NULL,'2024-01-30 10:40:47','2024-01-31 02:40:47'),(18,'Botble\\Ecommerce\\Models\\Order',18,'INV-18','Miss Agustina Dooley IV','',NULL,'mustafa76@example.net','+14088504551','5842 Domenic Stravenue, Eddiemouth, Washington, GT',NULL,975.00,0.00,0.00,0.00,'1','default',NULL,NULL,975.00,NULL,18,'completed','2024-01-31 02:40:47','2024-01-28 14:40:47','2024-01-31 02:40:47'),(19,'Botble\\Ecommerce\\Models\\Order',19,'INV-19','Ceasar Rempel','',NULL,'customer@botble.com','+17377716926','43306 Bartell Skyway, Kayleefurt, Alabama, DO',NULL,1502.00,0.00,0.00,0.00,'1','default',NULL,NULL,1502.00,NULL,19,'completed','2024-01-31 02:40:47','2024-01-30 10:40:47','2024-01-31 02:40:47'),(20,'Botble\\Ecommerce\\Models\\Order',20,'INV-20','Colin Kub','',NULL,'john.smith@botble.com','+13474479491','693 Borer Hollow, Bartview, Mississippi, QA',NULL,1143.00,0.00,0.00,0.00,'1','default',NULL,NULL,1143.00,NULL,20,'pending',NULL,'2024-01-30 18:40:47','2024-01-31 02:40:47');
/*!40000 ALTER TABLE `ec_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_option_value`
--

DROP TABLE IF EXISTS `ec_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_option_value` (
  `option_id` bigint unsigned NOT NULL COMMENT 'option id',
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `option_value` tinytext COLLATE utf8mb4_unicode_ci COMMENT 'option value',
  `affect_price` double DEFAULT NULL COMMENT 'value of price of this option affect',
  `order` int NOT NULL DEFAULT '9999',
  `affect_type` tinyint NOT NULL DEFAULT '0' COMMENT '0. fixed 1. percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_option_value`
--

LOCK TABLES `ec_option_value` WRITE;
/*!40000 ALTER TABLE `ec_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_option_value_translations`
--

DROP TABLE IF EXISTS `ec_option_value_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_option_value_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_option_value_id` bigint unsigned NOT NULL,
  `option_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_option_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_option_value_translations`
--

LOCK TABLES `ec_option_value_translations` WRITE;
/*!40000 ALTER TABLE `ec_option_value_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_option_value_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_options`
--

DROP TABLE IF EXISTS `ec_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of options',
  `option_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'option type',
  `product_id` bigint unsigned NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '9999',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Checked if this option is required',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_options`
--

LOCK TABLES `ec_options` WRITE;
/*!40000 ALTER TABLE `ec_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_options_translations`
--

DROP TABLE IF EXISTS `ec_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_options_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_options_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_options_translations`
--

LOCK TABLES `ec_options_translations` WRITE;
/*!40000 ALTER TABLE `ec_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_addresses`
--

DROP TABLE IF EXISTS `ec_order_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'shipping_address',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_addresses`
--

LOCK TABLES `ec_order_addresses` WRITE;
/*!40000 ALTER TABLE `ec_order_addresses` DISABLE KEYS */;
INSERT INTO `ec_order_addresses` VALUES (1,'Miss Agustina Dooley IV','+14088504551','mustafa76@example.net','GT','Washington','Eddiemouth','5842 Domenic Stravenue',1,'24812','shipping_address'),(2,'Lucinda Hills','+15742804463','adella.schimmel@example.org','SJ','North Dakota','East Jarrett','823 Schumm Mountains Apt. 335',2,'48818','shipping_address'),(3,'Colin Kub','+13474479491','john.smith@botble.com','QA','Mississippi','Bartview','693 Borer Hollow',3,'08085-2074','shipping_address'),(4,'Ceasar Rempel','+17377716926','customer@botble.com','DO','Alabama','Kayleefurt','43306 Bartell Skyway',4,'87283-4412','shipping_address'),(5,'Lia Hickle','+19127180212','marina45@example.net','CC','Montana','Port Bettye','8465 Shane Locks Apt. 967',5,'29328-3023','shipping_address'),(6,'Alberto Heller DVM','+12017007315','flueilwitz@example.org','PL','Montana','Port Ottofurt','17722 Wisozk Roads Suite 861',6,'74302-0170','shipping_address'),(7,'Lucinda Hills','+15742804463','adella.schimmel@example.org','SJ','North Dakota','East Jarrett','823 Schumm Mountains Apt. 335',7,'48818','shipping_address'),(8,'Dr. Herminia Lindgren','+19497946448','kianna91@example.net','PN','Wisconsin','Itzelchester','98479 Cartwright Pass Suite 259',8,'86237','shipping_address'),(9,'Colin Kub','+13474479491','john.smith@botble.com','QA','Mississippi','Bartview','693 Borer Hollow',9,'08085-2074','shipping_address'),(10,'Ceasar Rempel','+17377716926','customer@botble.com','DO','Alabama','Kayleefurt','43306 Bartell Skyway',10,'87283-4412','shipping_address'),(11,'Ceasar Rempel','+17377716926','customer@botble.com','DO','Alabama','Kayleefurt','43306 Bartell Skyway',11,'87283-4412','shipping_address'),(12,'Lucinda Hills','+15742804463','adella.schimmel@example.org','SJ','North Dakota','East Jarrett','823 Schumm Mountains Apt. 335',12,'48818','shipping_address'),(13,'Alberto Heller DVM','+12017007315','flueilwitz@example.org','PL','Montana','Port Ottofurt','17722 Wisozk Roads Suite 861',13,'74302-0170','shipping_address'),(14,'Angeline Gerhold','+15866818050','shawn01@example.com','CA','Arkansas','Sporerhaven','94082 Schneider Plaza Suite 231',14,'01762','shipping_address'),(15,'Colin Kub','+13474479491','john.smith@botble.com','QA','Mississippi','Bartview','693 Borer Hollow',15,'08085-2074','shipping_address'),(16,'Angeline Gerhold','+15866818050','shawn01@example.com','CA','Arkansas','Sporerhaven','94082 Schneider Plaza Suite 231',16,'01762','shipping_address'),(17,'Lia Hickle','+19127180212','marina45@example.net','CC','Montana','Port Bettye','8465 Shane Locks Apt. 967',17,'29328-3023','shipping_address'),(18,'Miss Agustina Dooley IV','+14088504551','mustafa76@example.net','GT','Washington','Eddiemouth','5842 Domenic Stravenue',18,'24812','shipping_address'),(19,'Ceasar Rempel','+17377716926','customer@botble.com','DO','Alabama','Kayleefurt','43306 Bartell Skyway',19,'87283-4412','shipping_address'),(20,'Colin Kub','+13474479491','john.smith@botble.com','QA','Mississippi','Bartview','693 Borer Hollow',20,'08085-2074','shipping_address');
/*!40000 ALTER TABLE `ec_order_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_histories`
--

DROP TABLE IF EXISTS `ec_order_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL,
  `extras` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_histories`
--

LOCK TABLES `ec_order_histories` WRITE;
/*!40000 ALTER TABLE `ec_order_histories` DISABLE KEYS */;
INSERT INTO `ec_order_histories` VALUES (1,'create_order_from_seeder','Order is created from the checkout page',NULL,1,NULL,'2024-01-29 10:40:44','2024-01-29 10:40:44'),(2,'confirm_order','Order was verified by %user_name%',0,1,NULL,'2024-01-29 10:40:44','2024-01-29 10:40:44'),(3,'confirm_payment','Payment was confirmed (amount $665.00) by %user_name%',0,1,NULL,'2024-01-31 02:40:44','2024-01-31 02:40:44'),(4,'create_shipment','Created shipment for order',0,1,NULL,'2024-01-31 02:40:44','2024-01-31 02:40:44'),(5,'create_order_from_seeder','Order is created from the checkout page',NULL,2,NULL,'2024-01-15 06:40:44','2024-01-15 06:40:44'),(6,'confirm_order','Order was verified by %user_name%',0,2,NULL,'2024-01-15 06:40:44','2024-01-15 06:40:44'),(7,'confirm_payment','Payment was confirmed (amount $1,020.00) by %user_name%',0,2,NULL,'2024-01-31 02:40:44','2024-01-31 02:40:44'),(8,'create_shipment','Created shipment for order',0,2,NULL,'2024-01-31 02:40:44','2024-01-31 02:40:44'),(9,'create_order_from_seeder','Order is created from the checkout page',NULL,3,NULL,'2024-01-16 02:40:44','2024-01-16 02:40:44'),(10,'confirm_order','Order was verified by %user_name%',0,3,NULL,'2024-01-16 02:40:44','2024-01-16 02:40:44'),(11,'confirm_payment','Payment was confirmed (amount $396.00) by %user_name%',0,3,NULL,'2024-01-31 02:40:44','2024-01-31 02:40:44'),(12,'create_shipment','Created shipment for order',0,3,NULL,'2024-01-31 02:40:45','2024-01-31 02:40:45'),(13,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,3,NULL,'2024-01-31 02:40:45','2024-01-31 02:40:45'),(14,'create_order_from_seeder','Order is created from the checkout page',NULL,4,NULL,'2024-01-22 14:40:45','2024-01-22 14:40:45'),(15,'confirm_order','Order was verified by %user_name%',0,4,NULL,'2024-01-22 14:40:45','2024-01-22 14:40:45'),(16,'confirm_payment','Payment was confirmed (amount $888.00) by %user_name%',0,4,NULL,'2024-01-31 02:40:45','2024-01-31 02:40:45'),(17,'create_shipment','Created shipment for order',0,4,NULL,'2024-01-31 02:40:45','2024-01-31 02:40:45'),(18,'create_order_from_seeder','Order is created from the checkout page',NULL,5,NULL,'2024-01-28 10:40:45','2024-01-28 10:40:45'),(19,'confirm_order','Order was verified by %user_name%',0,5,NULL,'2024-01-28 10:40:45','2024-01-28 10:40:45'),(20,'confirm_payment','Payment was confirmed (amount $831.00) by %user_name%',0,5,NULL,'2024-01-31 02:40:45','2024-01-31 02:40:45'),(21,'create_shipment','Created shipment for order',0,5,NULL,'2024-01-31 02:40:45','2024-01-31 02:40:45'),(22,'create_order_from_seeder','Order is created from the checkout page',NULL,6,NULL,'2024-01-23 14:40:45','2024-01-23 14:40:45'),(23,'confirm_order','Order was verified by %user_name%',0,6,NULL,'2024-01-23 14:40:45','2024-01-23 14:40:45'),(24,'confirm_payment','Payment was confirmed (amount $509.00) by %user_name%',0,6,NULL,'2024-01-31 02:40:45','2024-01-31 02:40:45'),(25,'create_shipment','Created shipment for order',0,6,NULL,'2024-01-31 02:40:45','2024-01-31 02:40:45'),(26,'create_order_from_seeder','Order is created from the checkout page',NULL,7,NULL,'2024-01-29 22:40:45','2024-01-29 22:40:45'),(27,'confirm_order','Order was verified by %user_name%',0,7,NULL,'2024-01-29 22:40:45','2024-01-29 22:40:45'),(28,'confirm_payment','Payment was confirmed (amount $1,436.00) by %user_name%',0,7,NULL,'2024-01-31 02:40:45','2024-01-31 02:40:45'),(29,'create_shipment','Created shipment for order',0,7,NULL,'2024-01-31 02:40:45','2024-01-31 02:40:45'),(30,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,7,NULL,'2024-01-31 02:40:45','2024-01-31 02:40:45'),(31,'create_order_from_seeder','Order is created from the checkout page',NULL,8,NULL,'2024-01-30 00:40:45','2024-01-30 00:40:45'),(32,'confirm_order','Order was verified by %user_name%',0,8,NULL,'2024-01-30 00:40:45','2024-01-30 00:40:45'),(33,'confirm_payment','Payment was confirmed (amount $1,771.00) by %user_name%',0,8,NULL,'2024-01-31 02:40:45','2024-01-31 02:40:45'),(34,'create_shipment','Created shipment for order',0,8,NULL,'2024-01-31 02:40:45','2024-01-31 02:40:45'),(35,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,8,NULL,'2024-01-31 02:40:45','2024-01-31 02:40:45'),(36,'create_order_from_seeder','Order is created from the checkout page',NULL,9,NULL,'2024-01-24 02:40:45','2024-01-24 02:40:45'),(37,'confirm_order','Order was verified by %user_name%',0,9,NULL,'2024-01-24 02:40:45','2024-01-24 02:40:45'),(38,'confirm_payment','Payment was confirmed (amount $264.00) by %user_name%',0,9,NULL,'2024-01-31 02:40:46','2024-01-31 02:40:46'),(39,'create_shipment','Created shipment for order',0,9,NULL,'2024-01-31 02:40:46','2024-01-31 02:40:46'),(40,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,9,NULL,'2024-01-31 02:40:46','2024-01-31 02:40:46'),(41,'create_order_from_seeder','Order is created from the checkout page',NULL,10,NULL,'2024-01-25 14:40:46','2024-01-25 14:40:46'),(42,'confirm_order','Order was verified by %user_name%',0,10,NULL,'2024-01-25 14:40:46','2024-01-25 14:40:46'),(43,'confirm_payment','Payment was confirmed (amount $336.00) by %user_name%',0,10,NULL,'2024-01-31 02:40:46','2024-01-31 02:40:46'),(44,'create_shipment','Created shipment for order',0,10,NULL,'2024-01-31 02:40:46','2024-01-31 02:40:46'),(45,'create_order_from_seeder','Order is created from the checkout page',NULL,11,NULL,'2024-01-25 06:40:46','2024-01-25 06:40:46'),(46,'confirm_order','Order was verified by %user_name%',0,11,NULL,'2024-01-25 06:40:46','2024-01-25 06:40:46'),(47,'confirm_payment','Payment was confirmed (amount $857.00) by %user_name%',0,11,NULL,'2024-01-31 02:40:46','2024-01-31 02:40:46'),(48,'create_shipment','Created shipment for order',0,11,NULL,'2024-01-31 02:40:46','2024-01-31 02:40:46'),(49,'create_order_from_seeder','Order is created from the checkout page',NULL,12,NULL,'2024-01-28 20:40:46','2024-01-28 20:40:46'),(50,'confirm_order','Order was verified by %user_name%',0,12,NULL,'2024-01-28 20:40:46','2024-01-28 20:40:46'),(51,'create_shipment','Created shipment for order',0,12,NULL,'2024-01-31 02:40:46','2024-01-31 02:40:46'),(52,'create_order_from_seeder','Order is created from the checkout page',NULL,13,NULL,'2024-01-28 10:40:46','2024-01-28 10:40:46'),(53,'confirm_order','Order was verified by %user_name%',0,13,NULL,'2024-01-28 10:40:46','2024-01-28 10:40:46'),(54,'confirm_payment','Payment was confirmed (amount $830.00) by %user_name%',0,13,NULL,'2024-01-31 02:40:46','2024-01-31 02:40:46'),(55,'create_shipment','Created shipment for order',0,13,NULL,'2024-01-31 02:40:46','2024-01-31 02:40:46'),(56,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,13,NULL,'2024-01-31 02:40:46','2024-01-31 02:40:46'),(57,'create_order_from_seeder','Order is created from the checkout page',NULL,14,NULL,'2024-01-26 10:40:46','2024-01-26 10:40:46'),(58,'confirm_order','Order was verified by %user_name%',0,14,NULL,'2024-01-26 10:40:46','2024-01-26 10:40:46'),(59,'create_shipment','Created shipment for order',0,14,NULL,'2024-01-31 02:40:46','2024-01-31 02:40:46'),(60,'create_order_from_seeder','Order is created from the checkout page',NULL,15,NULL,'2024-01-28 02:40:47','2024-01-28 02:40:47'),(61,'confirm_order','Order was verified by %user_name%',0,15,NULL,'2024-01-28 02:40:47','2024-01-28 02:40:47'),(62,'confirm_payment','Payment was confirmed (amount $1,292.00) by %user_name%',0,15,NULL,'2024-01-31 02:40:47','2024-01-31 02:40:47'),(63,'create_shipment','Created shipment for order',0,15,NULL,'2024-01-31 02:40:47','2024-01-31 02:40:47'),(64,'create_order_from_seeder','Order is created from the checkout page',NULL,16,NULL,'2024-01-30 16:40:47','2024-01-30 16:40:47'),(65,'confirm_order','Order was verified by %user_name%',0,16,NULL,'2024-01-30 16:40:47','2024-01-30 16:40:47'),(66,'confirm_payment','Payment was confirmed (amount $1,261.00) by %user_name%',0,16,NULL,'2024-01-31 02:40:47','2024-01-31 02:40:47'),(67,'create_shipment','Created shipment for order',0,16,NULL,'2024-01-31 02:40:47','2024-01-31 02:40:47'),(68,'create_order_from_seeder','Order is created from the checkout page',NULL,17,NULL,'2024-01-30 10:40:47','2024-01-30 10:40:47'),(69,'confirm_order','Order was verified by %user_name%',0,17,NULL,'2024-01-30 10:40:47','2024-01-30 10:40:47'),(70,'create_shipment','Created shipment for order',0,17,NULL,'2024-01-31 02:40:47','2024-01-31 02:40:47'),(71,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,17,NULL,'2024-01-31 02:40:47','2024-01-31 02:40:47'),(72,'create_order_from_seeder','Order is created from the checkout page',NULL,18,NULL,'2024-01-28 14:40:47','2024-01-28 14:40:47'),(73,'confirm_order','Order was verified by %user_name%',0,18,NULL,'2024-01-28 14:40:47','2024-01-28 14:40:47'),(74,'confirm_payment','Payment was confirmed (amount $975.00) by %user_name%',0,18,NULL,'2024-01-31 02:40:47','2024-01-31 02:40:47'),(75,'create_shipment','Created shipment for order',0,18,NULL,'2024-01-31 02:40:47','2024-01-31 02:40:47'),(76,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,18,NULL,'2024-01-31 02:40:47','2024-01-31 02:40:47'),(77,'create_order_from_seeder','Order is created from the checkout page',NULL,19,NULL,'2024-01-30 10:40:47','2024-01-30 10:40:47'),(78,'confirm_order','Order was verified by %user_name%',0,19,NULL,'2024-01-30 10:40:47','2024-01-30 10:40:47'),(79,'confirm_payment','Payment was confirmed (amount $1,502.00) by %user_name%',0,19,NULL,'2024-01-31 02:40:47','2024-01-31 02:40:47'),(80,'create_shipment','Created shipment for order',0,19,NULL,'2024-01-31 02:40:47','2024-01-31 02:40:47'),(81,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,19,NULL,'2024-01-31 02:40:47','2024-01-31 02:40:47'),(82,'create_order_from_seeder','Order is created from the checkout page',NULL,20,NULL,'2024-01-30 18:40:47','2024-01-30 18:40:47'),(83,'confirm_order','Order was verified by %user_name%',0,20,NULL,'2024-01-30 18:40:47','2024-01-30 18:40:47'),(84,'create_shipment','Created shipment for order',0,20,NULL,'2024-01-31 02:40:48','2024-01-31 02:40:48'),(85,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,20,NULL,'2024-01-31 02:40:48','2024-01-31 02:40:48'),(86,'update_status','Order confirmed by %user_name%',0,3,NULL,'2024-01-31 02:40:48','2024-01-31 02:40:48'),(87,'update_status','Order confirmed by %user_name%',0,7,NULL,'2024-01-31 02:40:48','2024-01-31 02:40:48'),(88,'update_status','Order confirmed by %user_name%',0,8,NULL,'2024-01-31 02:40:48','2024-01-31 02:40:48'),(89,'update_status','Order confirmed by %user_name%',0,9,NULL,'2024-01-31 02:40:48','2024-01-31 02:40:48'),(90,'update_status','Order confirmed by %user_name%',0,13,NULL,'2024-01-31 02:40:48','2024-01-31 02:40:48'),(91,'update_status','Order confirmed by %user_name%',0,18,NULL,'2024-01-31 02:40:48','2024-01-31 02:40:48'),(92,'update_status','Order confirmed by %user_name%',0,19,NULL,'2024-01-31 02:40:48','2024-01-31 02:40:48');
/*!40000 ALTER TABLE `ec_order_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_product`
--

DROP TABLE IF EXISTS `ec_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `qty` int NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `product_options` text COLLATE utf8mb4_unicode_ci COMMENT 'product option data',
  `product_id` bigint unsigned DEFAULT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` double(8,2) DEFAULT '0.00',
  `restock_quantity` int unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'physical',
  `times_downloaded` int NOT NULL DEFAULT '0',
  `license_code` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_product`
--

LOCK TABLES `ec_order_product` WRITE;
/*!40000 ALTER TABLE `ec_order_product` DISABLE KEYS */;
INSERT INTO `ec_order_product` VALUES (1,1,1,461.00,0.00,'{\"sku\":\"HS-130-A0\",\"attributes\":\"(Size: L, Color: Black)\"}',NULL,11,'Clutch handmade','products/2.jpg',592.00,0,'2024-01-31 02:40:44','2024-01-31 02:40:44','physical',0,NULL),(2,1,3,51.00,0.00,'{\"sku\":\"HS-138-A0\",\"attributes\":\"(Size: XL, Color: Brown)\"}',NULL,26,'The Marc Jacobs','products/7.jpg',2622.00,0,'2024-01-31 02:40:44','2024-01-31 02:40:44','physical',0,NULL),(3,1,1,51.00,0.00,'{\"sku\":\"HS-138-A0-A2\",\"attributes\":\"(Size: S, Color: Red)\"}',NULL,28,'The Marc Jacobs','products/7-2.jpg',874.00,0,'2024-01-31 02:40:44','2024-01-31 02:40:44','physical',0,NULL),(4,2,1,202.00,0.00,'{\"sku\":\"HS-153-A0-A1\",\"attributes\":\"(Size: S, Color: Red)\"}',NULL,15,'Gucci Zip Around Wallet','products/3-1.jpg',717.00,0,'2024-01-31 02:40:44','2024-01-31 02:40:44','physical',0,NULL),(5,2,3,243.00,0.00,'{\"sku\":\"HS-152-A0-A1\",\"attributes\":\"(Color: Red, Size: L)\"}',NULL,18,'Snapshot Standard','products/4-1.jpg',2232.00,0,'2024-01-31 02:40:44','2024-01-31 02:40:44','physical',0,NULL),(6,2,1,89.00,0.00,'{\"sku\":\"HS-157-A0\",\"attributes\":\"(Color: Black, Size: XL)\"}',NULL,20,'Joan Mini Camera Bag','products/5.jpg',831.00,0,'2024-01-31 02:40:44','2024-01-31 02:40:44','digital',7,NULL),(7,3,3,89.00,0.00,'{\"sku\":\"HS-157-A0\",\"attributes\":\"(Color: Black, Size: XL)\"}',NULL,20,'Joan Mini Camera Bag','products/5.jpg',2493.00,0,'2024-01-31 02:40:44','2024-01-31 02:40:44','digital',5,NULL),(8,3,3,43.00,0.00,'{\"sku\":\"HS-118-A0\",\"attributes\":\"(Color: Blue, Size: XXL)\"}',NULL,22,'Cyan Boheme','products/6.jpg',1935.00,0,'2024-01-31 02:40:44','2024-01-31 02:40:44','physical',0,NULL),(9,4,3,202.00,0.00,'{\"sku\":\"HS-153-A0-A2\",\"attributes\":\"(Color: Red, Size: XL)\"}',NULL,16,'Gucci Zip Around Wallet','products/3-2.jpg',2151.00,0,'2024-01-31 02:40:45','2024-01-31 02:40:45','physical',0,NULL),(10,4,3,43.00,0.00,'{\"sku\":\"HS-118-A0-A3\",\"attributes\":\"(Color: Green, Size: XL)\"}',NULL,25,'Cyan Boheme','products/6.jpg',1935.00,0,'2024-01-31 02:40:45','2024-01-31 02:40:45','physical',0,NULL),(11,4,3,51.00,0.00,'{\"sku\":\"HS-138-A0-A1\",\"attributes\":\"(Color: Green, Size: XL)\"}',NULL,27,'The Marc Jacobs','products/7-1.jpg',2622.00,0,'2024-01-31 02:40:45','2024-01-31 02:40:45','physical',0,NULL),(12,5,3,243.00,0.00,'{\"sku\":\"HS-152-A0-A1\",\"attributes\":\"(Color: Red, Size: L)\"}',NULL,18,'Snapshot Standard','products/4-1.jpg',2232.00,0,'2024-01-31 02:40:45','2024-01-31 02:40:45','physical',0,NULL),(13,5,2,51.00,0.00,'{\"sku\":\"HS-138-A0\",\"attributes\":\"(Size: XL, Color: Brown)\"}',NULL,26,'The Marc Jacobs','products/7.jpg',1748.00,0,'2024-01-31 02:40:45','2024-01-31 02:40:45','physical',0,NULL),(14,6,3,89.00,0.00,'{\"sku\":\"HS-157-A0-A1\",\"attributes\":\"(Color: Green, Size: S)\"}',NULL,21,'Joan Mini Camera Bag','products/5-1.jpg',2493.00,0,'2024-01-31 02:40:45','2024-01-31 02:40:45','digital',8,NULL),(15,6,2,121.00,0.00,'{\"sku\":\"HS-175-A0-A1\",\"attributes\":\"(Color: Green, Size: M)\"}',NULL,30,'Round Cross body Bag','products/8.jpg',1368.00,0,'2024-01-31 02:40:45','2024-01-31 02:40:45','physical',0,NULL),(16,7,2,285.00,0.00,'{\"sku\":\"HS-199-A0-A1\",\"attributes\":\"(Color: Green, Size: S)\"}',NULL,10,'Wallet handmade','products/1-1.jpg',1124.00,0,'2024-01-31 02:40:45','2024-01-31 02:40:45','digital',5,NULL),(17,7,3,243.00,0.00,'{\"sku\":\"HS-152-A0-A2\",\"attributes\":\"(Size: S, Color: Brown)\"}',NULL,19,'Snapshot Standard','products/4-2.jpg',2232.00,0,'2024-01-31 02:40:45','2024-01-31 02:40:45','physical',0,NULL),(18,7,2,43.00,0.00,'{\"sku\":\"HS-118-A0-A1\",\"attributes\":\"(Size: XL, Color: Brown)\"}',NULL,23,'Cyan Boheme','products/6-1.jpg',1290.00,0,'2024-01-31 02:40:45','2024-01-31 02:40:45','physical',0,NULL),(19,7,1,51.00,0.00,'{\"sku\":\"HS-138-A0-A1\",\"attributes\":\"(Color: Green, Size: XL)\"}',NULL,27,'The Marc Jacobs','products/7-1.jpg',874.00,0,'2024-01-31 02:40:45','2024-01-31 02:40:45','physical',0,NULL),(20,8,2,461.00,0.00,'{\"sku\":\"HS-130-A0-A2\",\"attributes\":\"(Color: Green, Size: XXL)\"}',NULL,13,'Clutch handmade','products/2-2.jpg',1184.00,0,'2024-01-31 02:40:45','2024-01-31 02:40:45','physical',0,NULL),(21,8,1,243.00,0.00,'{\"sku\":\"HS-152-A0\",\"attributes\":\"(Color: Green, Size: S)\"}',NULL,17,'Snapshot Standard','products/4.jpg',744.00,0,'2024-01-31 02:40:45','2024-01-31 02:40:45','physical',0,NULL),(22,8,1,243.00,0.00,'{\"sku\":\"HS-152-A0-A2\",\"attributes\":\"(Size: S, Color: Brown)\"}',NULL,19,'Snapshot Standard','products/4-2.jpg',744.00,0,'2024-01-31 02:40:45','2024-01-31 02:40:45','physical',0,NULL),(23,8,3,121.00,0.00,'{\"sku\":\"HS-175-A0-A1\",\"attributes\":\"(Color: Green, Size: M)\"}',NULL,30,'Round Cross body Bag','products/8.jpg',2052.00,0,'2024-01-31 02:40:45','2024-01-31 02:40:45','physical',0,NULL),(24,9,2,89.00,0.00,'{\"sku\":\"HS-157-A0\",\"attributes\":\"(Color: Black, Size: XL)\"}',NULL,20,'Joan Mini Camera Bag','products/5.jpg',1662.00,0,'2024-01-31 02:40:46','2024-01-31 02:40:46','digital',6,NULL),(25,9,2,43.00,0.00,'{\"sku\":\"HS-118-A0-A2\",\"attributes\":\"(Size: S, Color: Black)\"}',NULL,24,'Cyan Boheme','products/6.jpg',1290.00,0,'2024-01-31 02:40:46','2024-01-31 02:40:46','physical',0,NULL),(26,10,1,285.00,0.00,'{\"sku\":\"HS-199-A0\",\"attributes\":\"(Color: Black, Size: XXL)\"}',NULL,9,'Wallet handmade','products/1.jpg',562.00,0,'2024-01-31 02:40:46','2024-01-31 02:40:46','digital',5,NULL),(27,10,1,51.00,0.00,'{\"sku\":\"HS-138-A0-A1\",\"attributes\":\"(Color: Green, Size: XL)\"}',NULL,27,'The Marc Jacobs','products/7-1.jpg',874.00,0,'2024-01-31 02:40:46','2024-01-31 02:40:46','physical',0,NULL),(28,11,1,461.00,0.00,'{\"sku\":\"HS-130-A0-A1\",\"attributes\":\"(Color: Green, Size: L)\"}',NULL,12,'Clutch handmade','products/2-1.jpg',592.00,0,'2024-01-31 02:40:46','2024-01-31 02:40:46','physical',0,NULL),(29,11,1,243.00,0.00,'{\"sku\":\"HS-152-A0-A2\",\"attributes\":\"(Size: S, Color: Brown)\"}',NULL,19,'Snapshot Standard','products/4-2.jpg',744.00,0,'2024-01-31 02:40:46','2024-01-31 02:40:46','physical',0,NULL),(30,11,3,51.00,0.00,'{\"sku\":\"HS-138-A0\",\"attributes\":\"(Size: XL, Color: Brown)\"}',NULL,26,'The Marc Jacobs','products/7.jpg',2622.00,0,'2024-01-31 02:40:46','2024-01-31 02:40:46','physical',0,NULL),(31,12,2,461.00,0.00,'{\"sku\":\"HS-130-A0-A1\",\"attributes\":\"(Color: Green, Size: L)\"}',NULL,12,'Clutch handmade','products/2-1.jpg',1184.00,0,'2024-01-31 02:40:46','2024-01-31 02:40:46','physical',0,NULL),(32,12,2,461.00,0.00,'{\"sku\":\"HS-130-A0-A2\",\"attributes\":\"(Color: Green, Size: XXL)\"}',NULL,13,'Clutch handmade','products/2-2.jpg',1184.00,0,'2024-01-31 02:40:46','2024-01-31 02:40:46','physical',0,NULL),(33,13,1,461.00,0.00,'{\"sku\":\"HS-130-A0-A2\",\"attributes\":\"(Color: Green, Size: XXL)\"}',NULL,13,'Clutch handmade','products/2-2.jpg',592.00,0,'2024-01-31 02:40:46','2024-01-31 02:40:46','physical',0,NULL),(34,13,3,89.00,0.00,'{\"sku\":\"HS-157-A0-A1\",\"attributes\":\"(Color: Green, Size: S)\"}',NULL,21,'Joan Mini Camera Bag','products/5-1.jpg',2493.00,0,'2024-01-31 02:40:46','2024-01-31 02:40:46','digital',4,NULL),(35,13,2,51.00,0.00,'{\"sku\":\"HS-138-A0-A2\",\"attributes\":\"(Size: S, Color: Red)\"}',NULL,28,'The Marc Jacobs','products/7-2.jpg',1748.00,0,'2024-01-31 02:40:46','2024-01-31 02:40:46','physical',0,NULL),(36,14,2,202.00,0.00,'{\"sku\":\"HS-153-A0-A2\",\"attributes\":\"(Color: Red, Size: XL)\"}',NULL,16,'Gucci Zip Around Wallet','products/3-2.jpg',1434.00,0,'2024-01-31 02:40:46','2024-01-31 02:40:46','physical',0,NULL),(37,14,2,89.00,0.00,'{\"sku\":\"HS-157-A0\",\"attributes\":\"(Color: Black, Size: XL)\"}',NULL,20,'Joan Mini Camera Bag','products/5.jpg',1662.00,0,'2024-01-31 02:40:46','2024-01-31 02:40:46','digital',6,NULL),(38,14,1,43.00,0.00,'{\"sku\":\"HS-118-A0\",\"attributes\":\"(Color: Blue, Size: XXL)\"}',NULL,22,'Cyan Boheme','products/6.jpg',645.00,0,'2024-01-31 02:40:46','2024-01-31 02:40:46','physical',0,NULL),(39,15,3,202.00,0.00,'{\"sku\":\"HS-153-A0-A1\",\"attributes\":\"(Size: S, Color: Red)\"}',NULL,15,'Gucci Zip Around Wallet','products/3-1.jpg',2151.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','physical',0,NULL),(40,15,2,202.00,0.00,'{\"sku\":\"HS-153-A0-A2\",\"attributes\":\"(Color: Red, Size: XL)\"}',NULL,16,'Gucci Zip Around Wallet','products/3-2.jpg',1434.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','physical',0,NULL),(41,15,3,43.00,0.00,'{\"sku\":\"HS-118-A0-A3\",\"attributes\":\"(Color: Green, Size: XL)\"}',NULL,25,'Cyan Boheme','products/6.jpg',1935.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','physical',0,NULL),(42,15,3,51.00,0.00,'{\"sku\":\"HS-138-A0-A1\",\"attributes\":\"(Color: Green, Size: XL)\"}',NULL,27,'The Marc Jacobs','products/7-1.jpg',2622.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','physical',0,NULL),(43,16,3,285.00,0.00,'{\"sku\":\"HS-199-A0-A1\",\"attributes\":\"(Color: Green, Size: S)\"}',NULL,10,'Wallet handmade','products/1-1.jpg',1686.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','digital',5,NULL),(44,16,1,43.00,0.00,'{\"sku\":\"HS-118-A0\",\"attributes\":\"(Color: Blue, Size: XXL)\"}',NULL,22,'Cyan Boheme','products/6.jpg',645.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','physical',0,NULL),(45,16,3,121.00,0.00,'{\"sku\":\"HS-175-A0-A1\",\"attributes\":\"(Color: Green, Size: M)\"}',NULL,30,'Round Cross body Bag','products/8.jpg',2052.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','physical',0,NULL),(46,17,3,202.00,0.00,'{\"sku\":\"HS-153-A0-A1\",\"attributes\":\"(Size: S, Color: Red)\"}',NULL,15,'Gucci Zip Around Wallet','products/3-1.jpg',2151.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','physical',0,NULL),(47,17,3,89.00,0.00,'{\"sku\":\"HS-157-A0\",\"attributes\":\"(Color: Black, Size: XL)\"}',NULL,20,'Joan Mini Camera Bag','products/5.jpg',2493.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','digital',8,NULL),(48,17,1,51.00,0.00,'{\"sku\":\"HS-138-A0-A1\",\"attributes\":\"(Color: Green, Size: XL)\"}',NULL,27,'The Marc Jacobs','products/7-1.jpg',874.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','physical',0,NULL),(49,17,1,121.00,0.00,'{\"sku\":\"HS-175-A0\",\"attributes\":\"(Color: Red, Size: XXL)\"}',NULL,29,'Round Cross body Bag','products/8.jpg',684.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','physical',0,NULL),(50,18,3,202.00,0.00,'{\"sku\":\"HS-153-A0-A1\",\"attributes\":\"(Size: S, Color: Red)\"}',NULL,15,'Gucci Zip Around Wallet','products/3-1.jpg',2151.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','physical',0,NULL),(51,18,1,89.00,0.00,'{\"sku\":\"HS-157-A0\",\"attributes\":\"(Color: Black, Size: XL)\"}',NULL,20,'Joan Mini Camera Bag','products/5.jpg',831.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','digital',5,NULL),(52,18,2,89.00,0.00,'{\"sku\":\"HS-157-A0-A1\",\"attributes\":\"(Color: Green, Size: S)\"}',NULL,21,'Joan Mini Camera Bag','products/5-1.jpg',1662.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','digital',10,NULL),(53,18,2,51.00,0.00,'{\"sku\":\"HS-138-A0-A1\",\"attributes\":\"(Color: Green, Size: XL)\"}',NULL,27,'The Marc Jacobs','products/7-1.jpg',1748.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','physical',0,NULL),(54,19,2,461.00,0.00,'{\"sku\":\"HS-130-A0-A1\",\"attributes\":\"(Color: Green, Size: L)\"}',NULL,12,'Clutch handmade','products/2-1.jpg',1184.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','physical',0,NULL),(55,19,2,243.00,0.00,'{\"sku\":\"HS-152-A0-A1\",\"attributes\":\"(Color: Red, Size: L)\"}',NULL,18,'Snapshot Standard','products/4-1.jpg',1488.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','physical',0,NULL),(56,19,1,43.00,0.00,'{\"sku\":\"HS-118-A0\",\"attributes\":\"(Color: Blue, Size: XXL)\"}',NULL,22,'Cyan Boheme','products/6.jpg',645.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','physical',0,NULL),(57,19,1,51.00,0.00,'{\"sku\":\"HS-138-A0\",\"attributes\":\"(Size: XL, Color: Brown)\"}',NULL,26,'The Marc Jacobs','products/7.jpg',874.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','physical',0,NULL),(58,20,3,202.00,0.00,'{\"sku\":\"HS-153-A0\",\"attributes\":\"(Color: Red, Size: XL)\"}',NULL,14,'Gucci Zip Around Wallet','products/3.jpg',2151.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','physical',0,NULL),(59,20,2,243.00,0.00,'{\"sku\":\"HS-152-A0\",\"attributes\":\"(Color: Green, Size: S)\"}',NULL,17,'Snapshot Standard','products/4.jpg',1488.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','physical',0,NULL),(60,20,1,51.00,0.00,'{\"sku\":\"HS-138-A0-A1\",\"attributes\":\"(Color: Green, Size: XL)\"}',NULL,27,'The Marc Jacobs','products/7-1.jpg',874.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','physical',0,NULL);
/*!40000 ALTER TABLE `ec_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_referrals`
--

DROP TABLE IF EXISTS `ec_order_referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_referrals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_params` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referral` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gclid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fclid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_campaign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_medium` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_term` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer_url` text COLLATE utf8mb4_unicode_ci,
  `referrer_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_order_referrals_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_referrals`
--

LOCK TABLES `ec_order_referrals` WRITE;
/*!40000 ALTER TABLE `ec_order_referrals` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_referrals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_return_items`
--

DROP TABLE IF EXISTS `ec_order_return_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_return_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_return_id` bigint unsigned NOT NULL COMMENT 'Order return id',
  `order_product_id` bigint unsigned NOT NULL COMMENT 'Order product id',
  `product_id` bigint unsigned NOT NULL COMMENT 'Product id',
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int NOT NULL COMMENT 'Quantity return',
  `price` decimal(15,2) NOT NULL COMMENT 'Price Product',
  `reason` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_amount` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_return_items`
--

LOCK TABLES `ec_order_return_items` WRITE;
/*!40000 ALTER TABLE `ec_order_return_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_return_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_returns`
--

DROP TABLE IF EXISTS `ec_order_returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_returns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL COMMENT 'Order ID',
  `store_id` bigint unsigned DEFAULT NULL COMMENT 'Store ID',
  `user_id` bigint unsigned NOT NULL COMMENT 'Customer ID',
  `reason` text COLLATE utf8mb4_unicode_ci COMMENT 'Reason return order',
  `order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Order current status',
  `return_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Return status',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_order_returns_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_returns`
--

LOCK TABLES `ec_order_returns` WRITE;
/*!40000 ALTER TABLE `ec_order_returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_tax_information`
--

DROP TABLE IF EXISTS `ec_order_tax_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_tax_information` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `company_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_tax_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_order_tax_information_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_tax_information`
--

LOCK TABLES `ec_order_tax_information` WRITE;
/*!40000 ALTER TABLE `ec_order_tax_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_tax_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_orders`
--

DROP TABLE IF EXISTS `ec_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `amount` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `shipping_amount` decimal(15,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `discount_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_finished` tinyint(1) DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `proof_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_orders_code_unique` (`code`),
  KEY `ec_orders_user_id_status_created_at_index` (`user_id`,`status`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_orders`
--

LOCK TABLES `ec_orders` WRITE;
/*!40000 ALTER TABLE `ec_orders` DISABLE KEYS */;
INSERT INTO `ec_orders` VALUES (1,'#10000001',4,'1','default','pending',665.00,0.00,0.00,NULL,NULL,0.00,665.00,1,NULL,1,NULL,'sCKVLYnYRVPZu32dthbkvNnbIUCcP',1,'2024-01-29 10:40:44','2024-01-31 02:40:44',NULL),(2,'#10000002',5,'1','default','pending',1020.00,0.00,0.00,NULL,NULL,0.00,1020.00,1,NULL,1,NULL,'Y31PC8uJl031dr6waG1PDRmmM3xdf',2,'2024-01-15 06:40:44','2024-01-31 02:40:44',NULL),(3,'#10000003',2,'1','default','completed',396.00,0.00,0.00,NULL,NULL,0.00,396.00,1,NULL,1,'2024-01-31 02:40:48','DEEHzpS1tsg9YWvyo1wFAnyqxnv18',3,'2024-01-16 02:40:44','2024-01-31 02:40:48',NULL),(4,'#10000004',1,'1','default','pending',888.00,0.00,0.00,NULL,NULL,0.00,888.00,1,NULL,1,NULL,'U6gDJOwb6MfHhi4cc4CL8s8bX5MaL',4,'2024-01-22 14:40:45','2024-01-31 02:40:45',NULL),(5,'#10000005',3,'1','default','pending',831.00,0.00,0.00,NULL,NULL,0.00,831.00,1,NULL,1,NULL,'AtywSAoVdQYgpTL2cIseejYb0jYoY',5,'2024-01-28 10:40:45','2024-01-31 02:40:45',NULL),(6,'#10000006',8,'1','default','pending',509.00,0.00,0.00,NULL,NULL,0.00,509.00,1,NULL,1,NULL,'KBVlUmwL2bF7EvLPsKB0WTBsBc375',6,'2024-01-23 14:40:45','2024-01-31 02:40:45',NULL),(7,'#10000007',5,'1','default','completed',1436.00,0.00,0.00,NULL,NULL,0.00,1436.00,1,NULL,1,'2024-01-31 02:40:48','gMUO3jRvy1RP1H0GfSo8hucdeHosg',7,'2024-01-29 22:40:45','2024-01-31 02:40:48',NULL),(8,'#10000008',10,'1','default','completed',1771.00,0.00,0.00,NULL,NULL,0.00,1771.00,1,NULL,1,'2024-01-31 02:40:48','2A8F2T7qXzuj7RntaTglnVvCQNAO9',8,'2024-01-30 00:40:45','2024-01-31 02:40:48',NULL),(9,'#10000009',2,'1','default','completed',264.00,0.00,0.00,NULL,NULL,0.00,264.00,1,NULL,1,'2024-01-31 02:40:48','n9gDSAFysPYQwRLxRFjCVLMKimyLb',9,'2024-01-24 02:40:45','2024-01-31 02:40:48',NULL),(10,'#10000010',1,'1','default','pending',336.00,0.00,0.00,NULL,NULL,0.00,336.00,1,NULL,1,NULL,'P9jsYH48ByZP89b6MLVQRG6du3ByC',10,'2024-01-25 14:40:46','2024-01-31 02:40:46',NULL),(11,'#10000011',1,'1','default','pending',857.00,0.00,0.00,NULL,NULL,0.00,857.00,1,NULL,1,NULL,'yvCfJxsiDfMusUK8aIuT5X7Kmb6uA',11,'2024-01-25 06:40:46','2024-01-31 02:40:46',NULL),(12,'#10000012',5,'1','default','pending',1844.00,0.00,0.00,NULL,NULL,0.00,1844.00,1,NULL,1,NULL,'vaVSMg8sXlf9o7cshnaTL0zp4tYFp',12,'2024-01-28 20:40:46','2024-01-31 02:40:46',NULL),(13,'#10000013',8,'1','default','completed',830.00,0.00,0.00,NULL,NULL,0.00,830.00,1,NULL,1,'2024-01-31 02:40:48','dNwxGcNytM2MaO2oFL9AW4Fa8IU3F',13,'2024-01-28 10:40:46','2024-01-31 02:40:48',NULL),(14,'#10000014',6,'1','default','pending',625.00,0.00,0.00,NULL,NULL,0.00,625.00,1,NULL,1,NULL,'3KDWho4RoRg8k4rdVAMNU0jwSApNL',14,'2024-01-26 10:40:46','2024-01-31 02:40:46',NULL),(15,'#10000015',2,'1','default','pending',1292.00,0.00,0.00,NULL,NULL,0.00,1292.00,1,NULL,1,NULL,'Jro16g3Id6XIuMNr2oyFiU345q5Ck',15,'2024-01-28 02:40:47','2024-01-31 02:40:47',NULL),(16,'#10000016',6,'1','default','pending',1261.00,0.00,0.00,NULL,NULL,0.00,1261.00,1,NULL,1,NULL,'ltV4tj3ig8UXJ6IiALozxZKpBV5YM',16,'2024-01-30 16:40:47','2024-01-31 02:40:47',NULL),(17,'#10000017',3,'1','default','completed',1045.00,0.00,0.00,NULL,NULL,0.00,1045.00,1,NULL,1,'2024-01-31 02:40:47','ngBttwyHg8HqDiItvPOibEmwW1vLQ',17,'2024-01-30 10:40:47','2024-01-31 02:40:47',NULL),(18,'#10000018',4,'1','default','completed',975.00,0.00,0.00,NULL,NULL,0.00,975.00,1,NULL,1,'2024-01-31 02:40:48','sBJ5XfRk3JmMClRsRTP2ZMILaWHDa',18,'2024-01-28 14:40:47','2024-01-31 02:40:48',NULL),(19,'#10000019',1,'1','default','completed',1502.00,0.00,0.00,NULL,NULL,0.00,1502.00,1,NULL,1,'2024-01-31 02:40:48','J3xQcqtQSK5aC3gCPm4ZE6lqDV3Z4',19,'2024-01-30 10:40:47','2024-01-31 02:40:48',NULL),(20,'#10000020',2,'1','default','completed',1143.00,0.00,0.00,NULL,NULL,0.00,1143.00,1,NULL,1,'2024-01-31 02:40:48','jfT4X6yynA463isyHhoPo1WejMCXX',20,'2024-01-30 18:40:47','2024-01-31 02:40:48',NULL);
/*!40000 ALTER TABLE `ec_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attribute_sets`
--

DROP TABLE IF EXISTS `ec_product_attribute_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attribute_sets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_layout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'swatch_dropdown',
  `is_searchable` tinyint unsigned NOT NULL DEFAULT '1',
  `is_comparable` tinyint unsigned NOT NULL DEFAULT '1',
  `is_use_in_product_listing` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `use_image_from_product_variation` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attribute_sets`
--

LOCK TABLES `ec_product_attribute_sets` WRITE;
/*!40000 ALTER TABLE `ec_product_attribute_sets` DISABLE KEYS */;
INSERT INTO `ec_product_attribute_sets` VALUES (1,'Color','color','visual',1,1,1,'published',0,'2024-01-31 02:40:39','2024-01-31 02:40:39',1),(2,'Size','size','text',1,1,1,'published',1,'2024-01-31 02:40:39','2024-01-31 02:40:39',0);
/*!40000 ALTER TABLE `ec_product_attribute_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attribute_sets_translations`
--

DROP TABLE IF EXISTS `ec_product_attribute_sets_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attribute_sets_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attribute_sets_id` bigint unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_attribute_sets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attribute_sets_translations`
--

LOCK TABLES `ec_product_attribute_sets_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_attribute_sets_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_attribute_sets_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attributes`
--

DROP TABLE IF EXISTS `ec_product_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` bigint unsigned NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_set_status_index` (`attribute_set_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attributes`
--

LOCK TABLES `ec_product_attributes` WRITE;
/*!40000 ALTER TABLE `ec_product_attributes` DISABLE KEYS */;
INSERT INTO `ec_product_attributes` VALUES (1,1,'Green','green','#5FB7D4',NULL,1,1,'2024-01-31 02:40:39','2024-01-31 02:40:39'),(2,1,'Blue','blue','#333333',NULL,0,2,'2024-01-31 02:40:39','2024-01-31 02:40:39'),(3,1,'Red','red','#DA323F',NULL,0,3,'2024-01-31 02:40:39','2024-01-31 02:40:39'),(4,1,'Black','black','#2F366C',NULL,0,4,'2024-01-31 02:40:39','2024-01-31 02:40:39'),(5,1,'Brown','brown','#87554B',NULL,0,5,'2024-01-31 02:40:39','2024-01-31 02:40:39'),(6,2,'S','s',NULL,NULL,1,1,'2024-01-31 02:40:39','2024-01-31 02:40:39'),(7,2,'M','m',NULL,NULL,0,2,'2024-01-31 02:40:39','2024-01-31 02:40:39'),(8,2,'L','l',NULL,NULL,0,3,'2024-01-31 02:40:39','2024-01-31 02:40:39'),(9,2,'XL','xl',NULL,NULL,0,4,'2024-01-31 02:40:39','2024-01-31 02:40:39'),(10,2,'XXL','xxl',NULL,NULL,0,5,'2024-01-31 02:40:39','2024-01-31 02:40:39');
/*!40000 ALTER TABLE `ec_product_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attributes_translations`
--

DROP TABLE IF EXISTS `ec_product_attributes_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attributes_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attributes_id` bigint unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_attributes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attributes_translations`
--

LOCK TABLES `ec_product_attributes_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_attributes_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_attributes_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categories`
--

DROP TABLE IF EXISTS `ec_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_categories_parent_id_status_created_at_index` (`parent_id`,`status`,`created_at`),
  KEY `ec_product_categories_parent_id_status_index` (`parent_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories`
--

LOCK TABLES `ec_product_categories` WRITE;
/*!40000 ALTER TABLE `ec_product_categories` DISABLE KEYS */;
INSERT INTO `ec_product_categories` VALUES (1,'Office bags',0,NULL,'published',1,'product-categories/1.png',1,'2024-01-31 02:40:38','2024-01-31 02:40:38',NULL,NULL),(2,'Hand bag',0,NULL,'published',2,'product-categories/2.png',1,'2024-01-31 02:40:38','2024-01-31 02:40:38',NULL,NULL),(3,'Woman',0,NULL,'published',3,'product-categories/3.png',1,'2024-01-31 02:40:38','2024-01-31 02:40:38',NULL,NULL),(4,'Woman wallet',3,NULL,'published',1,NULL,0,'2024-01-31 02:40:38','2024-01-31 02:40:38',NULL,NULL),(5,'Denim',3,NULL,'published',2,NULL,0,'2024-01-31 02:40:38','2024-01-31 02:40:38',NULL,NULL),(6,'Dress',3,NULL,'published',3,NULL,0,'2024-01-31 02:40:38','2024-01-31 02:40:38',NULL,NULL),(7,'Backpack',0,NULL,'published',4,'product-categories/4.png',1,'2024-01-31 02:40:38','2024-01-31 02:40:38',NULL,NULL),(8,'Bags',0,NULL,'published',5,'product-categories/5.png',1,'2024-01-31 02:40:38','2024-01-31 02:40:38',NULL,NULL),(9,'Wallet',0,NULL,'published',6,'product-categories/6.png',1,'2024-01-31 02:40:38','2024-01-31 02:40:38',NULL,NULL),(10,'Men',0,NULL,'published',7,'product-categories/7.png',1,'2024-01-31 02:40:38','2024-01-31 02:40:38',NULL,NULL),(11,'Accessories',10,NULL,'published',1,NULL,0,'2024-01-31 02:40:38','2024-01-31 02:40:38',NULL,NULL),(12,'Men wallet',10,NULL,'published',2,NULL,0,'2024-01-31 02:40:38','2024-01-31 02:40:38',NULL,NULL),(13,'Shoes',10,NULL,'published',3,NULL,0,'2024-01-31 02:40:38','2024-01-31 02:40:38',NULL,NULL);
/*!40000 ALTER TABLE `ec_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categories_translations`
--

DROP TABLE IF EXISTS `ec_product_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_product_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories_translations`
--

LOCK TABLES `ec_product_categories_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categorizables`
--

DROP TABLE IF EXISTS `ec_product_categorizables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categorizables` (
  `category_id` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`,`reference_id`,`reference_type`),
  KEY `ec_product_categorizables_category_id_index` (`category_id`),
  KEY `ec_product_categorizables_reference_id_index` (`reference_id`),
  KEY `ec_product_categorizables_reference_type_index` (`reference_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categorizables`
--

LOCK TABLES `ec_product_categorizables` WRITE;
/*!40000 ALTER TABLE `ec_product_categorizables` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_categorizables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_category_product`
--

DROP TABLE IF EXISTS `ec_product_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_category_product` (
  `category_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `ec_product_category_product_category_id_index` (`category_id`),
  KEY `ec_product_category_product_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_category_product`
--

LOCK TABLES `ec_product_category_product` WRITE;
/*!40000 ALTER TABLE `ec_product_category_product` DISABLE KEYS */;
INSERT INTO `ec_product_category_product` VALUES (2,1),(4,5),(6,4),(10,2),(13,8),(14,3),(14,6),(14,7);
/*!40000 ALTER TABLE `ec_product_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collection_products`
--

DROP TABLE IF EXISTS `ec_product_collection_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collection_products` (
  `product_collection_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`product_collection_id`),
  KEY `ec_product_collection_products_product_collection_id_index` (`product_collection_id`),
  KEY `ec_product_collection_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collection_products`
--

LOCK TABLES `ec_product_collection_products` WRITE;
/*!40000 ALTER TABLE `ec_product_collection_products` DISABLE KEYS */;
INSERT INTO `ec_product_collection_products` VALUES (1,1),(1,2),(1,7),(2,4),(2,8),(3,3),(3,5),(3,6);
/*!40000 ALTER TABLE `ec_product_collection_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collections`
--

DROP TABLE IF EXISTS `ec_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collections`
--

LOCK TABLES `ec_product_collections` WRITE;
/*!40000 ALTER TABLE `ec_product_collections` DISABLE KEYS */;
INSERT INTO `ec_product_collections` VALUES (1,'New Arrival','new-arrival',NULL,'product-collections/1.jpg','published','2024-01-31 02:40:39','2024-01-31 02:40:39',1),(2,'Best Sellers','best-sellers',NULL,'product-collections/2.jpg','published','2024-01-31 02:40:39','2024-01-31 02:40:39',1),(3,'Special Offer','special-offer',NULL,'product-collections/3.jpg','published','2024-01-31 02:40:39','2024-01-31 02:40:39',1),(4,'Trending Fashion','trending-fashion',NULL,'product-collections/4.jpg','published','2024-01-31 02:40:39','2024-01-31 02:40:39',1);
/*!40000 ALTER TABLE `ec_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collections_translations`
--

DROP TABLE IF EXISTS `ec_product_collections_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collections_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_collections_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_collections_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collections_translations`
--

LOCK TABLES `ec_product_collections_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_collections_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_collections_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_cross_sale_relations`
--

DROP TABLE IF EXISTS `ec_product_cross_sale_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_cross_sale_relations` (
  `from_product_id` bigint unsigned NOT NULL,
  `to_product_id` bigint unsigned NOT NULL,
  `is_variant` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(15,2) DEFAULT '0.00',
  `price_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `apply_to_all_variations` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`from_product_id`,`to_product_id`),
  KEY `ec_product_cross_sale_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_cross_sale_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_cross_sale_relations`
--

LOCK TABLES `ec_product_cross_sale_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_cross_sale_relations` DISABLE KEYS */;
INSERT INTO `ec_product_cross_sale_relations` VALUES (1,2,0,0.00,'fixed',1),(1,4,0,0.00,'fixed',1),(1,7,0,0.00,'fixed',1),(2,1,0,0.00,'fixed',1),(2,4,0,0.00,'fixed',1),(2,5,0,0.00,'fixed',1),(3,5,0,0.00,'fixed',1),(3,7,0,0.00,'fixed',1),(4,3,0,0.00,'fixed',1),(4,5,0,0.00,'fixed',1),(4,6,0,0.00,'fixed',1),(4,7,0,0.00,'fixed',1),(5,1,0,0.00,'fixed',1),(5,2,0,0.00,'fixed',1),(5,3,0,0.00,'fixed',1),(6,2,0,0.00,'fixed',1),(6,7,0,0.00,'fixed',1),(7,1,0,0.00,'fixed',1),(7,2,0,0.00,'fixed',1),(7,3,0,0.00,'fixed',1),(7,4,0,0.00,'fixed',1),(8,2,0,0.00,'fixed',1),(8,4,0,0.00,'fixed',1),(8,5,0,0.00,'fixed',1);
/*!40000 ALTER TABLE `ec_product_cross_sale_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_files`
--

DROP TABLE IF EXISTS `ec_product_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned DEFAULT NULL,
  `url` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extras` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_files_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_files`
--

LOCK TABLES `ec_product_files` WRITE;
/*!40000 ALTER TABLE `ec_product_files` DISABLE KEYS */;
INSERT INTO `ec_product_files` VALUES (1,9,'product-files/1.jpg','{\"filename\":\"1.jpg\",\"url\":\"product-files\\/1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-31 09:40:40\",\"name\":\"1\",\"extension\":\"jpg\"}','2024-01-31 02:40:40','2024-01-31 02:40:40'),(2,9,'product-files/1-1.jpg','{\"filename\":\"1-1.jpg\",\"url\":\"product-files\\/1-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-31 09:40:40\",\"name\":\"1-1\",\"extension\":\"jpg\"}','2024-01-31 02:40:40','2024-01-31 02:40:40'),(3,10,'product-files/1.jpg','{\"filename\":\"1.jpg\",\"url\":\"product-files\\/1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-31 09:40:40\",\"name\":\"1\",\"extension\":\"jpg\"}','2024-01-31 02:40:40','2024-01-31 02:40:40'),(4,10,'product-files/1-1.jpg','{\"filename\":\"1-1.jpg\",\"url\":\"product-files\\/1-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-31 09:40:40\",\"name\":\"1-1\",\"extension\":\"jpg\"}','2024-01-31 02:40:40','2024-01-31 02:40:40'),(5,20,'product-files/5.jpg','{\"filename\":\"5.jpg\",\"url\":\"product-files\\/5.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-31 09:40:41\",\"name\":\"5\",\"extension\":\"jpg\"}','2024-01-31 02:40:41','2024-01-31 02:40:41'),(6,20,'product-files/5-1.jpg','{\"filename\":\"5-1.jpg\",\"url\":\"product-files\\/5-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-31 09:40:41\",\"name\":\"5-1\",\"extension\":\"jpg\"}','2024-01-31 02:40:41','2024-01-31 02:40:41'),(7,20,'product-files/5-2.jpg','{\"filename\":\"5-2.jpg\",\"url\":\"product-files\\/5-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-31 09:40:41\",\"name\":\"5-2\",\"extension\":\"jpg\"}','2024-01-31 02:40:41','2024-01-31 02:40:41'),(8,21,'product-files/5.jpg','{\"filename\":\"5.jpg\",\"url\":\"product-files\\/5.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-31 09:40:41\",\"name\":\"5\",\"extension\":\"jpg\"}','2024-01-31 02:40:41','2024-01-31 02:40:41'),(9,21,'product-files/5-1.jpg','{\"filename\":\"5-1.jpg\",\"url\":\"product-files\\/5-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-31 09:40:41\",\"name\":\"5-1\",\"extension\":\"jpg\"}','2024-01-31 02:40:41','2024-01-31 02:40:41'),(10,21,'product-files/5-2.jpg','{\"filename\":\"5-2.jpg\",\"url\":\"product-files\\/5-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-31 09:40:41\",\"name\":\"5-2\",\"extension\":\"jpg\"}','2024-01-31 02:40:41','2024-01-31 02:40:41');
/*!40000 ALTER TABLE `ec_product_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_label_products`
--

DROP TABLE IF EXISTS `ec_product_label_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_label_products` (
  `product_label_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_label_id`,`product_id`),
  KEY `ec_product_label_products_product_label_id_index` (`product_label_id`),
  KEY `ec_product_label_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_label_products`
--

LOCK TABLES `ec_product_label_products` WRITE;
/*!40000 ALTER TABLE `ec_product_label_products` DISABLE KEYS */;
INSERT INTO `ec_product_label_products` VALUES (1,7);
/*!40000 ALTER TABLE `ec_product_label_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_labels`
--

DROP TABLE IF EXISTS `ec_product_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_labels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_labels`
--

LOCK TABLES `ec_product_labels` WRITE;
/*!40000 ALTER TABLE `ec_product_labels` DISABLE KEYS */;
INSERT INTO `ec_product_labels` VALUES (1,'Hot','#ec2434','published','2024-01-31 02:40:39','2024-01-31 02:40:39'),(2,'New','#00c9a7','published','2024-01-31 02:40:39','2024-01-31 02:40:39'),(3,'Sale','#fe9931','published','2024-01-31 02:40:39','2024-01-31 02:40:39');
/*!40000 ALTER TABLE `ec_product_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_labels_translations`
--

DROP TABLE IF EXISTS `ec_product_labels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_labels_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_labels_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_labels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_labels_translations`
--

LOCK TABLES `ec_product_labels_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_labels_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_labels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_related_relations`
--

DROP TABLE IF EXISTS `ec_product_related_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_related_relations` (
  `from_product_id` bigint unsigned NOT NULL,
  `to_product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`from_product_id`,`to_product_id`),
  KEY `ec_product_related_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_related_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_related_relations`
--

LOCK TABLES `ec_product_related_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_related_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_related_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tag_product`
--

DROP TABLE IF EXISTS `ec_product_tag_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tag_product` (
  `product_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`tag_id`),
  KEY `ec_product_tag_product_product_id_index` (`product_id`),
  KEY `ec_product_tag_product_tag_id_index` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tag_product`
--

LOCK TABLES `ec_product_tag_product` WRITE;
/*!40000 ALTER TABLE `ec_product_tag_product` DISABLE KEYS */;
INSERT INTO `ec_product_tag_product` VALUES (1,2),(1,4),(2,1),(2,2),(3,1),(3,4),(3,5),(4,2),(4,4),(5,1),(5,3),(5,5),(6,3),(6,4),(6,6),(7,2),(7,3),(7,4),(8,2),(8,6);
/*!40000 ALTER TABLE `ec_product_tag_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tags`
--

DROP TABLE IF EXISTS `ec_product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tags`
--

LOCK TABLES `ec_product_tags` WRITE;
/*!40000 ALTER TABLE `ec_product_tags` DISABLE KEYS */;
INSERT INTO `ec_product_tags` VALUES (1,'Wallet',NULL,'published','2024-01-31 02:40:39','2024-01-31 02:40:39'),(2,'Bags',NULL,'published','2024-01-31 02:40:39','2024-01-31 02:40:39'),(3,'Shoes',NULL,'published','2024-01-31 02:40:39','2024-01-31 02:40:39'),(4,'Clothes',NULL,'published','2024-01-31 02:40:39','2024-01-31 02:40:39'),(5,'Hand bag',NULL,'published','2024-01-31 02:40:39','2024-01-31 02:40:39');
/*!40000 ALTER TABLE `ec_product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tags_translations`
--

DROP TABLE IF EXISTS `ec_product_tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tags_translations`
--

LOCK TABLES `ec_product_tags_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_up_sale_relations`
--

DROP TABLE IF EXISTS `ec_product_up_sale_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_up_sale_relations` (
  `from_product_id` bigint unsigned NOT NULL,
  `to_product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`from_product_id`,`to_product_id`),
  KEY `ec_product_up_sale_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_up_sale_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_up_sale_relations`
--

LOCK TABLES `ec_product_up_sale_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_up_sale_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_up_sale_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_variation_items`
--

DROP TABLE IF EXISTS `ec_product_variation_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_variation_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` bigint unsigned NOT NULL,
  `variation_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_variation_index` (`attribute_id`,`variation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variation_items`
--

LOCK TABLES `ec_product_variation_items` WRITE;
/*!40000 ALTER TABLE `ec_product_variation_items` DISABLE KEYS */;
INSERT INTO `ec_product_variation_items` VALUES (3,1,2),(7,1,4),(9,1,5),(17,1,9),(25,1,13),(33,1,17),(37,1,19),(43,1,22),(27,2,14),(11,3,6),(13,3,7),(15,3,8),(19,3,10),(39,3,20),(41,3,21),(1,4,1),(5,4,3),(23,4,12),(31,4,16),(21,5,11),(29,5,15),(35,5,18),(4,6,2),(14,6,7),(18,6,9),(22,6,11),(26,6,13),(32,6,16),(40,6,20),(44,7,22),(6,8,3),(8,8,4),(20,8,10),(12,9,6),(16,9,8),(24,9,12),(30,9,15),(34,9,17),(36,9,18),(38,9,19),(2,10,1),(10,10,5),(28,10,14),(42,10,21);
/*!40000 ALTER TABLE `ec_product_variation_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_variations`
--

DROP TABLE IF EXISTS `ec_product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_variations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned DEFAULT NULL,
  `configurable_product_id` bigint unsigned NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_product_variations_product_id_configurable_product_id_unique` (`product_id`,`configurable_product_id`),
  KEY `configurable_product_index` (`product_id`,`configurable_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variations`
--

LOCK TABLES `ec_product_variations` WRITE;
/*!40000 ALTER TABLE `ec_product_variations` DISABLE KEYS */;
INSERT INTO `ec_product_variations` VALUES (1,9,1,1),(2,10,1,0),(3,11,2,1),(4,12,2,0),(5,13,2,0),(6,14,3,1),(7,15,3,0),(8,16,3,0),(9,17,4,1),(10,18,4,0),(11,19,4,0),(12,20,5,1),(13,21,5,0),(14,22,6,1),(15,23,6,0),(16,24,6,0),(17,25,6,0),(18,26,7,1),(19,27,7,0),(20,28,7,0),(21,29,8,1),(22,30,8,0);
/*!40000 ALTER TABLE `ec_product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_views`
--

DROP TABLE IF EXISTS `ec_product_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_views` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `views` int NOT NULL DEFAULT '1',
  `date` date NOT NULL DEFAULT '2024-01-31',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_product_views_product_id_date_unique` (`product_id`,`date`),
  KEY `ec_product_views_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_views`
--

LOCK TABLES `ec_product_views` WRITE;
/*!40000 ALTER TABLE `ec_product_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_with_attribute_set`
--

DROP TABLE IF EXISTS `ec_product_with_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_with_attribute_set` (
  `attribute_set_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`attribute_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_with_attribute_set`
--

LOCK TABLES `ec_product_with_attribute_set` WRITE;
/*!40000 ALTER TABLE `ec_product_with_attribute_set` DISABLE KEYS */;
INSERT INTO `ec_product_with_attribute_set` VALUES (1,1,0),(2,1,0),(1,2,0),(2,2,0),(1,3,0),(2,3,0),(1,4,0),(2,4,0),(1,5,0),(2,5,0),(1,6,0),(2,6,0),(1,7,0),(2,7,0),(1,8,0),(2,8,0);
/*!40000 ALTER TABLE `ec_product_with_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products`
--

DROP TABLE IF EXISTS `ec_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `images` text COLLATE utf8mb4_unicode_ci,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `quantity` int unsigned DEFAULT NULL,
  `allow_checkout_when_out_of_stock` tinyint unsigned NOT NULL DEFAULT '0',
  `with_storehouse_management` tinyint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `brand_id` bigint unsigned DEFAULT NULL,
  `is_variation` tinyint NOT NULL DEFAULT '0',
  `sale_type` tinyint NOT NULL DEFAULT '0',
  `price` double unsigned DEFAULT NULL,
  `sale_price` double unsigned DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `length` double(8,2) DEFAULT NULL,
  `wide` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `weight` double(8,2) DEFAULT NULL,
  `tax_id` bigint unsigned DEFAULT NULL,
  `views` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stock_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'in_stock',
  `created_by_id` bigint unsigned DEFAULT '0',
  `created_by_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'physical',
  `barcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost_per_item` double DEFAULT NULL,
  `generate_license_code` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ec_products_brand_id_status_is_variation_created_at_index` (`brand_id`,`status`,`is_variation`,`created_at`),
  KEY `sale_type_index` (`sale_type`),
  KEY `start_date_index` (`start_date`),
  KEY `end_date_index` (`end_date`),
  KEY `sale_price_index` (`sale_price`),
  KEY `is_variation_index` (`is_variation`),
  KEY `ec_products_sku_index` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products`
--

LOCK TABLES `ec_products` WRITE;
/*!40000 ALTER TABLE `ec_products` DISABLE KEYS */;
INSERT INTO `ec_products` VALUES (1,'Wallet handmade','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/1.jpg\",\"products\\/1-1.jpg\"]','HS-199-A0',0,16,0,1,1,1,0,0,285,NULL,NULL,NULL,14.00,15.00,10.00,562.00,NULL,85180,'2024-01-31 02:40:40','2024-01-31 02:40:40','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0),(2,'Clutch handmade','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/2.jpg\",\"products\\/2-1.jpg\",\"products\\/2-2.jpg\",\"products\\/2-3.jpg\"]','HS-130-A0',0,17,0,1,1,7,0,0,461,NULL,NULL,NULL,16.00,19.00,20.00,592.00,NULL,192712,'2024-01-31 02:40:40','2024-01-31 02:40:40','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(3,'Gucci Zip Around Wallet','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/3.jpg\",\"products\\/3-1.jpg\",\"products\\/3-2.jpg\",\"products\\/3-3.jpg\"]','HS-153-A0',0,20,0,1,1,4,0,0,202,NULL,NULL,NULL,10.00,17.00,13.00,717.00,NULL,98531,'2024-01-31 02:40:40','2024-01-31 02:40:40','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(4,'Snapshot Standard','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/4.jpg\",\"products\\/4-1.jpg\",\"products\\/4-2.jpg\"]','HS-152-A0',0,13,0,1,1,7,0,0,243,172.53,NULL,NULL,12.00,19.00,13.00,744.00,NULL,145737,'2024-01-31 02:40:40','2024-01-31 02:40:40','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(5,'Joan Mini Camera Bag','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/5.jpg\",\"products\\/5-1.jpg\",\"products\\/5-2.jpg\"]','HS-157-A0',0,10,0,1,1,3,0,0,89,NULL,NULL,NULL,18.00,19.00,13.00,831.00,NULL,8090,'2024-01-31 02:40:40','2024-01-31 02:40:40','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0),(6,'Cyan Boheme','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/6.jpg\",\"products\\/6-1.jpg\"]','HS-118-A0',0,12,0,1,1,5,0,0,43,NULL,NULL,NULL,20.00,17.00,15.00,645.00,NULL,68982,'2024-01-31 02:40:40','2024-01-31 02:40:41','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(7,'The Marc Jacobs','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/7.jpg\",\"products\\/7-1.jpg\",\"products\\/7-2.jpg\"]','HS-138-A0',0,17,0,1,1,1,0,0,51,NULL,NULL,NULL,19.00,11.00,12.00,874.00,NULL,32785,'2024-01-31 02:40:40','2024-01-31 02:40:41','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(8,'Round Cross body Bag','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/8.jpg\"]','HS-175-A0',0,16,0,1,1,1,0,0,121,102.85,NULL,NULL,11.00,13.00,13.00,684.00,NULL,150481,'2024-01-31 02:40:40','2024-01-31 02:40:41','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(9,'Wallet handmade',NULL,NULL,'published','[\"products\\/1.jpg\"]','HS-199-A0',0,16,0,1,0,1,1,0,285,NULL,NULL,NULL,14.00,15.00,10.00,562.00,NULL,0,'2024-01-31 02:40:40','2024-01-31 02:40:40','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0),(10,'Wallet handmade',NULL,NULL,'published','[\"products\\/1-1.jpg\"]','HS-199-A0-A1',0,16,0,1,0,1,1,0,285,NULL,NULL,NULL,14.00,15.00,10.00,562.00,NULL,0,'2024-01-31 02:40:40','2024-01-31 02:40:40','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0),(11,'Clutch handmade',NULL,NULL,'published','[\"products\\/2.jpg\"]','HS-130-A0',0,17,0,1,0,7,1,0,461,NULL,NULL,NULL,16.00,19.00,20.00,592.00,NULL,0,'2024-01-31 02:40:40','2024-01-31 02:40:40','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(12,'Clutch handmade',NULL,NULL,'published','[\"products\\/2-1.jpg\"]','HS-130-A0-A1',0,17,0,1,0,7,1,0,461,NULL,NULL,NULL,16.00,19.00,20.00,592.00,NULL,0,'2024-01-31 02:40:40','2024-01-31 02:40:40','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(13,'Clutch handmade',NULL,NULL,'published','[\"products\\/2-2.jpg\"]','HS-130-A0-A2',0,17,0,1,0,7,1,0,461,NULL,NULL,NULL,16.00,19.00,20.00,592.00,NULL,0,'2024-01-31 02:40:40','2024-01-31 02:40:40','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(14,'Gucci Zip Around Wallet',NULL,NULL,'published','[\"products\\/3.jpg\"]','HS-153-A0',0,20,0,1,0,4,1,0,202,NULL,NULL,NULL,10.00,17.00,13.00,717.00,NULL,0,'2024-01-31 02:40:40','2024-01-31 02:40:40','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(15,'Gucci Zip Around Wallet',NULL,NULL,'published','[\"products\\/3-1.jpg\"]','HS-153-A0-A1',0,20,0,1,0,4,1,0,202,NULL,NULL,NULL,10.00,17.00,13.00,717.00,NULL,0,'2024-01-31 02:40:40','2024-01-31 02:40:40','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(16,'Gucci Zip Around Wallet',NULL,NULL,'published','[\"products\\/3-2.jpg\"]','HS-153-A0-A2',0,20,0,1,0,4,1,0,202,NULL,NULL,NULL,10.00,17.00,13.00,717.00,NULL,0,'2024-01-31 02:40:40','2024-01-31 02:40:40','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(17,'Snapshot Standard',NULL,NULL,'published','[\"products\\/4.jpg\"]','HS-152-A0',0,13,0,1,0,7,1,0,243,172.53,NULL,NULL,12.00,19.00,13.00,744.00,NULL,0,'2024-01-31 02:40:40','2024-01-31 02:40:40','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(18,'Snapshot Standard',NULL,NULL,'published','[\"products\\/4-1.jpg\"]','HS-152-A0-A1',0,13,0,1,0,7,1,0,243,189.54,NULL,NULL,12.00,19.00,13.00,744.00,NULL,0,'2024-01-31 02:40:40','2024-01-31 02:40:40','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(19,'Snapshot Standard',NULL,NULL,'published','[\"products\\/4-2.jpg\"]','HS-152-A0-A2',0,13,0,1,0,7,1,0,243,196.83,NULL,NULL,12.00,19.00,13.00,744.00,NULL,0,'2024-01-31 02:40:40','2024-01-31 02:40:40','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(20,'Joan Mini Camera Bag',NULL,NULL,'published','[\"products\\/5.jpg\"]','HS-157-A0',0,10,0,1,0,3,1,0,89,NULL,NULL,NULL,18.00,19.00,13.00,831.00,NULL,0,'2024-01-31 02:40:40','2024-01-31 02:40:41','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0),(21,'Joan Mini Camera Bag',NULL,NULL,'published','[\"products\\/5-1.jpg\"]','HS-157-A0-A1',0,10,0,1,0,3,1,0,89,NULL,NULL,NULL,18.00,19.00,13.00,831.00,NULL,0,'2024-01-31 02:40:41','2024-01-31 02:40:41','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0),(22,'Cyan Boheme',NULL,NULL,'published','[\"products\\/6.jpg\"]','HS-118-A0',0,12,0,1,0,5,1,0,43,NULL,NULL,NULL,20.00,17.00,15.00,645.00,NULL,0,'2024-01-31 02:40:41','2024-01-31 02:40:41','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(23,'Cyan Boheme',NULL,NULL,'published','[\"products\\/6-1.jpg\"]','HS-118-A0-A1',0,12,0,1,0,5,1,0,43,NULL,NULL,NULL,20.00,17.00,15.00,645.00,NULL,0,'2024-01-31 02:40:41','2024-01-31 02:40:41','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(24,'Cyan Boheme',NULL,NULL,'published','[\"products\\/6.jpg\"]','HS-118-A0-A2',0,12,0,1,0,5,1,0,43,NULL,NULL,NULL,20.00,17.00,15.00,645.00,NULL,0,'2024-01-31 02:40:41','2024-01-31 02:40:41','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(25,'Cyan Boheme',NULL,NULL,'published','[\"products\\/6.jpg\"]','HS-118-A0-A3',0,12,0,1,0,5,1,0,43,NULL,NULL,NULL,20.00,17.00,15.00,645.00,NULL,0,'2024-01-31 02:40:41','2024-01-31 02:40:41','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(26,'The Marc Jacobs',NULL,NULL,'published','[\"products\\/7.jpg\"]','HS-138-A0',0,17,0,1,0,1,1,0,51,NULL,NULL,NULL,19.00,11.00,12.00,874.00,NULL,0,'2024-01-31 02:40:41','2024-01-31 02:40:41','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(27,'The Marc Jacobs',NULL,NULL,'published','[\"products\\/7-1.jpg\"]','HS-138-A0-A1',0,17,0,1,0,1,1,0,51,NULL,NULL,NULL,19.00,11.00,12.00,874.00,NULL,0,'2024-01-31 02:40:41','2024-01-31 02:40:41','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(28,'The Marc Jacobs',NULL,NULL,'published','[\"products\\/7-2.jpg\"]','HS-138-A0-A2',0,17,0,1,0,1,1,0,51,NULL,NULL,NULL,19.00,11.00,12.00,874.00,NULL,0,'2024-01-31 02:40:41','2024-01-31 02:40:41','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(29,'Round Cross body Bag',NULL,NULL,'published','[\"products\\/8.jpg\"]','HS-175-A0',0,16,0,1,0,1,1,0,121,102.85,NULL,NULL,11.00,13.00,13.00,684.00,NULL,0,'2024-01-31 02:40:41','2024-01-31 02:40:41','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0),(30,'Round Cross body Bag',NULL,NULL,'published','[\"products\\/8.jpg\"]','HS-175-A0-A1',0,16,0,1,0,1,1,0,121,85.91,NULL,NULL,11.00,13.00,13.00,684.00,NULL,0,'2024-01-31 02:40:41','2024-01-31 02:40:41','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0);
/*!40000 ALTER TABLE `ec_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products_translations`
--

DROP TABLE IF EXISTS `ec_products_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_products_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_products_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products_translations`
--

LOCK TABLES `ec_products_translations` WRITE;
/*!40000 ALTER TABLE `ec_products_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_products_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_review_replies`
--

DROP TABLE IF EXISTS `ec_review_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_review_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `review_id` bigint unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_review_replies_review_id_user_id_unique` (`review_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_review_replies`
--

LOCK TABLES `ec_review_replies` WRITE;
/*!40000 ALTER TABLE `ec_review_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_review_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_reviews`
--

DROP TABLE IF EXISTS `ec_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `star` double(8,2) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_reviews_product_id_customer_id_unique` (`product_id`,`customer_id`),
  KEY `ec_reviews_product_id_customer_id_status_created_at_index` (`product_id`,`customer_id`,`status`,`created_at`),
  KEY `review_relation_index` (`product_id`,`customer_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_reviews`
--

LOCK TABLES `ec_reviews` WRITE;
/*!40000 ALTER TABLE `ec_reviews` DISABLE KEYS */;
INSERT INTO `ec_reviews` VALUES (1,6,7,4.00,'Clean & perfect source code','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2-1.jpg\",\"products\\/2-3.jpg\",\"products\\/7-1.jpg\",\"products\\/7.jpg\"]'),(2,1,6,1.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/4.jpg\"]'),(3,7,4,4.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/3-1.jpg\",\"products\\/6-1.jpg\",\"products\\/6.jpg\",\"products\\/7-2.jpg\"]'),(4,2,6,4.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/6-1.jpg\",\"products\\/7.jpg\"]'),(5,4,6,2.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/10-1.jpg\"]'),(6,7,5,3.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/1-1.jpg\",\"products\\/2.jpg\"]'),(7,2,2,4.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/4.jpg\",\"products\\/10.jpg\",\"products\\/11.jpg\"]'),(8,8,7,4.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/8.jpg\"]'),(10,1,1,2.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/4-1.jpg\",\"products\\/6-1.jpg\",\"products\\/7-1.jpg\"]'),(11,2,8,3.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/1-1.jpg\",\"products\\/6.jpg\",\"products\\/10-2.jpg\"]'),(12,5,8,1.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/1-1.jpg\",\"products\\/3.jpg\",\"products\\/5-2.jpg\",\"products\\/7-2.jpg\"]'),(13,4,7,3.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/1-1.jpg\",\"products\\/3-1.jpg\",\"products\\/3.jpg\",\"products\\/7-2.jpg\"]'),(14,7,8,5.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/3.jpg\",\"products\\/6.jpg\",\"products\\/11.jpg\"]'),(15,10,4,3.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/10.jpg\"]'),(16,1,2,1.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/1-1.jpg\",\"products\\/3-3.jpg\",\"products\\/4-2.jpg\",\"products\\/10-2.jpg\"]'),(17,1,8,2.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/7-1.jpg\"]'),(18,8,8,4.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/4.jpg\"]'),(19,2,3,2.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/10.jpg\"]'),(20,10,7,4.00,'Clean & perfect source code','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/4-1.jpg\",\"products\\/5-2.jpg\",\"products\\/5.jpg\"]'),(22,9,2,2.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2-2.jpg\",\"products\\/3-1.jpg\",\"products\\/6-1.jpg\",\"products\\/7-2.jpg\"]'),(23,5,3,3.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/10.jpg\"]'),(24,3,1,1.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2.jpg\",\"products\\/6-1.jpg\",\"products\\/10.jpg\"]'),(25,6,3,5.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/3-3.jpg\",\"products\\/6-1.jpg\",\"products\\/6.jpg\"]'),(28,5,1,1.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/3-1.jpg\",\"products\\/8.jpg\",\"products\\/10-2.jpg\"]'),(29,9,6,2.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/3-2.jpg\",\"products\\/4-2.jpg\",\"products\\/5-1.jpg\",\"products\\/7.jpg\"]'),(31,10,2,3.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2-3.jpg\",\"products\\/10-1.jpg\"]'),(33,3,2,5.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2.jpg\",\"products\\/10-1.jpg\"]'),(34,8,4,2.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/7-2.jpg\"]'),(35,10,8,3.00,'Clean & perfect source code','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2.jpg\",\"products\\/10-1.jpg\"]'),(36,6,8,3.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/7-1.jpg\",\"products\\/11.jpg\"]'),(40,9,7,1.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2-3.jpg\",\"products\\/4-1.jpg\"]'),(43,9,5,3.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2-3.jpg\",\"products\\/4-1.jpg\",\"products\\/7-2.jpg\",\"products\\/10-2.jpg\"]'),(44,4,2,3.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/1-1.jpg\",\"products\\/2.jpg\",\"products\\/6-1.jpg\"]'),(46,8,5,3.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/1-1.jpg\",\"products\\/3.jpg\",\"products\\/10-2.jpg\",\"products\\/11.jpg\"]'),(47,7,2,4.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/3-2.jpg\",\"products\\/3.jpg\"]'),(49,10,6,1.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2-3.jpg\",\"products\\/3.jpg\",\"products\\/4-2.jpg\",\"products\\/7.jpg\"]'),(50,5,2,3.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/4.jpg\",\"products\\/7.jpg\",\"products\\/9.jpg\",\"products\\/10-2.jpg\"]'),(51,6,1,1.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2.jpg\",\"products\\/3-2.jpg\",\"products\\/4.jpg\",\"products\\/7-1.jpg\"]'),(54,4,1,2.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/9.jpg\",\"products\\/11.jpg\"]'),(55,7,6,5.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2-2.jpg\",\"products\\/5.jpg\",\"products\\/7-1.jpg\",\"products\\/11.jpg\"]'),(56,1,3,5.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/4-1.jpg\",\"products\\/6-1.jpg\",\"products\\/10.jpg\"]'),(57,9,4,1.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/5-1.jpg\",\"products\\/7-1.jpg\",\"products\\/10-1.jpg\",\"products\\/10.jpg\"]'),(58,7,7,5.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/3-3.jpg\",\"products\\/7-1.jpg\",\"products\\/7-2.jpg\",\"products\\/11.jpg\"]'),(60,1,5,4.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2-3.jpg\",\"products\\/3-3.jpg\",\"products\\/4.jpg\",\"products\\/10-2.jpg\"]'),(62,4,4,3.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/3-3.jpg\",\"products\\/4.jpg\",\"products\\/7.jpg\"]'),(63,6,4,2.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/1-1.jpg\",\"products\\/5-1.jpg\",\"products\\/7-1.jpg\"]'),(64,9,3,3.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2-1.jpg\",\"products\\/2-3.jpg\",\"products\\/3-3.jpg\"]'),(66,2,7,3.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2-2.jpg\",\"products\\/4-1.jpg\",\"products\\/7.jpg\"]'),(68,5,6,5.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/7.jpg\"]'),(70,10,3,4.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/10-2.jpg\"]'),(78,7,1,4.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2-2.jpg\",\"products\\/4-2.jpg\"]'),(81,3,8,4.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2-1.jpg\",\"products\\/3-2.jpg\",\"products\\/9.jpg\"]'),(82,8,1,5.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2-2.jpg\",\"products\\/5-1.jpg\",\"products\\/7.jpg\",\"products\\/11.jpg\"]'),(90,8,6,4.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/7-2.jpg\"]'),(91,3,6,2.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/3-2.jpg\",\"products\\/7-1.jpg\"]'),(94,8,3,5.00,'Best ecommerce CMS online store!','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/1.jpg\",\"products\\/2-1.jpg\",\"products\\/7-2.jpg\"]'),(95,2,4,3.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/1.jpg\",\"products\\/5-2.jpg\",\"products\\/10.jpg\"]'),(98,7,3,2.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2-3.jpg\",\"products\\/3-2.jpg\",\"products\\/3-3.jpg\",\"products\\/6.jpg\"]'),(101,3,3,2.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/4.jpg\",\"products\\/5-2.jpg\"]'),(103,1,7,4.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/4.jpg\",\"products\\/7.jpg\"]'),(104,9,1,3.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/7-2.jpg\"]'),(105,5,4,5.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2-1.jpg\",\"products\\/3.jpg\",\"products\\/6-1.jpg\"]'),(111,4,3,4.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/3-1.jpg\",\"products\\/4-2.jpg\"]'),(112,3,5,2.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/1-1.jpg\"]'),(119,6,2,3.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2.jpg\",\"products\\/5-2.jpg\"]'),(123,4,5,4.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/6.jpg\",\"products\\/7.jpg\",\"products\\/11.jpg\"]'),(127,6,6,2.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/1-1.jpg\",\"products\\/4-1.jpg\",\"products\\/5-2.jpg\",\"products\\/10-1.jpg\"]'),(134,9,8,1.00,'Good app, good backup service and support. Good documentation.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/5-1.jpg\",\"products\\/5.jpg\",\"products\\/6-1.jpg\",\"products\\/7-1.jpg\"]'),(137,3,7,1.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2-2.jpg\",\"products\\/2-3.jpg\",\"products\\/3-2.jpg\",\"products\\/6-1.jpg\"]'),(138,3,4,3.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2-1.jpg\",\"products\\/4-1.jpg\",\"products\\/5-2.jpg\",\"products\\/11.jpg\"]'),(140,8,2,5.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/3-1.jpg\",\"products\\/4-1.jpg\",\"products\\/9.jpg\"]'),(148,5,7,4.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/4-2.jpg\",\"products\\/10-2.jpg\"]'),(149,2,5,2.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2-1.jpg\",\"products\\/4-2.jpg\",\"products\\/7.jpg\"]'),(152,10,1,1.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/1-1.jpg\",\"products\\/2-2.jpg\",\"products\\/7-2.jpg\",\"products\\/8.jpg\"]'),(174,6,5,5.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2.jpg\"]'),(211,4,8,1.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/1-1.jpg\",\"products\\/2-3.jpg\",\"products\\/3-1.jpg\",\"products\\/4-1.jpg\"]'),(214,2,1,3.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/3-2.jpg\"]'),(221,10,5,4.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2-2.jpg\",\"products\\/6-1.jpg\",\"products\\/7-1.jpg\"]'),(268,1,4,3.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/2-2.jpg\",\"products\\/2.jpg\",\"products\\/7-1.jpg\",\"products\\/10-2.jpg\"]'),(345,5,5,5.00,'Clean & perfect source code','published','2024-01-31 02:40:44','2024-01-31 02:40:44','[\"products\\/7-1.jpg\"]');
/*!40000 ALTER TABLE `ec_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipment_histories`
--

DROP TABLE IF EXISTS `ec_shipment_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipment_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `shipment_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipment_histories`
--

LOCK TABLES `ec_shipment_histories` WRITE;
/*!40000 ALTER TABLE `ec_shipment_histories` DISABLE KEYS */;
INSERT INTO `ec_shipment_histories` VALUES (1,'create_from_order','Shipping was created from order %order_id%',0,1,1,'2024-01-29 10:40:44','2024-01-29 10:40:44','Botble\\ACL\\Models\\User'),(2,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,1,1,'2024-01-29 10:40:44','2024-01-31 02:40:44','Botble\\ACL\\Models\\User'),(3,'create_from_order','Shipping was created from order %order_id%',0,2,2,'2024-01-15 06:40:44','2024-01-15 06:40:44','Botble\\ACL\\Models\\User'),(4,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,2,2,'2024-01-29 12:40:44','2024-01-31 02:40:44','Botble\\ACL\\Models\\User'),(5,'create_from_order','Shipping was created from order %order_id%',0,3,3,'2024-01-16 02:40:44','2024-01-16 02:40:44','Botble\\ACL\\Models\\User'),(6,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,3,3,'2024-01-29 14:40:45','2024-01-31 02:40:45','Botble\\ACL\\Models\\User'),(7,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,3,3,'2024-01-31 02:40:45','2024-01-31 02:40:45','Botble\\ACL\\Models\\User'),(8,'create_from_order','Shipping was created from order %order_id%',0,4,4,'2024-01-22 14:40:45','2024-01-22 14:40:45','Botble\\ACL\\Models\\User'),(9,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,4,4,'2024-01-29 16:40:45','2024-01-31 02:40:45','Botble\\ACL\\Models\\User'),(10,'create_from_order','Shipping was created from order %order_id%',0,5,5,'2024-01-28 10:40:45','2024-01-28 10:40:45','Botble\\ACL\\Models\\User'),(11,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,5,5,'2024-01-29 18:40:45','2024-01-31 02:40:45','Botble\\ACL\\Models\\User'),(12,'create_from_order','Shipping was created from order %order_id%',0,6,6,'2024-01-23 14:40:45','2024-01-23 14:40:45','Botble\\ACL\\Models\\User'),(13,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,6,6,'2024-01-29 20:40:45','2024-01-31 02:40:45','Botble\\ACL\\Models\\User'),(14,'create_from_order','Shipping was created from order %order_id%',0,7,7,'2024-01-29 22:40:45','2024-01-29 22:40:45','Botble\\ACL\\Models\\User'),(15,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,7,7,'2024-01-29 22:40:45','2024-01-31 02:40:45','Botble\\ACL\\Models\\User'),(16,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,7,7,'2024-01-31 02:40:45','2024-01-31 02:40:45','Botble\\ACL\\Models\\User'),(17,'create_from_order','Shipping was created from order %order_id%',0,8,8,'2024-01-30 00:40:45','2024-01-30 00:40:45','Botble\\ACL\\Models\\User'),(18,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,8,8,'2024-01-30 00:40:45','2024-01-31 02:40:45','Botble\\ACL\\Models\\User'),(19,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,8,8,'2024-01-31 02:40:45','2024-01-31 02:40:45','Botble\\ACL\\Models\\User'),(20,'create_from_order','Shipping was created from order %order_id%',0,9,9,'2024-01-24 02:40:45','2024-01-24 02:40:45','Botble\\ACL\\Models\\User'),(21,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,9,9,'2024-01-30 02:40:46','2024-01-31 02:40:46','Botble\\ACL\\Models\\User'),(22,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,9,9,'2024-01-31 02:40:46','2024-01-31 02:40:46','Botble\\ACL\\Models\\User'),(23,'create_from_order','Shipping was created from order %order_id%',0,10,10,'2024-01-25 14:40:46','2024-01-25 14:40:46','Botble\\ACL\\Models\\User'),(24,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,10,10,'2024-01-30 04:40:46','2024-01-31 02:40:46','Botble\\ACL\\Models\\User'),(25,'create_from_order','Shipping was created from order %order_id%',0,11,11,'2024-01-25 06:40:46','2024-01-25 06:40:46','Botble\\ACL\\Models\\User'),(26,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,11,11,'2024-01-30 06:40:46','2024-01-31 02:40:46','Botble\\ACL\\Models\\User'),(27,'create_from_order','Shipping was created from order %order_id%',0,12,12,'2024-01-28 20:40:46','2024-01-28 20:40:46','Botble\\ACL\\Models\\User'),(28,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,12,12,'2024-01-30 08:40:46','2024-01-31 02:40:46','Botble\\ACL\\Models\\User'),(29,'create_from_order','Shipping was created from order %order_id%',0,13,13,'2024-01-28 10:40:46','2024-01-28 10:40:46','Botble\\ACL\\Models\\User'),(30,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,13,13,'2024-01-30 10:40:46','2024-01-31 02:40:46','Botble\\ACL\\Models\\User'),(31,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,13,13,'2024-01-31 02:40:46','2024-01-31 02:40:46','Botble\\ACL\\Models\\User'),(32,'create_from_order','Shipping was created from order %order_id%',0,14,14,'2024-01-26 10:40:46','2024-01-26 10:40:46','Botble\\ACL\\Models\\User'),(33,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,14,14,'2024-01-30 12:40:46','2024-01-31 02:40:46','Botble\\ACL\\Models\\User'),(34,'create_from_order','Shipping was created from order %order_id%',0,15,15,'2024-01-28 02:40:47','2024-01-28 02:40:47','Botble\\ACL\\Models\\User'),(35,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,15,15,'2024-01-30 14:40:47','2024-01-31 02:40:47','Botble\\ACL\\Models\\User'),(36,'create_from_order','Shipping was created from order %order_id%',0,16,16,'2024-01-30 16:40:47','2024-01-30 16:40:47','Botble\\ACL\\Models\\User'),(37,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,16,16,'2024-01-30 16:40:47','2024-01-31 02:40:47','Botble\\ACL\\Models\\User'),(38,'create_from_order','Shipping was created from order %order_id%',0,17,17,'2024-01-30 10:40:47','2024-01-30 10:40:47','Botble\\ACL\\Models\\User'),(39,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,17,17,'2024-01-30 18:40:47','2024-01-31 02:40:47','Botble\\ACL\\Models\\User'),(40,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,17,17,'2024-01-31 02:40:47','2024-01-31 02:40:47','Botble\\ACL\\Models\\User'),(41,'create_from_order','Shipping was created from order %order_id%',0,18,18,'2024-01-28 14:40:47','2024-01-28 14:40:47','Botble\\ACL\\Models\\User'),(42,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,18,18,'2024-01-30 20:40:47','2024-01-31 02:40:47','Botble\\ACL\\Models\\User'),(43,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,18,18,'2024-01-31 02:40:47','2024-01-31 02:40:47','Botble\\ACL\\Models\\User'),(44,'create_from_order','Shipping was created from order %order_id%',0,19,19,'2024-01-30 10:40:47','2024-01-30 10:40:47','Botble\\ACL\\Models\\User'),(45,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,19,19,'2024-01-30 22:40:47','2024-01-31 02:40:47','Botble\\ACL\\Models\\User'),(46,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,19,19,'2024-01-31 02:40:47','2024-01-31 02:40:47','Botble\\ACL\\Models\\User'),(47,'create_from_order','Shipping was created from order %order_id%',0,20,20,'2024-01-30 18:40:47','2024-01-30 18:40:47','Botble\\ACL\\Models\\User'),(48,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,20,20,'2024-01-31 00:40:48','2024-01-31 02:40:48','Botble\\ACL\\Models\\User'),(49,'update_cod_status','Updated COD status to Completed . Updated by: %user_name%',0,20,20,'2024-01-31 02:40:48','2024-01-31 02:40:48','Botble\\ACL\\Models\\User'),(50,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,20,20,'2024-01-31 02:40:48','2024-01-31 02:40:48','Botble\\ACL\\Models\\User');
/*!40000 ALTER TABLE `ec_shipment_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipments`
--

DROP TABLE IF EXISTS `ec_shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `weight` double(8,2) DEFAULT '0.00',
  `shipment_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cod_amount` decimal(15,2) DEFAULT '0.00',
  `cod_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cross_checking_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `price` decimal(15,2) DEFAULT '0.00',
  `store_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimate_date_shipped` datetime DEFAULT NULL,
  `date_shipped` datetime DEFAULT NULL,
  `label_url` text COLLATE utf8mb4_unicode_ci,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipments`
--

LOCK TABLES `ec_shipments` WRITE;
/*!40000 ALTER TABLE `ec_shipments` DISABLE KEYS */;
INSERT INTO `ec_shipments` VALUES (1,1,NULL,4088.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-31 02:40:44','2024-01-31 02:40:44','JJD0066214765','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-10 09:40:44',NULL,NULL,NULL),(2,2,NULL,3780.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-31 02:40:44','2024-01-31 02:40:44','JJD0050333771','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-05 09:40:44',NULL,NULL,NULL),(3,3,NULL,4428.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-31 02:40:45','2024-01-31 02:40:45','JJD0037390021','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-02 09:40:45','2024-01-31 09:40:45',NULL,NULL),(4,4,NULL,6708.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-31 02:40:45','2024-01-31 02:40:45','JJD0029083171','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-08 09:40:45',NULL,NULL,NULL),(5,5,NULL,3980.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-31 02:40:45','2024-01-31 02:40:45','JJD0091878558','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-04 09:40:45',NULL,NULL,NULL),(6,6,NULL,3861.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-31 02:40:45','2024-01-31 02:40:45','JJD0029893791','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-07 09:40:45',NULL,NULL,NULL),(7,7,NULL,5520.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-31 02:40:45','2024-01-31 02:40:45','JJD0071126692','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-02 09:40:45','2024-01-31 09:40:45',NULL,NULL),(8,8,NULL,4724.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-31 02:40:45','2024-01-31 02:40:45','JJD0090087115','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-08 09:40:45','2024-01-31 09:40:45',NULL,NULL),(9,9,NULL,2952.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-31 02:40:46','2024-01-31 02:40:46','JJD007858951','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-03 09:40:46','2024-01-31 09:40:46',NULL,NULL),(10,10,NULL,1436.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-31 02:40:46','2024-01-31 02:40:46','JJD0057778808','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-03 09:40:46',NULL,NULL,NULL),(11,11,NULL,3958.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-31 02:40:46','2024-01-31 02:40:46','JJD0078679209','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-07 09:40:46',NULL,NULL,NULL),(12,12,NULL,2368.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-31 02:40:46','2024-01-31 02:40:46','JJD0049609909','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-10 09:40:46',NULL,NULL,NULL),(13,13,NULL,4833.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-31 02:40:46','2024-01-31 02:40:46','JJD0014589333','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-07 09:40:46','2024-01-31 09:40:46',NULL,NULL),(14,14,NULL,3741.00,NULL,NULL,'','approved',625.00,'pending','pending',0.00,0,'2024-01-31 02:40:46','2024-01-31 02:40:46','JJD0063323349','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-03 09:40:46',NULL,NULL,NULL),(15,15,NULL,8142.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','JJD0062825100','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-06 09:40:47',NULL,NULL,NULL),(16,16,NULL,4383.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','JJD0098899259','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-09 09:40:47',NULL,NULL,NULL),(17,17,NULL,6202.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','JJD0014359267','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-01 09:40:47','2024-01-31 09:40:47',NULL,NULL),(18,18,NULL,6392.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','JJD0033305769','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-04 09:40:47','2024-01-31 09:40:47',NULL,NULL),(19,19,NULL,4191.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-31 02:40:47','2024-01-31 02:40:47','JJD0049528728','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-04 09:40:47','2024-01-31 09:40:47',NULL,NULL),(20,20,NULL,4513.00,NULL,NULL,'','delivered',1143.00,'completed','pending',0.00,0,'2024-01-31 02:40:48','2024-01-31 02:40:48','JJD0020962251','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-10 09:40:48','2024-01-31 09:40:48',NULL,NULL);
/*!40000 ALTER TABLE `ec_shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping`
--

DROP TABLE IF EXISTS `ec_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping`
--

LOCK TABLES `ec_shipping` WRITE;
/*!40000 ALTER TABLE `ec_shipping` DISABLE KEYS */;
INSERT INTO `ec_shipping` VALUES (1,'All',NULL,'2024-01-31 02:40:48','2024-01-31 02:40:48');
/*!40000 ALTER TABLE `ec_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping_rule_items`
--

DROP TABLE IF EXISTS `ec_shipping_rule_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping_rule_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shipping_rule_id` bigint unsigned NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_price` decimal(15,2) DEFAULT '0.00',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping_rule_items`
--

LOCK TABLES `ec_shipping_rule_items` WRITE;
/*!40000 ALTER TABLE `ec_shipping_rule_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shipping_rule_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping_rules`
--

DROP TABLE IF EXISTS `ec_shipping_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping_rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_id` bigint unsigned NOT NULL,
  `type` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT 'based_on_price',
  `from` decimal(15,2) DEFAULT '0.00',
  `to` decimal(15,2) DEFAULT '0.00',
  `price` decimal(15,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping_rules`
--

LOCK TABLES `ec_shipping_rules` WRITE;
/*!40000 ALTER TABLE `ec_shipping_rules` DISABLE KEYS */;
INSERT INTO `ec_shipping_rules` VALUES (1,'Free delivery',1,'based_on_price',0.00,NULL,0.00,'2024-01-31 02:40:48','2024-01-31 02:40:48');
/*!40000 ALTER TABLE `ec_shipping_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_store_locators`
--

DROP TABLE IF EXISTS `ec_store_locators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_store_locators` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT '0',
  `is_shipping_location` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_store_locators`
--

LOCK TABLES `ec_store_locators` WRITE;
/*!40000 ALTER TABLE `ec_store_locators` DISABLE KEYS */;
INSERT INTO `ec_store_locators` VALUES (1,'HASA SG','sales@botble.com','18006268','North Link Building, 10 Admiralty Street','SG','Singapore','Singapore',1,1,'2024-01-31 02:40:49','2024-01-31 02:40:49');
/*!40000 ALTER TABLE `ec_store_locators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_tax_products`
--

DROP TABLE IF EXISTS `ec_tax_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_tax_products` (
  `tax_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`tax_id`),
  KEY `ec_tax_products_tax_id_index` (`tax_id`),
  KEY `ec_tax_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_tax_products`
--

LOCK TABLES `ec_tax_products` WRITE;
/*!40000 ALTER TABLE `ec_tax_products` DISABLE KEYS */;
INSERT INTO `ec_tax_products` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8);
/*!40000 ALTER TABLE `ec_tax_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_tax_rules`
--

DROP TABLE IF EXISTS `ec_tax_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_tax_rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tax_id` bigint unsigned NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_tax_rules`
--

LOCK TABLES `ec_tax_rules` WRITE;
/*!40000 ALTER TABLE `ec_tax_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_tax_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_taxes`
--

DROP TABLE IF EXISTS `ec_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` double(8,6) DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_taxes`
--

LOCK TABLES `ec_taxes` WRITE;
/*!40000 ALTER TABLE `ec_taxes` DISABLE KEYS */;
INSERT INTO `ec_taxes` VALUES (1,'VAT',10.000000,1,'published','2024-01-31 02:40:41','2024-01-31 02:40:41'),(2,'None',0.000000,2,'published','2024-01-31 02:40:41','2024-01-31 02:40:41'),(3,'Import Tax',15.000000,3,'published','2024-01-31 02:40:41','2024-01-31 02:40:41');
/*!40000 ALTER TABLE `ec_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_wish_lists`
--

DROP TABLE IF EXISTS `ec_wish_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_wish_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_relation_index` (`product_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_wish_lists`
--

LOCK TABLES `ec_wish_lists` WRITE;
/*!40000 ALTER TABLE `ec_wish_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_wish_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'Shipping',0,'published','2024-01-31 02:40:50','2024-01-31 02:40:50',NULL),(2,'Payment',1,'published','2024-01-31 02:40:50','2024-01-31 02:40:50',NULL),(3,'Order &amp; Returns',2,'published','2024-01-31 02:40:50','2024-01-31 02:40:50',NULL);
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories_translations`
--

LOCK TABLES `faq_categories_translations` WRITE;
/*!40000 ALTER TABLE `faq_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'What Shipping Methods Are Available?','Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.',1,'published','2024-01-31 02:40:50','2024-01-31 02:40:50'),(2,'Do You Ship Internationally?','Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.',1,'published','2024-01-31 02:40:50','2024-01-31 02:40:50'),(3,'How Long Will It Take To Get My Package?','Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.',1,'published','2024-01-31 02:40:50','2024-01-31 02:40:50'),(4,'What Payment Methods Are Accepted?','Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.',2,'published','2024-01-31 02:40:50','2024-01-31 02:40:50'),(5,'Is Buying On-Line Safe?','Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.',2,'published','2024-01-31 02:40:50','2024-01-31 02:40:50'),(6,'How do I place an Order?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb Odd Future seitan normcore. Master cleanse American Apparel gentrify flexitarian beard slow-carb next level. Raw denim polaroid paleo farm-to-table, put a bird on it lo-fi tattooed Wes Anderson Pinterest letterpress. Fingerstache McSweeney’s pour-over, letterpress Schlitz photo booth master cleanse bespoke hashtag chillwave gentrify.',3,'published','2024-01-31 02:40:50','2024-01-31 02:40:50'),(7,'How Can I Cancel Or Change My Order?','Plaid letterpress leggings craft beer meh ethical Pinterest. Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth.',3,'published','2024-01-31 02:40:50','2024-01-31 02:40:50'),(8,'Do I need an account to place an order?','Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY. Cray ugh 3 wolf moon fap, fashion axe irony butcher cornhole typewriter chambray VHS banjo street art.',3,'published','2024-01-31 02:40:50','2024-01-31 02:40:50'),(9,'How Do I Track My Order?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb @Odd Future seitan normcore. Master cleanse American Apparel gentrify flexitarian beard slow-carb next level.',3,'published','2024-01-31 02:40:50','2024-01-31 02:40:50'),(10,'How Can I Return a Product?','Kale chips Truffaut Williamsburg, hashtag fixie Pinterest raw denim c hambray drinking vinegar Carles street art Bushwick gastropub. Wolf Tumblr paleo church-key. Plaid food truck Echo Park YOLO bitters hella, direct trade Thundercats leggings quinoa before they sold out. You probably haven’t heard of them wayfarers authentic umami drinking vinegar Pinterest Cosby sweater, fingerstache fap High Life.',3,'published','2024-01-31 02:40:50','2024-01-31 02:40:50');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` bigint unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`faqs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_translations`
--

LOCK TABLES `faqs_translations` WRITE;
/*!40000 ALTER TABLE `faqs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'Men','Tempora dolorem unde nihil qui itaque soluta ea. Distinctio sed dicta eum aut. At sint quisquam cum labore expedita.',1,0,'galleries/1.jpg',1,'published','2024-01-31 02:40:50','2024-01-31 02:40:50'),(2,'Women','Accusantium aut sequi illo dolorem. Harum nostrum sed pariatur voluptatem et.',1,0,'galleries/2.jpg',1,'published','2024-01-31 02:40:50','2024-01-31 02:40:50'),(3,'Accessories','Et rerum culpa et molestiae quaerat autem voluptatem. Ex est magnam voluptates. Molestias quo alias nulla.',1,0,'galleries/3.jpg',1,'published','2024-01-31 02:40:50','2024-01-31 02:40:50'),(4,'Shoes','Quidem sed est aperiam qui id magnam tempora. Cumque voluptas delectus laborum quia et. Odit error ea et quam sapiente unde quas.',1,0,'galleries/4.jpg',1,'published','2024-01-31 02:40:50','2024-01-31 02:40:50'),(5,'Denim','Distinctio minus omnis architecto voluptas quibusdam corrupti ea. Qui occaecati veritatis ut quis amet aut quos.',1,0,'galleries/5.jpg',1,'published','2024-01-31 02:40:50','2024-01-31 02:40:50'),(6,'Dress','Voluptatem in error voluptas rerum rem. Libero dolorum reprehenderit tenetur voluptates deserunt facilis. Maiores maiores expedita vero.',1,0,'galleries/6.jpg',1,'published','2024-01-31 02:40:50','2024-01-31 02:40:50');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries_translations`
--

DROP TABLE IF EXISTS `galleries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galleries_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries_translations`
--

LOCK TABLES `galleries_translations` WRITE;
/*!40000 ALTER TABLE `galleries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta`
--

DROP TABLE IF EXISTS `gallery_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `images` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta`
--

LOCK TABLES `gallery_meta` WRITE;
/*!40000 ALTER TABLE `gallery_meta` DISABLE KEYS */;
INSERT INTO `gallery_meta` VALUES (1,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Praesentium doloribus provident dolor. Consectetur veritatis saepe est fugiat minima odio. Distinctio accusantium eos at et.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Et est minus illo eius eligendi id adipisci. Voluptas perferendis animi magnam quod quo.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Omnis pariatur eum expedita vero. Non ullam occaecati inventore delectus eos et.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Quia libero illum omnis sequi quo distinctio. Dolore aut omnis aut qui hic aut aliquam. Harum laudantium et necessitatibus aliquam illum sapiente.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Quos eaque numquam aliquid aut et. Vel earum praesentium quo eum. Quia soluta excepturi amet blanditiis perferendis voluptatem.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"A ratione nam dicta eum quidem rerum consequuntur. Non ducimus repellendus tempore natus. Molestiae molestias odit voluptatum et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Maxime impedit aut quisquam aspernatur. Nihil atque quis tempore rerum minus qui ratione placeat.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Aut ratione suscipit odio hic quam. Fugit eius distinctio fuga ducimus. Quia aspernatur provident culpa autem.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Et consequatur et ab ex. Accusantium accusantium optio explicabo voluptatem et. Est beatae molestiae illum modi voluptates.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Cupiditate libero nihil non. Est sint doloribus nesciunt. Unde enim ratione odit quidem. Et numquam et quisquam nulla autem pariatur.\"}]',1,'Botble\\Gallery\\Models\\Gallery','2024-01-31 02:40:50','2024-01-31 02:40:50'),(2,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Praesentium doloribus provident dolor. Consectetur veritatis saepe est fugiat minima odio. Distinctio accusantium eos at et.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Et est minus illo eius eligendi id adipisci. Voluptas perferendis animi magnam quod quo.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Omnis pariatur eum expedita vero. Non ullam occaecati inventore delectus eos et.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Quia libero illum omnis sequi quo distinctio. Dolore aut omnis aut qui hic aut aliquam. Harum laudantium et necessitatibus aliquam illum sapiente.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Quos eaque numquam aliquid aut et. Vel earum praesentium quo eum. Quia soluta excepturi amet blanditiis perferendis voluptatem.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"A ratione nam dicta eum quidem rerum consequuntur. Non ducimus repellendus tempore natus. Molestiae molestias odit voluptatum et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Maxime impedit aut quisquam aspernatur. Nihil atque quis tempore rerum minus qui ratione placeat.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Aut ratione suscipit odio hic quam. Fugit eius distinctio fuga ducimus. Quia aspernatur provident culpa autem.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Et consequatur et ab ex. Accusantium accusantium optio explicabo voluptatem et. Est beatae molestiae illum modi voluptates.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Cupiditate libero nihil non. Est sint doloribus nesciunt. Unde enim ratione odit quidem. Et numquam et quisquam nulla autem pariatur.\"}]',2,'Botble\\Gallery\\Models\\Gallery','2024-01-31 02:40:50','2024-01-31 02:40:50'),(3,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Praesentium doloribus provident dolor. Consectetur veritatis saepe est fugiat minima odio. Distinctio accusantium eos at et.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Et est minus illo eius eligendi id adipisci. Voluptas perferendis animi magnam quod quo.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Omnis pariatur eum expedita vero. Non ullam occaecati inventore delectus eos et.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Quia libero illum omnis sequi quo distinctio. Dolore aut omnis aut qui hic aut aliquam. Harum laudantium et necessitatibus aliquam illum sapiente.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Quos eaque numquam aliquid aut et. Vel earum praesentium quo eum. Quia soluta excepturi amet blanditiis perferendis voluptatem.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"A ratione nam dicta eum quidem rerum consequuntur. Non ducimus repellendus tempore natus. Molestiae molestias odit voluptatum et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Maxime impedit aut quisquam aspernatur. Nihil atque quis tempore rerum minus qui ratione placeat.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Aut ratione suscipit odio hic quam. Fugit eius distinctio fuga ducimus. Quia aspernatur provident culpa autem.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Et consequatur et ab ex. Accusantium accusantium optio explicabo voluptatem et. Est beatae molestiae illum modi voluptates.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Cupiditate libero nihil non. Est sint doloribus nesciunt. Unde enim ratione odit quidem. Et numquam et quisquam nulla autem pariatur.\"}]',3,'Botble\\Gallery\\Models\\Gallery','2024-01-31 02:40:50','2024-01-31 02:40:50'),(4,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Praesentium doloribus provident dolor. Consectetur veritatis saepe est fugiat minima odio. Distinctio accusantium eos at et.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Et est minus illo eius eligendi id adipisci. Voluptas perferendis animi magnam quod quo.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Omnis pariatur eum expedita vero. Non ullam occaecati inventore delectus eos et.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Quia libero illum omnis sequi quo distinctio. Dolore aut omnis aut qui hic aut aliquam. Harum laudantium et necessitatibus aliquam illum sapiente.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Quos eaque numquam aliquid aut et. Vel earum praesentium quo eum. Quia soluta excepturi amet blanditiis perferendis voluptatem.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"A ratione nam dicta eum quidem rerum consequuntur. Non ducimus repellendus tempore natus. Molestiae molestias odit voluptatum et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Maxime impedit aut quisquam aspernatur. Nihil atque quis tempore rerum minus qui ratione placeat.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Aut ratione suscipit odio hic quam. Fugit eius distinctio fuga ducimus. Quia aspernatur provident culpa autem.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Et consequatur et ab ex. Accusantium accusantium optio explicabo voluptatem et. Est beatae molestiae illum modi voluptates.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Cupiditate libero nihil non. Est sint doloribus nesciunt. Unde enim ratione odit quidem. Et numquam et quisquam nulla autem pariatur.\"}]',4,'Botble\\Gallery\\Models\\Gallery','2024-01-31 02:40:50','2024-01-31 02:40:50'),(5,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Praesentium doloribus provident dolor. Consectetur veritatis saepe est fugiat minima odio. Distinctio accusantium eos at et.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Et est minus illo eius eligendi id adipisci. Voluptas perferendis animi magnam quod quo.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Omnis pariatur eum expedita vero. Non ullam occaecati inventore delectus eos et.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Quia libero illum omnis sequi quo distinctio. Dolore aut omnis aut qui hic aut aliquam. Harum laudantium et necessitatibus aliquam illum sapiente.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Quos eaque numquam aliquid aut et. Vel earum praesentium quo eum. Quia soluta excepturi amet blanditiis perferendis voluptatem.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"A ratione nam dicta eum quidem rerum consequuntur. Non ducimus repellendus tempore natus. Molestiae molestias odit voluptatum et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Maxime impedit aut quisquam aspernatur. Nihil atque quis tempore rerum minus qui ratione placeat.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Aut ratione suscipit odio hic quam. Fugit eius distinctio fuga ducimus. Quia aspernatur provident culpa autem.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Et consequatur et ab ex. Accusantium accusantium optio explicabo voluptatem et. Est beatae molestiae illum modi voluptates.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Cupiditate libero nihil non. Est sint doloribus nesciunt. Unde enim ratione odit quidem. Et numquam et quisquam nulla autem pariatur.\"}]',5,'Botble\\Gallery\\Models\\Gallery','2024-01-31 02:40:50','2024-01-31 02:40:50'),(6,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Praesentium doloribus provident dolor. Consectetur veritatis saepe est fugiat minima odio. Distinctio accusantium eos at et.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Et est minus illo eius eligendi id adipisci. Voluptas perferendis animi magnam quod quo.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Omnis pariatur eum expedita vero. Non ullam occaecati inventore delectus eos et.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Quia libero illum omnis sequi quo distinctio. Dolore aut omnis aut qui hic aut aliquam. Harum laudantium et necessitatibus aliquam illum sapiente.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Quos eaque numquam aliquid aut et. Vel earum praesentium quo eum. Quia soluta excepturi amet blanditiis perferendis voluptatem.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"A ratione nam dicta eum quidem rerum consequuntur. Non ducimus repellendus tempore natus. Molestiae molestias odit voluptatum et.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Maxime impedit aut quisquam aspernatur. Nihil atque quis tempore rerum minus qui ratione placeat.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Aut ratione suscipit odio hic quam. Fugit eius distinctio fuga ducimus. Quia aspernatur provident culpa autem.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Et consequatur et ab ex. Accusantium accusantium optio explicabo voluptatem et. Est beatae molestiae illum modi voluptates.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Cupiditate libero nihil non. Est sint doloribus nesciunt. Unde enim ratione odit quidem. Et numquam et quisquam nulla autem pariatur.\"}]',6,'Botble\\Gallery\\Models\\Gallery','2024-01-31 02:40:50','2024-01-31 02:40:50');
/*!40000 ALTER TABLE `gallery_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta_translations`
--

DROP TABLE IF EXISTS `gallery_meta_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_meta_id` bigint unsigned NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`gallery_meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta_translations`
--

LOCK TABLES `gallery_meta_translations` WRITE;
/*!40000 ALTER TABLE `gallery_meta_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_meta_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','d93942a04951d51171627351aaabd867',1,'Botble\\SimpleSlider\\Models\\SimpleSlider'),(2,'en_US','1aab129b76236dc96af5a1e8c75e9f9c',1,'Botble\\Menu\\Models\\MenuLocation'),(3,'en_US','48759bc334c90c0d63a1f48c7ae7828f',1,'Botble\\Menu\\Models\\Menu'),(4,'en_US','5bff44b5d6ba8212fd6a3c0b93ec3fe3',2,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'1','1',1,'image/png',1805,'brands/1.png','[]','2024-01-31 02:40:38','2024-01-31 02:40:38',NULL),(2,0,'2','2',1,'image/png',1805,'brands/2.png','[]','2024-01-31 02:40:38','2024-01-31 02:40:38',NULL),(3,0,'3','3',1,'image/png',1805,'brands/3.png','[]','2024-01-31 02:40:38','2024-01-31 02:40:38',NULL),(4,0,'4','4',1,'image/png',1805,'brands/4.png','[]','2024-01-31 02:40:38','2024-01-31 02:40:38',NULL),(5,0,'5','5',1,'image/png',1805,'brands/5.png','[]','2024-01-31 02:40:38','2024-01-31 02:40:38',NULL),(6,0,'6','6',1,'image/png',1805,'brands/6.png','[]','2024-01-31 02:40:38','2024-01-31 02:40:38',NULL),(7,0,'7','7',1,'image/png',1805,'brands/7.png','[]','2024-01-31 02:40:38','2024-01-31 02:40:38',NULL),(8,0,'1','1',2,'image/png',9730,'product-categories/1.png','[]','2024-01-31 02:40:38','2024-01-31 02:40:38',NULL),(9,0,'2','2',2,'image/png',9730,'product-categories/2.png','[]','2024-01-31 02:40:38','2024-01-31 02:40:38',NULL),(10,0,'3','3',2,'image/png',9730,'product-categories/3.png','[]','2024-01-31 02:40:38','2024-01-31 02:40:38',NULL),(11,0,'4','4',2,'image/png',9730,'product-categories/4.png','[]','2024-01-31 02:40:38','2024-01-31 02:40:38',NULL),(12,0,'5','5',2,'image/png',9730,'product-categories/5.png','[]','2024-01-31 02:40:38','2024-01-31 02:40:38',NULL),(13,0,'6','6',2,'image/png',9730,'product-categories/6.png','[]','2024-01-31 02:40:38','2024-01-31 02:40:38',NULL),(14,0,'7','7',2,'image/png',9730,'product-categories/7.png','[]','2024-01-31 02:40:38','2024-01-31 02:40:38',NULL),(15,0,'1','1',3,'image/jpeg',9730,'product-collections/1.jpg','[]','2024-01-31 02:40:38','2024-01-31 02:40:38',NULL),(16,0,'2','2',3,'image/jpeg',9730,'product-collections/2.jpg','[]','2024-01-31 02:40:38','2024-01-31 02:40:38',NULL),(17,0,'3','3',3,'image/jpeg',9730,'product-collections/3.jpg','[]','2024-01-31 02:40:38','2024-01-31 02:40:38',NULL),(18,0,'4','4',3,'image/jpeg',9730,'product-collections/4.jpg','[]','2024-01-31 02:40:39','2024-01-31 02:40:39',NULL),(19,0,'1-1','1-1',4,'image/jpeg',9730,'products/1-1.jpg','[]','2024-01-31 02:40:39','2024-01-31 02:40:39',NULL),(20,0,'1','1',4,'image/jpeg',9730,'products/1.jpg','[]','2024-01-31 02:40:39','2024-01-31 02:40:39',NULL),(21,0,'10-1','10-1',4,'image/jpeg',9730,'products/10-1.jpg','[]','2024-01-31 02:40:39','2024-01-31 02:40:39',NULL),(22,0,'10-2','10-2',4,'image/jpeg',9730,'products/10-2.jpg','[]','2024-01-31 02:40:39','2024-01-31 02:40:39',NULL),(23,0,'10','10',4,'image/jpeg',9730,'products/10.jpg','[]','2024-01-31 02:40:39','2024-01-31 02:40:39',NULL),(24,0,'11','11',4,'image/jpeg',9730,'products/11.jpg','[]','2024-01-31 02:40:39','2024-01-31 02:40:39',NULL),(25,0,'2-1','2-1',4,'image/jpeg',9730,'products/2-1.jpg','[]','2024-01-31 02:40:39','2024-01-31 02:40:39',NULL),(26,0,'2-2','2-2',4,'image/jpeg',9730,'products/2-2.jpg','[]','2024-01-31 02:40:39','2024-01-31 02:40:39',NULL),(27,0,'2-3','2-3',4,'image/jpeg',9730,'products/2-3.jpg','[]','2024-01-31 02:40:39','2024-01-31 02:40:39',NULL),(28,0,'2','2',4,'image/jpeg',9730,'products/2.jpg','[]','2024-01-31 02:40:39','2024-01-31 02:40:39',NULL),(29,0,'3-1','3-1',4,'image/jpeg',9730,'products/3-1.jpg','[]','2024-01-31 02:40:39','2024-01-31 02:40:39',NULL),(30,0,'3-2','3-2',4,'image/jpeg',9730,'products/3-2.jpg','[]','2024-01-31 02:40:39','2024-01-31 02:40:39',NULL),(31,0,'3-3','3-3',4,'image/jpeg',9730,'products/3-3.jpg','[]','2024-01-31 02:40:39','2024-01-31 02:40:39',NULL),(32,0,'3','3',4,'image/jpeg',9730,'products/3.jpg','[]','2024-01-31 02:40:39','2024-01-31 02:40:39',NULL),(33,0,'4-1','4-1',4,'image/jpeg',9730,'products/4-1.jpg','[]','2024-01-31 02:40:39','2024-01-31 02:40:39',NULL),(34,0,'4-2','4-2',4,'image/jpeg',9730,'products/4-2.jpg','[]','2024-01-31 02:40:39','2024-01-31 02:40:39',NULL),(35,0,'4','4',4,'image/jpeg',9730,'products/4.jpg','[]','2024-01-31 02:40:40','2024-01-31 02:40:40',NULL),(36,0,'5-1','5-1',4,'image/jpeg',9730,'products/5-1.jpg','[]','2024-01-31 02:40:40','2024-01-31 02:40:40',NULL),(37,0,'5-2','5-2',4,'image/jpeg',9730,'products/5-2.jpg','[]','2024-01-31 02:40:40','2024-01-31 02:40:40',NULL),(38,0,'5','5',4,'image/jpeg',9730,'products/5.jpg','[]','2024-01-31 02:40:40','2024-01-31 02:40:40',NULL),(39,0,'6-1','6-1',4,'image/jpeg',9730,'products/6-1.jpg','[]','2024-01-31 02:40:40','2024-01-31 02:40:40',NULL),(40,0,'6','6',4,'image/jpeg',9730,'products/6.jpg','[]','2024-01-31 02:40:40','2024-01-31 02:40:40',NULL),(41,0,'7-1','7-1',4,'image/jpeg',9730,'products/7-1.jpg','[]','2024-01-31 02:40:40','2024-01-31 02:40:40',NULL),(42,0,'7-2','7-2',4,'image/jpeg',9730,'products/7-2.jpg','[]','2024-01-31 02:40:40','2024-01-31 02:40:40',NULL),(43,0,'7','7',4,'image/jpeg',9730,'products/7.jpg','[]','2024-01-31 02:40:40','2024-01-31 02:40:40',NULL),(44,0,'8','8',4,'image/jpeg',9730,'products/8.jpg','[]','2024-01-31 02:40:40','2024-01-31 02:40:40',NULL),(45,0,'9','9',4,'image/jpeg',9730,'products/9.jpg','[]','2024-01-31 02:40:40','2024-01-31 02:40:40',NULL),(46,0,'1','1',5,'image/jpeg',9730,'customers/1.jpg','[]','2024-01-31 02:40:41','2024-01-31 02:40:41',NULL),(47,0,'10','10',5,'image/jpeg',9730,'customers/10.jpg','[]','2024-01-31 02:40:41','2024-01-31 02:40:41',NULL),(48,0,'2','2',5,'image/jpeg',9730,'customers/2.jpg','[]','2024-01-31 02:40:41','2024-01-31 02:40:41',NULL),(49,0,'3','3',5,'image/jpeg',9730,'customers/3.jpg','[]','2024-01-31 02:40:41','2024-01-31 02:40:41',NULL),(50,0,'4','4',5,'image/jpeg',9730,'customers/4.jpg','[]','2024-01-31 02:40:41','2024-01-31 02:40:41',NULL),(51,0,'5','5',5,'image/jpeg',9730,'customers/5.jpg','[]','2024-01-31 02:40:41','2024-01-31 02:40:41',NULL),(52,0,'6','6',5,'image/jpeg',9730,'customers/6.jpg','[]','2024-01-31 02:40:41','2024-01-31 02:40:41',NULL),(53,0,'7','7',5,'image/jpeg',9730,'customers/7.jpg','[]','2024-01-31 02:40:41','2024-01-31 02:40:41',NULL),(54,0,'8','8',5,'image/jpeg',9730,'customers/8.jpg','[]','2024-01-31 02:40:41','2024-01-31 02:40:41',NULL),(55,0,'9','9',5,'image/jpeg',9730,'customers/9.jpg','[]','2024-01-31 02:40:41','2024-01-31 02:40:41',NULL),(56,0,'1','1',6,'image/jpeg',9359,'flash-sales/1.jpg','[]','2024-01-31 02:40:48','2024-01-31 02:40:48',NULL),(57,0,'2','2',6,'image/jpeg',9359,'flash-sales/2.jpg','[]','2024-01-31 02:40:48','2024-01-31 02:40:48',NULL),(58,0,'1','1',7,'image/jpeg',20612,'sliders/1.jpg','[]','2024-01-31 02:40:48','2024-01-31 02:40:48',NULL),(59,0,'2','2',7,'image/jpeg',20612,'sliders/2.jpg','[]','2024-01-31 02:40:48','2024-01-31 02:40:48',NULL),(60,0,'3','3',7,'image/jpeg',20612,'sliders/3.jpg','[]','2024-01-31 02:40:48','2024-01-31 02:40:48',NULL),(61,0,'1','1',8,'image/jpeg',9730,'news/1.jpg','[]','2024-01-31 02:40:49','2024-01-31 02:40:49',NULL),(62,0,'10','10',8,'image/jpeg',9730,'news/10.jpg','[]','2024-01-31 02:40:49','2024-01-31 02:40:49',NULL),(63,0,'11','11',8,'image/jpeg',9730,'news/11.jpg','[]','2024-01-31 02:40:49','2024-01-31 02:40:49',NULL),(64,0,'2','2',8,'image/jpeg',9730,'news/2.jpg','[]','2024-01-31 02:40:49','2024-01-31 02:40:49',NULL),(65,0,'3','3',8,'image/jpeg',9730,'news/3.jpg','[]','2024-01-31 02:40:49','2024-01-31 02:40:49',NULL),(66,0,'4','4',8,'image/jpeg',9730,'news/4.jpg','[]','2024-01-31 02:40:49','2024-01-31 02:40:49',NULL),(67,0,'5','5',8,'image/jpeg',9730,'news/5.jpg','[]','2024-01-31 02:40:49','2024-01-31 02:40:49',NULL),(68,0,'6','6',8,'image/jpeg',9730,'news/6.jpg','[]','2024-01-31 02:40:49','2024-01-31 02:40:49',NULL),(69,0,'7','7',8,'image/jpeg',9730,'news/7.jpg','[]','2024-01-31 02:40:49','2024-01-31 02:40:49',NULL),(70,0,'8','8',8,'image/jpeg',9730,'news/8.jpg','[]','2024-01-31 02:40:49','2024-01-31 02:40:49',NULL),(71,0,'9','9',8,'image/jpeg',9730,'news/9.jpg','[]','2024-01-31 02:40:49','2024-01-31 02:40:49',NULL),(72,0,'1','1',9,'image/jpeg',9730,'galleries/1.jpg','[]','2024-01-31 02:40:49','2024-01-31 02:40:49',NULL),(73,0,'10','10',9,'image/jpeg',9730,'galleries/10.jpg','[]','2024-01-31 02:40:49','2024-01-31 02:40:49',NULL),(74,0,'2','2',9,'image/jpeg',9730,'galleries/2.jpg','[]','2024-01-31 02:40:49','2024-01-31 02:40:49',NULL),(75,0,'3','3',9,'image/jpeg',9730,'galleries/3.jpg','[]','2024-01-31 02:40:50','2024-01-31 02:40:50',NULL),(76,0,'4','4',9,'image/jpeg',9730,'galleries/4.jpg','[]','2024-01-31 02:40:50','2024-01-31 02:40:50',NULL),(77,0,'5','5',9,'image/jpeg',9730,'galleries/5.jpg','[]','2024-01-31 02:40:50','2024-01-31 02:40:50',NULL),(78,0,'6','6',9,'image/jpeg',9730,'galleries/6.jpg','[]','2024-01-31 02:40:50','2024-01-31 02:40:50',NULL),(79,0,'7','7',9,'image/jpeg',9730,'galleries/7.jpg','[]','2024-01-31 02:40:50','2024-01-31 02:40:50',NULL),(80,0,'8','8',9,'image/jpeg',9730,'galleries/8.jpg','[]','2024-01-31 02:40:50','2024-01-31 02:40:50',NULL),(81,0,'9','9',9,'image/jpeg',9730,'galleries/9.jpg','[]','2024-01-31 02:40:50','2024-01-31 02:40:50',NULL),(82,0,'favicon','favicon',10,'image/png',14500,'general/favicon.png','[]','2024-01-31 02:40:50','2024-01-31 02:40:50',NULL),(83,0,'logo-light','logo-light',10,'image/png',35316,'general/logo-light.png','[]','2024-01-31 02:40:50','2024-01-31 02:40:50',NULL),(84,0,'logo','logo',10,'image/png',41654,'general/logo.png','[]','2024-01-31 02:40:50','2024-01-31 02:40:50',NULL),(85,0,'open-graph-image','open-graph-image',10,'image/png',580691,'general/open-graph-image.png','[]','2024-01-31 02:40:50','2024-01-31 02:40:50',NULL);
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'brands',NULL,'brands',0,'2024-01-31 02:40:38','2024-01-31 02:40:38',NULL),(2,0,'product-categories',NULL,'product-categories',0,'2024-01-31 02:40:38','2024-01-31 02:40:38',NULL),(3,0,'product-collections',NULL,'product-collections',0,'2024-01-31 02:40:38','2024-01-31 02:40:38',NULL),(4,0,'products',NULL,'products',0,'2024-01-31 02:40:39','2024-01-31 02:40:39',NULL),(5,0,'customers',NULL,'customers',0,'2024-01-31 02:40:41','2024-01-31 02:40:41',NULL),(6,0,'flash-sales',NULL,'flash-sales',0,'2024-01-31 02:40:48','2024-01-31 02:40:48',NULL),(7,0,'sliders',NULL,'sliders',0,'2024-01-31 02:40:48','2024-01-31 02:40:48',NULL),(8,0,'news',NULL,'news',0,'2024-01-31 02:40:49','2024-01-31 02:40:49',NULL),(9,0,'galleries',NULL,'galleries',0,'2024-01-31 02:40:49','2024-01-31 02:40:49',NULL),(10,0,'general',NULL,'general',0,'2024-01-31 02:40:50','2024-01-31 02:40:50',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2024-01-31 02:40:50','2024-01-31 02:40:50');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',0,'2024-01-31 02:40:50','2024-01-31 02:40:50'),(2,1,0,NULL,NULL,'/products',NULL,0,'Products',NULL,'_self',1,'2024-01-31 02:40:50','2024-01-31 02:40:50'),(3,1,2,1,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/office-bags',NULL,0,'Woman wallet',NULL,'_self',0,'2024-01-31 02:40:50','2024-01-31 02:40:50'),(4,1,2,2,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/hand-bag',NULL,0,'Office bags',NULL,'_self',0,'2024-01-31 02:40:50','2024-01-31 02:40:50'),(5,1,2,3,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/woman',NULL,0,'Hand bag',NULL,'_self',0,'2024-01-31 02:40:50','2024-01-31 02:40:50'),(6,1,2,4,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/woman-wallet',NULL,0,'Backpack',NULL,'_self',0,'2024-01-31 02:40:50','2024-01-31 02:40:50'),(7,1,0,2,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog',NULL,'_self',0,'2024-01-31 02:40:50','2024-01-31 02:40:50'),(8,1,0,5,'Botble\\Page\\Models\\Page','/faqs',NULL,0,'FAQ',NULL,'_self',0,'2024-01-31 02:40:50','2024-01-31 02:40:50'),(9,1,0,3,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2024-01-31 02:40:50','2024-01-31 02:40:50'),(10,2,0,NULL,NULL,'/login',NULL,0,'Login',NULL,'_self',0,'2024-01-31 02:40:50','2024-01-31 02:40:50'),(11,2,0,NULL,NULL,'/register',NULL,0,'Register',NULL,'_self',0,'2024-01-31 02:40:50','2024-01-31 02:40:50'),(12,2,0,2,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog',NULL,'_self',0,'2024-01-31 02:40:50','2024-01-31 02:40:50'),(13,2,0,3,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2024-01-31 02:40:50','2024-01-31 02:40:50');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2024-01-31 02:40:50','2024-01-31 02:40:50'),(2,'Customer services','customer-services','published','2024-01-31 02:40:50','2024-01-31 02:40:50');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',1,'Botble\\Ecommerce\\Models\\Product','2024-01-31 02:40:40','2024-01-31 02:40:40'),(2,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',2,'Botble\\Ecommerce\\Models\\Product','2024-01-31 02:40:40','2024-01-31 02:40:40'),(3,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',3,'Botble\\Ecommerce\\Models\\Product','2024-01-31 02:40:40','2024-01-31 02:40:40'),(4,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',4,'Botble\\Ecommerce\\Models\\Product','2024-01-31 02:40:40','2024-01-31 02:40:40'),(5,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',5,'Botble\\Ecommerce\\Models\\Product','2024-01-31 02:40:40','2024-01-31 02:40:40'),(6,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',6,'Botble\\Ecommerce\\Models\\Product','2024-01-31 02:40:40','2024-01-31 02:40:40'),(7,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',7,'Botble\\Ecommerce\\Models\\Product','2024-01-31 02:40:40','2024-01-31 02:40:40'),(8,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',8,'Botble\\Ecommerce\\Models\\Product','2024-01-31 02:40:40','2024-01-31 02:40:40'),(9,'image','[\"flash-sales\\/1.jpg\"]',1,'Botble\\Ecommerce\\Models\\FlashSale','2024-01-31 02:40:48','2024-01-31 02:40:48'),(10,'image','[\"flash-sales\\/2.jpg\"]',2,'Botble\\Ecommerce\\Models\\FlashSale','2024-01-31 02:40:48','2024-01-31 02:40:48'),(11,'button_text','[\"Shop now\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2024-01-31 02:40:48','2024-01-31 02:40:48'),(12,'button_text','[\"Discover now\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2024-01-31 02:40:48','2024-01-31 02:40:48'),(13,'button_text','[\"Shop now\"]',3,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2024-01-31 02:40:48','2024-01-31 02:40:48');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_04_09_032329_create_base_tables',1),(2,'2013_04_09_062329_create_revisions_table',1),(3,'2014_10_12_000000_create_users_table',1),(4,'2014_10_12_100000_create_password_reset_tokens_table',1),(5,'2016_06_10_230148_create_acl_tables',1),(6,'2016_06_14_230857_create_menus_table',1),(7,'2016_06_28_221418_create_pages_table',1),(8,'2016_10_05_074239_create_setting_table',1),(9,'2016_11_28_032840_create_dashboard_widget_tables',1),(10,'2016_12_16_084601_create_widgets_table',1),(11,'2017_05_09_070343_create_media_tables',1),(12,'2017_11_03_070450_create_slug_table',1),(13,'2019_01_05_053554_create_jobs_table',1),(14,'2019_08_19_000000_create_failed_jobs_table',1),(15,'2019_12_14_000001_create_personal_access_tokens_table',1),(16,'2022_04_20_100851_add_index_to_media_table',1),(17,'2022_04_20_101046_add_index_to_menu_table',1),(18,'2022_07_10_034813_move_lang_folder_to_root',1),(19,'2022_08_04_051940_add_missing_column_expires_at',1),(20,'2022_09_01_000001_create_admin_notifications_tables',1),(21,'2022_10_14_024629_drop_column_is_featured',1),(22,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(23,'2022_12_02_093615_update_slug_index_columns',1),(24,'2023_01_30_024431_add_alt_to_media_table',1),(25,'2023_02_16_042611_drop_table_password_resets',1),(26,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(27,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(28,'2023_08_21_090810_make_page_content_nullable',1),(29,'2023_09_14_021936_update_index_for_slugs_table',1),(30,'2023_12_06_100448_change_random_hash_for_media',1),(31,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(32,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(33,'2015_06_29_025744_create_audit_history',2),(34,'2023_11_14_033417_change_request_column_in_table_audit_histories',2),(35,'2015_06_18_033822_create_blog_table',3),(36,'2021_02_16_092633_remove_default_value_for_author_type',3),(37,'2021_12_03_030600_create_blog_translations',3),(38,'2022_04_19_113923_add_index_to_table_posts',3),(39,'2023_08_29_074620_make_column_author_id_nullable',3),(40,'2016_06_17_091537_create_contacts_table',4),(41,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',4),(42,'2020_03_05_041139_create_ecommerce_tables',5),(43,'2021_01_01_044147_ecommerce_create_flash_sale_table',5),(44,'2021_01_17_082713_add_column_is_featured_to_product_collections_table',5),(45,'2021_01_18_024333_add_zip_code_into_table_customer_addresses',5),(46,'2021_02_18_073505_update_table_ec_reviews',5),(47,'2021_03_10_024419_add_column_confirmed_at_to_table_ec_customers',5),(48,'2021_03_10_025153_change_column_tax_amount',5),(49,'2021_03_20_033103_add_column_availability_to_table_ec_products',5),(50,'2021_04_28_074008_ecommerce_create_product_label_table',5),(51,'2021_05_31_173037_ecommerce_create_ec_products_translations',5),(52,'2021_08_17_105016_remove_column_currency_id_in_some_tables',5),(53,'2021_08_30_142128_add_images_column_to_ec_reviews_table',5),(54,'2021_10_04_030050_add_column_created_by_to_table_ec_products',5),(55,'2021_10_05_122616_add_status_column_to_ec_customers_table',5),(56,'2021_11_03_025806_nullable_phone_number_in_ec_customer_addresses',5),(57,'2021_11_23_071403_correct_languages_for_product_variations',5),(58,'2021_11_28_031808_add_product_tags_translations',5),(59,'2021_12_01_031123_add_featured_image_to_ec_products',5),(60,'2022_01_01_033107_update_table_ec_shipments',5),(61,'2022_02_16_042457_improve_product_attribute_sets',5),(62,'2022_03_22_075758_correct_product_name',5),(63,'2022_04_19_113334_add_index_to_ec_products',5),(64,'2022_04_28_144405_remove_unused_table',5),(65,'2022_05_05_115015_create_ec_customer_recently_viewed_products_table',5),(66,'2022_05_18_143720_add_index_to_table_ec_product_categories',5),(67,'2022_06_16_095633_add_index_to_some_tables',5),(68,'2022_06_30_035148_create_order_referrals_table',5),(69,'2022_07_24_153815_add_completed_at_to_ec_orders_table',5),(70,'2022_08_14_032836_create_ec_order_returns_table',5),(71,'2022_08_14_033554_create_ec_order_return_items_table',5),(72,'2022_08_15_040324_add_billing_address',5),(73,'2022_08_30_091114_support_digital_products_table',5),(74,'2022_09_13_095744_create_options_table',5),(75,'2022_09_13_104347_create_option_value_table',5),(76,'2022_10_05_163518_alter_table_ec_order_product',5),(77,'2022_10_12_041517_create_invoices_table',5),(78,'2022_10_12_142226_update_orders_table',5),(79,'2022_10_13_024916_update_table_order_returns',5),(80,'2022_10_21_030830_update_columns_in_ec_shipments_table',5),(81,'2022_10_28_021046_update_columns_in_ec_shipments_table',5),(82,'2022_11_16_034522_update_type_column_in_ec_shipping_rules_table',5),(83,'2022_11_19_041643_add_ec_tax_product_table',5),(84,'2022_12_12_063830_update_tax_defadult_in_ec_tax_products_table',5),(85,'2022_12_17_041532_fix_address_in_order_invoice',5),(86,'2022_12_26_070329_create_ec_product_views_table',5),(87,'2023_01_04_033051_fix_product_categories',5),(88,'2023_01_09_050400_add_ec_global_options_translations_table',5),(89,'2023_01_10_093754_add_missing_option_value_id',5),(90,'2023_01_17_082713_add_column_barcode_and_cost_per_item_to_product_table',5),(91,'2023_01_26_021854_add_ec_customer_used_coupons_table',5),(92,'2023_02_08_015900_update_options_column_in_ec_order_product_table',5),(93,'2023_02_27_095752_remove_duplicate_reviews',5),(94,'2023_03_20_115757_add_user_type_column_to_ec_shipment_histories_table',5),(95,'2023_04_21_082427_create_ec_product_categorizables_table',5),(96,'2023_05_03_011331_add_missing_column_price_into_invoice_items_table',5),(97,'2023_05_17_025812_fix_invoice_issue',5),(98,'2023_05_26_073140_move_option_make_phone_field_optional_at_checkout_page_to_mandatory_fields',5),(99,'2023_05_27_144611_fix_exchange_rate_setting',5),(100,'2023_06_22_084331_add_generate_license_code_to_ec_products_table',5),(101,'2023_06_30_042512_create_ec_order_tax_information_table',5),(102,'2023_07_14_022724_remove_column_id_from_ec_product_collection_products',5),(103,'2023_08_09_012940_remove_column_status_in_ec_product_attributes',5),(104,'2023_08_15_064505_create_ec_tax_rules_table',5),(105,'2023_08_21_021819_make_column_address_in_ec_customer_addresses_nullable',5),(106,'2023_08_22_094114_drop_unique_for_barcode',5),(107,'2023_08_30_031811_add_apply_via_url_column_to_ec_discounts_table',5),(108,'2023_09_07_094312_add_index_to_product_sku_and_translations',5),(109,'2023_09_19_024955_create_discount_product_categories_table',5),(110,'2023_10_17_070728_add_icon_and_icon_image_to_product_categories_table',5),(111,'2023_11_22_154643_add_unique_in_table_ec_products_variations',5),(112,'2023_11_27_032313_add_price_columns_to_ec_product_cross_sale_relations_table',5),(113,'2023_12_06_023945_add_display_on_checkout_column_to_ec_discounts_table',5),(114,'2023_12_25_040604_ec_create_review_replies_table',5),(115,'2023_12_26_090340_add_private_notes_column_to_ec_customers_table',5),(116,'2024_01_16_070706_fix_translation_tables',5),(117,'2024_01_23_075227_add_proof_file_to_ec_orders_table',5),(118,'2018_07_09_221238_create_faq_table',6),(119,'2021_12_03_082134_create_faq_translations',6),(120,'2023_11_17_063408_add_description_column_to_faq_categories_table',6),(121,'2016_10_13_150201_create_galleries_table',7),(122,'2021_12_03_082953_create_gallery_translations',7),(123,'2022_04_30_034048_create_gallery_meta_translations_table',7),(124,'2023_08_29_075308_make_column_user_id_nullable',7),(125,'2016_10_03_032336_create_languages_table',8),(126,'2023_09_14_022423_add_index_for_language_table',8),(127,'2021_10_25_021023_fix-priority-load-for-language-advanced',9),(128,'2021_12_03_075608_create_page_translations',9),(129,'2023_07_06_011444_create_slug_translations_table',9),(130,'2019_11_18_061011_create_country_table',10),(131,'2021_12_03_084118_create_location_translations',10),(132,'2021_12_03_094518_migrate_old_location_data',10),(133,'2021_12_10_034440_switch_plugin_location_to_use_language_advanced',10),(134,'2022_01_16_085908_improve_plugin_location',10),(135,'2022_08_04_052122_delete_location_backup_tables',10),(136,'2023_04_23_061847_increase_state_translations_abbreviation_column',10),(137,'2023_07_26_041451_add_more_columns_to_location_table',10),(138,'2023_07_27_041451_add_more_columns_to_location_translation_table',10),(139,'2023_08_15_073307_drop_unique_in_states_cities_translations',10),(140,'2023_10_21_065016_make_state_id_in_table_cities_nullable',10),(141,'2017_10_24_154832_create_newsletter_table',11),(142,'2017_05_18_080441_create_payment_tables',12),(143,'2021_03_27_144913_add_customer_type_into_table_payments',12),(144,'2021_05_24_034720_make_column_currency_nullable',12),(145,'2021_08_09_161302_add_metadata_column_to_payments_table',12),(146,'2021_10_19_020859_update_metadata_field',12),(147,'2022_06_28_151901_activate_paypal_stripe_plugin',12),(148,'2022_07_07_153354_update_charge_id_in_table_payments',12),(149,'2017_07_11_140018_create_simple_slider_table',13),(150,'2016_10_07_193005_create_translations_table',14),(151,'2023_12_12_105220_drop_translations_table',14);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage','<div>[simple-slider key=\"home-slider\"][/simple-slider]</div><div>[featured-product-categories title=\"Top Categories\" subtitle=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim Nullam nunc varius.\"][/featured-product-categories]</div><div>[product-collections title=\"A change of Season\" subtitle=\"Update your wardrobe with new seasonal trend\"][/product-collections]</div><div>[flash-sale title=\"Deal of the day\" subtitle=\"Best Deals For You\" show_popup=\"yes\"][/flash-sale]</div><div>[featured-products title=\"Our Picks For You\" subtitle=\"Always find the best ways for you\" limit=\"8\"][/featured-products]</div><div>[trending-products title=\"Trending Products\" subtitle=\"Products on trending\" limit=\"4\"][/trending-products]</div><div>[featured-brands title=\"Our Brands\"][/featured-brands]</div><div>[news title=\"Visit Our Blog\" subtitle=\"Our Blog updated the newest trend of the world regularly\"][/news]</div><div>[theme-galleries title=\"@ OUR GALLERIES\" subtitle=\"Our latest fashion galleries images\" limit=\"8\"][/theme-galleries]</div><div>[site-features icon1=\"icon-truck\" title1=\"FREE SHIPPING\" subtitle1=\"Free shipping on all US order or order above $200\" icon2=\"icon-life-buoy\" title2=\"SUPPORT 24/7\" subtitle2=\"Contact us 24 hours a day, 7 days a week\" icon3=\"icon-refresh-ccw\" title3=\"30 DAYS RETURN\" subtitle3=\"Simply return it within 30 days for an exchange\" icon4=\"icon-shield\" title4=\"100% PAYMENT SECURE\" subtitle4=\"We ensure secure payment with PEV\"][/site-features]</div>',1,NULL,'homepage',NULL,'published','2024-01-31 02:40:49','2024-01-31 02:40:49'),(2,'Blog','<p style=\"text-align: center\">We always share fashion tips with the hope you guys will find the best style for yourself.<br />Besides, we update the fashion trend as soon as we can.<br />Enjoy your journey!</p>',1,NULL,'default',NULL,'published','2024-01-31 02:40:49','2024-01-31 02:40:49'),(3,'Contact','<p>[contact-form][/contact-form]</p>',1,NULL,'default',NULL,'published','2024-01-31 02:40:49','2024-01-31 02:40:49'),(4,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,'default',NULL,'published','2024-01-31 02:40:49','2024-01-31 02:40:49'),(5,'FAQs','<div>[faqs][/faqs]</div>',1,NULL,'default',NULL,'published','2024-01-31 02:40:49','2024-01-31 02:40:49');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` bigint unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'USD',0,'VB9D6O1OGJ','paystack',NULL,665.00,1,'completed','confirm',4,NULL,NULL,'2024-01-31 02:40:44','2024-01-31 02:40:44','Botble\\Ecommerce\\Models\\Customer',NULL),(2,'USD',0,'JHSEGSS8BC','sslcommerz',NULL,1020.00,2,'completed','confirm',5,NULL,NULL,'2024-01-31 02:40:44','2024-01-31 02:40:44','Botble\\Ecommerce\\Models\\Customer',NULL),(3,'USD',0,'6J7DQLCPQB','paystack',NULL,396.00,3,'completed','confirm',2,NULL,NULL,'2024-01-31 02:40:44','2024-01-31 02:40:44','Botble\\Ecommerce\\Models\\Customer',NULL),(4,'USD',0,'WV6DRR6RJU','sslcommerz',NULL,888.00,4,'completed','confirm',1,NULL,NULL,'2024-01-31 02:40:45','2024-01-31 02:40:45','Botble\\Ecommerce\\Models\\Customer',NULL),(5,'USD',0,'4XTEETRHWB','mollie',NULL,831.00,5,'completed','confirm',3,NULL,NULL,'2024-01-31 02:40:45','2024-01-31 02:40:45','Botble\\Ecommerce\\Models\\Customer',NULL),(6,'USD',0,'6VYKUI5YCN','razorpay',NULL,509.00,6,'completed','confirm',8,NULL,NULL,'2024-01-31 02:40:45','2024-01-31 02:40:45','Botble\\Ecommerce\\Models\\Customer',NULL),(7,'USD',0,'I79E1WREJW','sslcommerz',NULL,1436.00,7,'completed','confirm',5,NULL,NULL,'2024-01-31 02:40:45','2024-01-31 02:40:45','Botble\\Ecommerce\\Models\\Customer',NULL),(8,'USD',0,'MADV1YPAVE','razorpay',NULL,1771.00,8,'completed','confirm',10,NULL,NULL,'2024-01-31 02:40:45','2024-01-31 02:40:45','Botble\\Ecommerce\\Models\\Customer',NULL),(9,'USD',0,'E0WGYAN9V8','razorpay',NULL,264.00,9,'completed','confirm',2,NULL,NULL,'2024-01-31 02:40:46','2024-01-31 02:40:46','Botble\\Ecommerce\\Models\\Customer',NULL),(10,'USD',0,'CIVPGGVVFJ','sslcommerz',NULL,336.00,10,'completed','confirm',1,NULL,NULL,'2024-01-31 02:40:46','2024-01-31 02:40:46','Botble\\Ecommerce\\Models\\Customer',NULL),(11,'USD',0,'YVKRWEHPDG','paystack',NULL,857.00,11,'completed','confirm',1,NULL,NULL,'2024-01-31 02:40:46','2024-01-31 02:40:46','Botble\\Ecommerce\\Models\\Customer',NULL),(12,'USD',0,'MZLIYZD94E','bank_transfer',NULL,1844.00,12,'pending','confirm',5,NULL,NULL,'2024-01-31 02:40:46','2024-01-31 02:40:46','Botble\\Ecommerce\\Models\\Customer',NULL),(13,'USD',0,'9INRUJJRFS','sslcommerz',NULL,830.00,13,'completed','confirm',8,NULL,NULL,'2024-01-31 02:40:46','2024-01-31 02:40:46','Botble\\Ecommerce\\Models\\Customer',NULL),(14,'USD',0,'KDMATZ3XIE','cod',NULL,625.00,14,'pending','confirm',6,NULL,NULL,'2024-01-31 02:40:46','2024-01-31 02:40:46','Botble\\Ecommerce\\Models\\Customer',NULL),(15,'USD',0,'BESHLOV04J','paystack',NULL,1292.00,15,'completed','confirm',2,NULL,NULL,'2024-01-31 02:40:47','2024-01-31 02:40:47','Botble\\Ecommerce\\Models\\Customer',NULL),(16,'USD',0,'WIKCY2Y0OG','paystack',NULL,1261.00,16,'completed','confirm',6,NULL,NULL,'2024-01-31 02:40:47','2024-01-31 02:40:47','Botble\\Ecommerce\\Models\\Customer',NULL),(17,'USD',0,'SFNIHIJO5B','bank_transfer',NULL,1045.00,17,'pending','confirm',3,NULL,NULL,'2024-01-31 02:40:47','2024-01-31 02:40:47','Botble\\Ecommerce\\Models\\Customer',NULL),(18,'USD',0,'N3SHTPG5D1','paypal',NULL,975.00,18,'completed','confirm',4,NULL,NULL,'2024-01-31 02:40:47','2024-01-31 02:40:47','Botble\\Ecommerce\\Models\\Customer',NULL),(19,'USD',0,'YYCWHRXWDG','sslcommerz',NULL,1502.00,19,'completed','confirm',1,NULL,NULL,'2024-01-31 02:40:47','2024-01-31 02:40:47','Botble\\Ecommerce\\Models\\Customer',NULL),(20,'USD',0,'HLTADSCTCF','cod',NULL,1143.00,20,'pending','confirm',2,NULL,NULL,'2024-01-31 02:40:47','2024-01-31 02:40:47','Botble\\Ecommerce\\Models\\Customer',NULL);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,1),(3,1),(1,2),(4,2),(1,3),(3,3),(2,4),(3,4),(2,5),(4,5),(1,6),(4,6),(1,7),(3,7),(2,8),(4,8),(2,9),(3,9),(1,10),(4,10),(2,11),(3,11);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2),(1,3),(2,3),(3,3),(4,3),(5,3),(1,4),(2,4),(3,4),(4,4),(5,4),(1,5),(2,5),(3,5),(4,5),(5,5),(1,6),(2,6),(3,6),(4,6),(5,6),(1,7),(2,7),(3,7),(4,7),(5,7),(1,8),(2,8),(3,8),(4,8),(5,8),(1,9),(2,9),(3,9),(4,9),(5,9),(1,10),(2,10),(3,10),(4,10),(5,10),(1,11),(2,11),(3,11),(4,11),(5,11);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'4 Expert Tips On How To Choose The Right Men’s Wallet','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',NULL,'Botble\\ACL\\Models\\User',1,'news/1.jpg',396,NULL,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(2,'Sexy Clutches: How to Buy &amp; Wear a Designer Clutch Bag','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',NULL,'Botble\\ACL\\Models\\User',1,'news/2.jpg',996,NULL,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(3,'The Top 2020 Handbag Trends to Know','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',NULL,'Botble\\ACL\\Models\\User',1,'news/3.jpg',1909,NULL,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(4,'How to Match the Color of Your Handbag With an Outfit','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',NULL,'Botble\\ACL\\Models\\User',1,'news/4.jpg',1636,NULL,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(5,'How to Care for Leather Bags','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',NULL,'Botble\\ACL\\Models\\User',1,'news/5.jpg',295,NULL,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(6,'We\'re Crushing Hard on Summer\'s 10 Biggest Bag Trends','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',NULL,'Botble\\ACL\\Models\\User',1,'news/6.jpg',847,NULL,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(7,'Essential Qualities of Highly Successful Music','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',NULL,'Botble\\ACL\\Models\\User',1,'news/7.jpg',2260,NULL,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(8,'9 Things I Love About Shaving My Head','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',NULL,'Botble\\ACL\\Models\\User',1,'news/8.jpg',658,NULL,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(9,'Why Teamwork Really Makes The Dream Work','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',NULL,'Botble\\ACL\\Models\\User',1,'news/9.jpg',1652,NULL,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(10,'The World Caters to Average People','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',NULL,'Botble\\ACL\\Models\\User',1,'news/10.jpg',1671,NULL,'2024-01-31 02:40:49','2024-01-31 02:40:49'),(11,'The litigants on the screen are not actors','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',NULL,'Botble\\ACL\\Models\\User',0,'news/11.jpg',841,NULL,'2024-01-31 02:40:49','2024-01-31 02:40:49');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.manage.license\":true,\"extensions.index\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.cronjob\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"plugins.captcha\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.settings\":true,\"plugins.ecommerce\":true,\"ecommerce.settings\":true,\"ecommerce.report.index\":true,\"products.index\":true,\"products.create\":true,\"products.edit\":true,\"products.destroy\":true,\"products.duplicate\":true,\"product-categories.index\":true,\"product-categories.create\":true,\"product-categories.edit\":true,\"product-categories.destroy\":true,\"product-tag.index\":true,\"product-tag.create\":true,\"product-tag.edit\":true,\"product-tag.destroy\":true,\"brands.index\":true,\"brands.create\":true,\"brands.edit\":true,\"brands.destroy\":true,\"product-collections.index\":true,\"product-collections.create\":true,\"product-collections.edit\":true,\"product-collections.destroy\":true,\"product-attribute-sets.index\":true,\"product-attribute-sets.create\":true,\"product-attribute-sets.edit\":true,\"product-attribute-sets.destroy\":true,\"product-attributes.index\":true,\"product-attributes.create\":true,\"product-attributes.edit\":true,\"product-attributes.destroy\":true,\"tax.index\":true,\"tax.create\":true,\"tax.edit\":true,\"tax.destroy\":true,\"reviews.index\":true,\"reviews.create\":true,\"reviews.destroy\":true,\"reviews.publish\":true,\"reviews.reply\":true,\"shipping_methods.index\":true,\"ecommerce.shipping-rule-items.index\":true,\"ecommerce.shipping-rule-items.create\":true,\"ecommerce.shipping-rule-items.edit\":true,\"ecommerce.shipping-rule-items.destroy\":true,\"ecommerce.shipping-rule-items.bulk-import\":true,\"ecommerce.shipments.index\":true,\"ecommerce.shipments.create\":true,\"ecommerce.shipments.edit\":true,\"ecommerce.shipments.destroy\":true,\"orders.index\":true,\"orders.create\":true,\"orders.edit\":true,\"orders.destroy\":true,\"discounts.index\":true,\"discounts.create\":true,\"discounts.edit\":true,\"discounts.destroy\":true,\"customers.index\":true,\"customers.create\":true,\"customers.edit\":true,\"customers.destroy\":true,\"flash-sale.index\":true,\"flash-sale.create\":true,\"flash-sale.edit\":true,\"flash-sale.destroy\":true,\"product-label.index\":true,\"product-label.create\":true,\"product-label.edit\":true,\"product-label.destroy\":true,\"ecommerce.import.products.index\":true,\"ecommerce.export.products.index\":true,\"order_returns.index\":true,\"order_returns.edit\":true,\"order_returns.destroy\":true,\"global-option.index\":true,\"global-option.create\":true,\"global-option.edit\":true,\"global-option.destroy\":true,\"ecommerce.invoice.index\":true,\"ecommerce.invoice.edit\":true,\"ecommerce.invoice.destroy\":true,\"ecommerce.invoice-template.index\":true,\"ecommerce.settings.general\":true,\"ecommerce.settings.currencies\":true,\"ecommerce.settings.products\":true,\"ecommerce.settings.product-search\":true,\"ecommerce.settings.digital-products\":true,\"ecommerce.settings.store-locators\":true,\"ecommerce.settings.invoices\":true,\"ecommerce.settings.product-reviews\":true,\"ecommerce.settings.customers\":true,\"ecommerce.settings.shopping\":true,\"ecommerce.settings.taxes\":true,\"ecommerce.settings.shipping\":true,\"ecommerce.settings.tracking\":true,\"ecommerce.settings.standard-and-format\":true,\"ecommerce.settings.checkout\":true,\"ecommerce.settings.return\":true,\"ecommerce.settings.flash-sale\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"faqs.settings\":true,\"galleries.index\":true,\"galleries.create\":true,\"galleries.edit\":true,\"galleries.destroy\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"location.bulk-import.index\":true,\"location.export.index\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"simple-slider.index\":true,\"simple-slider.create\":true,\"simple-slider.edit\":true,\"simple-slider.destroy\":true,\"simple-slider-item.index\":true,\"simple-slider-item.create\":true,\"simple-slider-item.edit\":true,\"simple-slider-item.destroy\":true,\"simple-slider.settings\":true,\"social-login.settings\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true}','Admin users role',1,2,2,'2024-01-31 02:40:49','2024-01-31 02:40:49');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (2,'api_enabled','0',NULL,'2024-01-31 02:40:49'),(3,'activated_plugins','[\"language\",\"language-advanced\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"ecommerce\",\"faq\",\"gallery\",\"location\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"shippo\",\"simple-slider\",\"social-login\",\"sslcommerz\",\"stripe\",\"translation\"]',NULL,'2024-01-31 02:40:49'),(8,'language_hide_default','1',NULL,'2024-01-31 02:40:49'),(10,'language_display','all',NULL,'2024-01-31 02:40:49'),(11,'language_hide_languages','[]',NULL,'2024-01-31 02:40:49'),(12,'media_random_hash','99e92dd7fdd1bc25ed6dc1f268dd2949',NULL,NULL),(13,'payment_cod_status','1',NULL,NULL),(14,'payment_bank_transfer_status','1',NULL,NULL),(15,'theme','september',NULL,NULL),(16,'show_admin_bar','1',NULL,NULL),(17,'language_switcher_display','dropdown',NULL,NULL),(18,'admin_favicon','general/favicon.png',NULL,NULL),(19,'admin_logo','general/logo-light.png',NULL,NULL),(20,'permalink-botble-blog-models-post','blog',NULL,NULL),(21,'permalink-botble-blog-models-category','blog',NULL,NULL),(22,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,NULL),(23,'payment_bank_transfer_description','Please send money to our bank account: ACB - 69270 213 19.',NULL,NULL),(24,'payment_stripe_payment_type','stripe_checkout',NULL,NULL),(25,'plugins_ecommerce_customer_new_order_status','0',NULL,NULL),(26,'plugins_ecommerce_admin_new_order_status','0',NULL,NULL),(27,'ecommerce_is_enabled_support_digital_products','1',NULL,NULL),(28,'ecommerce_load_countries_states_cities_from_location_plugin','0',NULL,NULL),(29,'payment_bank_transfer_display_bank_info_at_the_checkout_success_page','1',NULL,NULL),(30,'ecommerce_product_sku_format','HS-2443-[%S]',NULL,NULL),(31,'ecommerce_store_name','HASA SG',NULL,NULL),(32,'ecommerce_store_phone','18006268',NULL,NULL),(33,'ecommerce_store_address','North Link Building, 10 Admiralty Street',NULL,NULL),(34,'ecommerce_store_state','Singapore',NULL,NULL),(35,'ecommerce_store_city','Singapore',NULL,NULL),(36,'ecommerce_store_country','SG',NULL,NULL),(37,'theme-september-site_title','HASA',NULL,NULL),(38,'theme-september-seo_title','HASA - Multipurpose Laravel Fashion Shop',NULL,NULL),(39,'theme-september-seo_description','HASA is made specifically for a Fashion store, but also well suited for an electronics store, furniture store, etc. It’s clean and minimal. Every page is fully responsive, making your creation look good on any device.',NULL,NULL),(40,'theme-september-copyright','© 2024 Botble Technologies. All Rights Reserved.',NULL,NULL),(41,'theme-september-favicon','general/favicon.png',NULL,NULL),(42,'theme-september-logo','general/logo.png',NULL,NULL),(43,'theme-september-seo_og_image','general/open-graph-image.png',NULL,NULL),(44,'theme-september-address','North Link Building, 10 Admiralty Street, 757695 Singapore',NULL,NULL),(45,'theme-september-hotline','18006268',NULL,NULL),(46,'theme-september-email','sales@botble.com',NULL,NULL),(47,'theme-september-facebook','https://facebook.com',NULL,NULL),(48,'theme-september-twitter','https://twitter.com',NULL,NULL),(49,'theme-september-youtube','https://youtube.com',NULL,NULL),(50,'theme-september-linkedin','https://linkedin.com',NULL,NULL),(51,'theme-september-pinterest','https://pinterest.com',NULL,NULL),(52,'theme-september-instagram','https://instagram.com',NULL,NULL),(53,'theme-september-homepage_id','1',NULL,NULL),(54,'theme-september-blog_page_id','2',NULL,NULL),(55,'theme-september-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(56,'theme-september-cookie_consent_learn_more_url','https://hasa.test/cookie-policy',NULL,NULL),(57,'theme-september-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(58,'theme-september-enabled_sticky_header','yes',NULL,NULL),(59,'theme-september-product_page_banner_title','Enjoy Shopping with us',NULL,NULL),(63,'theme-september-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"fa fa-facebook\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/facebook.com.com\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"fa fa-twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/twitter.com\"}],[{\"key\":\"social-name\",\"value\":\"Instagram\"},{\"key\":\"social-icon\",\"value\":\"fa fa-instagram\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/instagram.com\"}],[{\"key\":\"social-name\",\"value\":\"Pinterest\"},{\"key\":\"social-icon\",\"value\":\"fa fa-pinterest\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/pinterest.com\"}],[{\"key\":\"social-name\",\"value\":\"Linkedin\"},{\"key\":\"social-icon\",\"value\":\"fa fa-linkedin\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/linkedin.com\"}],[{\"key\":\"social-name\",\"value\":\"Youtube\"},{\"key\":\"social-icon\",\"value\":\"fa fa-youtube\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/youtube.com\"}]]',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_slider_items`
--

DROP TABLE IF EXISTS `simple_slider_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_slider_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `simple_slider_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_slider_items`
--

LOCK TABLES `simple_slider_items` WRITE;
/*!40000 ALTER TABLE `simple_slider_items` DISABLE KEYS */;
INSERT INTO `simple_slider_items` VALUES (1,1,'New Collection','sliders/1.jpg','/products','Save more with coupons &amp; up to 70% off',1,'2024-01-31 02:40:48','2024-01-31 02:40:48'),(2,1,'Big Deals','sliders/2.jpg','/products','Headphone, Gaming Laptop, PC and more...',2,'2024-01-31 02:40:48','2024-01-31 02:40:48'),(3,1,'Trending Collection','sliders/3.jpg','/products','Save more with coupons &amp; up to 20% off',3,'2024-01-31 02:40:48','2024-01-31 02:40:48');
/*!40000 ALTER TABLE `simple_slider_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_sliders`
--

DROP TABLE IF EXISTS `simple_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_sliders`
--

LOCK TABLES `simple_sliders` WRITE;
/*!40000 ALTER TABLE `simple_sliders` DISABLE KEYS */;
INSERT INTO `simple_sliders` VALUES (1,'Home slider','home-slider',NULL,'published','2024-01-31 02:40:48','2024-01-31 02:40:48');
/*!40000 ALTER TABLE `simple_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'fashion-live',1,'Botble\\Ecommerce\\Models\\Brand','brands','2024-01-31 02:40:38','2024-01-31 02:40:38'),(2,'hand-crafted',2,'Botble\\Ecommerce\\Models\\Brand','brands','2024-01-31 02:40:38','2024-01-31 02:40:38'),(3,'mestonix',3,'Botble\\Ecommerce\\Models\\Brand','brands','2024-01-31 02:40:38','2024-01-31 02:40:38'),(4,'sunshine',4,'Botble\\Ecommerce\\Models\\Brand','brands','2024-01-31 02:40:38','2024-01-31 02:40:38'),(5,'pure',5,'Botble\\Ecommerce\\Models\\Brand','brands','2024-01-31 02:40:38','2024-01-31 02:40:38'),(6,'anfold',6,'Botble\\Ecommerce\\Models\\Brand','brands','2024-01-31 02:40:38','2024-01-31 02:40:38'),(7,'automotive',7,'Botble\\Ecommerce\\Models\\Brand','brands','2024-01-31 02:40:38','2024-01-31 02:40:38'),(8,'office-bags',1,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-31 02:40:38','2024-01-31 02:40:38'),(9,'hand-bag',2,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-31 02:40:38','2024-01-31 02:40:38'),(10,'woman',3,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-31 02:40:38','2024-01-31 02:40:38'),(11,'woman-wallet',4,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-31 02:40:38','2024-01-31 02:40:38'),(12,'denim',5,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-31 02:40:38','2024-01-31 02:40:38'),(13,'dress',6,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-31 02:40:38','2024-01-31 02:40:38'),(14,'backpack',7,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-31 02:40:38','2024-01-31 02:40:38'),(15,'bags',8,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-31 02:40:38','2024-01-31 02:40:38'),(16,'wallet',9,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-31 02:40:38','2024-01-31 02:40:38'),(17,'men',10,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-31 02:40:38','2024-01-31 02:40:38'),(18,'accessories',11,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-31 02:40:38','2024-01-31 02:40:38'),(19,'men-wallet',12,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-31 02:40:38','2024-01-31 02:40:38'),(20,'shoes',13,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-31 02:40:38','2024-01-31 02:40:38'),(21,'wallet',1,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2024-01-31 02:40:39','2024-01-31 02:40:39'),(22,'bags',2,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2024-01-31 02:40:39','2024-01-31 02:40:39'),(23,'shoes',3,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2024-01-31 02:40:39','2024-01-31 02:40:39'),(24,'clothes',4,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2024-01-31 02:40:39','2024-01-31 02:40:39'),(25,'hand-bag',5,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2024-01-31 02:40:39','2024-01-31 02:40:39'),(26,'wallet-handmade',1,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:40','2024-01-31 02:40:40'),(27,'clutch-handmade',2,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:40','2024-01-31 02:40:40'),(28,'gucci-zip-around-wallet',3,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:40','2024-01-31 02:40:40'),(29,'snapshot-standard',4,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:40','2024-01-31 02:40:40'),(30,'joan-mini-camera-bag',5,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:40','2024-01-31 02:40:40'),(31,'cyan-boheme',6,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:40','2024-01-31 02:40:40'),(32,'the-marc-jacobs',7,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:40','2024-01-31 02:40:40'),(33,'round-cross-body-bag',8,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:40','2024-01-31 02:40:40'),(34,'ecommerce',1,'Botble\\Blog\\Models\\Category','blog','2024-01-31 02:40:49','2024-01-31 02:40:49'),(35,'fashion',2,'Botble\\Blog\\Models\\Category','blog','2024-01-31 02:40:49','2024-01-31 02:40:49'),(36,'electronic',3,'Botble\\Blog\\Models\\Category','blog','2024-01-31 02:40:49','2024-01-31 02:40:49'),(37,'commercial',4,'Botble\\Blog\\Models\\Category','blog','2024-01-31 02:40:49','2024-01-31 02:40:49'),(38,'general',1,'Botble\\Blog\\Models\\Tag','tag','2024-01-31 02:40:49','2024-01-31 02:40:49'),(39,'design',2,'Botble\\Blog\\Models\\Tag','tag','2024-01-31 02:40:49','2024-01-31 02:40:49'),(40,'fashion',3,'Botble\\Blog\\Models\\Tag','tag','2024-01-31 02:40:49','2024-01-31 02:40:49'),(41,'branding',4,'Botble\\Blog\\Models\\Tag','tag','2024-01-31 02:40:49','2024-01-31 02:40:49'),(42,'modern',5,'Botble\\Blog\\Models\\Tag','tag','2024-01-31 02:40:49','2024-01-31 02:40:49'),(43,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',1,'Botble\\Blog\\Models\\Post','blog','2024-01-31 02:40:49','2024-01-31 02:40:49'),(44,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',2,'Botble\\Blog\\Models\\Post','blog','2024-01-31 02:40:49','2024-01-31 02:40:49'),(45,'the-top-2020-handbag-trends-to-know',3,'Botble\\Blog\\Models\\Post','blog','2024-01-31 02:40:49','2024-01-31 02:40:49'),(46,'how-to-match-the-color-of-your-handbag-with-an-outfit',4,'Botble\\Blog\\Models\\Post','blog','2024-01-31 02:40:49','2024-01-31 02:40:49'),(47,'how-to-care-for-leather-bags',5,'Botble\\Blog\\Models\\Post','blog','2024-01-31 02:40:49','2024-01-31 02:40:49'),(48,'were-crushing-hard-on-summers-10-biggest-bag-trends',6,'Botble\\Blog\\Models\\Post','blog','2024-01-31 02:40:49','2024-01-31 02:40:49'),(49,'essential-qualities-of-highly-successful-music',7,'Botble\\Blog\\Models\\Post','blog','2024-01-31 02:40:49','2024-01-31 02:40:49'),(50,'9-things-i-love-about-shaving-my-head',8,'Botble\\Blog\\Models\\Post','blog','2024-01-31 02:40:49','2024-01-31 02:40:49'),(51,'why-teamwork-really-makes-the-dream-work',9,'Botble\\Blog\\Models\\Post','blog','2024-01-31 02:40:49','2024-01-31 02:40:49'),(52,'the-world-caters-to-average-people',10,'Botble\\Blog\\Models\\Post','blog','2024-01-31 02:40:49','2024-01-31 02:40:49'),(53,'the-litigants-on-the-screen-are-not-actors',11,'Botble\\Blog\\Models\\Post','blog','2024-01-31 02:40:49','2024-01-31 02:40:49'),(54,'homepage',1,'Botble\\Page\\Models\\Page','','2024-01-31 02:40:49','2024-01-31 02:40:49'),(55,'blog',2,'Botble\\Page\\Models\\Page','','2024-01-31 02:40:49','2024-01-31 02:40:49'),(56,'contact',3,'Botble\\Page\\Models\\Page','','2024-01-31 02:40:49','2024-01-31 02:40:49'),(57,'cookie-policy',4,'Botble\\Page\\Models\\Page','','2024-01-31 02:40:49','2024-01-31 02:40:49'),(58,'faqs',5,'Botble\\Page\\Models\\Page','','2024-01-31 02:40:49','2024-01-31 02:40:49'),(59,'men',1,'Botble\\Gallery\\Models\\Gallery','galleries','2024-01-31 02:40:50','2024-01-31 02:40:50'),(60,'women',2,'Botble\\Gallery\\Models\\Gallery','galleries','2024-01-31 02:40:50','2024-01-31 02:40:50'),(61,'accessories',3,'Botble\\Gallery\\Models\\Gallery','galleries','2024-01-31 02:40:50','2024-01-31 02:40:50'),(62,'shoes',4,'Botble\\Gallery\\Models\\Gallery','galleries','2024-01-31 02:40:50','2024-01-31 02:40:50'),(63,'denim',5,'Botble\\Gallery\\Models\\Gallery','galleries','2024-01-31 02:40:50','2024-01-31 02:40:50'),(64,'dress',6,'Botble\\Gallery\\Models\\Gallery','galleries','2024-01-31 02:40:50','2024-01-31 02:40:50'),(65,'wallet-handmade',9,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:50','2024-01-31 02:40:50'),(66,'wallet-handmade',10,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:50','2024-01-31 02:40:50'),(67,'clutch-handmade',11,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:50','2024-01-31 02:40:50'),(68,'clutch-handmade',12,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:51','2024-01-31 02:40:51'),(69,'clutch-handmade',13,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:51','2024-01-31 02:40:51'),(70,'gucci-zip-around-wallet',14,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:51','2024-01-31 02:40:51'),(71,'gucci-zip-around-wallet',15,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:51','2024-01-31 02:40:51'),(72,'gucci-zip-around-wallet',16,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:51','2024-01-31 02:40:51'),(73,'snapshot-standard',17,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:51','2024-01-31 02:40:51'),(74,'snapshot-standard',18,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:51','2024-01-31 02:40:51'),(75,'snapshot-standard',19,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:51','2024-01-31 02:40:51'),(76,'joan-mini-camera-bag',20,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:51','2024-01-31 02:40:51'),(77,'joan-mini-camera-bag',21,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:51','2024-01-31 02:40:51'),(78,'cyan-boheme',22,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:51','2024-01-31 02:40:51'),(79,'cyan-boheme',23,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:51','2024-01-31 02:40:51'),(80,'cyan-boheme',24,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:51','2024-01-31 02:40:51'),(81,'cyan-boheme',25,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:51','2024-01-31 02:40:51'),(82,'the-marc-jacobs',26,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:51','2024-01-31 02:40:51'),(83,'the-marc-jacobs',27,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:51','2024-01-31 02:40:51'),(84,'the-marc-jacobs',28,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:51','2024-01-31 02:40:51'),(85,'round-cross-body-bag',29,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:51','2024-01-31 02:40:51'),(86,'round-cross-body-bag',30,'Botble\\Ecommerce\\Models\\Product','products','2024-01-31 02:40:51','2024-01-31 02:40:51');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `states_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_translations`
--

DROP TABLE IF EXISTS `states_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_translations`
--

LOCK TABLES `states_translations` WRITE;
/*!40000 ALTER TABLE `states_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'General',NULL,'Botble\\ACL\\Models\\User','','published','2024-01-31 02:40:49','2024-01-31 02:40:49'),(2,'Design',NULL,'Botble\\ACL\\Models\\User','','published','2024-01-31 02:40:49','2024-01-31 02:40:49'),(3,'Fashion',NULL,'Botble\\ACL\\Models\\User','','published','2024-01-31 02:40:49','2024-01-31 02:40:49'),(4,'Branding',NULL,'Botble\\ACL\\Models\\User','','published','2024-01-31 02:40:49','2024-01-31 02:40:49'),(5,'Modern',NULL,'Botble\\ACL\\Models\\User','','published','2024-01-31 02:40:49','2024-01-31 02:40:49');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'osbaldo.feest@greenholt.com',NULL,'$2y$12$D1W3.yqV6gYESoDmX4cF0.uvX0oiQAY1Ezit7q6xhagCNDWlZfgbq',NULL,'2024-01-31 02:40:48','2024-01-31 02:40:48','Jalon','Rath','botble',NULL,1,1,NULL,NULL),(2,'caden.gorczany@littel.com',NULL,'$2y$12$98ro1HBkMK.L.4wud0JxBegSBZt5bewk9OIzuLyKmWlAdDH1FjTq6',NULL,'2024-01-31 02:40:49','2024-01-31 02:40:49','Isaac','Schimmel','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'CustomMenuWidget','footer_sidebar','september',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Customer services\",\"menu_id\":\"customer-services\"}','2024-01-31 02:40:50','2024-01-31 02:40:50');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-31 16:40:52
