-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: onlinetutors
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `end_time` time(6) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `start_time` time(6) DEFAULT NULL,
  `status` enum('CANCELLED','CONFIRMED','DELETED','PENDING') DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `tutor_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6ieaopav310xq0nskwct77wh2` (`parent_id`),
  KEY `FKi0lvs0c2wc4o2wyfi8bf0lwls` (`tutor_id`),
  CONSTRAINT `FK6ieaopav310xq0nskwct77wh2` FOREIGN KEY (`parent_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKi0lvs0c2wc4o2wyfi8bf0lwls` FOREIGN KEY (`tutor_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'2025-12-04 23:29:40.861000','2025-12-06 00:29:23.284000','2025-07-12','15:00:00.000000','','13:00:00.000000','DELETED',8,7),(2,'2025-12-05 00:10:54.219000','2025-12-05 00:24:08.186000','2025-07-12','09:00:00.000000','','07:00:00.000000','CANCELLED',8,9),(3,'2025-12-06 23:50:29.368000','2025-12-06 23:51:14.102000','2025-10-12','09:00:00.000000','dạy môn toán','07:00:00.000000','CONFIRMED',8,7),(4,'2025-12-08 18:48:27.051000','2025-12-08 19:11:34.445000','2025-12-13','13:00:00.000000','học toán','10:00:00.000000','CONFIRMED',8,7);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `status_comment` enum('HIDDEN','VISIBLE') DEFAULT NULL,
  `course_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `status` enum('HIDDEN','VISIBLE','DELETED') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7ktrfqv6fgfuw6fvwludvibu4` (`course_id`),
  KEY `FK8omq0tc18jd43bu5tjh6jvraq` (`user_id`),
  CONSTRAINT `FK7ktrfqv6fgfuw6fvwludvibu4` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `FK8omq0tc18jd43bu5tjh6jvraq` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'2025-11-29 23:50:07.433000','2025-11-29 23:50:07.433000','hóa học này tốt',NULL,11,8,'VISIBLE'),(2,'2025-11-29 23:51:58.349000','2025-11-29 23:51:58.349000','khóa học này nên học',NULL,11,7,'VISIBLE'),(3,'2025-11-30 00:08:10.315000','2025-12-03 12:14:56.684000','ok',NULL,10,8,'DELETED'),(4,'2025-11-30 00:10:01.974000','2025-12-03 12:14:09.837000','ok',NULL,7,8,'DELETED'),(5,'2025-12-06 23:56:10.006000','2025-12-06 23:56:10.006000','ok\r\n',NULL,7,7,'VISIBLE');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `description_course` varchar(255) DEFAULT NULL,
  `name_course` varchar(255) DEFAULT NULL,
  `price_course` double DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `status_course` tinyint DEFAULT NULL,
  `key_course` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (7,'2025-11-17 12:42:38.327000','2025-11-17 12:42:38.327000','là khóa học chuyên luyện đề ôn thi tốt nghiệp giành cho các học sinh lớp 12','khóa học môn toán ôn thi tốt nghiệp ',10000,'nguyenvana@gmail.com','1763358158290-t1.jpg',0,NULL,'TOAN'),(8,'2025-11-17 12:45:21.731000','2025-11-17 12:45:21.731000','khóa học để ôn luyện các đề thi tốt nghiệp bộ môn tiếng anh cho học sinh lớp 12','khóa học môn tiếng anh ôn thi tốt nghiệp lớp 12',111111,'nguyenvana@gmail.com','1763358321711-t2.jpg',0,NULL,'ANH'),(9,'2025-11-17 12:46:51.753000','2025-11-17 12:46:51.753000','khóa học giành cho các học sinh lớp 12 hoặc giành cho các học sinh lớp 10 lớp 11 muốn xuất phát sớm','khóa học môn vật lý lớp 12',11111,'nguyenvanb@gmail.com','1763358411732-h1.jpg',0,NULL,'LY'),(10,'2025-11-17 12:48:50.882000','2025-11-17 12:48:50.882000','khóa học này giành cho các bạn lớp 12 muốn ôn thi và cải thiện môn văn trong kỳ thi tốt nghiệp, hoặc giành cho các bạn là lớp 10 hoặc lớp 11 muốn xuất phát sớm ','khóa học môn văn lớp 12',1111111,'nguyenvanb@gmail.com','1763358530862-nv.jpg',0,NULL,'VAN'),(11,'2025-11-24 13:03:18.950000','2025-11-24 13:03:18.950000','khóa học toán cơ bả và nâng cao giành cho các bạn là học sinh lớp 5','khóa học toán giành cho học sinh lớp 5',1000000,'clientchien11@gmail.com','1763964198916-vl1.jpg',0,NULL,'TOAN'),(13,'2025-11-26 01:27:22.509000','2025-11-26 01:27:22.509000','khóa học môn toán','khóa học môn toán',10000000,'clientchien11@gmail.com','1764095242474-t1.jpg',0,NULL,'TOAN');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ebooks`
--

DROP TABLE IF EXISTS `ebooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ebooks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `download_link` varchar(255) DEFAULT NULL,
  `image_ebook` varchar(255) DEFAULT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `status_ebook` tinyint DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebooks`
--

LOCK TABLES `ebooks` WRITE;
/*!40000 ALTER TABLE `ebooks` DISABLE KEYS */;
INSERT INTO `ebooks` VALUES (1,'2025-11-27 01:11:43.514000','2025-11-27 01:11:43.514000','cat','1764180703461-lecture-05.pdf','1764180703441-cat-7.jpg','11',0,'cat'),(2,'2025-11-27 01:27:26.901000','2025-11-27 01:27:26.901000','cat','1764181646859-lecture-04.pdf','1764181646840-cat-2.jpg','11',0,'cat');
/*!40000 ALTER TABLE `ebooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_bookings`
--

DROP TABLE IF EXISTS `event_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_bookings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `weeks` varchar(255) DEFAULT NULL,
  `days_of_week` date DEFAULT NULL,
  `end_time` time(6) DEFAULT NULL,
  `start_time` time(6) DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `tutor_id` bigint DEFAULT NULL,
  `days` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm8iu8a1iv80w4t21uv2yang2q` (`parent_id`),
  KEY `FKpxardoc34qyi9l7tirttc2g9d` (`tutor_id`),
  CONSTRAINT `FKm8iu8a1iv80w4t21uv2yang2q` FOREIGN KEY (`parent_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKpxardoc34qyi9l7tirttc2g9d` FOREIGN KEY (`tutor_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_bookings`
--

LOCK TABLES `event_bookings` WRITE;
/*!40000 ALTER TABLE `event_bookings` DISABLE KEYS */;
INSERT INTO `event_bookings` VALUES (1,'2025-12-06 23:51:14.090000','2025-12-06 23:51:14.090000','#FF5733',NULL,'09:00:00.000000','07:00:00.000000',8,7,'2025-10-12'),(2,'2025-12-08 19:11:34.436000','2025-12-08 19:11:34.436000','#FF5733',NULL,'13:00:00.000000','10:00:00.000000',8,7,'2025-12-13');
/*!40000 ALTER TABLE `event_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `end_time` time(6) DEFAULT NULL,
  `start_time` time(6) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `days_of_week` varchar(255) DEFAULT NULL,
  `start_recur` date DEFAULT NULL,
  `weeks` int DEFAULT NULL,
  `course_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKmaaob9r9t9yharhk6hsodt2ih` (`course_id`),
  KEY `FKat8p3s7yjcp57lny4udqvqncq` (`user_id`),
  CONSTRAINT `FKat8p3s7yjcp57lny4udqvqncq` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKf8hdy0p8gr7fnt6bm0sfqwgnn` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'2025-11-24 14:02:11.828000','2025-11-24 14:02:11.828000','#cc1e1e',NULL,NULL,NULL,'MONDAY,WEDNESDAY','2025-11-25',2,NULL,NULL),(2,'2025-11-24 14:09:50.799000','2025-11-24 14:09:50.799000','#000000',NULL,NULL,NULL,'MONDAY,WEDNESDAY','2025-11-25',2,NULL,NULL),(3,'2025-11-24 14:20:11.959000','2025-11-24 14:20:11.959000','#000000',NULL,NULL,NULL,'MONDAY,WEDNESDAY','2025-11-25',2,NULL,NULL),(4,'2025-11-24 14:23:20.317000','2025-11-24 14:23:20.317000','#000000','11:00:00.000000','09:10:00.000000',NULL,'MONDAY,WEDNESDAY',NULL,2,NULL,NULL),(5,'2025-11-24 14:26:36.372000','2025-11-24 14:26:36.372000','#000000','11:00:00.000000','09:00:00.000000',NULL,'MONDAY,WEDNESDAY','2025-11-25',2,NULL,NULL),(6,'2025-11-24 14:34:48.789000','2025-11-24 14:34:48.789000','#000000','11:00:00.000000','09:00:00.000000','khóa học toán giành cho học sinh lớp 5','MONDAY,WEDNESDAY','2025-11-25',2,NULL,NULL),(15,'2025-11-26 01:16:51.808000','2025-11-26 01:16:51.808000','#000000','09:00:00.000000','07:00:00.000000','khóa học toán giành cho học sinh lớp 5','TUESDAY,THURSDAY,SATURDAY','2025-11-28',5,11,NULL),(16,'2025-11-26 01:28:02.799000','2025-11-26 01:28:02.799000','#000000','13:00:00.000000','11:00:00.000000','khóa học môn toán','MONDAY,SATURDAY','2025-11-27',2,13,NULL);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `course_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK68snkj0g5gsjxllhjc3v5lm0r` (`course_id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK68snkj0g5gsjxllhjc3v5lm0r` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2025-11-24 02:28:36.103000','2025-11-24 02:28:36.103000',7,8),(2,'2025-11-26 00:28:18.142000','2025-11-26 00:28:18.142000',11,8),(3,'2025-11-26 01:30:19.221000','2025-11-26 01:30:19.221000',7,8),(4,'2025-11-26 01:42:17.725000','2025-11-26 01:42:17.725000',11,8),(5,'2025-11-26 01:43:50.146000','2025-11-26 01:43:50.146000',13,12),(6,'2025-12-08 20:31:35.099000','2025-12-08 20:31:35.099000',7,8);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `expiry_time_in_minutes` datetime(6) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
INSERT INTO `password_reset_tokens` VALUES (1,'2025-11-09 00:37:41.998000','2025-11-09 00:37:41.998000','clientchien11@gmail.com','2025-11-09 01:07:41.994700','f8e5c501-b09d-45cb-8790-e44a9203d007'),(2,'2025-11-09 00:53:19.980000','2025-11-09 00:53:19.980000','clientchien11@gmail.com','2025-11-09 01:23:19.953585','1711d8eb-b9b7-44e8-9a7d-c53c06f0b0ed'),(4,'2025-11-16 01:22:02.698000','2025-11-16 01:22:02.698000','chien9553@gmail.com','2025-11-16 01:52:02.673197','fbf8c583-6f92-4286-80df-506e7b28fe2f'),(6,'2025-12-05 15:07:44.641000','2025-12-05 15:07:44.641000','clientchien22@gmail.com','2025-12-05 15:37:44.620531','d1675fa9-3e2b-4082-83a9-418a22b162a9'),(7,'2025-12-05 15:14:16.042000','2025-12-05 15:14:16.042000','clientchien22@gmail.com','2025-12-05 15:44:16.039129','ffea69bb-f704-4273-9995-321e67cb03aa'),(8,'2025-12-05 15:20:29.380000','2025-12-05 15:20:29.380000','clientchien22@gmail.com','2025-12-05 15:50:29.355980','97bcdc14-3007-4e10-85ea-22da217e53a7'),(9,'2025-12-05 23:06:07.538000','2025-12-05 23:06:07.538000','clientchien22@gmail.com','2025-12-05 23:36:07.522706','ab0a43e9-60e9-48cc-8fbe-3d67f73773a3'),(11,'2025-12-06 23:54:22.334000','2025-12-06 23:54:22.334000','clientchien22@gmail.com','2025-12-07 00:24:22.332892','3d719865-0e93-4bec-b220-81c8f0cff7b2');
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,NULL,NULL,'quản trị viên','ADMIN'),(2,NULL,NULL,'quản lý hệ thống','SYSTEMADMIN'),(3,NULL,NULL,'Gia sư','TUTOR'),(4,NULL,NULL,'Người dùng thông thường(thường là phụ huynh','PARENT');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signup_requests`
--

DROP TABLE IF EXISTS `signup_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signup_requests` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signup_requests`
--

LOCK TABLES `signup_requests` WRITE;
/*!40000 ALTER TABLE `signup_requests` DISABLE KEYS */;
INSERT INTO `signup_requests` VALUES (1,'2025-11-06 01:10:28.087000','2025-11-06 01:10:28.087000','chien9922@gmail.com','minh chiến','111111'),(2,'2025-11-06 01:13:21.166000','2025-11-06 01:13:21.166000','chien9922@gmail.com','minh chiến','111111'),(3,'2025-11-06 01:15:30.449000','2025-11-06 01:15:30.449000','clientchien11@gmail.com','minh chiến','111111'),(4,'2025-11-06 01:21:06.411000','2025-11-06 01:21:06.411000','clientchien11@gmail.com','minh chiến','111111'),(5,'2025-11-06 01:24:46.474000','2025-11-06 01:24:46.474000','clientchien11@gmail.com','minh chiến','111111'),(6,'2025-11-06 01:51:36.193000','2025-11-06 01:51:36.194000','clientchien11@gmail.com','minh chiến','$2a$10$e36ajnpW0EVR6WtfaVGyGO7seFu/ftNVhOWEZMzQmY5vOWKGqn4mW'),(7,'2025-11-06 01:52:00.537000','2025-11-06 01:52:00.537000','clientchien11@gmail.com','minh chiến','$2a$10$balx9oSs4FNxGwXBWZdNIuwvfoOkRnFE0L0NrhV37YDP19fCgdyBi'),(8,'2025-11-09 00:32:49.130000','2025-11-09 00:32:49.130000','clientchien11@gmail.com','minh chiến','$2a$10$tKb.nlDPzx6fZMv5Mky5yeEFewqxmTFeOX99mqz0LViaMjaT4jmia'),(9,'2025-11-09 00:35:30.567000','2025-11-09 00:35:30.567000','clientchien11@gmail.com','minh chiến','$2a$10$4R49.J0MQejQ6QRs2gCJ2eWIe7Q9sXYTL6Xy6ur.Ke2sSBoBb0dPK'),(10,'2025-11-16 00:45:38.093000','2025-11-16 00:45:38.093000','chien9553@gmail.com','Giant Talon 2','$2a$10$i6SphQw6KFMIH.8L1Pj5Teh6K6gRXEcj7PTYLaudPrXpKRu3ygz82'),(11,'2025-11-16 00:55:23.506000','2025-11-16 00:55:23.506000','chien9553@gmail.com','minh chiến 11','$2a$10$dFrLG.F3T4j0g3Biwq3xzOdlC8M9QY76sk57V1c9BmEfggoSMIK8O'),(12,'2025-11-16 01:07:59.878000','2025-11-16 01:07:59.878000','chien9553@gmail.com','minh chiến 11','$2a$10$bvtKzXqHIkIHsZFJn1LrpOsbB5S8GpkKFGO1obkMqbG6N29YkmGHK'),(13,'2025-11-16 01:08:12.439000','2025-11-16 01:08:12.439000','chien9553@gmail.com','minh chiến 11','$2a$10$bOerofxWu8mupqi52yjYL.ygROrnIDRAaE.BNweSVu3OJPlGulBSi'),(14,'2025-11-16 01:20:16.229000','2025-11-16 01:20:16.229000','chien9553@gmail.com','minh chiến','$2a$10$ypEF70VNR.wJYnfddzZ0YOSQIZrjwq5tE84SlwVzRg8kZXhgoSFXi'),(15,'2025-12-05 15:01:21.507000','2025-12-05 15:01:21.507000','clientchien22@gmail.com','minh','$2a$10$uNhXbrm2fDkL/mn23cc1JeISJ360umRonOw.KGgHaT4vo.bHlVgtG'),(16,'2025-12-06 23:53:25.851000','2025-12-06 23:53:25.851000','clientchien22@gmail.com','minh chiến','$2a$10$h5BPdGzxuFz4eF8OTAqj7ebabfeK5C2oLyX2XjSFs7QjAiFvVld3u');
/*!40000 ALTER TABLE `signup_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_courses`
--

DROP TABLE IF EXISTS `user_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_courses` (
  `user_id` bigint NOT NULL,
  `course_id` bigint NOT NULL,
  KEY `FKb84hga2qpwc4vv44lmyb8mwux` (`course_id`),
  KEY `FK5i2mwg17kvpk92fy6cdii93da` (`user_id`),
  CONSTRAINT `FK5i2mwg17kvpk92fy6cdii93da` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKb84hga2qpwc4vv44lmyb8mwux` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_courses`
--

LOCK TABLES `user_courses` WRITE;
/*!40000 ALTER TABLE `user_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_ebooks`
--

DROP TABLE IF EXISTS `user_ebooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_ebooks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `ebook_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmn3p6bp8vkoyc3upykvi67wpt` (`ebook_id`),
  KEY `FKb4btt2wsem0hrln2r4b1qlbte` (`user_id`),
  CONSTRAINT `FKb4btt2wsem0hrln2r4b1qlbte` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKmn3p6bp8vkoyc3upykvi67wpt` FOREIGN KEY (`ebook_id`) REFERENCES `ebooks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_ebooks`
--

LOCK TABLES `user_ebooks` WRITE;
/*!40000 ALTER TABLE `user_ebooks` DISABLE KEYS */;
INSERT INTO `user_ebooks` VALUES (2,'2025-11-27 01:27:26.944000','2025-11-27 01:27:26.944000',2,7);
/*!40000 ALTER TABLE `user_ebooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_events`
--

DROP TABLE IF EXISTS `user_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_events` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `event_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqh8jukuil4jkihri1o262hik7` (`event_id`),
  KEY `FKg3rv1yxrs56ohyn30rlt7vum7` (`user_id`),
  CONSTRAINT `FKg3rv1yxrs56ohyn30rlt7vum7` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKqh8jukuil4jkihri1o262hik7` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_events`
--

LOCK TABLES `user_events` WRITE;
/*!40000 ALTER TABLE `user_events` DISABLE KEYS */;
INSERT INTO `user_events` VALUES (1,'2025-11-26 01:16:51.830000','2025-11-26 01:16:51.830000',15,7),(2,'2025-11-26 01:28:02.818000','2025-11-26 01:28:02.818000',16,7),(3,'2025-11-26 01:42:17.693000','2025-11-26 01:42:17.693000',15,8),(4,'2025-11-26 01:43:50.140000','2025-11-26 01:43:50.140000',16,12);
/*!40000 ALTER TABLE `user_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `profile_description` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `status` enum('ACTIVE','BANNED','INACTIVE') DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp56c1712k691lhsyewcssf40f` (`role_id`),
  CONSTRAINT `FKp56c1712k691lhsyewcssf40f` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2025-10-28 01:33:04.202000','2025-10-28 01:33:04.202000','thành phố hồ chí minh ','clarissalees3byf@hotmail.com',NULL,NULL,'minh chiến','111111','0987654321',NULL,NULL,'ACTIVE',1,NULL),(2,'2025-10-28 02:32:37.562000','2025-10-28 02:49:49.980000','thành phố hồ chí minh ','clarissalees3byf@hotmail.com',NULL,NULL,'minh chiến 11',NULL,'0987654321',NULL,NULL,'INACTIVE',3,NULL),(3,'2025-10-28 13:08:16.225000','2025-10-28 13:11:54.513000','Bình Định','clarissalees3byf@hotmail.com',NULL,NULL,'minh chiến','111111','0987654321',NULL,NULL,'BANNED',4,NULL),(4,'2025-10-28 13:08:43.761000','2025-10-28 13:11:21.834000','thành phố hồ chí minh ','admin1295@8mail.pro',NULL,NULL,'minh chiến 11','111111','0987654321',NULL,NULL,'INACTIVE',4,NULL),(5,'2025-10-29 00:16:06.324000','2025-10-29 00:16:06.324000','Bình Định','admin@gmail.com',NULL,NULL,'admin','$2a$10$L2MLO7onbt3PAPAE81wL7eu38SSgT8gh1nYEocIiDysMl73TW5dLG','0987654321',NULL,NULL,'ACTIVE',1,NULL),(7,'2025-11-09 00:37:16.193000','2025-11-21 23:56:50.885000','123 Đường Nguyễn Trãi, Gò Vấp, HCM','clientchien11@gmail.com',NULL,NULL,'Trần Thị Lê','$2a$10$UR7nCu9PwcuzFMLX9GU6zOIxeNF8j1bv//1LOr14Uzikn.kqRoPEW','098529351','gia sư dạy môn toán, giành cho các bạn tiểu học ','TOAN','ACTIVE',3,'1763743601986-team-3.jpg'),(8,'2025-11-16 01:20:39.833000','2025-11-21 23:16:39.545000','HCM','chien9553@gmail.com',NULL,NULL,'minh chiến','$2a$10$HacuvF/2Ql6mW2vYjNuX3e15arZ4m/c2nr7h9mEMMxgrQewd0t0Uy','0987654321',NULL,NULL,'ACTIVE',4,'1763741799495-blog-2.jpg'),(9,'2025-11-17 12:34:05.318000','2025-12-03 23:10:51.891000','hồ chí minh','nguyenvana@gmail.com',NULL,NULL,'Nguyễn văn A','$2a$10$qhilIPQgwRMICvT6ltd2Z.2ANUFKEbm0fYQCA3DYAyOQ9iIjB8XZq','0987654321','Gia sư dạy môn Lý, là thạc sĩ giao viên chuyên Lý, dạy Lý lớp 10, 11, 12, và dạy lý ôn thi tốt nghiệp','LY','ACTIVE',3,'1763649158300-team-4.jpg'),(10,'2025-11-17 12:34:59.973000','2025-12-03 23:12:46.878000','Bình định','nguyenvanb@gmail.com',NULL,NULL,'Nguyễn văn B','$2a$10$z0T0yjN2MJusoa1CQuqk6O8hxHXChAStbfHUlRAwJ/D/xwpOHPrle','0987654321','Giáo viên, Gia sư dạy môn văn cho bạn bạn là học sinh lớp 10, 11, 12 và chuyên dạy ôn thi tốt nghiệp ','VAN','ACTIVE',3,'1763743523740-team-2.jpg'),(11,'2025-11-17 12:35:33.636000','2025-11-17 12:35:33.636000','Vũng tàu','nguyenthic@gmail.com',NULL,NULL,'Nguyễn thị C','$2a$10$Pyci1P9NNt5hoZdtmkw.UeIsw.SVSk7wRCs5dyLcwrPx/MTtlUhyu','0987654321',NULL,NULL,'ACTIVE',4,NULL),(12,'2025-11-17 12:36:22.650000','2025-11-17 12:36:22.650000','Đồng nai','tranvand@gmail.com',NULL,NULL,'Trần Văn D','$2a$10$lRdke9qy3CC003bEZ8J.uONh2WeTlWFXvK18whBEe36U42lx0iAH6','0987654321',NULL,NULL,'ACTIVE',4,NULL),(13,'2025-12-03 23:08:09.836000','2025-12-03 23:14:47.190000','123 Đường Nguyễn Trãi','tranthib@gmail.com',NULL,NULL,'Trần thị B','$2a$10$qYY0KmFpEMglq1lC.T50p.RU9MDX5NJMnabVd8e1aBsVcn2i6JEMa','0987654321','Giáo viên, gia sư dạy môn anh văn cho các bạn học sinh lớp 10, 11, 12 và chuyên dạy ôn thi tốt nghiệp cho các học sinh lớp 12','ANH','ACTIVE',3,'1764778089686-team-1.jpg'),(15,'2025-12-06 23:53:49.605000','2025-12-06 23:53:49.605000',NULL,'clientchien22@gmail.com',NULL,NULL,'minh chiến','$2a$10$h5BPdGzxuFz4eF8OTAqj7ebabfeK5C2oLyX2XjSFs7QjAiFvVld3u',NULL,NULL,NULL,'ACTIVE',4,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verification_tokens`
--

DROP TABLE IF EXISTS `verification_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verification_tokens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `expiry_date` datetime(6) NOT NULL,
  `token` varchar(255) NOT NULL,
  `signup_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6q9nsb665s9f8qajm3j07kd1e` (`token`),
  UNIQUE KEY `UKfutus3k6x7rkd2iujrox4rebx` (`signup_id`),
  CONSTRAINT `FKp27xbclqc3cjaevqrenxd7yx5` FOREIGN KEY (`signup_id`) REFERENCES `signup_requests` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification_tokens`
--

LOCK TABLES `verification_tokens` WRITE;
/*!40000 ALTER TABLE `verification_tokens` DISABLE KEYS */;
INSERT INTO `verification_tokens` VALUES (1,'2025-11-06 01:10:28.172000','2025-11-06 01:10:28.172000','2025-11-07 01:10:28.169957','f696801e-f4d8-428d-a634-e5b8cf069994',1),(2,'2025-11-06 01:13:21.234000','2025-11-06 01:13:21.234000','2025-11-07 01:13:21.232932','2580ed14-6253-4dc3-8372-a33f57396e00',2),(3,'2025-11-06 01:15:30.457000','2025-11-06 01:15:30.457000','2025-11-07 01:15:30.455906','7067e352-b996-4a1f-9e01-87da3bc3328d',3),(4,'2025-11-06 01:21:06.419000','2025-11-06 01:21:06.419000','2025-11-07 01:21:06.418568','e5c6c27d-88d7-4b56-937f-a38b0a235066',4),(6,'2025-11-06 01:51:36.256000','2025-11-06 01:51:36.256000','2025-11-07 01:51:36.252234','503fa4cd-289a-4814-b704-a1dab7ae1b63',6),(7,'2025-11-06 01:52:00.540000','2025-11-06 01:52:00.540000','2025-11-07 01:52:00.540149','af46ba18-231a-4519-a04b-1269869716be',7),(9,'2025-11-09 00:35:30.570000','2025-11-09 00:35:30.570000','2025-11-10 00:35:30.570596','fc55fdac-e823-4577-bf97-88cfb6fc45ab',9),(10,'2025-11-16 00:45:38.149000','2025-11-16 00:45:38.149000','2025-11-17 00:45:38.147595','52a2818c-5923-4e2b-9abc-1546a7710b55',10),(11,'2025-11-16 00:55:23.510000','2025-11-16 00:55:23.510000','2025-11-17 00:55:23.509290','eb827a62-5a13-4baa-b4e8-6ec5d3d9de8f',11),(12,'2025-11-16 01:07:59.899000','2025-11-16 01:07:59.899000','2025-11-17 01:07:59.899063','25280b2c-74e0-4c1d-8bc2-318f78fe0520',12),(13,'2025-11-16 01:08:12.443000','2025-11-16 01:08:12.443000','2025-11-17 01:08:12.442495','84dd8a0a-2aff-4050-9330-f2396d3a824f',13);
/*!40000 ALTER TABLE `verification_tokens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-09  0:45:48
