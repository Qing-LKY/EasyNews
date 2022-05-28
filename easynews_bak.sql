-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: easynews
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add author',7,'add_author'),(26,'Can change author',7,'change_author'),(27,'Can delete author',7,'delete_author'),(28,'Can view author',7,'view_author'),(29,'Can add kind',8,'add_kind'),(30,'Can change kind',8,'change_kind'),(31,'Can delete kind',8,'delete_kind'),(32,'Can view kind',8,'view_kind'),(33,'Can add tags',9,'add_tags'),(34,'Can change tags',9,'change_tags'),(35,'Can delete tags',9,'delete_tags'),(36,'Can view tags',9,'view_tags'),(37,'Can add news',10,'add_news'),(38,'Can change news',10,'change_news'),(39,'Can delete news',10,'delete_news'),(40,'Can view news',10,'view_news');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$TAvnY3cAOR2NUW9qh9PPPq$njBFa2Xv3uuUUE0UmJ8pEv6ODLD9j9HJcV7gmSgUENY=','2022-05-28 08:14:37.856208',1,'admin','','','admin@localhost',1,1,'2022-05-27 15:10:43.630275'),(2,'pbkdf2_sha256$320000$wK1kyFc2ptkaWg7VJrUsA4$taXPi6k1493oDQIiAJfEnYh9nn3UHvdZUjHM6wuYk0Y=','2022-05-28 08:27:00.396278',0,'小乖乖','','','597572246@qq.com',0,1,'2022-05-28 08:26:05.000000');
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
-- Table structure for table `catalog_kind`
--

DROP TABLE IF EXISTS `catalog_kind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_kind` (
  `kindId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`kindId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_kind`
--

LOCK TABLES `catalog_kind` WRITE;
/*!40000 ALTER TABLE `catalog_kind` DISABLE KEYS */;
INSERT INTO `catalog_kind` VALUES (1,'二次元'),(2,'厕所情报'),(3,'求职');
/*!40000 ALTER TABLE `catalog_kind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_news`
--

DROP TABLE IF EXISTS `catalog_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_news` (
  `newsId` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `text` longtext,
  `time` datetime(6) NOT NULL,
  `author_id` int DEFAULT NULL,
  `kind_id` int NOT NULL,
  PRIMARY KEY (`newsId`),
  KEY `catalog_news_kind_id_85e67b53_fk_catalog_kind_kindId` (`kind_id`),
  KEY `catalog_news_author_id_83f56bf0_fk_auth_user_id` (`author_id`),
  CONSTRAINT `catalog_news_author_id_83f56bf0_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `catalog_news_kind_id_85e67b53_fk_catalog_kind_kindId` FOREIGN KEY (`kind_id`) REFERENCES `catalog_kind` (`kindId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_news`
--

LOCK TABLES `catalog_news` WRITE;
/*!40000 ALTER TABLE `catalog_news` DISABLE KEYS */;
INSERT INTO `catalog_news` VALUES (1,'Homo被特朗普撅烂了','怎么回事呢。事情是这样的恶。\r\n就是说咱们也不知道。\r\n所以傻逼特朗普还是很纯的。','2022-05-27 15:15:10.000000',1,1),(2,'厕所堵了','2楼的。需要人来舔干净。','2022-05-26 15:17:46.000000',1,3),(3,'我杀了你我杀了你我杀了你','啊哈哈哈哈哈哈哈哈哈哈哈哈栽种\r\n\r\n去死把 kora\r\n\r\n啊啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦','2022-05-28 06:48:24.087425',NULL,1),(4,'homo求撅，100一碗','球撅\r\n差不多就行了，不用太复杂','2022-05-28 07:29:24.473003',1,3),(5,'小乖乖入驻厕所辣','大家好！我是小乖乖。速速v我50。','2022-05-28 08:27:43.493908',2,1);
/*!40000 ALTER TABLE `catalog_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_news_tags`
--

DROP TABLE IF EXISTS `catalog_news_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_news_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `news_id` int NOT NULL,
  `tags_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalog_news_tags_news_id_tags_id_7c3fbaf1_uniq` (`news_id`,`tags_id`),
  KEY `catalog_news_tags_tags_id_939906a8_fk_catalog_tags_tagId` (`tags_id`),
  CONSTRAINT `catalog_news_tags_news_id_19d72a03_fk_catalog_news_newsId` FOREIGN KEY (`news_id`) REFERENCES `catalog_news` (`newsId`),
  CONSTRAINT `catalog_news_tags_tags_id_939906a8_fk_catalog_tags_tagId` FOREIGN KEY (`tags_id`) REFERENCES `catalog_tags` (`tagId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_news_tags`
--

LOCK TABLES `catalog_news_tags` WRITE;
/*!40000 ALTER TABLE `catalog_news_tags` DISABLE KEYS */;
INSERT INTO `catalog_news_tags` VALUES (1,1,1),(2,1,2),(3,2,3),(4,3,3),(6,4,1),(7,5,3);
/*!40000 ALTER TABLE `catalog_news_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_tags`
--

DROP TABLE IF EXISTS `catalog_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_tags` (
  `tagId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`tagId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_tags`
--

LOCK TABLES `catalog_tags` WRITE;
/*!40000 ALTER TABLE `catalog_tags` DISABLE KEYS */;
INSERT INTO `catalog_tags` VALUES (1,'美国','丑国'),(2,'先辈','114514'),(3,'生活','');
/*!40000 ALTER TABLE `catalog_tags` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-05-27 15:15:31.099021','1','小乖乖',1,'[{\"added\": {}}]',7,1),(2,'2022-05-27 15:15:41.960642','1','二次元',1,'[{\"added\": {}}]',8,1),(3,'2022-05-27 15:16:02.677772','2','厕所情报',1,'[{\"added\": {}}]',8,1),(4,'2022-05-27 15:17:20.045396','1','美国',1,'[{\"added\": {}}]',9,1),(5,'2022-05-27 15:17:37.632723','2','先辈',1,'[{\"added\": {}}]',9,1),(6,'2022-05-27 15:17:43.327737','1','Homo被特朗普撅烂了 - 小乖乖',1,'[{\"added\": {}}]',10,1),(7,'2022-05-27 15:18:09.093108','3','生活',1,'[{\"added\": {}}]',9,1),(8,'2022-05-27 15:18:55.359169','3','求职',1,'[{\"added\": {}}]',8,1),(9,'2022-05-27 15:18:57.659624','2','厕所堵了 - 小乖乖',1,'[{\"added\": {}}]',10,1),(10,'2022-05-27 15:23:03.283356','1','Homo被特朗普撅烂了 - 小乖乖',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',10,1),(11,'2022-05-27 15:23:41.702528','1','Homo被特朗普撅烂了 - 小乖乖',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',10,1),(12,'2022-05-27 15:31:25.528793','1','Homo被特朗普撅烂了 - 小乖乖',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',10,1),(13,'2022-05-27 15:35:14.327418','1','Homo被特朗普撅烂了 - 小乖乖',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',10,1),(14,'2022-05-27 15:46:52.052047','1','Homo被特朗普撅烂了 - 小乖乖',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',10,1),(15,'2022-05-28 08:26:05.881344','2','小乖乖',1,'[{\"added\": {}}]',4,1),(16,'2022-05-28 08:26:44.802855','2','小乖乖',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'catalog','author'),(8,'catalog','kind'),(10,'catalog','news'),(9,'catalog','tags'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-05-27 15:08:44.476789'),(2,'auth','0001_initial','2022-05-27 15:08:46.460177'),(3,'admin','0001_initial','2022-05-27 15:08:46.892665'),(4,'admin','0002_logentry_remove_auto_add','2022-05-27 15:08:46.923454'),(5,'admin','0003_logentry_add_action_flag_choices','2022-05-27 15:08:46.953397'),(6,'contenttypes','0002_remove_content_type_name','2022-05-27 15:08:47.298495'),(7,'auth','0002_alter_permission_name_max_length','2022-05-27 15:08:47.528952'),(8,'auth','0003_alter_user_email_max_length','2022-05-27 15:08:47.607556'),(9,'auth','0004_alter_user_username_opts','2022-05-27 15:08:47.637769'),(10,'auth','0005_alter_user_last_login_null','2022-05-27 15:08:47.816098'),(11,'auth','0006_require_contenttypes_0002','2022-05-27 15:08:47.834585'),(12,'auth','0007_alter_validators_add_error_messages','2022-05-27 15:08:47.864609'),(13,'auth','0008_alter_user_username_max_length','2022-05-27 15:08:48.062481'),(14,'auth','0009_alter_user_last_name_max_length','2022-05-27 15:08:48.269901'),(15,'auth','0010_alter_group_name_max_length','2022-05-27 15:08:48.339596'),(16,'auth','0011_update_proxy_permissions','2022-05-27 15:08:48.377774'),(17,'auth','0012_alter_user_first_name_max_length','2022-05-27 15:08:48.562037'),(18,'catalog','0001_initial','2022-05-27 15:08:49.583441'),(19,'sessions','0001_initial','2022-05-27 15:08:49.736945'),(20,'catalog','0002_alter_news_author_delete_author','2022-05-28 00:22:15.294320');
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
INSERT INTO `django_session` VALUES ('bvhxc1dkbu8qwvfq99gjchitdfni95pd','.eJxVjEEOwiAQRe_C2hAo7QAu3XsGMjCDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwkziLQZx-t4jpwXUHdMd6azK1ui5zlLsiD9rltRE_L4f7d1Cwl28dLRhEyG6avItgQaN3QGPUhpK2wIMHQu0Y2RtlvWXIKkOinJJRNIr3B9zSOB8:1nurmm:QM8UEKdrQU9_NF1FCADZm0zAfsU3XV81UUfkHbKqyKg','2022-06-11 08:27:00.414218');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-28 17:07:05
