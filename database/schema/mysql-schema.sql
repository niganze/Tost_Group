/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `admin_admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_admin_role` (
  `admin_id` bigint unsigned NOT NULL,
  `admin_role_id` bigint unsigned NOT NULL,
  KEY `admin_admin_role_admin_id_foreign` (`admin_id`),
  KEY `admin_admin_role_admin_role_id_foreign` (`admin_role_id`),
  CONSTRAINT `admin_admin_role_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_admin_role_admin_role_id_foreign` FOREIGN KEY (`admin_role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `admin_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_course` (
  `admin_id` bigint unsigned NOT NULL,
  `course_id` bigint unsigned NOT NULL,
  KEY `admin_course_admin_id_foreign` (`admin_id`),
  KEY `admin_course_course_id_foreign` (`course_id`),
  CONSTRAINT `admin_course_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_course_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `admin_discussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_discussion` (
  `admin_id` bigint unsigned NOT NULL,
  `discussion_id` bigint unsigned NOT NULL,
  KEY `admin_discussion_admin_id_foreign` (`admin_id`),
  KEY `admin_discussion_discussion_id_foreign` (`discussion_id`),
  CONSTRAINT `admin_discussion_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_discussion_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `admin_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role_permission` (
  `admin_role_id` bigint unsigned NOT NULL,
  `permission_id` bigint unsigned NOT NULL,
  KEY `admin_role_permission_admin_role_id_foreign` (`admin_role_id`),
  KEY `admin_role_permission_permission_id_foreign` (`permission_id`),
  CONSTRAINT `admin_role_permission_admin_role_id_foreign` FOREIGN KEY (`admin_role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_role_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin_role_id` bigint unsigned NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '1',
  `about` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `public` tinyint(1) DEFAULT '1',
  `social_facebook` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_twitter` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_linkedin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_instagram` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_website` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admins_admin_role_id_foreign` (`admin_role_id`),
  KEY `admins_user_id_foreign` (`user_id`),
  CONSTRAINT `admins_admin_role_id_foreign` FOREIGN KEY (`admin_role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `meta_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `mobile` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `articles_slug_unique` (`slug`),
  FULLTEXT KEY `full` (`title`,`content`,`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `assignment_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment_certificate` (
  `certificate_id` bigint unsigned NOT NULL,
  `assignment_id` bigint unsigned NOT NULL,
  KEY `assignment_certificate_certificate_id_foreign` (`certificate_id`),
  KEY `assignment_certificate_assignment_id_foreign` (`assignment_id`),
  CONSTRAINT `assignment_certificate_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assignment_certificate_certificate_id_foreign` FOREIGN KEY (`certificate_id`) REFERENCES `certificates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `assignment_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment_submissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `assignment_id` bigint unsigned NOT NULL,
  `student_id` bigint unsigned NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `grade` double(8,2) DEFAULT NULL,
  `editable` tinyint(1) NOT NULL DEFAULT '0',
  `admin_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `submitted` tinyint(1) NOT NULL DEFAULT '0',
  `student_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `assignment_submissions_assignment_id_foreign` (`assignment_id`),
  KEY `assignment_submissions_student_id_foreign` (`student_id`),
  CONSTRAINT `assignment_submissions_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assignment_submissions_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` bigint unsigned NOT NULL,
  `lesson_id` bigint unsigned DEFAULT NULL,
  `admin_id` bigint unsigned NOT NULL,
  `due_date` timestamp NULL DEFAULT NULL,
  `type` char(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `instruction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `passmark` double(8,2) DEFAULT NULL,
  `notify` tinyint(1) DEFAULT NULL,
  `allow_late` tinyint(1) DEFAULT '0',
  `opening_date` timestamp NULL DEFAULT NULL,
  `schedule_type` char(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assignments_course_id_foreign` (`course_id`),
  KEY `assignments_lesson_id_foreign` (`lesson_id`),
  KEY `assignments_admin_id_foreign` (`admin_id`),
  CONSTRAINT `assignments_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  CONSTRAINT `assignments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assignments_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lesson_id` bigint unsigned NOT NULL,
  `student_id` bigint unsigned NOT NULL,
  `course_id` bigint unsigned NOT NULL,
  `attendance_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendances_lesson_id_foreign` (`lesson_id`),
  KEY `attendances_student_id_foreign` (`student_id`),
  KEY `attendances_course_id_foreign` (`course_id`),
  CONSTRAINT `attendances_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendances_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendances_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `blog_category_blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_category_blog_post` (
  `blog_category_id` bigint unsigned NOT NULL,
  `blog_post_id` bigint unsigned NOT NULL,
  KEY `blog_category_blog_post_blog_category_id_foreign` (`blog_category_id`),
  KEY `blog_category_blog_post_blog_post_id_foreign` (`blog_post_id`),
  CONSTRAINT `blog_category_blog_post_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blog_category_blog_post_blog_post_id_foreign` FOREIGN KEY (`blog_post_id`) REFERENCES `blog_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `blog_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cover_photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish_date` timestamp NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `meta_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_posts_admin_id_foreign` (`admin_id`),
  FULLTEXT KEY `full` (`title`,`content`,`meta_title`,`meta_description`),
  CONSTRAINT `blog_posts_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmarks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_id` bigint unsigned NOT NULL,
  `student_id` bigint unsigned NOT NULL,
  `lecture_page_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bookmarks_course_id_foreign` (`course_id`),
  KEY `bookmarks_student_id_foreign` (`student_id`),
  KEY `bookmarks_lecture_page_id_foreign` (`lecture_page_id`),
  CONSTRAINT `bookmarks_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookmarks_lecture_page_id_foreign` FOREIGN KEY (`lecture_page_id`) REFERENCES `lecture_pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookmarks_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `certificate_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificate_lesson` (
  `certificate_id` bigint unsigned NOT NULL,
  `lesson_id` bigint unsigned NOT NULL,
  KEY `certificate_lesson_certificate_id_foreign` (`certificate_id`),
  KEY `certificate_lesson_lesson_id_foreign` (`lesson_id`),
  CONSTRAINT `certificate_lesson_certificate_id_foreign` FOREIGN KEY (`certificate_id`) REFERENCES `certificates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `certificate_lesson_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `certificate_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificate_payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `certificate_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `certificate_payments_user_id_foreign` (`user_id`),
  KEY `certificate_payments_certificate_id_foreign` (`certificate_id`),
  CONSTRAINT `certificate_payments_certificate_id_foreign` FOREIGN KEY (`certificate_id`) REFERENCES `certificates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `certificate_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `certificate_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificate_test` (
  `certificate_id` bigint unsigned NOT NULL,
  `test_id` bigint unsigned NOT NULL,
  KEY `certificate_test_certificate_id_foreign` (`certificate_id`),
  KEY `certificate_test_test_id_foreign` (`test_id`),
  CONSTRAINT `certificate_test_certificate_id_foreign` FOREIGN KEY (`certificate_id`) REFERENCES `certificates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `certificate_test_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_id` bigint unsigned NOT NULL,
  `admin_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `orientation` char(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `any_session` tinyint(1) DEFAULT '0',
  `max_downloads` int DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `payment_required` tinyint(1) NOT NULL DEFAULT '0',
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_course_id_foreign` (`course_id`),
  KEY `certificates_admin_id_foreign` (`admin_id`),
  CONSTRAINT `certificates_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `certificates_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_code_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_code_3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol_left` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol_right` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `coupon_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_course` (
  `coupon_id` bigint unsigned NOT NULL,
  `course_id` bigint unsigned NOT NULL,
  KEY `coupon_course_coupon_id_foreign` (`coupon_id`),
  KEY `coupon_course_course_id_foreign` (`course_id`),
  CONSTRAINT `coupon_course_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `coupon_course_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `coupon_course_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_course_category` (
  `coupon_id` bigint unsigned NOT NULL,
  `course_category_id` bigint unsigned NOT NULL,
  KEY `coupon_course_category_coupon_id_foreign` (`coupon_id`),
  KEY `coupon_course_category_course_category_id_foreign` (`course_category_id`),
  CONSTRAINT `coupon_course_category_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `coupon_course_category_course_category_id_foreign` FOREIGN KEY (`course_category_id`) REFERENCES `course_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `coupon_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_invoice` (
  `coupon_id` bigint unsigned NOT NULL,
  `invoice_id` bigint unsigned NOT NULL,
  KEY `coupon_invoice_coupon_id_foreign` (`coupon_id`),
  KEY `coupon_invoice_invoice_id_foreign` (`invoice_id`),
  CONSTRAINT `coupon_invoice_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `coupon_invoice_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` int NOT NULL,
  `expires_on` timestamp NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` char(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` double DEFAULT NULL,
  `date_start` timestamp NULL DEFAULT NULL,
  `uses_total` int DEFAULT NULL,
  `uses_customer` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `course_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `course_categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `course_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `course_course_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_course_category` (
  `course_id` bigint unsigned NOT NULL,
  `course_category_id` bigint unsigned NOT NULL,
  KEY `course_course_category_course_id_foreign` (`course_id`),
  KEY `course_course_category_course_category_id_foreign` (`course_category_id`),
  CONSTRAINT `course_course_category_course_category_id_foreign` FOREIGN KEY (`course_category_id`) REFERENCES `course_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_course_category_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `course_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_download` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint unsigned NOT NULL,
  `download_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_download_course_id_foreign` (`course_id`),
  KEY `course_download_download_id_foreign` (`download_id`),
  CONSTRAINT `course_download_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_download_download_id_foreign` FOREIGN KEY (`download_id`) REFERENCES `downloads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `course_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_lesson` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint unsigned NOT NULL,
  `lesson_id` bigint unsigned NOT NULL,
  `lesson_date` timestamp NULL DEFAULT NULL,
  `lesson_venue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `lesson_start` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lesson_end` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_lessons_course_id_foreign` (`course_id`),
  KEY `course_lessons_lesson_id_foreign` (`lesson_id`),
  CONSTRAINT `course_lessons_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_lessons_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `course_lesson_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_lesson_admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_id` bigint unsigned NOT NULL,
  `admin_id` bigint unsigned NOT NULL,
  `lesson_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_lesson_admins_course_id_foreign` (`course_id`),
  KEY `course_lesson_admins_admin_id_foreign` (`admin_id`),
  KEY `course_lesson_admins_lesson_id_foreign` (`lesson_id`),
  CONSTRAINT `course_lesson_admins_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_lesson_admins_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_lesson_admins_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `course_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_survey` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint unsigned NOT NULL,
  `survey_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_survey_course_id_foreign` (`course_id`),
  KEY `course_survey_survey_id_foreign` (`survey_id`),
  CONSTRAINT `course_survey_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_survey_survey_id_foreign` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `course_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_test` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint unsigned NOT NULL,
  `test_id` bigint unsigned NOT NULL,
  `opening_date` timestamp NULL DEFAULT NULL,
  `closing_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_tests_course_id_foreign` (`course_id`),
  KEY `course_tests_test_id_foreign` (`test_id`),
  CONSTRAINT `course_tests_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_tests_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` bigint unsigned DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `enrollment_closes` timestamp NULL DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `payment_required` tinyint(1) NOT NULL,
  `fee` double(8,2) DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `venue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` char(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_discussion` tinyint(1) NOT NULL DEFAULT '1',
  `enable_chat` tinyint(1) NOT NULL DEFAULT '1',
  `enforce_order` tinyint(1) NOT NULL DEFAULT '1',
  `effort` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `length` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `introduction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `enable_forum` tinyint(1) NOT NULL DEFAULT '1',
  `enforce_capacity` tinyint(1) DEFAULT '0',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `courses_admin_id_foreign` (`admin_id`),
  FULLTEXT KEY `full` (`name`,`description`,`short_description`,`introduction`,`venue`),
  CONSTRAINT `courses_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `country_id` bigint unsigned NOT NULL,
  `exchange_rate` double(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `currencies_country_id_foreign` (`country_id`),
  CONSTRAINT `currencies_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `currency_payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_payment_method` (
  `currency_id` bigint unsigned NOT NULL,
  `payment_method_id` bigint unsigned NOT NULL,
  KEY `currency_payment_method_currency_id_foreign` (`currency_id`),
  KEY `currency_payment_method_payment_method_id_foreign` (`payment_method_id`),
  CONSTRAINT `currency_payment_method_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `currency_payment_method_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `discussion_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discussion_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discussion_id` bigint unsigned NOT NULL,
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discussion_replies_user_id_foreign` (`user_id`),
  CONSTRAINT `discussion_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discussions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint unsigned NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `replied` tinyint(1) NOT NULL DEFAULT '0',
  `course_id` bigint unsigned DEFAULT NULL,
  `lecture_id` bigint unsigned DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discussions_student_id_foreign` (`student_id`),
  KEY `discussions_course_id_foreign` (`course_id`),
  KEY `discussions_lecture_id_foreign` (`lecture_id`),
  CONSTRAINT `discussions_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discussions_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`) ON DELETE SET NULL,
  CONSTRAINT `discussions_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `download_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `download_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `download_id` bigint unsigned NOT NULL,
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `download_files_download_id_foreign` (`download_id`),
  CONSTRAINT `download_files_download_id_foreign` FOREIGN KEY (`download_id`) REFERENCES `downloads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `admin_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `downloads_admin_id_foreign` (`admin_id`),
  CONSTRAINT `downloads_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `default` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `placeholders` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `footer_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `footer_menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` char(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `parent_id` int NOT NULL DEFAULT '0',
  `new_window` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `forum_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_participants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `forum_topic_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `notify` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_participants_forum_topic_id_foreign` (`forum_topic_id`),
  KEY `forum_participants_user_id_foreign` (`user_id`),
  CONSTRAINT `forum_participants_forum_topic_id_foreign` FOREIGN KEY (`forum_topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `forum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `forum_topic_id` bigint unsigned NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `post_reply_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_posts_forum_topic_id_foreign` (`forum_topic_id`),
  KEY `forum_posts_user_id_foreign` (`user_id`),
  KEY `forum_posts_post_reply_id_foreign` (`post_reply_id`),
  CONSTRAINT `forum_posts_forum_topic_id_foreign` FOREIGN KEY (`forum_topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `forum_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_topics` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `course_id` bigint unsigned NOT NULL,
  `lecture_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_topics_user_id_foreign` (`user_id`),
  KEY `forum_topics_course_id_foreign` (`course_id`),
  KEY `forum_topics_lecture_id_foreign` (`lecture_id`),
  CONSTRAINT `forum_topics_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topics_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topics_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `header_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `header_menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` char(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `parent_id` int NOT NULL DEFAULT '0',
  `new_window` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `invoice_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_id` bigint unsigned NOT NULL,
  `status` char(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'p',
  `amount` double(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_transactions_invoice_id_foreign` (`invoice_id`),
  CONSTRAINT `invoice_transactions_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `amount` double(8,2) NOT NULL,
  `cart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `payment_method_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_currency_id_foreign` (`currency_id`),
  KEY `invoices_payment_method_id_foreign` (`payment_method_id`),
  KEY `invoices_user_id_foreign` (`user_id`),
  CONSTRAINT `invoices_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoices_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ips` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ips_ip_unique` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `lecture_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecture_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lecture_id` bigint unsigned NOT NULL,
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `lecture_files_lecture_id_foreign` (`lecture_id`),
  CONSTRAINT `lecture_files_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `lecture_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecture_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint unsigned NOT NULL,
  `lecture_id` bigint unsigned NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `lecture_notes_student_id_foreign` (`student_id`),
  KEY `lecture_notes_lecture_id_foreign` (`lecture_id`),
  CONSTRAINT `lecture_notes_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lecture_notes_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `lecture_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecture_pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lecture_id` bigint unsigned NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` char(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int DEFAULT NULL,
  `audio_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `lecture_pages_lecture_id_foreign` (`lecture_id`),
  CONSTRAINT `lecture_pages_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `lectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lectures` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lesson_id` bigint unsigned NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lectures_lesson_id_foreign` (`lesson_id`),
  CONSTRAINT `lectures_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `lesson_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lesson_id` bigint unsigned NOT NULL,
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `lesson_files_lesson_id_foreign` (`lesson_id`),
  CONSTRAINT `lesson_files_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `lesson_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sort_order` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `lesson_lesson_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson_lesson_group` (
  `lesson_group_id` bigint unsigned NOT NULL,
  `lesson_id` bigint unsigned NOT NULL,
  KEY `lesson_lesson_group_lesson_group_id_foreign` (`lesson_group_id`),
  KEY `lesson_lesson_group_lesson_id_foreign` (`lesson_id`),
  CONSTRAINT `lesson_lesson_group_lesson_group_id_foreign` FOREIGN KEY (`lesson_group_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lesson_lesson_group_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` bigint unsigned NOT NULL,
  `picture` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sort_order` int DEFAULT NULL,
  `test_required` tinyint(1) DEFAULT NULL,
  `test_id` bigint unsigned DEFAULT NULL,
  `type` char(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `introduction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `enforce_lecture_order` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lessons_admin_id_foreign` (`admin_id`),
  KEY `lessons_test_id_foreign` (`test_id`),
  FULLTEXT KEY `full` (`name`,`description`,`introduction`),
  CONSTRAINT `lessons_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  CONSTRAINT `lessons_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_methods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int DEFAULT NULL,
  `directory` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `supported_currencies` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_global` tinyint(1) NOT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `pending_student_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pending_student_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pending_student_id` bigint unsigned NOT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pending_student_files_pending_student_id_foreign` (`pending_student_id`),
  CONSTRAINT `pending_student_files_pending_student_id_foreign` FOREIGN KEY (`pending_student_id`) REFERENCES `pending_students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `pending_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pending_students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `permission_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_group_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`),
  KEY `permissions_permission_group_id_foreign` (`permission_group_id`),
  CONSTRAINT `permissions_permission_group_id_foreign` FOREIGN KEY (`permission_group_id`) REFERENCES `permission_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `related_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `related_courses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_id` bigint unsigned NOT NULL,
  `related_course_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `related_courses_course_id_foreign` (`course_id`),
  KEY `related_courses_related_course_id_foreign` (`related_course_id`),
  CONSTRAINT `related_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `related_courses_related_course_id_foreign` FOREIGN KEY (`related_course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `revision_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revision_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `course_id` bigint unsigned NOT NULL,
  `lesson_id` bigint unsigned DEFAULT NULL,
  `admin_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revision_notes_course_id_foreign` (`course_id`),
  KEY `revision_notes_lesson_id_foreign` (`lesson_id`),
  KEY `revision_notes_admin_id_foreign` (`admin_id`),
  CONSTRAINT `revision_notes_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  CONSTRAINT `revision_notes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `revision_notes_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `class` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `sms_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_gateways` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gateway_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `directory` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `default` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `sms_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `default` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `placeholders` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `student_certificate_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_certificate_downloads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint unsigned NOT NULL,
  `certificate_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_certificate_downloads_student_id_foreign` (`student_id`),
  KEY `student_certificate_downloads_certificate_id_foreign` (`certificate_id`),
  CONSTRAINT `student_certificate_downloads_certificate_id_foreign` FOREIGN KEY (`certificate_id`) REFERENCES `certificates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_certificate_downloads_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `student_certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_certificates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint unsigned NOT NULL,
  `certificate_id` bigint unsigned NOT NULL,
  `tracking_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_certificates_tracking_number_unique` (`tracking_number`),
  KEY `student_certificates_student_id_foreign` (`student_id`),
  KEY `student_certificates_certificate_id_foreign` (`certificate_id`),
  CONSTRAINT `student_certificates_certificate_id_foreign` FOREIGN KEY (`certificate_id`) REFERENCES `certificates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_certificates_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `student_course_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_course_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint unsigned NOT NULL,
  `course_id` bigint unsigned NOT NULL,
  `lecture_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_course_logs_student_id_foreign` (`student_id`),
  KEY `student_course_logs_course_id_foreign` (`course_id`),
  KEY `student_course_logs_lecture_id_foreign` (`lecture_id`),
  CONSTRAINT `student_course_logs_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_course_logs_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_course_logs_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `student_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_courses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint unsigned NOT NULL,
  `course_id` bigint unsigned NOT NULL,
  `reg_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `student_courses_student_id_foreign` (`student_id`),
  KEY `student_courses_course_id_foreign` (`course_id`),
  CONSTRAINT `student_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_courses_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `student_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `placeholder` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `student_lectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_lectures` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint unsigned NOT NULL,
  `course_id` bigint unsigned NOT NULL,
  `lecture_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_lectures_student_id_foreign` (`student_id`),
  KEY `student_lectures_course_id_foreign` (`course_id`),
  KEY `student_lectures_lecture_id_foreign` (`lecture_id`),
  CONSTRAINT `student_lectures_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_lectures_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_lectures_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `student_student_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_student_field` (
  `student_id` bigint unsigned NOT NULL,
  `student_field_id` bigint unsigned NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  KEY `student_student_field_student_id_foreign` (`student_id`),
  KEY `student_student_field_student_field_id_foreign` (`student_field_id`),
  CONSTRAINT `student_student_field_student_field_id_foreign` FOREIGN KEY (`student_field_id`) REFERENCES `student_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_student_field_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `student_test_test_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_test_test_option` (
  `student_test_id` bigint unsigned NOT NULL,
  `test_option_id` bigint unsigned NOT NULL,
  KEY `student_test_test_option_student_test_id_foreign` (`student_test_id`),
  KEY `student_test_test_option_test_option_id_foreign` (`test_option_id`),
  CONSTRAINT `student_test_test_option_student_test_id_foreign` FOREIGN KEY (`student_test_id`) REFERENCES `student_tests` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_test_test_option_test_option_id_foreign` FOREIGN KEY (`test_option_id`) REFERENCES `test_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `student_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_tests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint unsigned NOT NULL,
  `test_id` bigint unsigned NOT NULL,
  `score` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_tests_student_id_foreign` (`student_id`),
  KEY `student_tests_test_id_foreign` (`test_id`),
  CONSTRAINT `student_tests_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_tests_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `student_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_video` (
  `student_id` bigint unsigned NOT NULL,
  `video_id` bigint unsigned NOT NULL,
  KEY `student_video_student_id_foreign` (`student_id`),
  KEY `student_video_video_id_foreign` (`video_id`),
  CONSTRAINT `student_video_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_video_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `mobile_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_expires` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `students_user_id_foreign` (`user_id`),
  CONSTRAINT `students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `survey_option_survey_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_option_survey_response` (
  `survey_response_id` bigint unsigned NOT NULL,
  `survey_option_id` bigint unsigned NOT NULL,
  KEY `survey_response_survey_option_survey_response_id_foreign` (`survey_response_id`),
  KEY `survey_response_survey_option_survey_option_id_foreign` (`survey_option_id`),
  CONSTRAINT `survey_response_survey_option_survey_option_id_foreign` FOREIGN KEY (`survey_option_id`) REFERENCES `survey_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `survey_response_survey_option_survey_response_id_foreign` FOREIGN KEY (`survey_response_id`) REFERENCES `survey_responses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `survey_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `survey_question_id` bigint unsigned NOT NULL,
  `option` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `survey_options_survey_question_id_foreign` (`survey_question_id`),
  CONSTRAINT `survey_options_survey_question_id_foreign` FOREIGN KEY (`survey_question_id`) REFERENCES `survey_questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `survey_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_questions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `survey_id` bigint unsigned NOT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sort_order` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_questions_survey_id_foreign` (`survey_id`),
  CONSTRAINT `survey_questions_survey_id_foreign` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `survey_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_responses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `survey_id` bigint unsigned NOT NULL,
  `student_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_responses_survey_id_foreign` (`survey_id`),
  KEY `survey_responses_student_id_foreign` (`student_id`),
  CONSTRAINT `survey_responses_survey_id_foreign` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surveys` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `hash` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` bigint unsigned DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `surveys_admin_id_foreign` (`admin_id`),
  CONSTRAINT `surveys_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `template_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_colors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `template_id` bigint unsigned NOT NULL,
  `original_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `template_colors_template_id_foreign` (`template_id`),
  CONSTRAINT `template_colors_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `template_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `template_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `template_options_template_id_foreign` (`template_id`),
  CONSTRAINT `template_options_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `template_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `directory` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `templates_directory_unique` (`directory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `test_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_grades` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `grade` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `min` int NOT NULL,
  `max` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `test_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `test_question_id` bigint unsigned NOT NULL,
  `option` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test_options_test_question_id_foreign` (`test_question_id`),
  CONSTRAINT `test_options_test_question_id_foreign` FOREIGN KEY (`test_question_id`) REFERENCES `test_questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `test_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_questions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `test_id` bigint unsigned NOT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sort_order` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `test_questions_test_id_foreign` (`test_id`),
  CONSTRAINT `test_questions_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `minutes` int DEFAULT NULL,
  `allow_multiple` tinyint(1) NOT NULL DEFAULT '0',
  `passmark` double(8,2) DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `show_result` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `tests_admin_id_foreign` (`admin_id`),
  CONSTRAINT `tests_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint unsigned NOT NULL,
  `payment_method_id` bigint unsigned NOT NULL,
  `amount` double(8,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_student_id_foreign` (`student_id`),
  KEY `transactions_payment_method_id_foreign` (`payment_method_id`),
  CONSTRAINT `transactions_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint unsigned NOT NULL,
  `picture` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `last_seen` timestamp NULL DEFAULT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_token_expires` timestamp NULL DEFAULT NULL,
  `billing_firstname` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_lastname` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_country_id` bigint unsigned DEFAULT NULL,
  `billing_state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `billing_address_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_zip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  FULLTEXT KEY `full` (`name`,`email`,`last_name`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `admin_id` bigint unsigned DEFAULT NULL,
  `length` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ready` tinyint(1) DEFAULT '0',
  `location` char(191) COLLATE utf8mb4_unicode_ci DEFAULT 'l',
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `videos_admin_id_foreign` (`admin_id`),
  FULLTEXT KEY `full` (`name`,`description`),
  CONSTRAINT `videos_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `widget_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widget_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int DEFAULT NULL,
  `visibility` char(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'b',
  PRIMARY KEY (`id`),
  KEY `widget_values_widget_id_foreign` (`widget_id`),
  CONSTRAINT `widget_values_widget_id_foreign` FOREIGN KEY (`widget_id`) REFERENCES `widgets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `repeat` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (1,'2014_10_12_000000_create_users_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (2,'2014_10_12_100000_create_password_resets_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (3,'2019_08_19_000000_create_failed_jobs_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (4,'2020_04_07_171722_create_students_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (5,'2020_04_10_144311_create_admins_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (6,'2020_04_10_144327_create_articles_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (7,'2020_04_10_144335_create_courses_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (8,'2020_04_10_144445_create_lessons_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (9,'2020_04_10_144504_create_lectures_table',2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (10,'2020_04_10_144517_create_assignments_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (11,'2020_04_10_144537_create_assignment_submissions_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (12,'2020_04_10_144547_create_attendances_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (13,'2020_04_10_144557_create_bookmarks_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (14,'2020_04_10_144609_create_certificates_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (15,'2020_04_10_144617_create_certificate_assignments_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (16,'2020_04_10_144632_create_certificate_lessons_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (17,'2020_04_10_144714_create_tests_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (18,'2020_04_10_144723_create_certificate_tests_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (19,'2020_04_10_144741_create_countries_table',3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (20,'2020_04_10_144818_create_coupons_table',4);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (21,'2020_04_10_144854_create_course_categories_table',4);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (22,'2020_04_10_144958_create_coupon_categories_table',5);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (23,'2020_04_10_150647_create_currencies_table',6);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (24,'2020_04_10_150716_create_payment_methods_table',6);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (25,'2020_04_10_150731_create_invoices_table',6);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (26,'2020_04_10_150802_create_coupon_invoices_table',6);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (27,'2020_04_10_153758_create_coupon_courses_table',7);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (28,'2020_04_10_153826_create_discussions_table',7);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (29,'2020_04_10_153849_create_discussion_admins_table',7);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (30,'2020_04_10_154910_create_discussion_replies_table',7);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (31,'2020_04_10_154934_create_downloads_table',7);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (32,'2020_04_10_155002_create_download_files_table',7);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (33,'2020_04_10_155014_create_download_courses_table',7);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (34,'2020_04_10_155051_create_email_templates_table',7);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (35,'2020_04_10_155114_create_forum_topics_table',7);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (36,'2020_04_10_155126_create_forum_posts_table',7);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (37,'2020_04_10_155138_create_forum_participants_table',7);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (38,'2020_04_10_155251_create_revision_notes_table',8);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (39,'2020_04_10_155309_create_invoice_transactions_table',8);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (40,'2020_04_10_155325_create_ips_table',8);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (41,'2020_04_10_155352_create_lecture_files_table',8);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (42,'2020_04_10_155405_create_lecture_notes_table',8);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (43,'2020_04_10_160903_create_lecture_pages_table',9);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (44,'2020_04_13_103711_create_lesson_files_table',9);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (45,'2020_04_13_103723_create_lesson_groups_table',9);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (46,'2020_04_13_104351_lesson_lesson_group_pivot',9);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (47,'2020_04_13_104433_create_blog_posts_table',9);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (48,'2020_04_13_104445_create_blog_categories_table',9);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (49,'2020_04_13_110020_blog_category_pivot',9);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (50,'2020_04_13_110506_payment_method_currency_pivot',9);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (51,'2020_04_13_110821_create_payment_method_fields_table',9);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (52,'2020_04_13_110937_create_permission_groups_table',9);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (53,'2020_04_13_122949_create_permissions_table',9);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (54,'2020_04_13_123037_create_student_fields_table',9);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (55,'2020_04_13_123120_create_related_courses_table',9);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (56,'2020_04_13_130436_create_roles_table',10);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (57,'2020_04_13_130506_add_role_to_users',10);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (58,'2020_04_13_134615_admin_permission_pivot',10);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (59,'2020_04_13_142536_add_role_user_pivot',10);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (60,'2020_04_13_142737_create_course_category_pivot',10);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (61,'2020_04_13_142836_admin_course_pivot',10);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (62,'2020_04_13_175310_create_course_lessons_table',10);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (63,'2020_04_14_121252_create_course_lesson_admins_table',10);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (64,'2020_04_14_121954_create_surveys_table',10);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (65,'2020_04_14_122043_add_course_survey_pivot',10);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (66,'2020_04_14_122132_create_course_tests_table',10);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (67,'2020_04_14_122557_create_settings_table',11);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (68,'2020_04_14_122642_create_sms_gateways_table',11);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (69,'2020_04_14_122704_create_sms_gateway_fields_table',11);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (70,'2020_04_14_122725_create_sms_templates_table',11);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (71,'2020_04_14_122905_create_student_certificates_table',11);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (72,'2020_04_15_125950_create_student_certificate_downloads_table',11);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (73,'2020_04_15_130241_student_field_pivot',12);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (74,'2020_04_15_130411_create_student_lectures_table',13);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (75,'2020_04_15_130546_create_pending_students_table',13);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (76,'2020_04_15_130650_create_student_courses_table',13);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (77,'2020_04_15_130709_create_student_course_logs_table',13);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (78,'2020_04_15_130729_create_student_tests_table',13);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (79,'2020_04_15_130954_create_survey_questions_table',14);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (80,'2020_04_15_131008_create_survey_options_table',14);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (81,'2020_04_15_131027_create_survey_responses_table',14);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (82,'2020_04_15_131349_create_survey_response_options_table',14);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (83,'2020_04_15_131713_create_templates_table',14);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (84,'2020_04_15_131726_create_template_options_table',14);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (85,'2020_04_15_131740_create_template_colors_table',14);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (86,'2020_04_15_131821_create_test_grades_table',14);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (87,'2020_04_15_131945_create_test_questions_table',14);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (88,'2020_04_15_131949_create_test_options_table',14);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (89,'2020_04_15_132020_create_transactions_table',15);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (90,'2020_04_15_132049_create_videos_table',15);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (91,'2020_04_15_132207_create_student_videos_table',15);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (92,'2020_04_15_133642_add_picture_to_users',15);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (93,'2020_04_21_105018_create_widgets_table',15);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (94,'2020_04_21_105033_create_widget_values_table',15);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (95,'2020_04_28_130903_make_lesson_pivot',16);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (96,'2020_04_28_145614_make_course_test',17);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (97,'2020_05_12_102430_add_settings',18);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (98,'2020_05_12_113650_seed_permission_groups',19);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (99,'2020_05_12_124843_seed_permissions',20);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (100,'2020_05_20_193453_add_user_to_admins',21);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (101,'2020_05_20_200723_add_default_admin_roles',22);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (102,'2020_08_11_140753_add_parent_to_course_category',23);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (103,'2020_08_11_170723_add_ft_to_lessons',24);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (104,'2020_08_25_122904_add_message_permission',25);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (105,'2020_08_25_124942_add_video_permissions',26);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (106,'2020_08_26_124622_add_capacity_display',27);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (107,'2020_08_27_112622_seed_countries',28);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (108,'2020_08_27_134249_add_default_currency',29);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (109,'2020_09_02_135904_fix_lesson_test',30);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (110,'2020_09_03_111646_make_intro_nullable',31);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (112,'2020_09_03_111802_make_lecture_order_nullable',32);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (113,'2020_09_04_170057_add_dates_to_course_test',33);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (114,'2020_09_09_105230_add_pk_to_course_tests',34);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (115,'2020_09_09_160235_add_last_name_users',35);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (116,'2020_09_10_110652_fix_students_userid_fk',36);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (117,'2020_09_10_140553_add_ft_to_courses',37);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (118,'2020_09_10_140803_add_ft_to_users',37);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (119,'2020_09_22_151500_add_video_settings',38);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (120,'2020_09_22_160543_add_video_fields',39);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (121,'2020_09_22_172335_add_ft_to_videos',40);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (122,'2020_09_23_180106_add_id_to_course_lesson',41);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (123,'2020_09_24_165641_make_late_nullable',42);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (124,'2020_09_25_143442_add_id_to_course_download',43);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (125,'2020_09_29_151537_remove_forum_fk',44);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (126,'2020_10_05_125959_add_id_to_course_survery',45);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (127,'2020_10_05_161754_add_certificate_flag',46);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (128,'2020_10_07_112359_add_blog_permission',47);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (129,'2020_10_08_121006_add_widget_fields',48);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (130,'2020_10_09_160438_set_coupon_total_nullable',49);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (131,'2020_10_09_170447_set_notification_messages',50);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (132,'2020_10_09_172338_set_sms_notification_messages',51);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (133,'2020_10_12_100131_create_header_menus_table',52);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (134,'2020_10_12_100144_create_footer_menus_table',52);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (135,'2020_10_12_101049_add_default_template',53);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (136,'2020_10_13_092538_remove_payment_method_fields',54);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (137,'2020_10_13_105815_update_payment_table',55);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (138,'2020_10_13_134003_rename_currency_field',56);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (139,'2020_10_14_104256_remove_sms_fields_table',57);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (140,'2020_10_14_104456_update_sms_table',58);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (141,'2020_10_16_124938_change_invoice_fields',59);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (142,'2020_10_23_123026_update_setting_menu_values',60);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (143,'2020_11_02_093438_fix_admin_discussion_fk',61);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (144,'2020_11_04_124333_create_demo_builder',62);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (145,'2020_11_10_120724_add_user_login_token',63);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (146,'2020_11_10_142950_create_pending_student_files_table',64);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (147,'2020_11_11_151858_add_billing_details',65);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (148,'2020_11_12_070922_set_invoice_increment',66);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (149,'2020_11_13_145240_add_transaction_increment',67);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (150,'2020_11_17_122359_add_sms_default',68);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (151,'2020_11_17_124231_add_base_url',69);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (152,'2020_11_18_115144_add_mobile_to_articles',70);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (153,'2020_11_27_091941_add_admin_details',71);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (154,'2020_11_27_093838_add_admin_url',72);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (155,'2020_12_02_172012_add_admin_account',73);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (156,'2020_12_03_154614_modify_certificate',74);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (157,'2020_12_04_124356_remove_auto_enroll',75);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (158,'2021_01_11_104057_enable_registration',76);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (160,'2021_01_15_141233_add_enrollment_message',77);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (161,'2021_01_22_104902_remove_invalid_menu_settings',78);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (163,'2021_02_03_125722_fix_student_course_fk',79);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (164,'2021_04_27_102729_make_discussion_course_nullable',80);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (165,'2021_05_04_180647_add_zoom_settings',81);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (166,'2021_05_12_113706_remove_info_settings',82);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (167,'2021_06_14_144605_alter_survey_response',83);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (168,'2021_06_14_181722_rename_survey_response_table',84);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (169,'2021_07_05_112640_add_info_settings',85);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (170,'2021_09_13_122734_update_videos_table',86);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (171,'2021_09_30_094714_add_digit_validator_to_video',87);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (172,'2021_12_30_131259_add_frontend_setting',88);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (173,'2021_12_30_150707_add_dashboard_setting',89);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (174,'2023_01_12_124357_create_certificate_payments_table',90);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (175,'2023_01_12_125240_add_certificate_payment_fields',91);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (176,'2023_03_21_123433_add_video_storage_settings',92);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (177,'2023_03_21_133128_add_location_to_videos',93);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (178,'2023_03_21_154142_add_mime_type_to_videos',94);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (179,'2023_12_22_143945_add_pinned_to_courses',95);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (180,'2024_04_24_092543_fix_lecture_discussion',96);
