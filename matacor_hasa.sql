-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 15, 2024 at 01:16 AM
-- Server version: 10.11.5-MariaDB
-- PHP Version: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `matacor_hasa`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(120) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, '11qEvJwz050zMuOJvigoq9yjZYkwf883', 1, '2024-01-29 02:42:46', '2024-01-29 02:42:46', '2024-01-29 02:42:46'),
(2, 2, 'eQz8JaQZ3LWzqw6h5YGqu0x2O1h6sZHn', 1, '2024-01-29 02:42:46', '2024-01-29 02:42:46', '2024-01-29 02:42:46');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `action_label` varchar(255) DEFAULT NULL,
  `action_url` varchar(255) DEFAULT NULL,
  `description` varchar(400) NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_histories`
--

CREATE TABLE `audit_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(60) NOT NULL,
  `request` longtext DEFAULT NULL,
  `action` varchar(120) NOT NULL,
  `user_agent` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `reference_user` bigint(20) UNSIGNED NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_name` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_histories`
--

INSERT INTO `audit_histories` (`id`, `user_id`, `module`, `request`, `action`, `user_agent`, `ip_address`, `reference_user`, `reference_id`, `reference_name`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.103.162', 0, 1, 'Asma Chikh', 'info', '2024-02-10 20:54:22', '2024-02-10 20:54:22'),
(2, 1, 'backup', '{\"name\":\"test_backup\",\"description\":\"first\"}', 'created', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.103.162', 1, 0, '', 'info', '2024-02-10 21:09:32', '2024-02-10 21:09:32'),
(3, 1, 'language', '{\"lang_id\":\"0\",\"lang_name\":\"\\u0627\\u0644\\u0639\\u0631\\u0628\\u064a\\u0629\",\"lang_locale\":\"ar\",\"lang_code\":\"ar\",\"lang_flag\":\"dz\",\"lang_order\":\"0\",\"lang_is_rtl\":\"1\"}', 'created', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.104.110', 1, 3, '', 'info', '2024-02-10 22:07:53', '2024-02-10 22:07:53'),
(4, 1, 'language', '{\"lang_id\":\"0\",\"lang_name\":\"Fran\\u00e7ais\",\"lang_locale\":\"fr\",\"lang_code\":\"fr_FR\",\"lang_flag\":\"fr\",\"lang_order\":\"0\",\"lang_is_rtl\":\"0\"}', 'created', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.104.110', 1, 4, '', 'info', '2024-02-10 22:08:12', '2024-02-10 22:08:12'),
(5, 1, 'language', '{\"lang_id\":\"4\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.104.110', 1, 4, '', 'primary', '2024-02-10 22:08:19', '2024-02-10 22:08:19'),
(6, 1, 'language', '{\"lang_id\":\"3\",\"lang_name\":\"\\u0627\\u0644\\u0639\\u0631\\u0628\\u064a\\u0629\",\"lang_locale\":\"ar\",\"lang_code\":\"ar\",\"lang_flag\":\"dz\",\"lang_order\":\"3\",\"lang_is_rtl\":\"1\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.104.110', 1, 3, '', 'primary', '2024-02-10 22:08:56', '2024-02-10 22:08:56'),
(7, 1, 'language', '{\"lang_id\":\"1\",\"lang_name\":\"English\",\"lang_locale\":\"en\",\"lang_code\":\"en_US\",\"lang_flag\":\"us\",\"lang_order\":\"1\",\"lang_is_rtl\":\"0\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.104.110', 1, 1, '', 'primary', '2024-02-10 22:09:09', '2024-02-10 22:09:09'),
(8, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.104.110', 0, 1, 'Asma Chikh', 'info', '2024-02-10 22:30:04', '2024-02-10 22:30:04'),
(9, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 0, 1, 'Asma Chikh', 'info', '2024-02-12 11:18:53', '2024-02-12 11:18:53'),
(10, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 0, 1, 'Asma Chikh', 'info', '2024-02-12 13:23:50', '2024-02-12 13:23:50'),
(11, 1, 'form', '{\"_method\":\"PUT\",\"locale\":\"fr\",\"locale_direction\":\"ltr\",\"theme_mode\":\"light\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 1, 1, 'Asma Chikh', 'primary', '2024-02-12 13:24:26', '2024-02-12 13:24:26'),
(12, 1, 'language', '{\"_method\":\"delete\"}', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 1, 2, '', 'danger', '2024-02-12 14:05:52', '2024-02-12 14:05:52'),
(13, 1, 'shipping-rule-item', '{\"_method\":\"PUT\",\"name\":\"Livraison\",\"type\":\"based_on_price\",\"from\":\"0.00\",\"to\":null,\"price\":\"0.00\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 1, 2, 'Livraison', 'primary', '2024-02-12 14:19:31', '2024-02-12 14:19:31'),
(14, 1, 'shipping-rule-item', '{\"_method\":\"PUT\",\"name\":\"Livraison gratuite\",\"type\":\"based_on_price\",\"from\":\"0.00\",\"to\":null,\"price\":\"0.00\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 1, 1, 'Livraison gratuite', 'primary', '2024-02-12 14:19:45', '2024-02-12 14:19:45'),
(15, 1, 'form', '{\"name\":\"Algeria\",\"code\":\"ISO 3166-2\",\"nationality\":\"Algerian\",\"order\":\"0\",\"is_default\":\"1\",\"status\":\"published\",\"submitter\":\"save\"}', 'created', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 1, 1, 'Algeria', 'info', '2024-02-12 14:53:36', '2024-02-12 14:53:36'),
(16, 1, 'form', '{\"name\":\"Alg\\u00e9rie\",\"code\":\"ISO 3166-2\",\"nationality\":\"Alg\\u00e9rienne\",\"order\":\"0\",\"is_default\":\"1\",\"language\":\"fr_FR\",\"status\":\"published\",\"submitter\":\"apply\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 1, 1, 'Algérie', 'primary', '2024-02-12 14:54:04', '2024-02-12 14:54:04'),
(17, 1, '', '{\"name\":\"\\u0627\\u0644\\u062c\\u0632\\u0627\\u0626\\u0631\",\"nationality\":\"\\u062c\\u0632\\u0627\\u0626\\u0631\\u064a\\u0629\",\"model\":\"Botble\\\\Location\\\\Models\\\\Country\",\"submitter\":\"apply\",\"language\":\"ar\",\"ref_lang\":\"ar\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 1, 1, 'Algeria', 'primary', '2024-02-12 14:54:46', '2024-02-12 14:54:46'),
(18, 1, 'form', '{\"name\":\"Alger\",\"slug\":null,\"abbreviation\":null,\"country_id\":\"1\",\"order\":\"0\",\"is_default\":\"1\",\"status\":\"published\",\"image\":null}', 'created', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 1, 1, 'Alger', 'info', '2024-02-12 14:55:52', '2024-02-12 14:55:52'),
(19, 1, 'form', '{\"name\":\"Alger\",\"slug\":\"alger\",\"abbreviation\":null,\"country_id\":\"1\",\"order\":\"0\",\"is_default\":\"1\",\"language\":\"fr_FR\",\"status\":\"published\",\"image\":null,\"submitter\":\"apply\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 1, 1, 'Alger', 'primary', '2024-02-12 14:55:56', '2024-02-12 14:55:56'),
(20, 1, 'country', '{\"_method\":\"delete\"}', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 1, 1, 'Algérie', 'danger', '2024-02-12 14:59:32', '2024-02-12 14:59:32'),
(21, 1, 'newsletter', '{\"_method\":\"delete\"}', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 1, 1, '', 'danger', '2024-02-12 15:00:05', '2024-02-12 15:00:05'),
(22, 1, 'newsletter', '{\"_method\":\"delete\"}', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 1, 2, '', 'danger', '2024-02-12 15:00:08', '2024-02-12 15:00:08'),
(23, 1, 'gallery', '{\"_method\":\"delete\"}', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 1, 5, 'Denim', 'danger', '2024-02-12 15:02:37', '2024-02-12 15:02:37'),
(24, 1, 'payment', '{\"ids\":[\"7\",\"5\",\"2\",\"1\"],\"bulk_action\":1,\"bulk_action_table\":\"Botble\\\\Payment\\\\Tables\\\\PaymentTable\",\"bulk_action_target\":\"Botble\\\\Table\\\\BulkActions\\\\DeleteBulkAction\"}', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 1, 1, 'ID: 1', 'danger', '2024-02-12 15:04:54', '2024-02-12 15:04:54'),
(25, 1, 'payment', '{\"ids\":[\"7\",\"5\",\"2\",\"1\"],\"bulk_action\":1,\"bulk_action_table\":\"Botble\\\\Payment\\\\Tables\\\\PaymentTable\",\"bulk_action_target\":\"Botble\\\\Table\\\\BulkActions\\\\DeleteBulkAction\"}', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 1, 2, 'ID: 2', 'danger', '2024-02-12 15:04:54', '2024-02-12 15:04:54'),
(26, 1, 'payment', '{\"ids\":[\"7\",\"5\",\"2\",\"1\"],\"bulk_action\":1,\"bulk_action_table\":\"Botble\\\\Payment\\\\Tables\\\\PaymentTable\",\"bulk_action_target\":\"Botble\\\\Table\\\\BulkActions\\\\DeleteBulkAction\"}', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 1, 5, 'ID: 5', 'danger', '2024-02-12 15:04:54', '2024-02-12 15:04:54'),
(27, 1, 'payment', '{\"ids\":[\"7\",\"5\",\"2\",\"1\"],\"bulk_action\":1,\"bulk_action_table\":\"Botble\\\\Payment\\\\Tables\\\\PaymentTable\",\"bulk_action_target\":\"Botble\\\\Table\\\\BulkActions\\\\DeleteBulkAction\"}', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 1, 7, 'ID: 7', 'danger', '2024-02-12 15:04:54', '2024-02-12 15:04:54'),
(28, 1, 'payment', '{\"ids\":[\"19\",\"15\",\"13\",\"12\"],\"bulk_action\":1,\"bulk_action_table\":\"Botble\\\\Payment\\\\Tables\\\\PaymentTable\",\"bulk_action_target\":\"Botble\\\\Table\\\\BulkActions\\\\DeleteBulkAction\"}', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 1, 12, 'ID: 12', 'danger', '2024-02-12 15:05:31', '2024-02-12 15:05:31'),
(29, 1, 'payment', '{\"ids\":[\"19\",\"15\",\"13\",\"12\"],\"bulk_action\":1,\"bulk_action_table\":\"Botble\\\\Payment\\\\Tables\\\\PaymentTable\",\"bulk_action_target\":\"Botble\\\\Table\\\\BulkActions\\\\DeleteBulkAction\"}', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 1, 13, 'ID: 13', 'danger', '2024-02-12 15:05:31', '2024-02-12 15:05:31'),
(30, 1, 'payment', '{\"ids\":[\"19\",\"15\",\"13\",\"12\"],\"bulk_action\":1,\"bulk_action_table\":\"Botble\\\\Payment\\\\Tables\\\\PaymentTable\",\"bulk_action_target\":\"Botble\\\\Table\\\\BulkActions\\\\DeleteBulkAction\"}', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 1, 15, 'ID: 15', 'danger', '2024-02-12 15:05:31', '2024-02-12 15:05:31'),
(31, 1, 'payment', '{\"ids\":[\"19\",\"15\",\"13\",\"12\"],\"bulk_action\":1,\"bulk_action_table\":\"Botble\\\\Payment\\\\Tables\\\\PaymentTable\",\"bulk_action_target\":\"Botble\\\\Table\\\\BulkActions\\\\DeleteBulkAction\"}', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '197.204.185.140', 1, 19, 'ID: 19', 'danger', '2024-02-12 15:05:31', '2024-02-12 15:05:31'),
(32, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '172.71.95.9', 0, 1, 'Asma Chikh', 'info', '2024-02-13 16:28:57', '2024-02-13 16:28:57'),
(33, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '172.71.95.9', 0, 1, 'Asma Chikh', 'info', '2024-02-13 16:29:00', '2024-02-13 16:29:00'),
(34, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '162.158.45.158', 0, 1, 'Asma Chikh', 'info', '2024-02-14 01:58:32', '2024-02-14 01:58:32'),
(35, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '172.71.114.187', 0, 1, 'Asma Chikh', 'info', '2024-02-14 16:57:10', '2024-02-14 16:57:10'),
(36, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '172.71.114.187', 0, 1, 'Asma Chikh', 'info', '2024-02-14 16:57:11', '2024-02-14 16:57:11'),
(37, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '172.71.115.46', 0, 1, 'Asma Chikh', 'info', '2024-02-14 22:16:59', '2024-02-14 22:16:59'),
(38, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '162.158.45.133', 0, 1, 'Asma Chikh', 'info', '2024-02-15 00:55:23', '2024-02-15 00:55:23');

-- --------------------------------------------------------

--
-- Table structure for table `bb_comments`
--

CREATE TABLE `bb_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` longtext DEFAULT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(120) NOT NULL,
  `ip_address` varchar(39) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `like_count` int(11) NOT NULL DEFAULT 0,
  `reply_count` int(11) NOT NULL DEFAULT 0,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(255) NOT NULL DEFAULT 'Botble\\ACL\\Models\\User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bb_comment_likes`
--

CREATE TABLE `bb_comment_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(255) NOT NULL DEFAULT 'Botble\\ACL\\Models\\User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bb_comment_recommends`
--

CREATE TABLE `bb_comment_recommends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(120) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(255) NOT NULL DEFAULT 'Botble\\ACL\\Models\\User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bb_comment_users`
--

CREATE TABLE `bb_comment_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `avatar_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bb_comment_users`
--

INSERT INTO `bb_comment_users` (`id`, `first_name`, `email`, `password`, `avatar_id`, `remember_token`, `created_at`, `updated_at`, `last_name`) VALUES
(1, 'Asma', 'matacor23@gmail.com', '$2y$12$kVS5NCrwG3nlv9XJXsp1QuOv4Uf8qCHTqSdaXgNkGWOhFQMa1cSU2', NULL, NULL, '2024-02-10 22:31:36', '2024-02-10 22:31:36', 'Chikh');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `description` varchar(400) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `author_type` varchar(255) NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `description`, `status`, `author_id`, `author_type`, `icon`, `order`, `is_featured`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Ecommerce', 0, 'Blanditiis rerum non fugiat dolore facere nam. Velit quas natus dolorum sapiente tenetur dolorum. Eligendi expedita voluptatem repellat quisquam.', 'published', 2, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 1, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(2, 'Fashion', 0, 'Eos architecto enim et quasi voluptatem rerum aut. Sequi molestiae explicabo ut ut. Sint maiores dolores non voluptas perferendis aliquid sint dolorem.', 'published', 2, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(3, 'Electronic', 0, 'Assumenda voluptas consequatur laborum tenetur. Officia ut consequuntur totam quam odit aperiam qui. Vero voluptatem laborum est fuga. Impedit corporis enim atque nemo et aut.', 'published', 2, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(4, 'Commercial', 0, 'Similique necessitatibus possimus ab et similique. Repellat quo rerum ea facilis. Blanditiis distinctio quod magnam exercitationem. Numquam sed quaerat et.', 'published', 2, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2024-01-29 02:42:47', '2024-01-29 02:42:47');

-- --------------------------------------------------------

--
-- Table structure for table `categories_translations`
--

CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) NOT NULL,
  `categories_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `record_id` varchar(40) DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `slug`, `state_id`, `country_id`, `record_id`, `order`, `image`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Adrar', 'adrar', 2, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(2, 'Aoulef', 'aoulef', 2, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(3, 'Reggane', 'reggane', 2, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(4, 'Timimoun', 'timimoun', 2, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(5, 'Aïn Defla', 'ain-defla', 3, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(6, 'El Abadia', 'el-abadia', 3, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(7, 'El Attaf', 'el-attaf', 3, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(8, 'Khemis Miliana', 'khemis-miliana', 3, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(9, 'Theniet el Had', 'theniet-el-had', 3, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(10, 'Aïn Temouchent', 'ain-temouchent', 4, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(11, 'Beni Saf', 'beni-saf', 4, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(12, 'El Amria', 'el-amria', 4, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(13, 'El Malah', 'el-malah', 4, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(14, 'Hammam Bou Hadjar', 'hammam-bou-hadjar', 4, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(15, 'Aïn Taya', 'ain-taya', 5, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(16, 'Algiers', 'algiers', 5, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(17, 'Bab Ezzouar', 'bab-ezzouar', 5, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(18, 'Birkhadem', 'birkhadem', 5, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(19, 'Bordj el Kiffan', 'bordj-el-kiffan', 5, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(20, 'Dar el Beïda', 'dar-el-beida', 5, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(21, 'Rouiba', 'rouiba', 5, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(22, 'Annaba', 'annaba', 6, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(23, 'Berrahal', 'berrahal', 6, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(24, 'Drean', 'drean', 6, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(25, 'El Hadjar', 'el-hadjar', 6, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(26, 'Aïn Touta', 'ain-touta', 7, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(27, 'Arris', 'arris', 7, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(28, 'Barika', 'barika', 7, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(29, 'Batna', 'batna', 7, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(30, 'Boumagueur', 'boumagueur', 7, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(31, 'Merouana', 'merouana', 7, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(32, 'Râs el Aïoun', 'ras-el-aioun', 7, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(33, 'Tazoult-Lambese', 'tazoult-lambese', 7, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(34, 'Béchar', 'bechar', 8, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(35, 'Akbou', 'akbou', 9, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(36, 'Amizour', 'amizour', 9, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(37, 'Barbacha', 'barbacha', 9, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(38, 'Bejaïa', 'bejaia', 9, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(39, 'el hed', 'el-hed', 9, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(40, 'El Kseur', 'el-kseur', 9, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(41, 'Feraoun', 'feraoun', 9, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(42, 'Seddouk', 'seddouk', 9, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(43, 'Biskra', 'biskra', 11, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(44, 'Oumache', 'oumache', 11, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(45, 'Sidi Khaled', 'sidi-khaled', 11, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(46, 'Sidi Okba', 'sidi-okba', 11, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(47, 'Tolga', 'tolga', 11, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(48, 'Zeribet el Oued', 'zeribet-el-oued', 11, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(49, 'Beni Mered', 'beni-mered', 12, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(50, 'Blida', 'blida', 12, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(51, 'Boû Arfa', 'bou-arfa', 12, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(52, 'Boufarik', 'boufarik', 12, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(53, 'Bougara', 'bougara', 12, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(54, 'Bouinan', 'bouinan', 12, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(55, 'Chebli', 'chebli', 12, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(56, 'Chiffa', 'chiffa', 12, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(57, 'Larbaâ', 'larbaa', 12, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(58, 'Meftah', 'meftah', 12, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(59, 'Sidi Moussa', 'sidi-moussa', 12, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(60, 'Souma', 'souma', 12, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(61, 'Bordj Bou Arreridj', 'bordj-bou-arreridj', 14, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(62, 'Bordj Ghdir', 'bordj-ghdir', 14, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(63, 'Bordj Zemoura', 'bordj-zemoura', 14, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(64, 'El Achir', 'el-achir', 14, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(65, 'Mansourah', 'mansourah', 14, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(66, 'Melouza', 'melouza', 14, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(67, 'Râs el Oued', 'ras-el-oued', 14, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(68, 'Aïn Bessem', 'ain-bessem', 15, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(69, 'Bouïra', 'bouira', 15, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(70, 'Chorfa', 'chorfa', 15, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(71, 'Draa el Mizan', 'draa-el-mizan', 15, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(72, 'Lakhdaria', 'lakhdaria', 15, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(73, 'Sour el Ghozlane', 'sour-el-ghozlane', 15, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(74, 'Arbatache', 'arbatache', 16, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(75, 'Beni Amrane', 'beni-amrane', 16, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(76, 'Boudouaou', 'boudouaou', 16, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(77, 'Boumerdas', 'boumerdas', 16, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(78, 'Chabet el Ameur', 'chabet-el-ameur', 16, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(79, 'Dellys', 'dellys', 16, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(80, 'Khemis el Khechna', 'khemis-el-khechna', 16, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(81, 'Makouda', 'makouda', 16, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(82, 'Naciria', 'naciria', 16, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(83, 'Ouled Moussa', 'ouled-moussa', 16, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(84, 'Reghaïa', 'reghaia', 16, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(85, 'Tadmaït', 'tadmait', 16, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(86, 'Thenia', 'thenia', 16, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(87, 'Tizi Gheniff', 'tizi-gheniff', 16, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(88, 'Abou el Hassan', 'abou-el-hassan', 17, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(89, 'Boukadir', 'boukadir', 17, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(90, 'Chlef', 'chlef', 17, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(91, 'Ech Chettia', 'ech-chettia', 17, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(92, 'Oued Fodda', 'oued-fodda', 17, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(93, 'Oued Sly', 'oued-sly', 17, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(94, 'Sidi Akkacha', 'sidi-akkacha', 17, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(95, '’Aïn Abid', 'ain-abid', 18, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(96, 'Aïn Smara', 'ain-smara', 18, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(97, 'Constantine', 'constantine', 18, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(98, 'Didouche Mourad', 'didouche-mourad', 18, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(99, 'El Khroub', 'el-khroub', 18, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(100, 'Hamma Bouziane', 'hamma-bouziane', 18, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(101, '’Aïn el Bell', 'ain-el-bell', 20, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(102, 'Aïn Oussera', 'ain-oussera', 20, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(103, 'Birine', 'birine', 20, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(104, 'Charef', 'charef', 20, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(105, 'Dar Chioukh', 'dar-chioukh', 20, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(106, 'Djelfa', 'djelfa', 20, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(107, 'El Idrissia', 'el-idrissia', 20, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(108, 'Messaad', 'messaad', 20, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(109, 'Brezina', 'brezina', 21, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(110, 'El Abiodh Sidi Cheikh', 'el-abiodh-sidi-cheikh', 21, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(111, 'El Bayadh', 'el-bayadh', 21, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(112, 'Debila', 'debila', 24, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(113, 'El Oued', 'el-oued', 24, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(114, 'Reguiba', 'reguiba', 24, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(115, 'Robbah', 'robbah', 24, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(116, 'Ben Mehidi', 'ben-mehidi', 25, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(117, 'Besbes', 'besbes', 25, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(118, 'El Kala', 'el-kala', 25, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(119, 'El Tarf', 'el-tarf', 25, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(120, 'Berriane', 'berriane', 26, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(121, 'Ghardaïa', 'ghardaia', 26, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(122, 'Metlili Chaamba', 'metlili-chaamba', 26, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(123, 'Boumahra Ahmed', 'boumahra-ahmed', 27, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(124, 'Guelma', 'guelma', 27, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(125, 'Héliopolis', 'heliopolis', 27, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(126, 'Illizi', 'illizi', 28, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(127, 'Jijel', 'jijel', 31, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(128, 'Khenchela', 'khenchela', 32, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(129, 'Aflou', 'aflou', 33, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(130, 'Laghouat', 'laghouat', 33, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(131, '‘Aïn el Hadjel', 'ain-el-hadjel', 34, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(132, '’Aïn el Melh', 'ain-el-melh', 34, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(133, 'M’Sila', 'msila', 34, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(134, 'Sidi Aïssa', 'sidi-aissa', 34, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(135, 'Bou Hanifia el Hamamat', 'bou-hanifia-el-hamamat', 35, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(136, 'Mascara', 'mascara', 35, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(137, 'Oued el Abtal', 'oued-el-abtal', 35, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(138, 'Sig', 'sig', 35, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(139, '’Aïn Boucif', 'ain-boucif', 36, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(140, 'Berrouaghia', 'berrouaghia', 36, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(141, 'Ksar el Boukhari', 'ksar-el-boukhari', 36, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(142, 'Médéa', 'medea', 36, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(143, 'Chelghoum el Aïd', 'chelghoum-el-aid', 37, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(144, 'Mila', 'mila', 37, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(145, 'Rouached', 'rouached', 37, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(146, 'Sidi Mérouane', 'sidi-merouane', 37, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(147, 'Telerghma', 'telerghma', 37, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(148, 'Mostaganem', 'mostaganem', 38, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(149, 'Aïn Sefra', 'ain-sefra', 39, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(150, 'Naama', 'naama', 39, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(151, '’Aïn el Turk', 'ain-el-turk', 40, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(152, 'Aïn el Bya', 'ain-el-bya', 40, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(153, 'Bir el Djir', 'bir-el-djir', 40, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(154, 'Bou Tlelis', 'bou-tlelis', 40, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(155, 'Es Senia', 'es-senia', 40, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(156, 'Mers el Kebir', 'mers-el-kebir', 40, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(157, 'Oran', 'oran', 40, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(158, 'Sidi ech Chahmi', 'sidi-ech-chahmi', 40, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(159, 'Djamaa', 'djamaa', 41, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(160, 'El Hadjira', 'el-hadjira', 41, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(161, 'Hassi Messaoud', 'hassi-messaoud', 41, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(162, 'Megarine', 'megarine', 41, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(163, 'Ouargla', 'ouargla', 41, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(164, 'Rouissat', 'rouissat', 41, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(165, 'Sidi Amrane', 'sidi-amrane', 41, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(166, 'Tebesbest', 'tebesbest', 41, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(167, 'Touggourt', 'touggourt', 41, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(168, 'Aïn Beïda', 'ain-beida', 43, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(169, 'Aïn Fakroun', 'ain-fakroun', 43, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(170, 'Aïn Kercha', 'ain-kercha', 43, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(171, 'El Aouinet', 'el-aouinet', 43, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(172, 'Meskiana', 'meskiana', 43, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(173, 'Oum el Bouaghi', 'oum-el-bouaghi', 43, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(174, '’Aïn Merane', 'ain-merane', 44, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(175, 'Ammi Moussa', 'ammi-moussa', 44, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(176, 'Djidiouia', 'djidiouia', 44, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(177, 'Mazouna', 'mazouna', 44, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(178, 'Oued Rhiou', 'oued-rhiou', 44, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(179, 'Relizane', 'relizane', 44, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(180, 'Smala', 'smala', 44, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(181, 'Zemoura', 'zemoura', 44, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(182, '’Aïn el Hadjar', 'ain-el-hadjar', 45, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(183, 'Saïda', 'saida', 45, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(184, 'Aïn Arnat', 'ain-arnat', 46, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(185, 'BABOR - VILLE', 'babor-ville', 46, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(186, 'Bougaa', 'bougaa', 46, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(187, 'El Eulma', 'el-eulma', 46, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(188, 'Salah Bey', 'salah-bey', 46, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(189, 'Sétif', 'setif', 46, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(190, 'Aïn El Berd District', 'ain-el-berd-district', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(191, 'Balidat Ameur', 'balidat-ameur', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(192, 'Belarbi', 'belarbi', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(193, 'Ben Badis Sid Bel Abbés', 'ben-badis-sid-bel-abbes', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(194, 'El Bour', 'el-bour', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(195, 'Haoud El Hamra', 'haoud-el-hamra', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(196, 'Lamtar', 'lamtar', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(197, 'Marhoum', 'marhoum', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(198, 'Merine', 'merine', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(199, 'Mezaourou', 'mezaourou', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(200, 'Moggar', 'moggar', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(201, 'Moulay Slissen', 'moulay-slissen', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(202, 'N\'Goussa', 'ngoussa', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(203, 'Sfissef', 'sfissef', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(204, 'Sidi Ali Boussidi', 'sidi-ali-boussidi', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(205, 'Sidi Bel Abbès', 'sidi-bel-abbes', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(206, 'Sidi Brahim', 'sidi-brahim', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(207, 'Sidi Hamadouche', 'sidi-hamadouche', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(208, 'Sidi Slimane', 'sidi-slimane', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(209, 'Sidi Yacoub', 'sidi-yacoub', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(210, 'Sidi Yahia', 'sidi-yahia', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(211, 'Tabia Sid Bel Abbés', 'tabia-sid-bel-abbes', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(212, 'Taibet', 'taibet', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(213, 'Tamellaht', 'tamellaht', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(214, 'Tamerna Djedida', 'tamerna-djedida', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(215, 'Teghalimet', 'teghalimet', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(216, 'Telagh', 'telagh', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(217, 'Tenezara', 'tenezara', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(218, 'Tenira', 'tenira', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(219, 'Tessala', 'tessala', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(220, 'Zerouala', 'zerouala', 47, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(221, 'Azzaba', 'azzaba', 48, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(222, 'Karkira', 'karkira', 48, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(223, 'Skikda', 'skikda', 48, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(224, 'Tamalous', 'tamalous', 48, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(225, 'Sedrata', 'sedrata', 49, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(226, 'Souk Ahras', 'souk-ahras', 49, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(227, 'I-n-Salah', 'i-n-salah', 50, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(228, 'Tamanrasset', 'tamanrasset', 50, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(229, 'Bir el Ater', 'bir-el-ater', 51, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(230, 'Cheria', 'cheria', 51, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(231, 'Hammamet', 'hammamet', 51, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(232, 'Tébessa', 'tebessa', 51, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(233, '’Aïn Deheb', 'ain-deheb', 52, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(234, 'Djebilet Rosfa', 'djebilet-rosfa', 52, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(235, 'Frenda', 'frenda', 52, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(236, 'Ksar Chellala', 'ksar-chellala', 52, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(237, 'Mehdia daira de meghila', 'mehdia-daira-de-meghila', 52, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(238, 'Sougueur', 'sougueur', 52, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(239, 'Tiaret', 'tiaret', 52, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(240, 'Tindouf', 'tindouf', 54, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(241, '’Aïn Benian', 'ain-benian', 55, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(242, 'Baraki', 'baraki', 55, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(243, 'Bou Ismaïl', 'bou-ismail', 55, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(244, 'Cheraga', 'cheraga', 55, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(245, 'Douera', 'douera', 55, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(246, 'El Affroun', 'el-affroun', 55, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(247, 'Hadjout', 'hadjout', 55, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(248, 'Kolea', 'kolea', 55, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(249, 'Mouzaïa', 'mouzaia', 55, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(250, 'Oued el Alleug', 'oued-el-alleug', 55, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(251, 'Saoula', 'saoula', 55, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(252, 'Tipasa', 'tipasa', 55, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(253, 'Zeralda', 'zeralda', 55, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(254, 'Lardjem', 'lardjem', 56, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(255, 'Tissemsilt', 'tissemsilt', 56, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(256, '’Aïn el Hammam', 'ain-el-hammam', 57, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(257, 'Arhribs', 'arhribs', 57, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(258, 'Azazga', 'azazga', 57, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(259, 'Beni Douala', 'beni-douala', 57, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(260, 'Boghni', 'boghni', 57, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(261, 'Boudjima', 'boudjima', 57, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(262, 'Chemini', 'chemini', 57, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(263, 'Draa Ben Khedda', 'draa-ben-khedda', 57, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(264, 'Freha', 'freha', 57, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(265, 'Ighram', 'ighram', 57, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(266, 'L’Arbaa Naït Irathen', 'larbaa-nait-irathen', 57, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(267, 'Mekla', 'mekla', 57, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(268, 'Timizart', 'timizart', 57, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(269, 'Tirmitine', 'tirmitine', 57, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(270, 'Tizi Ouzou', 'tizi-ouzou', 57, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(271, 'Tizi Rached', 'tizi-rached', 57, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(272, 'Tizi-n-Tleta', 'tizi-n-tleta', 57, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(273, 'Beni Mester', 'beni-mester', 58, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(274, 'Bensekrane', 'bensekrane', 58, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(275, 'Chetouane', 'chetouane', 58, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(276, 'Hennaya', 'hennaya', 58, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(277, 'Mansoûra', 'mansoura', 58, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(278, 'Nedroma', 'nedroma', 58, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(279, 'Ouled Mimoun', 'ouled-mimoun', 58, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(280, 'Remchi', 'remchi', 58, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(281, 'Sebdou', 'sebdou', 58, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(282, 'Sidi Abdelli', 'sidi-abdelli', 58, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(283, 'Sidi Senoussi سيدي سنوسي', 'sidi-senoussi-sydy-snosy', 58, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(284, 'Tlemcen', 'tlemcen', 58, 2, NULL, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10');

-- --------------------------------------------------------

--
-- Table structure for table `cities_translations`
--

CREATE TABLE `cities_translations` (
  `lang_code` varchar(20) NOT NULL,
  `cities_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `slug` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(60) DEFAULT NULL,
  `address` varchar(120) DEFAULT NULL,
  `subject` varchar(120) DEFAULT NULL,
  `content` longtext NOT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_replies`
--

CREATE TABLE `contact_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` longtext NOT NULL,
  `contact_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `nationality` varchar(120) DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `nationality`, `order`, `is_default`, `status`, `created_at`, `updated_at`, `code`) VALUES
(2, 'Algeria', 'Algeria', 0, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10', 'DZ');

-- --------------------------------------------------------

--
-- Table structure for table `countries_translations`
--

CREATE TABLE `countries_translations` (
  `lang_code` varchar(20) NOT NULL,
  `countries_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `nationality` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries_translations`
--

INSERT INTO `countries_translations` (`lang_code`, `countries_id`, `name`, `nationality`) VALUES
('ar', 1, 'الجزائر', 'جزائرية'),
('en_US', 1, 'Algeria', 'Algerian');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widgets`
--

CREATE TABLE `dashboard_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard_widgets`
--

INSERT INTO `dashboard_widgets` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'widget_total_1', '2024-02-10 20:55:23', '2024-02-10 20:55:23'),
(2, 'widget_total_2', '2024-02-10 20:55:23', '2024-02-10 20:55:23'),
(3, 'widget_total_3', '2024-02-10 20:55:23', '2024-02-10 20:55:23'),
(4, 'widget_total_4', '2024-02-10 20:55:23', '2024-02-10 20:55:23'),
(5, 'widget_total_themes', '2024-02-10 20:55:23', '2024-02-10 20:55:23'),
(6, 'widget_total_users', '2024-02-10 20:55:23', '2024-02-10 20:55:23'),
(7, 'widget_total_plugins', '2024-02-10 20:55:23', '2024-02-10 20:55:23'),
(8, 'widget_total_pages', '2024-02-10 20:55:23', '2024-02-10 20:55:23'),
(9, 'widget_analytics_general', '2024-02-10 20:55:23', '2024-02-10 20:55:23'),
(10, 'widget_analytics_page', '2024-02-10 20:55:23', '2024-02-10 20:55:23'),
(11, 'widget_analytics_browser', '2024-02-10 20:55:23', '2024-02-10 20:55:23'),
(12, 'widget_analytics_referrer', '2024-02-10 20:55:23', '2024-02-10 20:55:23'),
(13, 'widget_posts_recent', '2024-02-10 20:55:23', '2024-02-10 20:55:23'),
(14, 'widget_audit_logs', '2024-02-10 20:55:23', '2024-02-10 20:55:23'),
(15, 'widget_ecommerce_report_general', '2024-02-10 20:55:23', '2024-02-10 20:55:23'),
(16, 'widget_latest_referrals', '2024-02-10 21:58:57', '2024-02-10 21:58:57');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widget_settings`
--

CREATE TABLE `dashboard_widget_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `settings` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `widget_id` bigint(20) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_brands`
--

CREATE TABLE `ec_brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_brands`
--

INSERT INTO `ec_brands` (`id`, `name`, `description`, `website`, `logo`, `status`, `order`, `is_featured`, `created_at`, `updated_at`) VALUES
(1, 'Fashion live', NULL, NULL, 'brands/1.png', 'published', 0, 1, '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(2, 'Hand crafted', NULL, NULL, 'brands/2.png', 'published', 1, 1, '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(3, 'Mestonix', NULL, NULL, 'brands/3.png', 'published', 2, 1, '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(4, 'Sunshine', NULL, NULL, 'brands/4.png', 'published', 3, 1, '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(5, 'Pure', NULL, NULL, 'brands/5.png', 'published', 4, 1, '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(6, 'Anfold', NULL, NULL, 'brands/6.png', 'published', 5, 1, '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(7, 'Automotive', NULL, NULL, 'brands/7.png', 'published', 6, 1, '2024-01-29 02:42:36', '2024-01-29 02:42:36');

-- --------------------------------------------------------

--
-- Table structure for table `ec_brands_translations`
--

CREATE TABLE `ec_brands_translations` (
  `lang_code` varchar(191) NOT NULL,
  `ec_brands_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_cart`
--

CREATE TABLE `ec_cart` (
  `identifier` varchar(60) NOT NULL,
  `instance` varchar(60) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_currencies`
--

CREATE TABLE `ec_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `is_prefix_symbol` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `decimals` tinyint(3) UNSIGNED DEFAULT 0,
  `order` int(10) UNSIGNED DEFAULT 0,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `exchange_rate` double NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_currencies`
--

INSERT INTO `ec_currencies` (`id`, `title`, `symbol`, `is_prefix_symbol`, `decimals`, `order`, `is_default`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 1, 2, 1, 0, 0.007425, '2024-01-29 02:42:36', '2024-02-14 17:33:39'),
(2, 'EUR', '€', 0, 2, 3, 0, 0.006932, '2024-01-29 02:42:36', '2024-02-14 17:33:39'),
(3, 'VND', '₫', 0, 0, 5, 0, 181.346395, '2024-01-29 02:42:36', '2024-02-14 17:33:39'),
(4, 'NGN', '₦', 1, 2, 7, 0, 11.252687, '2024-01-29 02:42:36', '2024-02-14 17:33:39'),
(5, 'DZD', 'دج', 1, 2, 9, 1, 1, '2024-02-10 21:55:22', '2024-02-12 14:28:44');

-- --------------------------------------------------------

--
-- Table structure for table `ec_customers`
--

CREATE TABLE `ec_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'activated',
  `private_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_customers`
--

INSERT INTO `ec_customers` (`id`, `name`, `email`, `password`, `avatar`, `dob`, `phone`, `remember_token`, `created_at`, `updated_at`, `confirmed_at`, `email_verify_token`, `status`, `private_notes`) VALUES
(1, 'Richie Altenwerth', 'customer@botble.com', '$2y$12$0tvlLT0fIs9Bt4PW561OPOpns.HERU8K5jrrYJpqXIpaap/5taEiy', 'customers/2.jpg', '1990-01-19', '+14096363077', NULL, '2024-01-29 02:42:39', '2024-01-29 02:42:39', '2024-01-29 09:42:39', NULL, 'activated', NULL),
(2, 'Mrs. Flavie Conroy', 'john.smith@botble.com', '$2y$12$ATUwWJrcw42BuqOFOOs2QO2o6rX4ldhvRbzsOczZ5PHxFo0tc1jxe', 'customers/7.jpg', '1996-01-04', '+19796005751', NULL, '2024-01-29 02:42:40', '2024-01-29 02:42:40', '2024-01-29 09:42:40', NULL, 'activated', NULL),
(3, 'Cristal McLaughlin DDS', 'tohara@example.net', '$2y$12$lMzUHx4CmLHSTkxj6PAi4.KXLnhIvQcZ2hyrDQKjXTCXSHgSxtvaa', 'customers/1.jpg', '1997-01-20', '+18627918349', NULL, '2024-01-29 02:42:40', '2024-01-29 02:42:40', '2024-01-29 09:42:40', NULL, 'activated', NULL),
(4, 'Diana Friesen IV', 'garrison13@example.net', '$2y$12$tssX2ZdnvQKyeB.6vD5QWu.DiKubbBnelew0iy28vcPzjM.jYPdkm', 'customers/2.jpg', '2003-01-16', '+17865682751', NULL, '2024-01-29 02:42:40', '2024-01-29 02:42:40', '2024-01-29 09:42:40', NULL, 'activated', NULL),
(5, 'Rory Abernathy', 'raymundo.thiel@example.org', '$2y$12$s8/oNlFWjuyE4RkzQhUlZuOuYVzi0LinvM6igsLaVLb/5lg4rZzn.', 'customers/3.jpg', '2002-01-02', '+17626800875', NULL, '2024-01-29 02:42:40', '2024-01-29 02:42:40', '2024-01-29 09:42:40', NULL, 'activated', NULL),
(6, 'Ms. Flavie Skiles', 'dhammes@example.org', '$2y$12$bWVRBY7Y10QCi8/PsMu00.a5Vmkzuz6zFbpACb57.TbIHScPfAtdm', 'customers/4.jpg', '1980-01-05', '+17695249610', NULL, '2024-01-29 02:42:41', '2024-01-29 02:42:41', '2024-01-29 09:42:41', NULL, 'activated', NULL),
(7, 'Maegan Gerhold', 'wiza.cecil@example.net', '$2y$12$rVid33NgPNRiX4/Az.vHY.dtUre5mVm.YLNcirnfaavgUdreDKfdS', 'customers/5.jpg', '2004-01-04', '+14342139145', NULL, '2024-01-29 02:42:41', '2024-01-29 02:42:41', '2024-01-29 09:42:41', NULL, 'activated', NULL),
(8, 'Prof. Laverna Stiedemann', 'sipes.art@example.com', '$2y$12$d3jANQoKXiir/5GWJ.AizO3UW9rXlsrYjrMIe3QqGOwYaUpBmV9fy', 'customers/6.jpg', '1974-01-09', '+15513675133', NULL, '2024-01-29 02:42:41', '2024-01-29 02:42:41', '2024-01-29 09:42:41', NULL, 'activated', NULL),
(9, 'Miss Destini Glover Jr.', 'cristobal74@example.com', '$2y$12$KZJFpIDXpi33wLKzBbZpse118zwhq57T.bww3nrTAj1BAkZF9rPBO', 'customers/7.jpg', '1995-01-11', '+14092980171', NULL, '2024-01-29 02:42:41', '2024-01-29 02:42:41', '2024-01-29 09:42:41', NULL, 'activated', NULL),
(10, 'Abdul Roberts', 'nweimann@example.net', '$2y$12$rcJZ50IBo9hSTR.zNXmN5OeXka/d0ljWDvzsyQZ8vdwmfZgT4xFnW', 'customers/8.jpg', '1994-01-24', '+19384978218', NULL, '2024-01-29 02:42:42', '2024-01-29 02:42:42', '2024-01-29 09:42:42', NULL, 'activated', NULL),
(11, 'Oaklee', 'JfLcYM.dqdhjdd@rushlight.cfd', '$2y$12$mvb5Z6put7rqTCEbAchaAeCEvOVcfiUoNqhkZPqhVIteY2iOTzFmW', NULL, NULL, '489-821-17-71', NULL, '2024-02-10 23:31:08', '2024-02-10 23:31:08', '2024-02-10 23:31:08', NULL, 'activated', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ec_customer_addresses`
--

CREATE TABLE `ec_customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `country` varchar(120) DEFAULT NULL,
  `state` varchar(120) DEFAULT NULL,
  `city` varchar(120) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_customer_addresses`
--

INSERT INTO `ec_customer_addresses` (`id`, `name`, `email`, `phone`, `country`, `state`, `city`, `address`, `customer_id`, `is_default`, `created_at`, `updated_at`, `zip_code`) VALUES
(1, 'Richie Altenwerth', 'customer@botble.com', '+14785928898', 'PM', 'Alabama', 'South Natalie', '99357 Sigmund Passage Suite 713', 1, 1, '2024-01-29 02:42:39', '2024-01-29 02:42:39', '67771'),
(2, 'Richie Altenwerth', 'customer@botble.com', '+19284457431', 'MM', 'South Carolina', 'Port Mckennaside', '378 Daryl Meadows Suite 148', 1, 0, '2024-01-29 02:42:39', '2024-01-29 02:42:39', '59032-5663'),
(3, 'Mrs. Flavie Conroy', 'john.smith@botble.com', '+17733206409', 'SR', 'Kansas', 'East Vivien', '34687 Kris Knoll', 2, 1, '2024-01-29 02:42:40', '2024-01-29 02:42:40', '15024-9967'),
(4, 'Mrs. Flavie Conroy', 'john.smith@botble.com', '+14632222816', 'BN', 'Alaska', 'Croninland', '66752 Mathilde Square', 2, 0, '2024-01-29 02:42:40', '2024-01-29 02:42:40', '05998-2777'),
(5, 'Cristal McLaughlin DDS', 'tohara@example.net', '+14433616167', 'CN', 'Maryland', 'New Oleburgh', '313 Hyatt Fork Apt. 888', 3, 1, '2024-01-29 02:42:40', '2024-01-29 02:42:40', '24489'),
(6, 'Diana Friesen IV', 'garrison13@example.net', '+17609934251', 'MT', 'Louisiana', 'Fadelshire', '6909 Luettgen Vista Suite 269', 4, 1, '2024-01-29 02:42:40', '2024-01-29 02:42:40', '00510'),
(7, 'Rory Abernathy', 'raymundo.thiel@example.org', '+12132722415', 'LK', 'Washington', 'Port Gaetano', '96340 Wilburn Inlet Apt. 092', 5, 1, '2024-01-29 02:42:40', '2024-01-29 02:42:40', '08055-4218'),
(8, 'Ms. Flavie Skiles', 'dhammes@example.org', '+18147776582', 'LY', 'Wyoming', 'Wilkinsonborough', '8459 Nestor Lake Suite 350', 6, 1, '2024-01-29 02:42:41', '2024-01-29 02:42:41', '51316'),
(9, 'Maegan Gerhold', 'wiza.cecil@example.net', '+15204587947', 'LU', 'Georgia', 'Albertoside', '38103 Angelica Valley', 7, 1, '2024-01-29 02:42:41', '2024-01-29 02:42:41', '61575'),
(10, 'Prof. Laverna Stiedemann', 'sipes.art@example.com', '+18564665236', 'CC', 'California', 'Orlandside', '3624 VonRueden Isle', 8, 1, '2024-01-29 02:42:41', '2024-01-29 02:42:41', '54503-9097'),
(11, 'Miss Destini Glover Jr.', 'cristobal74@example.com', '+17573084684', 'GQ', 'New Mexico', 'Turcotteport', '30874 Runte Ville', 9, 1, '2024-01-29 02:42:41', '2024-01-29 02:42:41', '72648'),
(12, 'Abdul Roberts', 'nweimann@example.net', '+19364780068', 'NF', 'Georgia', 'Alannachester', '981 Marco Divide Suite 051', 10, 1, '2024-01-29 02:42:42', '2024-01-29 02:42:42', '67154');

-- --------------------------------------------------------

--
-- Table structure for table `ec_customer_password_resets`
--

CREATE TABLE `ec_customer_password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_customer_recently_viewed_products`
--

CREATE TABLE `ec_customer_recently_viewed_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_customer_used_coupons`
--

CREATE TABLE `ec_customer_used_coupons` (
  `discount_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_discounts`
--

CREATE TABLE `ec_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(120) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_used` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `value` double DEFAULT NULL,
  `type` varchar(60) DEFAULT 'coupon',
  `can_use_with_promotion` tinyint(1) NOT NULL DEFAULT 0,
  `discount_on` varchar(20) DEFAULT NULL,
  `product_quantity` int(10) UNSIGNED DEFAULT NULL,
  `type_option` varchar(100) NOT NULL DEFAULT 'amount',
  `target` varchar(100) NOT NULL DEFAULT 'all-orders',
  `min_order_price` decimal(15,2) DEFAULT NULL,
  `apply_via_url` tinyint(1) NOT NULL DEFAULT 0,
  `display_at_checkout` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_discount_customers`
--

CREATE TABLE `ec_discount_customers` (
  `discount_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_discount_products`
--

CREATE TABLE `ec_discount_products` (
  `discount_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_discount_product_categories`
--

CREATE TABLE `ec_discount_product_categories` (
  `discount_id` bigint(20) UNSIGNED NOT NULL,
  `product_category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_discount_product_collections`
--

CREATE TABLE `ec_discount_product_collections` (
  `discount_id` bigint(20) UNSIGNED NOT NULL,
  `product_collection_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_flash_sales`
--

CREATE TABLE `ec_flash_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `end_date` datetime NOT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_flash_sales`
--

INSERT INTO `ec_flash_sales` (`id`, `name`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Deal of the Day.', '2024-03-17 00:00:00', 'published', '2024-01-29 02:42:46', '2024-01-29 02:42:46'),
(2, 'Gadgets &amp; Accessories', '2024-02-26 00:00:00', 'published', '2024-01-29 02:42:46', '2024-01-29 02:42:46');

-- --------------------------------------------------------

--
-- Table structure for table `ec_flash_sales_translations`
--

CREATE TABLE `ec_flash_sales_translations` (
  `lang_code` varchar(191) NOT NULL,
  `ec_flash_sales_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_flash_sale_products`
--

CREATE TABLE `ec_flash_sale_products` (
  `flash_sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` double UNSIGNED DEFAULT NULL,
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `sold` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_flash_sale_products`
--

INSERT INTO `ec_flash_sale_products` (`flash_sale_id`, `product_id`, `price`, `quantity`, `sold`) VALUES
(1, 1, 272.35, 17, 4),
(2, 7, 20, 18, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ec_global_options`
--

CREATE TABLE `ec_global_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL COMMENT 'Name of options',
  `option_type` varchar(191) NOT NULL COMMENT 'option type',
  `required` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Checked if this option is required',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_global_options`
--

INSERT INTO `ec_global_options` (`id`, `name`, `option_type`, `required`, `created_at`, `updated_at`) VALUES
(1, 'Warranty', 'Botble\\Ecommerce\\Option\\OptionType\\RadioButton', 1, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(2, 'RAM', 'Botble\\Ecommerce\\Option\\OptionType\\RadioButton', 1, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(3, 'CPU', 'Botble\\Ecommerce\\Option\\OptionType\\RadioButton', 1, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(4, 'HDD', 'Botble\\Ecommerce\\Option\\OptionType\\Dropdown', 0, '2024-01-29 02:42:47', '2024-01-29 02:42:47');

-- --------------------------------------------------------

--
-- Table structure for table `ec_global_options_translations`
--

CREATE TABLE `ec_global_options_translations` (
  `lang_code` varchar(191) NOT NULL,
  `ec_global_options_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_global_option_value`
--

CREATE TABLE `ec_global_option_value` (
  `option_id` bigint(20) UNSIGNED NOT NULL COMMENT 'option id',
  `id` bigint(20) UNSIGNED NOT NULL,
  `option_value` tinytext DEFAULT NULL COMMENT 'option value',
  `affect_price` double DEFAULT NULL COMMENT 'value of price of this option affect',
  `order` int(11) NOT NULL DEFAULT 9999,
  `affect_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0. fixed 1. percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_global_option_value`
--

INSERT INTO `ec_global_option_value` (`option_id`, `id`, `option_value`, `affect_price`, `order`, `affect_type`, `created_at`, `updated_at`) VALUES
(1, 1, '1 Year', 0, 9999, 0, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(1, 2, '2 Year', 10, 9999, 0, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(1, 3, '3 Year', 20, 9999, 0, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(2, 4, '4GB', 0, 9999, 0, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(2, 5, '8GB', 10, 9999, 0, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(2, 6, '16GB', 20, 9999, 0, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(3, 7, 'Core i5', 0, 9999, 0, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(3, 8, 'Core i7', 10, 9999, 0, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(3, 9, 'Core i9', 20, 9999, 0, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(4, 10, '128GB', 0, 9999, 0, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(4, 11, '256GB', 10, 9999, 0, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(4, 12, '512GB', 20, 9999, 0, '2024-01-29 02:42:47', '2024-01-29 02:42:47');

-- --------------------------------------------------------

--
-- Table structure for table `ec_global_option_value_translations`
--

CREATE TABLE `ec_global_option_value_translations` (
  `lang_code` varchar(191) NOT NULL,
  `ec_global_option_value_id` bigint(20) UNSIGNED NOT NULL,
  `option_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_grouped_products`
--

CREATE TABLE `ec_grouped_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_product_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `fixed_qty` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_invoices`
--

CREATE TABLE `ec_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(191) NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `customer_name` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `company_logo` varchar(191) DEFAULT NULL,
  `customer_email` varchar(191) DEFAULT NULL,
  `customer_phone` varchar(191) DEFAULT NULL,
  `customer_address` varchar(191) DEFAULT NULL,
  `customer_tax_id` varchar(191) DEFAULT NULL,
  `sub_total` decimal(15,2) UNSIGNED NOT NULL,
  `tax_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `shipping_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `shipping_option` varchar(60) DEFAULT NULL,
  `shipping_method` varchar(60) NOT NULL DEFAULT 'default',
  `coupon_code` varchar(120) DEFAULT NULL,
  `discount_description` varchar(255) DEFAULT NULL,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_invoices`
--

INSERT INTO `ec_invoices` (`id`, `reference_type`, `reference_id`, `code`, `customer_name`, `company_name`, `company_logo`, `customer_email`, `customer_phone`, `customer_address`, `customer_tax_id`, `sub_total`, `tax_amount`, `shipping_amount`, `discount_amount`, `shipping_option`, `shipping_method`, `coupon_code`, `discount_description`, `amount`, `description`, `payment_id`, `status`, `paid_at`, `created_at`, `updated_at`) VALUES
(1, 'Botble\\Ecommerce\\Models\\Order', 1, 'INV-1', 'Richie Altenwerth', '', NULL, 'customer@botble.com', '+14785928898', '99357 Sigmund Passage Suite 713, South Natalie, Alabama, PM', NULL, 551.00, 0.00, 0.00, 0.00, '1', 'default', NULL, NULL, 551.00, NULL, 1, 'pending', NULL, '2024-01-20 18:42:42', '2024-01-29 02:42:42'),
(2, 'Botble\\Ecommerce\\Models\\Order', 2, 'INV-2', 'Ms. Flavie Skiles', '', NULL, 'dhammes@example.org', '+18147776582', '8459 Nestor Lake Suite 350, Wilkinsonborough, Wyoming, LY', NULL, 1571.00, 0.00, 0.00, 0.00, '1', 'default', NULL, NULL, 1571.00, NULL, 2, 'completed', '2024-01-29 02:42:42', '2024-01-18 00:42:42', '2024-01-29 02:42:42'),
(3, 'Botble\\Ecommerce\\Models\\Order', 3, 'INV-3', 'Cristal McLaughlin DDS', '', NULL, 'tohara@example.net', '+14433616167', '313 Hyatt Fork Apt. 888, New Oleburgh, Maryland, CN', NULL, 1408.00, 0.00, 0.00, 0.00, '1', 'default', NULL, NULL, 1408.00, NULL, 3, 'pending', NULL, '2024-01-18 14:42:42', '2024-01-29 02:42:42'),
(4, 'Botble\\Ecommerce\\Models\\Order', 4, 'INV-4', 'Richie Altenwerth', '', NULL, 'customer@botble.com', '+14785928898', '99357 Sigmund Passage Suite 713, South Natalie, Alabama, PM', NULL, 952.00, 0.00, 0.00, 0.00, '1', 'default', NULL, NULL, 952.00, NULL, 4, 'completed', '2024-01-29 02:42:42', '2024-01-26 06:42:42', '2024-01-29 02:42:42'),
(5, 'Botble\\Ecommerce\\Models\\Order', 5, 'INV-5', 'Maegan Gerhold', '', NULL, 'wiza.cecil@example.net', '+15204587947', '38103 Angelica Valley, Albertoside, Georgia, LU', NULL, 1445.00, 0.00, 0.00, 0.00, '1', 'default', NULL, NULL, 1445.00, NULL, 5, 'completed', '2024-01-29 02:42:43', '2024-01-19 18:42:43', '2024-01-29 02:42:43'),
(6, 'Botble\\Ecommerce\\Models\\Order', 6, 'INV-6', 'Diana Friesen IV', '', NULL, 'garrison13@example.net', '+17609934251', '6909 Luettgen Vista Suite 269, Fadelshire, Louisiana, MT', NULL, 1733.00, 0.00, 0.00, 0.00, '1', 'default', NULL, NULL, 1733.00, NULL, 6, 'pending', NULL, '2024-01-26 14:42:43', '2024-01-29 02:42:43'),
(7, 'Botble\\Ecommerce\\Models\\Order', 7, 'INV-7', 'Rory Abernathy', '', NULL, 'raymundo.thiel@example.org', '+12132722415', '96340 Wilburn Inlet Apt. 092, Port Gaetano, Washington, LK', NULL, 2574.00, 0.00, 0.00, 0.00, '1', 'default', NULL, NULL, 2574.00, NULL, 7, 'completed', '2024-01-29 02:42:43', '2024-01-25 14:42:43', '2024-01-29 02:42:43'),
(8, 'Botble\\Ecommerce\\Models\\Order', 8, 'INV-8', 'Cristal McLaughlin DDS', '', NULL, 'tohara@example.net', '+14433616167', '313 Hyatt Fork Apt. 888, New Oleburgh, Maryland, CN', NULL, 877.00, 0.00, 0.00, 0.00, '1', 'default', NULL, NULL, 877.00, NULL, 8, 'completed', '2024-01-29 02:42:43', '2024-01-23 16:42:43', '2024-01-29 02:42:43'),
(9, 'Botble\\Ecommerce\\Models\\Order', 9, 'INV-9', 'Rory Abernathy', '', NULL, 'raymundo.thiel@example.org', '+12132722415', '96340 Wilburn Inlet Apt. 092, Port Gaetano, Washington, LK', NULL, 896.00, 0.00, 0.00, 0.00, '1', 'default', NULL, NULL, 896.00, NULL, 9, 'completed', '2024-01-29 02:42:43', '2024-01-20 02:42:43', '2024-01-29 02:42:43'),
(10, 'Botble\\Ecommerce\\Models\\Order', 10, 'INV-10', 'Maegan Gerhold', '', NULL, 'wiza.cecil@example.net', '+15204587947', '38103 Angelica Valley, Albertoside, Georgia, LU', NULL, 1281.00, 0.00, 0.00, 0.00, '1', 'default', NULL, NULL, 1281.00, NULL, 10, 'completed', '2024-01-29 02:42:44', '2024-01-24 12:42:43', '2024-01-29 02:42:44'),
(11, 'Botble\\Ecommerce\\Models\\Order', 11, 'INV-11', 'Mrs. Flavie Conroy', '', NULL, 'john.smith@botble.com', '+17733206409', '34687 Kris Knoll, East Vivien, Kansas, SR', NULL, 966.00, 0.00, 0.00, 0.00, '1', 'default', NULL, NULL, 966.00, NULL, 11, 'completed', '2024-01-29 02:42:44', '2024-01-28 06:42:44', '2024-01-29 02:42:44'),
(12, 'Botble\\Ecommerce\\Models\\Order', 12, 'INV-12', 'Miss Destini Glover Jr.', '', NULL, 'cristobal74@example.com', '+17573084684', '30874 Runte Ville, Turcotteport, New Mexico, GQ', NULL, 1432.00, 0.00, 0.00, 0.00, '1', 'default', NULL, NULL, 1432.00, NULL, 12, 'completed', '2024-01-29 02:42:44', '2024-01-22 08:42:44', '2024-01-29 02:42:44'),
(13, 'Botble\\Ecommerce\\Models\\Order', 13, 'INV-13', 'Cristal McLaughlin DDS', '', NULL, 'tohara@example.net', '+14433616167', '313 Hyatt Fork Apt. 888, New Oleburgh, Maryland, CN', NULL, 538.00, 0.00, 0.00, 0.00, '1', 'default', NULL, NULL, 538.00, NULL, 13, 'completed', '2024-01-29 02:42:44', '2024-01-22 10:42:44', '2024-01-29 02:42:44'),
(14, 'Botble\\Ecommerce\\Models\\Order', 14, 'INV-14', 'Abdul Roberts', '', NULL, 'nweimann@example.net', '+19364780068', '981 Marco Divide Suite 051, Alannachester, Georgia, NF', NULL, 1839.00, 0.00, 0.00, 0.00, '1', 'default', NULL, NULL, 1839.00, NULL, 14, 'completed', '2024-01-29 02:42:44', '2024-01-23 20:42:44', '2024-01-29 02:42:44'),
(15, 'Botble\\Ecommerce\\Models\\Order', 15, 'INV-15', 'Maegan Gerhold', '', NULL, 'wiza.cecil@example.net', '+15204587947', '38103 Angelica Valley, Albertoside, Georgia, LU', NULL, 1847.00, 0.00, 0.00, 0.00, '1', 'default', NULL, NULL, 1847.00, NULL, 15, 'completed', '2024-01-29 02:42:44', '2024-01-27 14:42:44', '2024-01-29 02:42:44'),
(16, 'Botble\\Ecommerce\\Models\\Order', 16, 'INV-16', 'Maegan Gerhold', '', NULL, 'wiza.cecil@example.net', '+15204587947', '38103 Angelica Valley, Albertoside, Georgia, LU', NULL, 2157.00, 0.00, 0.00, 0.00, '1', 'default', NULL, NULL, 2157.00, NULL, 16, 'completed', '2024-01-29 02:42:45', '2024-01-28 06:42:45', '2024-01-29 02:42:45'),
(17, 'Botble\\Ecommerce\\Models\\Order', 17, 'INV-17', 'Diana Friesen IV', '', NULL, 'garrison13@example.net', '+17609934251', '6909 Luettgen Vista Suite 269, Fadelshire, Louisiana, MT', NULL, 1545.00, 0.00, 0.00, 0.00, '1', 'default', NULL, NULL, 1545.00, NULL, 17, 'pending', NULL, '2024-01-28 02:42:45', '2024-01-29 02:42:45'),
(18, 'Botble\\Ecommerce\\Models\\Order', 18, 'INV-18', 'Rory Abernathy', '', NULL, 'raymundo.thiel@example.org', '+12132722415', '96340 Wilburn Inlet Apt. 092, Port Gaetano, Washington, LK', NULL, 1660.00, 0.00, 0.00, 0.00, '1', 'default', NULL, NULL, 1660.00, NULL, 18, 'completed', '2024-01-29 02:42:45', '2024-01-27 20:42:45', '2024-01-29 02:42:45'),
(19, 'Botble\\Ecommerce\\Models\\Order', 19, 'INV-19', 'Cristal McLaughlin DDS', '', NULL, 'tohara@example.net', '+14433616167', '313 Hyatt Fork Apt. 888, New Oleburgh, Maryland, CN', NULL, 1479.00, 0.00, 0.00, 0.00, '1', 'default', NULL, NULL, 1479.00, NULL, 19, 'completed', '2024-01-29 02:42:45', '2024-01-27 22:42:45', '2024-01-29 02:42:45'),
(20, 'Botble\\Ecommerce\\Models\\Order', 20, 'INV-20', 'Ms. Flavie Skiles', '', NULL, 'dhammes@example.org', '+18147776582', '8459 Nestor Lake Suite 350, Wilkinsonborough, Wyoming, LY', NULL, 1466.00, 0.00, 0.00, 0.00, '1', 'default', NULL, NULL, 1466.00, NULL, 20, 'completed', '2024-01-29 02:42:45', '2024-01-28 08:42:45', '2024-01-29 02:42:45');

-- --------------------------------------------------------

--
-- Table structure for table `ec_invoice_items`
--

CREATE TABLE `ec_invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(191) NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `sub_total` decimal(15,2) UNSIGNED NOT NULL,
  `tax_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `options` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_invoice_items`
--

INSERT INTO `ec_invoice_items` (`id`, `invoice_id`, `reference_type`, `reference_id`, `name`, `description`, `image`, `qty`, `price`, `sub_total`, `tax_amount`, `discount_amount`, `amount`, `options`, `created_at`, `updated_at`) VALUES
(1, 1, 'Botble\\Ecommerce\\Models\\Product', 11, 'Clutch handmade', NULL, 'products/2.jpg', 1, 401.00, 401.00, 0.00, 0.00, 401.00, '{\"sku\":\"HS-115-A0\",\"attributes\":\"(Size: S, Color: Red)\"}', '2024-01-29 02:42:42', '2024-01-29 02:42:42'),
(2, 1, 'Botble\\Ecommerce\\Models\\Product', 24, 'The Marc Jacobs', NULL, 'products/7.jpg', 2, 50.00, 100.00, 0.00, 0.00, 100.00, '{\"sku\":\"HS-163-A0\",\"attributes\":\"(Color: Red, Size: XXL)\"}', '2024-01-29 02:42:42', '2024-01-29 02:42:42'),
(3, 1, 'Botble\\Ecommerce\\Models\\Product', 25, 'The Marc Jacobs', NULL, 'products/7-1.jpg', 1, 50.00, 50.00, 0.00, 0.00, 50.00, '{\"sku\":\"HS-163-A0-A1\",\"attributes\":\"(Color: Red, Size: XL)\"}', '2024-01-29 02:42:42', '2024-01-29 02:42:42'),
(4, 2, 'Botble\\Ecommerce\\Models\\Product', 12, 'Clutch handmade', NULL, 'products/2-1.jpg', 1, 401.00, 401.00, 0.00, 0.00, 401.00, '{\"sku\":\"HS-115-A0-A1\",\"attributes\":\"(Color: Green, Size: XXL)\"}', '2024-01-29 02:42:42', '2024-01-29 02:42:42'),
(5, 2, 'Botble\\Ecommerce\\Models\\Product', 16, 'Snapshot Standard', NULL, 'products/4-2.jpg', 2, 411.00, 822.00, 0.00, 0.00, 822.00, '{\"sku\":\"HS-141-A0-A2\",\"attributes\":\"(Size: S, Color: Brown)\"}', '2024-01-29 02:42:42', '2024-01-29 02:42:42'),
(6, 2, 'Botble\\Ecommerce\\Models\\Product', 26, 'Round Cross body Bag', NULL, 'products/8.jpg', 3, 116.00, 348.00, 0.00, 0.00, 348.00, '{\"sku\":\"HS-136-A0\",\"attributes\":\"(Color: Brown, Size: XXL)\"}', '2024-01-29 02:42:42', '2024-01-29 02:42:42'),
(7, 3, 'Botble\\Ecommerce\\Models\\Product', 14, 'Snapshot Standard', NULL, 'products/4.jpg', 3, 411.00, 1233.00, 0.00, 0.00, 1233.00, '{\"sku\":\"HS-141-A0\",\"attributes\":\"(Size: M, Color: Brown)\"}', '2024-01-29 02:42:42', '2024-01-29 02:42:42'),
(8, 3, 'Botble\\Ecommerce\\Models\\Product', 19, 'Joan Mini Camera Bag', NULL, 'products/5-2.jpg', 1, 75.00, 75.00, 0.00, 0.00, 75.00, '{\"sku\":\"HS-172-A0-A2\",\"attributes\":\"(Color: Red, Size: XL)\"}', '2024-01-29 02:42:42', '2024-01-29 02:42:42'),
(9, 3, 'Botble\\Ecommerce\\Models\\Product', 24, 'The Marc Jacobs', NULL, 'products/7.jpg', 2, 50.00, 100.00, 0.00, 0.00, 100.00, '{\"sku\":\"HS-163-A0\",\"attributes\":\"(Color: Red, Size: XXL)\"}', '2024-01-29 02:42:42', '2024-01-29 02:42:42'),
(10, 4, 'Botble\\Ecommerce\\Models\\Product', 12, 'Clutch handmade', NULL, 'products/2-1.jpg', 2, 401.00, 802.00, 0.00, 0.00, 802.00, '{\"sku\":\"HS-115-A0-A1\",\"attributes\":\"(Color: Green, Size: XXL)\"}', '2024-01-29 02:42:42', '2024-01-29 02:42:42'),
(11, 4, 'Botble\\Ecommerce\\Models\\Product', 24, 'The Marc Jacobs', NULL, 'products/7.jpg', 3, 50.00, 150.00, 0.00, 0.00, 150.00, '{\"sku\":\"HS-163-A0\",\"attributes\":\"(Color: Red, Size: XXL)\"}', '2024-01-29 02:42:42', '2024-01-29 02:42:42'),
(12, 5, 'Botble\\Ecommerce\\Models\\Product', 12, 'Clutch handmade', NULL, 'products/2-1.jpg', 2, 401.00, 802.00, 0.00, 0.00, 802.00, '{\"sku\":\"HS-115-A0-A1\",\"attributes\":\"(Color: Green, Size: XXL)\"}', '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(13, 5, 'Botble\\Ecommerce\\Models\\Product', 16, 'Snapshot Standard', NULL, 'products/4-2.jpg', 1, 411.00, 411.00, 0.00, 0.00, 411.00, '{\"sku\":\"HS-141-A0-A2\",\"attributes\":\"(Size: S, Color: Brown)\"}', '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(14, 5, 'Botble\\Ecommerce\\Models\\Product', 26, 'Round Cross body Bag', NULL, 'products/8.jpg', 2, 116.00, 232.00, 0.00, 0.00, 232.00, '{\"sku\":\"HS-136-A0\",\"attributes\":\"(Color: Brown, Size: XXL)\"}', '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(15, 6, 'Botble\\Ecommerce\\Models\\Product', 10, 'Wallet handmade', NULL, 'products/1-1.jpg', 3, 419.00, 1257.00, 0.00, 0.00, 1257.00, '{\"sku\":\"HS-168-A0-A1\",\"attributes\":\"(Size: L, Color: Brown)\"}', '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(16, 6, 'Botble\\Ecommerce\\Models\\Product', 11, 'Clutch handmade', NULL, 'products/2.jpg', 1, 401.00, 401.00, 0.00, 0.00, 401.00, '{\"sku\":\"HS-115-A0\",\"attributes\":\"(Size: S, Color: Red)\"}', '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(17, 6, 'Botble\\Ecommerce\\Models\\Product', 18, 'Joan Mini Camera Bag', NULL, 'products/5-1.jpg', 1, 75.00, 75.00, 0.00, 0.00, 75.00, '{\"sku\":\"HS-172-A0-A1\",\"attributes\":\"(Color: Black, Size: XL)\"}', '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(18, 7, 'Botble\\Ecommerce\\Models\\Product', 10, 'Wallet handmade', NULL, 'products/1-1.jpg', 1, 419.00, 419.00, 0.00, 0.00, 419.00, '{\"sku\":\"HS-168-A0-A1\",\"attributes\":\"(Size: L, Color: Brown)\"}', '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(19, 7, 'Botble\\Ecommerce\\Models\\Product', 11, 'Clutch handmade', NULL, 'products/2.jpg', 3, 401.00, 1203.00, 0.00, 0.00, 1203.00, '{\"sku\":\"HS-115-A0\",\"attributes\":\"(Size: S, Color: Red)\"}', '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(20, 7, 'Botble\\Ecommerce\\Models\\Product', 12, 'Clutch handmade', NULL, 'products/2-1.jpg', 2, 401.00, 802.00, 0.00, 0.00, 802.00, '{\"sku\":\"HS-115-A0-A1\",\"attributes\":\"(Color: Green, Size: XXL)\"}', '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(21, 7, 'Botble\\Ecommerce\\Models\\Product', 20, 'Joan Mini Camera Bag', NULL, 'products/5.jpg', 2, 75.00, 150.00, 0.00, 0.00, 150.00, '{\"sku\":\"HS-172-A0-A3\",\"attributes\":\"(Color: Green, Size: S)\"}', '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(22, 8, 'Botble\\Ecommerce\\Models\\Product', 12, 'Clutch handmade', NULL, 'products/2-1.jpg', 2, 401.00, 802.00, 0.00, 0.00, 802.00, '{\"sku\":\"HS-115-A0-A1\",\"attributes\":\"(Color: Green, Size: XXL)\"}', '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(23, 8, 'Botble\\Ecommerce\\Models\\Product', 19, 'Joan Mini Camera Bag', NULL, 'products/5-2.jpg', 1, 75.00, 75.00, 0.00, 0.00, 75.00, '{\"sku\":\"HS-172-A0-A2\",\"attributes\":\"(Color: Red, Size: XL)\"}', '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(24, 9, 'Botble\\Ecommerce\\Models\\Product', 13, 'Gucci Zip Around Wallet', NULL, 'products/3.jpg', 1, 473.00, 473.00, 0.00, 0.00, 473.00, '{\"sku\":\"HS-159-A0\",\"attributes\":\"(Color: Blue, Size: M)\"}', '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(25, 9, 'Botble\\Ecommerce\\Models\\Product', 19, 'Joan Mini Camera Bag', NULL, 'products/5-2.jpg', 3, 75.00, 225.00, 0.00, 0.00, 225.00, '{\"sku\":\"HS-172-A0-A2\",\"attributes\":\"(Color: Red, Size: XL)\"}', '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(26, 9, 'Botble\\Ecommerce\\Models\\Product', 20, 'Joan Mini Camera Bag', NULL, 'products/5.jpg', 2, 75.00, 150.00, 0.00, 0.00, 150.00, '{\"sku\":\"HS-172-A0-A3\",\"attributes\":\"(Color: Green, Size: S)\"}', '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(27, 9, 'Botble\\Ecommerce\\Models\\Product', 22, 'Cyan Boheme', NULL, 'products/6-1.jpg', 1, 48.00, 48.00, 0.00, 0.00, 48.00, '{\"sku\":\"HS-108-A0-A1\",\"attributes\":\"(Color: Blue, Size: L)\"}', '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(28, 10, 'Botble\\Ecommerce\\Models\\Product', 14, 'Snapshot Standard', NULL, 'products/4.jpg', 3, 411.00, 1233.00, 0.00, 0.00, 1233.00, '{\"sku\":\"HS-141-A0\",\"attributes\":\"(Size: M, Color: Brown)\"}', '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(29, 10, 'Botble\\Ecommerce\\Models\\Product', 23, 'Cyan Boheme', NULL, 'products/6.jpg', 1, 48.00, 48.00, 0.00, 0.00, 48.00, '{\"sku\":\"HS-108-A0-A2\",\"attributes\":\"(Color: Black, Size: XL)\"}', '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(30, 11, 'Botble\\Ecommerce\\Models\\Product', 14, 'Snapshot Standard', NULL, 'products/4.jpg', 2, 411.00, 822.00, 0.00, 0.00, 822.00, '{\"sku\":\"HS-141-A0\",\"attributes\":\"(Size: M, Color: Brown)\"}', '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(31, 11, 'Botble\\Ecommerce\\Models\\Product', 23, 'Cyan Boheme', NULL, 'products/6.jpg', 3, 48.00, 144.00, 0.00, 0.00, 144.00, '{\"sku\":\"HS-108-A0-A2\",\"attributes\":\"(Color: Black, Size: XL)\"}', '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(32, 12, 'Botble\\Ecommerce\\Models\\Product', 11, 'Clutch handmade', NULL, 'products/2.jpg', 2, 401.00, 802.00, 0.00, 0.00, 802.00, '{\"sku\":\"HS-115-A0\",\"attributes\":\"(Size: S, Color: Red)\"}', '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(33, 12, 'Botble\\Ecommerce\\Models\\Product', 14, 'Snapshot Standard', NULL, 'products/4.jpg', 1, 411.00, 411.00, 0.00, 0.00, 411.00, '{\"sku\":\"HS-141-A0\",\"attributes\":\"(Size: M, Color: Brown)\"}', '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(34, 12, 'Botble\\Ecommerce\\Models\\Product', 17, 'Joan Mini Camera Bag', NULL, 'products/5.jpg', 1, 75.00, 75.00, 0.00, 0.00, 75.00, '{\"sku\":\"HS-172-A0\",\"attributes\":\"(Color: Blue, Size: XL)\"}', '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(35, 12, 'Botble\\Ecommerce\\Models\\Product', 22, 'Cyan Boheme', NULL, 'products/6-1.jpg', 3, 48.00, 144.00, 0.00, 0.00, 144.00, '{\"sku\":\"HS-108-A0-A1\",\"attributes\":\"(Color: Blue, Size: L)\"}', '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(36, 13, 'Botble\\Ecommerce\\Models\\Product', 20, 'Joan Mini Camera Bag', NULL, 'products/5.jpg', 2, 75.00, 150.00, 0.00, 0.00, 150.00, '{\"sku\":\"HS-172-A0-A3\",\"attributes\":\"(Color: Green, Size: S)\"}', '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(37, 13, 'Botble\\Ecommerce\\Models\\Product', 21, 'Cyan Boheme', NULL, 'products/6.jpg', 3, 48.00, 144.00, 0.00, 0.00, 144.00, '{\"sku\":\"HS-108-A0\",\"attributes\":\"(Color: Green, Size: M)\"}', '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(38, 13, 'Botble\\Ecommerce\\Models\\Product', 22, 'Cyan Boheme', NULL, 'products/6-1.jpg', 3, 48.00, 144.00, 0.00, 0.00, 144.00, '{\"sku\":\"HS-108-A0-A1\",\"attributes\":\"(Color: Blue, Size: L)\"}', '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(39, 13, 'Botble\\Ecommerce\\Models\\Product', 25, 'The Marc Jacobs', NULL, 'products/7-1.jpg', 2, 50.00, 100.00, 0.00, 0.00, 100.00, '{\"sku\":\"HS-163-A0-A1\",\"attributes\":\"(Color: Red, Size: XL)\"}', '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(40, 14, 'Botble\\Ecommerce\\Models\\Product', 11, 'Clutch handmade', NULL, 'products/2.jpg', 3, 401.00, 1203.00, 0.00, 0.00, 1203.00, '{\"sku\":\"HS-115-A0\",\"attributes\":\"(Size: S, Color: Red)\"}', '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(41, 14, 'Botble\\Ecommerce\\Models\\Product', 16, 'Snapshot Standard', NULL, 'products/4-2.jpg', 1, 411.00, 411.00, 0.00, 0.00, 411.00, '{\"sku\":\"HS-141-A0-A2\",\"attributes\":\"(Size: S, Color: Brown)\"}', '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(42, 14, 'Botble\\Ecommerce\\Models\\Product', 18, 'Joan Mini Camera Bag', NULL, 'products/5-1.jpg', 3, 75.00, 225.00, 0.00, 0.00, 225.00, '{\"sku\":\"HS-172-A0-A1\",\"attributes\":\"(Color: Black, Size: XL)\"}', '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(43, 15, 'Botble\\Ecommerce\\Models\\Product', 10, 'Wallet handmade', NULL, 'products/1-1.jpg', 1, 419.00, 419.00, 0.00, 0.00, 419.00, '{\"sku\":\"HS-168-A0-A1\",\"attributes\":\"(Size: L, Color: Brown)\"}', '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(44, 15, 'Botble\\Ecommerce\\Models\\Product', 12, 'Clutch handmade', NULL, 'products/2-1.jpg', 3, 401.00, 1203.00, 0.00, 0.00, 1203.00, '{\"sku\":\"HS-115-A0-A1\",\"attributes\":\"(Color: Green, Size: XXL)\"}', '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(45, 15, 'Botble\\Ecommerce\\Models\\Product', 17, 'Joan Mini Camera Bag', NULL, 'products/5.jpg', 3, 75.00, 225.00, 0.00, 0.00, 225.00, '{\"sku\":\"HS-172-A0\",\"attributes\":\"(Color: Blue, Size: XL)\"}', '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(46, 16, 'Botble\\Ecommerce\\Models\\Product', 11, 'Clutch handmade', NULL, 'products/2.jpg', 1, 401.00, 401.00, 0.00, 0.00, 401.00, '{\"sku\":\"HS-115-A0\",\"attributes\":\"(Size: S, Color: Red)\"}', '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(47, 16, 'Botble\\Ecommerce\\Models\\Product', 13, 'Gucci Zip Around Wallet', NULL, 'products/3.jpg', 1, 473.00, 473.00, 0.00, 0.00, 473.00, '{\"sku\":\"HS-159-A0\",\"attributes\":\"(Color: Blue, Size: M)\"}', '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(48, 16, 'Botble\\Ecommerce\\Models\\Product', 16, 'Snapshot Standard', NULL, 'products/4-2.jpg', 3, 411.00, 1233.00, 0.00, 0.00, 1233.00, '{\"sku\":\"HS-141-A0-A2\",\"attributes\":\"(Size: S, Color: Brown)\"}', '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(49, 16, 'Botble\\Ecommerce\\Models\\Product', 24, 'The Marc Jacobs', NULL, 'products/7.jpg', 1, 50.00, 50.00, 0.00, 0.00, 50.00, '{\"sku\":\"HS-163-A0\",\"attributes\":\"(Color: Red, Size: XXL)\"}', '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(50, 17, 'Botble\\Ecommerce\\Models\\Product', 11, 'Clutch handmade', NULL, 'products/2.jpg', 2, 401.00, 802.00, 0.00, 0.00, 802.00, '{\"sku\":\"HS-115-A0\",\"attributes\":\"(Size: S, Color: Red)\"}', '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(51, 17, 'Botble\\Ecommerce\\Models\\Product', 15, 'Snapshot Standard', NULL, 'products/4-1.jpg', 1, 411.00, 411.00, 0.00, 0.00, 411.00, '{\"sku\":\"HS-141-A0-A1\",\"attributes\":\"(Color: Blue, Size: M)\"}', '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(52, 17, 'Botble\\Ecommerce\\Models\\Product', 25, 'The Marc Jacobs', NULL, 'products/7-1.jpg', 2, 50.00, 100.00, 0.00, 0.00, 100.00, '{\"sku\":\"HS-163-A0-A1\",\"attributes\":\"(Color: Red, Size: XL)\"}', '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(53, 17, 'Botble\\Ecommerce\\Models\\Product', 26, 'Round Cross body Bag', NULL, 'products/8.jpg', 2, 116.00, 232.00, 0.00, 0.00, 232.00, '{\"sku\":\"HS-136-A0\",\"attributes\":\"(Color: Brown, Size: XXL)\"}', '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(54, 18, 'Botble\\Ecommerce\\Models\\Product', 9, 'Wallet handmade', NULL, 'products/1.jpg', 2, 419.00, 838.00, 0.00, 0.00, 838.00, '{\"sku\":\"HS-168-A0\",\"attributes\":\"(Color: Green, Size: XXL)\"}', '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(55, 18, 'Botble\\Ecommerce\\Models\\Product', 14, 'Snapshot Standard', NULL, 'products/4.jpg', 2, 411.00, 822.00, 0.00, 0.00, 822.00, '{\"sku\":\"HS-141-A0\",\"attributes\":\"(Size: M, Color: Brown)\"}', '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(56, 19, 'Botble\\Ecommerce\\Models\\Product', 14, 'Snapshot Standard', NULL, 'products/4.jpg', 3, 411.00, 1233.00, 0.00, 0.00, 1233.00, '{\"sku\":\"HS-141-A0\",\"attributes\":\"(Size: M, Color: Brown)\"}', '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(57, 19, 'Botble\\Ecommerce\\Models\\Product', 21, 'Cyan Boheme', NULL, 'products/6.jpg', 2, 48.00, 96.00, 0.00, 0.00, 96.00, '{\"sku\":\"HS-108-A0\",\"attributes\":\"(Color: Green, Size: M)\"}', '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(58, 19, 'Botble\\Ecommerce\\Models\\Product', 24, 'The Marc Jacobs', NULL, 'products/7.jpg', 3, 50.00, 150.00, 0.00, 0.00, 150.00, '{\"sku\":\"HS-163-A0\",\"attributes\":\"(Color: Red, Size: XXL)\"}', '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(59, 20, 'Botble\\Ecommerce\\Models\\Product', 9, 'Wallet handmade', NULL, 'products/1.jpg', 1, 419.00, 419.00, 0.00, 0.00, 419.00, '{\"sku\":\"HS-168-A0\",\"attributes\":\"(Color: Green, Size: XXL)\"}', '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(60, 20, 'Botble\\Ecommerce\\Models\\Product', 14, 'Snapshot Standard', NULL, 'products/4.jpg', 2, 411.00, 822.00, 0.00, 0.00, 822.00, '{\"sku\":\"HS-141-A0\",\"attributes\":\"(Size: M, Color: Brown)\"}', '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(61, 20, 'Botble\\Ecommerce\\Models\\Product', 18, 'Joan Mini Camera Bag', NULL, 'products/5-1.jpg', 3, 75.00, 225.00, 0.00, 0.00, 225.00, '{\"sku\":\"HS-172-A0-A1\",\"attributes\":\"(Color: Black, Size: XL)\"}', '2024-01-29 02:42:45', '2024-01-29 02:42:45');

-- --------------------------------------------------------

--
-- Table structure for table `ec_options`
--

CREATE TABLE `ec_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL COMMENT 'Name of options',
  `option_type` varchar(191) DEFAULT NULL COMMENT 'option type',
  `product_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 9999,
  `required` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Checked if this option is required',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_options_translations`
--

CREATE TABLE `ec_options_translations` (
  `lang_code` varchar(191) NOT NULL,
  `ec_options_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_option_value`
--

CREATE TABLE `ec_option_value` (
  `option_id` bigint(20) UNSIGNED NOT NULL COMMENT 'option id',
  `id` bigint(20) UNSIGNED NOT NULL,
  `option_value` tinytext DEFAULT NULL COMMENT 'option value',
  `affect_price` double DEFAULT NULL COMMENT 'value of price of this option affect',
  `order` int(11) NOT NULL DEFAULT 9999,
  `affect_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0. fixed 1. percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_option_value_translations`
--

CREATE TABLE `ec_option_value_translations` (
  `lang_code` varchar(191) NOT NULL,
  `ec_option_value_id` bigint(20) UNSIGNED NOT NULL,
  `option_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_orders`
--

CREATE TABLE `ec_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_option` varchar(60) DEFAULT NULL,
  `shipping_method` varchar(60) NOT NULL DEFAULT 'default',
  `status` varchar(120) NOT NULL DEFAULT 'pending',
  `amount` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `shipping_amount` decimal(15,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `coupon_code` varchar(120) DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `discount_description` varchar(255) DEFAULT NULL,
  `is_finished` tinyint(1) DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `token` varchar(120) DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `proof_file` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_orders`
--

INSERT INTO `ec_orders` (`id`, `code`, `user_id`, `shipping_option`, `shipping_method`, `status`, `amount`, `tax_amount`, `shipping_amount`, `description`, `coupon_code`, `discount_amount`, `sub_total`, `is_confirmed`, `discount_description`, `is_finished`, `completed_at`, `token`, `payment_id`, `created_at`, `updated_at`, `proof_file`) VALUES
(1, '#10000001', 1, '1', 'default', 'completed', 551.00, 0.00, 0.00, NULL, NULL, 0.00, 551.00, 1, NULL, 1, '2024-01-29 02:42:42', 'NZ8oh87ANcmrM6P5XRJKspvy1s4cM', 1, '2024-01-20 18:42:42', '2024-01-29 02:42:42', NULL),
(2, '#10000002', 6, '1', 'default', 'completed', 1571.00, 0.00, 0.00, NULL, NULL, 0.00, 1571.00, 1, NULL, 1, '2024-01-29 02:42:45', 'UxK3a7ZyyMn8vg2LaTYElcPMZJGSF', 2, '2024-01-18 00:42:42', '2024-01-29 02:42:45', NULL),
(3, '#10000003', 3, '1', 'default', 'completed', 1408.00, 0.00, 0.00, NULL, NULL, 0.00, 1408.00, 1, NULL, 1, '2024-01-29 02:42:42', 'lYkKo58NOtFL8qExReVbV6zl3Q5UB', 3, '2024-01-18 14:42:42', '2024-01-29 02:42:42', NULL),
(4, '#10000004', 1, '1', 'default', 'completed', 952.00, 0.00, 0.00, NULL, NULL, 0.00, 952.00, 1, NULL, 1, '2024-01-29 02:42:45', 'BXB2jtVBTOnKl02qfhj6Z44NdHzTR', 4, '2024-01-26 06:42:42', '2024-01-29 02:42:45', NULL),
(5, '#10000005', 7, '1', 'default', 'pending', 1445.00, 0.00, 0.00, NULL, NULL, 0.00, 1445.00, 1, NULL, 1, NULL, 'aU0B1lAYreffSjg3R4XWoW0JRJG3U', 5, '2024-01-19 18:42:43', '2024-01-29 02:42:43', NULL),
(6, '#10000006', 4, '1', 'default', 'pending', 1733.00, 0.00, 0.00, NULL, NULL, 0.00, 1733.00, 1, NULL, 1, NULL, 'RBkgCIIcb2zaFGEKQaCgRzx9kiXex', 6, '2024-01-26 14:42:43', '2024-01-29 02:42:43', NULL),
(7, '#10000007', 5, '1', 'default', 'pending', 2574.00, 0.00, 0.00, NULL, NULL, 0.00, 2574.00, 1, NULL, 1, NULL, '7rprhEBq8hbUEpzJN4kEBzFWh4bhB', 7, '2024-01-25 14:42:43', '2024-01-29 02:42:43', NULL),
(8, '#10000008', 3, '1', 'default', 'completed', 877.00, 0.00, 0.00, NULL, NULL, 0.00, 877.00, 1, NULL, 1, '2024-01-29 02:42:45', 'y3vKEwizacQsqTxnev9pwXSE3agex', 8, '2024-01-23 16:42:43', '2024-01-29 02:42:45', NULL),
(9, '#10000009', 5, '1', 'default', 'pending', 896.00, 0.00, 0.00, NULL, NULL, 0.00, 896.00, 1, NULL, 1, NULL, 'MYyUVO27jraCMCB4BGyW2HQsgjXu4', 9, '2024-01-20 02:42:43', '2024-01-29 02:42:43', NULL),
(10, '#10000010', 7, '1', 'default', 'completed', 1281.00, 0.00, 0.00, NULL, NULL, 0.00, 1281.00, 1, NULL, 1, '2024-01-29 02:42:45', 'e57Ed9HuYXB6wLgYLv4hRJZclZxig', 10, '2024-01-24 12:42:43', '2024-01-29 02:42:45', NULL),
(11, '#10000011', 2, '1', 'default', 'completed', 966.00, 0.00, 0.00, NULL, NULL, 0.00, 966.00, 1, NULL, 1, '2024-01-29 02:42:45', 'acLoyTeHPRmWM17kBOPEmXnM64dzJ', 11, '2024-01-28 06:42:44', '2024-01-29 02:42:45', NULL),
(12, '#10000012', 9, '1', 'default', 'pending', 1432.00, 0.00, 0.00, NULL, NULL, 0.00, 1432.00, 1, NULL, 1, NULL, 'cGFEVTzjF8wpMEgz8jzYImjaXgR4F', 12, '2024-01-22 08:42:44', '2024-01-29 02:42:44', NULL),
(13, '#10000013', 3, '1', 'default', 'pending', 538.00, 0.00, 0.00, NULL, NULL, 0.00, 538.00, 1, NULL, 1, NULL, 'ImSTumcnniSBOysSwnSAqSU1RY7uD', 13, '2024-01-22 10:42:44', '2024-01-29 02:42:44', NULL),
(14, '#10000014', 10, '1', 'default', 'pending', 1839.00, 0.00, 0.00, NULL, NULL, 0.00, 1839.00, 1, NULL, 1, NULL, '4xo8Je2qIRXaW5VfIqahP00NVjqta', 14, '2024-01-23 20:42:44', '2024-01-29 02:42:44', NULL),
(15, '#10000015', 7, '1', 'default', 'completed', 1847.00, 0.00, 0.00, NULL, NULL, 0.00, 1847.00, 1, NULL, 1, '2024-01-29 02:42:45', 'SicJdZq2HVJeiqbNa1eQrZOdAF0y4', 15, '2024-01-27 14:42:44', '2024-01-29 02:42:45', NULL),
(16, '#10000016', 7, '1', 'default', 'completed', 2157.00, 0.00, 0.00, NULL, NULL, 0.00, 2157.00, 1, NULL, 1, '2024-01-29 02:42:45', 'iSEXhkEprPqUkZDQK6uJN4qEJgonK', 16, '2024-01-28 06:42:45', '2024-01-29 02:42:45', NULL),
(17, '#10000017', 4, '1', 'default', 'completed', 1545.00, 0.00, 0.00, NULL, NULL, 0.00, 1545.00, 1, NULL, 1, '2024-01-29 02:42:45', 'DBAeIchOB3740hLFyWLZGfh0docNN', 17, '2024-01-28 02:42:45', '2024-01-29 02:42:45', NULL),
(18, '#10000018', 5, '1', 'default', 'completed', 1660.00, 0.00, 0.00, NULL, NULL, 0.00, 1660.00, 1, NULL, 1, '2024-01-29 02:42:45', 'Yntqj9a00JcLejxWPDSbaTmh4xG2D', 18, '2024-01-27 20:42:45', '2024-01-29 02:42:45', NULL),
(19, '#10000019', 3, '1', 'default', 'completed', 1479.00, 0.00, 0.00, NULL, NULL, 0.00, 1479.00, 1, NULL, 1, '2024-01-29 02:42:45', 'oaHJ6EdEaKPPAOrMaUBV1TZUFukh8', 19, '2024-01-27 22:42:45', '2024-01-29 02:42:45', NULL),
(20, '#10000020', 6, '1', 'default', 'completed', 1466.00, 0.00, 0.00, NULL, NULL, 0.00, 1466.00, 1, NULL, 1, '2024-01-29 02:42:45', 'aRVd2l0GDjWWgYKAOPRhWBjodY1Ja', 20, '2024-01-28 08:42:45', '2024-01-29 02:42:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ec_order_addresses`
--

CREATE TABLE `ec_order_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `country` varchar(120) DEFAULT NULL,
  `state` varchar(120) DEFAULT NULL,
  `city` varchar(120) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `type` varchar(60) NOT NULL DEFAULT 'shipping_address'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_order_addresses`
--

INSERT INTO `ec_order_addresses` (`id`, `name`, `phone`, `email`, `country`, `state`, `city`, `address`, `order_id`, `zip_code`, `type`) VALUES
(1, 'Richie Altenwerth', '+14785928898', 'customer@botble.com', 'PM', 'Alabama', 'South Natalie', '99357 Sigmund Passage Suite 713', 1, '67771', 'shipping_address'),
(2, 'Ms. Flavie Skiles', '+18147776582', 'dhammes@example.org', 'LY', 'Wyoming', 'Wilkinsonborough', '8459 Nestor Lake Suite 350', 2, '51316', 'shipping_address'),
(3, 'Cristal McLaughlin DDS', '+14433616167', 'tohara@example.net', 'CN', 'Maryland', 'New Oleburgh', '313 Hyatt Fork Apt. 888', 3, '24489', 'shipping_address'),
(4, 'Richie Altenwerth', '+14785928898', 'customer@botble.com', 'PM', 'Alabama', 'South Natalie', '99357 Sigmund Passage Suite 713', 4, '67771', 'shipping_address'),
(5, 'Maegan Gerhold', '+15204587947', 'wiza.cecil@example.net', 'LU', 'Georgia', 'Albertoside', '38103 Angelica Valley', 5, '61575', 'shipping_address'),
(6, 'Diana Friesen IV', '+17609934251', 'garrison13@example.net', 'MT', 'Louisiana', 'Fadelshire', '6909 Luettgen Vista Suite 269', 6, '00510', 'shipping_address'),
(7, 'Rory Abernathy', '+12132722415', 'raymundo.thiel@example.org', 'LK', 'Washington', 'Port Gaetano', '96340 Wilburn Inlet Apt. 092', 7, '08055-4218', 'shipping_address'),
(8, 'Cristal McLaughlin DDS', '+14433616167', 'tohara@example.net', 'CN', 'Maryland', 'New Oleburgh', '313 Hyatt Fork Apt. 888', 8, '24489', 'shipping_address'),
(9, 'Rory Abernathy', '+12132722415', 'raymundo.thiel@example.org', 'LK', 'Washington', 'Port Gaetano', '96340 Wilburn Inlet Apt. 092', 9, '08055-4218', 'shipping_address'),
(10, 'Maegan Gerhold', '+15204587947', 'wiza.cecil@example.net', 'LU', 'Georgia', 'Albertoside', '38103 Angelica Valley', 10, '61575', 'shipping_address'),
(11, 'Mrs. Flavie Conroy', '+17733206409', 'john.smith@botble.com', 'SR', 'Kansas', 'East Vivien', '34687 Kris Knoll', 11, '15024-9967', 'shipping_address'),
(12, 'Miss Destini Glover Jr.', '+17573084684', 'cristobal74@example.com', 'GQ', 'New Mexico', 'Turcotteport', '30874 Runte Ville', 12, '72648', 'shipping_address'),
(13, 'Cristal McLaughlin DDS', '+14433616167', 'tohara@example.net', 'CN', 'Maryland', 'New Oleburgh', '313 Hyatt Fork Apt. 888', 13, '24489', 'shipping_address'),
(14, 'Abdul Roberts', '+19364780068', 'nweimann@example.net', 'NF', 'Georgia', 'Alannachester', '981 Marco Divide Suite 051', 14, '67154', 'shipping_address'),
(15, 'Maegan Gerhold', '+15204587947', 'wiza.cecil@example.net', 'LU', 'Georgia', 'Albertoside', '38103 Angelica Valley', 15, '61575', 'shipping_address'),
(16, 'Maegan Gerhold', '+15204587947', 'wiza.cecil@example.net', 'LU', 'Georgia', 'Albertoside', '38103 Angelica Valley', 16, '61575', 'shipping_address'),
(17, 'Diana Friesen IV', '+17609934251', 'garrison13@example.net', 'MT', 'Louisiana', 'Fadelshire', '6909 Luettgen Vista Suite 269', 17, '00510', 'shipping_address'),
(18, 'Rory Abernathy', '+12132722415', 'raymundo.thiel@example.org', 'LK', 'Washington', 'Port Gaetano', '96340 Wilburn Inlet Apt. 092', 18, '08055-4218', 'shipping_address'),
(19, 'Cristal McLaughlin DDS', '+14433616167', 'tohara@example.net', 'CN', 'Maryland', 'New Oleburgh', '313 Hyatt Fork Apt. 888', 19, '24489', 'shipping_address'),
(20, 'Ms. Flavie Skiles', '+18147776582', 'dhammes@example.org', 'LY', 'Wyoming', 'Wilkinsonborough', '8459 Nestor Lake Suite 350', 20, '51316', 'shipping_address');

-- --------------------------------------------------------

--
-- Table structure for table `ec_order_histories`
--

CREATE TABLE `ec_order_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(120) NOT NULL,
  `description` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `extras` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_order_histories`
--

INSERT INTO `ec_order_histories` (`id`, `action`, `description`, `user_id`, `order_id`, `extras`, `created_at`, `updated_at`) VALUES
(1, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 1, NULL, '2024-01-20 18:42:42', '2024-01-20 18:42:42'),
(2, 'confirm_order', 'Order was verified by %user_name%', 0, 1, NULL, '2024-01-20 18:42:42', '2024-01-20 18:42:42'),
(3, 'create_shipment', 'Created shipment for order', 0, 1, NULL, '2024-01-29 02:42:42', '2024-01-29 02:42:42'),
(4, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 1, NULL, '2024-01-29 02:42:42', '2024-01-29 02:42:42'),
(5, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 2, NULL, '2024-01-18 00:42:42', '2024-01-18 00:42:42'),
(6, 'confirm_order', 'Order was verified by %user_name%', 0, 2, NULL, '2024-01-18 00:42:42', '2024-01-18 00:42:42'),
(7, 'confirm_payment', 'Payment was confirmed (amount $1,571.00) by %user_name%', 0, 2, NULL, '2024-01-29 02:42:42', '2024-01-29 02:42:42'),
(8, 'create_shipment', 'Created shipment for order', 0, 2, NULL, '2024-01-29 02:42:42', '2024-01-29 02:42:42'),
(9, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 2, NULL, '2024-01-29 02:42:42', '2024-01-29 02:42:42'),
(10, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 3, NULL, '2024-01-18 14:42:42', '2024-01-18 14:42:42'),
(11, 'confirm_order', 'Order was verified by %user_name%', 0, 3, NULL, '2024-01-18 14:42:42', '2024-01-18 14:42:42'),
(12, 'create_shipment', 'Created shipment for order', 0, 3, NULL, '2024-01-29 02:42:42', '2024-01-29 02:42:42'),
(13, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 3, NULL, '2024-01-29 02:42:42', '2024-01-29 02:42:42'),
(14, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 4, NULL, '2024-01-26 06:42:42', '2024-01-26 06:42:42'),
(15, 'confirm_order', 'Order was verified by %user_name%', 0, 4, NULL, '2024-01-26 06:42:42', '2024-01-26 06:42:42'),
(16, 'confirm_payment', 'Payment was confirmed (amount $952.00) by %user_name%', 0, 4, NULL, '2024-01-29 02:42:42', '2024-01-29 02:42:42'),
(17, 'create_shipment', 'Created shipment for order', 0, 4, NULL, '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(18, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 4, NULL, '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(19, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 5, NULL, '2024-01-19 18:42:43', '2024-01-19 18:42:43'),
(20, 'confirm_order', 'Order was verified by %user_name%', 0, 5, NULL, '2024-01-19 18:42:43', '2024-01-19 18:42:43'),
(21, 'confirm_payment', 'Payment was confirmed (amount $1,445.00) by %user_name%', 0, 5, NULL, '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(22, 'create_shipment', 'Created shipment for order', 0, 5, NULL, '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(23, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 6, NULL, '2024-01-26 14:42:43', '2024-01-26 14:42:43'),
(24, 'confirm_order', 'Order was verified by %user_name%', 0, 6, NULL, '2024-01-26 14:42:43', '2024-01-26 14:42:43'),
(25, 'create_shipment', 'Created shipment for order', 0, 6, NULL, '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(26, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 7, NULL, '2024-01-25 14:42:43', '2024-01-25 14:42:43'),
(27, 'confirm_order', 'Order was verified by %user_name%', 0, 7, NULL, '2024-01-25 14:42:43', '2024-01-25 14:42:43'),
(28, 'confirm_payment', 'Payment was confirmed (amount $2,574.00) by %user_name%', 0, 7, NULL, '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(29, 'create_shipment', 'Created shipment for order', 0, 7, NULL, '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(30, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 8, NULL, '2024-01-23 16:42:43', '2024-01-23 16:42:43'),
(31, 'confirm_order', 'Order was verified by %user_name%', 0, 8, NULL, '2024-01-23 16:42:43', '2024-01-23 16:42:43'),
(32, 'confirm_payment', 'Payment was confirmed (amount $877.00) by %user_name%', 0, 8, NULL, '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(33, 'create_shipment', 'Created shipment for order', 0, 8, NULL, '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(34, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 8, NULL, '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(35, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 9, NULL, '2024-01-20 02:42:43', '2024-01-20 02:42:43'),
(36, 'confirm_order', 'Order was verified by %user_name%', 0, 9, NULL, '2024-01-20 02:42:43', '2024-01-20 02:42:43'),
(37, 'confirm_payment', 'Payment was confirmed (amount $896.00) by %user_name%', 0, 9, NULL, '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(38, 'create_shipment', 'Created shipment for order', 0, 9, NULL, '2024-01-29 02:42:43', '2024-01-29 02:42:43'),
(39, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 10, NULL, '2024-01-24 12:42:43', '2024-01-24 12:42:43'),
(40, 'confirm_order', 'Order was verified by %user_name%', 0, 10, NULL, '2024-01-24 12:42:43', '2024-01-24 12:42:43'),
(41, 'confirm_payment', 'Payment was confirmed (amount $1,281.00) by %user_name%', 0, 10, NULL, '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(42, 'create_shipment', 'Created shipment for order', 0, 10, NULL, '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(43, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 10, NULL, '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(44, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 11, NULL, '2024-01-28 06:42:44', '2024-01-28 06:42:44'),
(45, 'confirm_order', 'Order was verified by %user_name%', 0, 11, NULL, '2024-01-28 06:42:44', '2024-01-28 06:42:44'),
(46, 'confirm_payment', 'Payment was confirmed (amount $966.00) by %user_name%', 0, 11, NULL, '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(47, 'create_shipment', 'Created shipment for order', 0, 11, NULL, '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(48, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 11, NULL, '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(49, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 12, NULL, '2024-01-22 08:42:44', '2024-01-22 08:42:44'),
(50, 'confirm_order', 'Order was verified by %user_name%', 0, 12, NULL, '2024-01-22 08:42:44', '2024-01-22 08:42:44'),
(51, 'confirm_payment', 'Payment was confirmed (amount $1,432.00) by %user_name%', 0, 12, NULL, '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(52, 'create_shipment', 'Created shipment for order', 0, 12, NULL, '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(53, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 13, NULL, '2024-01-22 10:42:44', '2024-01-22 10:42:44'),
(54, 'confirm_order', 'Order was verified by %user_name%', 0, 13, NULL, '2024-01-22 10:42:44', '2024-01-22 10:42:44'),
(55, 'confirm_payment', 'Payment was confirmed (amount $538.00) by %user_name%', 0, 13, NULL, '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(56, 'create_shipment', 'Created shipment for order', 0, 13, NULL, '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(57, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 14, NULL, '2024-01-23 20:42:44', '2024-01-23 20:42:44'),
(58, 'confirm_order', 'Order was verified by %user_name%', 0, 14, NULL, '2024-01-23 20:42:44', '2024-01-23 20:42:44'),
(59, 'confirm_payment', 'Payment was confirmed (amount $1,839.00) by %user_name%', 0, 14, NULL, '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(60, 'create_shipment', 'Created shipment for order', 0, 14, NULL, '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(61, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 15, NULL, '2024-01-27 14:42:44', '2024-01-27 14:42:44'),
(62, 'confirm_order', 'Order was verified by %user_name%', 0, 15, NULL, '2024-01-27 14:42:44', '2024-01-27 14:42:44'),
(63, 'confirm_payment', 'Payment was confirmed (amount $1,847.00) by %user_name%', 0, 15, NULL, '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(64, 'create_shipment', 'Created shipment for order', 0, 15, NULL, '2024-01-29 02:42:44', '2024-01-29 02:42:44'),
(65, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 15, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(66, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 16, NULL, '2024-01-28 06:42:45', '2024-01-28 06:42:45'),
(67, 'confirm_order', 'Order was verified by %user_name%', 0, 16, NULL, '2024-01-28 06:42:45', '2024-01-28 06:42:45'),
(68, 'confirm_payment', 'Payment was confirmed (amount $2,157.00) by %user_name%', 0, 16, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(69, 'create_shipment', 'Created shipment for order', 0, 16, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(70, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 16, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(71, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 17, NULL, '2024-01-28 02:42:45', '2024-01-28 02:42:45'),
(72, 'confirm_order', 'Order was verified by %user_name%', 0, 17, NULL, '2024-01-28 02:42:45', '2024-01-28 02:42:45'),
(73, 'create_shipment', 'Created shipment for order', 0, 17, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(74, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 17, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(75, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 18, NULL, '2024-01-27 20:42:45', '2024-01-27 20:42:45'),
(76, 'confirm_order', 'Order was verified by %user_name%', 0, 18, NULL, '2024-01-27 20:42:45', '2024-01-27 20:42:45'),
(77, 'confirm_payment', 'Payment was confirmed (amount $1,660.00) by %user_name%', 0, 18, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(78, 'create_shipment', 'Created shipment for order', 0, 18, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(79, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 18, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(80, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 19, NULL, '2024-01-27 22:42:45', '2024-01-27 22:42:45'),
(81, 'confirm_order', 'Order was verified by %user_name%', 0, 19, NULL, '2024-01-27 22:42:45', '2024-01-27 22:42:45'),
(82, 'confirm_payment', 'Payment was confirmed (amount $1,479.00) by %user_name%', 0, 19, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(83, 'create_shipment', 'Created shipment for order', 0, 19, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(84, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 19, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(85, 'create_order_from_seeder', 'Order is created from the checkout page', NULL, 20, NULL, '2024-01-28 08:42:45', '2024-01-28 08:42:45'),
(86, 'confirm_order', 'Order was verified by %user_name%', 0, 20, NULL, '2024-01-28 08:42:45', '2024-01-28 08:42:45'),
(87, 'confirm_payment', 'Payment was confirmed (amount $1,466.00) by %user_name%', 0, 20, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(88, 'create_shipment', 'Created shipment for order', 0, 20, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(89, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 20, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(90, 'update_status', 'Order confirmed by %user_name%', 0, 2, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(91, 'update_status', 'Order confirmed by %user_name%', 0, 4, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(92, 'update_status', 'Order confirmed by %user_name%', 0, 8, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(93, 'update_status', 'Order confirmed by %user_name%', 0, 10, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(94, 'update_status', 'Order confirmed by %user_name%', 0, 11, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(95, 'update_status', 'Order confirmed by %user_name%', 0, 15, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(96, 'update_status', 'Order confirmed by %user_name%', 0, 16, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(97, 'update_status', 'Order confirmed by %user_name%', 0, 18, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(98, 'update_status', 'Order confirmed by %user_name%', 0, 19, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(99, 'update_status', 'Order confirmed by %user_name%', 0, 20, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45');

-- --------------------------------------------------------

--
-- Table structure for table `ec_order_product`
--

CREATE TABLE `ec_order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `options` text DEFAULT NULL,
  `product_options` text DEFAULT NULL COMMENT 'product option data',
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(191) NOT NULL,
  `product_image` varchar(191) DEFAULT NULL,
  `weight` double(8,2) DEFAULT 0.00,
  `restock_quantity` int(10) UNSIGNED DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_type` varchar(60) NOT NULL DEFAULT 'physical',
  `times_downloaded` int(11) NOT NULL DEFAULT 0,
  `license_code` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_order_product`
--

INSERT INTO `ec_order_product` (`id`, `order_id`, `qty`, `price`, `tax_amount`, `options`, `product_options`, `product_id`, `product_name`, `product_image`, `weight`, `restock_quantity`, `created_at`, `updated_at`, `product_type`, `times_downloaded`, `license_code`) VALUES
(1, 1, 1, 401.00, 0.00, '{\"sku\":\"HS-115-A0\",\"attributes\":\"(Size: S, Color: Red)\"}', NULL, 11, 'Clutch handmade', 'products/2.jpg', 876.00, 0, '2024-01-29 02:42:42', '2024-01-29 02:42:42', 'physical', 0, NULL),
(2, 1, 2, 50.00, 0.00, '{\"sku\":\"HS-163-A0\",\"attributes\":\"(Color: Red, Size: XXL)\"}', NULL, 24, 'The Marc Jacobs', 'products/7.jpg', 1476.00, 0, '2024-01-29 02:42:42', '2024-01-29 02:42:42', 'physical', 0, NULL),
(3, 1, 1, 50.00, 0.00, '{\"sku\":\"HS-163-A0-A1\",\"attributes\":\"(Color: Red, Size: XL)\"}', NULL, 25, 'The Marc Jacobs', 'products/7-1.jpg', 738.00, 0, '2024-01-29 02:42:42', '2024-01-29 02:42:42', 'physical', 0, NULL),
(4, 2, 1, 401.00, 0.00, '{\"sku\":\"HS-115-A0-A1\",\"attributes\":\"(Color: Green, Size: XXL)\"}', NULL, 12, 'Clutch handmade', 'products/2-1.jpg', 876.00, 0, '2024-01-29 02:42:42', '2024-01-29 02:42:42', 'physical', 0, NULL),
(5, 2, 2, 411.00, 0.00, '{\"sku\":\"HS-141-A0-A2\",\"attributes\":\"(Size: S, Color: Brown)\"}', NULL, 16, 'Snapshot Standard', 'products/4-2.jpg', 1536.00, 0, '2024-01-29 02:42:42', '2024-01-29 02:42:42', 'physical', 0, NULL),
(6, 2, 3, 116.00, 0.00, '{\"sku\":\"HS-136-A0\",\"attributes\":\"(Color: Brown, Size: XXL)\"}', NULL, 26, 'Round Cross body Bag', 'products/8.jpg', 1671.00, 0, '2024-01-29 02:42:42', '2024-01-29 02:42:42', 'physical', 0, NULL),
(7, 3, 3, 411.00, 0.00, '{\"sku\":\"HS-141-A0\",\"attributes\":\"(Size: M, Color: Brown)\"}', NULL, 14, 'Snapshot Standard', 'products/4.jpg', 2304.00, 0, '2024-01-29 02:42:42', '2024-01-29 02:42:42', 'physical', 0, NULL),
(8, 3, 1, 75.00, 0.00, '{\"sku\":\"HS-172-A0-A2\",\"attributes\":\"(Color: Red, Size: XL)\"}', NULL, 19, 'Joan Mini Camera Bag', 'products/5-2.jpg', 710.00, 0, '2024-01-29 02:42:42', '2024-01-29 02:42:42', 'digital', 3, NULL),
(9, 3, 2, 50.00, 0.00, '{\"sku\":\"HS-163-A0\",\"attributes\":\"(Color: Red, Size: XXL)\"}', NULL, 24, 'The Marc Jacobs', 'products/7.jpg', 1476.00, 0, '2024-01-29 02:42:42', '2024-01-29 02:42:42', 'physical', 0, NULL),
(10, 4, 2, 401.00, 0.00, '{\"sku\":\"HS-115-A0-A1\",\"attributes\":\"(Color: Green, Size: XXL)\"}', NULL, 12, 'Clutch handmade', 'products/2-1.jpg', 1752.00, 0, '2024-01-29 02:42:42', '2024-01-29 02:42:42', 'physical', 0, NULL),
(11, 4, 3, 50.00, 0.00, '{\"sku\":\"HS-163-A0\",\"attributes\":\"(Color: Red, Size: XXL)\"}', NULL, 24, 'The Marc Jacobs', 'products/7.jpg', 2214.00, 0, '2024-01-29 02:42:42', '2024-01-29 02:42:42', 'physical', 0, NULL),
(12, 5, 2, 401.00, 0.00, '{\"sku\":\"HS-115-A0-A1\",\"attributes\":\"(Color: Green, Size: XXL)\"}', NULL, 12, 'Clutch handmade', 'products/2-1.jpg', 1752.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'physical', 0, NULL),
(13, 5, 1, 411.00, 0.00, '{\"sku\":\"HS-141-A0-A2\",\"attributes\":\"(Size: S, Color: Brown)\"}', NULL, 16, 'Snapshot Standard', 'products/4-2.jpg', 768.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'physical', 0, NULL),
(14, 5, 2, 116.00, 0.00, '{\"sku\":\"HS-136-A0\",\"attributes\":\"(Color: Brown, Size: XXL)\"}', NULL, 26, 'Round Cross body Bag', 'products/8.jpg', 1114.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'physical', 0, NULL),
(15, 6, 3, 419.00, 0.00, '{\"sku\":\"HS-168-A0-A1\",\"attributes\":\"(Size: L, Color: Brown)\"}', NULL, 10, 'Wallet handmade', 'products/1-1.jpg', 2301.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'digital', 9, NULL),
(16, 6, 1, 401.00, 0.00, '{\"sku\":\"HS-115-A0\",\"attributes\":\"(Size: S, Color: Red)\"}', NULL, 11, 'Clutch handmade', 'products/2.jpg', 876.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'physical', 0, NULL),
(17, 6, 1, 75.00, 0.00, '{\"sku\":\"HS-172-A0-A1\",\"attributes\":\"(Color: Black, Size: XL)\"}', NULL, 18, 'Joan Mini Camera Bag', 'products/5-1.jpg', 710.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'digital', 8, NULL),
(18, 7, 1, 419.00, 0.00, '{\"sku\":\"HS-168-A0-A1\",\"attributes\":\"(Size: L, Color: Brown)\"}', NULL, 10, 'Wallet handmade', 'products/1-1.jpg', 767.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'digital', 2, NULL),
(19, 7, 3, 401.00, 0.00, '{\"sku\":\"HS-115-A0\",\"attributes\":\"(Size: S, Color: Red)\"}', NULL, 11, 'Clutch handmade', 'products/2.jpg', 2628.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'physical', 0, NULL),
(20, 7, 2, 401.00, 0.00, '{\"sku\":\"HS-115-A0-A1\",\"attributes\":\"(Color: Green, Size: XXL)\"}', NULL, 12, 'Clutch handmade', 'products/2-1.jpg', 1752.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'physical', 0, NULL),
(21, 7, 2, 75.00, 0.00, '{\"sku\":\"HS-172-A0-A3\",\"attributes\":\"(Color: Green, Size: S)\"}', NULL, 20, 'Joan Mini Camera Bag', 'products/5.jpg', 1420.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'digital', 1, NULL),
(22, 8, 2, 401.00, 0.00, '{\"sku\":\"HS-115-A0-A1\",\"attributes\":\"(Color: Green, Size: XXL)\"}', NULL, 12, 'Clutch handmade', 'products/2-1.jpg', 1752.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'physical', 0, NULL),
(23, 8, 1, 75.00, 0.00, '{\"sku\":\"HS-172-A0-A2\",\"attributes\":\"(Color: Red, Size: XL)\"}', NULL, 19, 'Joan Mini Camera Bag', 'products/5-2.jpg', 710.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'digital', 0, NULL),
(24, 9, 1, 473.00, 0.00, '{\"sku\":\"HS-159-A0\",\"attributes\":\"(Color: Blue, Size: M)\"}', NULL, 13, 'Gucci Zip Around Wallet', 'products/3.jpg', 721.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'physical', 0, NULL),
(25, 9, 3, 75.00, 0.00, '{\"sku\":\"HS-172-A0-A2\",\"attributes\":\"(Color: Red, Size: XL)\"}', NULL, 19, 'Joan Mini Camera Bag', 'products/5-2.jpg', 2130.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'digital', 3, NULL),
(26, 9, 2, 75.00, 0.00, '{\"sku\":\"HS-172-A0-A3\",\"attributes\":\"(Color: Green, Size: S)\"}', NULL, 20, 'Joan Mini Camera Bag', 'products/5.jpg', 1420.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'digital', 5, NULL),
(27, 9, 1, 48.00, 0.00, '{\"sku\":\"HS-108-A0-A1\",\"attributes\":\"(Color: Blue, Size: L)\"}', NULL, 22, 'Cyan Boheme', 'products/6-1.jpg', 689.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'physical', 0, NULL),
(28, 10, 3, 411.00, 0.00, '{\"sku\":\"HS-141-A0\",\"attributes\":\"(Size: M, Color: Brown)\"}', NULL, 14, 'Snapshot Standard', 'products/4.jpg', 2304.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'physical', 0, NULL),
(29, 10, 1, 48.00, 0.00, '{\"sku\":\"HS-108-A0-A2\",\"attributes\":\"(Color: Black, Size: XL)\"}', NULL, 23, 'Cyan Boheme', 'products/6.jpg', 689.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'physical', 0, NULL),
(30, 11, 2, 411.00, 0.00, '{\"sku\":\"HS-141-A0\",\"attributes\":\"(Size: M, Color: Brown)\"}', NULL, 14, 'Snapshot Standard', 'products/4.jpg', 1536.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'physical', 0, NULL),
(31, 11, 3, 48.00, 0.00, '{\"sku\":\"HS-108-A0-A2\",\"attributes\":\"(Color: Black, Size: XL)\"}', NULL, 23, 'Cyan Boheme', 'products/6.jpg', 2067.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'physical', 0, NULL),
(32, 12, 2, 401.00, 0.00, '{\"sku\":\"HS-115-A0\",\"attributes\":\"(Size: S, Color: Red)\"}', NULL, 11, 'Clutch handmade', 'products/2.jpg', 1752.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'physical', 0, NULL),
(33, 12, 1, 411.00, 0.00, '{\"sku\":\"HS-141-A0\",\"attributes\":\"(Size: M, Color: Brown)\"}', NULL, 14, 'Snapshot Standard', 'products/4.jpg', 768.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'physical', 0, NULL),
(34, 12, 1, 75.00, 0.00, '{\"sku\":\"HS-172-A0\",\"attributes\":\"(Color: Blue, Size: XL)\"}', NULL, 17, 'Joan Mini Camera Bag', 'products/5.jpg', 710.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'digital', 0, NULL),
(35, 12, 3, 48.00, 0.00, '{\"sku\":\"HS-108-A0-A1\",\"attributes\":\"(Color: Blue, Size: L)\"}', NULL, 22, 'Cyan Boheme', 'products/6-1.jpg', 2067.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'physical', 0, NULL),
(36, 13, 2, 75.00, 0.00, '{\"sku\":\"HS-172-A0-A3\",\"attributes\":\"(Color: Green, Size: S)\"}', NULL, 20, 'Joan Mini Camera Bag', 'products/5.jpg', 1420.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'digital', 6, NULL),
(37, 13, 3, 48.00, 0.00, '{\"sku\":\"HS-108-A0\",\"attributes\":\"(Color: Green, Size: M)\"}', NULL, 21, 'Cyan Boheme', 'products/6.jpg', 2067.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'physical', 0, NULL),
(38, 13, 3, 48.00, 0.00, '{\"sku\":\"HS-108-A0-A1\",\"attributes\":\"(Color: Blue, Size: L)\"}', NULL, 22, 'Cyan Boheme', 'products/6-1.jpg', 2067.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'physical', 0, NULL),
(39, 13, 2, 50.00, 0.00, '{\"sku\":\"HS-163-A0-A1\",\"attributes\":\"(Color: Red, Size: XL)\"}', NULL, 25, 'The Marc Jacobs', 'products/7-1.jpg', 1476.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'physical', 0, NULL),
(40, 14, 3, 401.00, 0.00, '{\"sku\":\"HS-115-A0\",\"attributes\":\"(Size: S, Color: Red)\"}', NULL, 11, 'Clutch handmade', 'products/2.jpg', 2628.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'physical', 0, NULL),
(41, 14, 1, 411.00, 0.00, '{\"sku\":\"HS-141-A0-A2\",\"attributes\":\"(Size: S, Color: Brown)\"}', NULL, 16, 'Snapshot Standard', 'products/4-2.jpg', 768.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'physical', 0, NULL),
(42, 14, 3, 75.00, 0.00, '{\"sku\":\"HS-172-A0-A1\",\"attributes\":\"(Color: Black, Size: XL)\"}', NULL, 18, 'Joan Mini Camera Bag', 'products/5-1.jpg', 2130.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'digital', 7, NULL),
(43, 15, 1, 419.00, 0.00, '{\"sku\":\"HS-168-A0-A1\",\"attributes\":\"(Size: L, Color: Brown)\"}', NULL, 10, 'Wallet handmade', 'products/1-1.jpg', 767.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'digital', 10, NULL),
(44, 15, 3, 401.00, 0.00, '{\"sku\":\"HS-115-A0-A1\",\"attributes\":\"(Color: Green, Size: XXL)\"}', NULL, 12, 'Clutch handmade', 'products/2-1.jpg', 2628.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'physical', 0, NULL),
(45, 15, 3, 75.00, 0.00, '{\"sku\":\"HS-172-A0\",\"attributes\":\"(Color: Blue, Size: XL)\"}', NULL, 17, 'Joan Mini Camera Bag', 'products/5.jpg', 2130.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'digital', 8, NULL),
(46, 16, 1, 401.00, 0.00, '{\"sku\":\"HS-115-A0\",\"attributes\":\"(Size: S, Color: Red)\"}', NULL, 11, 'Clutch handmade', 'products/2.jpg', 876.00, 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'physical', 0, NULL),
(47, 16, 1, 473.00, 0.00, '{\"sku\":\"HS-159-A0\",\"attributes\":\"(Color: Blue, Size: M)\"}', NULL, 13, 'Gucci Zip Around Wallet', 'products/3.jpg', 721.00, 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'physical', 0, NULL),
(48, 16, 3, 411.00, 0.00, '{\"sku\":\"HS-141-A0-A2\",\"attributes\":\"(Size: S, Color: Brown)\"}', NULL, 16, 'Snapshot Standard', 'products/4-2.jpg', 2304.00, 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'physical', 0, NULL),
(49, 16, 1, 50.00, 0.00, '{\"sku\":\"HS-163-A0\",\"attributes\":\"(Color: Red, Size: XXL)\"}', NULL, 24, 'The Marc Jacobs', 'products/7.jpg', 738.00, 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'physical', 0, NULL),
(50, 17, 2, 401.00, 0.00, '{\"sku\":\"HS-115-A0\",\"attributes\":\"(Size: S, Color: Red)\"}', NULL, 11, 'Clutch handmade', 'products/2.jpg', 1752.00, 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'physical', 0, NULL),
(51, 17, 1, 411.00, 0.00, '{\"sku\":\"HS-141-A0-A1\",\"attributes\":\"(Color: Blue, Size: M)\"}', NULL, 15, 'Snapshot Standard', 'products/4-1.jpg', 768.00, 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'physical', 0, NULL),
(52, 17, 2, 50.00, 0.00, '{\"sku\":\"HS-163-A0-A1\",\"attributes\":\"(Color: Red, Size: XL)\"}', NULL, 25, 'The Marc Jacobs', 'products/7-1.jpg', 1476.00, 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'physical', 0, NULL),
(53, 17, 2, 116.00, 0.00, '{\"sku\":\"HS-136-A0\",\"attributes\":\"(Color: Brown, Size: XXL)\"}', NULL, 26, 'Round Cross body Bag', 'products/8.jpg', 1114.00, 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'physical', 0, NULL),
(54, 18, 2, 419.00, 0.00, '{\"sku\":\"HS-168-A0\",\"attributes\":\"(Color: Green, Size: XXL)\"}', NULL, 9, 'Wallet handmade', 'products/1.jpg', 1534.00, 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'digital', 2, NULL),
(55, 18, 2, 411.00, 0.00, '{\"sku\":\"HS-141-A0\",\"attributes\":\"(Size: M, Color: Brown)\"}', NULL, 14, 'Snapshot Standard', 'products/4.jpg', 1536.00, 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'physical', 0, NULL),
(56, 19, 3, 411.00, 0.00, '{\"sku\":\"HS-141-A0\",\"attributes\":\"(Size: M, Color: Brown)\"}', NULL, 14, 'Snapshot Standard', 'products/4.jpg', 2304.00, 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'physical', 0, NULL),
(57, 19, 2, 48.00, 0.00, '{\"sku\":\"HS-108-A0\",\"attributes\":\"(Color: Green, Size: M)\"}', NULL, 21, 'Cyan Boheme', 'products/6.jpg', 1378.00, 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'physical', 0, NULL),
(58, 19, 3, 50.00, 0.00, '{\"sku\":\"HS-163-A0\",\"attributes\":\"(Color: Red, Size: XXL)\"}', NULL, 24, 'The Marc Jacobs', 'products/7.jpg', 2214.00, 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'physical', 0, NULL),
(59, 20, 1, 419.00, 0.00, '{\"sku\":\"HS-168-A0\",\"attributes\":\"(Color: Green, Size: XXL)\"}', NULL, 9, 'Wallet handmade', 'products/1.jpg', 767.00, 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'digital', 7, NULL),
(60, 20, 2, 411.00, 0.00, '{\"sku\":\"HS-141-A0\",\"attributes\":\"(Size: M, Color: Brown)\"}', NULL, 14, 'Snapshot Standard', 'products/4.jpg', 1536.00, 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'physical', 0, NULL),
(61, 20, 3, 75.00, 0.00, '{\"sku\":\"HS-172-A0-A1\",\"attributes\":\"(Color: Black, Size: XL)\"}', NULL, 18, 'Joan Mini Camera Bag', 'products/5-1.jpg', 2130.00, 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'digital', 8, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ec_order_referrals`
--

CREATE TABLE `ec_order_referrals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(39) DEFAULT NULL,
  `landing_domain` varchar(255) DEFAULT NULL,
  `landing_page` varchar(255) DEFAULT NULL,
  `landing_params` varchar(255) DEFAULT NULL,
  `referral` varchar(255) DEFAULT NULL,
  `gclid` varchar(255) DEFAULT NULL,
  `fclid` varchar(255) DEFAULT NULL,
  `utm_source` varchar(255) DEFAULT NULL,
  `utm_campaign` varchar(255) DEFAULT NULL,
  `utm_medium` varchar(255) DEFAULT NULL,
  `utm_term` varchar(255) DEFAULT NULL,
  `utm_content` varchar(255) DEFAULT NULL,
  `referrer_url` text DEFAULT NULL,
  `referrer_domain` varchar(255) DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_order_returns`
--

CREATE TABLE `ec_order_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Order ID',
  `store_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Customer ID',
  `reason` text DEFAULT NULL COMMENT 'Reason return order',
  `order_status` varchar(191) DEFAULT NULL COMMENT 'Order current status',
  `return_status` varchar(191) NOT NULL COMMENT 'Return status',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_order_return_items`
--

CREATE TABLE `ec_order_return_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_return_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Order return id',
  `order_product_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Order product id',
  `product_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Product id',
  `product_name` varchar(191) NOT NULL,
  `product_image` varchar(191) DEFAULT NULL,
  `qty` int(11) NOT NULL COMMENT 'Quantity return',
  `price` decimal(15,2) NOT NULL COMMENT 'Price Product',
  `reason` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_amount` decimal(12,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_order_tax_information`
--

CREATE TABLE `ec_order_tax_information` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(120) NOT NULL,
  `company_address` varchar(191) NOT NULL,
  `company_tax_code` varchar(20) NOT NULL,
  `company_email` varchar(60) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_products`
--

CREATE TABLE `ec_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `images` text DEFAULT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `allow_checkout_when_out_of_stock` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `with_storehouse_management` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_variation` tinyint(4) NOT NULL DEFAULT 0,
  `sale_type` tinyint(4) NOT NULL DEFAULT 0,
  `price` double UNSIGNED DEFAULT NULL,
  `sale_price` double UNSIGNED DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `length` double(8,2) DEFAULT NULL,
  `wide` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `weight` double(8,2) DEFAULT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `views` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stock_status` varchar(191) DEFAULT 'in_stock',
  `created_by_id` bigint(20) UNSIGNED DEFAULT 0,
  `created_by_type` varchar(255) NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `image` varchar(255) DEFAULT NULL,
  `product_type` varchar(60) DEFAULT 'physical',
  `barcode` varchar(50) DEFAULT NULL,
  `cost_per_item` double DEFAULT NULL,
  `generate_license_code` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_products`
--

INSERT INTO `ec_products` (`id`, `name`, `description`, `content`, `status`, `images`, `sku`, `order`, `quantity`, `allow_checkout_when_out_of_stock`, `with_storehouse_management`, `is_featured`, `brand_id`, `is_variation`, `sale_type`, `price`, `sale_price`, `start_date`, `end_date`, `length`, `wide`, `height`, `weight`, `tax_id`, `views`, `created_at`, `updated_at`, `stock_status`, `created_by_id`, `created_by_type`, `image`, `product_type`, `barcode`, `cost_per_item`, `generate_license_code`) VALUES
(1, 'Wallet handmade', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/1.jpg\",\"products\\/1-1.jpg\"]', 'HS-168-A0', 0, 20, 0, 1, 1, 5, 0, 0, 419, NULL, NULL, NULL, 10.00, 12.00, 14.00, 767.00, NULL, 141409, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'digital', NULL, NULL, 0),
(2, 'Clutch handmade', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/2.jpg\",\"products\\/2-1.jpg\",\"products\\/2-2.jpg\",\"products\\/2-3.jpg\"]', 'HS-115-A0', 0, 19, 0, 1, 1, 4, 0, 0, 401, NULL, NULL, NULL, 11.00, 16.00, 17.00, 876.00, NULL, 12867, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'physical', NULL, NULL, 0),
(3, 'Gucci Zip Around Wallet', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/3.jpg\",\"products\\/3-1.jpg\",\"products\\/3-2.jpg\",\"products\\/3-3.jpg\"]', 'HS-159-A0', 0, 11, 0, 1, 1, 2, 0, 0, 473, NULL, NULL, NULL, 10.00, 11.00, 14.00, 721.00, NULL, 52716, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'physical', NULL, NULL, 0),
(4, 'Snapshot Standard', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/4.jpg\",\"products\\/4-1.jpg\",\"products\\/4-2.jpg\"]', 'HS-141-A0', 0, 19, 0, 1, 1, 5, 0, 0, 411, 365.79, NULL, NULL, 12.00, 15.00, 17.00, 768.00, NULL, 37269, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'physical', NULL, NULL, 0),
(5, 'Joan Mini Camera Bag', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/5.jpg\",\"products\\/5-1.jpg\",\"products\\/5-2.jpg\"]', 'HS-172-A0', 0, 13, 0, 1, 1, 1, 0, 0, 75, NULL, NULL, NULL, 16.00, 12.00, 15.00, 710.00, NULL, 92468, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'digital', NULL, NULL, 0),
(6, 'Cyan Boheme', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/6.jpg\",\"products\\/6-1.jpg\"]', 'HS-108-A0', 0, 15, 0, 1, 1, 7, 0, 0, 48, NULL, NULL, NULL, 16.00, 15.00, 18.00, 689.00, NULL, 148019, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'physical', NULL, NULL, 0),
(7, 'The Marc Jacobs', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/7.jpg\",\"products\\/7-1.jpg\",\"products\\/7-2.jpg\"]', 'HS-163-A0', 0, 19, 0, 1, 1, 4, 0, 0, 50, NULL, NULL, NULL, 20.00, 14.00, 18.00, 738.00, NULL, 199469, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'physical', NULL, NULL, 0),
(8, 'Round Cross body Bag', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/8.jpg\"]', 'HS-136-A0', 0, 16, 0, 1, 1, 6, 0, 0, 116, 82.36, NULL, NULL, 13.00, 18.00, 16.00, 557.00, NULL, 27725, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'physical', NULL, NULL, 0),
(9, 'Wallet handmade', NULL, NULL, 'published', '[\"products\\/1.jpg\"]', 'HS-168-A0', 0, 20, 0, 1, 0, 5, 1, 0, 419, NULL, NULL, NULL, 10.00, 12.00, 14.00, 767.00, NULL, 0, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'digital', NULL, NULL, 0),
(10, 'Wallet handmade', NULL, NULL, 'published', '[\"products\\/1-1.jpg\"]', 'HS-168-A0-A1', 0, 20, 0, 1, 0, 5, 1, 0, 419, NULL, NULL, NULL, 10.00, 12.00, 14.00, 767.00, NULL, 0, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'digital', NULL, NULL, 0),
(11, 'Clutch handmade', NULL, NULL, 'published', '[\"products\\/2.jpg\"]', 'HS-115-A0', 0, 19, 0, 1, 0, 4, 1, 0, 401, NULL, NULL, NULL, 11.00, 16.00, 17.00, 876.00, NULL, 0, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'physical', NULL, NULL, 0),
(12, 'Clutch handmade', NULL, NULL, 'published', '[\"products\\/2-1.jpg\"]', 'HS-115-A0-A1', 0, 19, 0, 1, 0, 4, 1, 0, 401, NULL, NULL, NULL, 11.00, 16.00, 17.00, 876.00, NULL, 0, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'physical', NULL, NULL, 0),
(13, 'Gucci Zip Around Wallet', NULL, NULL, 'published', '[\"products\\/3.jpg\"]', 'HS-159-A0', 0, 11, 0, 1, 0, 2, 1, 0, 473, NULL, NULL, NULL, 10.00, 11.00, 14.00, 721.00, NULL, 0, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'physical', NULL, NULL, 0),
(14, 'Snapshot Standard', NULL, NULL, 'published', '[\"products\\/4.jpg\"]', 'HS-141-A0', 0, 19, 0, 1, 0, 5, 1, 0, 411, 365.79, NULL, NULL, 12.00, 15.00, 17.00, 768.00, NULL, 0, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'physical', NULL, NULL, 0),
(15, 'Snapshot Standard', NULL, NULL, 'published', '[\"products\\/4-1.jpg\"]', 'HS-141-A0-A1', 0, 19, 0, 1, 0, 5, 1, 0, 411, 287.7, NULL, NULL, 12.00, 15.00, 17.00, 768.00, NULL, 0, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'physical', NULL, NULL, 0),
(16, 'Snapshot Standard', NULL, NULL, 'published', '[\"products\\/4-2.jpg\"]', 'HS-141-A0-A2', 0, 19, 0, 1, 0, 5, 1, 0, 411, 328.8, NULL, NULL, 12.00, 15.00, 17.00, 768.00, NULL, 0, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'physical', NULL, NULL, 0),
(17, 'Joan Mini Camera Bag', NULL, NULL, 'published', '[\"products\\/5.jpg\"]', 'HS-172-A0', 0, 13, 0, 1, 0, 1, 1, 0, 75, NULL, NULL, NULL, 16.00, 12.00, 15.00, 710.00, NULL, 0, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'digital', NULL, NULL, 0),
(18, 'Joan Mini Camera Bag', NULL, NULL, 'published', '[\"products\\/5-1.jpg\"]', 'HS-172-A0-A1', 0, 13, 0, 1, 0, 1, 1, 0, 75, NULL, NULL, NULL, 16.00, 12.00, 15.00, 710.00, NULL, 0, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'digital', NULL, NULL, 0),
(19, 'Joan Mini Camera Bag', NULL, NULL, 'published', '[\"products\\/5-2.jpg\"]', 'HS-172-A0-A2', 0, 13, 0, 1, 0, 1, 1, 0, 75, NULL, NULL, NULL, 16.00, 12.00, 15.00, 710.00, NULL, 0, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'digital', NULL, NULL, 0),
(20, 'Joan Mini Camera Bag', NULL, NULL, 'published', '[\"products\\/5.jpg\"]', 'HS-172-A0-A3', 0, 13, 0, 1, 0, 1, 1, 0, 75, NULL, NULL, NULL, 16.00, 12.00, 15.00, 710.00, NULL, 0, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'digital', NULL, NULL, 0),
(21, 'Cyan Boheme', NULL, NULL, 'published', '[\"products\\/6.jpg\"]', 'HS-108-A0', 0, 15, 0, 1, 0, 7, 1, 0, 48, NULL, NULL, NULL, 16.00, 15.00, 18.00, 689.00, NULL, 0, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'physical', NULL, NULL, 0),
(22, 'Cyan Boheme', NULL, NULL, 'published', '[\"products\\/6-1.jpg\"]', 'HS-108-A0-A1', 0, 15, 0, 1, 0, 7, 1, 0, 48, NULL, NULL, NULL, 16.00, 15.00, 18.00, 689.00, NULL, 0, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'physical', NULL, NULL, 0),
(23, 'Cyan Boheme', NULL, NULL, 'published', '[\"products\\/6.jpg\"]', 'HS-108-A0-A2', 0, 15, 0, 1, 0, 7, 1, 0, 48, NULL, NULL, NULL, 16.00, 15.00, 18.00, 689.00, NULL, 0, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'physical', NULL, NULL, 0),
(24, 'The Marc Jacobs', NULL, NULL, 'published', '[\"products\\/7.jpg\"]', 'HS-163-A0', 0, 19, 0, 1, 0, 4, 1, 0, 50, NULL, NULL, NULL, 20.00, 14.00, 18.00, 738.00, NULL, 0, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'physical', NULL, NULL, 0),
(25, 'The Marc Jacobs', NULL, NULL, 'published', '[\"products\\/7-1.jpg\"]', 'HS-163-A0-A1', 0, 19, 0, 1, 0, 4, 1, 0, 50, NULL, NULL, NULL, 20.00, 14.00, 18.00, 738.00, NULL, 0, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'physical', NULL, NULL, 0),
(26, 'Round Cross body Bag', NULL, NULL, 'published', '[\"products\\/8.jpg\"]', 'HS-136-A0', 0, 16, 0, 1, 0, 6, 1, 0, 116, 82.36, NULL, NULL, 13.00, 18.00, 16.00, 557.00, NULL, 0, '2024-01-29 02:42:38', '2024-01-29 02:42:38', 'in_stock', 0, 'Botble\\ACL\\Models\\User', NULL, 'physical', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ec_products_translations`
--

CREATE TABLE `ec_products_translations` (
  `lang_code` varchar(191) NOT NULL,
  `ec_products_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_attributes`
--

CREATE TABLE `ec_product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_set_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(120) NOT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_attributes`
--

INSERT INTO `ec_product_attributes` (`id`, `attribute_set_id`, `title`, `slug`, `color`, `image`, `is_default`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, 'Green', 'green', '#5FB7D4', NULL, 1, 1, '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(2, 1, 'Blue', 'blue', '#333333', NULL, 0, 2, '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(3, 1, 'Red', 'red', '#DA323F', NULL, 0, 3, '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(4, 1, 'Black', 'black', '#2F366C', NULL, 0, 4, '2024-01-29 02:42:37', '2024-01-29 02:42:37'),
(5, 1, 'Brown', 'brown', '#87554B', NULL, 0, 5, '2024-01-29 02:42:37', '2024-01-29 02:42:37'),
(6, 2, 'S', 's', NULL, NULL, 1, 1, '2024-01-29 02:42:37', '2024-01-29 02:42:37'),
(7, 2, 'M', 'm', NULL, NULL, 0, 2, '2024-01-29 02:42:37', '2024-01-29 02:42:37'),
(8, 2, 'L', 'l', NULL, NULL, 0, 3, '2024-01-29 02:42:37', '2024-01-29 02:42:37'),
(9, 2, 'XL', 'xl', NULL, NULL, 0, 4, '2024-01-29 02:42:37', '2024-01-29 02:42:37'),
(10, 2, 'XXL', 'xxl', NULL, NULL, 0, 5, '2024-01-29 02:42:37', '2024-01-29 02:42:37');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_attributes_translations`
--

CREATE TABLE `ec_product_attributes_translations` (
  `lang_code` varchar(191) NOT NULL,
  `ec_product_attributes_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_attribute_sets`
--

CREATE TABLE `ec_product_attribute_sets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(120) NOT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `display_layout` varchar(191) NOT NULL DEFAULT 'swatch_dropdown',
  `is_searchable` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `is_comparable` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `is_use_in_product_listing` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `use_image_from_product_variation` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_attribute_sets`
--

INSERT INTO `ec_product_attribute_sets` (`id`, `title`, `slug`, `display_layout`, `is_searchable`, `is_comparable`, `is_use_in_product_listing`, `status`, `order`, `created_at`, `updated_at`, `use_image_from_product_variation`) VALUES
(1, 'Color', 'color', 'visual', 1, 1, 1, 'published', 0, '2024-01-29 02:42:36', '2024-01-29 02:42:36', 1),
(2, 'Size', 'size', 'text', 1, 1, 1, 'published', 1, '2024-01-29 02:42:36', '2024-01-29 02:42:36', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_attribute_sets_translations`
--

CREATE TABLE `ec_product_attribute_sets_translations` (
  `lang_code` varchar(191) NOT NULL,
  `ec_product_attribute_sets_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_categories`
--

CREATE TABLE `ec_product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `description` mediumtext DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `icon_image` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_categories`
--

INSERT INTO `ec_product_categories` (`id`, `name`, `parent_id`, `description`, `status`, `order`, `image`, `is_featured`, `created_at`, `updated_at`, `icon`, `icon_image`) VALUES
(1, 'Office bags', 0, NULL, 'published', 1, 'product-categories/1.png', 1, '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL, NULL),
(2, 'Hand bag', 0, NULL, 'published', 2, 'product-categories/2.png', 1, '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL, NULL),
(3, 'Woman', 0, NULL, 'published', 3, 'product-categories/3.png', 1, '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL, NULL),
(4, 'Woman wallet', 3, NULL, 'published', 1, NULL, 0, '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL, NULL),
(5, 'Denim', 3, NULL, 'published', 2, NULL, 0, '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL, NULL),
(6, 'Dress', 3, NULL, 'published', 3, NULL, 0, '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL, NULL),
(7, 'Backpack', 0, NULL, 'published', 4, 'product-categories/4.png', 1, '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL, NULL),
(8, 'Bags', 0, NULL, 'published', 5, 'product-categories/5.png', 1, '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL, NULL),
(9, 'Wallet', 0, NULL, 'published', 6, 'product-categories/6.png', 1, '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL, NULL),
(10, 'Men', 0, NULL, 'published', 7, 'product-categories/7.png', 1, '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL, NULL),
(11, 'Accessories', 10, NULL, 'published', 1, NULL, 0, '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL, NULL),
(12, 'Men wallet', 10, NULL, 'published', 2, NULL, 0, '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL, NULL),
(13, 'Shoes', 10, NULL, 'published', 3, NULL, 0, '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_categories_translations`
--

CREATE TABLE `ec_product_categories_translations` (
  `lang_code` varchar(191) NOT NULL,
  `ec_product_categories_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_categorizables`
--

CREATE TABLE `ec_product_categorizables` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_category_product`
--

CREATE TABLE `ec_product_category_product` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_category_product`
--

INSERT INTO `ec_product_category_product` (`category_id`, `product_id`) VALUES
(10, 1),
(1, 2),
(8, 3),
(4, 4),
(13, 5),
(4, 6),
(2, 7),
(7, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_collections`
--

CREATE TABLE `ec_product_collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_collections`
--

INSERT INTO `ec_product_collections` (`id`, `name`, `slug`, `description`, `image`, `status`, `created_at`, `updated_at`, `is_featured`) VALUES
(1, 'New Arrival', 'new-arrival', NULL, 'product-collections/1.jpg', 'published', '2024-01-29 02:42:36', '2024-01-29 02:42:36', 1),
(2, 'Best Sellers', 'best-sellers', NULL, 'product-collections/2.jpg', 'published', '2024-01-29 02:42:36', '2024-01-29 02:42:36', 1),
(3, 'Special Offer', 'special-offer', NULL, 'product-collections/3.jpg', 'published', '2024-01-29 02:42:36', '2024-01-29 02:42:36', 1),
(4, 'Trending Fashion', 'trending-fashion', NULL, 'product-collections/4.jpg', 'published', '2024-01-29 02:42:36', '2024-01-29 02:42:36', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_collections_translations`
--

CREATE TABLE `ec_product_collections_translations` (
  `lang_code` varchar(191) NOT NULL,
  `ec_product_collections_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_collection_products`
--

CREATE TABLE `ec_product_collection_products` (
  `product_collection_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_collection_products`
--

INSERT INTO `ec_product_collection_products` (`product_collection_id`, `product_id`) VALUES
(3, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(1, 6),
(3, 7),
(3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_cross_sale_relations`
--

CREATE TABLE `ec_product_cross_sale_relations` (
  `from_product_id` bigint(20) UNSIGNED NOT NULL,
  `to_product_id` bigint(20) UNSIGNED NOT NULL,
  `is_variant` tinyint(1) NOT NULL DEFAULT 0,
  `price` decimal(15,2) DEFAULT 0.00,
  `price_type` varchar(191) NOT NULL DEFAULT 'fixed',
  `apply_to_all_variations` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_cross_sale_relations`
--

INSERT INTO `ec_product_cross_sale_relations` (`from_product_id`, `to_product_id`, `is_variant`, `price`, `price_type`, `apply_to_all_variations`) VALUES
(1, 2, 0, 0.00, 'fixed', 1),
(1, 4, 0, 0.00, 'fixed', 1),
(1, 8, 0, 0.00, 'fixed', 1),
(2, 1, 0, 0.00, 'fixed', 1),
(2, 4, 0, 0.00, 'fixed', 1),
(3, 2, 0, 0.00, 'fixed', 1),
(3, 5, 0, 0.00, 'fixed', 1),
(3, 7, 0, 0.00, 'fixed', 1),
(4, 1, 0, 0.00, 'fixed', 1),
(4, 6, 0, 0.00, 'fixed', 1),
(4, 7, 0, 0.00, 'fixed', 1),
(5, 2, 0, 0.00, 'fixed', 1),
(5, 7, 0, 0.00, 'fixed', 1),
(6, 5, 0, 0.00, 'fixed', 1),
(6, 7, 0, 0.00, 'fixed', 1),
(6, 8, 0, 0.00, 'fixed', 1),
(7, 3, 0, 0.00, 'fixed', 1),
(7, 5, 0, 0.00, 'fixed', 1),
(7, 8, 0, 0.00, 'fixed', 1),
(8, 4, 0, 0.00, 'fixed', 1),
(8, 7, 0, 0.00, 'fixed', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_files`
--

CREATE TABLE `ec_product_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `url` varchar(400) DEFAULT NULL,
  `extras` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_files`
--

INSERT INTO `ec_product_files` (`id`, `product_id`, `url`, `extras`, `created_at`, `updated_at`) VALUES
(1, 9, 'product-files/1.jpg', '{\"filename\":\"1.jpg\",\"url\":\"product-files\\/1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-29 09:42:38\",\"name\":\"1\",\"extension\":\"jpg\"}', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(2, 9, 'product-files/1-1.jpg', '{\"filename\":\"1-1.jpg\",\"url\":\"product-files\\/1-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-29 09:42:38\",\"name\":\"1-1\",\"extension\":\"jpg\"}', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(3, 10, 'product-files/1.jpg', '{\"filename\":\"1.jpg\",\"url\":\"product-files\\/1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-29 09:42:38\",\"name\":\"1\",\"extension\":\"jpg\"}', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(4, 10, 'product-files/1-1.jpg', '{\"filename\":\"1-1.jpg\",\"url\":\"product-files\\/1-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-29 09:42:38\",\"name\":\"1-1\",\"extension\":\"jpg\"}', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(5, 17, 'product-files/5.jpg', '{\"filename\":\"5.jpg\",\"url\":\"product-files\\/5.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-29 09:42:38\",\"name\":\"5\",\"extension\":\"jpg\"}', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(6, 17, 'product-files/5-1.jpg', '{\"filename\":\"5-1.jpg\",\"url\":\"product-files\\/5-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-29 09:42:38\",\"name\":\"5-1\",\"extension\":\"jpg\"}', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(7, 17, 'product-files/5-2.jpg', '{\"filename\":\"5-2.jpg\",\"url\":\"product-files\\/5-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-29 09:42:38\",\"name\":\"5-2\",\"extension\":\"jpg\"}', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(8, 18, 'product-files/5.jpg', '{\"filename\":\"5.jpg\",\"url\":\"product-files\\/5.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-29 09:42:38\",\"name\":\"5\",\"extension\":\"jpg\"}', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(9, 18, 'product-files/5-1.jpg', '{\"filename\":\"5-1.jpg\",\"url\":\"product-files\\/5-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-29 09:42:38\",\"name\":\"5-1\",\"extension\":\"jpg\"}', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(10, 18, 'product-files/5-2.jpg', '{\"filename\":\"5-2.jpg\",\"url\":\"product-files\\/5-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-29 09:42:38\",\"name\":\"5-2\",\"extension\":\"jpg\"}', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(11, 19, 'product-files/5.jpg', '{\"filename\":\"5.jpg\",\"url\":\"product-files\\/5.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-29 09:42:38\",\"name\":\"5\",\"extension\":\"jpg\"}', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(12, 19, 'product-files/5-1.jpg', '{\"filename\":\"5-1.jpg\",\"url\":\"product-files\\/5-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-29 09:42:38\",\"name\":\"5-1\",\"extension\":\"jpg\"}', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(13, 19, 'product-files/5-2.jpg', '{\"filename\":\"5-2.jpg\",\"url\":\"product-files\\/5-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-29 09:42:38\",\"name\":\"5-2\",\"extension\":\"jpg\"}', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(14, 20, 'product-files/5.jpg', '{\"filename\":\"5.jpg\",\"url\":\"product-files\\/5.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-29 09:42:38\",\"name\":\"5\",\"extension\":\"jpg\"}', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(15, 20, 'product-files/5-1.jpg', '{\"filename\":\"5-1.jpg\",\"url\":\"product-files\\/5-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-29 09:42:38\",\"name\":\"5-1\",\"extension\":\"jpg\"}', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(16, 20, 'product-files/5-2.jpg', '{\"filename\":\"5-2.jpg\",\"url\":\"product-files\\/5-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-29 09:42:38\",\"name\":\"5-2\",\"extension\":\"jpg\"}', '2024-01-29 02:42:38', '2024-01-29 02:42:38');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_labels`
--

CREATE TABLE `ec_product_labels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(120) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_labels`
--

INSERT INTO `ec_product_labels` (`id`, `name`, `color`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Hot', '#ec2434', 'published', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(2, 'New', '#00c9a7', 'published', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(3, 'Sale', '#fe9931', 'published', '2024-01-29 02:42:36', '2024-01-29 02:42:36');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_labels_translations`
--

CREATE TABLE `ec_product_labels_translations` (
  `lang_code` varchar(191) NOT NULL,
  `ec_product_labels_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_label_products`
--

CREATE TABLE `ec_product_label_products` (
  `product_label_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_label_products`
--

INSERT INTO `ec_product_label_products` (`product_label_id`, `product_id`) VALUES
(2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_related_relations`
--

CREATE TABLE `ec_product_related_relations` (
  `from_product_id` bigint(20) UNSIGNED NOT NULL,
  `to_product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_tags`
--

CREATE TABLE `ec_product_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_tags`
--

INSERT INTO `ec_product_tags` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Wallet', NULL, 'published', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(2, 'Bags', NULL, 'published', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(3, 'Shoes', NULL, 'published', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(4, 'Clothes', NULL, 'published', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(5, 'Hand bag', NULL, 'published', '2024-01-29 02:42:36', '2024-01-29 02:42:36');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_tags_translations`
--

CREATE TABLE `ec_product_tags_translations` (
  `lang_code` varchar(191) NOT NULL,
  `ec_product_tags_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_tag_product`
--

CREATE TABLE `ec_product_tag_product` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_tag_product`
--

INSERT INTO `ec_product_tag_product` (`product_id`, `tag_id`) VALUES
(1, 3),
(1, 4),
(2, 1),
(2, 4),
(2, 6),
(3, 1),
(3, 4),
(3, 5),
(4, 3),
(4, 6),
(5, 2),
(5, 3),
(5, 4),
(6, 4),
(6, 5),
(7, 2),
(7, 6),
(8, 4),
(8, 6);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_up_sale_relations`
--

CREATE TABLE `ec_product_up_sale_relations` (
  `from_product_id` bigint(20) UNSIGNED NOT NULL,
  `to_product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_variations`
--

CREATE TABLE `ec_product_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `configurable_product_id` bigint(20) UNSIGNED NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_variations`
--

INSERT INTO `ec_product_variations` (`id`, `product_id`, `configurable_product_id`, `is_default`) VALUES
(1, 9, 1, 1),
(2, 10, 1, 0),
(3, 11, 2, 1),
(4, 12, 2, 0),
(5, 13, 3, 1),
(6, 14, 4, 1),
(7, 15, 4, 0),
(8, 16, 4, 0),
(9, 17, 5, 1),
(10, 18, 5, 0),
(11, 19, 5, 0),
(12, 20, 5, 0),
(13, 21, 6, 1),
(14, 22, 6, 0),
(15, 23, 6, 0),
(16, 24, 7, 1),
(17, 25, 7, 0),
(18, 26, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_variation_items`
--

CREATE TABLE `ec_product_variation_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_variation_items`
--

INSERT INTO `ec_product_variation_items` (`id`, `attribute_id`, `variation_id`) VALUES
(1, 1, 1),
(7, 1, 4),
(23, 1, 12),
(25, 1, 13),
(9, 2, 5),
(13, 2, 7),
(17, 2, 9),
(27, 2, 14),
(5, 3, 3),
(21, 3, 11),
(31, 3, 16),
(33, 3, 17),
(19, 4, 10),
(29, 4, 15),
(3, 5, 2),
(11, 5, 6),
(15, 5, 8),
(35, 5, 18),
(6, 6, 3),
(16, 6, 8),
(24, 6, 12),
(10, 7, 5),
(12, 7, 6),
(14, 7, 7),
(26, 7, 13),
(4, 8, 2),
(28, 8, 14),
(18, 9, 9),
(20, 9, 10),
(22, 9, 11),
(30, 9, 15),
(34, 9, 17),
(2, 10, 1),
(8, 10, 4),
(32, 10, 16),
(36, 10, 18);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_views`
--

CREATE TABLE `ec_product_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `views` int(11) NOT NULL DEFAULT 1,
  `date` date NOT NULL DEFAULT '2024-01-29'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_views`
--

INSERT INTO `ec_product_views` (`id`, `product_id`, `views`, `date`) VALUES
(1, 1, 1, '2024-02-10'),
(2, 2, 2, '2024-02-11'),
(3, 6, 2, '2024-02-11'),
(4, 3, 2, '2024-02-11'),
(5, 5, 2, '2024-02-11'),
(6, 8, 2, '2024-02-11'),
(7, 4, 2, '2024-02-11'),
(8, 7, 2, '2024-02-11'),
(9, 1, 2, '2024-02-11'),
(18, 2, 3, '2024-02-12'),
(19, 6, 3, '2024-02-12'),
(20, 3, 2, '2024-02-12'),
(21, 5, 3, '2024-02-12'),
(22, 8, 3, '2024-02-12'),
(23, 4, 3, '2024-02-12'),
(24, 7, 3, '2024-02-12'),
(25, 1, 3, '2024-02-12'),
(41, 2, 5, '2024-02-14'),
(42, 6, 5, '2024-02-14'),
(43, 3, 5, '2024-02-14'),
(44, 5, 5, '2024-02-14'),
(45, 8, 5, '2024-02-14'),
(46, 4, 7, '2024-02-14'),
(47, 7, 5, '2024-02-14'),
(48, 1, 4, '2024-02-14'),
(82, 7, 1, '2024-02-15');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_with_attribute_set`
--

CREATE TABLE `ec_product_with_attribute_set` (
  `attribute_set_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_with_attribute_set`
--

INSERT INTO `ec_product_with_attribute_set` (`attribute_set_id`, `product_id`, `order`) VALUES
(1, 1, 0),
(2, 1, 0),
(1, 2, 0),
(2, 2, 0),
(1, 3, 0),
(2, 3, 0),
(1, 4, 0),
(2, 4, 0),
(1, 5, 0),
(2, 5, 0),
(1, 6, 0),
(2, 6, 0),
(1, 7, 0),
(2, 7, 0),
(1, 8, 0),
(2, 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ec_reviews`
--

CREATE TABLE `ec_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `star` double(8,2) NOT NULL,
  `comment` text NOT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `images` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_reviews`
--

INSERT INTO `ec_reviews` (`id`, `customer_id`, `product_id`, `star`, `comment`, `status`, `created_at`, `updated_at`, `images`) VALUES
(1, 5, 3, 2.00, 'Best ecommerce CMS online store!', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2-1.jpg\",\"products\\/6-1.jpg\",\"products\\/9.jpg\",\"products\\/11.jpg\"]'),
(2, 9, 5, 3.00, 'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2-2.jpg\",\"products\\/2-3.jpg\",\"products\\/7.jpg\"]'),
(3, 2, 1, 1.00, 'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/7.jpg\"]'),
(4, 10, 3, 2.00, 'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2-2.jpg\",\"products\\/4-1.jpg\",\"products\\/10-2.jpg\"]'),
(5, 5, 7, 4.00, 'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/1-1.jpg\",\"products\\/2-3.jpg\",\"products\\/4-1.jpg\",\"products\\/10.jpg\"]'),
(6, 6, 8, 5.00, 'Great E-commerce system. And much more : Wonderful Customer Support.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/3.jpg\"]'),
(7, 9, 4, 4.00, 'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/6-1.jpg\",\"products\\/7-2.jpg\",\"products\\/8.jpg\",\"products\\/9.jpg\"]'),
(8, 1, 3, 4.00, 'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2.jpg\",\"products\\/5-1.jpg\",\"products\\/9.jpg\"]'),
(9, 1, 2, 5.00, 'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/1-1.jpg\",\"products\\/2-3.jpg\",\"products\\/6.jpg\",\"products\\/7.jpg\"]'),
(10, 4, 6, 1.00, 'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/5.jpg\"]'),
(11, 9, 3, 2.00, 'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2.jpg\",\"products\\/7-1.jpg\",\"products\\/7-2.jpg\",\"products\\/7.jpg\"]'),
(12, 1, 8, 1.00, 'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/5-2.jpg\",\"products\\/10.jpg\"]'),
(13, 1, 4, 3.00, 'Great E-commerce system. And much more : Wonderful Customer Support.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/3-1.jpg\",\"products\\/5.jpg\",\"products\\/11.jpg\"]'),
(14, 1, 7, 2.00, 'Great E-commerce system. And much more : Wonderful Customer Support.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/4-1.jpg\"]'),
(15, 2, 5, 3.00, 'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/6-1.jpg\",\"products\\/8.jpg\"]'),
(16, 2, 7, 3.00, 'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/3-3.jpg\"]'),
(17, 6, 4, 3.00, 'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/6-1.jpg\",\"products\\/10-1.jpg\"]'),
(18, 3, 4, 4.00, 'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/3-3.jpg\",\"products\\/6.jpg\",\"products\\/10-1.jpg\"]'),
(20, 6, 1, 3.00, 'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/3-2.jpg\",\"products\\/5-2.jpg\",\"products\\/7-1.jpg\"]'),
(22, 2, 2, 1.00, 'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2.jpg\",\"products\\/4-2.jpg\",\"products\\/11.jpg\"]'),
(23, 10, 8, 1.00, 'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/4.jpg\",\"products\\/7-1.jpg\"]'),
(24, 6, 7, 1.00, 'The code is good, in general, if you like it, can you give it 5 stars?', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/3-2.jpg\",\"products\\/3.jpg\",\"products\\/5.jpg\",\"products\\/10.jpg\"]'),
(25, 4, 3, 1.00, 'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/9.jpg\",\"products\\/10.jpg\"]'),
(26, 3, 8, 1.00, 'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2.jpg\",\"products\\/5.jpg\"]'),
(27, 5, 4, 2.00, 'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/7-1.jpg\",\"products\\/11.jpg\"]'),
(29, 1, 6, 3.00, 'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2.jpg\",\"products\\/3-2.jpg\",\"products\\/3-3.jpg\",\"products\\/4-1.jpg\"]'),
(31, 10, 2, 3.00, 'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/7-1.jpg\",\"products\\/7.jpg\"]'),
(32, 7, 1, 5.00, 'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/4.jpg\",\"products\\/6-1.jpg\",\"products\\/6.jpg\",\"products\\/10-1.jpg\"]'),
(33, 9, 7, 5.00, 'We have received brilliant service support and will be expanding the features with the developer. Nice product!', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2.jpg\"]'),
(34, 9, 6, 1.00, 'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/4-1.jpg\",\"products\\/6.jpg\",\"products\\/10-2.jpg\"]'),
(35, 3, 2, 3.00, 'Clean & perfect source code', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/6-1.jpg\",\"products\\/11.jpg\"]'),
(37, 5, 8, 1.00, 'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2-3.jpg\",\"products\\/8.jpg\",\"products\\/10-2.jpg\",\"products\\/11.jpg\"]'),
(40, 3, 7, 5.00, 'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/4.jpg\",\"products\\/10-2.jpg\",\"products\\/10.jpg\"]'),
(42, 5, 1, 1.00, 'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/3-1.jpg\",\"products\\/3-2.jpg\",\"products\\/7-2.jpg\",\"products\\/8.jpg\"]'),
(43, 8, 1, 5.00, 'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2-1.jpg\",\"products\\/2.jpg\"]'),
(44, 9, 8, 3.00, 'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2-1.jpg\",\"products\\/3-3.jpg\"]'),
(48, 6, 2, 4.00, 'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2-3.jpg\",\"products\\/2.jpg\",\"products\\/5-2.jpg\"]'),
(49, 3, 5, 1.00, 'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/3-2.jpg\",\"products\\/4-2.jpg\",\"products\\/6.jpg\",\"products\\/10-2.jpg\"]'),
(51, 3, 6, 2.00, 'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/4.jpg\",\"products\\/7-1.jpg\",\"products\\/7-2.jpg\"]'),
(52, 4, 4, 3.00, 'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/3-3.jpg\",\"products\\/3.jpg\",\"products\\/10.jpg\"]'),
(53, 6, 6, 3.00, 'Great E-commerce system. And much more : Wonderful Customer Support.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/3-2.jpg\",\"products\\/3.jpg\",\"products\\/7-1.jpg\",\"products\\/8.jpg\"]'),
(54, 7, 4, 2.00, 'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/4-1.jpg\",\"products\\/4-2.jpg\",\"products\\/5-1.jpg\",\"products\\/10-1.jpg\"]'),
(55, 1, 1, 2.00, 'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/3-1.jpg\"]'),
(58, 4, 7, 1.00, 'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/3-3.jpg\",\"products\\/3.jpg\"]'),
(59, 10, 4, 4.00, 'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/4-1.jpg\",\"products\\/4-2.jpg\",\"products\\/8.jpg\",\"products\\/11.jpg\"]'),
(60, 8, 6, 3.00, 'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2-1.jpg\",\"products\\/4-1.jpg\",\"products\\/6-1.jpg\",\"products\\/10-1.jpg\"]'),
(61, 6, 3, 2.00, 'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2-3.jpg\"]'),
(62, 7, 2, 1.00, 'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/1.jpg\",\"products\\/10-2.jpg\"]'),
(64, 4, 2, 2.00, 'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/1.jpg\",\"products\\/3-3.jpg\",\"products\\/4.jpg\"]'),
(66, 7, 5, 2.00, 'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/7-2.jpg\",\"products\\/10-1.jpg\"]'),
(67, 8, 2, 5.00, 'Good app, good backup service and support. Good documentation.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/3.jpg\",\"products\\/7-2.jpg\",\"products\\/10.jpg\"]'),
(68, 2, 4, 4.00, 'Good app, good backup service and support. Good documentation.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2-2.jpg\",\"products\\/4.jpg\",\"products\\/7.jpg\",\"products\\/10.jpg\"]'),
(69, 8, 4, 2.00, 'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/1.jpg\",\"products\\/2-1.jpg\",\"products\\/4-1.jpg\"]'),
(70, 8, 8, 5.00, 'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2-2.jpg\",\"products\\/4-2.jpg\",\"products\\/9.jpg\"]'),
(72, 9, 1, 3.00, 'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/3-2.jpg\",\"products\\/7.jpg\"]'),
(75, 4, 1, 1.00, 'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/3-2.jpg\",\"products\\/6-1.jpg\"]'),
(76, 2, 6, 2.00, 'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/1.jpg\",\"products\\/4.jpg\"]'),
(82, 2, 3, 2.00, 'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/6.jpg\",\"products\\/7-2.jpg\",\"products\\/7.jpg\"]'),
(92, 5, 5, 2.00, 'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/1-1.jpg\",\"products\\/4.jpg\"]'),
(95, 4, 8, 4.00, 'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/8.jpg\"]'),
(104, 3, 1, 2.00, 'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/4-1.jpg\",\"products\\/5.jpg\",\"products\\/7-2.jpg\",\"products\\/10-2.jpg\"]'),
(111, 5, 6, 1.00, 'Clean & perfect source code', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2-2.jpg\",\"products\\/5-1.jpg\"]'),
(112, 8, 7, 4.00, 'Best ecommerce CMS online store!', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/1.jpg\",\"products\\/2-1.jpg\",\"products\\/7.jpg\"]'),
(115, 7, 6, 2.00, 'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2-1.jpg\"]'),
(116, 2, 8, 1.00, 'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/3-1.jpg\",\"products\\/3-2.jpg\",\"products\\/4-2.jpg\"]'),
(120, 10, 6, 5.00, 'Good app, good backup service and support. Good documentation.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/3-1.jpg\",\"products\\/5.jpg\",\"products\\/7-2.jpg\"]'),
(125, 3, 3, 3.00, 'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/1.jpg\",\"products\\/11.jpg\"]'),
(130, 9, 2, 4.00, 'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2.jpg\",\"products\\/7.jpg\",\"products\\/8.jpg\",\"products\\/9.jpg\"]'),
(143, 8, 3, 5.00, 'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2-3.jpg\",\"products\\/2.jpg\",\"products\\/5.jpg\",\"products\\/11.jpg\"]'),
(151, 7, 3, 5.00, 'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/1-1.jpg\",\"products\\/4-2.jpg\",\"products\\/6.jpg\",\"products\\/7.jpg\"]'),
(156, 10, 1, 3.00, 'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2-3.jpg\"]'),
(170, 10, 5, 4.00, 'Good app, good backup service and support. Good documentation.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/5-2.jpg\",\"products\\/9.jpg\"]'),
(195, 8, 5, 5.00, 'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/7-2.jpg\"]'),
(203, 7, 7, 3.00, 'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/5-1.jpg\",\"products\\/10-1.jpg\"]'),
(226, 5, 2, 3.00, 'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2-3.jpg\",\"products\\/3-1.jpg\",\"products\\/3.jpg\",\"products\\/4.jpg\"]'),
(242, 7, 8, 1.00, 'We have received brilliant service support and will be expanding the features with the developer. Nice product!', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/4-1.jpg\",\"products\\/7-1.jpg\"]'),
(255, 10, 7, 3.00, 'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/1.jpg\",\"products\\/4-1.jpg\",\"products\\/7.jpg\"]'),
(330, 4, 5, 4.00, 'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/5.jpg\",\"products\\/10-2.jpg\"]'),
(358, 1, 5, 5.00, 'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/2-1.jpg\",\"products\\/4-2.jpg\",\"products\\/4.jpg\",\"products\\/6.jpg\"]'),
(393, 6, 5, 4.00, 'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.', 'published', '2024-01-29 02:42:42', '2024-01-29 02:42:42', '[\"products\\/7.jpg\"]');

-- --------------------------------------------------------

--
-- Table structure for table `ec_review_replies`
--

CREATE TABLE `ec_review_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `review_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipments`
--

CREATE TABLE `ec_shipments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `weight` double(8,2) DEFAULT 0.00,
  `shipment_id` varchar(120) DEFAULT NULL,
  `rate_id` varchar(120) DEFAULT NULL,
  `note` varchar(120) DEFAULT NULL,
  `status` varchar(120) NOT NULL DEFAULT 'pending',
  `cod_amount` decimal(15,2) DEFAULT 0.00,
  `cod_status` varchar(60) NOT NULL DEFAULT 'pending',
  `cross_checking_status` varchar(60) NOT NULL DEFAULT 'pending',
  `price` decimal(15,2) DEFAULT 0.00,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tracking_id` varchar(191) DEFAULT NULL,
  `shipping_company_name` varchar(191) DEFAULT NULL,
  `tracking_link` varchar(191) DEFAULT NULL,
  `estimate_date_shipped` datetime DEFAULT NULL,
  `date_shipped` datetime DEFAULT NULL,
  `label_url` text DEFAULT NULL,
  `metadata` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_shipments`
--

INSERT INTO `ec_shipments` (`id`, `order_id`, `user_id`, `weight`, `shipment_id`, `rate_id`, `note`, `status`, `cod_amount`, `cod_status`, `cross_checking_status`, `price`, `store_id`, `created_at`, `updated_at`, `tracking_id`, `shipping_company_name`, `tracking_link`, `estimate_date_shipped`, `date_shipped`, `label_url`, `metadata`) VALUES
(1, 1, NULL, 3090.00, NULL, NULL, '', 'delivered', 0.00, 'completed', 'pending', 0.00, 0, '2024-01-29 02:42:42', '2024-01-29 02:42:42', 'JJD0053565602', 'AliExpress', 'https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference', '2024-02-04 09:42:42', '2024-01-29 09:42:42', NULL, NULL),
(2, 2, NULL, 4083.00, NULL, NULL, '', 'delivered', 0.00, 'completed', 'pending', 0.00, 0, '2024-01-29 02:42:42', '2024-01-29 02:42:42', 'JJD0050049730', 'FastShipping', 'https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference', '2024-02-06 09:42:42', '2024-01-29 09:42:42', NULL, NULL),
(3, 3, NULL, 4490.00, NULL, NULL, '', 'delivered', 1408.00, 'completed', 'pending', 0.00, 0, '2024-01-29 02:42:42', '2024-01-29 02:42:42', 'JJD0026090365', 'DHL', 'https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference', '2024-02-03 09:42:42', '2024-01-29 09:42:42', NULL, NULL),
(4, 4, NULL, 3966.00, NULL, NULL, '', 'delivered', 0.00, 'completed', 'pending', 0.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'JJD0025751569', 'GHN', 'https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference', '2024-02-02 09:42:43', '2024-01-29 09:42:43', NULL, NULL),
(5, 5, NULL, 3634.00, NULL, NULL, '', 'approved', 0.00, 'completed', 'pending', 0.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'JJD0048485156', 'GHN', 'https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference', '2024-02-08 09:42:43', NULL, NULL, NULL),
(6, 6, NULL, 3887.00, NULL, NULL, '', 'approved', 0.00, 'completed', 'pending', 0.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'JJD0070235539', 'FastShipping', 'https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference', '2024-02-01 09:42:43', NULL, NULL, NULL),
(7, 7, NULL, 6567.00, NULL, NULL, '', 'approved', 0.00, 'completed', 'pending', 0.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'JJD008093508', 'FastShipping', 'https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference', '2024-02-01 09:42:43', NULL, NULL, NULL),
(8, 8, NULL, 2462.00, NULL, NULL, '', 'delivered', 0.00, 'completed', 'pending', 0.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'JJD0050282668', 'AliExpress', 'https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference', '2024-02-01 09:42:43', '2024-01-29 09:42:43', NULL, NULL),
(9, 9, NULL, 4960.00, NULL, NULL, '', 'approved', 0.00, 'completed', 'pending', 0.00, 0, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'JJD0074816667', 'DHL', 'https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference', '2024-02-08 09:42:43', NULL, NULL, NULL),
(10, 10, NULL, 2993.00, NULL, NULL, '', 'delivered', 0.00, 'completed', 'pending', 0.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'JJD0010936210', 'AliExpress', 'https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference', '2024-02-02 09:42:44', '2024-01-29 09:42:44', NULL, NULL),
(11, 11, NULL, 3603.00, NULL, NULL, '', 'delivered', 0.00, 'completed', 'pending', 0.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'JJD0032940608', 'DHL', 'https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference', '2024-02-08 09:42:44', '2024-01-29 09:42:44', NULL, NULL),
(12, 12, NULL, 5297.00, NULL, NULL, '', 'approved', 0.00, 'completed', 'pending', 0.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'JJD0059685384', 'FastShipping', 'https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference', '2024-01-30 09:42:44', NULL, NULL, NULL),
(13, 13, NULL, 7030.00, NULL, NULL, '', 'approved', 0.00, 'completed', 'pending', 0.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'JJD0054958627', 'GHN', 'https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference', '2024-02-06 09:42:44', NULL, NULL, NULL),
(14, 14, NULL, 5526.00, NULL, NULL, '', 'approved', 0.00, 'completed', 'pending', 0.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'JJD0039433960', 'GHN', 'https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference', '2024-01-31 09:42:44', NULL, NULL, NULL),
(15, 15, NULL, 5525.00, NULL, NULL, '', 'delivered', 0.00, 'completed', 'pending', 0.00, 0, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'JJD0085015862', 'FastShipping', 'https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference', '2024-02-07 09:42:44', '2024-01-29 09:42:44', NULL, NULL),
(16, 16, NULL, 4639.00, NULL, NULL, '', 'delivered', 0.00, 'completed', 'pending', 0.00, 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'JJD0050032203', 'AliExpress', 'https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference', '2024-02-06 09:42:45', '2024-01-29 09:42:45', NULL, NULL),
(17, 17, NULL, 5110.00, NULL, NULL, '', 'delivered', 0.00, 'completed', 'pending', 0.00, 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'JJD0039430029', 'DHL', 'https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference', '2024-02-01 09:42:45', '2024-01-29 09:42:45', NULL, NULL),
(18, 18, NULL, 3070.00, NULL, NULL, '', 'delivered', 0.00, 'completed', 'pending', 0.00, 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'JJD0043355774', 'GHN', 'https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference', '2024-02-01 09:42:45', '2024-01-29 09:42:45', NULL, NULL),
(19, 19, NULL, 5896.00, NULL, NULL, '', 'delivered', 0.00, 'completed', 'pending', 0.00, 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'JJD0087484492', 'AliExpress', 'https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference', '2024-01-30 09:42:45', '2024-01-29 09:42:45', NULL, NULL),
(20, 20, NULL, 4433.00, NULL, NULL, '', 'delivered', 0.00, 'completed', 'pending', 0.00, 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'JJD0090222377', 'GHN', 'https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference', '2024-02-01 09:42:45', '2024-01-29 09:42:45', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipment_histories`
--

CREATE TABLE `ec_shipment_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(120) NOT NULL,
  `description` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipment_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(255) NOT NULL DEFAULT 'Botble\\ACL\\Models\\User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_shipment_histories`
--

INSERT INTO `ec_shipment_histories` (`id`, `action`, `description`, `user_id`, `shipment_id`, `order_id`, `created_at`, `updated_at`, `user_type`) VALUES
(1, 'create_from_order', 'Shipping was created from order %order_id%', 0, 1, 1, '2024-01-20 18:42:42', '2024-01-20 18:42:42', 'Botble\\ACL\\Models\\User'),
(2, 'update_status', 'Changed status of shipping to: Approved. Updated by: %user_name%', 0, 1, 1, '2024-01-27 10:42:42', '2024-01-29 02:42:42', 'Botble\\ACL\\Models\\User'),
(3, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 1, 1, '2024-01-29 02:42:42', '2024-01-29 02:42:42', 'Botble\\ACL\\Models\\User'),
(4, 'create_from_order', 'Shipping was created from order %order_id%', 0, 2, 2, '2024-01-18 00:42:42', '2024-01-18 00:42:42', 'Botble\\ACL\\Models\\User'),
(5, 'update_status', 'Changed status of shipping to: Approved. Updated by: %user_name%', 0, 2, 2, '2024-01-27 12:42:42', '2024-01-29 02:42:42', 'Botble\\ACL\\Models\\User'),
(6, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 2, 2, '2024-01-29 02:42:42', '2024-01-29 02:42:42', 'Botble\\ACL\\Models\\User'),
(7, 'create_from_order', 'Shipping was created from order %order_id%', 0, 3, 3, '2024-01-18 14:42:42', '2024-01-18 14:42:42', 'Botble\\ACL\\Models\\User'),
(8, 'update_status', 'Changed status of shipping to: Approved. Updated by: %user_name%', 0, 3, 3, '2024-01-27 14:42:42', '2024-01-29 02:42:42', 'Botble\\ACL\\Models\\User'),
(9, 'update_cod_status', 'Updated COD status to Completed . Updated by: %user_name%', 0, 3, 3, '2024-01-29 02:42:42', '2024-01-29 02:42:42', 'Botble\\ACL\\Models\\User'),
(10, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 3, 3, '2024-01-29 02:42:42', '2024-01-29 02:42:42', 'Botble\\ACL\\Models\\User'),
(11, 'create_from_order', 'Shipping was created from order %order_id%', 0, 4, 4, '2024-01-26 06:42:42', '2024-01-26 06:42:42', 'Botble\\ACL\\Models\\User'),
(12, 'update_status', 'Changed status of shipping to: Approved. Updated by: %user_name%', 0, 4, 4, '2024-01-27 16:42:43', '2024-01-29 02:42:43', 'Botble\\ACL\\Models\\User'),
(13, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 4, 4, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'Botble\\ACL\\Models\\User'),
(14, 'create_from_order', 'Shipping was created from order %order_id%', 0, 5, 5, '2024-01-19 18:42:43', '2024-01-19 18:42:43', 'Botble\\ACL\\Models\\User'),
(15, 'update_status', 'Changed status of shipping to: Approved. Updated by: %user_name%', 0, 5, 5, '2024-01-27 18:42:43', '2024-01-29 02:42:43', 'Botble\\ACL\\Models\\User'),
(16, 'create_from_order', 'Shipping was created from order %order_id%', 0, 6, 6, '2024-01-26 14:42:43', '2024-01-26 14:42:43', 'Botble\\ACL\\Models\\User'),
(17, 'update_status', 'Changed status of shipping to: Approved. Updated by: %user_name%', 0, 6, 6, '2024-01-27 20:42:43', '2024-01-29 02:42:43', 'Botble\\ACL\\Models\\User'),
(18, 'create_from_order', 'Shipping was created from order %order_id%', 0, 7, 7, '2024-01-25 14:42:43', '2024-01-25 14:42:43', 'Botble\\ACL\\Models\\User'),
(19, 'update_status', 'Changed status of shipping to: Approved. Updated by: %user_name%', 0, 7, 7, '2024-01-27 22:42:43', '2024-01-29 02:42:43', 'Botble\\ACL\\Models\\User'),
(20, 'create_from_order', 'Shipping was created from order %order_id%', 0, 8, 8, '2024-01-23 16:42:43', '2024-01-23 16:42:43', 'Botble\\ACL\\Models\\User'),
(21, 'update_status', 'Changed status of shipping to: Approved. Updated by: %user_name%', 0, 8, 8, '2024-01-28 00:42:43', '2024-01-29 02:42:43', 'Botble\\ACL\\Models\\User'),
(22, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 8, 8, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'Botble\\ACL\\Models\\User'),
(23, 'create_from_order', 'Shipping was created from order %order_id%', 0, 9, 9, '2024-01-20 02:42:43', '2024-01-20 02:42:43', 'Botble\\ACL\\Models\\User'),
(24, 'update_status', 'Changed status of shipping to: Approved. Updated by: %user_name%', 0, 9, 9, '2024-01-28 02:42:43', '2024-01-29 02:42:43', 'Botble\\ACL\\Models\\User'),
(25, 'create_from_order', 'Shipping was created from order %order_id%', 0, 10, 10, '2024-01-24 12:42:43', '2024-01-24 12:42:43', 'Botble\\ACL\\Models\\User'),
(26, 'update_status', 'Changed status of shipping to: Approved. Updated by: %user_name%', 0, 10, 10, '2024-01-28 04:42:44', '2024-01-29 02:42:44', 'Botble\\ACL\\Models\\User'),
(27, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 10, 10, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'Botble\\ACL\\Models\\User'),
(28, 'create_from_order', 'Shipping was created from order %order_id%', 0, 11, 11, '2024-01-28 06:42:44', '2024-01-28 06:42:44', 'Botble\\ACL\\Models\\User'),
(29, 'update_status', 'Changed status of shipping to: Approved. Updated by: %user_name%', 0, 11, 11, '2024-01-28 06:42:44', '2024-01-29 02:42:44', 'Botble\\ACL\\Models\\User'),
(30, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 11, 11, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'Botble\\ACL\\Models\\User'),
(31, 'create_from_order', 'Shipping was created from order %order_id%', 0, 12, 12, '2024-01-22 08:42:44', '2024-01-22 08:42:44', 'Botble\\ACL\\Models\\User'),
(32, 'update_status', 'Changed status of shipping to: Approved. Updated by: %user_name%', 0, 12, 12, '2024-01-28 08:42:44', '2024-01-29 02:42:44', 'Botble\\ACL\\Models\\User'),
(33, 'create_from_order', 'Shipping was created from order %order_id%', 0, 13, 13, '2024-01-22 10:42:44', '2024-01-22 10:42:44', 'Botble\\ACL\\Models\\User'),
(34, 'update_status', 'Changed status of shipping to: Approved. Updated by: %user_name%', 0, 13, 13, '2024-01-28 10:42:44', '2024-01-29 02:42:44', 'Botble\\ACL\\Models\\User'),
(35, 'create_from_order', 'Shipping was created from order %order_id%', 0, 14, 14, '2024-01-23 20:42:44', '2024-01-23 20:42:44', 'Botble\\ACL\\Models\\User'),
(36, 'update_status', 'Changed status of shipping to: Approved. Updated by: %user_name%', 0, 14, 14, '2024-01-28 12:42:44', '2024-01-29 02:42:44', 'Botble\\ACL\\Models\\User'),
(37, 'create_from_order', 'Shipping was created from order %order_id%', 0, 15, 15, '2024-01-27 14:42:44', '2024-01-27 14:42:44', 'Botble\\ACL\\Models\\User'),
(38, 'update_status', 'Changed status of shipping to: Approved. Updated by: %user_name%', 0, 15, 15, '2024-01-28 14:42:44', '2024-01-29 02:42:44', 'Botble\\ACL\\Models\\User'),
(39, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 15, 15, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'Botble\\ACL\\Models\\User'),
(40, 'create_from_order', 'Shipping was created from order %order_id%', 0, 16, 16, '2024-01-28 06:42:45', '2024-01-28 06:42:45', 'Botble\\ACL\\Models\\User'),
(41, 'update_status', 'Changed status of shipping to: Approved. Updated by: %user_name%', 0, 16, 16, '2024-01-28 16:42:45', '2024-01-29 02:42:45', 'Botble\\ACL\\Models\\User'),
(42, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 16, 16, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'Botble\\ACL\\Models\\User'),
(43, 'create_from_order', 'Shipping was created from order %order_id%', 0, 17, 17, '2024-01-28 02:42:45', '2024-01-28 02:42:45', 'Botble\\ACL\\Models\\User'),
(44, 'update_status', 'Changed status of shipping to: Approved. Updated by: %user_name%', 0, 17, 17, '2024-01-28 18:42:45', '2024-01-29 02:42:45', 'Botble\\ACL\\Models\\User'),
(45, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 17, 17, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'Botble\\ACL\\Models\\User'),
(46, 'create_from_order', 'Shipping was created from order %order_id%', 0, 18, 18, '2024-01-27 20:42:45', '2024-01-27 20:42:45', 'Botble\\ACL\\Models\\User'),
(47, 'update_status', 'Changed status of shipping to: Approved. Updated by: %user_name%', 0, 18, 18, '2024-01-28 20:42:45', '2024-01-29 02:42:45', 'Botble\\ACL\\Models\\User'),
(48, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 18, 18, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'Botble\\ACL\\Models\\User'),
(49, 'create_from_order', 'Shipping was created from order %order_id%', 0, 19, 19, '2024-01-27 22:42:45', '2024-01-27 22:42:45', 'Botble\\ACL\\Models\\User'),
(50, 'update_status', 'Changed status of shipping to: Approved. Updated by: %user_name%', 0, 19, 19, '2024-01-28 22:42:45', '2024-01-29 02:42:45', 'Botble\\ACL\\Models\\User'),
(51, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 19, 19, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'Botble\\ACL\\Models\\User'),
(52, 'create_from_order', 'Shipping was created from order %order_id%', 0, 20, 20, '2024-01-28 08:42:45', '2024-01-28 08:42:45', 'Botble\\ACL\\Models\\User'),
(53, 'update_status', 'Changed status of shipping to: Approved. Updated by: %user_name%', 0, 20, 20, '2024-01-29 00:42:45', '2024-01-29 02:42:45', 'Botble\\ACL\\Models\\User'),
(54, 'update_status', 'Changed status of shipping to: Delivered. Updated by: %user_name%', 0, 20, 20, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'Botble\\ACL\\Models\\User');

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipping`
--

CREATE TABLE `ec_shipping` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `country` varchar(120) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_shipping`
--

INSERT INTO `ec_shipping` (`id`, `title`, `country`, `created_at`, `updated_at`) VALUES
(1, 'All', NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45'),
(2, 'DZ', 'DZ', '2024-02-10 21:28:07', '2024-02-10 21:28:07');

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipping_rules`
--

CREATE TABLE `ec_shipping_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(24) DEFAULT 'based_on_price',
  `from` decimal(15,2) DEFAULT 0.00,
  `to` decimal(15,2) DEFAULT 0.00,
  `price` decimal(15,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_shipping_rules`
--

INSERT INTO `ec_shipping_rules` (`id`, `name`, `shipping_id`, `type`, `from`, `to`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Livraison gratuite', 1, 'based_on_price', 0.00, NULL, 0.00, '2024-01-29 02:42:45', '2024-02-12 14:19:45'),
(2, 'Livraison', 2, 'based_on_price', 0.00, NULL, 0.00, '2024-02-10 21:28:07', '2024-02-12 14:19:31');

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipping_rule_items`
--

CREATE TABLE `ec_shipping_rule_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shipping_rule_id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(120) DEFAULT NULL,
  `state` varchar(120) DEFAULT NULL,
  `city` varchar(120) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `adjustment_price` decimal(15,2) DEFAULT 0.00,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_store_locators`
--

CREATE TABLE `ec_store_locators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `country` varchar(120) DEFAULT NULL,
  `state` varchar(120) DEFAULT NULL,
  `city` varchar(120) DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT 0,
  `is_shipping_location` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_store_locators`
--

INSERT INTO `ec_store_locators` (`id`, `name`, `email`, `phone`, `address`, `country`, `state`, `city`, `is_primary`, `is_shipping_location`, `created_at`, `updated_at`) VALUES
(1, 'Matacor', 'matacor23@gmail.com', '+213550654790', 'P328+3J9، Rue des Pruniers, Djasr Kasentina', 'DZ', 'Algiers', 'Ain Naadja', 1, 1, '2024-01-29 02:42:47', '2024-02-10 21:53:16');

-- --------------------------------------------------------

--
-- Table structure for table `ec_taxes`
--

CREATE TABLE `ec_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `percentage` double(8,6) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_taxes`
--

INSERT INTO `ec_taxes` (`id`, `title`, `percentage`, `priority`, `status`, `created_at`, `updated_at`) VALUES
(1, 'VAT', 10.000000, 1, 'published', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(2, 'None', 0.000000, 2, 'published', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(3, 'Import Tax', 15.000000, 3, 'published', '2024-01-29 02:42:38', '2024-01-29 02:42:38');

-- --------------------------------------------------------

--
-- Table structure for table `ec_tax_products`
--

CREATE TABLE `ec_tax_products` (
  `tax_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_tax_products`
--

INSERT INTO `ec_tax_products` (`tax_id`, `product_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ec_tax_rules`
--

CREATE TABLE `ec_tax_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(120) DEFAULT NULL,
  `state` varchar(120) DEFAULT NULL,
  `city` varchar(120) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_wish_lists`
--

CREATE TABLE `ec_wish_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'What Shipping Methods Are Available?', 'Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.', 1, 'published', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(2, 'Do You Ship Internationally?', 'Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.', 1, 'published', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(3, 'How Long Will It Take To Get My Package?', 'Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.', 1, 'published', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(4, 'What Payment Methods Are Accepted?', 'Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.', 2, 'published', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(5, 'Is Buying On-Line Safe?', 'Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.', 2, 'published', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(6, 'How do I place an Order?', 'Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb Odd Future seitan normcore. Master cleanse American Apparel gentrify flexitarian beard slow-carb next level. Raw denim polaroid paleo farm-to-table, put a bird on it lo-fi tattooed Wes Anderson Pinterest letterpress. Fingerstache McSweeney’s pour-over, letterpress Schlitz photo booth master cleanse bespoke hashtag chillwave gentrify.', 3, 'published', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(7, 'How Can I Cancel Or Change My Order?', 'Plaid letterpress leggings craft beer meh ethical Pinterest. Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth.', 3, 'published', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(8, 'Do I need an account to place an order?', 'Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY. Cray ugh 3 wolf moon fap, fashion axe irony butcher cornhole typewriter chambray VHS banjo street art.', 3, 'published', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(9, 'How Do I Track My Order?', 'Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb @Odd Future seitan normcore. Master cleanse American Apparel gentrify flexitarian beard slow-carb next level.', 3, 'published', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(10, 'How Can I Return a Product?', 'Kale chips Truffaut Williamsburg, hashtag fixie Pinterest raw denim c hambray drinking vinegar Carles street art Bushwick gastropub. Wolf Tumblr paleo church-key. Plaid food truck Echo Park YOLO bitters hella, direct trade Thundercats leggings quinoa before they sold out. You probably haven’t heard of them wayfarers authentic umami drinking vinegar Pinterest Cosby sweater, fingerstache fap High Life.', 3, 'published', '2024-01-29 02:42:48', '2024-01-29 02:42:48');

-- --------------------------------------------------------

--
-- Table structure for table `faqs_translations`
--

CREATE TABLE `faqs_translations` (
  `lang_code` varchar(20) NOT NULL,
  `faqs_id` bigint(20) UNSIGNED NOT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `name`, `order`, `status`, `created_at`, `updated_at`, `description`) VALUES
(1, 'Shipping', 0, 'published', '2024-01-29 02:42:48', '2024-01-29 02:42:48', NULL),
(2, 'Payment', 1, 'published', '2024-01-29 02:42:48', '2024-01-29 02:42:48', NULL),
(3, 'Order &amp; Returns', 2, 'published', '2024-01-29 02:42:48', '2024-01-29 02:42:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories_translations`
--

CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(20) NOT NULL,
  `faq_categories_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` longtext NOT NULL,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `name`, `description`, `is_featured`, `order`, `image`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Men', 'Neque et facilis dolores incidunt iusto. Fugiat eum natus culpa exercitationem et. Debitis qui labore autem.', 1, 0, 'galleries/1.jpg', 1, 'published', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(2, 'Women', 'Totam voluptatem ut nesciunt facilis amet. Ut quia nisi eum odio ea natus quo. Fugit qui quis pariatur perspiciatis ut dolores.', 1, 0, 'galleries/2.jpg', 1, 'published', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(3, 'Accessories', 'Molestiae dolores maiores omnis est. Distinctio aut iste expedita ipsa. Quo minima nisi corrupti laudantium.', 1, 0, 'galleries/3.jpg', 1, 'published', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(4, 'Shoes', 'Et numquam reiciendis culpa. Qui dolor reiciendis iure voluptas ea.', 1, 0, 'galleries/4.jpg', 1, 'published', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(6, 'Dress', 'Natus rerum quis ut nemo voluptas voluptatem qui. Vitae omnis doloribus excepturi. Aliquam hic qui placeat doloribus odio aut.', 1, 0, 'galleries/6.jpg', 1, 'published', '2024-01-29 02:42:48', '2024-01-29 02:42:48');

-- --------------------------------------------------------

--
-- Table structure for table `galleries_translations`
--

CREATE TABLE `galleries_translations` (
  `lang_code` varchar(20) NOT NULL,
  `galleries_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_meta`
--

CREATE TABLE `gallery_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `images` text DEFAULT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery_meta`
--

INSERT INTO `gallery_meta` (`id`, `images`, `reference_id`, `reference_type`, `created_at`, `updated_at`) VALUES
(1, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Fuga consequatur consequatur minus eos nobis ea ipsa ea. A sit quod quos omnis. Aperiam earum et sint minus reiciendis.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Expedita quam ullam labore porro architecto. Quis similique necessitatibus dolorem sequi possimus.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Aut deserunt expedita facilis sapiente in. Mollitia non earum natus voluptatem ad.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Eaque et qui quas incidunt blanditiis. Assumenda velit et et dolores alias nemo voluptate. Fugit quia tenetur qui.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Quis molestiae accusantium sit pariatur repellat. Qui necessitatibus magnam qui laboriosam et.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Aut voluptas sed optio molestias voluptatem eos. Debitis perspiciatis earum aliquam.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Adipisci eveniet possimus dolorem esse ut. Atque harum sed repellat iure repudiandae sed ipsam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Explicabo nihil et veritatis. Consequatur cupiditate ipsam ab numquam odio. Rerum dolorem earum veniam animi repellat ab.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Ipsam aperiam pariatur laudantium libero ducimus. Non accusamus hic quis velit. Fugit nihil facere quibusdam et libero.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Vel odit qui aut dolorum. Hic laborum quis omnis sit nihil. Vel nemo quidem et ratione. Autem sunt quo consequatur ea qui consequatur.\"}]', 1, 'Botble\\Gallery\\Models\\Gallery', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(2, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Fuga consequatur consequatur minus eos nobis ea ipsa ea. A sit quod quos omnis. Aperiam earum et sint minus reiciendis.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Expedita quam ullam labore porro architecto. Quis similique necessitatibus dolorem sequi possimus.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Aut deserunt expedita facilis sapiente in. Mollitia non earum natus voluptatem ad.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Eaque et qui quas incidunt blanditiis. Assumenda velit et et dolores alias nemo voluptate. Fugit quia tenetur qui.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Quis molestiae accusantium sit pariatur repellat. Qui necessitatibus magnam qui laboriosam et.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Aut voluptas sed optio molestias voluptatem eos. Debitis perspiciatis earum aliquam.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Adipisci eveniet possimus dolorem esse ut. Atque harum sed repellat iure repudiandae sed ipsam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Explicabo nihil et veritatis. Consequatur cupiditate ipsam ab numquam odio. Rerum dolorem earum veniam animi repellat ab.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Ipsam aperiam pariatur laudantium libero ducimus. Non accusamus hic quis velit. Fugit nihil facere quibusdam et libero.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Vel odit qui aut dolorum. Hic laborum quis omnis sit nihil. Vel nemo quidem et ratione. Autem sunt quo consequatur ea qui consequatur.\"}]', 2, 'Botble\\Gallery\\Models\\Gallery', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(3, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Fuga consequatur consequatur minus eos nobis ea ipsa ea. A sit quod quos omnis. Aperiam earum et sint minus reiciendis.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Expedita quam ullam labore porro architecto. Quis similique necessitatibus dolorem sequi possimus.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Aut deserunt expedita facilis sapiente in. Mollitia non earum natus voluptatem ad.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Eaque et qui quas incidunt blanditiis. Assumenda velit et et dolores alias nemo voluptate. Fugit quia tenetur qui.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Quis molestiae accusantium sit pariatur repellat. Qui necessitatibus magnam qui laboriosam et.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Aut voluptas sed optio molestias voluptatem eos. Debitis perspiciatis earum aliquam.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Adipisci eveniet possimus dolorem esse ut. Atque harum sed repellat iure repudiandae sed ipsam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Explicabo nihil et veritatis. Consequatur cupiditate ipsam ab numquam odio. Rerum dolorem earum veniam animi repellat ab.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Ipsam aperiam pariatur laudantium libero ducimus. Non accusamus hic quis velit. Fugit nihil facere quibusdam et libero.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Vel odit qui aut dolorum. Hic laborum quis omnis sit nihil. Vel nemo quidem et ratione. Autem sunt quo consequatur ea qui consequatur.\"}]', 3, 'Botble\\Gallery\\Models\\Gallery', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(4, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Fuga consequatur consequatur minus eos nobis ea ipsa ea. A sit quod quos omnis. Aperiam earum et sint minus reiciendis.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Expedita quam ullam labore porro architecto. Quis similique necessitatibus dolorem sequi possimus.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Aut deserunt expedita facilis sapiente in. Mollitia non earum natus voluptatem ad.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Eaque et qui quas incidunt blanditiis. Assumenda velit et et dolores alias nemo voluptate. Fugit quia tenetur qui.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Quis molestiae accusantium sit pariatur repellat. Qui necessitatibus magnam qui laboriosam et.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Aut voluptas sed optio molestias voluptatem eos. Debitis perspiciatis earum aliquam.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Adipisci eveniet possimus dolorem esse ut. Atque harum sed repellat iure repudiandae sed ipsam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Explicabo nihil et veritatis. Consequatur cupiditate ipsam ab numquam odio. Rerum dolorem earum veniam animi repellat ab.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Ipsam aperiam pariatur laudantium libero ducimus. Non accusamus hic quis velit. Fugit nihil facere quibusdam et libero.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Vel odit qui aut dolorum. Hic laborum quis omnis sit nihil. Vel nemo quidem et ratione. Autem sunt quo consequatur ea qui consequatur.\"}]', 4, 'Botble\\Gallery\\Models\\Gallery', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(6, '[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Fuga consequatur consequatur minus eos nobis ea ipsa ea. A sit quod quos omnis. Aperiam earum et sint minus reiciendis.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Expedita quam ullam labore porro architecto. Quis similique necessitatibus dolorem sequi possimus.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Aut deserunt expedita facilis sapiente in. Mollitia non earum natus voluptatem ad.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Eaque et qui quas incidunt blanditiis. Assumenda velit et et dolores alias nemo voluptate. Fugit quia tenetur qui.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Quis molestiae accusantium sit pariatur repellat. Qui necessitatibus magnam qui laboriosam et.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Aut voluptas sed optio molestias voluptatem eos. Debitis perspiciatis earum aliquam.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Adipisci eveniet possimus dolorem esse ut. Atque harum sed repellat iure repudiandae sed ipsam.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Explicabo nihil et veritatis. Consequatur cupiditate ipsam ab numquam odio. Rerum dolorem earum veniam animi repellat ab.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Ipsam aperiam pariatur laudantium libero ducimus. Non accusamus hic quis velit. Fugit nihil facere quibusdam et libero.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Vel odit qui aut dolorum. Hic laborum quis omnis sit nihil. Vel nemo quidem et ratione. Autem sunt quo consequatur ea qui consequatur.\"}]', 6, 'Botble\\Gallery\\Models\\Gallery', '2024-01-29 02:42:48', '2024-01-29 02:42:48');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_meta_translations`
--

CREATE TABLE `gallery_meta_translations` (
  `lang_code` varchar(20) NOT NULL,
  `gallery_meta_id` bigint(20) UNSIGNED NOT NULL,
  `images` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `lang_id` bigint(20) UNSIGNED NOT NULL,
  `lang_name` varchar(120) NOT NULL,
  `lang_locale` varchar(20) NOT NULL,
  `lang_code` varchar(20) NOT NULL,
  `lang_flag` varchar(20) DEFAULT NULL,
  `lang_is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lang_order` int(11) NOT NULL DEFAULT 0,
  `lang_is_rtl` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`lang_id`, `lang_name`, `lang_locale`, `lang_code`, `lang_flag`, `lang_is_default`, `lang_order`, `lang_is_rtl`) VALUES
(1, 'English', 'en', 'en_US', 'us', 0, 1, 0),
(3, 'العربية', 'ar', 'ar', 'dz', 0, 3, 1),
(4, 'Français', 'fr', 'fr_FR', 'fr', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `language_meta`
--

CREATE TABLE `language_meta` (
  `lang_meta_id` bigint(20) UNSIGNED NOT NULL,
  `lang_meta_code` varchar(20) DEFAULT NULL,
  `lang_meta_origin` varchar(32) NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `language_meta`
--

INSERT INTO `language_meta` (`lang_meta_id`, `lang_meta_code`, `lang_meta_origin`, `reference_id`, `reference_type`) VALUES
(1, 'en_US', '7af81918f06429436b151068d2eb011c', 1, 'Botble\\SimpleSlider\\Models\\SimpleSlider'),
(2, 'en_US', 'bdd111eeae9eef061d4fd98ef32cd3c1', 1, 'Botble\\Menu\\Models\\MenuLocation'),
(3, 'en_US', 'fc930167dd7b130904d5e4fbe9e01c45', 1, 'Botble\\Menu\\Models\\Menu'),
(4, 'en_US', '59f9de008fa4a8e06e6508bd52ce8bad', 2, 'Botble\\Menu\\Models\\Menu');

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
--

CREATE TABLE `media_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `folder_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `mime_type` varchar(120) NOT NULL,
  `size` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `options` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_files`
--

INSERT INTO `media_files` (`id`, `user_id`, `name`, `alt`, `folder_id`, `mime_type`, `size`, `url`, `options`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, '1', '1', 1, 'image/png', 1805, 'brands/1.png', '[]', '2024-01-29 02:42:35', '2024-01-29 02:42:35', NULL),
(2, 0, '2', '2', 1, 'image/png', 1805, 'brands/2.png', '[]', '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL),
(3, 0, '3', '3', 1, 'image/png', 1805, 'brands/3.png', '[]', '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL),
(4, 0, '4', '4', 1, 'image/png', 1805, 'brands/4.png', '[]', '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL),
(5, 0, '5', '5', 1, 'image/png', 1805, 'brands/5.png', '[]', '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL),
(6, 0, '6', '6', 1, 'image/png', 1805, 'brands/6.png', '[]', '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL),
(7, 0, '7', '7', 1, 'image/png', 1805, 'brands/7.png', '[]', '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL),
(8, 0, '1', '1', 2, 'image/png', 9730, 'product-categories/1.png', '[]', '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL),
(9, 0, '2', '2', 2, 'image/png', 9730, 'product-categories/2.png', '[]', '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL),
(10, 0, '3', '3', 2, 'image/png', 9730, 'product-categories/3.png', '[]', '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL),
(11, 0, '4', '4', 2, 'image/png', 9730, 'product-categories/4.png', '[]', '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL),
(12, 0, '5', '5', 2, 'image/png', 9730, 'product-categories/5.png', '[]', '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL),
(13, 0, '6', '6', 2, 'image/png', 9730, 'product-categories/6.png', '[]', '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL),
(14, 0, '7', '7', 2, 'image/png', 9730, 'product-categories/7.png', '[]', '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL),
(15, 0, '1', '1', 3, 'image/jpeg', 9730, 'product-collections/1.jpg', '[]', '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL),
(16, 0, '2', '2', 3, 'image/jpeg', 9730, 'product-collections/2.jpg', '[]', '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL),
(17, 0, '3', '3', 3, 'image/jpeg', 9730, 'product-collections/3.jpg', '[]', '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL),
(18, 0, '4', '4', 3, 'image/jpeg', 9730, 'product-collections/4.jpg', '[]', '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL),
(19, 0, '1-1', '1-1', 4, 'image/jpeg', 9730, 'products/1-1.jpg', '[]', '2024-01-29 02:42:37', '2024-01-29 02:42:37', NULL),
(20, 0, '1', '1', 4, 'image/jpeg', 9730, 'products/1.jpg', '[]', '2024-01-29 02:42:37', '2024-01-29 02:42:37', NULL),
(21, 0, '10-1', '10-1', 4, 'image/jpeg', 9730, 'products/10-1.jpg', '[]', '2024-01-29 02:42:37', '2024-01-29 02:42:37', NULL),
(22, 0, '10-2', '10-2', 4, 'image/jpeg', 9730, 'products/10-2.jpg', '[]', '2024-01-29 02:42:37', '2024-01-29 02:42:37', NULL),
(23, 0, '10', '10', 4, 'image/jpeg', 9730, 'products/10.jpg', '[]', '2024-01-29 02:42:37', '2024-01-29 02:42:37', NULL),
(24, 0, '11', '11', 4, 'image/jpeg', 9730, 'products/11.jpg', '[]', '2024-01-29 02:42:37', '2024-01-29 02:42:37', NULL),
(25, 0, '2-1', '2-1', 4, 'image/jpeg', 9730, 'products/2-1.jpg', '[]', '2024-01-29 02:42:37', '2024-01-29 02:42:37', NULL),
(26, 0, '2-2', '2-2', 4, 'image/jpeg', 9730, 'products/2-2.jpg', '[]', '2024-01-29 02:42:37', '2024-01-29 02:42:37', NULL),
(27, 0, '2-3', '2-3', 4, 'image/jpeg', 9730, 'products/2-3.jpg', '[]', '2024-01-29 02:42:37', '2024-01-29 02:42:37', NULL),
(28, 0, '2', '2', 4, 'image/jpeg', 9730, 'products/2.jpg', '[]', '2024-01-29 02:42:37', '2024-01-29 02:42:37', NULL),
(29, 0, '3-1', '3-1', 4, 'image/jpeg', 9730, 'products/3-1.jpg', '[]', '2024-01-29 02:42:37', '2024-01-29 02:42:37', NULL),
(30, 0, '3-2', '3-2', 4, 'image/jpeg', 9730, 'products/3-2.jpg', '[]', '2024-01-29 02:42:37', '2024-01-29 02:42:37', NULL),
(31, 0, '3-3', '3-3', 4, 'image/jpeg', 9730, 'products/3-3.jpg', '[]', '2024-01-29 02:42:37', '2024-01-29 02:42:37', NULL),
(32, 0, '3', '3', 4, 'image/jpeg', 9730, 'products/3.jpg', '[]', '2024-01-29 02:42:37', '2024-01-29 02:42:37', NULL),
(33, 0, '4-1', '4-1', 4, 'image/jpeg', 9730, 'products/4-1.jpg', '[]', '2024-01-29 02:42:37', '2024-01-29 02:42:37', NULL),
(34, 0, '4-2', '4-2', 4, 'image/jpeg', 9730, 'products/4-2.jpg', '[]', '2024-01-29 02:42:37', '2024-01-29 02:42:37', NULL),
(35, 0, '4', '4', 4, 'image/jpeg', 9730, 'products/4.jpg', '[]', '2024-01-29 02:42:37', '2024-01-29 02:42:37', NULL),
(36, 0, '5-1', '5-1', 4, 'image/jpeg', 9730, 'products/5-1.jpg', '[]', '2024-01-29 02:42:37', '2024-01-29 02:42:37', NULL),
(37, 0, '5-2', '5-2', 4, 'image/jpeg', 9730, 'products/5-2.jpg', '[]', '2024-01-29 02:42:37', '2024-01-29 02:42:37', NULL),
(38, 0, '5', '5', 4, 'image/jpeg', 9730, 'products/5.jpg', '[]', '2024-01-29 02:42:37', '2024-01-29 02:42:37', NULL),
(39, 0, '6-1', '6-1', 4, 'image/jpeg', 9730, 'products/6-1.jpg', '[]', '2024-01-29 02:42:38', '2024-01-29 02:42:38', NULL),
(40, 0, '6', '6', 4, 'image/jpeg', 9730, 'products/6.jpg', '[]', '2024-01-29 02:42:38', '2024-01-29 02:42:38', NULL),
(41, 0, '7-1', '7-1', 4, 'image/jpeg', 9730, 'products/7-1.jpg', '[]', '2024-01-29 02:42:38', '2024-01-29 02:42:38', NULL),
(42, 0, '7-2', '7-2', 4, 'image/jpeg', 9730, 'products/7-2.jpg', '[]', '2024-01-29 02:42:38', '2024-01-29 02:42:38', NULL),
(43, 0, '7', '7', 4, 'image/jpeg', 9730, 'products/7.jpg', '[]', '2024-01-29 02:42:38', '2024-01-29 02:42:38', NULL),
(44, 0, '8', '8', 4, 'image/jpeg', 9730, 'products/8.jpg', '[]', '2024-01-29 02:42:38', '2024-01-29 02:42:38', NULL),
(45, 0, '9', '9', 4, 'image/jpeg', 9730, 'products/9.jpg', '[]', '2024-01-29 02:42:38', '2024-01-29 02:42:38', NULL),
(46, 0, '1', '1', 5, 'image/jpeg', 9730, 'customers/1.jpg', '[]', '2024-01-29 02:42:38', '2024-01-29 02:42:38', NULL),
(47, 0, '10', '10', 5, 'image/jpeg', 9730, 'customers/10.jpg', '[]', '2024-01-29 02:42:39', '2024-01-29 02:42:39', NULL),
(48, 0, '2', '2', 5, 'image/jpeg', 9730, 'customers/2.jpg', '[]', '2024-01-29 02:42:39', '2024-01-29 02:42:39', NULL),
(49, 0, '3', '3', 5, 'image/jpeg', 9730, 'customers/3.jpg', '[]', '2024-01-29 02:42:39', '2024-01-29 02:42:39', NULL),
(50, 0, '4', '4', 5, 'image/jpeg', 9730, 'customers/4.jpg', '[]', '2024-01-29 02:42:39', '2024-01-29 02:42:39', NULL),
(51, 0, '5', '5', 5, 'image/jpeg', 9730, 'customers/5.jpg', '[]', '2024-01-29 02:42:39', '2024-01-29 02:42:39', NULL),
(52, 0, '6', '6', 5, 'image/jpeg', 9730, 'customers/6.jpg', '[]', '2024-01-29 02:42:39', '2024-01-29 02:42:39', NULL),
(53, 0, '7', '7', 5, 'image/jpeg', 9730, 'customers/7.jpg', '[]', '2024-01-29 02:42:39', '2024-01-29 02:42:39', NULL),
(54, 0, '8', '8', 5, 'image/jpeg', 9730, 'customers/8.jpg', '[]', '2024-01-29 02:42:39', '2024-01-29 02:42:39', NULL),
(55, 0, '9', '9', 5, 'image/jpeg', 9730, 'customers/9.jpg', '[]', '2024-01-29 02:42:39', '2024-01-29 02:42:39', NULL),
(56, 0, '1', '1', 6, 'image/jpeg', 9359, 'flash-sales/1.jpg', '[]', '2024-01-29 02:42:45', '2024-01-29 02:42:45', NULL),
(57, 0, '2', '2', 6, 'image/jpeg', 9359, 'flash-sales/2.jpg', '[]', '2024-01-29 02:42:46', '2024-01-29 02:42:46', NULL),
(58, 0, '1', '1', 7, 'image/jpeg', 20612, 'sliders/1.jpg', '[]', '2024-01-29 02:42:46', '2024-01-29 02:42:46', NULL),
(59, 0, '2', '2', 7, 'image/jpeg', 20612, 'sliders/2.jpg', '[]', '2024-01-29 02:42:46', '2024-01-29 02:42:46', NULL),
(60, 0, '3', '3', 7, 'image/jpeg', 20612, 'sliders/3.jpg', '[]', '2024-01-29 02:42:46', '2024-01-29 02:42:46', NULL),
(61, 0, '1', '1', 8, 'image/jpeg', 9730, 'news/1.jpg', '[]', '2024-01-29 02:42:47', '2024-01-29 02:42:47', NULL),
(62, 0, '10', '10', 8, 'image/jpeg', 9730, 'news/10.jpg', '[]', '2024-01-29 02:42:47', '2024-01-29 02:42:47', NULL),
(63, 0, '11', '11', 8, 'image/jpeg', 9730, 'news/11.jpg', '[]', '2024-01-29 02:42:47', '2024-01-29 02:42:47', NULL),
(64, 0, '2', '2', 8, 'image/jpeg', 9730, 'news/2.jpg', '[]', '2024-01-29 02:42:47', '2024-01-29 02:42:47', NULL),
(65, 0, '3', '3', 8, 'image/jpeg', 9730, 'news/3.jpg', '[]', '2024-01-29 02:42:47', '2024-01-29 02:42:47', NULL),
(66, 0, '4', '4', 8, 'image/jpeg', 9730, 'news/4.jpg', '[]', '2024-01-29 02:42:47', '2024-01-29 02:42:47', NULL),
(67, 0, '5', '5', 8, 'image/jpeg', 9730, 'news/5.jpg', '[]', '2024-01-29 02:42:47', '2024-01-29 02:42:47', NULL),
(68, 0, '6', '6', 8, 'image/jpeg', 9730, 'news/6.jpg', '[]', '2024-01-29 02:42:47', '2024-01-29 02:42:47', NULL),
(69, 0, '7', '7', 8, 'image/jpeg', 9730, 'news/7.jpg', '[]', '2024-01-29 02:42:47', '2024-01-29 02:42:47', NULL),
(70, 0, '8', '8', 8, 'image/jpeg', 9730, 'news/8.jpg', '[]', '2024-01-29 02:42:47', '2024-01-29 02:42:47', NULL),
(71, 0, '9', '9', 8, 'image/jpeg', 9730, 'news/9.jpg', '[]', '2024-01-29 02:42:47', '2024-01-29 02:42:47', NULL),
(72, 0, '1', '1', 9, 'image/jpeg', 9730, 'galleries/1.jpg', '[]', '2024-01-29 02:42:47', '2024-01-29 02:42:47', NULL),
(73, 0, '10', '10', 9, 'image/jpeg', 9730, 'galleries/10.jpg', '[]', '2024-01-29 02:42:47', '2024-01-29 02:42:47', NULL),
(74, 0, '2', '2', 9, 'image/jpeg', 9730, 'galleries/2.jpg', '[]', '2024-01-29 02:42:47', '2024-01-29 02:42:47', NULL),
(75, 0, '3', '3', 9, 'image/jpeg', 9730, 'galleries/3.jpg', '[]', '2024-01-29 02:42:47', '2024-01-29 02:42:47', NULL),
(76, 0, '4', '4', 9, 'image/jpeg', 9730, 'galleries/4.jpg', '[]', '2024-01-29 02:42:48', '2024-01-29 02:42:48', NULL),
(77, 0, '5', '5', 9, 'image/jpeg', 9730, 'galleries/5.jpg', '[]', '2024-01-29 02:42:48', '2024-01-29 02:42:48', NULL),
(78, 0, '6', '6', 9, 'image/jpeg', 9730, 'galleries/6.jpg', '[]', '2024-01-29 02:42:48', '2024-01-29 02:42:48', NULL),
(79, 0, '7', '7', 9, 'image/jpeg', 9730, 'galleries/7.jpg', '[]', '2024-01-29 02:42:48', '2024-01-29 02:42:48', NULL),
(80, 0, '8', '8', 9, 'image/jpeg', 9730, 'galleries/8.jpg', '[]', '2024-01-29 02:42:48', '2024-01-29 02:42:48', NULL),
(81, 0, '9', '9', 9, 'image/jpeg', 9730, 'galleries/9.jpg', '[]', '2024-01-29 02:42:48', '2024-01-29 02:42:48', NULL),
(82, 0, 'favicon', 'favicon', 10, 'image/png', 14500, 'general/favicon.png', '[]', '2024-01-29 02:42:48', '2024-01-29 02:42:48', NULL),
(83, 0, 'logo-light', 'logo-light', 10, 'image/png', 35316, 'general/logo-light.png', '[]', '2024-01-29 02:42:48', '2024-01-29 02:42:48', NULL),
(84, 0, 'logo', 'logo', 10, 'image/png', 41654, 'general/logo.png', '[]', '2024-01-29 02:42:48', '2024-01-29 02:42:48', NULL),
(85, 0, 'open-graph-image', 'open-graph-image', 10, 'image/png', 580691, 'general/open-graph-image.png', '[]', '2024-01-29 02:42:48', '2024-01-29 02:42:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_folders`
--

CREATE TABLE `media_folders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(250) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_folders`
--

INSERT INTO `media_folders` (`id`, `user_id`, `name`, `color`, `slug`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'brands', NULL, 'brands', 0, '2024-01-29 02:42:35', '2024-01-29 02:42:35', NULL),
(2, 0, 'product-categories', NULL, 'product-categories', 0, '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL),
(3, 0, 'product-collections', NULL, 'product-collections', 0, '2024-01-29 02:42:36', '2024-01-29 02:42:36', NULL),
(4, 0, 'products', NULL, 'products', 0, '2024-01-29 02:42:37', '2024-01-29 02:42:37', NULL),
(5, 0, 'customers', NULL, 'customers', 0, '2024-01-29 02:42:38', '2024-01-29 02:42:38', NULL),
(6, 0, 'flash-sales', NULL, 'flash-sales', 0, '2024-01-29 02:42:45', '2024-01-29 02:42:45', NULL),
(7, 0, 'sliders', NULL, 'sliders', 0, '2024-01-29 02:42:46', '2024-01-29 02:42:46', NULL),
(8, 0, 'news', NULL, 'news', 0, '2024-01-29 02:42:47', '2024-01-29 02:42:47', NULL),
(9, 0, 'galleries', NULL, 'galleries', 0, '2024-01-29 02:42:47', '2024-01-29 02:42:47', NULL),
(10, 0, 'general', NULL, 'general', 0, '2024-01-29 02:42:48', '2024-01-29 02:42:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_settings`
--

CREATE TABLE `media_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(120) NOT NULL,
  `value` text DEFAULT NULL,
  `media_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Main menu', 'main-menu', 'published', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(2, 'Customer services', 'customer-services', 'published', '2024-01-29 02:42:48', '2024-01-29 02:42:48');

-- --------------------------------------------------------

--
-- Table structure for table `menu_locations`
--

CREATE TABLE `menu_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_locations`
--

INSERT INTO `menu_locations` (`id`, `menu_id`, `location`, `created_at`, `updated_at`) VALUES
(1, 1, 'main-menu', '2024-01-29 02:42:48', '2024-01-29 02:42:48');

-- --------------------------------------------------------

--
-- Table structure for table `menu_nodes`
--

CREATE TABLE `menu_nodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `reference_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reference_type` varchar(255) DEFAULT NULL,
  `url` varchar(120) DEFAULT NULL,
  `icon_font` varchar(50) DEFAULT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(120) DEFAULT NULL,
  `css_class` varchar(120) DEFAULT NULL,
  `target` varchar(20) NOT NULL DEFAULT '_self',
  `has_child` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_nodes`
--

INSERT INTO `menu_nodes` (`id`, `menu_id`, `parent_id`, `reference_id`, `reference_type`, `url`, `icon_font`, `position`, `title`, `css_class`, `target`, `has_child`, `created_at`, `updated_at`) VALUES
(1, 1, 0, NULL, NULL, '/', NULL, 0, 'Home', NULL, '_self', 0, '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(2, 1, 0, NULL, NULL, '/products', NULL, 0, 'Products', NULL, '_self', 1, '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(3, 1, 2, 1, 'Botble\\Ecommerce\\Models\\ProductCategory', '/product-categories/office-bags', NULL, 0, 'Woman wallet', NULL, '_self', 0, '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(4, 1, 2, 2, 'Botble\\Ecommerce\\Models\\ProductCategory', '/product-categories/hand-bag', NULL, 0, 'Office bags', NULL, '_self', 0, '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(5, 1, 2, 3, 'Botble\\Ecommerce\\Models\\ProductCategory', '/product-categories/woman', NULL, 0, 'Hand bag', NULL, '_self', 0, '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(6, 1, 2, 4, 'Botble\\Ecommerce\\Models\\ProductCategory', '/product-categories/woman-wallet', NULL, 0, 'Backpack', NULL, '_self', 0, '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(7, 1, 0, 2, 'Botble\\Page\\Models\\Page', '/blog', NULL, 0, 'Blog', NULL, '_self', 0, '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(8, 1, 0, 5, 'Botble\\Page\\Models\\Page', '/faqs', NULL, 0, 'FAQ', NULL, '_self', 0, '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(9, 1, 0, 3, 'Botble\\Page\\Models\\Page', '/contact', NULL, 0, 'Contact', NULL, '_self', 0, '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(10, 2, 0, NULL, NULL, '/login', NULL, 0, 'Login', NULL, '_self', 0, '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(11, 2, 0, NULL, NULL, '/register', NULL, 0, 'Register', NULL, '_self', 0, '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(12, 2, 0, 2, 'Botble\\Page\\Models\\Page', '/blog', NULL, 0, 'Blog', NULL, '_self', 0, '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(13, 2, 0, 3, 'Botble\\Page\\Models\\Page', '/contact', NULL, 0, 'Contact', NULL, '_self', 0, '2024-01-29 02:42:48', '2024-01-29 02:42:48');

-- --------------------------------------------------------

--
-- Table structure for table `meta_boxes`
--

CREATE TABLE `meta_boxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` text DEFAULT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_boxes`
--

INSERT INTO `meta_boxes` (`id`, `meta_key`, `meta_value`, `reference_id`, `reference_type`, `created_at`, `updated_at`) VALUES
(1, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 1, 'Botble\\Ecommerce\\Models\\Product', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(2, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 2, 'Botble\\Ecommerce\\Models\\Product', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(3, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 3, 'Botble\\Ecommerce\\Models\\Product', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(4, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 4, 'Botble\\Ecommerce\\Models\\Product', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(5, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 5, 'Botble\\Ecommerce\\Models\\Product', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(6, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 6, 'Botble\\Ecommerce\\Models\\Product', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(7, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 7, 'Botble\\Ecommerce\\Models\\Product', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(8, 'faq_schema_config', '[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]', 8, 'Botble\\Ecommerce\\Models\\Product', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(9, 'image', '[\"flash-sales\\/1.jpg\"]', 1, 'Botble\\Ecommerce\\Models\\FlashSale', '2024-01-29 02:42:46', '2024-01-29 02:42:46'),
(10, 'image', '[\"flash-sales\\/2.jpg\"]', 2, 'Botble\\Ecommerce\\Models\\FlashSale', '2024-01-29 02:42:46', '2024-01-29 02:42:46'),
(11, 'button_text', '[\"Shop now\"]', 1, 'Botble\\SimpleSlider\\Models\\SimpleSliderItem', '2024-01-29 02:42:46', '2024-01-29 02:42:46'),
(12, 'button_text', '[\"Discover now\"]', 2, 'Botble\\SimpleSlider\\Models\\SimpleSliderItem', '2024-01-29 02:42:46', '2024-01-29 02:42:46'),
(13, 'button_text', '[\"Shop now\"]', 3, 'Botble\\SimpleSlider\\Models\\SimpleSliderItem', '2024-01-29 02:42:46', '2024-01-29 02:42:46');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_04_09_032329_create_base_tables', 1),
(2, '2013_04_09_062329_create_revisions_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(5, '2016_06_10_230148_create_acl_tables', 1),
(6, '2016_06_14_230857_create_menus_table', 1),
(7, '2016_06_28_221418_create_pages_table', 1),
(8, '2016_10_05_074239_create_setting_table', 1),
(9, '2016_11_28_032840_create_dashboard_widget_tables', 1),
(10, '2016_12_16_084601_create_widgets_table', 1),
(11, '2017_05_09_070343_create_media_tables', 1),
(12, '2017_11_03_070450_create_slug_table', 1),
(13, '2019_01_05_053554_create_jobs_table', 1),
(14, '2019_08_19_000000_create_failed_jobs_table', 1),
(15, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(16, '2022_04_20_100851_add_index_to_media_table', 1),
(17, '2022_04_20_101046_add_index_to_menu_table', 1),
(18, '2022_07_10_034813_move_lang_folder_to_root', 1),
(19, '2022_08_04_051940_add_missing_column_expires_at', 1),
(20, '2022_09_01_000001_create_admin_notifications_tables', 1),
(21, '2022_10_14_024629_drop_column_is_featured', 1),
(22, '2022_11_18_063357_add_missing_timestamp_in_table_settings', 1),
(23, '2022_12_02_093615_update_slug_index_columns', 1),
(24, '2023_01_30_024431_add_alt_to_media_table', 1),
(25, '2023_02_16_042611_drop_table_password_resets', 1),
(26, '2023_04_23_005903_add_column_permissions_to_admin_notifications', 1),
(27, '2023_05_10_075124_drop_column_id_in_role_users_table', 1),
(28, '2023_08_21_090810_make_page_content_nullable', 1),
(29, '2023_09_14_021936_update_index_for_slugs_table', 1),
(30, '2023_12_06_100448_change_random_hash_for_media', 1),
(31, '2023_12_07_095130_add_color_column_to_media_folders_table', 1),
(32, '2023_12_17_162208_make_sure_column_color_in_media_folders_nullable', 1),
(33, '2015_06_29_025744_create_audit_history', 2),
(34, '2023_11_14_033417_change_request_column_in_table_audit_histories', 2),
(35, '2015_06_18_033822_create_blog_table', 3),
(36, '2021_02_16_092633_remove_default_value_for_author_type', 3),
(37, '2021_12_03_030600_create_blog_translations', 3),
(38, '2022_04_19_113923_add_index_to_table_posts', 3),
(39, '2023_08_29_074620_make_column_author_id_nullable', 3),
(40, '2016_06_17_091537_create_contacts_table', 4),
(41, '2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core', 4),
(42, '2020_03_05_041139_create_ecommerce_tables', 5),
(43, '2021_01_01_044147_ecommerce_create_flash_sale_table', 5),
(44, '2021_01_17_082713_add_column_is_featured_to_product_collections_table', 5),
(45, '2021_01_18_024333_add_zip_code_into_table_customer_addresses', 5),
(46, '2021_02_18_073505_update_table_ec_reviews', 5),
(47, '2021_03_10_024419_add_column_confirmed_at_to_table_ec_customers', 5),
(48, '2021_03_10_025153_change_column_tax_amount', 5),
(49, '2021_03_20_033103_add_column_availability_to_table_ec_products', 5),
(50, '2021_04_28_074008_ecommerce_create_product_label_table', 5),
(51, '2021_05_31_173037_ecommerce_create_ec_products_translations', 5),
(52, '2021_08_17_105016_remove_column_currency_id_in_some_tables', 5),
(53, '2021_08_30_142128_add_images_column_to_ec_reviews_table', 5),
(54, '2021_10_04_030050_add_column_created_by_to_table_ec_products', 5),
(55, '2021_10_05_122616_add_status_column_to_ec_customers_table', 5),
(56, '2021_11_03_025806_nullable_phone_number_in_ec_customer_addresses', 5),
(57, '2021_11_23_071403_correct_languages_for_product_variations', 5),
(58, '2021_11_28_031808_add_product_tags_translations', 5),
(59, '2021_12_01_031123_add_featured_image_to_ec_products', 5),
(60, '2022_01_01_033107_update_table_ec_shipments', 5),
(61, '2022_02_16_042457_improve_product_attribute_sets', 5),
(62, '2022_03_22_075758_correct_product_name', 5),
(63, '2022_04_19_113334_add_index_to_ec_products', 5),
(64, '2022_04_28_144405_remove_unused_table', 5),
(65, '2022_05_05_115015_create_ec_customer_recently_viewed_products_table', 5),
(66, '2022_05_18_143720_add_index_to_table_ec_product_categories', 5),
(67, '2022_06_16_095633_add_index_to_some_tables', 5),
(68, '2022_06_30_035148_create_order_referrals_table', 5),
(69, '2022_07_24_153815_add_completed_at_to_ec_orders_table', 5),
(70, '2022_08_14_032836_create_ec_order_returns_table', 5),
(71, '2022_08_14_033554_create_ec_order_return_items_table', 5),
(72, '2022_08_15_040324_add_billing_address', 5),
(73, '2022_08_30_091114_support_digital_products_table', 5),
(74, '2022_09_13_095744_create_options_table', 5),
(75, '2022_09_13_104347_create_option_value_table', 5),
(76, '2022_10_05_163518_alter_table_ec_order_product', 5),
(77, '2022_10_12_041517_create_invoices_table', 5),
(78, '2022_10_12_142226_update_orders_table', 5),
(79, '2022_10_13_024916_update_table_order_returns', 5),
(80, '2022_10_21_030830_update_columns_in_ec_shipments_table', 5),
(81, '2022_10_28_021046_update_columns_in_ec_shipments_table', 5),
(82, '2022_11_16_034522_update_type_column_in_ec_shipping_rules_table', 5),
(83, '2022_11_19_041643_add_ec_tax_product_table', 5),
(84, '2022_12_12_063830_update_tax_defadult_in_ec_tax_products_table', 5),
(85, '2022_12_17_041532_fix_address_in_order_invoice', 5),
(86, '2022_12_26_070329_create_ec_product_views_table', 5),
(87, '2023_01_04_033051_fix_product_categories', 5),
(88, '2023_01_09_050400_add_ec_global_options_translations_table', 5),
(89, '2023_01_10_093754_add_missing_option_value_id', 5),
(90, '2023_01_17_082713_add_column_barcode_and_cost_per_item_to_product_table', 5),
(91, '2023_01_26_021854_add_ec_customer_used_coupons_table', 5),
(92, '2023_02_08_015900_update_options_column_in_ec_order_product_table', 5),
(93, '2023_02_27_095752_remove_duplicate_reviews', 5),
(94, '2023_03_20_115757_add_user_type_column_to_ec_shipment_histories_table', 5),
(95, '2023_04_21_082427_create_ec_product_categorizables_table', 5),
(96, '2023_05_03_011331_add_missing_column_price_into_invoice_items_table', 5),
(97, '2023_05_17_025812_fix_invoice_issue', 5),
(98, '2023_05_26_073140_move_option_make_phone_field_optional_at_checkout_page_to_mandatory_fields', 5),
(99, '2023_05_27_144611_fix_exchange_rate_setting', 5),
(100, '2023_06_22_084331_add_generate_license_code_to_ec_products_table', 5),
(101, '2023_06_30_042512_create_ec_order_tax_information_table', 5),
(102, '2023_07_14_022724_remove_column_id_from_ec_product_collection_products', 5),
(103, '2023_08_09_012940_remove_column_status_in_ec_product_attributes', 5),
(104, '2023_08_15_064505_create_ec_tax_rules_table', 5),
(105, '2023_08_21_021819_make_column_address_in_ec_customer_addresses_nullable', 5),
(106, '2023_08_22_094114_drop_unique_for_barcode', 5),
(107, '2023_08_30_031811_add_apply_via_url_column_to_ec_discounts_table', 5),
(108, '2023_09_07_094312_add_index_to_product_sku_and_translations', 5),
(109, '2023_09_19_024955_create_discount_product_categories_table', 5),
(110, '2023_10_17_070728_add_icon_and_icon_image_to_product_categories_table', 5),
(111, '2023_11_22_154643_add_unique_in_table_ec_products_variations', 5),
(112, '2023_11_27_032313_add_price_columns_to_ec_product_cross_sale_relations_table', 5),
(113, '2023_12_06_023945_add_display_on_checkout_column_to_ec_discounts_table', 5),
(114, '2023_12_25_040604_ec_create_review_replies_table', 5),
(115, '2023_12_26_090340_add_private_notes_column_to_ec_customers_table', 5),
(116, '2024_01_16_070706_fix_translation_tables', 5),
(117, '2024_01_23_075227_add_proof_file_to_ec_orders_table', 5),
(118, '2018_07_09_221238_create_faq_table', 6),
(119, '2021_12_03_082134_create_faq_translations', 6),
(120, '2023_11_17_063408_add_description_column_to_faq_categories_table', 6),
(121, '2016_10_13_150201_create_galleries_table', 7),
(122, '2021_12_03_082953_create_gallery_translations', 7),
(123, '2022_04_30_034048_create_gallery_meta_translations_table', 7),
(124, '2023_08_29_075308_make_column_user_id_nullable', 7),
(125, '2016_10_03_032336_create_languages_table', 8),
(126, '2023_09_14_022423_add_index_for_language_table', 8),
(127, '2021_10_25_021023_fix-priority-load-for-language-advanced', 9),
(128, '2021_12_03_075608_create_page_translations', 9),
(129, '2023_07_06_011444_create_slug_translations_table', 9),
(130, '2019_11_18_061011_create_country_table', 10),
(131, '2021_12_03_084118_create_location_translations', 10),
(132, '2021_12_03_094518_migrate_old_location_data', 10),
(133, '2021_12_10_034440_switch_plugin_location_to_use_language_advanced', 10),
(134, '2022_01_16_085908_improve_plugin_location', 10),
(135, '2022_08_04_052122_delete_location_backup_tables', 10),
(136, '2023_04_23_061847_increase_state_translations_abbreviation_column', 10),
(137, '2023_07_26_041451_add_more_columns_to_location_table', 10),
(138, '2023_07_27_041451_add_more_columns_to_location_translation_table', 10),
(139, '2023_08_15_073307_drop_unique_in_states_cities_translations', 10),
(140, '2023_10_21_065016_make_state_id_in_table_cities_nullable', 10),
(141, '2017_10_24_154832_create_newsletter_table', 11),
(142, '2017_05_18_080441_create_payment_tables', 12),
(143, '2021_03_27_144913_add_customer_type_into_table_payments', 12),
(144, '2021_05_24_034720_make_column_currency_nullable', 12),
(145, '2021_08_09_161302_add_metadata_column_to_payments_table', 12),
(146, '2021_10_19_020859_update_metadata_field', 12),
(147, '2022_06_28_151901_activate_paypal_stripe_plugin', 12),
(148, '2022_07_07_153354_update_charge_id_in_table_payments', 12),
(149, '2017_07_11_140018_create_simple_slider_table', 13),
(150, '2016_10_07_193005_create_translations_table', 14),
(151, '2023_12_12_105220_drop_translations_table', 14),
(152, '2021_07_08_140130_comment_create_comment_table', 15),
(153, '2023_02_28_092156_update_table_comments', 15),
(154, '2023_12_08_045134_table_vig_studio_translate_request', 16),
(155, '0000_00_00_000001_install_plugin_sc_referral_table', 17);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(120) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletters`
--

INSERT INTO `newsletters` (`id`, `email`, `name`, `status`, `created_at`, `updated_at`) VALUES
(3, 'CxnRmT.dqdhqqd@rushlight.cfd', NULL, 'subscribed', '2024-02-10 23:31:15', '2024-02-10 23:31:15'),
(4, '29.01hk8a8xa06gr09b2kzpza23c4@mail5u.pw', NULL, 'subscribed', '2024-02-14 01:54:22', '2024-02-14 01:54:22');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `content` longtext DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `template` varchar(60) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `content`, `user_id`, `image`, `template`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Homepage', '<div>[simple-slider key=\"home-slider\"][/simple-slider]</div><div>[featured-product-categories title=\"Top Categories\" subtitle=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim Nullam nunc varius.\"][/featured-product-categories]</div><div>[product-collections title=\"A change of Season\" subtitle=\"Update your wardrobe with new seasonal trend\"][/product-collections]</div><div>[flash-sale title=\"Deal of the day\" subtitle=\"Best Deals For You\" show_popup=\"yes\"][/flash-sale]</div><div>[featured-products title=\"Our Picks For You\" subtitle=\"Always find the best ways for you\" limit=\"8\"][/featured-products]</div><div>[trending-products title=\"Trending Products\" subtitle=\"Products on trending\" limit=\"4\"][/trending-products]</div><div>[featured-brands title=\"Our Brands\"][/featured-brands]</div><div>[news title=\"Visit Our Blog\" subtitle=\"Our Blog updated the newest trend of the world regularly\"][/news]</div><div>[theme-galleries title=\"@ OUR GALLERIES\" subtitle=\"Our latest fashion galleries images\" limit=\"8\"][/theme-galleries]</div><div>[site-features icon1=\"icon-truck\" title1=\"FREE SHIPPING\" subtitle1=\"Free shipping on all US order or order above $200\" icon2=\"icon-life-buoy\" title2=\"SUPPORT 24/7\" subtitle2=\"Contact us 24 hours a day, 7 days a week\" icon3=\"icon-refresh-ccw\" title3=\"30 DAYS RETURN\" subtitle3=\"Simply return it within 30 days for an exchange\" icon4=\"icon-shield\" title4=\"100% PAYMENT SECURE\" subtitle4=\"We ensure secure payment with PEV\"][/site-features]</div>', 1, NULL, 'homepage', NULL, 'published', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(2, 'Blog', '<p style=\"text-align: center\">We always share fashion tips with the hope you guys will find the best style for yourself.<br />Besides, we update the fashion trend as soon as we can.<br />Enjoy your journey!</p>', 1, NULL, 'default', NULL, 'published', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(3, 'Contact', '<p>[contact-form][/contact-form]</p>', 1, NULL, 'default', NULL, 'published', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(4, 'Cookie Policy', '<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>', 1, NULL, 'default', NULL, 'published', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(5, 'FAQs', '<div>[faqs][/faqs]</div>', 1, NULL, 'default', NULL, 'published', '2024-01-29 02:42:47', '2024-01-29 02:42:47');

-- --------------------------------------------------------

--
-- Table structure for table `pages_translations`
--

CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) NOT NULL,
  `pages_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency` varchar(120) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `charge_id` varchar(255) DEFAULT NULL,
  `payment_channel` varchar(60) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(60) DEFAULT 'pending',
  `payment_type` varchar(191) DEFAULT 'confirm',
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `refunded_amount` decimal(15,2) UNSIGNED DEFAULT NULL,
  `refund_note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(255) DEFAULT NULL,
  `metadata` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `currency`, `user_id`, `charge_id`, `payment_channel`, `description`, `amount`, `order_id`, `status`, `payment_type`, `customer_id`, `refunded_amount`, `refund_note`, `created_at`, `updated_at`, `customer_type`, `metadata`) VALUES
(3, 'USD', 0, 'QILLKOKT6X', 'cod', NULL, 1408.00, 3, 'pending', 'confirm', 3, NULL, NULL, '2024-01-29 02:42:42', '2024-01-29 02:42:42', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(4, 'USD', 0, 'TEBCOD7BFQ', 'razorpay', NULL, 952.00, 4, 'completed', 'confirm', 1, NULL, NULL, '2024-01-29 02:42:42', '2024-01-29 02:42:42', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(6, 'USD', 0, 'CW7GYRC61Q', 'bank_transfer', NULL, 1733.00, 6, 'pending', 'confirm', 4, NULL, NULL, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(8, 'USD', 0, '1JZPEFCHFC', 'mollie', NULL, 877.00, 8, 'completed', 'confirm', 3, NULL, NULL, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(9, 'USD', 0, '1MY0L6FBNS', 'paystack', NULL, 896.00, 9, 'completed', 'confirm', 5, NULL, NULL, '2024-01-29 02:42:43', '2024-01-29 02:42:43', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(10, 'USD', 0, 'QDZMHXHYF4', 'stripe', NULL, 1281.00, 10, 'completed', 'confirm', 7, NULL, NULL, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(11, 'USD', 0, 'J66EA1YRKD', 'razorpay', NULL, 966.00, 11, 'completed', 'confirm', 2, NULL, NULL, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(14, 'USD', 0, 'WVCSPH6LAH', 'paypal', NULL, 1839.00, 14, 'completed', 'confirm', 10, NULL, NULL, '2024-01-29 02:42:44', '2024-01-29 02:42:44', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(16, 'USD', 0, 'F9KB07BHCK', 'mollie', NULL, 2157.00, 16, 'completed', 'confirm', 7, NULL, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(17, 'USD', 0, '2WVFCLM1KM', 'bank_transfer', NULL, 1545.00, 17, 'pending', 'confirm', 4, NULL, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(18, 'USD', 0, 'YLWOD4GSQU', 'paystack', NULL, 1660.00, 18, 'completed', 'confirm', 5, NULL, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'Botble\\Ecommerce\\Models\\Customer', NULL),
(20, 'USD', 0, '5RYU4B9GZN', 'sslcommerz', NULL, 1466.00, 20, 'completed', 'confirm', 6, NULL, NULL, '2024-01-29 02:42:45', '2024-01-29 02:42:45', 'Botble\\Ecommerce\\Models\\Customer', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `author_type` varchar(255) NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `format_type` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `description`, `content`, `status`, `author_id`, `author_type`, `is_featured`, `image`, `views`, `format_type`, `created_at`, `updated_at`) VALUES
(1, '4 Expert Tips On How To Choose The Right Men’s Wallet', 'You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', NULL, 'Botble\\ACL\\Models\\User', 1, 'news/1.jpg', 2457, NULL, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(2, 'Sexy Clutches: How to Buy &amp; Wear a Designer Clutch Bag', 'You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', NULL, 'Botble\\ACL\\Models\\User', 1, 'news/2.jpg', 2103, NULL, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(3, 'The Top 2020 Handbag Trends to Know', 'You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', NULL, 'Botble\\ACL\\Models\\User', 1, 'news/3.jpg', 2157, NULL, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(4, 'How to Match the Color of Your Handbag With an Outfit', 'You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', NULL, 'Botble\\ACL\\Models\\User', 1, 'news/4.jpg', 831, NULL, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(5, 'How to Care for Leather Bags', 'You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', NULL, 'Botble\\ACL\\Models\\User', 1, 'news/5.jpg', 1868, NULL, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(6, 'We\'re Crushing Hard on Summer\'s 10 Biggest Bag Trends', 'You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', NULL, 'Botble\\ACL\\Models\\User', 1, 'news/6.jpg', 197, NULL, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(7, 'Essential Qualities of Highly Successful Music', 'You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', NULL, 'Botble\\ACL\\Models\\User', 1, 'news/7.jpg', 1843, NULL, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(8, '9 Things I Love About Shaving My Head', 'You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', NULL, 'Botble\\ACL\\Models\\User', 1, 'news/8.jpg', 869, NULL, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(9, 'Why Teamwork Really Makes The Dream Work', 'You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', NULL, 'Botble\\ACL\\Models\\User', 1, 'news/9.jpg', 2064, NULL, '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(10, 'The World Caters to Average People', 'You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', NULL, 'Botble\\ACL\\Models\\User', 1, 'news/10.jpg', 1469, NULL, '2024-01-29 02:42:47', '2024-01-29 02:42:47');
INSERT INTO `posts` (`id`, `name`, `description`, `content`, `status`, `author_id`, `author_type`, `is_featured`, `image`, `views`, `format_type`, `created_at`, `updated_at`) VALUES
(11, 'The litigants on the screen are not actors', 'You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', NULL, 'Botble\\ACL\\Models\\User', 0, 'news/11.jpg', 156, NULL, '2024-01-29 02:42:47', '2024-01-29 02:42:47');

-- --------------------------------------------------------

--
-- Table structure for table `posts_translations`
--

CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) NOT NULL,
  `posts_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`category_id`, `post_id`) VALUES
(2, 1),
(3, 1),
(2, 2),
(3, 2),
(1, 3),
(3, 3),
(1, 4),
(3, 4),
(1, 5),
(3, 5),
(2, 6),
(4, 6),
(2, 7),
(4, 7),
(2, 8),
(3, 8),
(1, 9),
(3, 9),
(1, 10),
(3, 10),
(1, 11),
(3, 11);

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`tag_id`, `post_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(5, 5),
(1, 6),
(2, 6),
(3, 6),
(4, 6),
(5, 6),
(1, 7),
(2, 7),
(3, 7),
(4, 7),
(5, 7),
(1, 8),
(2, 8),
(3, 8),
(4, 8),
(5, 8),
(1, 9),
(2, 9),
(3, 9),
(4, 9),
(5, 9),
(1, 10),
(2, 10),
(3, 10),
(4, 10),
(5, 10),
(1, 11),
(2, 11),
(3, 11),
(4, 11),
(5, 11);

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `revisionable_type` varchar(191) NOT NULL,
  `revisionable_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `key` varchar(120) NOT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(120) NOT NULL,
  `name` varchar(120) NOT NULL,
  `permissions` text DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `permissions`, `description`, `is_default`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', '{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.manage.license\":true,\"extensions.index\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.cronjob\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"plugins.captcha\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.settings\":true,\"plugins.ecommerce\":true,\"ecommerce.settings\":true,\"ecommerce.report.index\":true,\"products.index\":true,\"products.create\":true,\"products.edit\":true,\"products.destroy\":true,\"products.duplicate\":true,\"product-categories.index\":true,\"product-categories.create\":true,\"product-categories.edit\":true,\"product-categories.destroy\":true,\"product-tag.index\":true,\"product-tag.create\":true,\"product-tag.edit\":true,\"product-tag.destroy\":true,\"brands.index\":true,\"brands.create\":true,\"brands.edit\":true,\"brands.destroy\":true,\"product-collections.index\":true,\"product-collections.create\":true,\"product-collections.edit\":true,\"product-collections.destroy\":true,\"product-attribute-sets.index\":true,\"product-attribute-sets.create\":true,\"product-attribute-sets.edit\":true,\"product-attribute-sets.destroy\":true,\"product-attributes.index\":true,\"product-attributes.create\":true,\"product-attributes.edit\":true,\"product-attributes.destroy\":true,\"tax.index\":true,\"tax.create\":true,\"tax.edit\":true,\"tax.destroy\":true,\"reviews.index\":true,\"reviews.create\":true,\"reviews.destroy\":true,\"reviews.publish\":true,\"reviews.reply\":true,\"shipping_methods.index\":true,\"ecommerce.shipping-rule-items.index\":true,\"ecommerce.shipping-rule-items.create\":true,\"ecommerce.shipping-rule-items.edit\":true,\"ecommerce.shipping-rule-items.destroy\":true,\"ecommerce.shipping-rule-items.bulk-import\":true,\"ecommerce.shipments.index\":true,\"ecommerce.shipments.create\":true,\"ecommerce.shipments.edit\":true,\"ecommerce.shipments.destroy\":true,\"orders.index\":true,\"orders.create\":true,\"orders.edit\":true,\"orders.destroy\":true,\"discounts.index\":true,\"discounts.create\":true,\"discounts.edit\":true,\"discounts.destroy\":true,\"customers.index\":true,\"customers.create\":true,\"customers.edit\":true,\"customers.destroy\":true,\"flash-sale.index\":true,\"flash-sale.create\":true,\"flash-sale.edit\":true,\"flash-sale.destroy\":true,\"product-label.index\":true,\"product-label.create\":true,\"product-label.edit\":true,\"product-label.destroy\":true,\"ecommerce.import.products.index\":true,\"ecommerce.export.products.index\":true,\"order_returns.index\":true,\"order_returns.edit\":true,\"order_returns.destroy\":true,\"global-option.index\":true,\"global-option.create\":true,\"global-option.edit\":true,\"global-option.destroy\":true,\"ecommerce.invoice.index\":true,\"ecommerce.invoice.edit\":true,\"ecommerce.invoice.destroy\":true,\"ecommerce.invoice-template.index\":true,\"ecommerce.settings.general\":true,\"ecommerce.settings.currencies\":true,\"ecommerce.settings.products\":true,\"ecommerce.settings.product-search\":true,\"ecommerce.settings.digital-products\":true,\"ecommerce.settings.store-locators\":true,\"ecommerce.settings.invoices\":true,\"ecommerce.settings.product-reviews\":true,\"ecommerce.settings.customers\":true,\"ecommerce.settings.shopping\":true,\"ecommerce.settings.taxes\":true,\"ecommerce.settings.shipping\":true,\"ecommerce.settings.tracking\":true,\"ecommerce.settings.standard-and-format\":true,\"ecommerce.settings.checkout\":true,\"ecommerce.settings.return\":true,\"ecommerce.settings.flash-sale\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"faqs.settings\":true,\"galleries.index\":true,\"galleries.create\":true,\"galleries.edit\":true,\"galleries.destroy\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"location.bulk-import.index\":true,\"location.export.index\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"simple-slider.index\":true,\"simple-slider.create\":true,\"simple-slider.edit\":true,\"simple-slider.destroy\":true,\"simple-slider-item.index\":true,\"simple-slider-item.create\":true,\"simple-slider-item.edit\":true,\"simple-slider-item.destroy\":true,\"simple-slider.settings\":true,\"social-login.settings\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true}', 'Admin users role', 1, 2, 2, '2024-01-29 02:42:47', '2024-01-29 02:42:47');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sc_referrals`
--

CREATE TABLE `sc_referrals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sponsor_type` varchar(191) NOT NULL,
  `sponsor_id` bigint(20) UNSIGNED NOT NULL,
  `referral_type` varchar(191) NOT NULL,
  `referral_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sc_referral_aliases`
--

CREATE TABLE `sc_referral_aliases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `alias` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sc_referral_trackings`
--

CREATE TABLE `sc_referral_trackings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sponsor_type` varchar(191) NOT NULL,
  `sponsor_id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `referrer` varchar(191) DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2, 'api_enabled', '1', NULL, '2024-02-14 17:33:38'),
(3, 'activated_plugins', '[\"language\",\"language-advanced\",\"captcha\",\"contact\",\"cookie-consent\",\"ecommerce\",\"faq\",\"gallery\",\"location\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"shippo\",\"simple-slider\",\"social-login\",\"sslcommerz\",\"stripe\",\"translation\",\"mollie\",\"maintenance-mode\",\"comment\",\"vig-auto-translations\",\"sc-core\",\"sc-referral\",\"blog\",\"analytics\",\"audit-log\",\"backup\"]', NULL, '2024-02-14 17:33:38'),
(8, 'language_hide_default', '1', NULL, '2024-02-14 17:33:38'),
(10, 'language_display', 'all', NULL, '2024-02-14 17:33:38'),
(11, 'language_hide_languages', '[]', NULL, '2024-02-14 17:33:38'),
(12, 'media_random_hash', 'e838b1ceb7872eeaa48257ce2d601fb7', NULL, '2024-02-14 17:33:38'),
(13, 'payment_cod_status', '1', NULL, '2024-02-14 17:33:38'),
(14, 'payment_bank_transfer_status', '1', NULL, '2024-02-14 17:33:38'),
(15, 'theme', 'september', NULL, '2024-02-14 17:33:38'),
(16, 'show_admin_bar', '1', NULL, '2024-02-14 17:33:38'),
(17, 'language_switcher_display', 'dropdown', NULL, '2024-02-14 17:33:38'),
(18, 'admin_favicon', '', NULL, '2024-02-14 17:33:38'),
(19, 'admin_logo', '', NULL, '2024-02-14 17:33:38'),
(20, 'permalink-botble-blog-models-post', 'blog', NULL, '2024-02-14 17:33:38'),
(21, 'permalink-botble-blog-models-category', 'blog', NULL, '2024-02-14 17:33:38'),
(22, 'payment_cod_description', 'Please pay money directly to the postman, if you choose cash on delivery method (COD).', NULL, '2024-02-14 17:33:38'),
(23, 'payment_bank_transfer_description', 'Please send money to our bank account: ACB - 69270 213 19.', NULL, '2024-02-14 17:33:38'),
(24, 'payment_stripe_payment_type', 'stripe_checkout', NULL, '2024-02-14 17:33:38'),
(25, 'plugins_ecommerce_customer_new_order_status', '0', NULL, '2024-02-14 17:33:38'),
(26, 'plugins_ecommerce_admin_new_order_status', '0', NULL, '2024-02-14 17:33:38'),
(27, 'ecommerce_is_enabled_support_digital_products', '1', NULL, '2024-02-14 17:33:38'),
(28, 'ecommerce_load_countries_states_cities_from_location_plugin', '0', NULL, '2024-02-14 17:33:38'),
(29, 'payment_bank_transfer_display_bank_info_at_the_checkout_success_page', '1', NULL, '2024-02-14 17:33:38'),
(30, 'ecommerce_product_sku_format', 'HS-2443-[%S]', NULL, '2024-02-14 17:33:38'),
(31, 'ecommerce_store_name', 'Matacor', NULL, '2024-02-14 17:33:38'),
(32, 'ecommerce_store_phone', '+213550654790', NULL, '2024-02-14 17:33:38'),
(33, 'ecommerce_store_address', 'P328+3J9، Rue des Pruniers, Djasr Kasentina', NULL, '2024-02-14 17:33:38'),
(34, 'ecommerce_store_state', 'Algiers', NULL, '2024-02-14 17:33:38'),
(35, 'ecommerce_store_city', 'Ain Naadja', NULL, '2024-02-14 17:33:38'),
(36, 'ecommerce_store_country', 'DZ', NULL, '2024-02-14 17:33:38'),
(37, 'theme-september-site_title', 'Matacor', NULL, '2024-02-14 17:33:38'),
(38, 'theme-september-seo_title', 'Matacor - Multipurpose Fashion Shop', NULL, '2024-02-14 17:33:38'),
(39, 'theme-september-seo_description', 'Matacor est spécialement conçu pour un magasin de mode, mais convient également bien à un magasin d\'électronique, un magasin de meubles, etc. C\'est propre et minimal. Chaque page est entièrement réactive, ce qui donne à votre création une belle apparence sur n\'importe quel appareil.', NULL, '2024-02-14 17:33:38'),
(40, 'theme-september-copyright', '© 2024 Matacor Technologies. Tous droits réservés.', NULL, '2024-02-14 17:33:38'),
(41, 'theme-september-favicon', '', NULL, '2024-02-14 17:33:38'),
(42, 'theme-september-logo', '', NULL, '2024-02-14 17:33:38'),
(43, 'theme-september-seo_og_image', 'general/open-graph-image.png', NULL, '2024-02-14 17:33:38'),
(44, 'theme-september-address', 'P328+3J9، Rue des Pruniers, Djasr Kasentina', NULL, '2024-02-14 17:33:38'),
(45, 'theme-september-hotline', '+213 550 65 47 90', NULL, '2024-02-14 17:33:38'),
(46, 'theme-september-email', 'contact@matacor.com', NULL, '2024-02-14 17:33:38'),
(47, 'theme-september-facebook', 'https://facebook.com', NULL, '2024-02-14 17:33:38'),
(48, 'theme-september-twitter', 'https://twitter.com', NULL, '2024-02-14 17:33:38'),
(49, 'theme-september-youtube', 'https://youtube.com', NULL, '2024-02-14 17:33:38'),
(50, 'theme-september-linkedin', 'https://linkedin.com', NULL, '2024-02-14 17:33:38'),
(51, 'theme-september-pinterest', 'https://pinterest.com', NULL, '2024-02-14 17:33:38'),
(52, 'theme-september-instagram', 'https://instagram.com', NULL, '2024-02-14 17:33:38'),
(53, 'theme-september-homepage_id', '1', NULL, '2024-02-14 17:33:38'),
(54, 'theme-september-blog_page_id', '2', NULL, '2024-02-14 17:33:38'),
(55, 'theme-september-cookie_consent_message', 'Votre expérience sur ce site sera améliorée en autorisant les cookies', NULL, '2024-02-14 17:33:38'),
(56, 'theme-september-cookie_consent_learn_more_url', 'https://matacor.com/cookie-policy', NULL, '2024-02-14 17:33:38'),
(57, 'theme-september-cookie_consent_learn_more_text', 'Cookie Policy', NULL, '2024-02-14 17:33:38'),
(58, 'theme-september-enabled_sticky_header', 'yes', NULL, '2024-02-14 17:33:38'),
(59, 'theme-september-product_page_banner_title', 'Enjoy Shopping with us', NULL, '2024-02-14 17:33:38'),
(63, 'theme-september-social_links', '[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"fa fa-facebook\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/facebook.com.com\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"fa fa-twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/twitter.com\"}],[{\"key\":\"social-name\",\"value\":\"Instagram\"},{\"key\":\"social-icon\",\"value\":\"fa fa-instagram\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/instagram.com\"}],[{\"key\":\"social-name\",\"value\":\"Pinterest\"},{\"key\":\"social-icon\",\"value\":\"fa fa-pinterest\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/pinterest.com\"}],[{\"key\":\"social-name\",\"value\":\"Linkedin\"},{\"key\":\"social-icon\",\"value\":\"fa fa-linkedin\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/linkedin.com\"}],[{\"key\":\"social-name\",\"value\":\"Youtube\"},{\"key\":\"social-icon\",\"value\":\"fa fa-youtube\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/youtube.com\"}]]', NULL, '2024-02-14 17:33:38'),
(65, 'membership_authorization_at', '2024-02-10 20:55:28', NULL, '2024-02-14 17:33:38'),
(66, 'theme-september-admin_logo', 'general/logo-light.png', NULL, '2024-02-14 17:33:38'),
(67, 'is_completed_get_started', '1', NULL, '2024-02-14 17:33:38'),
(68, 'enable_faq_schema', '1', NULL, '2024-02-14 17:33:38'),
(69, 'enable_captcha', '1', NULL, '2024-02-14 17:33:38'),
(70, 'captcha_type', 'v2', NULL, '2024-02-14 17:33:38'),
(71, 'captcha_hide_badge', '0', NULL, '2024-02-14 17:33:38'),
(72, 'captcha_show_disclaimer', '0', NULL, '2024-02-14 17:33:38'),
(73, 'captcha_site_key', '6LduIGgpAAAAAMeXC72VtMkuT-RN4G-b4c6wJk5a', NULL, '2024-02-14 17:33:38'),
(74, 'captcha_secret', '6LduIGgpAAAAAKgo-V_Y3WSfaGQNwfrZ-BNGuG9c', NULL, '2024-02-14 17:33:38'),
(75, 'enable_math_captcha', '0', NULL, '2024-02-14 17:33:38'),
(76, 'recaptcha_score', '0.6', NULL, '2024-02-14 17:33:38'),
(77, 'ecommerce_enable_recaptcha_in_register_page', '1', NULL, '2024-02-14 17:33:38'),
(78, 'ecommerce_enable_math_captcha_in_register_page', '0', NULL, '2024-02-14 17:33:38'),
(79, 'enable_math_captcha_for_contact_form', '0', NULL, '2024-02-14 17:33:38'),
(80, 'social_login_enable', '1', NULL, '2024-02-14 17:33:38'),
(81, 'social_login_facebook_enable', '0', NULL, '2024-02-14 17:33:38'),
(82, 'social_login_facebook_app_id', '', NULL, '2024-02-14 17:33:38'),
(83, 'social_login_facebook_app_secret', '', NULL, '2024-02-14 17:33:38'),
(84, 'social_login_google_enable', '0', NULL, '2024-02-14 17:33:38'),
(85, 'social_login_google_app_id', '', NULL, '2024-02-14 17:33:38'),
(86, 'social_login_google_app_secret', '', NULL, '2024-02-14 17:33:38'),
(87, 'social_login_github_enable', '0', NULL, '2024-02-14 17:33:38'),
(88, 'social_login_github_app_id', '', NULL, '2024-02-14 17:33:38'),
(89, 'social_login_github_app_secret', '', NULL, '2024-02-14 17:33:38'),
(90, 'social_login_linkedin_enable', '0', NULL, '2024-02-14 17:33:38'),
(91, 'social_login_linkedin_app_id', '', NULL, '2024-02-14 17:33:38'),
(92, 'social_login_linkedin_app_secret', '', NULL, '2024-02-14 17:33:38'),
(93, 'social_login_linkedin-openid_enable', '0', NULL, '2024-02-14 17:33:38'),
(94, 'social_login_linkedin-openid_app_id', '', NULL, '2024-02-14 17:33:38'),
(95, 'social_login_linkedin-openid_app_secret', '', NULL, '2024-02-14 17:33:38'),
(96, 'blog_post_schema_enabled', '1', NULL, '2024-02-14 17:33:38'),
(97, 'blog_post_schema_type', 'Article', NULL, '2024-02-14 17:33:38'),
(98, 'ecommerce_ecommerce_tax_enabled', '1', NULL, '2024-02-14 17:33:38'),
(99, 'ecommerce_display_tax_fields_at_checkout_page', '1', NULL, '2024-02-14 17:33:38'),
(100, 'ecommerce_default_tax_rate', '0', NULL, '2024-02-14 17:33:38'),
(101, 'ecommerce_display_product_price_including_taxes', '1', NULL, '2024-02-14 17:33:38'),
(102, 'ecommerce_company_name_for_invoicing', 'Matacor', NULL, '2024-02-14 17:33:38'),
(103, 'ecommerce_company_address_for_invoicing', 'P328+3J9، Rue des Pruniers, Djasr Kasentina', NULL, '2024-02-14 17:33:39'),
(104, 'ecommerce_company_country_for_invoicing', 'DZ', NULL, '2024-02-14 17:33:39'),
(105, 'ecommerce_company_state_for_invoicing', 'Algiers', NULL, '2024-02-14 17:33:39'),
(106, 'ecommerce_company_city_for_invoicing', 'Ain Naadja', NULL, '2024-02-14 17:33:39'),
(107, 'ecommerce_company_email_for_invoicing', 'matacor23@gmail.com', NULL, '2024-02-14 17:33:39'),
(108, 'ecommerce_company_phone_for_invoicing', '+213550654790', NULL, '2024-02-14 17:33:39'),
(109, 'ecommerce_company_tax_id_for_invoicing', '', NULL, '2024-02-14 17:33:39'),
(110, 'ecommerce_company_logo_for_invoicing', '', NULL, '2024-02-14 17:33:39'),
(111, 'ecommerce_using_custom_font_for_invoice', '1', NULL, '2024-02-14 17:33:39'),
(112, 'ecommerce_invoice_support_arabic_language', '1', NULL, '2024-02-14 17:33:39'),
(113, 'ecommerce_invoice_support_bangladesh_language', '0', NULL, '2024-02-14 17:33:39'),
(114, 'ecommerce_enable_invoice_stamp', '1', NULL, '2024-02-14 17:33:39'),
(115, 'ecommerce_invoice_code_prefix', 'INV-', NULL, '2024-02-14 17:33:39'),
(116, 'ecommerce_disable_order_invoice_until_order_confirmed', '0', NULL, '2024-02-14 17:33:39'),
(117, 'ecommerce_invoice_font_family', '', NULL, '2024-02-14 17:33:39'),
(118, 'ecommerce_is_enabled_order_return', '1', NULL, '2024-02-14 17:33:39'),
(119, 'ecommerce_can_custom_return_product_quantity', '1', NULL, '2024-02-14 17:33:39'),
(120, 'ecommerce_returnable_days', '4', NULL, '2024-02-14 17:33:39'),
(121, 'ecommerce_enable_guest_checkout', '1', NULL, '2024-02-14 17:33:39'),
(122, 'ecommerce_minimum_order_amount', '500', NULL, '2024-02-14 17:33:39'),
(123, 'ecommerce_zip_code_enabled', '1', NULL, '2024-02-14 17:33:39'),
(124, 'ecommerce_billing_address_enabled', '1', NULL, '2024-02-14 17:33:39'),
(125, 'ecommerce_use_city_field_as_field_text', '0', NULL, '2024-02-14 17:33:39'),
(126, 'ecommerce_enable_customer_recently_viewed_products', '1', NULL, '2024-02-14 17:33:39'),
(127, 'ecommerce_max_customer_recently_viewed_products', '24', NULL, '2024-02-14 17:33:39'),
(128, 'ecommerce_mandatory_form_fields_at_checkout', '[\"phone\",\"state\",\"city\",\"address\"]', NULL, '2024-02-14 17:33:39'),
(129, 'ecommerce_available_countries', '[\"DZ\"]', NULL, '2024-02-14 17:33:39'),
(130, 'ecommerce_hide_form_fields_at_checkout', '[]', NULL, '2024-02-14 17:33:39'),
(131, 'ecommerce_review_enabled', '1', NULL, '2024-02-14 17:33:39'),
(132, 'ecommerce_review_max_file_size', '2', NULL, '2024-02-14 17:33:39'),
(133, 'ecommerce_review_max_file_number', '6', NULL, '2024-02-14 17:33:39'),
(134, 'ecommerce_only_allow_customers_purchased_to_review', '1', NULL, '2024-02-14 17:33:39'),
(135, 'ecommerce_review_need_to_be_approved', '1', NULL, '2024-02-14 17:33:39'),
(136, 'ecommerce_allow_guest_checkout_for_digital_products', '1', NULL, '2024-02-14 17:33:39'),
(137, 'ecommerce_search_for_an_exact_phrase', '0', NULL, '2024-02-14 17:33:39'),
(138, 'ecommerce_enable_filter_products_by_brands', '1', NULL, '2024-02-14 17:33:39'),
(139, 'ecommerce_enable_filter_products_by_tags', '1', NULL, '2024-02-14 17:33:39'),
(140, 'ecommerce_enable_filter_products_by_attributes', '1', NULL, '2024-02-14 17:33:39'),
(141, 'ecommerce_search_products_by', '[\"name\",\"sku\",\"variation_sku\",\"description\",\"brand\",\"tag\"]', NULL, '2024-02-14 17:33:39'),
(142, 'ecommerce_how_to_display_product_variation_images', 'variation_images_and_main_product_images', NULL, '2024-02-14 17:33:39'),
(143, 'ecommerce_show_number_of_products', '1', NULL, '2024-02-14 17:33:39'),
(144, 'ecommerce_show_out_of_stock_products', '1', NULL, '2024-02-14 17:33:39'),
(145, 'ecommerce_is_enabled_product_options', '1', NULL, '2024-02-14 17:33:39'),
(146, 'ecommerce_auto_generate_product_sku', '1', NULL, '2024-02-14 17:33:39'),
(147, 'ecommerce__method', 'PUT', NULL, '2024-02-14 17:33:39'),
(148, 'ecommerce__token', 'iiCTDDSOt2pPNonPqjATLoYUY9fC3RiOMuZ9ylHv', NULL, '2024-02-14 17:33:39'),
(149, 'ecommerce_enable_auto_detect_visitor_currency', '1', NULL, '2024-02-14 17:33:39'),
(150, 'ecommerce_add_space_between_price_and_currency', '1', NULL, '2024-02-14 17:33:39'),
(151, 'ecommerce_thousands_separator', ',', NULL, '2024-02-14 17:33:39'),
(152, 'ecommerce_decimal_separator', '.', NULL, '2024-02-14 17:33:39'),
(153, 'ecommerce_exchange_rate_api_provider', 'api_layer', NULL, '2024-02-14 17:33:39'),
(154, 'ecommerce_api_layer_api_key', 'N0pHqUb6kAUEOHIcTocsHP9sEHdg2ZbU', NULL, '2024-02-14 17:33:39'),
(155, 'ecommerce_open_exchange_app_id', '', NULL, '2024-02-14 17:33:39'),
(156, 'ecommerce_use_exchange_rate_from_api', '1', NULL, '2024-02-14 17:33:39'),
(157, 'ecommerce_currencies_is_default', '9', NULL, '2024-02-14 17:33:39'),
(158, 'ecommerce_store_company', 'Matacor', NULL, '2024-02-14 17:33:39'),
(159, 'ecommerce_store_email', 'matacor23@gmail.com', NULL, '2024-02-14 17:33:39'),
(160, 'ecommerce_store_vat_number', '', NULL, '2024-02-14 17:33:39'),
(161, 'custom_header_html', '<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.css\">', NULL, '2024-02-14 17:33:39'),
(162, 'custom_body_html', '', NULL, '2024-02-14 17:33:39'),
(163, 'custom_footer_html', '', NULL, '2024-02-14 17:33:39'),
(164, 'custom_header_js', '<script src=\"https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js \"></script>', NULL, '2024-02-14 17:33:39'),
(165, 'custom_body_js', '', NULL, '2024-02-14 17:33:39'),
(166, 'custom_footer_js', '', NULL, '2024-02-14 17:33:39'),
(167, 'optimize_page_speed_enable', '1', NULL, '2024-02-14 17:33:39'),
(168, 'optimize_collapse_white_space', '1', NULL, '2024-02-14 17:33:39'),
(169, 'optimize_elide_attributes', '1', NULL, '2024-02-14 17:33:39'),
(170, 'optimize_inline_css', '1', NULL, '2024-02-14 17:33:39'),
(171, 'optimize_insert_dns_prefetch', '1', NULL, '2024-02-14 17:33:39'),
(172, 'optimize_remove_comments', '1', NULL, '2024-02-14 17:33:39'),
(173, 'optimize_remove_quotes', '1', NULL, '2024-02-14 17:33:39'),
(174, 'optimize_defer_javascript', '1', NULL, '2024-02-14 17:33:39'),
(175, 'datatables_default_show_column_visibility', '1', NULL, '2024-02-14 17:33:39'),
(176, 'datatables_default_show_export_button', '1', NULL, '2024-02-14 17:33:39'),
(177, 'datatables_pagination_type', '', NULL, '2024-02-14 17:33:39'),
(178, 'enable_cache', '1', NULL, '2024-02-14 17:33:39'),
(179, 'cache_time', '10', NULL, '2024-02-14 17:33:39'),
(180, 'disable_cache_in_the_admin_panel', '1', NULL, '2024-02-14 17:33:39'),
(181, 'cache_admin_menu_enable', '1', NULL, '2024-02-14 17:33:39'),
(182, 'enable_cache_site_map', '1', NULL, '2024-02-14 17:33:39'),
(183, 'cache_time_site_map', '60', NULL, '2024-02-14 17:33:39'),
(184, 'language_show_default_item_if_current_version_not_existed', '1', NULL, '2024-02-14 17:33:39'),
(185, 'language_auto_detect_user_language', '1', NULL, '2024-02-14 17:33:39'),
(186, 'login_screen_backgrounds', '[]', NULL, '2024-02-14 17:33:39'),
(187, 'admin_title', 'Matacor', NULL, '2024-02-14 17:33:39'),
(188, 'admin_appearance_locale', 'fr', NULL, '2024-02-14 17:33:39'),
(189, 'rich_editor', 'ckeditor', NULL, '2024-02-14 17:33:39'),
(190, 'admin_appearance_layout', 'vertical', NULL, '2024-02-14 17:33:39'),
(191, 'admin_appearance_show_menu_item_icon', '1', NULL, '2024-02-14 17:33:39'),
(192, 'admin_appearance_container_width', 'container-xl', NULL, '2024-02-14 17:33:39'),
(193, 'show_theme_guideline_link', '1', NULL, '2024-02-14 17:33:39'),
(194, 'admin_primary_font', 'Inter', NULL, '2024-02-14 17:33:39'),
(195, 'admin_primary_color', '#206bc4', NULL, '2024-02-14 17:33:39'),
(196, 'admin_secondary_color', '#6c7a91', NULL, '2024-02-14 17:33:39'),
(197, 'admin_heading_color', 'inherit', NULL, '2024-02-14 17:33:39'),
(198, 'admin_text_color', '#182433', NULL, '2024-02-14 17:33:39'),
(199, 'admin_link_color', '#206bc4', NULL, '2024-02-14 17:33:39'),
(200, 'admin_link_hover_color', '#1a569d', NULL, '2024-02-14 17:33:39'),
(201, 'admin_appearance_locale_direction', 'ltr', NULL, '2024-02-14 17:33:39'),
(202, 'email_rules_blacklist_email_domains', '', NULL, '2024-02-14 17:33:39'),
(203, 'email_rules_blacklist_specified_emails', '', NULL, '2024-02-14 17:33:39'),
(204, 'email_rules_exception_emails', '', NULL, '2024-02-14 17:33:39'),
(205, 'email_rules_strict', '0', NULL, '2024-02-14 17:33:39'),
(206, 'email_rules_dns', '0', NULL, '2024-02-14 17:33:39'),
(207, 'email_rules_spoof', '1', NULL, '2024-02-14 17:33:39'),
(208, 'theme-september-primary_font', 'Poppins', NULL, '2024-02-14 17:33:39'),
(209, 'theme-september-primary_color', '#026e94', NULL, '2024-02-14 17:33:39'),
(210, 'theme-september-secondary_color', '#2c1dff', NULL, '2024-02-14 17:33:39'),
(211, 'theme-september-show_site_name', '0', NULL, '2024-02-14 17:33:39'),
(212, 'theme-september-theme_breadcrumb_enabled', '1', NULL, '2024-02-14 17:33:39'),
(213, 'theme-september-galleries_page_id', NULL, NULL, '2024-02-14 17:33:39'),
(214, 'theme-september-facebook_comment_enabled_in_product', 'yes', NULL, '2024-02-14 17:33:39'),
(215, 'theme-september-facebook_chat_enabled', 'yes', NULL, '2024-02-14 17:33:39'),
(216, 'theme-september-facebook_page_id', '', NULL, '2024-02-14 17:33:39'),
(217, 'theme-september-facebook_comment_enabled_in_post', 'yes', NULL, '2024-02-14 17:33:39'),
(218, 'theme-september-facebook_app_id', '', NULL, '2024-02-14 17:33:39'),
(219, 'theme-september-facebook_admins', '[[{\"key\":\"text\",\"value\":null}]]', NULL, '2024-02-14 17:33:39'),
(220, 'theme-september-number_of_posts_in_a_category', '12', NULL, '2024-02-14 17:33:39'),
(221, 'theme-september-number_of_posts_in_a_tag', '12', NULL, '2024-02-14 17:33:39'),
(222, 'theme-september-product_page_banner_image', '', NULL, '2024-02-14 17:33:39'),
(223, 'theme-september-ecommerce_product_listing_page_slug', 'products', NULL, '2024-02-14 17:33:39'),
(224, 'theme-september-number_of_products_per_page', '12', NULL, '2024-02-14 17:33:39'),
(225, 'theme-september-number_of_cross_sale_product', '4', NULL, '2024-02-14 17:33:39'),
(226, 'theme-september-max_filter_price', '473', NULL, '2024-02-14 17:33:39'),
(227, 'theme-september-logo_in_the_checkout_page', NULL, NULL, '2024-02-14 17:33:39'),
(228, 'theme-september-login_background', NULL, NULL, '2024-02-14 17:33:39'),
(229, 'theme-september-register_background', NULL, NULL, '2024-02-14 17:33:39'),
(230, 'theme-september-ecommerce_term_and_privacy_policy_url', NULL, NULL, '2024-02-14 17:33:39'),
(231, 'theme-september-cookie_consent_enable', 'yes', NULL, '2024-02-14 17:33:39'),
(232, 'theme-september-cookie_consent_style', 'full-width', NULL, '2024-02-14 17:33:39'),
(233, 'theme-september-cookie_consent_button_text', 'Allow cookies', NULL, '2024-02-14 17:33:39'),
(234, 'theme-september-cookie_consent_background_color', '#000', NULL, '2024-02-14 17:33:39'),
(235, 'theme-september-cookie_consent_text_color', '#fff', NULL, '2024-02-14 17:33:39'),
(236, 'theme-september-cookie_consent_max_width', '1170', NULL, '2024-02-14 17:33:39'),
(237, 'comment_enable', '1', NULL, '2024-02-14 17:33:39'),
(238, 'comment_moderation', '1', NULL, '2024-02-14 17:33:39'),
(239, 'comment_menu_enable', '[\"0\",\"Botble\\\\Ecommerce\\\\Models\\\\Product\"]', NULL, '2024-02-14 17:33:39'),
(240, 'enable_newsletter_contacts_list_api', '1', NULL, '2024-02-14 17:33:39'),
(241, 'newsletter_mailchimp_api_key', '2c129fc01a6b0b856e8a563561d98d3f-us22', NULL, '2024-02-14 17:33:39'),
(242, 'newsletter_mailchimp_list_id', '6ff233f8ac', NULL, '2024-02-14 17:33:39'),
(243, 'newsletter_sendgrid_api_key', '', NULL, '2024-02-14 17:33:39'),
(244, 'newsletter_sendgrid_list_id', '', NULL, '2024-02-14 17:33:39'),
(245, '_method', 'PUT', NULL, '2024-02-14 17:33:39'),
(246, '_token', 'iiCTDDSOt2pPNonPqjATLoYUY9fC3RiOMuZ9ylHv', NULL, '2024-02-14 17:33:39'),
(247, 'admin_email', '[\"matacor23@gmail.com\"]', NULL, '2024-02-14 17:33:39'),
(248, 'time_zone', 'UTC', NULL, '2024-02-14 17:33:39'),
(249, 'enable_send_error_reporting_via_email', '1', NULL, '2024-02-14 17:33:39'),
(250, 'redirect_404_to_homepage', '0', NULL, '2024-02-14 17:33:39'),
(251, 'vig_translate_driver', 'google', NULL, '2024-02-14 17:33:39'),
(252, 'vig_translate_aws_key', '', NULL, '2024-02-14 17:33:39'),
(253, 'vig_translate_aws_secret', '', NULL, '2024-02-14 17:33:39'),
(254, 'vig_translate_aws_region', 'us-east-1', NULL, '2024-02-14 17:33:39'),
(255, 'vig_translate_chatgpt_key', '', NULL, '2024-02-14 17:33:39'),
(256, 'locale', '', NULL, '2024-02-14 17:33:39'),
(257, 'ecommerce_store_zip_code', '16064', NULL, '2024-02-14 17:33:39'),
(258, 'licensed_to', 'matacor23', NULL, '2024-02-14 17:33:39');

-- --------------------------------------------------------

--
-- Table structure for table `simple_sliders`
--

CREATE TABLE `simple_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `key` varchar(120) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `simple_sliders`
--

INSERT INTO `simple_sliders` (`id`, `name`, `key`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Home slider', 'home-slider', NULL, 'published', '2024-01-29 02:42:46', '2024-01-29 02:42:46');

-- --------------------------------------------------------

--
-- Table structure for table `simple_slider_items`
--

CREATE TABLE `simple_slider_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `simple_slider_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `simple_slider_items`
--

INSERT INTO `simple_slider_items` (`id`, `simple_slider_id`, `title`, `image`, `link`, `description`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, 'New Collection', 'sliders/1.jpg', '/products', 'Save more with coupons &amp; up to 70% off', 1, '2024-01-29 02:42:46', '2024-01-29 02:42:46'),
(2, 1, 'Big Deals', 'sliders/2.jpg', '/products', 'Headphone, Gaming Laptop, PC and more...', 2, '2024-01-29 02:42:46', '2024-01-29 02:42:46'),
(3, 1, 'Trending Collection', 'sliders/3.jpg', '/products', 'Save more with coupons &amp; up to 20% off', 3, '2024-01-29 02:42:46', '2024-01-29 02:42:46');

-- --------------------------------------------------------

--
-- Table structure for table `slugs`
--

CREATE TABLE `slugs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(255) NOT NULL,
  `prefix` varchar(120) DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slugs`
--

INSERT INTO `slugs` (`id`, `key`, `reference_id`, `reference_type`, `prefix`, `created_at`, `updated_at`) VALUES
(1, 'fashion-live', 1, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(2, 'hand-crafted', 2, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(3, 'mestonix', 3, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(4, 'sunshine', 4, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(5, 'pure', 5, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(6, 'anfold', 6, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(7, 'automotive', 7, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(8, 'office-bags', 1, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(9, 'hand-bag', 2, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(10, 'woman', 3, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(11, 'woman-wallet', 4, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(12, 'denim', 5, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(13, 'dress', 6, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(14, 'backpack', 7, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(15, 'bags', 8, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(16, 'wallet', 9, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(17, 'men', 10, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(18, 'accessories', 11, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(19, 'men-wallet', 12, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(20, 'shoes', 13, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(21, 'wallet', 1, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(22, 'bags', 2, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(23, 'shoes', 3, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(24, 'clothes', 4, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(25, 'hand-bag', 5, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2024-01-29 02:42:36', '2024-01-29 02:42:36'),
(26, 'wallet-handmade', 1, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(27, 'clutch-handmade', 2, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(28, 'gucci-zip-around-wallet', 3, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(29, 'snapshot-standard', 4, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(30, 'joan-mini-camera-bag', 5, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(31, 'cyan-boheme', 6, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(32, 'the-marc-jacobs', 7, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(33, 'round-cross-body-bag', 8, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:38', '2024-01-29 02:42:38'),
(34, 'ecommerce', 1, 'Botble\\Blog\\Models\\Category', 'blog', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(35, 'fashion', 2, 'Botble\\Blog\\Models\\Category', 'blog', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(36, 'electronic', 3, 'Botble\\Blog\\Models\\Category', 'blog', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(37, 'commercial', 4, 'Botble\\Blog\\Models\\Category', 'blog', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(38, 'general', 1, 'Botble\\Blog\\Models\\Tag', 'tag', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(39, 'design', 2, 'Botble\\Blog\\Models\\Tag', 'tag', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(40, 'fashion', 3, 'Botble\\Blog\\Models\\Tag', 'tag', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(41, 'branding', 4, 'Botble\\Blog\\Models\\Tag', 'tag', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(42, 'modern', 5, 'Botble\\Blog\\Models\\Tag', 'tag', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(43, '4-expert-tips-on-how-to-choose-the-right-mens-wallet', 1, 'Botble\\Blog\\Models\\Post', 'blog', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(44, 'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag', 2, 'Botble\\Blog\\Models\\Post', 'blog', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(45, 'the-top-2020-handbag-trends-to-know', 3, 'Botble\\Blog\\Models\\Post', 'blog', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(46, 'how-to-match-the-color-of-your-handbag-with-an-outfit', 4, 'Botble\\Blog\\Models\\Post', 'blog', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(47, 'how-to-care-for-leather-bags', 5, 'Botble\\Blog\\Models\\Post', 'blog', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(48, 'were-crushing-hard-on-summers-10-biggest-bag-trends', 6, 'Botble\\Blog\\Models\\Post', 'blog', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(49, 'essential-qualities-of-highly-successful-music', 7, 'Botble\\Blog\\Models\\Post', 'blog', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(50, '9-things-i-love-about-shaving-my-head', 8, 'Botble\\Blog\\Models\\Post', 'blog', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(51, 'why-teamwork-really-makes-the-dream-work', 9, 'Botble\\Blog\\Models\\Post', 'blog', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(52, 'the-world-caters-to-average-people', 10, 'Botble\\Blog\\Models\\Post', 'blog', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(53, 'the-litigants-on-the-screen-are-not-actors', 11, 'Botble\\Blog\\Models\\Post', 'blog', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(54, 'homepage', 1, 'Botble\\Page\\Models\\Page', '', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(55, 'blog', 2, 'Botble\\Page\\Models\\Page', '', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(56, 'contact', 3, 'Botble\\Page\\Models\\Page', '', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(57, 'cookie-policy', 4, 'Botble\\Page\\Models\\Page', '', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(58, 'faqs', 5, 'Botble\\Page\\Models\\Page', '', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(59, 'men', 1, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(60, 'women', 2, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(61, 'accessories', 3, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(62, 'shoes', 4, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(64, 'dress', 6, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(65, 'wallet-handmade', 9, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(66, 'wallet-handmade', 10, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(67, 'clutch-handmade', 11, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(68, 'clutch-handmade', 12, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(69, 'gucci-zip-around-wallet', 13, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(70, 'snapshot-standard', 14, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(71, 'snapshot-standard', 15, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(72, 'snapshot-standard', 16, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(73, 'joan-mini-camera-bag', 17, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(74, 'joan-mini-camera-bag', 18, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(75, 'joan-mini-camera-bag', 19, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(76, 'joan-mini-camera-bag', 20, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(77, 'cyan-boheme', 21, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(78, 'cyan-boheme', 22, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(79, 'cyan-boheme', 23, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(80, 'the-marc-jacobs', 24, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(81, 'the-marc-jacobs', 25, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:48', '2024-01-29 02:42:48'),
(82, 'round-cross-body-bag', 26, 'Botble\\Ecommerce\\Models\\Product', 'products', '2024-01-29 02:42:48', '2024-01-29 02:42:48');

-- --------------------------------------------------------

--
-- Table structure for table `slugs_translations`
--

CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) NOT NULL,
  `slugs_id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `prefix` varchar(120) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `abbreviation` varchar(10) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `slug`, `abbreviation`, `country_id`, `order`, `image`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Adrar', 'adrar', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(3, 'Aïn Defla', 'ain-defla', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(4, 'Aïn Témouchent', 'ain-temouchent', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(5, 'Algiers', 'algiers', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(6, 'Annaba', 'annaba', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(7, 'Batna', 'batna', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(8, 'Béchar', 'bechar', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(9, 'Béjaïa', 'bejaia', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(10, 'Béni Abbès', 'beni-abbes', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(11, 'Biskra', 'biskra', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(12, 'Blida', 'blida', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(13, 'Bordj Baji Mokhtar', 'bordj-baji-mokhtar', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(14, 'Bordj Bou Arréridj', 'bordj-bou-arreridj', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(15, 'Bouïra', 'bouira', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(16, 'Boumerdès', 'boumerdes', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(17, 'Chlef', 'chlef', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(18, 'Constantine', 'constantine', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(19, 'Djanet', 'djanet', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(20, 'Djelfa', 'djelfa', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(21, 'El Bayadh', 'el-bayadh', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(22, 'El M\'ghair', 'el-mghair', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(23, 'El Menia', 'el-menia', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(24, 'El Oued', 'el-oued', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(25, 'El Tarf', 'el-tarf', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(26, 'Ghardaïa', 'ghardaia', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(27, 'Guelma', 'guelma', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(28, 'Illizi', 'illizi', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(29, 'In Guezzam', 'in-guezzam', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(30, 'In Salah', 'in-salah', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(31, 'Jijel', 'jijel', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(32, 'Khenchela', 'khenchela', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(33, 'Laghouat', 'laghouat', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(34, 'M\'Sila', 'msila', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(35, 'Mascara', 'mascara', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(36, 'Médéa', 'medea', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(37, 'Mila', 'mila', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(38, 'Mostaganem', 'mostaganem', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(39, 'Naama', 'naama', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(40, 'Oran', 'oran', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(41, 'Ouargla', 'ouargla', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(42, 'Ouled Djellal', 'ouled-djellal', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(43, 'Oum El Bouaghi', 'oum-el-bouaghi', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(44, 'Relizane', 'relizane', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(45, 'Saïda', 'saida', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(46, 'Sétif', 'setif', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(47, 'Sidi Bel Abbès', 'sidi-bel-abbes', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(48, 'Skikda', 'skikda', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(49, 'Souk Ahras', 'souk-ahras', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(50, 'Tamanghasset', 'tamanghasset', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(51, 'Tébessa', 'tebessa', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(52, 'Tiaret', 'tiaret', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(53, 'Timimoun', 'timimoun', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(54, 'Tindouf', 'tindouf', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(55, 'Tipasa', 'tipasa', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(56, 'Tissemsilt', 'tissemsilt', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(57, 'Tizi Ouzou', 'tizi-ouzou', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(58, 'Tlemcen', 'tlemcen', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10'),
(59, 'Touggourt', 'touggourt', NULL, 2, 0, NULL, 0, 'published', '2024-02-12 14:58:10', '2024-02-12 14:58:10');

-- --------------------------------------------------------

--
-- Table structure for table `states_translations`
--

CREATE TABLE `states_translations` (
  `lang_code` varchar(20) NOT NULL,
  `states_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `abbreviation` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states_translations`
--

INSERT INTO `states_translations` (`lang_code`, `states_id`, `name`, `slug`, `abbreviation`) VALUES
('ar', 1, 'Alger', 'alger', ''),
('en_US', 1, 'Alger', 'alger', '');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `author_type` varchar(255) NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) DEFAULT '',
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `author_id`, `author_type`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'General', NULL, 'Botble\\ACL\\Models\\User', '', 'published', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(2, 'Design', NULL, 'Botble\\ACL\\Models\\User', '', 'published', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(3, 'Fashion', NULL, 'Botble\\ACL\\Models\\User', '', 'published', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(4, 'Branding', NULL, 'Botble\\ACL\\Models\\User', '', 'published', '2024-01-29 02:42:47', '2024-01-29 02:42:47'),
(5, 'Modern', NULL, 'Botble\\ACL\\Models\\User', '', 'published', '2024-01-29 02:42:47', '2024-01-29 02:42:47');

-- --------------------------------------------------------

--
-- Table structure for table `tags_translations`
--

CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) NOT NULL,
  `tags_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) DEFAULT NULL,
  `last_name` varchar(120) DEFAULT NULL,
  `username` varchar(60) DEFAULT NULL,
  `avatar_id` bigint(20) UNSIGNED DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT 0,
  `manage_supers` tinyint(1) NOT NULL DEFAULT 0,
  `permissions` text DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `first_name`, `last_name`, `username`, `avatar_id`, `super_user`, `manage_supers`, `permissions`, `last_login`) VALUES
(1, 'matacor23@gmail.com', NULL, '$2y$12$rLjUoSgK271onmDGeNi8kuOXfAUVdDcxRJxNn8AbqdAeGQoANhgna', 'Vo4DI3o2NXnycBRjqOChh7ALecKSeUBdqbO4HZp2BlOfUYJfzeA3gBlvo0Ln', '2024-02-10 20:54:22', '2024-02-10 20:54:22', 'Asma', 'Chikh', 'matacor', NULL, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE `user_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(120) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_meta`
--

INSERT INTO `user_meta` (`id`, `key`, `value`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'theme_mode', 'light', 1, '2024-02-10 20:56:56', '2024-02-10 20:56:58'),
(2, 'locale', 'fr', 1, '2024-02-12 13:24:26', '2024-02-12 13:24:26'),
(3, 'locale_direction', 'ltr', 1, '2024-02-12 13:24:26', '2024-02-12 13:24:26');

-- --------------------------------------------------------

--
-- Table structure for table `vig_translations`
--

CREATE TABLE `vig_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `text_original` text DEFAULT NULL,
  `text_translated` text DEFAULT NULL,
  `lang_from` varchar(100) NOT NULL,
  `lang_to` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `widget_id` varchar(120) NOT NULL,
  `sidebar_id` varchar(120) NOT NULL,
  `theme` varchar(120) NOT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `widget_id`, `sidebar_id`, `theme`, `position`, `data`, `created_at`, `updated_at`) VALUES
(2, 'CustomMenuWidget', 'footer_sidebar', 'september', 1, '{\"id\":\"CustomMenuWidget\",\"name\":\"Customer services\",\"menu_id\":\"customer-services\"}', '2024-02-10 22:08:19', '2024-02-10 22:08:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activations_user_id_index` (`user_id`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_histories`
--
ALTER TABLE `audit_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_histories_user_id_index` (`user_id`),
  ADD KEY `audit_histories_module_index` (`module`);

--
-- Indexes for table `bb_comments`
--
ALTER TABLE `bb_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bb_comment_likes`
--
ALTER TABLE `bb_comment_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bb_comment_likes_comment_id_index` (`comment_id`),
  ADD KEY `bb_comment_likes_user_id_index` (`user_id`);

--
-- Indexes for table `bb_comment_recommends`
--
ALTER TABLE `bb_comment_recommends`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bb_comment_recommends_user_id_index` (`user_id`);

--
-- Indexes for table `bb_comment_users`
--
ALTER TABLE `bb_comment_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bb_comment_users_email_unique` (`email`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_index` (`parent_id`),
  ADD KEY `categories_status_index` (`status`),
  ADD KEY `categories_created_at_index` (`created_at`);

--
-- Indexes for table `categories_translations`
--
ALTER TABLE `categories_translations`
  ADD PRIMARY KEY (`lang_code`,`categories_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cities_slug_unique` (`slug`);

--
-- Indexes for table `cities_translations`
--
ALTER TABLE `cities_translations`
  ADD PRIMARY KEY (`lang_code`,`cities_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_replies`
--
ALTER TABLE `contact_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries_translations`
--
ALTER TABLE `countries_translations`
  ADD PRIMARY KEY (`lang_code`,`countries_id`);

--
-- Indexes for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  ADD KEY `dashboard_widget_settings_widget_id_index` (`widget_id`);

--
-- Indexes for table `ec_brands`
--
ALTER TABLE `ec_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_brands_translations`
--
ALTER TABLE `ec_brands_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_brands_id`);

--
-- Indexes for table `ec_cart`
--
ALTER TABLE `ec_cart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `ec_currencies`
--
ALTER TABLE `ec_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_customers`
--
ALTER TABLE `ec_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_customers_email_unique` (`email`);

--
-- Indexes for table `ec_customer_addresses`
--
ALTER TABLE `ec_customer_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_customer_password_resets`
--
ALTER TABLE `ec_customer_password_resets`
  ADD KEY `ec_customer_password_resets_email_index` (`email`),
  ADD KEY `ec_customer_password_resets_token_index` (`token`);

--
-- Indexes for table `ec_customer_recently_viewed_products`
--
ALTER TABLE `ec_customer_recently_viewed_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_customer_used_coupons`
--
ALTER TABLE `ec_customer_used_coupons`
  ADD PRIMARY KEY (`discount_id`,`customer_id`);

--
-- Indexes for table `ec_discounts`
--
ALTER TABLE `ec_discounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_discounts_code_unique` (`code`);

--
-- Indexes for table `ec_discount_customers`
--
ALTER TABLE `ec_discount_customers`
  ADD PRIMARY KEY (`discount_id`,`customer_id`);

--
-- Indexes for table `ec_discount_products`
--
ALTER TABLE `ec_discount_products`
  ADD PRIMARY KEY (`discount_id`,`product_id`);

--
-- Indexes for table `ec_discount_product_categories`
--
ALTER TABLE `ec_discount_product_categories`
  ADD PRIMARY KEY (`discount_id`,`product_category_id`);

--
-- Indexes for table `ec_discount_product_collections`
--
ALTER TABLE `ec_discount_product_collections`
  ADD PRIMARY KEY (`discount_id`,`product_collection_id`);

--
-- Indexes for table `ec_flash_sales`
--
ALTER TABLE `ec_flash_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_flash_sales_translations`
--
ALTER TABLE `ec_flash_sales_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_flash_sales_id`);

--
-- Indexes for table `ec_global_options`
--
ALTER TABLE `ec_global_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_global_options_translations`
--
ALTER TABLE `ec_global_options_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_global_options_id`);

--
-- Indexes for table `ec_global_option_value`
--
ALTER TABLE `ec_global_option_value`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_global_option_value_translations`
--
ALTER TABLE `ec_global_option_value_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_global_option_value_id`);

--
-- Indexes for table `ec_grouped_products`
--
ALTER TABLE `ec_grouped_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_invoices`
--
ALTER TABLE `ec_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_invoices_code_unique` (`code`),
  ADD KEY `ec_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  ADD KEY `ec_invoices_payment_id_index` (`payment_id`),
  ADD KEY `ec_invoices_status_index` (`status`);

--
-- Indexes for table `ec_invoice_items`
--
ALTER TABLE `ec_invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_invoice_items_reference_type_reference_id_index` (`reference_type`,`reference_id`);

--
-- Indexes for table `ec_options`
--
ALTER TABLE `ec_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_options_translations`
--
ALTER TABLE `ec_options_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_options_id`);

--
-- Indexes for table `ec_option_value`
--
ALTER TABLE `ec_option_value`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_option_value_translations`
--
ALTER TABLE `ec_option_value_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_option_value_id`);

--
-- Indexes for table `ec_orders`
--
ALTER TABLE `ec_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_orders_code_unique` (`code`),
  ADD KEY `ec_orders_user_id_status_created_at_index` (`user_id`,`status`,`created_at`);

--
-- Indexes for table `ec_order_addresses`
--
ALTER TABLE `ec_order_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_order_histories`
--
ALTER TABLE `ec_order_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_order_product`
--
ALTER TABLE `ec_order_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_order_referrals`
--
ALTER TABLE `ec_order_referrals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_order_referrals_order_id_index` (`order_id`);

--
-- Indexes for table `ec_order_returns`
--
ALTER TABLE `ec_order_returns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_order_returns_code_unique` (`code`);

--
-- Indexes for table `ec_order_return_items`
--
ALTER TABLE `ec_order_return_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_order_tax_information`
--
ALTER TABLE `ec_order_tax_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_order_tax_information_order_id_index` (`order_id`);

--
-- Indexes for table `ec_products`
--
ALTER TABLE `ec_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_products_brand_id_status_is_variation_created_at_index` (`brand_id`,`status`,`is_variation`,`created_at`),
  ADD KEY `sale_type_index` (`sale_type`),
  ADD KEY `start_date_index` (`start_date`),
  ADD KEY `end_date_index` (`end_date`),
  ADD KEY `sale_price_index` (`sale_price`),
  ADD KEY `is_variation_index` (`is_variation`),
  ADD KEY `ec_products_sku_index` (`sku`);

--
-- Indexes for table `ec_products_translations`
--
ALTER TABLE `ec_products_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_products_id`);

--
-- Indexes for table `ec_product_attributes`
--
ALTER TABLE `ec_product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_set_status_index` (`attribute_set_id`);

--
-- Indexes for table `ec_product_attributes_translations`
--
ALTER TABLE `ec_product_attributes_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_product_attributes_id`);

--
-- Indexes for table `ec_product_attribute_sets`
--
ALTER TABLE `ec_product_attribute_sets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_attribute_sets_translations`
--
ALTER TABLE `ec_product_attribute_sets_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_product_attribute_sets_id`);

--
-- Indexes for table `ec_product_categories`
--
ALTER TABLE `ec_product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_categories_parent_id_status_created_at_index` (`parent_id`,`status`,`created_at`),
  ADD KEY `ec_product_categories_parent_id_status_index` (`parent_id`,`status`);

--
-- Indexes for table `ec_product_categories_translations`
--
ALTER TABLE `ec_product_categories_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_product_categories_id`);

--
-- Indexes for table `ec_product_categorizables`
--
ALTER TABLE `ec_product_categorizables`
  ADD PRIMARY KEY (`category_id`,`reference_id`,`reference_type`),
  ADD KEY `ec_product_categorizables_category_id_index` (`category_id`),
  ADD KEY `ec_product_categorizables_reference_id_index` (`reference_id`),
  ADD KEY `ec_product_categorizables_reference_type_index` (`reference_type`);

--
-- Indexes for table `ec_product_category_product`
--
ALTER TABLE `ec_product_category_product`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `ec_product_category_product_category_id_index` (`category_id`),
  ADD KEY `ec_product_category_product_product_id_index` (`product_id`);

--
-- Indexes for table `ec_product_collections`
--
ALTER TABLE `ec_product_collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_collections_translations`
--
ALTER TABLE `ec_product_collections_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_product_collections_id`);

--
-- Indexes for table `ec_product_collection_products`
--
ALTER TABLE `ec_product_collection_products`
  ADD PRIMARY KEY (`product_id`,`product_collection_id`),
  ADD KEY `ec_product_collection_products_product_collection_id_index` (`product_collection_id`),
  ADD KEY `ec_product_collection_products_product_id_index` (`product_id`);

--
-- Indexes for table `ec_product_cross_sale_relations`
--
ALTER TABLE `ec_product_cross_sale_relations`
  ADD PRIMARY KEY (`from_product_id`,`to_product_id`),
  ADD KEY `ec_product_cross_sale_relations_from_product_id_index` (`from_product_id`),
  ADD KEY `ec_product_cross_sale_relations_to_product_id_index` (`to_product_id`);

--
-- Indexes for table `ec_product_files`
--
ALTER TABLE `ec_product_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_files_product_id_index` (`product_id`);

--
-- Indexes for table `ec_product_labels`
--
ALTER TABLE `ec_product_labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_labels_translations`
--
ALTER TABLE `ec_product_labels_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_product_labels_id`);

--
-- Indexes for table `ec_product_label_products`
--
ALTER TABLE `ec_product_label_products`
  ADD PRIMARY KEY (`product_label_id`,`product_id`),
  ADD KEY `ec_product_label_products_product_label_id_index` (`product_label_id`),
  ADD KEY `ec_product_label_products_product_id_index` (`product_id`);

--
-- Indexes for table `ec_product_related_relations`
--
ALTER TABLE `ec_product_related_relations`
  ADD PRIMARY KEY (`from_product_id`,`to_product_id`),
  ADD KEY `ec_product_related_relations_from_product_id_index` (`from_product_id`),
  ADD KEY `ec_product_related_relations_to_product_id_index` (`to_product_id`);

--
-- Indexes for table `ec_product_tags`
--
ALTER TABLE `ec_product_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_tags_translations`
--
ALTER TABLE `ec_product_tags_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_product_tags_id`);

--
-- Indexes for table `ec_product_tag_product`
--
ALTER TABLE `ec_product_tag_product`
  ADD PRIMARY KEY (`product_id`,`tag_id`),
  ADD KEY `ec_product_tag_product_product_id_index` (`product_id`),
  ADD KEY `ec_product_tag_product_tag_id_index` (`tag_id`);

--
-- Indexes for table `ec_product_up_sale_relations`
--
ALTER TABLE `ec_product_up_sale_relations`
  ADD PRIMARY KEY (`from_product_id`,`to_product_id`),
  ADD KEY `ec_product_up_sale_relations_from_product_id_index` (`from_product_id`),
  ADD KEY `ec_product_up_sale_relations_to_product_id_index` (`to_product_id`);

--
-- Indexes for table `ec_product_variations`
--
ALTER TABLE `ec_product_variations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_product_variations_product_id_configurable_product_id_unique` (`product_id`,`configurable_product_id`),
  ADD KEY `configurable_product_index` (`product_id`,`configurable_product_id`);

--
-- Indexes for table `ec_product_variation_items`
--
ALTER TABLE `ec_product_variation_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_variation_index` (`attribute_id`,`variation_id`);

--
-- Indexes for table `ec_product_views`
--
ALTER TABLE `ec_product_views`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_product_views_product_id_date_unique` (`product_id`,`date`),
  ADD KEY `ec_product_views_product_id_index` (`product_id`);

--
-- Indexes for table `ec_product_with_attribute_set`
--
ALTER TABLE `ec_product_with_attribute_set`
  ADD PRIMARY KEY (`product_id`,`attribute_set_id`);

--
-- Indexes for table `ec_reviews`
--
ALTER TABLE `ec_reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_reviews_product_id_customer_id_unique` (`product_id`,`customer_id`),
  ADD KEY `ec_reviews_product_id_customer_id_status_created_at_index` (`product_id`,`customer_id`,`status`,`created_at`),
  ADD KEY `review_relation_index` (`product_id`,`customer_id`,`status`);

--
-- Indexes for table `ec_review_replies`
--
ALTER TABLE `ec_review_replies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_review_replies_review_id_user_id_unique` (`review_id`,`user_id`);

--
-- Indexes for table `ec_shipments`
--
ALTER TABLE `ec_shipments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipment_histories`
--
ALTER TABLE `ec_shipment_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipping`
--
ALTER TABLE `ec_shipping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipping_rules`
--
ALTER TABLE `ec_shipping_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipping_rule_items`
--
ALTER TABLE `ec_shipping_rule_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_store_locators`
--
ALTER TABLE `ec_store_locators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_taxes`
--
ALTER TABLE `ec_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_tax_products`
--
ALTER TABLE `ec_tax_products`
  ADD PRIMARY KEY (`product_id`,`tax_id`),
  ADD KEY `ec_tax_products_tax_id_index` (`tax_id`),
  ADD KEY `ec_tax_products_product_id_index` (`product_id`);

--
-- Indexes for table `ec_tax_rules`
--
ALTER TABLE `ec_tax_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_wish_lists`
--
ALTER TABLE `ec_wish_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_relation_index` (`product_id`,`customer_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs_translations`
--
ALTER TABLE `faqs_translations`
  ADD PRIMARY KEY (`lang_code`,`faqs_id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_categories_translations`
--
ALTER TABLE `faq_categories_translations`
  ADD PRIMARY KEY (`lang_code`,`faq_categories_id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_user_id_index` (`user_id`);

--
-- Indexes for table `galleries_translations`
--
ALTER TABLE `galleries_translations`
  ADD PRIMARY KEY (`lang_code`,`galleries_id`);

--
-- Indexes for table `gallery_meta`
--
ALTER TABLE `gallery_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_meta_reference_id_index` (`reference_id`);

--
-- Indexes for table `gallery_meta_translations`
--
ALTER TABLE `gallery_meta_translations`
  ADD PRIMARY KEY (`lang_code`,`gallery_meta_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`lang_id`),
  ADD KEY `lang_locale_index` (`lang_locale`),
  ADD KEY `lang_code_index` (`lang_code`),
  ADD KEY `lang_is_default_index` (`lang_is_default`);

--
-- Indexes for table `language_meta`
--
ALTER TABLE `language_meta`
  ADD PRIMARY KEY (`lang_meta_id`),
  ADD KEY `language_meta_reference_id_index` (`reference_id`),
  ADD KEY `meta_code_index` (`lang_meta_code`),
  ADD KEY `meta_origin_index` (`lang_meta_origin`),
  ADD KEY `meta_reference_type_index` (`reference_type`);

--
-- Indexes for table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_files_user_id_index` (`user_id`),
  ADD KEY `media_files_index` (`folder_id`,`user_id`,`created_at`);

--
-- Indexes for table `media_folders`
--
ALTER TABLE `media_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_folders_user_id_index` (`user_id`),
  ADD KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`);

--
-- Indexes for table `media_settings`
--
ALTER TABLE `media_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_slug_unique` (`slug`);

--
-- Indexes for table `menu_locations`
--
ALTER TABLE `menu_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`);

--
-- Indexes for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_nodes_menu_id_index` (`menu_id`),
  ADD KEY `menu_nodes_parent_id_index` (`parent_id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `reference_type` (`reference_type`);

--
-- Indexes for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_boxes_reference_id_index` (`reference_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_user_id_index` (`user_id`);

--
-- Indexes for table `pages_translations`
--
ALTER TABLE `pages_translations`
  ADD PRIMARY KEY (`lang_code`,`pages_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_status_index` (`status`),
  ADD KEY `posts_author_id_index` (`author_id`),
  ADD KEY `posts_author_type_index` (`author_type`),
  ADD KEY `posts_created_at_index` (`created_at`);

--
-- Indexes for table `posts_translations`
--
ALTER TABLE `posts_translations`
  ADD PRIMARY KEY (`lang_code`,`posts_id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD KEY `post_categories_category_id_index` (`category_id`),
  ADD KEY `post_categories_post_id_index` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD KEY `post_tags_tag_id_index` (`tag_id`),
  ADD KEY `post_tags_post_id_index` (`post_id`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD KEY `roles_created_by_index` (`created_by`),
  ADD KEY `roles_updated_by_index` (`updated_by`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_users_user_id_index` (`user_id`),
  ADD KEY `role_users_role_id_index` (`role_id`);

--
-- Indexes for table `sc_referrals`
--
ALTER TABLE `sc_referrals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sc_referrals_sponsor_type_sponsor_id_index` (`sponsor_type`,`sponsor_id`),
  ADD KEY `sc_referrals_referral_type_referral_id_index` (`referral_type`,`referral_id`);

--
-- Indexes for table `sc_referral_aliases`
--
ALTER TABLE `sc_referral_aliases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_referral_aliases_alias_unique` (`alias`),
  ADD KEY `sc_referral_aliases_user_type_user_id_index` (`user_type`,`user_id`);

--
-- Indexes for table `sc_referral_trackings`
--
ALTER TABLE `sc_referral_trackings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sc_referral_trackings_sponsor_type_sponsor_id_index` (`sponsor_type`,`sponsor_id`),
  ADD KEY `sc_referral_trackings_ip_address_index` (`ip_address`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `simple_sliders`
--
ALTER TABLE `simple_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `simple_slider_items`
--
ALTER TABLE `simple_slider_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slugs`
--
ALTER TABLE `slugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slugs_reference_id_index` (`reference_id`),
  ADD KEY `slugs_key_index` (`key`),
  ADD KEY `slugs_prefix_index` (`prefix`),
  ADD KEY `slugs_reference_index` (`reference_id`,`reference_type`);

--
-- Indexes for table `slugs_translations`
--
ALTER TABLE `slugs_translations`
  ADD PRIMARY KEY (`lang_code`,`slugs_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `states_slug_unique` (`slug`);

--
-- Indexes for table `states_translations`
--
ALTER TABLE `states_translations`
  ADD PRIMARY KEY (`lang_code`,`states_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags_translations`
--
ALTER TABLE `tags_translations`
  ADD PRIMARY KEY (`lang_code`,`tags_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_meta_user_id_index` (`user_id`);

--
-- Indexes for table `vig_translations`
--
ALTER TABLE `vig_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_histories`
--
ALTER TABLE `audit_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `bb_comments`
--
ALTER TABLE `bb_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bb_comment_likes`
--
ALTER TABLE `bb_comment_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bb_comment_recommends`
--
ALTER TABLE `bb_comment_recommends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bb_comment_users`
--
ALTER TABLE `bb_comment_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=294;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_replies`
--
ALTER TABLE `contact_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_brands`
--
ALTER TABLE `ec_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ec_currencies`
--
ALTER TABLE `ec_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ec_customers`
--
ALTER TABLE `ec_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ec_customer_addresses`
--
ALTER TABLE `ec_customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ec_customer_recently_viewed_products`
--
ALTER TABLE `ec_customer_recently_viewed_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_discounts`
--
ALTER TABLE `ec_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_flash_sales`
--
ALTER TABLE `ec_flash_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ec_global_options`
--
ALTER TABLE `ec_global_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ec_global_option_value`
--
ALTER TABLE `ec_global_option_value`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ec_grouped_products`
--
ALTER TABLE `ec_grouped_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_invoices`
--
ALTER TABLE `ec_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ec_invoice_items`
--
ALTER TABLE `ec_invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `ec_options`
--
ALTER TABLE `ec_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_option_value`
--
ALTER TABLE `ec_option_value`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_orders`
--
ALTER TABLE `ec_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ec_order_addresses`
--
ALTER TABLE `ec_order_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ec_order_histories`
--
ALTER TABLE `ec_order_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `ec_order_product`
--
ALTER TABLE `ec_order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `ec_order_referrals`
--
ALTER TABLE `ec_order_referrals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_order_returns`
--
ALTER TABLE `ec_order_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_order_return_items`
--
ALTER TABLE `ec_order_return_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_order_tax_information`
--
ALTER TABLE `ec_order_tax_information`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_products`
--
ALTER TABLE `ec_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `ec_product_attributes`
--
ALTER TABLE `ec_product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ec_product_attribute_sets`
--
ALTER TABLE `ec_product_attribute_sets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ec_product_categories`
--
ALTER TABLE `ec_product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ec_product_collections`
--
ALTER TABLE `ec_product_collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ec_product_files`
--
ALTER TABLE `ec_product_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ec_product_labels`
--
ALTER TABLE `ec_product_labels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ec_product_tags`
--
ALTER TABLE `ec_product_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ec_product_variations`
--
ALTER TABLE `ec_product_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ec_product_variation_items`
--
ALTER TABLE `ec_product_variation_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `ec_product_views`
--
ALTER TABLE `ec_product_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `ec_reviews`
--
ALTER TABLE `ec_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT for table `ec_review_replies`
--
ALTER TABLE `ec_review_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_shipments`
--
ALTER TABLE `ec_shipments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ec_shipment_histories`
--
ALTER TABLE `ec_shipment_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `ec_shipping`
--
ALTER TABLE `ec_shipping`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ec_shipping_rules`
--
ALTER TABLE `ec_shipping_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ec_shipping_rule_items`
--
ALTER TABLE `ec_shipping_rule_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_store_locators`
--
ALTER TABLE `ec_store_locators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ec_taxes`
--
ALTER TABLE `ec_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ec_tax_rules`
--
ALTER TABLE `ec_tax_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_wish_lists`
--
ALTER TABLE `ec_wish_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gallery_meta`
--
ALTER TABLE `gallery_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `lang_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `language_meta`
--
ALTER TABLE `language_meta`
  MODIFY `lang_meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `media_folders`
--
ALTER TABLE `media_folders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `media_settings`
--
ALTER TABLE `media_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_locations`
--
ALTER TABLE `menu_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sc_referrals`
--
ALTER TABLE `sc_referrals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sc_referral_aliases`
--
ALTER TABLE `sc_referral_aliases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sc_referral_trackings`
--
ALTER TABLE `sc_referral_trackings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT for table `simple_sliders`
--
ALTER TABLE `simple_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `simple_slider_items`
--
ALTER TABLE `simple_slider_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `slugs`
--
ALTER TABLE `slugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_meta`
--
ALTER TABLE `user_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vig_translations`
--
ALTER TABLE `vig_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
