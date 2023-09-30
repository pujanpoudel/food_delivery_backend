-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 30, 2023 at 05:53 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_shopping_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `http_method` varchar(255) DEFAULT NULL,
  `http_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2021-11-08 03:39:48', '2021-11-08 03:39:48');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL),
(1, 8, NULL, NULL),
(1, 10, NULL, NULL),
(1, 11, NULL, NULL),
(1, 12, NULL, NULL),
(1, 13, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) NOT NULL,
  `password` varchar(60) NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$8yUtwbsb.WZjJc/U/s3HOuoEboydAxwR7mXDxMjVYvVrH1aoUvvVm', 'Administrator', NULL, 'isC2i6h3iyaSE64FCyJ8iowPPUieRkKGG2UtFqqyLx6GczJ896aOl2VY5OvT', '2021-11-08 03:39:48', '2021-12-17 22:22:14');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'currency', 'USD', '2022-02-27 23:05:36', '2022-02-27 23:05:36'),
(2, 'test', '{\"client id\":\"shfsuhsf\",\"Secret id\":\"ksfhkhshiuhf\"}', '2022-02-27 23:09:10', '2022-02-27 23:09:10'),
(3, 'pay', '{\"status\":\"1\",\"client id\":\"shfsuhsf\",\"Secret id\":\"ksfhkhshiuhf\"}', '2022-02-27 23:16:40', '2022-02-27 23:16:40'),
(4, 'paypal', '{\"status\":\"1\",\"paypal_client_id\":\"AYkWuTf46Z1LRsxr5V1nXXmvplE1Pox0WLJG7JeYPQMQ3RjGtBJ_e7dHzZZO-Pf7dnV5iMhhgMgRhRs5\",\"paypal_secret_id\":\"EMllsYjwRcI3k7TSQjLhH5M8xJb1grRTF7Vrq972dYhzTzIb_j_rVDlEMGiyRhk9eNJuvhk7WdqkMwrR\"}', '2022-02-27 23:29:33', '2022-02-27 23:29:33');

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) NOT NULL,
  `address_type` varchar(100) DEFAULT NULL,
  `contact_person_number` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `latitude` varchar(200) DEFAULT NULL,
  `longitude` varchar(200) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `contact_person_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customer_addresses`
--

INSERT INTO `customer_addresses` (`id`, `address_type`, `contact_person_number`, `address`, `latitude`, `longitude`, `user_id`, `contact_person_name`, `created_at`, `updated_at`) VALUES
(56, NULL, '123456', '309 SW Broadway, Portland, OR 97205, USA', '45.521708425968995', '-122.67854869365692', 27, 'dylan', '2022-01-30 18:56:17', '2022-01-30 18:56:17'),
(57, NULL, '1234567', '309 SW Broadway, Portland, OR 97205, USA', '45.52188390161423', '-122.67854869365692', 28, '123456', '2022-01-30 19:06:02', '2022-01-30 19:06:02'),
(58, NULL, '1', 'Standard Insurance Center, 900 SW 5th Ave, Portland, OR 97204, USA', '45.517183925183836', '-122.67808366566895', 29, 'ahmed', '2022-01-31 00:39:31', '2022-01-31 00:39:31'),
(59, NULL, '1', '2129 NW Northrup St, Portland, OR 97210, USA', '45.53122865713088', '-122.69545532763004', 29, 'ahmed', '2022-01-31 00:40:00', '2022-01-31 00:40:00'),
(60, NULL, '1234567', '309 SW Broadway, Portland, OR 97205, USA', '45.52188390161423', '-122.67854869365692', 28, '123456', '2022-02-07 01:41:43', '2022-02-07 01:41:43'),
(61, NULL, '1234567', '820 SW Washington St, Portland, OR 97205, USA', '45.52102695512081', '-122.68039003014566', 28, '123456', '2022-02-07 12:44:45', '2022-02-07 12:44:45'),
(62, NULL, '1234567', '820 SW Washington St, Portland, OR 97205, USA', '45.52102695512081', '-122.68039003014566', 28, '123456', '2022-02-07 23:02:18', '2022-02-07 23:02:18'),
(63, NULL, '123123123', 'Wells Fargo Building, 309 SW 6th Ave, Portland, OR 97204, USA', '45.521563018025006', '-122.67743289470673', 30, 'Tester', '2022-02-08 03:52:08', '2022-02-08 03:52:08'),
(64, NULL, '12', 'Wells Fargo Building, 309 SW 6th Ave, Portland, OR 97204, USA', '45.521563018025006', '-122.67743289470673', 32, 'telllll', '2022-02-12 22:39:54', '2022-02-12 22:39:54'),
(65, NULL, '2', 'Wells Fargo Building, 309 SW 6th Ave, Portland, OR 97204, USA', '45.521563018025006', '-122.67743289470673', 33, 'Ahmed nowww', '2022-02-15 02:21:35', '2022-02-15 02:21:35'),
(66, NULL, '123456', '309 SW Broadway, Portland, OR 97205, USA', '45.521708425968995', '-122.67854869365692', 27, 'dylan', '2022-02-27 17:55:55', '2022-02-27 17:55:55');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `stars` int(11) NOT NULL,
  `people` int(11) NOT NULL,
  `selected_people` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`id`, `name`, `description`, `price`, `stars`, `people`, `selected_people`, `img`, `location`, `created_at`, `updated_at`, `type_id`) VALUES
(1, 'Nutritious fruit meal in china', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">This&nbsp;five red bases, two are dedicated to salami (fennel and regular), and there&#39;s a classic capricciosa or beef carpaccio. Blanco options include a mushroom, and a four-cheese extravaganza featuring great lobes of a tangy fior di latte they make in house every day (more on this later). Classic, precise, good.</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">I think it&#39;s still better to think of this venue not as a pizzeria, but as Pizza, by Di Stasio.</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">Rinaldo Di Stasio and Mallory Wall&#39;s empire, including the original restaurant and bar in St Kilda, Citta and now Carlton, is a designer label for dining.</p><p><br/></p>', 12, 4, 5, 5, 'images/ea9367e8a16f1d3e41d4a3ae9af2baff.png', 'Canada, British Columbia', '2021-11-17 02:09:08', '2022-01-01 00:27:22', 2),
(2, 'Sweet Dessert', '<p>The best sweet dessert</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Genesis</em>, goes straight for the jugular of unceded sovereignty.</p><p><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Genesis</em>, goes straight for the jugular of unceded sovereignty.</p><p><br/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Genesis</em>, goes straight for the jugular of unceded sovereignty.</p><p><br/></p>', 2153, 5, 5, 3, 'images/27567f904a64ba79ae95672e4ddf10c8.png', 'Icefields, Alberta', '2021-11-17 02:10:43', '2022-01-01 00:54:42', 2),
(3, 'Chinese Side', '<p style=\"border: 0px; margin-top: 0px; margin-bottom: 1.3em; padding: 0px; line-height: 1.8; color: rgb(58, 58, 58); font-family: Montserrat, sans-serif; font-size: 20px; white-space: normal; background-color: rgb(255, 255, 255);\">Enjoy these flavors any time of day.</p><p><br/></p>', 3456, 3, 5, 4, 'images/fe978d4b2a6e311efc53370bad41c302.jpg', 'Moraine Lake, Alberta', '2021-11-17 02:16:31', '2022-01-01 00:54:54', 3),
(4, 'Bitter Orange Marinade', '<p id=\"mntl-sc-block_1-0\" class=\"comp mntl-sc-block mntl-sc-block-html\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; padding: 0px; letter-spacing: -0.1px; counter-reset: section 0; font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; white-space: normal; background-color: rgb(255, 255, 255);\">Bitter oranges are often used in Caribbean&nbsp;</p><p><br/></p>', 33, 4, 5, 3, 'images/f38f470cc1972c270320c222c3aca9fb.jpg', 'Killarney Provincial Park', '2021-11-17 02:18:46', '2022-01-01 00:55:05', 3),
(5, 'Creamed Yuca (Cassava)', '<p><span style=\"font-family: &quot;Work Sans&quot;, Arial, sans-serif; font-size: 17px; letter-spacing: -0.1px; background-color: rgb(255, 255, 255);\">Commonly used in soups, eaten boiled&nbsp;</span></p>', 10, 5, 5, 4, 'images/acaa4cdee4b8aa7bf33f2140ce36860c.jpg', 'China', '2021-12-08 04:29:53', '2022-01-01 00:55:44', 3),
(6, 'Creole Rice Side Dish Recipe', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Genesis</em>, goes straight for the jugular of unceded sovereignty.</p><p><br/></p>', 18, 4, 3, 3, 'images/d6648f1f920d6bbc89988d75b3bed5b3.jpg', 'china', '2021-12-23 07:03:24', '2022-01-21 02:28:04', 2),
(7, 'Cuban Fufu', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">The quality and craftsmanship is on full show. The waiters&#39; signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant&#39;s three distinct areas are cast in gentle neon so that even your worst&nbsp;wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: Karla, Helvetica, Arial, Verdana, sans-serif; vertical-align: baseline; color: rgb(38, 38, 38); white-space: normal; background-color: rgb(255, 255, 255);\">From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell&#39;s beautiful video artworks at Citta, Di Stasio doesn&#39;t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio&#39;s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">Genesis</em>, goes straight for the jugular of unceded sovereignty.</p><p><br/></p>', 10, 5, 0, 0, 'images/f937dbd76381d1c10fdfcfd90688cb96.png', 'Cuba', '2021-12-23 07:04:49', '2022-01-01 00:56:45', 2),
(8, 'Dessert', '<p>Amazing food to eat with.</p>', 5, 4, 3, 2, 'images/34b0eaad01e8a95a02df1d934517591c.png', 'china', '2021-12-25 17:36:29', '2022-01-01 00:57:01', 3),
(9, 'Biriani', '<p style=\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\">Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled lightly spiced rice.</p><p style=\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\">The crowning glory is to finish it off with a drizzle of saffron infused water to give it the signature patches of bright yellow rice, as well as ghee (or melted butter) for buttery richness.</p><p style=\"box-sizing: inherit; padding: 0px; margin-top: 16px; margin-bottom: 16px; color: rgb(61, 61, 61); font-family: Raleway, sans-serif; font-size: 18px; white-space: normal;\">The pot is then covered and cooked over a low heat for about 25 minutes during which time the rice absorbs the aromas and flavours of the curry underneath, whilst still being beautifully fluffy.</p><p><br/></p>', 8, 4, 3, 3, 'images/0f61cb5dd19d38a11e5a9133333eca07.jpeg', 'BD', '2021-12-26 22:27:38', '2022-01-01 00:57:16', 3),
(10, 'Chicken biriani', '<p><span style=\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;ヒラギノ角ゴ Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, メイリオ, Meiryo, &quot;ＭＳ Ｐゴシック&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\">Chicken Biryani Served in a Bowl Close Up Photo. Indian Food, Indian Style Rice and Chicken. #Biryani #ChickenBiryani #IndianFood #StockPhoto</span></p>', 12, 4, 3, 3, 'images/9447a79793a4b7f832d981f975c0abc4.jpeg', 'china', '2021-12-26 22:29:47', '2022-01-01 00:56:33', 2),
(11, 'Hilsha fish', '<p><span style=\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;ヒラギノ角ゴ Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, メイリオ, Meiryo, &quot;ＭＳ Ｐゴシック&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\">Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.</span></p><p><span style=\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;ヒラギノ角ゴ Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, メイリオ, Meiryo, &quot;ＭＳ Ｐゴシック&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;ヒラギノ角ゴ Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, メイリオ, Meiryo, &quot;ＭＳ Ｐゴシック&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\">Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.</span></span></p><p><span style=\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;ヒラギノ角ゴ Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, メイリオ, Meiryo, &quot;ＭＳ Ｐゴシック&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;ヒラギノ角ゴ Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, メイリオ, Meiryo, &quot;ＭＳ Ｐゴシック&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(17, 17, 17); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;ヒラギノ角ゴ Pro W3&quot;, &quot;Hiragino Kaku Gothic Pro&quot;, メイリオ, Meiryo, &quot;ＭＳ Ｐゴシック&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\">Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.</span></span></span></p>', 12, 5, 3, 3, 'images/1343ce6cf6792383dfc071727afd5c46.jpeg', 'china', '2021-12-26 22:35:34', '2022-01-01 00:56:22', 2);

-- --------------------------------------------------------

--
-- Table structure for table `food_types`
--

CREATE TABLE `food_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `food_types`
--

INSERT INTO `food_types` (`id`, `title`, `parent_id`, `created_at`, `updated_at`, `order`, `description`) VALUES
(1, 'Food', 0, '2022-01-01 00:22:55', '2022-01-01 00:22:55', 1, 'all about food'),
(2, 'Popular food', 1, '2022-01-01 00:23:10', '2022-01-01 00:23:10', 1, 'popular food'),
(3, 'Recommended food', 1, '2022-01-01 00:23:25', '2022-01-01 00:23:25', 1, 'Recommended food');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2016_01_04_173148_create_admin_tables', 2),
(6, '2021_11_08_125401_create_article_types_table', 3),
(7, '2021_11_08_125420_create_articles_table', 3),
(8, '2021_11_17_092846_create_place_table', 4),
(9, '2016_06_01_000001_create_oauth_auth_codes_table', 5),
(10, '2016_06_01_000002_create_oauth_access_tokens_table', 5),
(11, '2016_06_01_000003_create_oauth_refresh_tokens_table', 5),
(12, '2016_06_01_000004_create_oauth_clients_table', 5),
(13, '2016_06_01_000005_create_oauth_personal_access_clients_table', 5),
(14, '2022_01_01_075013_create_food_type_table', 6),
(15, '2022_01_14_150322_create_places_table', 7),
(16, '2022_02_28_061329_create_business_settings_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0036dc953174471f3d793ab265a6ba99ed87f186bb9825110edea291f04948138201a737eb659626', 46, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 02:43:20', '2022-02-25 02:43:20', '2023-02-25 10:43:20'),
('01e6abc782876c75e36fea0c69c63be36bd5b191b60ce6d4dc1f216c04fab2283a48aa7246495843', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 12:45:12', '2022-02-07 12:45:12', '2023-02-07 20:45:12'),
('04823d677fda716203c92447d409fb51737cdb6229ebb247a1f9aa05ef47709d4ecdd6db9ae640d7', 15, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 22:15:18', '2022-01-05 22:15:18', '2023-01-06 06:15:18'),
('054ec4a7b2b4d3fed56a949eb1d424b32423d7bb536bb0123e5d387e03e06132d53080b458ada3ad', 51, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 08:52:01', '2022-02-25 08:52:01', '2023-02-25 16:52:01'),
('0599450a48dedea247cbe45d7da46c8409953ac34f0208200abc12fdf9219b42bbbe022d04cbd9f7', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-30 19:05:37', '2022-01-30 19:05:37', '2023-01-31 03:05:37'),
('05bd6c03582785923ffb71fd89633abc8171dd9e2bb539bac740f62a065b43eee67656db092ffb22', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 17:55:22', '2021-12-29 17:55:22', '2022-12-30 01:55:22'),
('064397f328ad51e21e81b749f5478028c6dab698220d06a40ad14128ab15a5f179fa9c51c7ceb4bb', 61, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 11:06:46', '2022-02-25 11:06:46', '2023-02-25 19:06:46'),
('07f1c06d91fda5bde6b70e8f24037a09c1298363b7a8c99894cadc60363ce944a1d496b3b5c29a3a', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-12 02:55:50', '2022-01-12 02:55:50', '2023-01-12 10:55:50'),
('08a9defc48dfa5fce3da0d69e72897bee95564a5cec348e7a9e7490e5b8630ae485865c87eea6beb', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 20:55:33', '2022-01-07 20:55:33', '2023-01-08 04:55:33'),
('08f24cec31e6a312ddb545b75a602ea303a8c9ea84937cdd493ca8caeb731c97125b4e7943548da8', 22, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 06:44:36', '2022-01-08 06:44:36', '2023-01-08 14:44:36'),
('0b813f55613d36733ed8b90aecaf9156008effd37199ebe816f9f8a84d471f3c8c038fa1d1a6c893', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 18:58:07', '2022-01-03 18:58:07', '2023-01-04 02:58:07'),
('0c4e7f14d31f24eb8f1d89ad9edd88c05902a34762299197f1eb8cd8cb58399a90a4e68b7a2b1f6f', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 17:22:39', '2021-12-30 17:22:39', '2022-12-31 01:22:39'),
('0f552ee0c1439613cd66de8a58a766729a147f9aa576e29d1633143916b6e7c1202b31372d3c200a', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 02:18:40', '2022-02-23 02:18:40', '2023-02-23 10:18:40'),
('0fa0b88bd598e53d08e2f58b04707664b8fe2d22c270cb1a3371ad4dbdcfcf5adb5d1b378682c8bd', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-31 00:35:28', '2022-01-31 00:35:28', '2023-01-31 08:35:28'),
('1143258b73dff69bc3bb2deebec10580d80cb009724e53538612941aa6e1093e89566b6d116b8e9b', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 17:46:25', '2022-01-05 17:46:25', '2023-01-06 01:46:25'),
('132848f26976925b99c2e06937ba6af72ca4b5aeadcf373ee1f13b0bea9240fd1ed5a2873994eb3f', 14, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 22:06:27', '2022-01-05 22:06:27', '2023-01-06 06:06:27'),
('14dec4ecaba73cfb584248e0d19b24fc08aa09c85255333670d1aa76ebcc94d31c610da8c163326a', 14, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 22:51:38', '2022-01-05 22:51:38', '2023-01-06 06:51:38'),
('150f5997e3db4453cca354eddef97121872a0bc08e1a5f398074c1fc96b85099ef8f27c2ebe6037f', 62, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 16:05:16', '2022-02-25 16:05:16', '2023-02-26 00:05:16'),
('1551143b55f7cb6bd437c97c29f33580625fb28641ff1ecbd3304e045c92023e502583d7e2ac0aa6', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 23:46:23', '2022-01-11 23:46:23', '2023-01-12 07:46:23'),
('15d1763ac33801da6ba7dbb8d2885b06ddb4e236d4814473b0aabe6bae4953f811b42820cd077855', 17, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 20:22:50', '2022-01-07 20:22:50', '2023-01-08 04:22:50'),
('16f62ea3c553b8206649c28bd86b0a445870b6de277c97c812677cfce65c28b3e1940a0d0945f2b8', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 23:01:51', '2022-02-07 23:01:51', '2023-02-08 07:01:51'),
('1a760d6d14d4afa5a0eaf552b5fc89ef57a3ceb27d33bb1ea30204e533322b09418f859ca70e9e22', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 18:34:36', '2022-01-03 18:34:36', '2023-01-04 02:34:36'),
('1c0e1b12b5bc11e0177a9b194c453ea4222afe0af29f861a041e5576f2f33d375776dd0b4d77a41c', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-04 22:16:36', '2022-01-04 22:16:36', '2023-01-05 06:16:36'),
('1da173c6b9cfe2d7c9f044ee5b9164a33440c614389fe7c42dba6992c415a1e5d87e65f0eee90522', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-03-03 07:21:32', '2022-03-03 07:21:32', '2023-03-03 15:21:32'),
('1e0cce37fc205f8177d9f341829dcdbd9c62738603f532647a4b094f09abb9b9b91d4bc4264138a5', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-09 17:45:02', '2022-01-09 17:45:02', '2023-01-10 01:45:02'),
('21405ac0cb326fd3e02b1f385540eedaad4e2e7ad174e784edd39e3a6faf71a54e8461cb9f40d135', 21, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:51:08', '2022-01-07 21:51:08', '2023-01-08 05:51:08'),
('21fca43d0f19523ce566f5722a5290c82a30ade75c82f7c1cab9e9655054b68351ea6349067e8003', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-09 16:35:48', '2022-01-09 16:35:48', '2023-01-10 00:35:48'),
('2312ca58dcb25489e4f087fda597ab8172810f57da8530bf0123d05a507eadabf52c7a50482c0e0f', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 01:16:21', '2022-02-23 01:16:21', '2023-02-23 09:16:21'),
('235f9452fefb4b035b3ca83a33ff893f2f9a4bbc6f5b39cc2274206a104a0ab26fc91de45f163e4f', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-10 22:48:51', '2022-01-10 22:48:51', '2023-01-11 06:48:51'),
('23e26c92aaa0a0ebdd4bfd34bd20dc28ece5260b1a4bd82d0bf905a6904586d9d28ef95ec37c4d98', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-04 22:17:33', '2022-01-04 22:17:33', '2023-01-05 06:17:33'),
('255ac3ef8c80afec0926f4c5f63316056fb0b1a9f5f609c7e16531145aa11ec2be8bba754ca31585', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 22:49:25', '2022-02-07 22:49:25', '2023-02-08 06:49:25'),
('26134f5ff7f36b70591321913b0e07f00f71ae6e7a8ca55a72ccc17fbd9e383e82ad6ec3e864b433', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 18:41:40', '2022-01-03 18:41:40', '2023-01-04 02:41:40'),
('2618f1ba807c27b02049b91031896ca3526633e752cef545c83eec347cc79c3d8c03eaa8bbfa90ca', 50, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 08:49:07', '2022-02-25 08:49:07', '2023-02-25 16:49:07'),
('26ca90cca7c8b3c37f4ae4988f1e37edbaa6541c5e331828ceada998922ef4d9dd8956317419c7af', 59, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:40:19', '2022-02-25 10:40:19', '2023-02-25 18:40:19'),
('274f5d1cd3c6c3398f300fe9138efeea156631716111eaddb0f4c938e4f10f0ece07f4efc0af80dc', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 17:37:18', '2022-01-05 17:37:18', '2023-01-06 01:37:18'),
('2843714a2881721c22950224916e511b4a2e9a9d35a3b3eb4156abee0acc4309d97dc023d60d76cb', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:25:27', '2022-01-07 21:25:27', '2023-01-08 05:25:27'),
('287e041ce0c94a6b9ca3014a666eda3b0f0198d363555876d3d835b8da840834921a0e8b8d5a0d6f', 26, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-30 18:19:01', '2022-01-30 18:19:01', '2023-01-31 02:19:01'),
('28cde07dc5c914d203682f25f5d5300b08301c19d0d69f95b8a8ed7b5b467ebe2ec59a863771b62b', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 02:11:35', '2022-02-23 02:11:35', '2023-02-23 10:11:35'),
('2a216cab6bd99037202d39d373001edb519b3db9e9260d64a5105451f82660dc4267b11b4039f0c8', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 18:47:06', '2022-02-23 18:47:06', '2023-02-24 02:47:06'),
('2a2bdad12d85de18e92c81ae0811dd034cc18cac9d50281599a015990e4b0b22c8caf0d1127112fa', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 17:52:28', '2021-12-29 17:52:28', '2022-12-30 01:52:28'),
('2a3b8a1fa5fd182ebf6429afe9be0d329bc58dea17c2733e2373baeb5f92fc948a7c783ed2545453', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-04 18:20:14', '2022-01-04 18:20:14', '2023-01-05 02:20:14'),
('2bb4513313b8eb05bb6397639d9d02a43b106f49c83e427806ecd2377d3ade034d9f297f73a8bfb9', 14, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 22:09:41', '2022-01-05 22:09:41', '2023-01-06 06:09:41'),
('2cd6fc6977d19de135d80e738b8b768cf39e1192e11a350c540ebb1f7c4e09c57edafc3ddef06a5e', 52, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 09:00:44', '2022-02-25 09:00:44', '2023-02-25 17:00:44'),
('332f18c04cb69ea86cc974aeb249467ee32dc7a19b5419e152009f5993366f715d35c8dbbe940efe', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-12 02:52:42', '2022-01-12 02:52:42', '2023-01-12 10:52:42'),
('3425a480ccdac05c68a84b5af04a72acdf13c832537b495cbe4d8842d2a1aab3c38b0ea2fbaa92c1', 24, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-12 06:49:30', '2022-01-12 06:49:30', '2023-01-12 14:49:30'),
('3445e4c6f75b4454986162c130b2091f69db52b2b8d1de331f85f937ea3f4cfd87e8e186e0b7a614', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:13:48', '2022-02-25 10:13:48', '2023-02-25 18:13:48'),
('360dd099aea3c2c7123aebed23c6817cf001a863abcc44ecea1bbfe471681dc2fb5deaa396e39ca9', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 01:41:28', '2022-02-07 01:41:28', '2023-02-07 09:41:28'),
('364d88afa806437d93da14fe3897597a3ad3ef656b8ef2bcfad3cca76caa9f65dc3f25cee79474d3', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 08:13:05', '2021-12-31 08:13:05', '2022-12-31 16:13:05'),
('3679bd274c8153bf2d2ba568f05b887dbf1583702f5af0a599fbd337f48aaf61cd9a0180b4e4cd8f', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 18:08:28', '2022-02-23 18:08:28', '2023-02-24 02:08:28'),
('38fb24c5d3994408a10015e331bd5e33ab3114e882fd40f6c3e0829d6c8ae53b666294dace9597a2', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 01:25:53', '2022-02-23 01:25:53', '2023-02-23 09:25:53'),
('39bec59a448992cfde15c74f51ae15dec233e34d5a13afeda7d267ce1cb2eefe7a2653dc268af748', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 18:06:55', '2022-01-03 18:06:55', '2023-01-04 02:06:55'),
('3b0f60a94f0f8e223b4f2233ff89451138182fcef8e044b610ee6b3bb0ee49cd72e38a9a323c8c64', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-16 07:18:47', '2022-02-16 07:18:47', '2023-02-16 15:18:47'),
('3c072956dad6114aa205fd5f543c2477233a8b7df46c8acc088359473985f342095e8b0b780f6a1f', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-09 16:56:40', '2022-01-09 16:56:40', '2023-01-10 00:56:40'),
('3c3ec00991376446577e3a5ec6bc3afe14d6529af06842c99ce821c1d50e88f7ad559aa131fe6e19', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-04 22:00:57', '2022-01-04 22:00:57', '2023-01-05 06:00:57'),
('3c4f07c15771e960c57bc7c3b3571a0b98540ac1e1a771ce0a51e344ecc286d4291b08220eb2bc8f', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-02 18:53:59', '2022-01-02 18:53:59', '2023-01-03 02:53:59'),
('3c8e5b9dd293b15cd628e727fd739cbbd9578bcac95110dcf14826f02cbfb8ed5dedb17085925c17', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-03 07:52:34', '2022-02-03 07:52:34', '2023-02-03 15:52:34'),
('42e6cc0b27d599e03c06e4e5f4402f5ec132003439d1a21cf3918886054bb65730c5f6013d530b56', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 01:08:13', '2022-01-06 01:08:13', '2023-01-06 09:08:13'),
('43a4b9d75d063ed696cd8d68e06f33bc34a4cfe6f25873a8fe91f50163bc947025414dc0674f2e4b', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 18:31:59', '2022-01-11 18:31:59', '2023-01-12 02:31:59'),
('43b8ce2a8ca9cc650f043498ea30feb82e6cc724d78a8b4e6398dee3cb73ca702de47e29f99cb783', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 18:41:48', '2022-01-11 18:41:48', '2023-01-12 02:41:48'),
('441537552a8f837664b64d74b36021c519aed177c1c90bc48fe591848194dc3d5a205410ff30a3ae', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 08:34:21', '2021-12-31 08:34:21', '2022-12-31 16:34:21'),
('44402271c13fc25f30f158aae6019d7e48c3ae27ef3334343b51700f38ab27dce4199d9cbd4d2d19', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 22:47:58', '2022-01-03 22:47:58', '2023-01-04 06:47:58'),
('4a34479926019afecca979b7f3a829295c908cde2c5925520b3de4c11e95eb695aaae07f07a8225e', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-18 23:37:19', '2022-01-18 23:37:19', '2023-01-19 07:37:19'),
('4a4892f0e28d356ecff6ec434b97d5efd941a39dc5f8c07b78de1f077282448acae7deba638fab8b', 55, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:13:20', '2022-02-25 10:13:20', '2023-02-25 18:13:20'),
('4ae08506f044711218155027e448470c1edc5210e6b51da9aa0b211d821904799dba0bd247e7c007', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 21:28:29', '2022-01-05 21:28:29', '2023-01-06 05:28:29'),
('4c75988efe029b94b0bd21997e7a42b7dcbde0edbf84dda54f34467006bf695d3e5687b3e8fff22e', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-30 18:06:55', '2022-01-30 18:06:55', '2023-01-31 02:06:55'),
('4d877ad975a6b472e76e42ef2427eea8095f2f3cc6a6fb5dbedf6dda615aba6cf603fc96d8c8c4c0', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 00:51:53', '2022-01-08 00:51:53', '2023-01-08 08:51:53'),
('4d8a08d106cf98f08ae0247718c44a00c9ddf0de8a15be216ab4ac6b8102adee9ef6930d515bec93', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:41:53', '2022-01-07 21:41:53', '2023-01-08 05:41:53'),
('4d999c261602cc29249d233a9bd29aa9415ed8459c3c0233e57baa13aac31cb11e7352daf76a1e5f', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 07:16:29', '2022-01-07 07:16:29', '2023-01-07 15:16:29'),
('4eb59929f4a80ad7bad8eb75fe7c25c96ba70e4f7fe07c1b4f7745d9d27984cdb5003324ce98f548', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 08:31:42', '2021-12-31 08:31:42', '2022-12-31 16:31:42'),
('4fea56c8f33baaf2427564cbe4b6cc45455d0dd87096eb7f5fd86adca1e013ed85c4c602d14ea882', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 03:47:25', '2021-12-31 03:47:25', '2022-12-31 11:47:25'),
('4ff4d16e3b5ac8cc86142252099585ad2df9b1d125f3655657d27b3c24d35f865c351d987aa67f88', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 22:13:14', '2022-02-25 22:13:14', '2023-02-26 06:13:14'),
('50353dad8730b5058341a09553f54fdecc3945504e95ab282a370e17af1365362fedf8f63031b4da', 14, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 22:53:46', '2022-01-05 22:53:46', '2023-01-06 06:53:46'),
('509ab42650667eb7c8e7c566536144a6799a3d0ffa3f18f0c405bf112d983b2a356c119c5891b323', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:33:39', '2022-01-07 21:33:39', '2023-01-08 05:33:39'),
('51032e534066d5775bebf9d76d7368cf9e3043d8a70c5d3e09cf352b2f94ef65778b932f968be943', 68, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-26 06:45:54', '2022-02-26 06:45:54', '2023-02-26 14:45:54'),
('51c6a510b264b0d77bf8509949eb682c8f7a724fccd9244615aeebf0341ae4e1d1babc4a08c770b9', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 21:17:11', '2022-01-05 21:17:11', '2023-01-06 05:17:11'),
('53d82140023b6463b4e9b52e41cf6109729b7d238ab842dabd033b8e694e65714c613cfb35da7755', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 12:45:46', '2022-02-07 12:45:46', '2023-02-07 20:45:46'),
('5466374804f5da714c0ee114ac46ca5e07f9310a3d4668079aab13fe3ce7a511a1c9b199ffa724ff', 67, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-26 06:15:01', '2022-02-26 06:15:01', '2023-02-26 14:15:01'),
('54b9202e3b2622695c7f5a9e24d7bbaeeb3fdfd36f8cd10898a5885f33cd36c7fd56d6a1d2d0c59f', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 20:57:20', '2021-12-30 20:57:20', '2022-12-31 04:57:20'),
('5a471f198a6281878ef7a8f1775f82648db9c645e49b002595678b5a0c1d603e306d46488edbb215', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:34:43', '2022-01-07 21:34:43', '2023-01-08 05:34:43'),
('5a5e0f9b0ac7883f75a7181c06c350674eae7cb02f6e79972454dc5c4aac0d8774f23c9b5fb3618e', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 06:48:35', '2022-01-08 06:48:35', '2023-01-08 14:48:35'),
('5a663e46365a096bef2872d8b5c12dfb018e49bbf0ada69be2408f636b3dd8fb4c72941a103fdb59', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 01:19:50', '2022-02-23 01:19:50', '2023-02-23 09:19:50'),
('5bfd176ae88e3744e2eca482d2d1b9a8b4878fcd656810375fbbbb0b723b0daeb8c535a319c878ae', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 16:28:09', '2021-12-28 16:28:09', '2022-12-29 00:28:09'),
('5c50f65860a326d66b552ad82bf8e9eaa418cd5f7f4e3e9e223f43a704e80eb15064228b1a8d78f8', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 21:16:24', '2022-01-06 21:16:24', '2023-01-07 05:16:24'),
('5f0256d5e0a77a11b2a699e32217f77e00cc30641d7570bc546dd7a437975631ad4e1a56ce5325c7', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 21:34:37', '2022-01-05 21:34:37', '2023-01-06 05:34:37'),
('6001f5c1cc1095ebbde1560a65dd478a9b428818e5024b50983c81295cd207ea1f942ae54571d642', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 18:05:04', '2022-02-23 18:05:04', '2023-02-24 02:05:04'),
('6022926f0c94ae4b0df70b48f3fe6217bee7b6e70919f1435a0641b51a6cbebab91c08996f5a2036', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 18:04:57', '2021-12-29 18:04:57', '2022-12-30 02:04:57'),
('60e611cc1d23952a9658c2dc5aef68482724d14bbbc982806edaae466c42a7713cc9b9e0c28dba00', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 21:20:03', '2022-01-06 21:20:03', '2023-01-07 05:20:03'),
('623cee0da31673b4411fabdbf4769dae9031996d7a98c97d99e295cf72f73d5409aa2dd9992f1728', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 17:24:57', '2021-12-30 17:24:57', '2022-12-31 01:24:57'),
('643baed8f355955cd55f3e61db97b2b30ceb13c451efa302dfa99346506a0777c566a75f4638805e', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 21:18:53', '2022-01-05 21:18:53', '2023-01-06 05:18:53'),
('675d4cda828abc98f0e39b679e34dc8c8c3bcdeb2c563c2475ccc20dcc9c8d78249dd9f957527dbe', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-04 18:43:37', '2022-01-04 18:43:37', '2023-01-05 02:43:37'),
('683bf05b22e21590e12a7ba7de84d2d6594b93b1ab496dc8a7e9b1b1ce78a207f5cb9916bc23502b', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 01:52:57', '2022-02-23 01:52:57', '2023-02-23 09:52:57'),
('69cc008c74d95da069c9f28247c9fb9bc74dfae2ef804458d5604294aeace6a087d7386ba9371402', 14, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 22:48:59', '2022-01-05 22:48:59', '2023-01-06 06:48:59'),
('69ccb3f44f023f9f32bcc0f838cf7c414fb2488bc03ad46eb3288f6765f364a504aab549a2bd77bc', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-12 06:43:20', '2022-01-12 06:43:20', '2023-01-12 14:43:20'),
('6a2c9693fff98b924e6c122ccf5ce2026d3a9a37e287e1c4e5bae993b3c3fdc9adc2c4760392f753', 46, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:49:58', '2022-02-25 10:49:58', '2023-02-25 18:49:58'),
('6d13a1449422754a9e1e7fd299e9f8f71cf569e08578c8a49fdc9695d0b8bf7e27667c4512320751', 47, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 04:50:15', '2022-02-25 04:50:15', '2023-02-25 12:50:15'),
('6d7a5b5b91aa4a86ed34ee515e6fc3df670d59531054f2dacef1d186642465fffd9d56c5e6fb1eb6', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 04:35:00', '2021-12-31 04:35:00', '2022-12-31 12:35:00'),
('6e7adc4d655604527fa2149a226c9028c7fcf526fd5019cb17aaee6a2f1a9cabaf38dcf90e4a3bd1', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 15:19:11', '2022-01-08 15:19:11', '2023-01-08 23:19:11'),
('705ba45cd63c7b7b2ecee858feb5780eac786a255be56394c194a3b34475161033b2b816ff27063c', 36, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-22 09:38:20', '2022-02-22 09:38:20', '2023-02-22 17:38:20'),
('71c775f4c72b7698969a5fdf2c3da2a6d2d5c8aa66f1c419f0e87f11bc449fdf8657e4a431d1c352', 45, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 02:32:14', '2022-02-25 02:32:14', '2023-02-25 10:32:14'),
('7280e990465afe67eb2d371c676f9b665a08525e49085fc200136367938681d027bcf1319fef8e45', 43, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 18:50:49', '2022-02-23 18:50:49', '2023-02-24 02:50:49'),
('74821caf6d2ac22e9b6ef8dfc0a698a590d76ad1c837388ab52e38abcb073f6ca80b6ff10344b8a2', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 12:45:39', '2022-02-07 12:45:39', '2023-02-07 20:45:39'),
('757063555d459dcc7cce329aa8aacf51b2f5b8192cf9be71f74ef1764adca54eb30475b643b93914', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 17:55:14', '2021-12-29 17:55:14', '2022-12-30 01:55:14'),
('75892dcd672ead45c95e324ffa430e57c49e4a60c3c2ea0e855dddd0f4614c2386baaed729d21e70', 13, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 21:47:54', '2022-01-05 21:47:54', '2023-01-06 05:47:54'),
('779752a9692ed4d550ccff03d26f635df43375a865c94c3e18e82da09701f8d1095691f61d8e5550', 49, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 08:23:34', '2022-02-25 08:23:34', '2023-02-25 16:23:34'),
('784dae95df96ef61f8138a3b959744a5cd879d95e2b33ac256b146224c105ad12e9bc8696812893e', 16, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 20:05:33', '2022-01-07 20:05:33', '2023-01-08 04:05:33'),
('792beb9f87d06576c7908f3d365b5feb98a2d9c71677ff1ffde0ad0bcb833c4d6c6b23a35863011d', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 07:16:43', '2022-02-08 07:16:43', '2023-02-08 15:16:43'),
('79a5b17c0076d72329b13d6ae0d40953b49c6d6771a37aff46ce23496f7281a7a9995a384517da6a', 58, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:30:23', '2022-02-25 10:30:23', '2023-02-25 18:30:23'),
('79f5527a90d2c2195c13bc2f22738cb6ad741530585679b6e58630f26f474c7f130fd9c3809221ea', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-30 18:55:57', '2022-01-30 18:55:57', '2023-01-31 02:55:57'),
('7b3d68657f25661ea504e300c0b0c2281d189633450594e1d9fe08c7af1c9ef490ac72dd09d81e87', 4, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 17:28:16', '2021-12-30 17:28:16', '2022-12-31 01:28:16'),
('7b9ad4d0a151bee3209e85b544c343dff5af2787f62a59cd77044bf5445d0e89468e6c287e8dbcfa', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 18:33:05', '2022-01-03 18:33:05', '2023-01-04 02:33:05'),
('812c8587c694d358e8783e482a011fcd5a3f0cc60fb183bdfb5eb5752501005d758128179ff326fc', 60, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:49:20', '2022-02-25 10:49:20', '2023-02-25 18:49:20'),
('818542fbd348e70ee6af11544d6e29ae26c02b4655b6b8e2a34e4adce5f8b735757348e6624dd69c', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 17:30:14', '2022-01-03 17:30:14', '2023-01-04 01:30:14'),
('8284518210f8b5d99af902312956ce3f4aa077494f722e4905f830ec7b82bfa39747893a318fccd6', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 17:42:08', '2022-01-03 17:42:08', '2023-01-04 01:42:08'),
('838a1b1289dacc3cd554ec3dd6f35232896bcbe02abbe4bea7a220db640c2d6082e2215a603af6bf', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 15:20:00', '2022-01-08 15:20:00', '2023-01-08 23:20:00'),
('846f4be36d7d2975e95f0c60a0b0be8a9cec3fc0e47368d0babacc9ff813feb23d5c9c29631524a7', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 00:22:58', '2022-02-23 00:22:58', '2023-02-23 08:22:58'),
('852ac3cfedae03cc5cde1d69a475a51cce94500c2666da3fac041808f8f4a610abe509e48948938e', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 18:54:31', '2022-01-03 18:54:31', '2023-01-04 02:54:31'),
('89e3f21e8cd79ad02f513e21327567b1995953b40455bc6d18e9f10aee38937c38a618031ddda839', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 21:34:20', '2022-01-05 21:34:20', '2023-01-06 05:34:20'),
('8a40a6b00571bbc1bea0ebca233a51c2e5a570097093610d5a84c1f806a18ea00abde385b1981cee', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 19:23:55', '2022-01-03 19:23:55', '2023-01-04 03:23:55'),
('8b077f0766d3ab34f93603dc08e6e61a1e8e43a2397a464ff061d2e0ec05aff64e1800d170c03020', 30, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 03:49:41', '2022-02-08 03:49:41', '2023-02-08 11:49:41'),
('8c61f126db6a6ccf3c0ac7d59c8f3f839982aae5a1bad046efb018abaf2b6e83c06c32023150c4b7', 32, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-12 22:39:27', '2022-02-12 22:39:27', '2023-02-13 06:39:27'),
('8d2e8a6cd049ffad60dc4effcb54785b3b0953a6a9a2117da39f65a2d00f99fe085dd5e0443b09cb', 4, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 08:14:53', '2021-12-28 08:14:53', '2022-12-28 16:14:53'),
('8f2cf0c4beb353a453f64983fd1a32cd71403a781c477416fc1c81d0fd2748a3b0dc47ce4a11cb0d', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 12:45:55', '2022-02-07 12:45:55', '2023-02-07 20:45:55'),
('9206e57ad0dcf8a4df5a637ae864eb7088a05a1b9a4ce47e77a845a20841b4689664dcf3b1b8afe7', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-15 02:20:48', '2022-02-15 02:20:48', '2023-02-15 10:20:48'),
('92804fa01545d971587b64d216802b1f8e2bdea7c7388f8b447acd557023418adb0a80e7e7d9989e', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:55:18', '2022-01-07 21:55:18', '2023-01-08 05:55:18'),
('932c77cc24b6d409addc052e6794cf6c5f901699a88e755746afc4ce5a77c8b948b8ec667e60789e', 14, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 00:40:47', '2022-01-06 00:40:47', '2023-01-06 08:40:47'),
('93eb7d8f7517394c44cfb3a9f6ea43c3b7d5b9472b9cb6d417af1b7d815752a7df0c679e348f6692', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 00:50:37', '2022-01-06 00:50:37', '2023-01-06 08:50:37'),
('97b6ed4b39d0d64dbd35a8cac3d1ca5142f0251a26ad4d8116d0fc392dee89c5f49f08e0730fdecc', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 19:20:26', '2022-01-03 19:20:26', '2023-01-04 03:20:26'),
('9895b1686d3e2b8b0b5b7bf6b7a295e3ed7a7514807c4c2bc3b850ecaab985459cf4b48e1f61e90f', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 19:18:19', '2022-01-07 19:18:19', '2023-01-08 03:18:19'),
('9a230c77939a392527cf3920deee545546c5a089660ec568b65f6814f56123d212606d907ff80274', 21, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-10 07:33:28', '2022-01-10 07:33:28', '2023-01-10 15:33:28'),
('9b5143193a246762d2ca70e73278faa0f01b6b3f5cbaeebcdf621e0804fb5aa52be6992e68c93fb3', 53, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 09:09:03', '2022-02-25 09:09:03', '2023-02-25 17:09:03'),
('9cfbb8c2976812e7980c0834b8dda13618d904377670abc36f681d2bb805c07c952e09ca058d8795', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 17:59:34', '2022-01-03 17:59:34', '2023-01-04 01:59:34'),
('9f7bb3fea19cbb156b550dfd88fe6d73cd38b895d0cc0ea22ceda0fea061b21ecca3e14b13b2629a', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 08:18:27', '2021-12-31 08:18:27', '2022-12-31 16:18:27'),
('a1df67582c4a021caf8b5326c76f0f2841d80478897c3727171d244fee71f8cfdadd44357e5109c5', 15, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 22:14:44', '2022-01-05 22:14:44', '2023-01-06 06:14:44'),
('a259293e68782e9b23d55b4ab5a797ceb55068120f3774f14c710f532dd0ef94f316595b951519be', 35, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-17 08:08:33', '2022-02-17 08:08:33', '2023-02-17 16:08:33'),
('a370ecb131278d852254654ee9c255b71d991189aeb141cdfb2848760ba9b31f1444890a2fc08f09', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 18:51:51', '2022-01-03 18:51:51', '2023-01-04 02:51:51'),
('a3e7eccd24319ee0fb265f3040e42e1a3990270c202823b93cee2bf2ddc924f8c3be9f8e67a527b1', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 18:46:47', '2022-01-03 18:46:47', '2023-01-04 02:46:47'),
('a4568e0f106c0f7cc7b2267315d119731c6029ff7cdab19e2d1fe58dad6707623899055f10921448', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 03:21:20', '2022-02-23 03:21:20', '2023-02-23 11:21:20'),
('a6e8eecf25d4ee64ec1978a7e68192d66aa8498e9e3a9aec563eef52b2aeaa299353b8c6658e0455', 25, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-26 00:11:54', '2022-01-26 00:11:54', '2023-01-26 08:11:54'),
('a8ff89b1ca5d4cb9f069c30355270531b188c3f22591458c86eb3060290e10d1c8b5b63899384c1b', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:54:58', '2022-01-07 21:54:58', '2023-01-08 05:54:58'),
('aab379630aea4730836f7fd8e5d06371b4abc5aa2f0a982769ab039fddd929525974d609a1dcb893', 66, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-26 03:30:11', '2022-02-26 03:30:11', '2023-02-26 11:30:11'),
('aca4fb865dff9425e91ba9f9520498db22d7329d3edf98e20b2aa4add5ce34cd8fe511e846974d11', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 04:01:13', '2021-12-31 04:01:13', '2022-12-31 12:01:13'),
('ae50b7a44294fd573e59752df3e9110a0b613631df7558953dc671c489cc627917f25886bf2fbe69', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-16 07:09:29', '2022-02-16 07:09:29', '2023-02-16 15:09:29'),
('b0970a82cd28ee59fa499ac08f51c0b78c09716b0b19b4fb92f32849f4a6559aff46ad01e7f741f2', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:39:38', '2022-01-07 21:39:38', '2023-01-08 05:39:38'),
('b111a0c8c7abce669388a758ae94a5f95af31868a4a04b1bc9624dd1bfef8271d8a88ffe200a1dff', 34, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-16 06:50:04', '2022-02-16 06:50:04', '2023-02-16 14:50:04'),
('b14fe58c9480e1214e8e95ce2c1ddc8b633f262c87f36665be23d6ba22d5b77cbaeeb09161004074', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:13:47', '2022-01-07 21:13:47', '2023-01-08 05:13:47'),
('b16a67803345503cee0f7c048dcff17b426d9f0212828ae7dbbf4c68357d3cadd7946cae4f9d96fe', 14, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 22:15:34', '2022-01-05 22:15:34', '2023-01-06 06:15:34'),
('b18e920e75c7c7b10e9458fa1beb93723cd1c36dca347e30180f96dc1dbef5a11dfe2646dc558b94', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 20:43:38', '2022-01-07 20:43:38', '2023-01-08 04:43:38'),
('b4e832011fb26ccbe94e46e38b51b2654844ca885779bf368858633909d90097f4db8a5ca4b9409d', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-03-01 02:01:44', '2022-03-01 02:01:44', '2023-03-01 10:01:44'),
('b64bfab6099ba9e24c4d1e6bf87075662a643c852d8f44be81abf95cf3db44aa0f8a7903f0a4dc90', 46, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:49:57', '2022-02-25 10:49:57', '2023-02-25 18:49:57'),
('b745b277fdf4a08fd28737ebaeba0e2f3527d3624f5cde475618209b66a2cd8a2041a62f8ef2abe3', 25, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-30 18:09:51', '2022-01-30 18:09:51', '2023-01-31 02:09:51'),
('b7af72bb2dd06513035cd9c0e9a67734365b7ffa4d7008a03f933ddfdc3f61ac52e00d40070835ee', 34, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-16 08:52:20', '2022-02-16 08:52:20', '2023-02-16 16:52:20'),
('b92eaee9332a5a545c658424335ac75aae4485d5ba496b718efae8fcb7d7618b440b4802d7cdbde9', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-27 17:55:07', '2022-02-27 17:55:07', '2023-02-28 01:55:07'),
('b9b14af601ac3bde16d7c013bb2a9e268c430442cde0e3786dba01095b18978c4383bea507a3671a', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 01:19:49', '2022-02-23 01:19:49', '2023-02-23 09:19:49'),
('bae661623e948fd2f96a94ac48136ac6d341f2483d5f763862a70b76e9c1b675a0893918a0c75512', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 20:54:42', '2022-01-07 20:54:42', '2023-01-08 04:54:42'),
('bb02fc16f239caeca4932cd252631976e46fc451bcde618c9da5b15b25a7fd023d5eb8def299865c', 22, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 00:52:49', '2022-01-08 00:52:49', '2023-01-08 08:52:49'),
('bcf1b60cf6b6c0310d3dbaa41d85b4ab3b362f2bf7d5b2537daf6b8848a97575491b25c913e56147', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-03-03 07:21:43', '2022-03-03 07:21:43', '2023-03-03 15:21:43'),
('bd53a9724f776d159ac44b86e82333f1fd400f290a1f312159d46d9e12517276175888b9786a3acf', 31, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-10 23:50:16', '2022-02-10 23:50:16', '2023-02-11 07:50:16'),
('bdb3d83241e7d2817ce4e55e943b86d2fd48bcb32cf6d38357b0de1b90b3004068361a4bed97ab80', 19, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:26:06', '2022-01-07 21:26:06', '2023-01-08 05:26:06'),
('c1f188092bd9c63195d0b6211b458e474add63d580a97bf1becc62e0c06cb5cdc528bc8c0fe80820', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:33:08', '2022-01-07 21:33:08', '2023-01-08 05:33:08'),
('c28b9e848791dee0dff8432d88fbacc2a2a8100bc930d21d1cfbc76a0766539d282d30c2fcb681be', 64, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-26 00:18:52', '2022-02-26 00:18:52', '2023-02-26 08:18:52'),
('c2ab66c06d5846070ea2b1710bcb6d21b27dd5efe78d2edf2eb161ad727689a59f8ed34165afeda3', 10, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-04 19:04:30', '2022-01-04 19:04:30', '2023-01-05 03:04:30'),
('c55f8f5621f8d0d7ef08d787fa088720e2acdfe62afa1b3178439b3f11f58e3dbba75e05847faedf', 26, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-30 18:49:39', '2022-01-30 18:49:39', '2023-01-31 02:49:39'),
('c6f436a4aeb9a3bd91ee033e51016f2c7ae13068d33e1d1dbce1eebe2050448a6f2804e573c7fc43', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-17 17:45:52', '2022-01-17 17:45:52', '2023-01-18 01:45:52'),
('c708cf885409855de568a4dd4344d9c247b2860f5ef4952a3ba959f58fe2f86a21eac277f7b87269', 25, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-26 00:13:24', '2022-01-26 00:13:24', '2023-01-26 08:13:24'),
('c75ff2befbf1a7250f752a5127e27b033ca0e9821f681e09620a36363fba4dc67678f36b8705dd61', 33, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-15 02:21:28', '2022-02-15 02:21:28', '2023-02-15 10:21:28'),
('c838b381a4bf4b68278e7748e7915390540dacddb7aa57cd43d3290cb20e94051dc2fa9dce3707c4', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-05 20:50:46', '2022-01-05 20:50:46', '2023-01-06 04:50:46'),
('cc67c14726b98162cf45e62a1f9d91778532bb2982baad34bebeb1a5739d8dcf7dabbaedb7627e44', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 19:38:13', '2022-01-07 19:38:13', '2023-01-08 03:38:13'),
('cc968ee4e6184b932d096201ac085269f057eee60771f900b2c698e4895ea85693fd8b8d8e6b568b', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 01:19:51', '2022-02-23 01:19:51', '2023-02-23 09:19:51'),
('cd39071d2721b34fa0c88b64d97c4c8fec4a3b6a2a6c53f0e106ff05a5210fb432d181d302e1fe8e', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 07:59:01', '2021-12-29 07:59:01', '2022-12-29 15:59:01'),
('ce425be208df8462009976cf3f1ed630257015a3022636ee0000a1d2046bd6604d553f9d6deac033', 8, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-04 18:28:37', '2022-01-04 18:28:37', '2023-01-05 02:28:37'),
('ce90b98fe7cf3529b9a70a9e82e5af135b8ac6849c9b376d41a3fc885ac32acdbb2fae220b6f1c51', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 18:09:54', '2022-02-23 18:09:54', '2023-02-24 02:09:54'),
('cf46fa2283aecf3979f49a020a253322d3afc3ca04b3e04487fdab21cf8f611fea381fcfa66f5d74', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 21:46:44', '2022-01-07 21:46:44', '2023-01-08 05:46:44'),
('cfb55a3a47711f96885eb1a11584ac2c0fa9d26cd7f68119b24162060ab36f0d20b9ebbabafab5d5', 46, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:44:08', '2022-02-25 10:44:08', '2023-02-25 18:44:08'),
('d318602d0cafc529ba40c5ec29f8e4de5b904cd4b5426a9714ccaae61631b24f3e46f018e3af1004', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-16 06:54:50', '2022-02-16 06:54:50', '2023-02-16 14:54:50'),
('d414e787d5bcbb58d4b61c0b97d6212bc2ebf90811f9852315a19c215dcb778a323c95571e643c5b', 24, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-12 06:48:37', '2022-01-12 06:48:37', '2023-01-12 14:48:37'),
('d72e2def018c9b38eebedf16ce8560557ddf0ccf6351a2ac341d2983441fb8227af1ff73efcd1030', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 00:52:11', '2022-01-08 00:52:11', '2023-01-08 08:52:11'),
('d8c2b0a2054daebef60c2f92c4b4099fbe3ad8d3a95927bd10db427c1a9f588fca386192c6dd31ed', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 17:26:30', '2021-12-30 17:26:30', '2022-12-31 01:26:30'),
('d93a866a3bc8a8cf12ac57c37d2ce322a260fae54775a0e222d8d06f2b182b5b28478c4b93a23df8', 44, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 19:01:03', '2022-02-23 19:01:03', '2023-02-24 03:01:03'),
('d9e4187836a60952bed16156d25b3b42495e7d94edc0f7229d5c7c4e2907dae0e27c18eb5b89c1bb', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 00:37:36', '2021-12-31 00:37:36', '2022-12-31 08:37:36'),
('da3d221b1ce8cb6daf8941e45bd10b8a36d1c782b3f475b65c99ba03b51ce5d73f6b9f4d4e87b6f5', 34, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-16 17:37:13', '2022-02-16 17:37:13', '2023-02-17 01:37:13'),
('da52ce525cbe05382b4051b402c03aaf5da9350b1c4b07b5e7e56e652979bfefe1091d7281122c47', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:20:54', '2022-02-25 10:20:54', '2023-02-25 18:20:54'),
('dccb3e7a5d1fab409cc47fb538e38d1712f536b4cf6cf99d19a783cd574c3f7a47bae6de9c26e199', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-22 09:41:11', '2022-02-22 09:41:11', '2023-02-22 17:41:11'),
('dd2fc67e35f5a4774ed7dd6c774709faa2385cf0dd7b7ad76756fac46cd0297486c08ff5b606b833', 46, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:43:30', '2022-02-25 10:43:30', '2023-02-25 18:43:30'),
('dd35dd67e2eae672eff1169370ed64ab663c47906c7f8f5dd2734dc18590510ecf012ae6f56a71e7', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-16 16:58:51', '2022-01-16 16:58:51', '2023-01-17 00:58:51'),
('dd74c84225ad42c6cf2312cab1b64c257cd8f498ba71485198bb4a0d4618799723789eea483839b6', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-04 18:43:08', '2022-01-04 18:43:08', '2023-01-05 02:43:08'),
('df3ef4569672d48409c1f5d9cc934ebd11decfb659cc75cb34ec6a2b3940657d400d4898568c79e5', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 23:47:51', '2022-01-11 23:47:51', '2023-01-12 07:47:51'),
('dfea9edef3f120fda94744d456436a82617eab316e0e9e79e7f7b130fbb9538b97d352839ee330e6', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 00:21:17', '2022-02-07 00:21:17', '2023-02-07 08:21:17'),
('e01f3793d3ab164c47593362307c076c69416167e78aeb4b50f2f4d1a7e52758ccfaf04db83c0231', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 17:39:34', '2022-01-03 17:39:34', '2023-01-04 01:39:34'),
('e276eda603d749901c1bf9effc239ef32ffb4a1f22448d8e05f1af7253dd015cba09a2e87b1f6724', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-25 23:03:32', '2022-01-25 23:03:32', '2023-01-26 07:03:32'),
('e2e3f5cb015c152164440e144edab446f41a986424b5fff8655b829a98cc7d2490c5020fbca487a7', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 21:19:32', '2022-01-06 21:19:32', '2023-01-07 05:19:32'),
('e5b7dd92daf45fcc9ab693c80ed1a0291c9dd584e24c851395428e3c4d10174ad184e0d8651a3a14', 65, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-26 03:12:08', '2022-02-26 03:12:08', '2023-02-26 11:12:08'),
('e638f5dfc43e34816f416d28bee92788d452744c30df7e6c91d262e8788a236b6e67bf8e1822902c', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 17:50:27', '2021-12-29 17:50:27', '2022-12-30 02:50:27'),
('e90280a97ed64414b2225c945e353130396dd4711e29c99c53d1226100e7c8b261b7c7bf0818a697', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-12 06:37:27', '2022-01-12 06:37:27', '2023-01-12 14:37:27'),
('eb0d2060910568bcfa09f225993f27925061e06650035553eafaa34642c1af22a317c8bc27282d15', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 18:11:33', '2022-02-23 18:11:33', '2023-02-24 02:11:33'),
('ebf3ce7bb2748675221c05d959fe31c1d0677e2936f91ac8a10a643edc539e41e45e3cde66eca4b1', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 02:09:27', '2021-12-29 02:09:27', '2022-12-29 10:09:27'),
('ee3c7ee03a70cd84b3b26d9c2ce949f4d625a774f33a5f67d03af324415b789d1d74bc596073f0b6', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 08:59:14', '2021-12-31 08:59:14', '2022-12-31 16:59:14'),
('ef02a047cc140cc3c3b4423685092d9e3b38237d5829804b00b8d6bd3ab7d19529c077d7655e4725', 8, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-04 18:22:54', '2022-01-04 18:22:54', '2023-01-05 02:22:54'),
('ef34c304af8363ca32a9fd28f2c7dff46d34b49055610faaf2d5834481a1fe091da453b22cfaef98', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 01:32:39', '2022-01-06 01:32:39', '2023-01-06 09:32:39'),
('eff31b54b44c536e146f7203566315af44a3972a1168453980c66aa114aee96639283de7e8727b73', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-04 22:11:33', '2022-01-04 22:11:33', '2023-01-05 06:11:33'),
('f1ed5d1647c88e58939c3c0dcd549137cb6b452b669af17fc6f868d92cab4834078d2f832eab318b', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-09 16:35:17', '2022-01-09 16:35:17', '2023-01-10 00:35:17'),
('f5d70416e7bfdfcce4268a2f095bf5955c023ad393f1057ef4beddedc6e8e586ade7bb8a3608143f', 48, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 04:53:32', '2022-02-25 04:53:32', '2023-02-25 12:53:32'),
('f75b7edab2fcf3b86eeb8de29dfa0bfc6c22395844227d122c6e6e8838dbd60fb315b5d94babd5cf', 14, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 00:50:15', '2022-01-06 00:50:15', '2023-01-06 08:50:15'),
('f7aedd5e5dbe94ba4ec6dc0c121bf71a76f05a9d479ecce5dac035b277aad3fdc4c70115bb7bd9ff', 38, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-22 09:52:10', '2022-02-22 09:52:10', '2023-02-22 17:52:10'),
('f8b8fa5bb357b32041e4c00b45ecd1216855cec2292c43535127cfa1ea0a64773bf9e386eae377f7', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 02:18:09', '2022-02-23 02:18:09', '2023-02-23 10:18:09'),
('fb3f0ac4f0a2dab81618adcb503e68bbc7cd4be99fd17bcd64f59a865a8af8a6242102baa0052c03', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-15 02:22:45', '2022-02-15 02:22:45', '2023-02-15 10:22:45'),
('fb7f4f1efe5667f429b508e27f156e62fe0c5ff51563baca1eff03db3b810b3ac15a6847bd077b3d', 39, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-22 23:34:33', '2022-02-22 23:34:33', '2023-02-23 07:34:33'),
('fd989d4d22a1adfc0201687dd75042e277ec9d3cd1c233ce679c44e958bcc7ed6f2a6acff565eb39', 54, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-25 10:12:00', '2022-02-25 10:12:00', '2023-02-25 18:12:00'),
('fe349b7e8301049bd5b90008eb153da8c098b12e964b9e050aadd1ee3db26808826e512332f7db4b', 41, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-23 01:09:05', '2022-02-23 01:09:05', '2023-02-23 09:09:05'),
('febf5b1028890e37dd91560409d40f9710e480759853ed1d22c4025666a8aa9b9c63dfe9a8503dea', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-12 06:45:42', '2022-01-12 06:45:42', '2023-01-12 14:45:42'),
('feccdb9a7438e8d4cb757dde5fe9376e1a5b90aaf99954ecf3825c438dbeb1600625a2526f9fd55b', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 09:27:52', '2022-01-06 09:27:52', '2023-01-06 17:27:52'),
('ffc8299683101d89735a8a4bdeaa878db1d895487c00cbfe9451ae728b5e4b9e44535683cd9ba226', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 19:23:26', '2022-01-03 19:23:26', '2023-01-04 03:23:26');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'ahmed', 'YTU2JKogY8Mo8n14mxL5yLaO5Tc7tjKCWdVtrXDN', NULL, 'http://localhost', 1, 0, 0, '2021-12-28 08:14:11', '2021-12-28 08:14:11');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-12-28 08:14:11', '2021-12-28 08:14:11');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `order_amount` decimal(8,2) NOT NULL,
  `payment_status` varchar(191) DEFAULT 'pending',
  `payment_method` varchar(30) DEFAULT NULL,
  `transaction_reference` varchar(30) DEFAULT NULL,
  `order_status` varchar(191) NOT NULL DEFAULT 'pending',
  `confirmed` timestamp NULL DEFAULT NULL,
  `accepted` timestamp NULL DEFAULT NULL,
  `scheduled` tinyint(1) NOT NULL DEFAULT 0,
  `processing` timestamp NULL DEFAULT NULL,
  `handover` timestamp NULL DEFAULT NULL,
  `failed` timestamp NULL DEFAULT NULL,
  `scheduled_at` timestamp NULL DEFAULT NULL,
  `delivery_address_id` bigint(20) DEFAULT NULL,
  `order_note` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `delivery_charge` decimal(6,2) DEFAULT NULL,
  `delivery_address` text NOT NULL,
  `otp` varchar(191) NOT NULL,
  `pending` timestamp NULL DEFAULT NULL,
  `picked_up` timestamp NULL DEFAULT NULL,
  `delivered` timestamp NULL DEFAULT NULL,
  `canceled` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_amount`, `payment_status`, `payment_method`, `transaction_reference`, `order_status`, `confirmed`, `accepted`, `scheduled`, `processing`, `handover`, `failed`, `scheduled_at`, `delivery_address_id`, `order_note`, `created_at`, `updated_at`, `delivery_charge`, `delivery_address`, `otp`, `pending`, `picked_up`, `delivered`, `canceled`) VALUES
(100001, 22, 36.00, NULL, '', '', 'pending', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'Note about food', '2022-01-08 06:35:12', '2022-01-08 06:35:12', NULL, '{\"contact_person_name\":\"as\",\"contact_person_number\":\"1\",\"address\":\"test\",\"longitude\":\"\",\"latitude\":\"\"}', '4976', '2022-01-08 06:35:12', NULL, NULL, NULL),
(100002, 22, 6479.00, NULL, '', '', 'pending', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'Note about food', '2022-01-08 06:43:27', '2022-01-08 06:43:27', NULL, '{\"contact_person_name\":\"as\",\"contact_person_number\":\"1\",\"address\":\"test\",\"longitude\":\"\",\"latitude\":\"\"}', '2115', '2022-01-08 06:43:27', NULL, NULL, NULL),
(100003, 27, 56.00, 'pending', 'paypal', 'PAYID-MIQN7AQ22W926030N577731P', 'success', NULL, NULL, 0, NULL, NULL, '2022-03-03 07:32:18', NULL, NULL, 'Note about food', '2022-03-03 07:21:50', '2022-03-03 07:32:18', NULL, '{\"contact_person_name\":\"dylan\",\"contact_person_number\":\"123456\",\"address\":\"309 SW Broadway, Portland, OR 97205, USA\",\"longitude\":\"-122.67854869365692\",\"latitude\":\"45.521708425968995\"}', '1839', '2022-03-03 07:21:50', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `food_id` bigint(20) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `food_details` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `tax_amount` decimal(8,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `test` int(11) NOT NULL DEFAULT 7
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `f_name`, `phone`, `email`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `order_count`) VALUES
(27, 'dylan', '123456', 'a@a.com', 1, NULL, '$2y$10$4HNDC4q5C2csQD0DzFwkheWH9upu/IX5UK8X2xNP2flgqv/hBRfrS', NULL, '2022-01-30 18:55:57', '2022-01-30 18:55:57', 0),
(28, '123456', '1234567', 'b@b.com', 1, NULL, '$2y$10$2jpKDnyVTKpYuxER5Y35GODeBV/h35KQOZPlwcSAvBF1hKdrTczn.', NULL, '2022-01-30 19:05:37', '2022-01-30 19:05:37', 0),
(29, 'ahmed', '1', 'c@c.com', 1, NULL, '$2y$10$hKwCLxEu05m28wZxq2xBc.mGqe5pjnOx/Bk9RL5v588yYcprDiD/.', NULL, '2022-01-31 00:35:28', '2022-01-31 00:35:28', 0),
(30, 'Tester', '123123123', 'test@dmail.com', 1, NULL, '$2y$10$Z.C4UusLSn9FFkrof7YYLeMOA8PlUxg.9GXmBZNsGU8Y4fWdFk.xO', NULL, '2022-02-08 03:49:41', '2022-02-08 03:49:41', 0),
(31, 'Ahmed', '13761849016', 'mjdazaa87@yahoo.com', 1, NULL, '$2y$10$qVWfv9G0BycS3TWuVt.8LexQi2VUR8tu1f3sr8aDA9ozHS23oDrMW', NULL, '2022-02-10 23:50:16', '2022-02-10 23:50:16', 0),
(32, 'telllll', '12', 'cc@cc.co', 1, NULL, '$2y$10$IMCOIel3Ta0xY1tyOHDzeOLjHE1FGQDHB5e1NR/adlAoRfylYONy6', NULL, '2022-02-12 22:39:27', '2022-02-12 22:39:27', 0),
(33, 'Ahmed nowww', '2', 'c@cc.com', 1, NULL, '$2y$10$7UIUIgVJmL1D0R7qwPm4BOBjmzFGjYtG7IFEmz18M95fbRdw4d9NC', NULL, '2022-02-15 02:21:28', '2022-02-15 02:21:28', 0),
(34, 'Akhmet', '87078546060', 'ahmet_07@mail.ru', 1, NULL, '$2y$10$n2Fx9nnR.VJNT8WkaDKUEu8PfFmXtV/6OTWVXfVYfD0t1d1IjKNlW', NULL, '2022-02-16 06:50:04', '2022-02-16 06:50:04', 0),
(35, 'ff', '5', 'dd@dd.com', 1, NULL, '$2y$10$ttYX2D217QzCmGmfA9Q00uryG7xCwnG3AGl0uoq3I2uUko8tiZ6fm', NULL, '2022-02-17 08:08:33', '2022-02-17 08:08:33', 0),
(36, 'huy', '0977233398', 'quanghuy@gmail.com', 1, NULL, '$2y$10$K6t3N1t00vNUxU.lx6ONo..1Q7/MR7q1VpYLKVsFZrQLQVwIqWbbu', NULL, '2022-02-22 09:38:20', '2022-02-22 09:38:20', 0),
(37, 'Quang Huy', '0937268554', 'huytq@gmail.com', 1, NULL, '$2y$10$wVcLF4h7lzYJ9J3O3ufp/.UWt9fhOWX04Unjjxwn3lCejq.YV2knu', NULL, '2022-02-22 09:41:11', '2022-02-22 09:41:11', 0),
(38, 'sds', '098765432', 'huytq1@gmail.com', 1, NULL, '$2y$10$ndLt8CNVFa8SClIIE7a15uFVvk.P41MRFf5znPwuBj8bOWImjml.u', NULL, '2022-02-22 09:52:10', '2022-02-22 09:52:10', 0),
(39, 'tuanson', '0906340620', 'sonbt@gmail.com', 1, NULL, '$2y$10$95ENY1VvUMum9A7ZDTX4DOhUa5G1e2M3Y9JoUoB0rOhApzk1dnOKa', NULL, '2022-02-22 23:34:33', '2022-02-22 23:34:33', 0),
(40, 'tuanson', '0906240410', 'sonbt@hqplay.vn', 1, NULL, '$2y$10$OTTbiyI5TQl8pQNS1SEd9es/nusgQ.QwOa/Hun/YxE/vLZmyo9Mza', NULL, '2022-02-23 00:22:58', '2022-02-23 00:22:58', 0),
(41, 'tuanson', '0906240411', 'son@hqplay.vn', 1, NULL, '$2y$10$2d6omv/1OdwXvBbuzNePweOMNI1LGH9Vl/l7CsaW2Uzh2eXoPdBPq', NULL, '2022-02-23 01:09:05', '2022-02-23 01:09:05', 0),
(42, '12', '0987654321', 'test@gmail.com', 1, NULL, '$2y$10$nX01lQGeByW25UELTIFuJeGx66JTqy09mEqccZcjMWNdnN4liDFIO', NULL, '2022-02-23 18:47:06', '2022-02-23 18:47:06', 0),
(43, '12', '1234567890', 'test1@gmail.com', 1, NULL, '$2y$10$iOIAvcwWloVNWI79rwk7FeK9yyI3VbLMYGPxXOZYKDalLdiy50346', NULL, '2022-02-23 18:50:49', '2022-02-23 18:50:49', 0),
(44, 'd', 'd', 't@gmail.com', 1, NULL, '$2y$10$LLppI4ej1gaYpawXkg5cUeLSv9nWXlg6w/v6tGickmZFyqD9As83q', NULL, '2022-02-23 19:01:03', '2022-02-23 19:01:03', 0),
(45, 'Ahmed', '12345678', 'info@dbestech.com', 1, NULL, '$2y$10$d4BqmNrQG68SKUNYPVfboOcRMEzufSZBH2b43kUA554t80ZpazJdu', NULL, '2022-02-25 02:32:14', '2022-02-25 02:32:14', 0),
(46, 'Ahmed', '123456789', 'info1@dbestech.com', 1, NULL, '$2y$10$7HPVbMoXn7OTkcEHrkqa3ug7gJaYZBvftSM3e7WJ0fL/4ZIqPWARW', NULL, '2022-02-25 02:43:20', '2022-02-25 02:43:20', 0),
(47, 'sas', '12455566', 's@a.com', 1, NULL, '$2y$10$h.cWcLl/SFvLad1MAL.SUOLwoM4BiSir2iKg5/L3MHqCeQZKuQca6', NULL, '2022-02-25 04:50:15', '2022-02-25 04:50:15', 0),
(48, 'txdbestech', '213214', 'aa@a.com', 1, NULL, '$2y$10$UXeBYn1IZX9fN95WzL1Z7OxjsQAqwWUhu0BvzOJiqxZOrFha/HGm2', NULL, '2022-02-25 04:53:32', '2022-02-25 04:53:32', 0),
(49, 'giddiness', '12444444', 'aaa@a.com', 1, NULL, '$2y$10$Bb7P6t7d5vUAxyoUmSKDEe7IrqVWB3v8O38Iyrj9yfd.D8f6Elclq', NULL, '2022-02-25 08:23:34', '2022-02-25 08:23:34', 0),
(50, 'ricky', '123432', 'b@c.com', 1, NULL, '$2y$10$A5ZcZedLRRZETHY7CzHSA.f0RMGunr5iBe236/8m.lCd3fLuYNKEu', NULL, '2022-02-25 08:49:07', '2022-02-25 08:49:07', 0),
(51, 'kumarsanga', '882829', 'sl@cricket.com', 1, NULL, '$2y$10$0FPtjxwhP4cJxR.2s8a2XOK/VSYC0Vj8Aupe8peWWq33860jsPo4W', NULL, '2022-02-25 08:52:01', '2022-02-25 08:52:01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `coordinates` polygon NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_wise_topic` varchar(191) DEFAULT NULL,
  `customer_wise_topic` varchar(191) DEFAULT NULL,
  `deliveryman_wise_topic` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `name`, `coordinates`, `status`, `created_at`, `updated_at`, `restaurant_wise_topic`, `customer_wise_topic`, `deliveryman_wise_topic`) VALUES
(2, 'american', 0x000000000103000000010000000d000000a7ae16e73fc559c0c6ada38e10ba4540a7ae16e73f1f5ac0bb921158d39d4340d4ad16e73fe458c09ad3eca2a9da4540a7ae16e7bf5f5dc0ab5c9ffe76d14740a7ae16e73f2a5ec0ddae516852114340a7ae16e73f4c5ac0acc0ff07d7993e40d4ad16e73f7c57c09ed3f02f0e623d40d4ad16e7bf8753c0fa91cbf688a64240d4ad16e73f1753c078b91c1606d24440d4ad16e73f9b56c08a9e77fb12574740a7ae16e73f9859c0ab5c9ffe76d14740a7ae16e7bf5f5dc03aa313f4b7ef4740a7ae16e73fc559c0c6ada38e10ba4540, 1, '2022-01-14 14:45:07', '2022-01-14 14:45:07', 'zone_1_restaurant', 'zone_1_customer', 'zone_1_delivery_man');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Indexes for table `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Indexes for table `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Indexes for table `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Indexes for table `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_types`
--
ALTER TABLE `food_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zones_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `food_types`
--
ALTER TABLE `food_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100156;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
