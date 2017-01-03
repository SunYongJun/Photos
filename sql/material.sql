-- MySQL dump 10.13  Distrib 5.7.12, for osx10.11 (x86_64)
--
-- Host: localhost    Database: material
-- ------------------------------------------------------
-- Server version	5.7.12

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
-- Table structure for table `auth_groups`
--

DROP TABLE IF EXISTS `auth_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '标题',
  `rules` varchar(255) NOT NULL COMMENT '规则组',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_groups`
--

LOCK TABLES `auth_groups` WRITE;
/*!40000 ALTER TABLE `auth_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rules`
--

DROP TABLE IF EXISTS `auth_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '标题',
  `route` varchar(20) NOT NULL COMMENT '路由名称',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rules`
--

LOCK TABLES `auth_rules` WRITE;
/*!40000 ALTER TABLE `auth_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maxes`
--

DROP TABLE IF EXISTS `maxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maxes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `path` varchar(255) NOT NULL,
  `photo_size` varchar(255) NOT NULL,
  `keywords` text,
  `description` text,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maxes`
--

LOCK TABLES `maxes` WRITE;
/*!40000 ALTER TABLE `maxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `maxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mayas`
--

DROP TABLE IF EXISTS `mayas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mayas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `path` varchar(255) NOT NULL,
  `photo_size` varchar(255) NOT NULL,
  `keywords` text,
  `description` text,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mayas`
--

LOCK TABLES `mayas` WRITE;
/*!40000 ALTER TABLE `mayas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mayas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `resize_path` varchar(255) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `keywords` text,
  `description` text,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (8,1,'诱惑','/assets/resize/20160729/072438579b04b61efca.jpg','/assets/uploads/photo/20160729/579b04b61ed46.jpg','girl',NULL,1,'2016-07-29 07:24:57','2016-08-16 03:32:22',NULL),(9,1,'青春','/assets/resize/20160729/072554579b050250e72.jpg','/assets/uploads/photo/20160729/579b050250b8d.jpg','青春',NULL,1,'2016-07-29 07:26:07','2016-08-16 03:32:22',NULL),(10,1,'星空','/assets/resize/20160729/072612579b05145f794.jpg','/assets/uploads/photo/20160729/579b05145f523.jpg','星空',NULL,1,'2016-07-29 07:26:21','2016-08-16 03:32:22',NULL),(11,1,'雪山','/assets/resize/20160729/073017579b060922081.jpg','/assets/uploads/photo/20160729/579b060921eac.jpg','雪山',NULL,1,'2016-07-29 07:30:34','2016-08-16 03:32:22',NULL),(12,1,'仰望','/assets/resize/20160729/081227579b0febaeba7.jpg','/assets/uploads/photo/20160729/579b0febae4c9.jpg','仰望',NULL,1,'2016-07-29 08:12:37','2016-08-16 03:32:22',NULL),(13,1,'自然','/assets/resize/20160729/081255579b10075b8d4.jpg','/assets/uploads/photo/20160729/579b10075b5ed.jpg','大自然',NULL,1,'2016-07-29 08:13:13','2016-08-16 03:32:22',NULL),(14,1,'DOG','/assets/resize/20160729/081330579b102af0fb7.jpg','/assets/uploads/photo/20160729/579b102af0b7c.jpg','dog',NULL,1,'2016-07-29 08:13:53','2016-08-16 03:32:22',NULL),(15,1,'远方','/assets/resize/20160729/081927579b118f81ee0.jpg','/assets/uploads/photo/20160729/579b118f81a8e.jpg','远方',NULL,1,'2016-07-29 08:19:41','2016-08-16 03:32:22',NULL),(16,1,'森林','/assets/resize/20160729/082002579b11b263dab.jpg','/assets/uploads/photo/20160729/579b11b263a7b.jpg','迷雾森林',NULL,1,'2016-07-29 08:20:23','2016-08-16 03:32:22',NULL),(17,1,'回眸','/assets/resize/20160729/082141579b121544e10.jpg','/assets/uploads/photo/20160729/579b121544ac3.jpg','回眸',NULL,1,'2016-07-29 08:21:53','2016-08-16 03:32:22',NULL),(18,1,'角度','/assets/resize/20160729/082727579b136fd67f7.jpg','/assets/uploads/photo/20160729/579b136fd649a.jpg','girl',NULL,1,'2016-07-29 08:27:45','2016-08-16 03:32:22',NULL),(20,1,'窗外','/assets/resize/20160815/11322557b1a8492480b.jpg','/assets/uploads/photo/20160815/57b1a84923f2b.jpg','美',NULL,1,'2016-08-15 11:32:32','2016-08-16 03:32:22',NULL),(21,1,'画','/assets/resize/20160816/02425357b27dad72274.jpg','/assets/uploads/photo/20160816/57b27dad71a38.jpg','画',NULL,1,'2016-08-16 02:43:15','2016-08-16 03:32:22',NULL);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','41375682@qq.com','$2y$10$iUd2lY6Xb58GmbM21IPQvuK1k8dplwgxyae3aVcFnW4npJvmTNv4a','KIVRIoRaYXsMv9JPEiLgiGYwRjBZhh2X4zT0FkHmWP9TPenHeVlVcjVRWtEN','/assets/uploads/photo/20160824/57bd627b4b3b9.png','2016-07-17 20:54:04','2016-08-24 01:01:47'),(2,'白子画','791310769@qq.com','$2y$10$1uXt5OlKCx2puxH9f0lvh.KSq5zaLvH6xIshrsZe3wy5rCzIACiZK','RL3iWBw9zo4mf4QPJ5fm5gbenUHG0FBjBolaj08azXUOoohjAyndjBxGer3N','/assets/uploads/photo/20160818/57b5788030cda.png','2016-08-16 17:20:13','2016-08-18 00:57:38'),(3,'大圣','sunyj113@chinaunicom.cn','',NULL,'/assets/uploads/photo/20160818/57b578a18b01c.png','2016-08-16 20:51:16','2016-08-18 00:58:10'),(4,'大圣','1@qq.com','',NULL,'/assets/uploads/photo/20160818/57b5263f0622f.png','2016-08-17 19:06:40','2016-08-17 19:06:40'),(5,'大圣111','2@11.com','',NULL,'/assets/uploads/photo/20160818/57b5276200a22.png','2016-08-17 19:11:49','2016-08-17 19:11:49'),(8,'111','23@qq.com','111111',NULL,'/assets/uploads/photo/20160818/57b579fe590de.png','2016-08-18 01:04:50','2016-08-18 02:11:46'),(10,'1123','suj113@chinaunicom.cn','111111',NULL,'/assets/uploads/photo/20160818/57b58a7f41a44.png','2016-08-18 02:14:29','2016-08-18 02:14:29'),(11,'12','s13@chinaunicom.cn','111111',NULL,'/assets/uploads/photo/20160819/57b662f2e89a8.png','2016-08-18 02:57:37','2016-08-18 17:37:55'),(12,'打瞌睡','321@qq.com','111111',NULL,'/assets/uploads/photo/20160818/57b594ced2f4b.png','2016-08-18 02:58:23','2016-08-18 02:58:23'),(13,'ar','111@qq.com','111111',NULL,'/assets/uploads/photo/20160819/57b6a2fc61789.png','2016-08-18 02:58:52','2016-08-18 22:11:10'),(14,'大圣','ffff@qq.com','111111',NULL,'/assets/uploads/photo/20160818/57b59507583c7.png','2016-08-18 02:59:20','2016-08-18 02:59:20'),(15,'2','syj113@chinaunicom.cn1','111111',NULL,'/assets/uploads/photo/20160819/57b6906c25ba1.png','2016-08-18 20:51:57','2016-08-18 20:51:57'),(16,'111','133@qq.com','111111',NULL,'/assets/uploads/photo/20160819/57b69f6f3adec.png','2016-08-18 21:13:31','2016-08-18 21:56:00'),(17,'11111','11111@qq.com','1111111',NULL,'/assets/uploads/photo/20160819/57b6a3234f9b1.png','2016-08-18 21:54:48','2016-08-18 22:11:49'),(18,'222222','222222@qq.com','1111111',NULL,'/assets/uploads/photo/20160819/57b6a0268966d.png','2016-08-18 21:55:34','2016-08-18 21:59:03'),(19,'333333','333333@qq.com','111111',NULL,'/assets/uploads/photo/20160819/57b69f8fc9aee.png','2016-08-18 21:56:32','2016-08-18 21:56:32'),(20,'55555','55555@chinaunicom.cn','1111111',NULL,'/assets/uploads/photo/20160819/57b6a00ec6f4c.png','2016-08-18 21:58:40','2016-08-18 21:58:40'),(21,'11111','1syj113@chinaunicom.cn','1111111',NULL,'/assets/uploads/photo/20160819/57b6a4f710de7.png','2016-08-18 22:19:36','2016-08-18 22:19:36'),(22,'-－－－－','1@qqqq.com','$2y$10$ySR07zLQ7.k74uSdccX/V.YymuYeQdzvBMppI5VX2SJAfF4RbUuFq',NULL,NULL,'2016-08-23 16:55:28','2016-08-23 16:55:28'),(23,'Admin111','41375682@qwwq.com','$2y$10$HSbU/3qXR3m2FU7tEYswhuGeQRK4pSCowfruAxHsLb74/j.KtIqqG','qpe7Bgvyf7NiOFe967xEaduVMNogMRNQZvbH0rVKxadWClSg0d7GPM5Ecmjb',NULL,'2016-08-23 21:21:05','2016-08-23 21:25:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-29 18:50:08
