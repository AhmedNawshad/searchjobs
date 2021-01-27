-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 26, 2021 at 08:47 AM
-- Server version: 5.6.41-84.1
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ivzuqxmy_oscajlnrjobs`
--

DELIMITER $$
--
-- Functions
--
$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `advertising`
--

CREATE TABLE `advertising` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `provider_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tracking_code_large` text COLLATE utf8_unicode_ci,
  `tracking_code_medium` text COLLATE utf8_unicode_ci,
  `tracking_code_small` text COLLATE utf8_unicode_ci,
  `active` tinyint(1) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `advertising`
--

INSERT INTO `advertising` (`id`, `slug`, `provider_name`, `tracking_code_large`, `tracking_code_medium`, `tracking_code_small`, `active`) VALUES
(1, 'top', 'Google AdSense', '', '', '', 0),
(2, 'bottom', 'Google AdSense', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `applicants`
--

CREATE TABLE `applicants` (
  `id` int(11) NOT NULL,
  `appl_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applicants`
--

INSERT INTO `applicants` (`id`, `appl_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-11-30 18:50:20', '2020-11-30 18:50:20'),
(2, 2, '2020-11-30 19:13:30', '2020-11-30 19:13:30');

-- --------------------------------------------------------

--
-- Table structure for table `blacklist`
--

CREATE TABLE `blacklist` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('domain','email','ip','word') COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` mediumtext COLLATE utf8_unicode_ci,
  `expiration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT '0',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_class` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('classified','job-offer','job-search','not-salable') COLLATE utf8_unicode_ci DEFAULT 'classified' COMMENT 'Only select this for parent categories',
  `active` tinyint(1) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `translation_lang`, `translation_of`, `parent_id`, `name`, `slug`, `description`, `picture`, `icon_class`, `lft`, `rgt`, `depth`, `type`, `active`) VALUES
(6, 'en', 6, 0, 'Accounting/ Auditing / Finance', 'public-service', NULL, NULL, NULL, 185, 186, 2, 'classified', 1),
(16, 'en', 16, 0, 'Agriculture/ Dairy/ Environment', 'agriculture-dairy-environment', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(17, 'en', 17, 0, 'Apparel/Clothing', 'apparel-clothing', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(18, 'en', 18, 0, 'Banking/Insurance', 'banking-insurance', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(19, 'en', 19, 0, 'Civil Engineering/Interior Design/Architecture', 'civil-engineering-interior-design-architecture', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(20, 'en', 20, 0, 'Corporate Management/Analysts', 'corporate-management-analysts', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(21, 'en', 21, 0, 'Customer Relations/Public Relations', 'customer-relations-public-relations', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(22, 'en', 22, 0, 'Engineering-Mechanical/Auto/Electrical', 'engineering-mechanical-auto-electrical', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(23, 'en', 23, 0, 'Fashion/Design/Beauty', 'fashion-design-beauty', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(24, 'en', 24, 0, 'Hospital/Nursing/Healthcare', 'hospital-nursing-healthcare', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(25, 'en', 25, 0, 'Hospitality/Tourism', 'hospitality-tourism', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(26, 'en', 26, 0, 'Hotels/Restaurants/Food', 'hotels-restaurants-food', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(27, 'en', 27, 0, 'Human Resource/Training', 'human-resource-training', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(28, 'en', 28, 0, 'Imports/Exports', 'imports-exports', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(29, 'en', 29, 0, 'International Development', 'international-development', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(30, 'en', 30, 0, 'IT-Hardware/Networks/Systems', 'it-hardware-networks-systems', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(31, 'en', 31, 0, 'IT-Software/Database/Quality Assurance/Web/Graphics/GIS', 'it-software-database-quality-assurance-web-graphics-gis', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(32, 'en', 32, 0, 'IT-Telecommunication', 'it-telecommunication', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(33, 'en', 33, 0, 'KPO/BPO', 'kpo-bpo', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(34, 'en', 34, 0, 'Legal/Law', 'legal-law', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(35, 'en', 35, 0, 'Logistics/Warehouse/Transport', 'logistics-warehouse-transport', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(36, 'en', 36, 0, 'Manufacturing/Operations', 'manufacturing-operations', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(37, 'en', 37, 0, 'Media/Advert/Communication', 'media-advert-communication', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(38, 'en', 38, 0, 'Office Admin/Secretary/Receptionist', 'office-admin-secretary-receptionist', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(39, 'en', 39, 0, 'Research and Development/Science/Research', 'research-and-development-science-research', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(40, 'en', 40, 0, 'Sales/Marketing/Merchandising', 'sales-marketing-merchandising', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(41, 'en', 41, 0, 'Security', 'security', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(42, 'en', 42, 0, 'Sports/Fitness/Recreation', 'sports-fitness-recreation', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(43, 'en', 43, 0, 'Supervision/Quality Control', 'supervision-quality-control', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(44, 'en', 44, 0, 'Teaching/Academic/Library', 'teaching-academic-library', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1),
(45, 'en', 45, 0, 'Ticketing/Airline/Marine', 'ticketing-airline-marine', NULL, NULL, NULL, NULL, NULL, NULL, 'classified', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'ISO-3166 2-letter country code, 2 characters',
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'name of geographical point (utf8) varchar(200)',
  `asciiname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'name of geographical point in plain ascii characters, varchar(200)',
  `longitude` float DEFAULT NULL COMMENT 'longitude in decimal degrees (wgs84)',
  `latitude` float DEFAULT NULL COMMENT 'latitude in decimal degrees (wgs84)',
  `feature_class` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'see http://www.geonames.org/export/codes.html, char(1)',
  `feature_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'see http://www.geonames.org/export/codes.html, varchar(10)',
  `subadmin1_code` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'fipscode (subject to change to iso code), see exceptions below, see file admin1Codes.txt for display names of this code; varchar(20)',
  `subadmin2_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'code for the second administrative division, a county in the US, see file admin2Codes.txt; varchar(80)',
  `population` bigint(20) DEFAULT NULL COMMENT 'bigint (4 byte int) ',
  `time_zone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'the timezone id (see file timeZone.txt)',
  `active` tinyint(1) UNSIGNED DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_code`, `name`, `asciiname`, `longitude`, `latitude`, `feature_class`, `feature_code`, `subadmin1_code`, `subadmin2_code`, `population`, `time_zone`, `active`, `created_at`, `updated_at`) VALUES
(1223648, 'LK', 'Welisara', 'Welisara', 7.0281, 79.9014, 'P', 'PPL', 'LK.36', NULL, 41306, 'Asia/Colombo', 1, '2006-01-26 23:00:00', '2006-01-26 23:00:00'),
(1223738, 'LK', 'Weligama', 'Weligama', 5.97501, 80.4297, 'P', 'PPL', 'LK.34', NULL, 22179, 'Asia/Colombo', 1, '2012-11-07 23:00:00', '2012-11-07 23:00:00'),
(1224061, 'LK', 'Wattegama', 'Wattegama', 6.7989, 81.4808, 'P', 'PPL', 'LK.35', NULL, 8000, 'Asia/Colombo', 1, '2006-01-16 23:00:00', '2006-01-16 23:00:00'),
(1224085, 'LK', 'Wattala', 'Wattala', 6.9779, 79.8898, 'P', 'PPL', 'LK.36', NULL, 30725, 'Asia/Colombo', 1, '2012-01-16 23:00:00', '2012-01-16 23:00:00'),
(1225018, 'LK', 'Vavuniya', 'Vavuniya', 8.7514, 80.4971, 'P', 'PPL', 'LK.38', NULL, 60176, 'Asia/Colombo', 1, '2012-04-04 23:00:00', '2012-04-04 23:00:00'),
(1225142, 'LK', 'Valvedditturai', 'Valvedditturai', 9.81667, 80.1667, 'P', 'PPL', 'LK.38', NULL, 78205, 'Asia/Colombo', 1, '2012-04-04 23:00:00', '2012-04-04 23:00:00'),
(1225187, 'LK', 'Vakarai', 'Vakarai', 8.13333, 81.4333, 'P', 'PPL', 'LK.37', NULL, 21000, 'Asia/Colombo', 1, '2017-12-12 23:00:00', '2017-12-12 23:00:00'),
(1226260, 'LK', 'Trincomalee', 'Trincomalee', 8.5711, 81.2335, 'P', 'PPLA', 'LK.37', NULL, 108420, 'Asia/Colombo', 1, '2012-01-15 23:00:00', '2012-01-15 23:00:00'),
(1227037, 'LK', 'Tangalla', 'Tangalla', 6.02338, 80.7974, 'P', 'PPL', 'LK.34', NULL, 10497, 'Asia/Colombo', 1, '2017-07-16 23:00:00', '2017-07-16 23:00:00'),
(1228730, 'LK', 'Ratnapura', 'Ratnapura', 6.68278, 80.3992, 'P', 'PPLA', 'LK.33', NULL, 47832, 'Asia/Colombo', 1, '2013-06-27 23:00:00', '2013-06-27 23:00:00'),
(1229293, 'LK', 'Puttalam', 'Puttalam', 8.0362, 79.8283, 'P', 'PPL', 'LK.32', NULL, 45661, 'Asia/Colombo', 1, '2012-01-16 23:00:00', '2012-01-16 23:00:00'),
(1229901, 'LK', 'Polonnaruwa', 'Polonnaruwa', 7.93965, 81.0027, 'P', 'PPL', 'LK.30', NULL, 13900, 'Asia/Colombo', 1, '2012-11-07 23:00:00', '2012-11-07 23:00:00'),
(1229989, 'LK', 'Point Pedro', 'Point Pedro', 9.81667, 80.2333, 'P', 'PPL', 'LK.38', NULL, 89810, 'Asia/Colombo', 1, '2012-04-04 23:00:00', '2012-04-04 23:00:00'),
(1230089, 'LK', 'Pita Kotte', 'Pita Kotte', 6.8905, 79.9015, 'P', 'PPL', 'LK.36', NULL, 118179, 'Asia/Colombo', 1, '2006-01-16 23:00:00', '2006-01-16 23:00:00'),
(1230613, 'LK', 'Peliyagoda', 'Peliyagoda', 6.9685, 79.8836, 'P', 'PPL', 'LK.36', NULL, 30717, 'Asia/Colombo', 1, '2012-01-16 23:00:00', '2012-01-16 23:00:00'),
(1231410, 'LK', 'Panadura', 'Panadura', 6.7132, 79.9026, 'P', 'PPL', 'LK.36', NULL, 33735, 'Asia/Colombo', 1, '2012-01-16 23:00:00', '2012-01-16 23:00:00'),
(1232783, 'LK', 'Nuwara Eliya', 'Nuwara Eliya', 6.97078, 80.7829, 'P', 'PPL', 'LK.29', 'LK.29.1232781', 25775, 'Asia/Colombo', 1, '2013-09-20 23:00:00', '2013-09-20 23:00:00'),
(1233369, 'LK', 'Negombo', 'Negombo', 7.2083, 79.8358, 'P', 'PPL', 'LK.36', NULL, 137223, 'Asia/Colombo', 1, '2012-01-16 23:00:00', '2012-01-16 23:00:00'),
(1234378, 'LK', 'Mulleriyawa', 'Mulleriyawa', 6.933, 79.9297, 'P', 'PPL', 'LK.36', NULL, 33540, 'Asia/Colombo', 1, '2006-01-16 23:00:00', '2006-01-16 23:00:00'),
(1234569, 'LK', 'Dehiwala-Mount Lavinia', 'Dehiwala-Mount Lavinia', 6.84019, 79.8712, 'P', 'PPL', 'LK.36', 'LK.36.1248990', 219827, 'Asia/Colombo', 1, '2015-12-12 23:00:00', '2015-12-12 23:00:00'),
(1234633, 'LK', 'Moratuwa', 'Moratuwa', 6.773, 79.8816, 'P', 'PPL', 'LK.36', NULL, 185031, 'Asia/Colombo', 1, '2012-01-16 23:00:00', '2012-01-16 23:00:00'),
(1234808, 'LK', 'Monaragala', 'Monaragala', 6.8714, 81.3487, 'P', 'PPL', 'LK.35', NULL, 10236, 'Asia/Colombo', 1, '2012-01-16 23:00:00', '2012-01-16 23:00:00'),
(1235000, 'LK', 'Minuwangoda', 'Minuwangoda', 7.1663, 79.9533, 'P', 'PPL', 'LK.36', NULL, 7772, 'Asia/Colombo', 1, '2012-01-16 23:00:00', '2012-01-16 23:00:00'),
(1235846, 'LK', 'Matara', 'Matara', 5.94851, 80.5353, 'P', 'PPL', 'LK.34', NULL, 76254, 'Asia/Colombo', 1, '2010-06-14 23:00:00', '2010-06-14 23:00:00'),
(1235855, 'LK', 'Matale', 'Matale', 7.4698, 80.6217, 'P', 'PPL', 'LK.29', NULL, 36462, 'Asia/Colombo', 1, '2017-12-13 23:00:00', '2017-12-13 23:00:00'),
(1236854, 'LK', 'Maharagama', 'Maharagama', 6.848, 79.9265, 'P', 'PPL', 'LK.36', NULL, 66576, 'Asia/Colombo', 1, '2012-01-16 23:00:00', '2012-01-16 23:00:00'),
(1237980, 'LK', 'Kurunegala', 'Kurunegala', 7.4863, 80.3623, 'P', 'PPLA', 'LK.32', NULL, 28571, 'Asia/Colombo', 1, '2012-01-13 23:00:00', '2012-01-13 23:00:00'),
(1238427, 'LK', 'Kuliyapitiya', 'Kuliyapitiya', 7.4688, 80.0401, 'P', 'PPL', 'LK.32', NULL, 6877, 'Asia/Colombo', 1, '2012-01-16 23:00:00', '2012-01-16 23:00:00'),
(1238992, 'LK', 'Sri Jayewardenepura Kotte', 'Sri Jayewardenepura Kotte', 6.88297, 79.9071, 'P', 'PPL', 'LK.36', NULL, 115826, 'Asia/Colombo', 1, '2015-04-23 23:00:00', '2015-04-23 23:00:00'),
(1239047, 'LK', 'Kotikawatta', 'Kotikawatta', 6.9269, 79.9095, 'P', 'PPL', 'LK.36', NULL, 64565, 'Asia/Colombo', 1, '2013-04-02 23:00:00', '2013-04-02 23:00:00'),
(1239593, 'LK', 'Kolonnawa', 'Kolonnawa', 6.9329, 79.8848, 'P', 'PPL', 'LK.36', NULL, 58076, 'Asia/Colombo', 1, '2012-01-16 23:00:00', '2012-01-16 23:00:00'),
(1240372, 'LK', 'Kilinochchi', 'Kilinochchi', 9.3961, 80.3982, 'P', 'PPL', 'LK.38', NULL, 13006, 'Asia/Colombo', 1, '2012-04-04 23:00:00', '2012-04-04 23:00:00'),
(1240622, 'LK', 'Kelaniya', 'Kelaniya', 6.9553, 79.922, 'P', 'PPL', 'LK.36', NULL, 28846, 'Asia/Colombo', 1, '2013-04-12 23:00:00', '2013-04-12 23:00:00'),
(1240723, 'LK', 'Kegalle', 'Kegalle', 7.2523, 80.3436, 'P', 'PPL', 'LK.33', NULL, 17962, 'Asia/Colombo', 1, '2017-12-12 23:00:00', '2017-12-12 23:00:00'),
(1240935, 'LK', 'Katunayaka', 'Katunayaka', 7.16992, 79.8884, 'P', 'PPLA3', 'LK.36', NULL, 84643, 'Asia/Colombo', 1, '2014-08-04 23:00:00', '2014-08-04 23:00:00'),
(1241076, 'LK', 'Kataragama', 'Kataragama', 6.4134, 81.3346, 'P', 'PPL', 'LK.35', NULL, 20935, 'Asia/Colombo', 1, '2017-06-21 23:00:00', '2017-06-21 23:00:00'),
(1241622, 'LK', 'Kandy', 'Kandy', 7.2955, 80.6356, 'P', 'PPLA', 'LK.29', NULL, 111701, 'Asia/Colombo', 1, '2012-01-13 23:00:00', '2012-01-13 23:00:00'),
(1241750, 'LK', 'Kandana', 'Kandana', 7.048, 79.8937, 'P', 'PPL', 'LK.36', NULL, 33424, 'Asia/Colombo', 1, '2012-01-16 23:00:00', '2012-01-16 23:00:00'),
(1241964, 'LK', 'Kalutara', 'Kalutara', 6.5831, 79.9593, 'P', 'PPL', 'LK.36', NULL, 38000, 'Asia/Colombo', 1, '2014-02-01 23:00:00', '2014-02-01 23:00:00'),
(1242110, 'LK', 'Kalmunai', 'Kalmunai', 7.40902, 81.8347, 'P', 'PPL', 'LK.37', NULL, 100171, 'Asia/Colombo', 1, '2014-05-02 23:00:00', '2014-05-02 23:00:00'),
(1242833, 'LK', 'Jaffna', 'Jaffna', 9.66845, 80.0074, 'P', 'PPLA', 'LK.38', NULL, 169102, 'Asia/Colombo', 1, '2013-06-27 23:00:00', '2013-06-27 23:00:00'),
(1242835, 'LK', 'Ja Ela', 'Ja Ela', 7.0744, 79.8919, 'P', 'PPL', 'LK.36', NULL, 32175, 'Asia/Colombo', 1, '2006-01-26 23:00:00', '2006-01-26 23:00:00'),
(1243867, 'LK', 'Horana South', 'Horana South', 6.7159, 80.0626, 'P', 'PPL', 'LK.36', NULL, 8982, 'Asia/Colombo', 1, '2012-01-16 23:00:00', '2012-01-16 23:00:00'),
(1243936, 'LK', 'Homagama', 'Homagama', 6.844, 80.0024, 'P', 'PPL', 'LK.36', NULL, 34664, 'Asia/Colombo', 1, '2006-01-16 23:00:00', '2006-01-16 23:00:00'),
(1244397, 'LK', 'Hendala', 'Hendala', 6.9909, 79.883, 'P', 'PPL', 'LK.36', NULL, 56978, 'Asia/Colombo', 1, '2006-01-16 23:00:00', '2006-01-16 23:00:00'),
(1244596, 'LK', 'Hatton', 'Hatton', 6.8916, 80.5955, 'P', 'PPL', 'LK.29', NULL, 15073, 'Asia/Colombo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(1244773, 'LK', 'Hanwella Ihala', 'Hanwella Ihala', 6.9012, 80.0852, 'P', 'PPL', 'LK.36', NULL, 22918, 'Asia/Colombo', 1, '2006-01-26 23:00:00', '2006-01-26 23:00:00'),
(1246000, 'LK', 'Gampola', 'Gampola', 7.1643, 80.5696, 'P', 'PPL', 'LK.29', NULL, 24730, 'Asia/Colombo', 1, '2012-01-16 23:00:00', '2012-01-16 23:00:00'),
(1246007, 'LK', 'Gampaha', 'Gampaha', 7.0897, 79.9925, 'P', 'PPL', 'LK.36', NULL, 9350, 'Asia/Colombo', 1, '2012-01-16 23:00:00', '2012-01-16 23:00:00'),
(1246294, 'LK', 'Galle', 'Galle', 6.0367, 80.217, 'P', 'PPLA', 'LK.34', NULL, 93118, 'Asia/Colombo', 1, '2012-01-13 23:00:00', '2012-01-13 23:00:00'),
(1246321, 'LK', 'Galkissa', 'Galkissa', 6.8293, 79.863, 'P', 'PPL', 'LK.36', NULL, 215941, 'Asia/Colombo', 1, '2006-01-26 23:00:00', '2006-01-26 23:00:00'),
(1246924, 'LK', 'Eravur Town', 'Eravur Town', 7.7782, 81.6038, 'P', 'PPL', 'LK.37', NULL, 22982, 'Asia/Colombo', 1, '2012-04-04 23:00:00', '2012-04-04 23:00:00'),
(1248749, 'LK', 'Dambulla', 'Dambulla', 7.86, 80.6517, 'P', 'PPL', 'LK.29', 'LK.29.1235854', 66716, 'Asia/Colombo', 1, '2015-04-10 23:00:00', '2015-04-10 23:00:00'),
(1248991, 'LK', 'Colombo', 'Colombo', 6.93194, 79.8478, 'P', 'PPLC', 'LK.36', NULL, 648034, 'Asia/Colombo', 1, '2007-02-16 23:00:00', '2007-02-16 23:00:00'),
(1249145, 'LK', 'Chilaw', 'Chilaw', 7.57583, 79.7953, 'P', 'PPL', 'LK.32', NULL, 24712, 'Asia/Colombo', 1, '2012-01-16 23:00:00', '2012-01-16 23:00:00'),
(1249931, 'LK', 'Beruwala', 'Beruwala', 6.4788, 79.9828, 'P', 'PPL', 'LK.36', NULL, 34250, 'Asia/Colombo', 1, '2012-01-31 23:00:00', '2012-01-31 23:00:00'),
(1249978, 'LK', 'Bentota', 'Bentota', 6.42598, 79.9958, 'P', 'PPL', 'LK.34', NULL, 37000, 'Asia/Colombo', 1, '2013-04-12 23:00:00', '2013-04-12 23:00:00'),
(1250161, 'LK', 'Batticaloa', 'Batticaloa', 7.7102, 81.6924, 'P', 'PPL', 'LK.37', NULL, 86742, 'Asia/Colombo', 1, '2012-04-04 23:00:00', '2012-04-04 23:00:00'),
(1250164, 'LK', 'Battaramulla South', 'Battaramulla South', 6.8964, 79.9181, 'P', 'PPL', 'LK.36', NULL, 75633, 'Asia/Colombo', 1, '2012-01-16 23:00:00', '2012-01-16 23:00:00'),
(1250615, 'LK', 'Badulla', 'Badulla', 6.9895, 81.0557, 'P', 'PPLA', 'LK.35', NULL, 47587, 'Asia/Colombo', 1, '2013-06-27 23:00:00', '2013-06-27 23:00:00'),
(1251081, 'LK', 'Anuradhapura', 'Anuradhapura', 8.31223, 80.4131, 'P', 'PPLA', 'LK.30', NULL, 60943, 'Asia/Colombo', 1, '2013-04-02 23:00:00', '2013-04-02 23:00:00'),
(1251459, 'LK', 'Ampara', 'Ampara', 7.29754, 81.682, 'P', 'PPL', 'LK.37', NULL, 18348, 'Asia/Colombo', 1, '2012-11-07 23:00:00', '2012-11-07 23:00:00'),
(1251574, 'LK', 'Ambalangoda', 'Ambalangoda', 6.2355, 80.0538, 'P', 'PPL', 'LK.34', NULL, 20133, 'Asia/Colombo', 1, '2012-01-16 23:00:00', '2012-01-16 23:00:00'),
(6285792, 'LK', 'Horawala Junction', 'Horawala Junction', 6.48088, 80.1271, 'P', 'PPL', 'LK.36', NULL, 7500, 'Asia/Colombo', 1, '2011-06-13 23:00:00', '2011-06-13 23:00:00'),
(8260318, 'LK', 'Shanjeev Home', 'Shanjeev Home', 7.38216, 81.842, 'P', 'PPL', 'LK.37', NULL, 20000, 'Asia/Colombo', 1, '2013-11-07 23:00:00', '2013-11-07 23:00:00'),
(9259456, 'LK', 'Mount Lavinia', 'Mount Lavinia', 6.83947, 79.8645, 'P', 'PPLX', 'LK.36', 'LK.36.1248990', 219827, 'Asia/Colombo', 1, '2015-12-12 23:00:00', '2015-12-12 23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `city_id` int(10) UNSIGNED DEFAULT '0',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `googleplus` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pinterest` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `user_id`, `name`, `logo`, `description`, `country_code`, `city_id`, `address`, `phone`, `fax`, `email`, `website`, `facebook`, `twitter`, `linkedin`, `googleplus`, `pinterest`, `created_at`, `updated_at`) VALUES
(1, 1, 'LOLOLOL', 'files/lk/1https://job.remaxroyalproperty.com/storage/app/default/picture.jpg', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.', 'LK', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-24 11:40:47', '2020-12-03 14:35:39'),
(2, 1, 'Lorem Ipsum Company', 'files/lk/2/0be6fc7bbae92448f71fa5b946749455.jpeg', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.', 'LK', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-24 11:51:36', '2020-11-24 15:38:07'),
(3, 1, 'Trey Llc', 'files/lk/3/cc278fab1f349bf34ff0855841d8317f.png', 'fghfghfghgfSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.', 'LK', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-24 15:33:49', '2020-11-24 15:37:44'),
(6, 1, 'BOBO', 'files/lk/6/084cd1dc9bf6c8db91010764c96a3ef2.png', 'öoin sOIJÖF p o,kn.do di', 'LK', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-16 20:01:36', '2020-12-16 20:01:36'),
(7, 1, 'MENSI Plc', 'files/lk/7/b2185f823b6f7a30010ddc231ea976c8.png', 'kjn aoiapsjmäpo kvdsä posdäv psld\r\ns-mvösomväovsdvs', 'LK', 0, 'adressse here', '+658925225', NULL, 'test@test.com', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-16 20:17:35', '2020-12-16 20:18:40'),
(8, 7, 'ZRI Recruitment', 'files/lk/8/421fb99aa34e4f52e90beae3de3a20cf.png', '<p>ZRI Recruitment is an agency pioneered to adapt to your demanding needs, to help you find the right job with hourly support.</p>', 'LK', 1248991, '18, Frances Road, Colombo 06', '+94728941243', NULL, 'zrirecruitment@gmail.com', 'bewberfb', 'https://www.facebook.com/ZRIRecruitment/', 'webvw', 'ZRI Recruitment', 'vfvsf', 'vwfbvwfb', '2020-12-18 08:40:52', '2021-01-26 12:15:36'),
(9, 1, 'Hashcodelabs', NULL, 'devvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv', 'LK', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-18 10:59:30', '2020-12-24 15:35:44'),
(10, 38, 'Allex', 'files/lk/10/815caf0f899d4f5a0d11bf6fc509faef.jpg', '<p>Allex is a digital agency that leverages marketing, data and technology to help businesses grow. Our team comprises of creatives, writers and analysts that help brands across the world generate measurable results through sophisticated storytelling.</p>\n\n<p>Embracing a culture of transparency and equality in the workplace, we’ve built an environment helping Sri Lanka’s best marketing and creative talent thrive. Our team looks at untangling multivariate problems with an open mind and the willingness to constantly test and learn.</p>', 'LK', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-13 10:55:26', '2021-01-14 10:36:40');

-- --------------------------------------------------------

--
-- Table structure for table `company_followers`
--

CREATE TABLE `company_followers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_followers`
--

INSERT INTO `company_followers` (`id`, `user_id`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 25, 1, '2020-12-24 04:05:16', '2020-12-24 05:31:47'),
(2, 25, 2, '2020-12-24 04:05:16', '2020-12-24 05:31:47'),
(5, 25, 7, '2020-12-24 10:47:32', '2020-12-24 10:47:32'),
(4, 2, 9, '2020-12-24 10:38:31', '2020-12-24 10:38:31'),
(10, 1, 9, '2020-12-29 11:41:25', '2020-12-29 11:41:25'),
(11, 1, 8, '2020-12-29 20:45:57', '2020-12-29 20:45:57'),
(9, 30, 8, '2020-12-27 13:49:05', '2020-12-27 13:49:05'),
(12, 7, 9, '2020-12-30 10:52:34', '2020-12-30 10:52:34'),
(13, 6, 8, '2020-12-30 10:53:19', '2020-12-30 10:53:19'),
(14, 6, 10, '2021-01-23 12:13:03', '2021-01-23 12:13:03');

-- --------------------------------------------------------

--
-- Table structure for table `continents`
--

CREATE TABLE `continents` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `continents`
--

INSERT INTO `continents` (`id`, `code`, `name`, `active`) VALUES
(1, 'AF', 'Africa', 1),
(2, 'AN', 'Antarctica', 1),
(3, 'AS', 'Asia', 1),
(4, 'EU', 'Europe', 1),
(5, 'NA', 'North America', 1),
(6, 'OC', 'Oceania', 1),
(7, 'SA', 'South America', 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `iso3` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iso_numeric` int(10) UNSIGNED DEFAULT NULL,
  `fips` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `asciiname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capital` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area` int(10) UNSIGNED DEFAULT NULL,
  `population` int(10) UNSIGNED DEFAULT NULL,
  `continent_code` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tld` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code_format` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code_regex` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `languages` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `neighbours` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `equivalent_fips_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `background_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_type` enum('0','1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `admin_field_active` tinyint(1) UNSIGNED DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `iso3`, `iso_numeric`, `fips`, `name`, `asciiname`, `capital`, `area`, `population`, `continent_code`, `tld`, `currency_code`, `phone`, `postal_code_format`, `postal_code_regex`, `languages`, `neighbours`, `equivalent_fips_code`, `background_image`, `admin_type`, `admin_field_active`, `active`, `created_at`, `updated_at`) VALUES
(1, 'AD', 'AND', 20, 'AN', 'Andorra', 'Andorra', 'Andorra la Vella', 468, 84000, 'EU', '.ad', 'EUR', '376', 'AD###', '^(?:AD)*(d{3})$', 'ca', 'ES,FR', '', NULL, '0', 0, 0, NULL, NULL),
(2, 'AE', 'ARE', 784, 'AE', 'al-Imārāt', 'United Arab Emirates', 'Abu Dhabi', 82880, 4975593, 'AS', '.ae', 'AED', '971', '', '', 'ar-AE,fa,en,hi,ur', 'SA,OM', '', NULL, '0', 0, 0, NULL, NULL),
(3, 'AF', 'AFG', 4, 'AF', 'Afġānistān', 'Afghanistan', 'Kabul', 647500, 29121286, 'AS', '.af', 'AFN', '93', '', '', 'fa-AF,ps,uz-AF,tk', 'TM,CN,IR,TJ,PK,UZ', '', NULL, '0', 0, 0, NULL, NULL),
(4, 'AG', 'ATG', 28, 'AC', 'Antigua and Barbuda', 'Antigua and Barbuda', 'St. John\'s', 443, 86754, 'NA', '.ag', 'XCD', '+1-268', '', '', 'en-AG', '', '', NULL, '0', 0, 0, NULL, NULL),
(5, 'AI', 'AIA', 660, 'AV', 'Anguilla', 'Anguilla', 'The Valley', 102, 13254, 'NA', '.ai', 'XCD', '+1-264', '', '', 'en-AI', '', '', NULL, '0', 0, 0, NULL, NULL),
(6, 'AL', 'ALB', 8, 'AL', 'Shqipëria', 'Albania', 'Tirana', 28748, 2986952, 'EU', '.al', 'ALL', '355', '', '', 'sq,el', 'MK,GR,ME,RS,XK', '', NULL, '0', 0, 0, NULL, NULL),
(7, 'AM', 'ARM', 51, 'AM', 'Hayastan', 'Armenia', 'Yerevan', 29800, 2968000, 'AS', '.am', 'AMD', '374', '######', '^(d{6})$', 'hy', 'GE,IR,AZ,TR', '', NULL, '0', 0, 0, NULL, NULL),
(8, 'AN', 'ANT', 530, 'NT', 'Netherlands Antilles', 'Netherlands Antilles', 'Willemstad', 960, 136197, 'NA', '.an', 'ANG', '599', '', '', 'nl-AN,en,es', 'GP', '', NULL, '0', 0, 0, NULL, NULL),
(9, 'AO', 'AGO', 24, 'AO', 'Angola', 'Angola', 'Luanda', 1246700, 13068161, 'AF', '.ao', 'AOA', '244', '', '', 'pt-AO', 'CD,NA,ZM,CG', '', NULL, '0', 0, 0, NULL, NULL),
(10, 'AQ', 'ATA', 10, 'AY', 'Antarctica', 'Antarctica', '', 14000000, 0, 'AN', '.aq', '', '', '', '', '', '', '', NULL, '0', 0, 0, NULL, NULL),
(11, 'AR', 'ARG', 32, 'AR', 'Argentina', 'Argentina', 'Buenos Aires', 2766890, 41343201, 'SA', '.ar', 'ARS', '54', '@####@@@', '^([A-Z]d{4}[A-Z]{3})$', 'es-AR,en,it,de,fr,gn', 'CL,BO,UY,PY,BR', '', NULL, '0', 0, 0, NULL, NULL),
(12, 'AS', 'ASM', 16, 'AQ', 'American Samoa', 'American Samoa', 'Pago Pago', 199, 57881, 'OC', '.as', 'USD', '+1-684', '', '', 'en-AS,sm,to', '', '', NULL, '0', 0, 0, NULL, NULL),
(13, 'AT', 'AUT', 40, 'AU', 'Österreich', 'Austria', 'Vienna', 83858, 8205000, 'EU', '.at', 'EUR', '43', '####', '^(d{4})$', 'de-AT,hr,hu,sl', 'CH,DE,HU,SK,CZ,IT,SI,LI', '', NULL, '0', 0, 0, NULL, NULL),
(14, 'AU', 'AUS', 36, 'AS', 'Australia', 'Australia', 'Canberra', 7686850, 21515754, 'OC', '.au', 'AUD', '61', '####', '^(d{4})$', 'en-AU', '', '', NULL, '0', 0, 0, NULL, NULL),
(15, 'AW', 'ABW', 533, 'AA', 'Aruba', 'Aruba', 'Oranjestad', 193, 71566, 'NA', '.aw', 'AWG', '297', '', '', 'nl-AW,es,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(16, 'AX', 'ALA', 248, '', 'Aland Islands', 'Aland Islands', 'Mariehamn', 1580, 26711, 'EU', '.ax', 'EUR', '+358-18', '#####', '^(?:FI)*(d{5})$', 'sv-AX', '', 'FI', NULL, '0', 0, 0, NULL, NULL),
(17, 'AZ', 'AZE', 31, 'AJ', 'Azərbaycan', 'Azerbaijan', 'Baku', 86600, 8303512, 'AS', '.az', 'AZN', '994', 'AZ ####', '^(?:AZ)*(d{4})$', 'az,ru,hy', 'GE,IR,AM,TR,RU', '', NULL, '0', 0, 0, NULL, NULL),
(18, 'BA', 'BIH', 70, 'BK', 'Bosna i Hercegovina', 'Bosnia and Herzegovina', 'Sarajevo', 51129, 4590000, 'EU', '.ba', 'BAM', '387', '#####', '^(d{5})$', 'bs,hr-BA,sr-BA', 'HR,ME,RS', '', NULL, '0', 0, 0, NULL, NULL),
(19, 'BB', 'BRB', 52, 'BB', 'Barbados', 'Barbados', 'Bridgetown', 431, 285653, 'NA', '.bb', 'BBD', '+1-246', 'BB#####', '^(?:BB)*(d{5})$', 'en-BB', '', '', NULL, '0', 0, 0, NULL, NULL),
(20, 'BD', 'BGD', 50, 'BG', 'Bāṅlādēś', 'Bangladesh', 'Dhaka', 144000, 156118464, 'AS', '.bd', 'BDT', '880', '####', '^(d{4})$', 'bn-BD,en', 'MM,IN', '', NULL, '0', 0, 0, NULL, NULL),
(21, 'BE', 'BEL', 56, 'BE', 'Belgique', 'Belgium', 'Brussels', 30510, 10403000, 'EU', '.be', 'EUR', '32', '####', '^(d{4})$', 'nl-BE,fr-BE,de-BE', 'DE,NL,LU,FR', '', NULL, '0', 0, 0, NULL, NULL),
(22, 'BF', 'BFA', 854, 'UV', 'Burkina Faso', 'Burkina Faso', 'Ouagadougou', 274200, 16241811, 'AF', '.bf', 'XOF', '226', '', '', 'fr-BF', 'NE,BJ,GH,CI,TG,ML', '', NULL, '0', 0, 0, NULL, NULL),
(23, 'BG', 'BGR', 100, 'BU', 'Bŭlgarija', 'Bulgaria', 'Sofia', 110910, 7148785, 'EU', '.bg', 'BGN', '359', '####', '^(d{4})$', 'bg,tr-BG,rom', 'MK,GR,RO,TR,RS', '', NULL, '0', 0, 0, NULL, NULL),
(24, 'BH', 'BHR', 48, 'BA', 'al-Baḥrayn', 'Bahrain', 'Manama', 665, 738004, 'AS', '.bh', 'BHD', '973', '####|###', '^(d{3}d?)$', 'ar-BH,en,fa,ur', '', '', NULL, '0', 0, 0, NULL, NULL),
(25, 'BI', 'BDI', 108, 'BY', 'Burundi', 'Burundi', 'Bujumbura', 27830, 9863117, 'AF', '.bi', 'BIF', '257', '', '', 'fr-BI,rn', 'TZ,CD,RW', '', NULL, '0', 0, 0, NULL, NULL),
(26, 'BJ', 'BEN', 204, 'BN', 'Bénin', 'Benin', 'Porto-Novo', 112620, 9056010, 'AF', '.bj', 'XOF', '+229', '', '', 'fr-BJ', 'NE,TG,BF,NG', '', NULL, '0', 0, 0, NULL, '2016-05-09 20:55:29'),
(27, 'BL', 'BLM', 652, 'TB', 'Saint Barthelemy', 'Saint Barthelemy', 'Gustavia', 21, 8450, 'NA', '.gp', 'EUR', '590', '### ###', '', 'fr', '', '', NULL, '0', 0, 0, NULL, NULL),
(28, 'BM', 'BMU', 60, 'BD', 'Bermuda', 'Bermuda', 'Hamilton', 53, 65365, 'NA', '.bm', 'BMD', '+1-441', '@@ ##', '^([A-Z]{2}d{2})$', 'en-BM,pt', '', '', NULL, '0', 0, 0, NULL, NULL),
(29, 'BN', 'BRN', 96, 'BX', 'Brunei Darussalam', 'Brunei', 'Bandar Seri Begawan', 5770, 395027, 'AS', '.bn', 'BND', '673', '@@####', '^([A-Z]{2}d{4})$', 'ms-BN,en-BN', 'MY', '', NULL, '0', 0, 0, NULL, NULL),
(30, 'BO', 'BOL', 68, 'BL', 'Bolivia', 'Bolivia', 'Sucre', 1098580, 9947418, 'SA', '.bo', 'BOB', '591', '', '', 'es-BO,qu,ay', 'PE,CL,PY,BR,AR', '', NULL, '0', 0, 0, NULL, NULL),
(31, 'BQ', 'BES', 535, '', 'Bonaire, Saint Eustatius and Saba ', 'Bonaire, Saint Eustatius and Saba ', '', 328, 18012, 'NA', '.bq', 'USD', '599', '', '', 'nl,pap,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(32, 'BR', 'BRA', 76, 'BR', 'Brasil', 'Brazil', 'Brasilia', 8511965, 201103330, 'SA', '.br', 'BRL', '55', '#####-###', '^(d{8})$', 'pt-BR,es,en,fr', 'SR,PE,BO,UY,GY,PY,GF,VE,CO,AR', '', NULL, '0', 0, 0, NULL, NULL),
(33, 'BS', 'BHS', 44, 'BF', 'Bahamas', 'Bahamas', 'Nassau', 13940, 301790, 'NA', '.bs', 'BSD', '+1-242', '', '', 'en-BS', '', '', NULL, '0', 0, 0, NULL, NULL),
(34, 'BT', 'BTN', 64, 'BT', 'Druk-yul', 'Bhutan', 'Thimphu', 47000, 699847, 'AS', '.bt', 'BTN', '975', '', '', 'dz', 'CN,IN', '', NULL, '0', 0, 0, NULL, NULL),
(35, 'BV', 'BVT', 74, 'BV', 'Bouvet Island', 'Bouvet Island', '', 49, 0, 'AN', '.bv', 'NOK', '', '', '', '', '', '', NULL, '0', 0, 0, NULL, NULL),
(36, 'BW', 'BWA', 72, 'BC', 'Botswana', 'Botswana', 'Gaborone', 600370, 2029307, 'AF', '.bw', 'BWP', '267', '', '', 'en-BW,tn-BW', 'ZW,ZA,NA', '', NULL, '0', 0, 0, NULL, NULL),
(37, 'BY', 'BLR', 112, 'BO', 'Biełaruś', 'Belarus', 'Minsk', 207600, 9685000, 'EU', '.by', 'BYR', '375', '######', '^(d{6})$', 'be,ru', 'PL,LT,UA,RU,LV', '', NULL, '0', 0, 0, NULL, NULL),
(38, 'BZ', 'BLZ', 84, 'BH', 'Belize', 'Belize', 'Belmopan', 22966, 314522, 'NA', '.bz', 'BZD', '501', '', '', 'en-BZ,es', 'GT,MX', '', NULL, '0', 0, 0, NULL, NULL),
(39, 'CA', 'CAN', 124, 'CA', 'Canada', 'Canada', 'Ottawa', 9984670, 33679000, 'NA', '.ca', 'CAD', '1', '@#@ #@#', '^([ABCEGHJKLMNPRSTVXY]d[ABCEGHJKLMNPRSTVWXYZ]) ?(d[ABCEGHJKLMNPRSTVWXYZ]d)$ ', 'en-CA,fr-CA,iu', 'US', '', NULL, '0', 0, 0, NULL, NULL),
(40, 'CC', 'CCK', 166, 'CK', 'Cocos Islands', 'Cocos Islands', 'West Island', 14, 628, 'AS', '.cc', 'AUD', '61', '', '', 'ms-CC,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(41, 'CD', 'COD', 180, 'CG', 'RDC', 'Democratic Republic of the Congo', 'Kinshasa', 2345410, 70916439, 'AF', '.cd', 'CDF', '243', '', '', 'fr-CD,ln,kg', 'TZ,CF,SS,RW,ZM,BI,UG,CG,AO', '', NULL, '0', 0, 0, NULL, NULL),
(42, 'CF', 'CAF', 140, 'CT', 'Centrafrique', 'Central African Republic', 'Bangui', 622984, 4844927, 'AF', '.cf', 'XAF', '236', '', '', 'fr-CF,sg,ln,kg', 'TD,SD,CD,SS,CM,CG', '', NULL, '0', 0, 0, NULL, NULL),
(43, 'CG', 'COG', 178, 'CF', 'Congo', 'Republic of the Congo', 'Brazzaville', 342000, 3039126, 'AF', '.cg', 'XAF', '242', '', '', 'fr-CG,kg,ln-CG', 'CF,GA,CD,CM,AO', '', NULL, '0', 0, 0, NULL, NULL),
(44, 'CH', 'CHE', 756, 'SZ', 'Switzerland', 'Switzerland', 'Berne', 41290, 7581000, 'EU', '.ch', 'CHF', '41', '####', '^(d{4})$', 'de-CH,fr-CH,it-CH,rm', 'DE,IT,LI,FR,AT', '', NULL, '0', 0, 0, NULL, NULL),
(45, 'CI', 'CIV', 384, 'IV', 'Côte d\'Ivoire', 'Ivory Coast', 'Yamoussoukro', 322460, 21058798, 'AF', '.ci', 'XOF', '225', '', '', 'fr-CI', 'LR,GH,GN,BF,ML', '', NULL, '0', 0, 0, NULL, NULL),
(46, 'CK', 'COK', 184, 'CW', 'Cook Islands', 'Cook Islands', 'Avarua', 240, 21388, 'OC', '.ck', 'NZD', '682', '', '', 'en-CK,mi', '', '', NULL, '0', 0, 0, NULL, NULL),
(47, 'CL', 'CHL', 152, 'CI', 'Chile', 'Chile', 'Santiago', 756950, 16746491, 'SA', '.cl', 'CLP', '56', '#######', '^(d{7})$', 'es-CL', 'PE,BO,AR', '', NULL, '0', 0, 0, NULL, NULL),
(48, 'CM', 'CMR', 120, 'CM', 'Cameroun', 'Cameroon', 'Yaounde', 475440, 19294149, 'AF', '.cm', 'XAF', '237', '', '', 'fr-CM,en-CM', 'TD,CF,GA,GQ,CG,NG', '', NULL, '0', 0, 0, NULL, NULL),
(49, 'CN', 'CHN', 156, 'CH', 'Zhōngguó', 'China', 'Beijing', 9596960, 1330044000, 'AS', '.cn', 'CNY', '86', '######', '^(d{6})$', 'zh-CN,yue,wuu,dta,ug,za', 'LA,BT,TJ,KZ,MN,AF,NP,MM,KG,PK,KP,RU,VN,IN', '', NULL, '0', 0, 0, NULL, NULL),
(50, 'CO', 'COL', 170, 'CO', 'Colombia', 'Colombia', 'Bogota', 1138910, 47790000, 'SA', '.co', 'COP', '57', '', '', 'es-CO', 'EC,PE,PA,BR,VE', '', NULL, '0', 0, 0, NULL, NULL),
(51, 'CR', 'CRI', 188, 'CS', 'Costa Rica', 'Costa Rica', 'San Jose', 51100, 4516220, 'NA', '.cr', 'CRC', '506', '####', '^(d{4})$', 'es-CR,en', 'PA,NI', '', NULL, '0', 0, 0, NULL, NULL),
(52, 'CS', 'SCG', 891, 'YI', 'Serbia and Montenegro', 'Serbia and Montenegro', 'Belgrade', 102350, 10829175, 'EU', '.cs', 'RSD', '381', '#####', '^(d{5})$', 'cu,hu,sq,sr', 'AL,HU,MK,RO,HR,BA,BG', '', NULL, '0', 0, 0, NULL, NULL),
(53, 'CU', 'CUB', 192, 'CU', 'Cuba', 'Cuba', 'Havana', 110860, 11423000, 'NA', '.cu', 'CUP', '53', 'CP #####', '^(?:CP)*(d{5})$', 'es-CU', 'US', '', NULL, '0', 0, 0, NULL, NULL),
(54, 'CV', 'CPV', 132, 'CV', 'Cabo Verde', 'Cape Verde', 'Praia', 4033, 508659, 'AF', '.cv', 'CVE', '238', '####', '^(d{4})$', 'pt-CV', '', '', NULL, '0', 0, 0, NULL, NULL),
(55, 'CW', 'CUW', 531, 'UC', 'Curacao', 'Curacao', ' Willemstad', 444, 141766, 'NA', '.cw', 'ANG', '599', '', '', 'nl,pap', '', '', NULL, '0', 0, 0, NULL, NULL),
(56, 'CX', 'CXR', 162, 'KT', 'Christmas Island', 'Christmas Island', 'Flying Fish Cove', 135, 1500, 'AS', '.cx', 'AUD', '61', '####', '^(d{4})$', 'en,zh,ms-CC', '', '', NULL, '0', 0, 0, NULL, NULL),
(57, 'CY', 'CYP', 196, 'CY', 'Kýpros (Kıbrıs)', 'Cyprus', 'Nicosia', 9250, 1102677, 'EU', '.cy', 'EUR', '357', '####', '^(d{4})$', 'el-CY,tr-CY,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(58, 'CZ', 'CZE', 203, 'EZ', 'Česko', 'Czech Republic', 'Prague', 78866, 10476000, 'EU', '.cz', 'CZK', '420', '### ##', '^(d{5})$', 'cs,sk', 'PL,DE,SK,AT', '', NULL, '0', 0, 0, NULL, NULL),
(59, 'DE', 'DEU', 276, 'GM', 'Deutschland', 'Germany', 'Berlin', 357021, 81802257, 'EU', '.de', 'EUR', '49', '#####', '^(d{5})$', 'de', 'CH,PL,NL,DK,BE,CZ,LU,FR,AT', '', NULL, '0', 0, 0, NULL, NULL),
(60, 'DJ', 'DJI', 262, 'DJ', 'Djibouti', 'Djibouti', 'Djibouti', 23000, 740528, 'AF', '.dj', 'DJF', '253', '', '', 'fr-DJ,ar,so-DJ,aa', 'ER,ET,SO', '', NULL, '0', 0, 0, NULL, NULL),
(61, 'DK', 'DNK', 208, 'DA', 'Danmark', 'Denmark', 'Copenhagen', 43094, 5484000, 'EU', '.dk', 'DKK', '45', '####', '^(d{4})$', 'da-DK,en,fo,de-DK', 'DE', '', NULL, '0', 0, 0, NULL, NULL),
(62, 'DM', 'DMA', 212, 'DO', 'Dominica', 'Dominica', 'Roseau', 754, 72813, 'NA', '.dm', 'XCD', '+1-767', '', '', 'en-DM', '', '', NULL, '0', 0, 0, NULL, NULL),
(63, 'DO', 'DOM', 214, 'DR', 'República Dominicana', 'Dominican Republic', 'Santo Domingo', 48730, 9823821, 'NA', '.do', 'DOP', '+809/829/849', '#####', '^(d{5})$', 'es-DO', 'HT', '', NULL, '0', 0, 0, NULL, NULL),
(64, 'DZ', 'DZA', 12, 'AG', 'Algérie', 'Algeria', 'Algiers', 2381740, 34586184, 'AF', '.dz', 'DZD', '213', '#####', '^(d{5})$', 'ar-DZ,fr', 'NE,EH,LY,MR,TN,MA,ML', '', NULL, '0', 0, 0, NULL, NULL),
(65, 'EC', 'ECU', 218, 'EC', 'Ecuador', 'Ecuador', 'Quito', 283560, 14790608, 'SA', '.ec', 'USD', '593', '@####@', '^([a-zA-Z]d{4}[a-zA-Z])$', 'es-EC', 'PE,CO', '', NULL, '0', 0, 0, NULL, NULL),
(66, 'EE', 'EST', 233, 'EN', 'Eesti', 'Estonia', 'Tallinn', 45226, 1291170, 'EU', '.ee', 'EUR', '372', '#####', '^(d{5})$', 'et,ru', 'RU,LV', '', NULL, '0', 0, 0, NULL, NULL),
(67, 'EG', 'EGY', 818, 'EG', 'Egypt', 'Egypt', 'Cairo', 1001450, 80471869, 'AF', '.eg', 'EGP', '20', '#####', '^(d{5})$', 'ar-EG,en,fr', 'LY,SD,IL,PS', '', NULL, '0', 0, 0, NULL, NULL),
(68, 'EH', 'ESH', 732, 'WI', 'aṣ-Ṣaḥrāwīyâ al-ʿArabīyâ', 'Western Sahara', 'El-Aaiun', 266000, 273008, 'AF', '.eh', 'MAD', '212', '', '', 'ar,mey', 'DZ,MR,MA', '', NULL, '0', 0, 0, NULL, NULL),
(69, 'ER', 'ERI', 232, 'ER', 'Ertrā', 'Eritrea', 'Asmara', 121320, 5792984, 'AF', '.er', 'ERN', '291', '', '', 'aa-ER,ar,tig,kun,ti-ER', 'ET,SD,DJ', '', NULL, '0', 0, 0, NULL, NULL),
(70, 'ES', 'ESP', 724, 'SP', 'España', 'Spain', 'Madrid', 504782, 46505963, 'EU', '.es', 'EUR', '34', '#####', '^(d{5})$', 'es-ES,ca,gl,eu,oc', 'AD,PT,GI,FR,MA', '', NULL, '0', 0, 0, NULL, NULL),
(71, 'ET', 'ETH', 231, 'ET', 'Ityoṗya', 'Ethiopia', 'Addis Ababa', 1127127, 88013491, 'AF', '.et', 'ETB', '251', '####', '^(d{4})$', 'am,en-ET,om-ET,ti-ET,so-ET,sid', 'ER,KE,SD,SS,SO,DJ', '', NULL, '0', 0, 0, NULL, NULL),
(72, 'FI', 'FIN', 246, 'FI', 'Suomi (Finland)', 'Finland', 'Helsinki', 337030, 5244000, 'EU', '.fi', 'EUR', '358', '#####', '^(?:FI)*(d{5})$', 'fi-FI,sv-FI,smn', 'NO,RU,SE', '', NULL, '0', 0, 0, NULL, NULL),
(73, 'FJ', 'FJI', 242, 'FJ', 'Viti', 'Fiji', 'Suva', 18270, 875983, 'OC', '.fj', 'FJD', '679', '', '', 'en-FJ,fj', '', '', NULL, '0', 0, 0, NULL, NULL),
(74, 'FK', 'FLK', 238, 'FK', 'Falkland Islands', 'Falkland Islands', 'Stanley', 12173, 2638, 'SA', '.fk', 'FKP', '500', '', '', 'en-FK', '', '', NULL, '0', 0, 0, NULL, NULL),
(75, 'FM', 'FSM', 583, 'FM', 'Micronesia', 'Micronesia', 'Palikir', 702, 107708, 'OC', '.fm', 'USD', '691', '#####', '^(d{5})$', 'en-FM,chk,pon,yap,kos,uli,woe,nkr,kpg', '', '', NULL, '0', 0, 0, NULL, NULL),
(76, 'FO', 'FRO', 234, 'FO', 'Føroyar', 'Faroe Islands', 'Torshavn', 1399, 48228, 'EU', '.fo', 'DKK', '298', 'FO-###', '^(?:FO)*(d{3})$', 'fo,da-FO', '', '', NULL, '0', 0, 0, NULL, NULL),
(77, 'FR', 'FRA', 250, 'FR', 'France', 'France', 'Paris', 547030, 64768389, 'EU', '.fr', 'EUR', '33', '#####', '^(d{5})$', 'fr-FR,frp,br,co,ca,eu,oc', 'CH,DE,BE,LU,IT,AD,MC,ES', '', NULL, '0', 0, 0, NULL, NULL),
(78, 'GA', 'GAB', 266, 'GB', 'Gabon', 'Gabon', 'Libreville', 267667, 1545255, 'AF', '.ga', 'XAF', '241', '', '', 'fr-GA', 'CM,GQ,CG', '', NULL, '0', 0, 0, NULL, NULL),
(79, 'GD', 'GRD', 308, 'GJ', 'Grenada', 'Grenada', 'St. George\'s', 344, 107818, 'NA', '.gd', 'XCD', '+1-473', '', '', 'en-GD', '', '', NULL, '0', 0, 0, NULL, NULL),
(80, 'GE', 'GEO', 268, 'GG', 'Sak\'art\'velo', 'Georgia', 'Tbilisi', 69700, 4630000, 'AS', '.ge', 'GEL', '995', '####', '^(d{4})$', 'ka,ru,hy,az', 'AM,AZ,TR,RU', '', NULL, '0', 0, 0, NULL, NULL),
(81, 'GF', 'GUF', 254, 'FG', 'Guyane', 'French Guiana', 'Cayenne', 91000, 195506, 'SA', '.gf', 'EUR', '594', '#####', '^((97|98)3d{2})$', 'fr-GF', 'SR,BR', '', NULL, '0', 0, 0, NULL, NULL),
(82, 'GG', 'GGY', 831, 'GK', 'Guernsey', 'Guernsey', 'St Peter Port', 78, 65228, 'EU', '.gg', 'GBP', '+44-1481', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,fr', '', '', NULL, '0', 0, 0, NULL, NULL),
(83, 'GH', 'GHA', 288, 'GH', 'Ghana', 'Ghana', 'Accra', 239460, 24339838, 'AF', '.gh', 'GHS', '233', '', '', 'en-GH,ak,ee,tw', 'CI,TG,BF', '', NULL, '0', 0, 0, NULL, NULL),
(84, 'GI', 'GIB', 292, 'GI', 'Gibraltar', 'Gibraltar', 'Gibraltar', 7, 27884, 'EU', '.gi', 'GIP', '350', '', '', 'en-GI,es,it,pt', 'ES', '', NULL, '0', 0, 0, NULL, NULL),
(85, 'GL', 'GRL', 304, 'GL', 'Grønland', 'Greenland', 'Nuuk', 2166086, 56375, 'NA', '.gl', 'DKK', '299', '####', '^(d{4})$', 'kl,da-GL,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(86, 'GM', 'GMB', 270, 'GA', 'Gambia', 'Gambia', 'Banjul', 11300, 1593256, 'AF', '.gm', 'GMD', '220', '', '', 'en-GM,mnk,wof,wo,ff', 'SN', '', NULL, '0', 0, 0, NULL, NULL),
(87, 'GN', 'GIN', 324, 'GV', 'Guinée', 'Guinea', 'Conakry', 245857, 10324025, 'AF', '.gn', 'GNF', '224', '', '', 'fr-GN', 'LR,SN,SL,CI,GW,ML', '', NULL, '0', 0, 0, NULL, NULL),
(88, 'GP', 'GLP', 312, 'GP', 'Guadeloupe', 'Guadeloupe', 'Basse-Terre', 1780, 443000, 'NA', '.gp', 'EUR', '590', '#####', '^((97|98)d{3})$', 'fr-GP', '', '', NULL, '0', 0, 0, NULL, NULL),
(89, 'GQ', 'GNQ', 226, 'EK', 'Guinée Equatoriale', 'Equatorial Guinea', 'Malabo', 28051, 1014999, 'AF', '.gq', 'XAF', '240', '', '', 'es-GQ,fr', 'GA,CM', '', NULL, '0', 0, 0, NULL, NULL),
(90, 'GR', 'GRC', 300, 'GR', 'Elláda', 'Greece', 'Athens', 131940, 11000000, 'EU', '.gr', 'EUR', '30', '### ##', '^(d{5})$', 'el-GR,en,fr', 'AL,MK,TR,BG', '', NULL, '0', 0, 0, NULL, NULL),
(91, 'GS', 'SGS', 239, 'SX', 'South Georgia and the South Sandwich Islands', 'South Georgia and the South Sandwich Islands', 'Grytviken', 3903, 30, 'AN', '.gs', 'GBP', '', '', '', 'en', '', '', NULL, '0', 0, 0, NULL, NULL),
(92, 'GT', 'GTM', 320, 'GT', 'Guatemala', 'Guatemala', 'Guatemala City', 108890, 13550440, 'NA', '.gt', 'GTQ', '502', '#####', '^(d{5})$', 'es-GT', 'MX,HN,BZ,SV', '', NULL, '0', 0, 0, NULL, NULL),
(93, 'GU', 'GUM', 316, 'GQ', 'Guam', 'Guam', 'Hagatna', 549, 159358, 'OC', '.gu', 'USD', '+1-671', '969##', '^(969d{2})$', 'en-GU,ch-GU', '', '', NULL, '0', 0, 0, NULL, NULL),
(94, 'GW', 'GNB', 624, 'PU', 'Guiné-Bissau', 'Guinea-Bissau', 'Bissau', 36120, 1565126, 'AF', '.gw', 'XOF', '245', '####', '^(d{4})$', 'pt-GW,pov', 'SN,GN', '', NULL, '0', 0, 0, NULL, NULL),
(95, 'GY', 'GUY', 328, 'GY', 'Guyana', 'Guyana', 'Georgetown', 214970, 748486, 'SA', '.gy', 'GYD', '592', '', '', 'en-GY', 'SR,BR,VE', '', NULL, '0', 0, 0, NULL, NULL),
(96, 'HK', 'HKG', 344, 'HK', 'Hèunggóng', 'Hong Kong', 'Hong Kong', 1092, 6898686, 'AS', '.hk', 'HKD', '852', '', '', 'zh-HK,yue,zh,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(97, 'HM', 'HMD', 334, 'HM', 'Heard Island and McDonald Islands', 'Heard Island and McDonald Islands', '', 412, 0, 'AN', '.hm', 'AUD', ' ', '', '', '', '', '', NULL, '0', 0, 0, NULL, NULL),
(98, 'HN', 'HND', 340, 'HO', 'Honduras', 'Honduras', 'Tegucigalpa', 112090, 7989415, 'NA', '.hn', 'HNL', '504', '@@####', '^([A-Z]{2}d{4})$', 'es-HN', 'GT,NI,SV', '', NULL, '0', 0, 0, NULL, NULL),
(99, 'HR', 'HRV', 191, 'HR', 'Hrvatska', 'Croatia', 'Zagreb', 56542, 4491000, 'EU', '.hr', 'HRK', '385', '#####', '^(?:HR)*(d{5})$', 'hr-HR,sr', 'HU,SI,BA,ME,RS', '', NULL, '0', 0, 0, NULL, NULL),
(100, 'HT', 'HTI', 332, 'HA', 'Haïti', 'Haiti', 'Port-au-Prince', 27750, 9648924, 'NA', '.ht', 'HTG', '509', 'HT####', '^(?:HT)*(d{4})$', 'ht,fr-HT', 'DO', '', NULL, '0', 0, 0, NULL, NULL),
(101, 'HU', 'HUN', 348, 'HU', 'Magyarország', 'Hungary', 'Budapest', 93030, 9982000, 'EU', '.hu', 'HUF', '36', '####', '^(d{4})$', 'hu-HU', 'SK,SI,RO,UA,HR,AT,RS', '', NULL, '0', 0, 0, NULL, NULL),
(102, 'ID', 'IDN', 360, 'ID', 'Indonesia', 'Indonesia', 'Jakarta', 1919440, 242968342, 'AS', '.id', 'IDR', '62', '#####', '^(d{5})$', 'id,en,nl,jv', 'PG,TL,MY', '', NULL, '0', 0, 0, NULL, NULL),
(103, 'IE', 'IRL', 372, 'EI', 'Ireland', 'Ireland', 'Dublin', 70280, 4622917, 'EU', '.ie', 'EUR', '353', '', '', 'en-IE,ga-IE', 'GB', '', NULL, '0', 0, 0, NULL, NULL),
(104, 'IL', 'ISR', 376, 'IS', 'Yiśrā\'ēl', 'Israel', 'Jerusalem', 20770, 7353985, 'AS', '.il', 'ILS', '972', '#####', '^(d{5})$', 'he,ar-IL,en-IL,', 'SY,JO,LB,EG,PS', '', NULL, '0', 0, 0, NULL, NULL),
(105, 'IM', 'IMN', 833, 'IM', 'Isle of Man', 'Isle of Man', 'Douglas, Isle of Man', 572, 75049, 'EU', '.im', 'GBP', '+44-1624', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,gv', '', '', NULL, '0', 0, 0, NULL, NULL),
(106, 'IN', 'IND', 356, 'IN', 'Bhārat', 'India', 'New Delhi', 3287590, 1173108018, 'AS', '.in', 'INR', '91', '######', '^(d{6})$', 'en-IN,hi,bn,te,mr,ta,ur,gu,kn,ml,or,pa,as,bh,sat,k', 'CN,NP,MM,BT,PK,BD', '', NULL, '0', 0, 0, NULL, NULL),
(107, 'IO', 'IOT', 86, 'IO', 'British Indian Ocean Territory', 'British Indian Ocean Territory', 'Diego Garcia', 60, 4000, 'AS', '.io', 'USD', '246', '', '', 'en-IO', '', '', NULL, '0', 0, 0, NULL, NULL),
(108, 'IQ', 'IRQ', 368, 'IZ', 'al-ʿIrāq', 'Iraq', 'Baghdad', 437072, 29671605, 'AS', '.iq', 'IQD', '964', '#####', '^(d{5})$', 'ar-IQ,ku,hy', 'SY,SA,IR,JO,TR,KW', '', NULL, '0', 0, 0, NULL, NULL),
(109, 'IR', 'IRN', 364, 'IR', 'Īrān', 'Iran', 'Tehran', 1648000, 76923300, 'AS', '.ir', 'IRR', '98', '##########', '^(d{10})$', 'fa-IR,ku', 'TM,AF,IQ,AM,PK,AZ,TR', '', NULL, '0', 0, 0, NULL, NULL),
(110, 'IS', 'ISL', 352, 'IC', 'Ísland', 'Iceland', 'Reykjavik', 103000, 308910, 'EU', '.is', 'ISK', '354', '###', '^(d{3})$', 'is,en,de,da,sv,no', '', '', NULL, '0', 0, 0, NULL, NULL),
(111, 'IT', 'ITA', 380, 'IT', 'Italia', 'Italy', 'Rome', 301230, 60340328, 'EU', '.it', 'EUR', '39', '#####', '^(d{5})$', 'it-IT,en,de-IT,fr-IT,sc,ca,co,sl', 'CH,VA,SI,SM,FR,AT', '', NULL, '0', 0, 0, NULL, NULL),
(112, 'JE', 'JEY', 832, 'JE', 'Jersey', 'Jersey', 'Saint Helier', 116, 90812, 'EU', '.je', 'GBP', '+44-1534', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,pt', '', '', NULL, '0', 0, 0, NULL, NULL),
(113, 'JM', 'JAM', 388, 'JM', 'Jamaica', 'Jamaica', 'Kingston', 10991, 2847232, 'NA', '.jm', 'JMD', '+1-876', '', '', 'en-JM', '', '', NULL, '0', 0, 0, NULL, NULL),
(114, 'JO', 'JOR', 400, 'JO', 'al-Urdun', 'Jordan', 'Amman', 92300, 6407085, 'AS', '.jo', 'JOD', '962', '#####', '^(d{5})$', 'ar-JO,en', 'SY,SA,IQ,IL,PS', '', NULL, '0', 0, 0, NULL, NULL),
(115, 'JP', 'JPN', 392, 'JA', 'Nihon', 'Japan', 'Tokyo', 377835, 127288000, 'AS', '.jp', 'JPY', '81', '###-####', '^(d{7})$', 'ja', '', '', NULL, '0', 0, 0, NULL, NULL),
(116, 'KE', 'KEN', 404, 'KE', 'Kenya', 'Kenya', 'Nairobi', 582650, 40046566, 'AF', '.ke', 'KES', '254', '#####', '^(d{5})$', 'en-KE,sw-KE', 'ET,TZ,SS,SO,UG', '', NULL, '0', 0, 0, NULL, NULL),
(117, 'KG', 'KGZ', 417, 'KG', 'Kyrgyzstan', 'Kyrgyzstan', 'Bishkek', 198500, 5508626, 'AS', '.kg', 'KGS', '996', '######', '^(d{6})$', 'ky,uz,ru', 'CN,TJ,UZ,KZ', '', NULL, '0', 0, 0, NULL, NULL),
(118, 'KH', 'KHM', 116, 'CB', 'Kambucā', 'Cambodia', 'Phnom Penh', 181040, 14453680, 'AS', '.kh', 'KHR', '855', '#####', '^(d{5})$', 'km,fr,en', 'LA,TH,VN', '', NULL, '0', 0, 0, NULL, NULL),
(119, 'KI', 'KIR', 296, 'KR', 'Kiribati', 'Kiribati', 'Tarawa', 811, 92533, 'OC', '.ki', 'AUD', '686', '', '', 'en-KI,gil', '', '', NULL, '0', 0, 0, NULL, NULL),
(120, 'KM', 'COM', 174, 'CN', 'Comores', 'Comoros', 'Moroni', 2170, 773407, 'AF', '.km', 'KMF', '269', '', '', 'ar,fr-KM', '', '', NULL, '0', 0, 0, NULL, NULL),
(121, 'KN', 'KNA', 659, 'SC', 'Saint Kitts and Nevis', 'Saint Kitts and Nevis', 'Basseterre', 261, 51134, 'NA', '.kn', 'XCD', '+1-869', '', '', 'en-KN', '', '', NULL, '0', 0, 0, NULL, NULL),
(122, 'KP', 'PRK', 408, 'KN', 'Joseon', 'North Korea', 'Pyongyang', 120540, 22912177, 'AS', '.kp', 'KPW', '850', '###-###', '^(d{6})$', 'ko-KP', 'CN,KR,RU', '', NULL, '0', 0, 0, NULL, NULL),
(123, 'KR', 'KOR', 410, 'KS', 'Hanguk', 'South Korea', 'Seoul', 98480, 48422644, 'AS', '.kr', 'KRW', '82', 'SEOUL ###-###', '^(?:SEOUL)*(d{6})$', 'ko-KR,en', 'KP', '', NULL, '0', 0, 0, NULL, NULL),
(124, 'KW', 'KWT', 414, 'KU', 'al-Kuwayt', 'Kuwait', 'Kuwait City', 17820, 2789132, 'AS', '.kw', 'KWD', '965', '#####', '^(d{5})$', 'ar-KW,en', 'SA,IQ', '', NULL, '0', 0, 0, NULL, NULL),
(125, 'KY', 'CYM', 136, 'CJ', 'Cayman Islands', 'Cayman Islands', 'George Town', 262, 44270, 'NA', '.ky', 'KYD', '+1-345', '', '', 'en-KY', '', '', NULL, '0', 0, 0, NULL, NULL),
(126, 'KZ', 'KAZ', 398, 'KZ', 'Ķazaķstan', 'Kazakhstan', 'Astana', 2717300, 15340000, 'AS', '.kz', 'KZT', '7', '######', '^(d{6})$', 'kk,ru', 'TM,CN,KG,UZ,RU', '', NULL, '0', 0, 0, NULL, NULL),
(127, 'LA', 'LAO', 418, 'LA', 'Lāw', 'Laos', 'Vientiane', 236800, 6368162, 'AS', '.la', 'LAK', '856', '#####', '^(d{5})$', 'lo,fr,en', 'CN,MM,KH,TH,VN', '', NULL, '0', 0, 0, NULL, NULL),
(128, 'LB', 'LBN', 422, 'LE', 'Lubnān', 'Lebanon', 'Beirut', 10400, 4125247, 'AS', '.lb', 'LBP', '961', '#### ####|####', '^(d{4}(d{4})?)$', 'ar-LB,fr-LB,en,hy', 'SY,IL', '', NULL, '0', 0, 0, NULL, NULL),
(129, 'LC', 'LCA', 662, 'ST', 'Saint Lucia', 'Saint Lucia', 'Castries', 616, 160922, 'NA', '.lc', 'XCD', '+1-758', '', '', 'en-LC', '', '', NULL, '0', 0, 0, NULL, NULL),
(130, 'LI', 'LIE', 438, 'LS', 'Liechtenstein', 'Liechtenstein', 'Vaduz', 160, 35000, 'EU', '.li', 'CHF', '423', '####', '^(d{4})$', 'de-LI', 'CH,AT', '', NULL, '0', 0, 0, NULL, NULL),
(131, 'LK', 'LKA', 144, 'CE', 'Šrī Laṁkā', 'Sri Lanka', 'Colombo', 65610, 21513990, 'AS', '.lk', 'LKR', '94', '#####', '^(d{5})$', 'si,ta,en', '', '', 'app/logo/header-5fbaa27179c54.jpeg', '0', 0, 1, NULL, '2020-11-22 22:40:01'),
(132, 'LR', 'LBR', 430, 'LI', 'Liberia', 'Liberia', 'Monrovia', 111370, 3685076, 'AF', '.lr', 'LRD', '231', '####', '^(d{4})$', 'en-LR', 'SL,CI,GN', '', NULL, '0', 0, 0, NULL, NULL),
(133, 'LS', 'LSO', 426, 'LT', 'Lesotho', 'Lesotho', 'Maseru', 30355, 1919552, 'AF', '.ls', 'LSL', '266', '###', '^(d{3})$', 'en-LS,st,zu,xh', 'ZA', '', NULL, '0', 0, 0, NULL, NULL),
(134, 'LT', 'LTU', 440, 'LH', 'Lietuva', 'Lithuania', 'Vilnius', 65200, 2944459, 'EU', '.lt', 'EUR', '370', 'LT-#####', '^(?:LT)*(d{5})$', 'lt,ru,pl', 'PL,BY,RU,LV', '', NULL, '0', 0, 0, NULL, NULL),
(135, 'LU', 'LUX', 442, 'LU', 'Lëtzebuerg', 'Luxembourg', 'Luxembourg', 2586, 497538, 'EU', '.lu', 'EUR', '352', 'L-####', '^(d{4})$', 'lb,de-LU,fr-LU', 'DE,BE,FR', '', NULL, '0', 0, 0, NULL, NULL),
(136, 'LV', 'LVA', 428, 'LG', 'Latvija', 'Latvia', 'Riga', 64589, 2217969, 'EU', '.lv', 'EUR', '371', 'LV-####', '^(?:LV)*(d{4})$', 'lv,ru,lt', 'LT,EE,BY,RU', '', NULL, '0', 0, 0, NULL, NULL),
(137, 'LY', 'LBY', 434, 'LY', 'Lībiyā', 'Libya', 'Tripolis', 1759540, 6461454, 'AF', '.ly', 'LYD', '218', '', '', 'ar-LY,it,en', 'TD,NE,DZ,SD,TN,EG', '', NULL, '0', 0, 0, NULL, NULL),
(138, 'MA', 'MAR', 504, 'MO', 'Maroc', 'Morocco', 'Rabat', 446550, 31627428, 'AF', '.ma', 'MAD', '212', '#####', '^(d{5})$', 'ar-MA,fr', 'DZ,EH,ES', '', NULL, '0', 0, 0, NULL, NULL),
(139, 'MC', 'MCO', 492, 'MN', 'Monaco', 'Monaco', 'Monaco', 2, 32965, 'EU', '.mc', 'EUR', '377', '#####', '^(d{5})$', 'fr-MC,en,it', 'FR', '', NULL, '0', 0, 0, NULL, NULL),
(140, 'MD', 'MDA', 498, 'MD', 'Moldova', 'Moldova', 'Chisinau', 33843, 4324000, 'EU', '.md', 'MDL', '373', 'MD-####', '^(?:MD)*(d{4})$', 'ro,ru,gag,tr', 'RO,UA', '', NULL, '0', 0, 0, NULL, NULL),
(141, 'ME', 'MNE', 499, 'MJ', 'Crna Gora', 'Montenegro', 'Podgorica', 14026, 666730, 'EU', '.me', 'EUR', '382', '#####', '^(d{5})$', 'sr,hu,bs,sq,hr,rom', 'AL,HR,BA,RS,XK', '', NULL, '0', 0, 0, NULL, NULL),
(142, 'MF', 'MAF', 663, 'RN', 'Saint Martin', 'Saint Martin', 'Marigot', 53, 35925, 'NA', '.gp', 'EUR', '590', '### ###', '', 'fr', 'SX', '', NULL, '0', 0, 0, NULL, NULL),
(143, 'MG', 'MDG', 450, 'MA', 'Madagascar', 'Madagascar', 'Antananarivo', 587040, 21281844, 'AF', '.mg', 'MGA', '261', '###', '^(d{3})$', 'fr-MG,mg', '', '', NULL, '0', 0, 0, NULL, NULL),
(144, 'MH', 'MHL', 584, 'RM', 'Marshall Islands', 'Marshall Islands', 'Majuro', 181, 65859, 'OC', '.mh', 'USD', '692', '', '', 'mh,en-MH', '', '', NULL, '0', 0, 0, NULL, NULL),
(145, 'MK', 'MKD', 807, 'MK', 'Makedonija', 'Macedonia', 'Skopje', 25333, 2062294, 'EU', '.mk', 'MKD', '389', '####', '^(d{4})$', 'mk,sq,tr,rmm,sr', 'AL,GR,BG,RS,XK', '', NULL, '0', 0, 0, NULL, NULL),
(146, 'ML', 'MLI', 466, 'ML', 'Mali', 'Mali', 'Bamako', 1240000, 13796354, 'AF', '.ml', 'XOF', '223', '', '', 'fr-ML,bm', 'SN,NE,DZ,CI,GN,MR,BF', '', NULL, '0', 0, 0, NULL, NULL),
(147, 'MM', 'MMR', 104, 'BM', 'Mẏanmā', 'Myanmar', 'Nay Pyi Taw', 678500, 53414374, 'AS', '.mm', 'MMK', '95', '#####', '^(d{5})$', 'my', 'CN,LA,TH,BD,IN', '', NULL, '0', 0, 0, NULL, NULL),
(148, 'MN', 'MNG', 496, 'MG', 'Mongol Uls', 'Mongolia', 'Ulan Bator', 1565000, 3086918, 'AS', '.mn', 'MNT', '976', '######', '^(d{6})$', 'mn,ru', 'CN,RU', '', NULL, '0', 0, 0, NULL, NULL),
(149, 'MO', 'MAC', 446, 'MC', 'Ngoumún', 'Macao', 'Macao', 254, 449198, 'AS', '.mo', 'MOP', '853', '', '', 'zh,zh-MO,pt', '', '', NULL, '0', 0, 0, NULL, NULL),
(150, 'MP', 'MNP', 580, 'CQ', 'Northern Mariana Islands', 'Northern Mariana Islands', 'Saipan', 477, 53883, 'OC', '.mp', 'USD', '+1-670', '', '', 'fil,tl,zh,ch-MP,en-MP', '', '', NULL, '0', 0, 0, NULL, NULL),
(151, 'MQ', 'MTQ', 474, 'MB', 'Martinique', 'Martinique', 'Fort-de-France', 1100, 432900, 'NA', '.mq', 'EUR', '596', '#####', '^(d{5})$', 'fr-MQ', '', '', NULL, '0', 0, 0, NULL, NULL),
(152, 'MR', 'MRT', 478, 'MR', 'Mauritanie', 'Mauritania', 'Nouakchott', 1030700, 3205060, 'AF', '.mr', 'MRO', '222', '', '', 'ar-MR,fuc,snk,fr,mey,wo', 'SN,DZ,EH,ML', '', NULL, '0', 0, 0, NULL, NULL),
(153, 'MS', 'MSR', 500, 'MH', 'Montserrat', 'Montserrat', 'Plymouth', 102, 9341, 'NA', '.ms', 'XCD', '+1-664', '', '', 'en-MS', '', '', NULL, '0', 0, 0, NULL, NULL),
(154, 'MT', 'MLT', 470, 'MT', 'Malta', 'Malta', 'Valletta', 316, 403000, 'EU', '.mt', 'EUR', '356', '@@@ ###|@@@ ##', '^([A-Z]{3}d{2}d?)$', 'mt,en-MT', '', '', NULL, '0', 0, 0, NULL, NULL),
(155, 'MU', 'MUS', 480, 'MP', 'Mauritius', 'Mauritius', 'Port Louis', 2040, 1294104, 'AF', '.mu', 'MUR', '230', '', '', 'en-MU,bho,fr', '', '', NULL, '0', 0, 0, NULL, NULL),
(156, 'MV', 'MDV', 462, 'MV', 'Dhivehi', 'Maldives', 'Male', 300, 395650, 'AS', '.mv', 'MVR', '960', '#####', '^(d{5})$', 'dv,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(157, 'MW', 'MWI', 454, 'MI', 'Malawi', 'Malawi', 'Lilongwe', 118480, 15447500, 'AF', '.mw', 'MWK', '265', '', '', 'ny,yao,tum,swk', 'TZ,MZ,ZM', '', NULL, '0', 0, 0, NULL, NULL),
(158, 'MX', 'MEX', 484, 'MX', 'México', 'Mexico', 'Mexico City', 1972550, 112468855, 'NA', '.mx', 'MXN', '52', '#####', '^(d{5})$', 'es-MX', 'GT,US,BZ', '', NULL, '0', 0, 0, NULL, NULL),
(159, 'MY', 'MYS', 458, 'MY', 'Malaysia', 'Malaysia', 'Kuala Lumpur', 329750, 28274729, 'AS', '.my', 'MYR', '60', '#####', '^(d{5})$', 'ms-MY,en,zh,ta,te,ml,pa,th', 'BN,TH,ID', '', NULL, '0', 0, 0, NULL, NULL),
(160, 'MZ', 'MOZ', 508, 'MZ', 'Moçambique', 'Mozambique', 'Maputo', 801590, 22061451, 'AF', '.mz', 'MZN', '258', '####', '^(d{4})$', 'pt-MZ,vmw', 'ZW,TZ,SZ,ZA,ZM,MW', '', NULL, '0', 0, 0, NULL, NULL),
(161, 'NA', 'NAM', 516, 'WA', 'Namibia', 'Namibia', 'Windhoek', 825418, 2128471, 'AF', '.na', 'NAD', '264', '', '', 'en-NA,af,de,hz,naq', 'ZA,BW,ZM,AO', '', NULL, '0', 0, 0, NULL, NULL),
(162, 'NC', 'NCL', 540, 'NC', 'Nouvelle Calédonie', 'New Caledonia', 'Noumea', 19060, 216494, 'OC', '.nc', 'XPF', '687', '#####', '^(d{5})$', 'fr-NC', '', '', NULL, '0', 0, 0, NULL, NULL),
(163, 'NE', 'NER', 562, 'NG', 'Niger', 'Niger', 'Niamey', 1267000, 15878271, 'AF', '.ne', 'XOF', '227', '####', '^(d{4})$', 'fr-NE,ha,kr,dje', 'TD,BJ,DZ,LY,BF,NG,ML', '', NULL, '0', 0, 0, NULL, NULL),
(164, 'NF', 'NFK', 574, 'NF', 'Norfolk Island', 'Norfolk Island', 'Kingston', 35, 1828, 'OC', '.nf', 'AUD', '672', '####', '^(d{4})$', 'en-NF', '', '', NULL, '0', 0, 0, NULL, NULL),
(165, 'NG', 'NGA', 566, 'NI', 'Nigeria', 'Nigeria', 'Abuja', 923768, 154000000, 'AF', '.ng', 'NGN', '234', '######', '^(d{6})$', 'en-NG,ha,yo,ig,ff', 'TD,NE,BJ,CM', '', NULL, '0', 0, 0, NULL, NULL),
(166, 'NI', 'NIC', 558, 'NU', 'Nicaragua', 'Nicaragua', 'Managua', 129494, 5995928, 'NA', '.ni', 'NIO', '505', '###-###-#', '^(d{7})$', 'es-NI,en', 'CR,HN', '', NULL, '0', 0, 0, NULL, NULL),
(167, 'NL', 'NLD', 528, 'NL', 'Nederland', 'Netherlands', 'Amsterdam', 41526, 16645000, 'EU', '.nl', 'EUR', '31', '#### @@', '^(d{4}[A-Z]{2})$', 'nl-NL,fy-NL', 'DE,BE', '', NULL, '0', 0, 0, NULL, NULL),
(168, 'NO', 'NOR', 578, 'NO', 'Norge (Noreg)', 'Norway', 'Oslo', 324220, 5009150, 'EU', '.no', 'NOK', '47', '####', '^(d{4})$', 'no,nb,nn,se,fi', 'FI,RU,SE', '', NULL, '0', 0, 0, NULL, NULL),
(169, 'NP', 'NPL', 524, 'NP', 'Nēpāl', 'Nepal', 'Kathmandu', 140800, 28951852, 'AS', '.np', 'NPR', '977', '#####', '^(d{5})$', 'ne,en', 'CN,IN', '', NULL, '0', 0, 0, NULL, NULL),
(170, 'NR', 'NRU', 520, 'NR', 'Naoero', 'Nauru', 'Yaren', 21, 10065, 'OC', '.nr', 'AUD', '674', '', '', 'na,en-NR', '', '', NULL, '0', 0, 0, NULL, NULL),
(171, 'NU', 'NIU', 570, 'NE', 'Niue', 'Niue', 'Alofi', 260, 2166, 'OC', '.nu', 'NZD', '683', '', '', 'niu,en-NU', '', '', NULL, '0', 0, 0, NULL, NULL),
(172, 'NZ', 'NZL', 554, 'NZ', 'New Zealand', 'New Zealand', 'Wellington', 268680, 4252277, 'OC', '.nz', 'NZD', '64', '####', '^(d{4})$', 'en-NZ,mi', '', '', NULL, '0', 0, 0, NULL, NULL),
(173, 'OM', 'OMN', 512, 'MU', 'ʿUmān', 'Oman', 'Muscat', 212460, 2967717, 'AS', '.om', 'OMR', '968', '###', '^(d{3})$', 'ar-OM,en,bal,ur', 'SA,YE,AE', '', NULL, '0', 0, 0, NULL, NULL),
(174, 'PA', 'PAN', 591, 'PM', 'Panamá', 'Panama', 'Panama City', 78200, 3410676, 'NA', '.pa', 'PAB', '507', '', '', 'es-PA,en', 'CR,CO', '', NULL, '0', 0, 0, NULL, NULL),
(175, 'PE', 'PER', 604, 'PE', 'Perú', 'Peru', 'Lima', 1285220, 29907003, 'SA', '.pe', 'PEN', '51', '', '', 'es-PE,qu,ay', 'EC,CL,BO,BR,CO', '', NULL, '0', 0, 0, NULL, NULL),
(176, 'PF', 'PYF', 258, 'FP', 'Polinésie Française', 'French Polynesia', 'Papeete', 4167, 270485, 'OC', '.pf', 'XPF', '689', '#####', '^((97|98)7d{2})$', 'fr-PF,ty', '', '', NULL, '0', 0, 0, NULL, NULL),
(177, 'PG', 'PNG', 598, 'PP', 'Papua New Guinea', 'Papua New Guinea', 'Port Moresby', 462840, 6064515, 'OC', '.pg', 'PGK', '675', '###', '^(d{3})$', 'en-PG,ho,meu,tpi', 'ID', '', NULL, '0', 0, 0, NULL, NULL),
(178, 'PH', 'PHL', 608, 'RP', 'Pilipinas', 'Philippines', 'Manila', 300000, 99900177, 'AS', '.ph', 'PHP', '63', '####', '^(d{4})$', 'tl,en-PH,fil', '', '', NULL, '0', 0, 0, NULL, NULL),
(179, 'PK', 'PAK', 586, 'PK', 'Pākistān', 'Pakistan', 'Islamabad', 803940, 184404791, 'AS', '.pk', 'PKR', '92', '#####', '^(d{5})$', 'ur-PK,en-PK,pa,sd,ps,brh', 'CN,AF,IR,IN', '', NULL, '0', 0, 0, NULL, NULL),
(180, 'PL', 'POL', 616, 'PL', 'Polska', 'Poland', 'Warsaw', 312685, 38500000, 'EU', '.pl', 'PLN', '48', '##-###', '^(d{5})$', 'pl', 'DE,LT,SK,CZ,BY,UA,RU', '', NULL, '0', 0, 0, NULL, NULL),
(181, 'PM', 'SPM', 666, 'SB', 'Saint Pierre and Miquelon', 'Saint Pierre and Miquelon', 'Saint-Pierre', 242, 7012, 'NA', '.pm', 'EUR', '508', '#####', '^(97500)$', 'fr-PM', '', '', NULL, '0', 0, 0, NULL, NULL),
(182, 'PN', 'PCN', 612, 'PC', 'Pitcairn', 'Pitcairn', 'Adamstown', 47, 46, 'OC', '.pn', 'NZD', '870', '', '', 'en-PN', '', '', NULL, '0', 0, 0, NULL, NULL),
(183, 'PR', 'PRI', 630, 'RQ', 'Puerto Rico', 'Puerto Rico', 'San Juan', 9104, 3916632, 'NA', '.pr', 'USD', '+1-787/1-939', '#####-####', '^(d{9})$', 'en-PR,es-PR', '', '', NULL, '0', 0, 0, NULL, NULL),
(184, 'PS', 'PSE', 275, 'WE', 'Filasṭīn', 'Palestinian Territory', 'East Jerusalem', 5970, 3800000, 'AS', '.ps', 'ILS', '970', '', '', 'ar-PS', 'JO,IL,EG', '', NULL, '0', 0, 0, NULL, NULL),
(185, 'PT', 'PRT', 620, 'PO', 'Portugal', 'Portugal', 'Lisbon', 92391, 10676000, 'EU', '.pt', 'EUR', '351', '####-###', '^(d{7})$', 'pt-PT,mwl', 'ES', '', NULL, '0', 0, 0, NULL, NULL),
(186, 'PW', 'PLW', 585, 'PS', 'Palau', 'Palau', 'Melekeok', 458, 19907, 'OC', '.pw', 'USD', '680', '96940', '^(96940)$', 'pau,sov,en-PW,tox,ja,fil,zh', '', '', NULL, '0', 0, 0, NULL, NULL),
(187, 'PY', 'PRY', 600, 'PA', 'Paraguay', 'Paraguay', 'Asuncion', 406750, 6375830, 'SA', '.py', 'PYG', '595', '####', '^(d{4})$', 'es-PY,gn', 'BO,BR,AR', '', NULL, '0', 0, 0, NULL, NULL),
(188, 'QA', 'QAT', 634, 'QA', 'Qaṭar', 'Qatar', 'Doha', 11437, 840926, 'AS', '.qa', 'QAR', '974', '', '', 'ar-QA,en', 'SA', '', NULL, '0', 0, 0, NULL, NULL),
(189, 'RE', 'REU', 638, 'RE', 'Réunion', 'Reunion', 'Saint-Denis', 2517, 776948, 'AF', '.re', 'EUR', '262', '#####', '^((97|98)(4|7|8)d{2})$', 'fr-RE', '', '', NULL, '0', 0, 0, NULL, NULL),
(190, 'RO', 'ROU', 642, 'RO', 'România', 'Romania', 'Bucharest', 237500, 21959278, 'EU', '.ro', 'RON', '40', '######', '^(d{6})$', 'ro,hu,rom', 'MD,HU,UA,BG,RS', '', NULL, '0', 0, 0, NULL, NULL),
(191, 'RS', 'SRB', 688, 'RI', 'Srbija', 'Serbia', 'Belgrade', 88361, 7344847, 'EU', '.rs', 'RSD', '381', '######', '^(d{6})$', 'sr,hu,bs,rom', 'AL,HU,MK,RO,HR,BA,BG,ME,XK', '', NULL, '0', 0, 0, NULL, NULL),
(192, 'RU', 'RUS', 643, 'RS', 'Rossija', 'Russia', 'Moscow', 17100000, 140702000, 'EU', '.ru', 'RUB', '7', '######', '^(d{6})$', 'ru,tt,xal,cau,ady,kv,ce,tyv,cv,udm,tut,mns,bua,myv', 'GE,CN,BY,UA,KZ,LV,PL,EE,LT,FI,MN,NO,AZ,KP', '', NULL, '0', 0, 0, NULL, NULL),
(193, 'RW', 'RWA', 646, 'RW', 'Rwanda', 'Rwanda', 'Kigali', 26338, 11055976, 'AF', '.rw', 'RWF', '250', '', '', 'rw,en-RW,fr-RW,sw', 'TZ,CD,BI,UG', '', NULL, '0', 0, 0, NULL, NULL),
(194, 'SA', 'SAU', 682, 'SA', 'as-Saʿūdīyâ', 'Saudi Arabia', 'Riyadh', 1960582, 25731776, 'AS', '.sa', 'SAR', '966', '#####', '^(d{5})$', 'ar-SA', 'QA,OM,IQ,YE,JO,AE,KW', '', NULL, '0', 0, 0, NULL, NULL),
(195, 'SB', 'SLB', 90, 'BP', 'Solomon Islands', 'Solomon Islands', 'Honiara', 28450, 559198, 'OC', '.sb', 'SBD', '677', '', '', 'en-SB,tpi', '', '', NULL, '0', 0, 0, NULL, NULL),
(196, 'SC', 'SYC', 690, 'SE', 'Seychelles', 'Seychelles', 'Victoria', 455, 88340, 'AF', '.sc', 'SCR', '248', '', '', 'en-SC,fr-SC', '', '', NULL, '0', 0, 0, NULL, NULL),
(197, 'SD', 'SDN', 729, 'SU', 'Sudan', 'Sudan', 'Khartoum', 1861484, 35000000, 'AF', '.sd', 'SDG', '249', '#####', '^(d{5})$', 'ar-SD,en,fia', 'SS,TD,EG,ET,ER,LY,CF', '', NULL, '0', 0, 0, NULL, NULL),
(198, 'SE', 'SWE', 752, 'SW', 'Sverige', 'Sweden', 'Stockholm', 449964, 9555893, 'EU', '.se', 'SEK', '46', '### ##', '^(?:SE)*(d{5})$', 'sv-SE,se,sma,fi-SE', 'NO,FI', '', NULL, '0', 0, 0, NULL, NULL),
(199, 'SG', 'SGP', 702, 'SN', 'xīnjiāpō', 'Singapore', 'Singapur', 693, 4701069, 'AS', '.sg', 'SGD', '65', '######', '^(d{6})$', 'cmn,en-SG,ms-SG,ta-SG,zh-SG', '', '', NULL, '0', 0, 0, NULL, NULL),
(200, 'SH', 'SHN', 654, 'SH', 'Saint Helena', 'Saint Helena', 'Jamestown', 410, 7460, 'AF', '.sh', 'SHP', '290', 'STHL 1ZZ', '^(STHL1ZZ)$', 'en-SH', '', '', NULL, '0', 0, 0, NULL, NULL),
(201, 'SI', 'SVN', 705, 'SI', 'Slovenija', 'Slovenia', 'Ljubljana', 20273, 2007000, 'EU', '.si', 'EUR', '386', '####', '^(?:SI)*(d{4})$', 'sl,sh', 'HU,IT,HR,AT', '', NULL, '0', 0, 0, NULL, NULL),
(202, 'SJ', 'SJM', 744, 'SV', 'Svalbard and Jan Mayen', 'Svalbard and Jan Mayen', 'Longyearbyen', 62049, 2550, 'EU', '.sj', 'NOK', '47', '', '', 'no,ru', '', '', NULL, '0', 0, 0, NULL, NULL),
(203, 'SK', 'SVK', 703, 'LO', 'Slovensko', 'Slovakia', 'Bratislava', 48845, 5455000, 'EU', '.sk', 'EUR', '421', '### ##', '^(d{5})$', 'sk,hu', 'PL,HU,CZ,UA,AT', '', NULL, '0', 0, 0, NULL, NULL),
(204, 'SL', 'SLE', 694, 'SL', 'Sierra Leone', 'Sierra Leone', 'Freetown', 71740, 5245695, 'AF', '.sl', 'SLL', '232', '', '', 'en-SL,men,tem', 'LR,GN', '', NULL, '0', 0, 0, NULL, NULL),
(205, 'SM', 'SMR', 674, 'SM', 'San Marino', 'San Marino', 'San Marino', 61, 31477, 'EU', '.sm', 'EUR', '378', '4789#', '^(4789d)$', 'it-SM', 'IT', '', NULL, '0', 0, 0, NULL, NULL),
(206, 'SN', 'SEN', 686, 'SG', 'Sénégal', 'Senegal', 'Dakar', 196190, 12323252, 'AF', '.sn', 'XOF', '221', '#####', '^(d{5})$', 'fr-SN,wo,fuc,mnk', 'GN,MR,GW,GM,ML', '', NULL, '0', 0, 0, NULL, NULL),
(207, 'SO', 'SOM', 706, 'SO', 'Soomaaliya', 'Somalia', 'Mogadishu', 637657, 10112453, 'AF', '.so', 'SOS', '252', '@@  #####', '^([A-Z]{2}d{5})$', 'so-SO,ar-SO,it,en-SO', 'ET,KE,DJ', '', NULL, '0', 0, 0, NULL, NULL),
(208, 'SR', 'SUR', 740, 'NS', 'Suriname', 'Suriname', 'Paramaribo', 163270, 492829, 'SA', '.sr', 'SRD', '597', '', '', 'nl-SR,en,srn,hns,jv', 'GY,BR,GF', '', NULL, '0', 0, 0, NULL, NULL),
(209, 'SS', 'SSD', 728, 'OD', 'South Sudan', 'South Sudan', 'Juba', 644329, 8260490, 'AF', '', 'SSP', '211', '', '', 'en', 'CD,CF,ET,KE,SD,UG,', '', NULL, '0', 0, 0, NULL, NULL),
(210, 'ST', 'STP', 678, 'TP', 'São Tomé e Príncipe', 'Sao Tome and Principe', 'Sao Tome', 1001, 175808, 'AF', '.st', 'STD', '239', '', '', 'pt-ST', '', '', NULL, '0', 0, 0, NULL, NULL),
(211, 'SV', 'SLV', 222, 'ES', 'El Salvador', 'El Salvador', 'San Salvador', 21040, 6052064, 'NA', '.sv', 'USD', '503', 'CP ####', '^(?:CP)*(d{4})$', 'es-SV', 'GT,HN', '', NULL, '0', 0, 0, NULL, NULL),
(212, 'SX', 'SXM', 534, 'NN', 'Sint Maarten', 'Sint Maarten', 'Philipsburg', 21, 37429, 'NA', '.sx', 'ANG', '599', '', '', 'nl,en', 'MF', '', NULL, '0', 0, 0, NULL, NULL),
(213, 'SY', 'SYR', 760, 'SY', 'Sūrīyâ', 'Syria', 'Damascus', 185180, 22198110, 'AS', '.sy', 'SYP', '963', '', '', 'ar-SY,ku,hy,arc,fr,en', 'IQ,JO,IL,TR,LB', '', NULL, '0', 0, 0, NULL, NULL),
(214, 'SZ', 'SWZ', 748, 'WZ', 'Swaziland', 'Swaziland', 'Mbabane', 17363, 1354051, 'AF', '.sz', 'SZL', '268', '@###', '^([A-Z]d{3})$', 'en-SZ,ss-SZ', 'ZA,MZ', '', NULL, '0', 0, 0, NULL, NULL),
(215, 'TC', 'TCA', 796, 'TK', 'Turks and Caicos Islands', 'Turks and Caicos Islands', 'Cockburn Town', 430, 20556, 'NA', '.tc', 'USD', '+1-649', 'TKCA 1ZZ', '^(TKCA 1ZZ)$', 'en-TC', '', '', NULL, '0', 0, 0, NULL, NULL),
(216, 'TD', 'TCD', 148, 'CD', 'Tchad', 'Chad', 'N\'Djamena', 1284000, 10543464, 'AF', '.td', 'XAF', '235', '', '', 'fr-TD,ar-TD,sre', 'NE,LY,CF,SD,CM,NG', '', NULL, '0', 0, 0, NULL, NULL),
(217, 'TF', 'ATF', 260, 'FS', 'French Southern Territories', 'French Southern Territories', 'Port-aux-Francais', 7829, 140, 'AN', '.tf', 'EUR', '', '', '', 'fr', '', '', NULL, '0', 0, 0, NULL, NULL),
(218, 'TG', 'TGO', 768, 'TO', 'Togo', 'Togo', 'Lome', 56785, 6587239, 'AF', '.tg', 'XOF', '228', '', '', 'fr-TG,ee,hna,kbp,dag,ha', 'BJ,GH,BF', '', NULL, '0', 0, 0, NULL, NULL),
(219, 'TH', 'THA', 764, 'TH', 'Prathēt tai', 'Thailand', 'Bangkok', 514000, 67089500, 'AS', '.th', 'THB', '66', '#####', '^(d{5})$', 'th,en', 'LA,MM,KH,MY', '', NULL, '0', 0, 0, NULL, NULL),
(220, 'TJ', 'TJK', 762, 'TI', 'Tojikiston', 'Tajikistan', 'Dushanbe', 143100, 7487489, 'AS', '.tj', 'TJS', '992', '######', '^(d{6})$', 'tg,ru', 'CN,AF,KG,UZ', '', NULL, '0', 0, 0, NULL, NULL),
(221, 'TK', 'TKL', 772, 'TL', 'Tokelau', 'Tokelau', '', 10, 1466, 'OC', '.tk', 'NZD', '690', '', '', 'tkl,en-TK', '', '', NULL, '0', 0, 0, NULL, NULL),
(222, 'TL', 'TLS', 626, 'TT', 'Timór Lorosa\'e', 'East Timor', 'Dili', 15007, 1154625, 'OC', '.tl', 'USD', '670', '', '', 'tet,pt-TL,id,en', 'ID', '', NULL, '0', 0, 0, NULL, NULL),
(223, 'TM', 'TKM', 795, 'TX', 'Turkmenistan', 'Turkmenistan', 'Ashgabat', 488100, 4940916, 'AS', '.tm', 'TMT', '993', '######', '^(d{6})$', 'tk,ru,uz', 'AF,IR,UZ,KZ', '', NULL, '0', 0, 0, NULL, NULL),
(224, 'TN', 'TUN', 788, 'TS', 'Tunisie', 'Tunisia', 'Tunis', 163610, 10589025, 'AF', '.tn', 'TND', '216', '####', '^(d{4})$', 'ar-TN,fr', 'DZ,LY', '', NULL, '0', 0, 0, NULL, NULL),
(225, 'TO', 'TON', 776, 'TN', 'Tonga', 'Tonga', 'Nuku\'alofa', 748, 122580, 'OC', '.to', 'TOP', '676', '', '', 'to,en-TO', '', '', NULL, '0', 0, 0, NULL, NULL),
(226, 'TR', 'TUR', 792, 'TU', 'Türkiye', 'Turkey', 'Ankara', 780580, 77804122, 'AS', '.tr', 'TRY', '90', '#####', '^(d{5})$', 'tr-TR,ku,diq,az,av', 'SY,GE,IQ,IR,GR,AM,AZ,BG', '', NULL, '0', 0, 0, NULL, NULL),
(227, 'TT', 'TTO', 780, 'TD', 'Trinidad and Tobago', 'Trinidad and Tobago', 'Port of Spain', 5128, 1228691, 'NA', '.tt', 'TTD', '+1-868', '', '', 'en-TT,hns,fr,es,zh', '', '', NULL, '0', 0, 0, NULL, NULL),
(228, 'TV', 'TUV', 798, 'TV', 'Tuvalu', 'Tuvalu', 'Funafuti', 26, 10472, 'OC', '.tv', 'AUD', '688', '', '', 'tvl,en,sm,gil', '', '', NULL, '0', 0, 0, NULL, NULL),
(229, 'TW', 'TWN', 158, 'TW', 'T\'ai2-wan1', 'Taiwan', 'Taipei', 35980, 22894384, 'AS', '.tw', 'TWD', '886', '#####', '^(d{5})$', 'zh-TW,zh,nan,hak', '', '', NULL, '0', 0, 0, NULL, NULL),
(230, 'TZ', 'TZA', 834, 'TZ', 'Tanzania', 'Tanzania', 'Dodoma', 945087, 41892895, 'AF', '.tz', 'TZS', '255', '', '', 'sw-TZ,en,ar', 'MZ,KE,CD,RW,ZM,BI,UG,MW', '', NULL, '0', 0, 0, NULL, NULL),
(231, 'UA', 'UKR', 804, 'UP', 'Ukrajina', 'Ukraine', 'Kiev', 603700, 45415596, 'EU', '.ua', 'UAH', '380', '#####', '^(d{5})$', 'uk,ru-UA,rom,pl,hu', 'PL,MD,HU,SK,BY,RO,RU', '', NULL, '0', 0, 0, NULL, NULL),
(232, 'UG', 'UGA', 800, 'UG', 'Uganda', 'Uganda', 'Kampala', 236040, 33398682, 'AF', '.ug', 'UGX', '256', '', '', 'en-UG,lg,sw,ar', 'TZ,KE,SS,CD,RW', '', NULL, '0', 0, 0, NULL, NULL),
(233, 'UK', 'GBR', 826, 'UK', 'United Kingdom', 'United Kingdom', 'London', 244820, 62348447, 'EU', '.uk', 'GBP', '44', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en-GB,cy-GB,gd', 'IE', '', NULL, '0', 0, 0, NULL, NULL),
(234, 'UM', 'UMI', 581, '', 'United States Minor Outlying Islands', 'United States Minor Outlying Islands', '', 0, 0, 'OC', '.um', 'USD', '1', '', '', 'en-UM', '', '', NULL, '0', 0, 0, NULL, NULL),
(235, 'US', 'USA', 840, 'US', 'USA', 'United States', 'Washington', 9629091, 310232863, 'NA', '.us', 'USD', '1', '#####-####', '^d{5}(-d{4})?$', 'en-US,es-US,haw,fr', 'CA,MX,CU', '', NULL, '0', 0, 0, NULL, NULL),
(236, 'UY', 'URY', 858, 'UY', 'Uruguay', 'Uruguay', 'Montevideo', 176220, 3477000, 'SA', '.uy', 'UYU', '598', '#####', '^(d{5})$', 'es-UY', 'BR,AR', '', NULL, '0', 0, 0, NULL, NULL),
(237, 'UZ', 'UZB', 860, 'UZ', 'O\'zbekiston', 'Uzbekistan', 'Tashkent', 447400, 27865738, 'AS', '.uz', 'UZS', '998', '######', '^(d{6})$', 'uz,ru,tg', 'TM,AF,KG,TJ,KZ', '', NULL, '0', 0, 0, NULL, NULL),
(238, 'VA', 'VAT', 336, 'VT', 'Vaticanum', 'Vatican', 'Vatican City', 0, 921, 'EU', '.va', 'EUR', '379', '#####', '^(d{5})$', 'la,it,fr', 'IT', '', NULL, '0', 0, 0, NULL, NULL),
(239, 'VC', 'VCT', 670, 'VC', 'Saint Vincent and the Grenadines', 'Saint Vincent and the Grenadines', 'Kingstown', 389, 104217, 'NA', '.vc', 'XCD', '+1-784', '', '', 'en-VC,fr', '', '', NULL, '0', 0, 0, NULL, NULL),
(240, 'VE', 'VEN', 862, 'VE', 'Venezuela', 'Venezuela', 'Caracas', 912050, 27223228, 'SA', '.ve', 'VEF', '58', '####', '^(d{4})$', 'es-VE', 'GY,BR,CO', '', NULL, '0', 0, 0, NULL, NULL),
(241, 'VG', 'VGB', 92, 'VI', 'British Virgin Islands', 'British Virgin Islands', 'Road Town', 153, 21730, 'NA', '.vg', 'USD', '+1-284', '', '', 'en-VG', '', '', NULL, '0', 0, 0, NULL, NULL),
(242, 'VI', 'VIR', 850, 'VQ', 'U.S. Virgin Islands', 'U.S. Virgin Islands', 'Charlotte Amalie', 352, 108708, 'NA', '.vi', 'USD', '+1-340', '#####-####', '^d{5}(-d{4})?$', 'en-VI', '', '', NULL, '0', 0, 0, NULL, NULL),
(243, 'VN', 'VNM', 704, 'VM', 'Việt Nam', 'Vietnam', 'Hanoi', 329560, 89571130, 'AS', '.vn', 'VND', '84', '######', '^(d{6})$', 'vi,en,fr,zh,km', 'CN,LA,KH', '', NULL, '0', 0, 0, NULL, NULL),
(244, 'VU', 'VUT', 548, 'NH', 'Vanuatu', 'Vanuatu', 'Port Vila', 12200, 221552, 'OC', '.vu', 'VUV', '678', '', '', 'bi,en-VU,fr-VU', '', '', NULL, '0', 0, 0, NULL, NULL),
(245, 'WF', 'WLF', 876, 'WF', 'Wallis and Futuna', 'Wallis and Futuna', 'Mata Utu', 274, 16025, 'OC', '.wf', 'XPF', '681', '#####', '^(986d{2})$', 'wls,fud,fr-WF', '', '', NULL, '0', 0, 0, NULL, NULL),
(246, 'WS', 'WSM', 882, 'WS', 'Samoa', 'Samoa', 'Apia', 2944, 192001, 'OC', '.ws', 'WST', '685', '', '', 'sm,en-WS', '', '', NULL, '0', 0, 0, NULL, NULL),
(247, 'XK', 'XKX', 0, 'KV', 'Kosovo', 'Kosovo', 'Pristina', 10908, 1800000, 'EU', '', 'EUR', '', '', '', 'sq,sr', 'RS,AL,MK,ME', '', NULL, '0', 0, 0, NULL, NULL),
(248, 'YE', 'YEM', 887, 'YM', 'al-Yaman', 'Yemen', 'Sanaa', 527970, 23495361, 'AS', '.ye', 'YER', '967', '', '', 'ar-YE', 'SA,OM', '', NULL, '0', 0, 0, NULL, NULL),
(249, 'YT', 'MYT', 175, 'MF', 'Mayotte', 'Mayotte', 'Mamoudzou', 374, 159042, 'AF', '.yt', 'EUR', '262', '#####', '^(d{5})$', 'fr-YT', '', '', NULL, '0', 0, 0, NULL, NULL),
(250, 'ZA', 'ZAF', 710, 'SF', 'South Africa', 'South Africa', 'Pretoria', 1219912, 49000000, 'AF', '.za', 'ZAR', '27', '####', '^(d{4})$', 'zu,xh,af,nso,en-ZA,tn,st,ts,ss,ve,nr', 'ZW,SZ,MZ,BW,NA,LS', '', NULL, '0', 0, 0, NULL, NULL),
(251, 'ZM', 'ZMB', 894, 'ZA', 'Zambia', 'Zambia', 'Lusaka', 752614, 13460305, 'AF', '.zm', 'ZMW', '260', '#####', '^(d{5})$', 'en-ZM,bem,loz,lun,lue,ny,toi', 'ZW,TZ,MZ,CD,NA,MW,AO', '', NULL, '0', 0, 0, NULL, NULL),
(252, 'ZW', 'ZWE', 716, 'ZI', 'Zimbabwe', 'Zimbabwe', 'Harare', 390580, 11651858, 'AF', '.zw', 'ZWL', '263', '', '', 'en-ZW,sn,nr,nd', 'ZA,MZ,BW,ZM', '', NULL, '0', 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `html_entity` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'From Github : An array of currency symbols as HTML entities',
  `font_arial` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `font_code2000` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unicode_decimal` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unicode_hex` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `in_left` tinyint(1) UNSIGNED DEFAULT '0',
  `decimal_places` int(10) UNSIGNED DEFAULT '2' COMMENT 'Currency Decimal Places - ISO 4217',
  `decimal_separator` varchar(10) COLLATE utf8_unicode_ci DEFAULT '.',
  `thousand_separator` varchar(10) COLLATE utf8_unicode_ci DEFAULT ',',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `html_entity`, `font_arial`, `font_code2000`, `unicode_decimal`, `unicode_hex`, `in_left`, `decimal_places`, `decimal_separator`, `thousand_separator`, `created_at`, `updated_at`) VALUES
(1, 'AED', 'United Arab Emirates Dirham', '&#1583;.&#1573;', 'د.إ', 'د.إ', NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(2, 'AFN', 'Afghanistan Afghani', '&#65;&#102;', '؋', '؋', '1547', '60b', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(3, 'ALL', 'Albania Lek', '&#76;&#101;&#107;', 'Lek', 'Lek', '76, 1', '4c, 6', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(4, 'AMD', 'Armenia Dram', '', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(5, 'ANG', 'Netherlands Antilles Guilder', '&#402;', 'ƒ', 'ƒ', '402', '192', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(6, 'AOA', 'Angola Kwanza', '&#75;&#122;', 'Kz', 'Kz', NULL, NULL, 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(7, 'ARS', 'Argentina Peso', '&#36;', '$', '$', '36', '24', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(8, 'AUD', 'Australia Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(9, 'AWG', 'Aruba Guilder', '&#402;', 'ƒ', 'ƒ', '402', '192', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(10, 'AZN', 'Azerbaijan New Manat', '&#1084;&#1072;&#1085;', 'ман', 'ман', '1084,', '43c, ', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(11, 'BAM', 'Bosnia and Herzegovina Convertible Marka', '&#75;&#77;', 'KM', 'KM', '75, 7', '4b, 4', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(12, 'BBD', 'Barbados Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(13, 'BDT', 'Bangladesh Taka', '&#2547;', '৳', '৳', NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(14, 'BGN', 'Bulgaria Lev', '&#1083;&#1074;', 'лв', 'лв', '1083,', '43b, ', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(15, 'BHD', 'Bahrain Dinar', '.&#1583;.&#1576;', NULL, NULL, NULL, NULL, 0, 3, '.', ',', NULL, '2016-04-03 12:35:01'),
(16, 'BIF', 'Burundi Franc', '&#70;&#66;&#117;', 'FBu', 'FBu', NULL, NULL, 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(17, 'BMD', 'Bermuda Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(18, 'BND', 'Brunei Darussalam Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(19, 'BOB', 'Bolivia Boliviano', '&#36;&#98;', '$b', '$b', '36, 9', '24, 6', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(20, 'BRL', 'Brazil Real', '&#82;&#36;', 'R$', 'R$', '82, 3', '52, 2', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(21, 'BSD', 'Bahamas Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(22, 'BTN', 'Bhutan Ngultrum', '&#78;&#117;&#46;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(23, 'BWP', 'Botswana Pula', '&#80;', 'P', 'P', '80', '50', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(24, 'BYR', 'Belarus Ruble', '&#112;&#46;', 'p.', 'p.', '112, ', '70, 2', 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(25, 'BZD', 'Belize Dollar', '&#66;&#90;&#36;', 'BZ$', 'BZ$', '66, 9', '42, 5', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(26, 'CAD', 'Canada Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(27, 'CDF', 'Congo/Kinshasa Franc', '&#70;&#67;', 'Fr', 'Fr', NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(28, 'CHF', 'Switzerland Franc', '', 'Fr', 'Fr', '67, 7', '43, 4', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(29, 'CLP', 'Chile Peso', '&#36;', '$', '$', '36', '24', 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(30, 'CNY', 'China Yuan Renminbi', '&#165;', '¥', '¥', '165', 'a5', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(31, 'COP', 'Colombia Peso', '&#36;', '$', '$', '36', '24', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(32, 'CRC', 'Costa Rica Colon', '&#8353;', '₡', '₡', '8353', '20a1', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(33, 'CUC', 'Cuba Convertible Peso', NULL, NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(34, 'CUP', 'Cuba Peso', '&#8396;', '₱', '₱', '8369', '20b1', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(35, 'CVE', 'Cape Verde Escudo', '&#x24;', '$', '$', NULL, NULL, 1, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(36, 'CZK', 'Czech Republic Koruna', '&#75;&#269;', 'Kč', 'Kč', '75, 2', '4b, 1', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(37, 'DJF', 'Djibouti Franc', '&#70;&#100;&#106;', 'Fr', 'Fr', NULL, NULL, 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(38, 'DKK', 'Denmark Krone', '&#107;&#114;', 'kr', 'kr', '107, ', '6b, 7', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(39, 'DOP', 'Dominican Republic Peso', '&#82;&#68;&#36;', 'RD$', 'RD$', '82, 6', '52, 4', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(40, 'DZD', 'Algeria Dinar', '&#1583;&#1580;', 'DA', 'DA', NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(41, 'EEK', 'Estonia Kroon', NULL, 'kr', 'kr', '107, ', '6b, 7', 0, 2, '.', ',', NULL, NULL),
(42, 'EGP', 'Egypt Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(43, 'ERN', 'Eritrea Nakfa', '&#x4E;&#x66;&#x6B;', 'Nfk', 'Nfk', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(44, 'ETB', 'Ethiopia Birr', '&#66;&#114;', 'Br', 'Br', NULL, NULL, 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(45, 'EUR', 'Euro Member Countries', '€', '€', '€', '8364', '20ac', 0, 2, ',', ' ', NULL, '2017-02-10 06:27:28'),
(46, 'FJD', 'Fiji Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(47, 'FKP', 'Falkland Islands (Malvinas) Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(48, 'GBP', 'United Kingdom Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(49, 'GEL', 'Georgia Lari', '&#4314;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(50, 'GGP', 'Guernsey Pound', NULL, '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, NULL),
(51, 'GHC', 'Ghana Cedi', '&#x47;&#x48;&#xA2;', 'GH¢', 'GH¢', '162', 'a2', 1, 2, '.', ',', NULL, NULL),
(52, 'GHS', 'Ghana Cedi', '&#x47;&#x48;&#xA2;', 'GH¢', 'GH¢', NULL, NULL, 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(53, 'GIP', 'Gibraltar Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(54, 'GMD', 'Gambia Dalasi', '&#68;', 'D', 'D', NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(55, 'GNF', 'Guinea Franc', '&#70;&#71;', 'Fr', 'Fr', NULL, NULL, 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(56, 'GTQ', 'Guatemala Quetzal', '&#81;', 'Q', 'Q', '81', '51', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(57, 'GYD', 'Guyana Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(58, 'HKD', 'Hong Kong Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(59, 'HNL', 'Honduras Lempira', '&#76;', 'L', 'L', '76', '4c', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(60, 'HRK', 'Croatia Kuna', '&#107;&#110;', 'kn', 'kn', '107, ', '6b, 6', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(61, 'HTG', 'Haiti Gourde', '&#71;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(62, 'HUF', 'Hungary Forint', '&#70;&#116;', 'Ft', 'Ft', '70, 1', '46, 7', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(63, 'IDR', 'Indonesia Rupiah', '&#82;&#112;', 'Rp', 'Rp', '82, 1', '52, 7', 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(64, 'ILS', 'Israel Shekel', '&#8362;', '₪', '₪', '8362', '20aa', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(65, 'IMP', 'Isle of Man Pound', NULL, '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, NULL),
(66, 'INR', 'India Rupee', '&#8377;', '₨', '₨', '', '', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(67, 'IQD', 'Iraq Dinar', '&#1593;.&#1583;', 'د.ع;', 'د.ع;', NULL, NULL, 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(68, 'IRR', 'Iran Rial', '&#65020;', '﷼', '﷼', '65020', 'fdfc', 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(69, 'ISK', 'Iceland Krona', '&#107;&#114;', 'kr', 'kr', '107, ', '6b, 7', 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(70, 'JEP', 'Jersey Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(71, 'JMD', 'Jamaica Dollar', '&#74;&#36;', 'J$', 'J$', '74, 3', '4a, 2', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(72, 'JOD', 'Jordan Dinar', '&#74;&#68;', NULL, NULL, NULL, NULL, 0, 3, '.', ',', NULL, '2016-04-03 12:35:01'),
(73, 'JPY', 'Japan Yen', '&#165;', '¥', '¥', '165', 'a5', 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(74, 'KES', 'Kenya Shilling', '&#x4B;&#x53;&#x68;', 'KSh', 'KSh', NULL, NULL, 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(75, 'KGS', 'Kyrgyzstan Som', '&#1083;&#1074;', 'лв', 'лв', '1083,', '43b, ', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(76, 'KHR', 'Cambodia Riel', '&#6107;', '៛', '៛', '6107', '17db', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(77, 'KMF', 'Comoros Franc', '&#67;&#70;', 'Fr', 'Fr', NULL, NULL, 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(78, 'KPW', 'Korea (North) Won', '&#8361;', '₩', '₩', '8361', '20a9', 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(79, 'KRW', 'Korea (South) Won', '&#8361;', '₩', '₩', '8361', '20a9', 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(80, 'KWD', 'Kuwait Dinar', '&#1583;.&#1603;', 'د.ك', 'د.ك', NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(81, 'KYD', 'Cayman Islands Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(82, 'KZT', 'Kazakhstan Tenge', '&#1083;&#1074;', 'лв', 'лв', '1083,', '43b, ', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(83, 'LAK', 'Laos Kip', '&#8365;', '₭', '₭', '8365', '20ad', 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(84, 'LBP', 'Lebanon Pound', '&#163;', '£', '£', '163', 'a3', 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(85, 'LKR', 'Sri Lanka Rupee', '&#8360;', '₨', '₨', '8360', '20a8', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(86, 'LRD', 'Liberia Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(87, 'LSL', 'Lesotho Loti', '&#76;', 'M', 'M', NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(88, 'LTL', 'Lithuania Litas', '&#76;&#116;', 'Lt', 'Lt', '76, 1', '4c, 7', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(89, 'LVL', 'Latvia Lat', '&#76;&#115;', 'Ls', 'Ls', '76, 1', '4c, 7', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(90, 'LYD', 'Libya Dinar', '&#1604;.&#1583;', 'DL', 'DL', NULL, NULL, 0, 3, '.', ',', NULL, '2016-04-03 12:35:01'),
(91, 'MAD', 'Morocco Dirham', '&#1583;.&#1605;.', 'Dhs', 'Dhs', NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(92, 'MDL', 'Moldova Leu', '&#76;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(93, 'MGA', 'Madagascar Ariary', '&#65;&#114;', 'Ar', 'Ar', NULL, NULL, 0, 5, '.', ',', NULL, '2016-04-03 12:35:01'),
(94, 'MKD', 'Macedonia Denar', '&#1076;&#1077;&#1085;', 'ден', 'ден', '1076,', '434, ', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(95, 'MMK', 'Myanmar (Burma) Kyat', '&#75;', NULL, NULL, NULL, NULL, 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(96, 'MNT', 'Mongolia Tughrik', '&#8366;', '₮', '₮', '8366', '20ae', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(97, 'MOP', 'Macau Pataca', '&#77;&#79;&#80;&#36;', NULL, NULL, NULL, NULL, 0, 1, '.', ',', NULL, '2016-04-03 12:35:01'),
(98, 'MRO', 'Mauritania Ouguiya', '&#85;&#77;', 'UM', 'UM', NULL, NULL, 0, 5, '.', ',', NULL, '2016-04-03 12:35:01'),
(99, 'MUR', 'Mauritius Rupee', '&#8360;', '₨', '₨', '8360', '20a8', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(100, 'MVR', 'Maldives (Maldive Islands) Rufiyaa', '.&#1923;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(101, 'MWK', 'Malawi Kwacha', '&#77;&#75;', 'MK', 'MK', NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(102, 'MXN', 'Mexico Peso', '&#36;', '$', '$', '36', '24', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(103, 'MYR', 'Malaysia Ringgit', '&#82;&#77;', 'RM', 'RM', '82, 7', '52, 4', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(104, 'MZN', 'Mozambique Metical', '&#77;&#84;', 'MT', 'MT', '77, 8', '4d, 5', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(105, 'NAD', 'Namibia Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(106, 'NGN', 'Nigeria Naira', '&#8358;', '₦', '₦', '8358', '20a6', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(107, 'NIO', 'Nicaragua Cordoba', '&#67;&#36;', 'C$', 'C$', '67, 3', '43, 2', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(108, 'NOK', 'Norway Krone', '&#107;&#114;', 'kr', 'kr', '107, ', '6b, 7', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(109, 'NPR', 'Nepal Rupee', '&#8360;', '₨', '₨', '8360', '20a8', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(110, 'NZD', 'New Zealand Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(111, 'OMR', 'Oman Rial', '&#65020;', '﷼', '﷼', '65020', 'fdfc', 0, 3, '.', ',', NULL, '2016-04-03 12:35:01'),
(112, 'PAB', 'Panama Balboa', '&#66;&#47;&#46;', 'B/.', 'B/.', '66, 4', '42, 2', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(113, 'PEN', 'Peru Nuevo Sol', '&#83;&#47;&#46;', 'S/.', 'S/.', '83, 4', '53, 2', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(114, 'PGK', 'Papua New Guinea Kina', '&#75;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(115, 'PHP', 'Philippines Peso', '&#8369;', '₱', '₱', '8369', '20b1', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(116, 'PKR', 'Pakistan Rupee', '&#8360;', '₨', '₨', '8360', '20a8', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(117, 'PLN', 'Poland Zloty', '&#122;&#322;', 'zł', 'zł', '122, ', '7a, 1', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(118, 'PYG', 'Paraguay Guarani', '&#71;&#115;', 'Gs', 'Gs', '71, 1', '47, 7', 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(119, 'QAR', 'Qatar Riyal', '&#65020;', '﷼', '﷼', '65020', 'fdfc', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(120, 'RON', 'Romania New Leu', '&#108;&#101;&#105;', 'lei', 'lei', '108, ', '6c, 6', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(121, 'RSD', 'Serbia Dinar', '&#1044;&#1080;&#1085;&#46;', 'Дин.', 'Дин.', '1044,', '414, ', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(122, 'RUB', 'Russia Ruble', '&#1088;&#1091;&#1073;', 'руб', 'руб', '1088,', '440, ', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(123, 'RWF', 'Rwanda Franc', '&#1585;.&#1587;', 'FRw', 'FRw', NULL, NULL, 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(124, 'SAR', 'Saudi Arabia Riyal', '&#65020;', '﷼', '﷼', '65020', 'fdfc', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(125, 'SBD', 'Solomon Islands Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(126, 'SCR', 'Seychelles Rupee', '&#8360;', '₨', '₨', '8360', '20a8', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(127, 'SDG', 'Sudan Pound', '&#163;', 'DS', 'DS', NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(128, 'SEK', 'Sweden Krona', '&#107;&#114;', 'kr', 'kr', '107, ', '6b, 7', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(129, 'SGD', 'Singapore Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(130, 'SHP', 'Saint Helena Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(131, 'SLL', 'Sierra Leone Leone', '&#76;&#101;', 'Le', 'Le', NULL, NULL, 1, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(132, 'SOS', 'Somalia Shilling', '&#83;', 'S', 'S', '83', '53', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(133, 'SPL', 'Seborga Luigino', NULL, NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(134, 'SRD', 'Suriname Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(135, 'SSP', 'South Sudanese Pound', '&#xA3;', '£', '£', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(136, 'STD', 'São Tomé and Príncipe Dobra', '&#68;&#98;', 'Db', 'Db', NULL, NULL, 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(137, 'SVC', 'El Salvador Colon', '&#36;', '$', '$', '36', '24', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(138, 'SYP', 'Syria Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(139, 'SZL', 'Swaziland Lilangeni', '&#76;', 'E', 'E', NULL, NULL, 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(140, 'THB', 'Thailand Baht', '&#3647;', '฿', '฿', '3647', 'e3f', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(141, 'TJS', 'Tajikistan Somoni', '&#84;&#74;&#83;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(142, 'TMT', 'Turkmenistan Manat', '&#109;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(143, 'TND', 'Tunisia Dinar', '&#1583;.&#1578;', 'DT', 'DT', NULL, NULL, 1, 3, '.', ',', NULL, '2016-04-03 12:35:01'),
(144, 'TOP', 'Tonga Pa\'anga', '&#84;&#36;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(145, 'TRL', 'Turkey Lira', NULL, '₤', '₤', '8356', '20a4', 1, 2, '.', ',', NULL, NULL),
(146, 'TRY', 'Turkey Lira', '&#x20BA;', '₺', '₺', '', '', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(147, 'TTD', 'Trinidad and Tobago Dollar', '&#36;', 'TT$', 'TT$', '84, 8', '54, 5', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(148, 'TVD', 'Tuvalu Dollar', NULL, '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(149, 'TWD', 'Taiwan New Dollar', '&#78;&#84;&#36;', 'NT$', 'NT$', '78, 8', '4e, 5', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(150, 'TZS', 'Tanzania Shilling', '&#x54;&#x53;&#x68;', 'TSh', 'TSh', NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(151, 'UAH', 'Ukraine Hryvnia', '&#8372;', '₴', '₴', '8372', '20b4', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(152, 'UGX', 'Uganda Shilling', '&#85;&#83;&#104;', 'USh', 'USh', NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(153, 'USD', 'United States Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(154, 'UYU', 'Uruguay Peso', '&#36;&#85;', '$U', '$U', '36, 8', '24, 5', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(155, 'UZS', 'Uzbekistan Som', '&#1083;&#1074;', 'лв', 'лв', '1083,', '43b, ', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(156, 'VEF', 'Venezuela Bolivar', '&#66;&#115;', 'Bs', 'Bs', '66, 1', '42, 7', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(157, 'VND', 'Viet Nam Dong', '&#8363;', '₫', '₫', '8363', '20ab', 1, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(158, 'VUV', 'Vanuatu Vatu', '&#86;&#84;', NULL, NULL, NULL, NULL, 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(159, 'WST', 'Samoa Tala', '&#87;&#83;&#36;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(160, 'XAF', 'Communauté Financière Africaine (BEAC) CFA Franc B', '&#70;&#67;&#70;&#65;', 'F', 'F', NULL, NULL, 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(161, 'XCD', 'East Caribbean Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(162, 'XDR', 'International Monetary Fund (IMF) Special Drawing ', '', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(163, 'XOF', 'Communauté Financière Africaine (BCEAO) Franc', '&#70;&#67;&#70;&#65;', 'F', 'F', NULL, NULL, 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(164, 'XPF', 'Comptoirs Français du Pacifique (CFP) Franc', '&#70;', 'F', 'F', NULL, NULL, 0, 0, '.', ',', NULL, '2016-04-03 12:35:01'),
(165, 'YER', 'Yemen Rial', '&#65020;', '﷼', '﷼', '65020', 'fdfc', 0, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(166, 'ZAR', 'South Africa Rand', '&#82;', 'R', 'R', '82', '52', 1, 2, '.', ',', NULL, '2016-04-03 12:35:01'),
(167, 'ZMW', 'Zambia Kwacha', NULL, 'ZK', 'ZK', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(168, 'ZWD', 'Zimbabwe Dollar', NULL, 'Z$', 'Z$', '90, 3', '5a, 2', 1, 2, '.', ',', NULL, NULL),
(169, 'ZWL', 'Zimbabwe Dollar', NULL, 'Z$', 'Z$', '90, 3', '5a, 2', 1, 2, '.', ',', NULL, NULL),
(170, 'XBT', 'Bitcoin', '฿', '฿', '฿', NULL, NULL, 1, 2, '.', ',', NULL, '2017-04-08 04:49:08');

-- --------------------------------------------------------

--
-- Table structure for table `endorsements`
--

CREATE TABLE `endorsements` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `endorser_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `endorsements`
--

INSERT INTO `endorsements` (`id`, `user_id`, `endorser_id`, `created_at`, `updated_at`) VALUES
(1, 16, 25, '2020-12-24 16:53:39', '2020-12-24 16:53:39'),
(2, 25, 2, '2020-12-24 16:57:02', '2020-12-24 16:57:02'),
(3, 16, 1, '2020-12-24 16:58:33', '2020-12-24 16:58:33'),
(4, 25, 1, '2020-12-26 12:44:17', '2020-12-26 12:44:17'),
(5, 28, 1, '2020-12-26 19:55:15', '2020-12-26 19:55:15'),
(6, 6, 7, '2020-12-29 05:44:28', '2020-12-29 05:44:28'),
(7, 6, 6, '2020-12-29 06:18:28', '2020-12-29 06:18:28'),
(8, 34, 1, '2020-12-29 09:41:54', '2020-12-29 09:41:54'),
(9, 34, 2, '2020-12-29 09:48:50', '2020-12-29 09:48:50'),
(10, 30, 2, '2020-12-29 19:56:00', '2020-12-29 19:56:00'),
(11, 30, 1, '2021-01-04 12:44:25', '2021-01-04 12:44:25'),
(12, 39, 7, '2021-01-23 12:04:18', '2021-01-23 12:04:18');

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `translation_lang`, `translation_of`, `name`) VALUES
(1, 'en', 1, 'Mr'),
(2, 'en', 2, 'Mrs');

-- --------------------------------------------------------

--
-- Table structure for table `hireds`
--

CREATE TABLE `hireds` (
  `id` int(11) NOT NULL,
  `appl_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hireds`
--

INSERT INTO `hireds` (`id`, `appl_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-12-01 18:21:00', '2020-12-01 18:21:00');

-- --------------------------------------------------------

--
-- Table structure for table `home_sections`
--

CREATE TABLE `home_sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `view` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `field` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `home_sections`
--

INSERT INTO `home_sections` (`id`, `method`, `name`, `value`, `view`, `field`, `parent_id`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, 'getSearchForm', 'Search Form Area', '{\"enable_form_area_customization\":\"1\",\"background_color\":\"#ffffff\",\"background_image\":\"app\\/logo\\/header-5fe63ce50e0f7.png\",\"height\":\"550px\",\"parallax\":\"1\",\"hide_form\":\"0\",\"form_border_color\":\"#001289\",\"form_border_width\":null,\"form_btn_background_color\":\"#001289\",\"form_btn_text_color\":\"#03989e\",\"hide_titles\":\"0\",\"title_en\":\"THE PLATFORM THAT CONNECTS EMPLOYERS WITH CANDIDATES\",\"sub_title_en\":\"HIRE TOP TALENTS FASTER + SMARTER\",\"big_title_color\":\"#03989e\",\"sub_title_color\":\"#000000\",\"active\":\"1\"}', 'home.inc.search', NULL, 0, 0, 0, 1, 1),
(2, 'getSponsoredPosts', 'Sponsored Ads', NULL, 'home.inc.featured', NULL, 0, 2, 3, 1, 1),
(3, 'getLatestPosts', 'Latest Ads', NULL, 'home.inc.latest', NULL, 0, 4, 5, 1, 1),
(4, 'getCategories', 'Categories', NULL, 'home.inc.categories', NULL, 0, 6, 7, 1, 1),
(5, 'getLocations', 'Locations & Country Map', NULL, 'home.inc.locations', NULL, 0, 8, 9, 1, 1),
(6, 'getFeaturedPostsCompanies', 'Companies', NULL, 'home.inc.companies', NULL, 0, 10, 11, 1, 1),
(7, 'getStats', 'Mini Stats', NULL, 'home.inc.stats', NULL, 0, 12, 13, 1, 1),
(8, 'getTopAdvertising', 'Advertising #1', '{\"active\":\"1\"}', 'layouts.inc.advertising.top', NULL, 0, 14, 15, 1, 0),
(9, 'getBottomAdvertising', 'Advertising #2', NULL, 'layouts.inc.advertising.bottom', NULL, 0, 16, 17, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `job_alerts`
--

CREATE TABLE `job_alerts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `period` enum('Daily','Weekly','Fortnightly','Monthly','Biannually','Annually','Never') NOT NULL,
  `url` text NOT NULL,
  `postedDate` int(11) DEFAULT NULL,
  `jobtypes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `maxSalary` int(11) DEFAULT NULL,
  `minSalary` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_alerts`
--

INSERT INTO `job_alerts` (`id`, `user_id`, `name`, `email`, `period`, `url`, `postedDate`, `jobtypes`, `maxSalary`, `minSalary`, `city_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 34, 'My Monthly Alert', 'dcsimen@gmail.com', 'Weekly', 'https://searchjobs.global/latest-jobs?distance=50&type[0]=1&type[1]=2&postedDate=31', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-29 10:58:54', '2020-12-29 10:58:54'),
(2, 2, 'Alert 1', 'johndoe@gmail.com', 'Weekly', 'https://searchjobs.global/latest-jobs?distance=50&postedDate=31&type[]=1&type[]=4', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-29 17:42:13', '2020-12-29 17:42:13'),
(3, 1, 'Partners', 'admin@mail.com', 'Daily', 'https://searchjobs.global/latest-jobs', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-29 17:56:17', '2020-12-29 17:56:17'),
(4, 2, 'home', 'johndoe@gmail.com', 'Daily', 'https://searchjobs.global/latest-jobs', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-29 17:58:14', '2020-12-29 17:58:14'),
(5, 2, 'My new monthly alert', 'johndoe@gmail.com', 'Monthly', 'https://searchjobs.global/latest-jobs?_token=2x24JOOBhgbqc5Wab3y2hXXCYh8QIAdMHkxYSQUN&distance=50&postedDate=31&type%5B0%5D=1&type%5B1%5D=4&l=1246321&minSalary=50&maxSalary=10000&name=My%20new%20monthly%20alert&email=johndoe%40gmail.com', 31, '[\"Full-time\",\"Contract\"]', 10000, 50, 1246321, NULL, '2020-12-30 08:41:52', '2020-12-30 08:41:52'),
(6, 2, 'home', 'johndoe@gmail.com', 'Daily', 'https://searchjobs.global/latest-jobs?name=home&email=johndoe%40gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-30 09:39:58', '2020-12-30 09:39:58'),
(7, 6, 'jhcvh', 'jobs.zrirecruitment@gmail.com', 'Daily', 'https://searchjobs.global/latest-jobs?name=jhcvh&email=jobs.zrirecruitment%40gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-30 11:04:21', '2020-12-30 11:04:21'),
(8, 1, 'rakutan', 'admin@mail.com', 'Daily', 'https://www.searchjobs.global/latest-jobs?distance=50&type%5B0%5D=2&name=rakutan&email=admin%40mail.com', NULL, '[\"Part-time\"]', NULL, NULL, NULL, NULL, '2021-01-26 08:54:28', '2021-01-26 08:54:28'),
(9, 1, 'rakutan', 'admin@mail.com', 'Daily', 'https://www.searchjobs.global/latest-jobs?distance=50&type%5B0%5D=2&postedDate=4&name=rakutan&email=admin%40mail.com', 4, '[\"Part-time\"]', NULL, NULL, NULL, NULL, '2021-01-26 08:55:43', '2021-01-26 08:55:43');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `abbr` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `native` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `script` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ltr',
  `russian_pluralization` tinyint(1) UNSIGNED DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `abbr`, `locale`, `name`, `native`, `flag`, `app_name`, `script`, `direction`, `russian_pluralization`, `active`, `default`, `parent_id`, `lft`, `rgt`, `depth`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'en', 'en_US', 'English', 'English', NULL, 'english', 'Latn', 'ltr', 0, 1, 1, 0, 0, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `id` int(11) NOT NULL,
  `my_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `with_who` varchar(100) DEFAULT NULL,
  `m_date` date DEFAULT NULL,
  `m_from` time NOT NULL,
  `m_to` time NOT NULL,
  `m_location` varchar(150) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `message` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meetings`
--

INSERT INTO `meetings` (`id`, `my_id`, `title`, `candidate_id`, `with_who`, `m_date`, `m_from`, `m_to`, `m_location`, `post_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 'Test Meeting', 2, 'Selene Gomez', '2021-01-26', '00:00:00', '00:00:00', NULL, NULL, NULL, '2020-11-30 19:37:11', '2021-01-26 16:04:50'),
(2, 1, 'Director meeting', 2, 'Directors', '2021-01-26', '00:00:00', '00:00:00', NULL, NULL, NULL, '2020-11-30 19:46:01', '2021-01-26 16:04:50'),
(3, 1, 'First Meeting', 2, 'Directors', '2021-01-12', '00:00:00', '00:00:00', 'trinco', 15, 'Please confirm your availability', '2020-12-31 19:28:38', '2021-01-26 16:04:13'),
(4, 1, 'First Meeting', 39, 'Directors', '2021-01-12', '00:00:00', '00:00:00', 'trinco', 15, 'Please confirm your availability', '2020-12-31 19:31:12', '2021-01-26 16:04:13'),
(5, 1, 'First Meeting', 39, 'Directors', '2021-01-12', '00:00:00', '00:00:00', 'trinco', 15, 'Please confirm your availability', '2020-12-31 19:35:35', '2021-01-26 16:04:14'),
(6, 38, 'Interview', 2, 'Directors', '2021-01-20', '14:24:00', '14:30:00', '4lb', 23, NULL, '2021-01-20 15:54:28', '2021-01-21 09:58:44'),
(7, 38, 'Interview2', 39, NULL, '2021-01-21', '14:26:00', '14:30:00', '4lb', 23, NULL, '2021-01-20 15:55:13', '2021-01-21 09:58:31');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT '0',
  `parent_id` bigint(20) UNSIGNED DEFAULT '0',
  `from_user_id` bigint(20) UNSIGNED DEFAULT '0',
  `from_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_user_id` bigint(20) UNSIGNED DEFAULT '0',
  `job_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  `filename` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) UNSIGNED DEFAULT '0',
  `is_approved` tinyint(4) NOT NULL DEFAULT '0',
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `post_id`, `parent_id`, `from_user_id`, `from_name`, `from_email`, `from_phone`, `to_user_id`, `job_title`, `to_name`, `to_email`, `to_phone`, `subject`, `message`, `filename`, `is_read`, `is_approved`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 0, 6, 'Zakib Rizan', 'jobs.zrirecruitment@gmail.com', '+94778941243', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'jnkjjjjj kkkkkkkkkkkkk kkkkkkkk<br><br>Related to the ad: <a href=\"https://job.remaxroyalproperty.com/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/6/eb8ea18258cb57c7556a47f65cb5dd1d.jpg', 1, 0, 1, '2020-11-29 12:31:04', '2020-12-15 20:23:52', NULL),
(2, 2, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'hi therelbhllllllllllllljhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh<br><br>Related to the ad: <a href=\"https://searchjob.remaxroyalproperty.com/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/2/1d57967aa0615aa02b0740c94b8c8d81.png', 1, 0, 1, '2020-12-03 05:05:01', '2020-12-15 20:23:47', NULL),
(3, 2, 0, 16, 'Smith', 'smith@email.com', '0778213452', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'zcxvc vzdsjhbczmxnc nzbvxc mZX C<br><br>Related to the ad: <a href=\"https://job.remaxroyalproperty.com/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/16/9944b88863d527de3b32640ddd0bb3b7.docx', 1, 0, 1, '2020-12-03 09:31:43', '2020-12-15 20:23:44', NULL),
(4, 11, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'DCCCCCCCCCC', 'segfsdergsgfsdrgfsdrfgsdrgsdrssgsgvsfvss<br><br>Related to the ad: <a href=\"https://job.remaxroyalproperty.com/dcccccccccc/11\">Click here to see</a>', 'resumes/lk/2/5bb1a8fc41575699018a0ed3a48c815f.png', 1, 0, 1, '2020-12-04 21:53:36', '2020-12-15 20:23:41', NULL),
(5, 2, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'hifbvdvbdgbcgbcbel.jgfnfjskgvnajfsnfnv.fsv.sfb..fvn fnxcvzfxvscxvsfxvvxdvbxvbxvx<br><br>Related to the ad: <a href=\"https://job.remaxroyalproperty.com/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 1, 0, 1, '2020-12-12 19:11:56', '2020-12-15 20:23:05', NULL),
(6, 2, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'khbdvh,sbvnasfbvfnbxfvnzxbv,nxz v,nx nvxnvx nx vnx vx nv,nxvvvxc<br><br>Related to the ad: <a href=\"https://job.remaxroyalproperty.com/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, 1, '2020-12-12 19:12:39', '2020-12-12 19:14:31', NULL),
(7, 2, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'Applying for the platform job<br><br>Related to the ad: <a href=\"https://job.remaxroyalproperty.com/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/2/5bb1a8fc41575699018a0ed3a48c815f.png', 0, 0, 1, '2020-12-16 01:19:59', '2020-12-16 07:23:13', NULL),
(8, 2, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'random message completing to makemessage lomg and eacceptable<br><br>Related to the ad: <a href=\"https://job.remaxroyalproperty.com/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 1, 1, NULL, '2020-12-16 01:32:08', '2020-12-16 12:40:51', NULL),
(9, 2, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'a long message for test. we need at least 50 characters<br><br>Related to the ad: <a href=\"https://job.remaxroyalproperty.com/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 1, NULL, '2020-12-16 01:32:57', '2020-12-16 12:46:54', NULL),
(10, 2, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'a oisnd njaspojfä aäojgfö adjg äpjogdpol cölnxnx ml<br><br>Related to the ad: <a href=\"https://job.remaxroyalproperty.com/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/2/5bb1a8fc41575699018a0ed3a48c815f.png', 0, 1, NULL, '2020-12-16 01:47:34', '2020-12-16 12:55:46', NULL),
(11, 2, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'a oisnd njaspojfä aäojgfö adjg äpjogdpol cölnxnx ml<br><br>Related to the ad: <a href=\"https://job.remaxroyalproperty.com/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/2/5bb1a8fc41575699018a0ed3a48c815f.png', 0, 0, NULL, '2020-12-16 01:51:22', '2020-12-16 01:51:22', NULL),
(12, 2, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'a oisnd njaspojfä aäojgfö adjg äpjogdpol cölnxnx ml<br><br>Related to the ad: <a href=\"https://job.remaxroyalproperty.com/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/2/5bb1a8fc41575699018a0ed3a48c815f.png', 0, 0, NULL, '2020-12-16 01:52:05', '2020-12-16 01:52:05', NULL),
(13, 2, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'a oisnd njaspojfä aäojgfö adjg äpjogdpol cölnxnx ml<br><br>Related to the ad: <a href=\"https://job.remaxroyalproperty.com/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/2/5bb1a8fc41575699018a0ed3a48c815f.png', 1, 0, NULL, '2020-12-16 01:52:59', '2020-12-25 00:44:52', NULL),
(14, 2, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'a oisnd njaspojfä aäojgfö adjg äpjogdpol cölnxnx ml<br><br>Related to the ad: <a href=\"https://job.remaxroyalproperty.com/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/2/5bb1a8fc41575699018a0ed3a48c815f.png', 1, 1, NULL, '2020-12-16 02:01:49', '2020-12-18 17:42:42', NULL),
(15, 2, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'bonaö oajfoija öfajofnaoö fijeffö doj<br><br>Related to the ad: <a href=\"https://job.remaxroyalproperty.com/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-16 02:07:13', '2020-12-16 02:07:13', NULL),
(16, 2, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'b öajf jo äpf o döyxäölv äjydpofdopk<br><br>Related to the ad: <a href=\"https://job.remaxroyalproperty.com/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-16 02:54:29', '2020-12-16 07:19:20', NULL),
(17, 2, 16, 1, 'John Doe', 'admin@mail.com', '0123456789', 2, NULL, 'John Doe', 'johndoe@gmail.com', '+94542100655', 'RE: The Platform That Connects Employers With Candidates', 'hi how are you\r\ncan we know more about yourself? \r\nwhy do you like to work for our company?\r\nwhat are you expert skills?\r\nhow do you think you are the perfect fit for this role?<br><br>Related to the ad: <a href=\"https://job.remaxroyalproperty.com/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', NULL, 0, 0, NULL, '2020-12-16 07:19:20', '2020-12-16 07:19:20', NULL),
(18, 2, 16, 1, 'John Doe', 'admin@mail.com', '0123456789', 2, NULL, 'John Doe', 'johndoe@gmail.com', '+94542100655', 'RE: The Platform That Connects Employers With Candidates', 'hi how are you\r\ncan we know more about yourself? \r\nwhy do you like to work for our company?\r\nwhat are you expert skills?\r\nhow do you think you are the perfect fit for this role?<br><br>Related to the ad: <a href=\"https://job.remaxroyalproperty.com/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', NULL, 0, 0, NULL, '2020-12-16 07:20:24', '2020-12-16 07:20:24', NULL),
(19, 2, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'lmbnmbm,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,<br><br>Related to the ad: <a href=\"https://job.remaxroyalproperty.com/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-16 07:21:05', '2020-12-16 07:21:05', NULL),
(20, 2, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh<br><br>Related to the ad: <a href=\"https://job.remaxroyalproperty.com/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/2/5bb1a8fc41575699018a0ed3a48c815f.png', 1, 1, NULL, '2020-12-16 07:22:06', '2020-12-19 11:37:11', NULL),
(21, 2, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'ggggggggggggggggggggggggggggggggggggggggg<br><br>Related to the ad: <a href=\"https://job.remaxroyalproperty.com/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 1, NULL, '2020-12-16 11:16:52', '2020-12-16 13:22:11', NULL),
(22, 2, 20, 1, 'John Doe', 'admin@mail.com', '0123456789', 2, NULL, 'John Doe', 'johndoe@gmail.com', '+94542100655', 'RE: The Platform That Connects Employers With Candidates', 'reply  sdö snsidskdllsnks ls-odof<br><br>Related to the ad: <a href=\"https://job.remaxroyalproperty.com/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', NULL, 0, 0, NULL, '2020-12-16 11:38:57', '2020-12-16 11:38:57', NULL),
(24, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 2, NULL, 'John Doe', 'johndoe@gmail.com', '+94542100655', 'New Connection request', ' Wants to connect with You', NULL, 1, 1, NULL, '2020-12-16 17:04:47', '2020-12-16 20:12:44', NULL),
(25, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 2, NULL, 'John Doe', 'johndoe@gmail.com', '+94542100655', 'New Connection request', ' Wants to connect with You', NULL, 1, 1, NULL, '2020-12-16 17:05:42', '2020-12-17 19:05:43', NULL),
(26, 2, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'hi i am interested in this job. please consider my application. looking forward to you reply as soon as possible<br><br>Related to the ad: <a href=\"https://searchjobs.global/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 1, NULL, '2020-12-17 19:07:54', '2020-12-18 14:19:40', NULL),
(27, 2, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'hi i am interested in this job. please consider my application. looking forward to you reply as soon as possible<br><br>Related to the ad: <a href=\"https://searchjobs.global/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 1, NULL, '2020-12-17 19:07:57', '2020-12-18 14:17:11', NULL),
(28, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 19, NULL, 'Malinda', 'wmdmalinda@gmail.com', '+94711631000', 'New Connection request', ' Wants to connect with You', NULL, 0, 0, 19, '2020-12-18 17:00:58', '2021-01-23 05:54:47', NULL),
(29, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 19, NULL, 'Malinda', 'wmdmalinda@gmail.com', '+94711631000', 'New Connection request', ' Wants to connect with You', NULL, 0, 0, 19, '2020-12-18 17:01:10', '2021-01-23 05:54:47', NULL),
(30, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 2, NULL, 'John Doe', 'johndoe@gmail.com', '+94542100655', 'New Connection request', ' Wants to connect with You', NULL, 0, 0, NULL, '2020-12-18 17:01:39', '2020-12-18 17:01:39', NULL),
(31, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 19, NULL, 'Malinda', 'wmdmalinda@gmail.com', '+94711631000', 'New Connection request', ' Wants to connect with You', NULL, 0, 1, 19, '2020-12-18 17:03:21', '2021-01-23 05:54:47', NULL),
(32, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 2, NULL, 'John Doe', 'johndoe@gmail.com', '+94542100655', 'New Connection request', ' Wants to connect with You', NULL, 1, 1, NULL, '2020-12-18 17:04:16', '2020-12-19 11:33:16', NULL),
(33, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 2, NULL, 'John Doe', 'johndoe@gmail.com', '+94542100655', 'New Connection request', ' Wants to connect with You', NULL, 1, 1, NULL, '2020-12-18 17:04:40', '2020-12-19 11:33:01', NULL),
(34, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 2, NULL, 'John Doe', 'johndoe@gmail.com', '+94542100655', 'New Connexion request', ' Wants to connect with You', NULL, 0, 1, NULL, '2020-12-19 11:38:15', '2020-12-30 14:54:35', NULL),
(35, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 2, NULL, 'John Doe', 'johndoe@gmail.com', '+94542100655', 'New Connexion request', ' Wants to connect with You', NULL, 0, 1, NULL, '2020-12-19 11:39:46', '2020-12-27 20:45:49', NULL),
(36, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 25, NULL, 'Didier', 'didier@test.com', '856985689', 'New Connexion request', ' Wants to connect with You', NULL, 0, 1, 25, '2020-12-19 11:47:53', '2021-01-23 05:54:38', NULL),
(37, 0, 0, 7, 'Zakib Rizan', 'zrirecruitment@gmail.com', '+94728941243', 6, NULL, 'Zakib Rizan', 'jobs.zrirecruitment@gmail.com', '+94778941243', 'New Connexion request', ' Wants to connect with You', NULL, 1, 1, NULL, '2020-12-20 20:06:07', '2021-01-19 14:27:45', NULL),
(38, 0, 0, 7, 'Zakib Rizan', 'zrirecruitment@gmail.com', '+94728941243', 6, NULL, 'Zakib Rizan', 'jobs.zrirecruitment@gmail.com', '+94778941243', 'New Connexion request', ' Wants to connect with You', NULL, 0, 1, NULL, '2020-12-20 20:07:50', '2020-12-20 20:10:24', NULL),
(39, 18, 0, 6, 'Zakib Rizan', 'jobs.zrirecruitment@gmail.com', '+94778941243', 7, NULL, 'Zakib Rizan', 'zrirecruitment@gmail.com', '+94728941243', 'Cdwvcw', 'l lk lk k b/jk jnkn knknjnk<br><br>Related to the ad: <a href=\"https://searchjobs.global/cdwvcw/18\">Click here to see</a>', 'resumes/lk/6/eb8ea18258cb57c7556a47f65cb5dd1d.jpg', 0, 1, NULL, '2020-12-21 12:58:57', '2020-12-21 13:14:53', NULL),
(40, 18, 0, 6, 'Zakib Rizan', 'jobs.zrirecruitment@gmail.com', '+94778941243', 7, NULL, 'Zakib Rizan', 'zrirecruitment@gmail.com', '+94728941243', 'Cdwvcw', 'm dl d dlmnvnefkv knkdvnwdvwdkvcwdvwvw<br><br>Related to the ad: <a href=\"https://searchjobs.global/cdwvcw/18\">Click here to see</a>', 'resumes/lk/6/eb8ea18258cb57c7556a47f65cb5dd1d.jpg', 1, 1, NULL, '2020-12-21 12:59:14', '2020-12-21 13:15:13', NULL),
(41, 0, 0, 7, 'Zakib Rizan', 'zrirecruitment@gmail.com', '+94728941243', 28, NULL, 'Jackshanan Vignarajah', 'jackshanan2017@gmail.com', '+94774176789', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, 28, '2020-12-23 18:13:01', '2021-01-04 17:43:44', NULL),
(42, 18, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 7, NULL, 'Zakib Rizan', 'zrirecruitment@gmail.com', '+94728941243', 'Cdwvcw', 'm nljnjnjnjnjkm,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,<br><br>Related to the ad: <a href=\"https://searchjobs.global/cdwvcw/18\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-23 23:42:49', '2020-12-23 23:42:49', NULL),
(43, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 28, NULL, 'Jackshanan Vignarajah', 'jackshanan2017@gmail.com', '+94774176789', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, 28, '2020-12-24 17:12:08', '2021-01-04 17:43:44', NULL),
(44, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 28, NULL, 'Jackshanan Vignarajah', 'jackshanan2017@gmail.com', '+94774176789', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, 28, '2020-12-25 10:55:49', '2021-01-04 17:43:44', NULL),
(45, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 25, NULL, 'Didier', 'didier@test.com', '856985689', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, 25, '2020-12-25 23:48:05', '2021-01-23 05:54:38', NULL),
(46, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 25, NULL, 'Didier', 'didier@test.com', '856985689', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, 25, '2020-12-25 23:49:19', '2021-01-23 05:54:38', NULL),
(47, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 25, NULL, 'Didier', 'didier@test.com', '856985689', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, 25, '2020-12-25 23:50:02', '2021-01-23 05:54:38', NULL),
(48, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 25, NULL, 'Didier', 'didier@test.com', '856985689', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, 25, '2020-12-26 00:01:08', '2021-01-23 05:54:38', NULL),
(49, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 19, NULL, 'Malinda', 'wmdmalinda@gmail.com', '+94711631000', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, 19, '2020-12-26 16:05:28', '2021-01-23 05:54:47', NULL),
(50, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 25, NULL, 'Didier', 'didier@test.com', '856985689', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, 25, '2020-12-26 19:15:54', '2021-01-23 05:54:38', NULL),
(51, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 28, NULL, 'Jackshanan Vignarajah', 'jackshanan2017@gmail.com', '+94774176789', 'New Connexion request', ' Wants to connect with You', NULL, 0, 1, 28, '2020-12-27 00:43:42', '2021-01-04 17:43:44', NULL),
(52, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 28, NULL, 'Jackshanan Vignarajah', 'jackshanan2017@gmail.com', '+94774176789', 'New Connexion request', ' Wants to connect with You', NULL, 0, 1, 28, '2020-12-27 00:52:42', '2021-01-04 17:43:44', NULL),
(53, 2, 0, 30, 'Thevanath Sivakumar', 'thevanathsivakumar@gmail.com', '2132656', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'gsogSIFHIPhsfipPSIFHps<br><br>Related to the ad: <a href=\"https://searchjobs.global/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/30/93899d8107b2b272e2ca212a15e7befb.pdf', 0, 0, NULL, '2020-12-27 18:12:17', '2020-12-27 18:12:17', NULL),
(54, 2, 0, 30, 'Thevanath Sivakumar', 'thevanathsivakumar@gmail.com', '2132656', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'gsogSIFHIPhsfipPSIFHps<br><br>Related to the ad: <a href=\"https://searchjobs.global/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/30/77e760504d724e64a1bd7f90287488e3.pdf', 1, 0, NULL, '2020-12-27 18:12:29', '2020-12-28 09:00:59', NULL),
(55, 2, 0, 30, 'Thevanath Sivakumar', 'thevanathsivakumar@gmail.com', '2132656', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'The Platform That Connects Employers With Candidates', 'jjbpp;n;kn;n;pihpihi[h[h[<br><br>Related to the ad: <a href=\"https://searchjobs.global/the-platform-that-connects-employers-with-candidates/2\">Click here to see</a>', 'resumes/lk/30/93899d8107b2b272e2ca212a15e7befb.pdf', 0, 0, NULL, '2020-12-27 18:12:55', '2020-12-27 18:12:55', NULL),
(56, 20, 0, 30, 'Thevanath Sivakumar', 'thevanathsivakumar@gmail.com', '2132656', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Test job', 'i would like to apply for this position.  please consider my application<br><br>Related to the ad: <a href=\"https://searchjobs.global/test-job/20\">Click here to see</a>', 'resumes/lk/30/77e760504d724e64a1bd7f90287488e3.pdf', 0, 0, NULL, '2020-12-27 18:47:40', '2020-12-27 18:47:40', NULL),
(57, 18, 0, 30, 'Thevanath Sivakumar', 'thevanathsivakumar@gmail.com', '2132656', 7, NULL, 'Zakib Rizan', 'zrirecruitment@gmail.com', '+94728941243', 'Cdwvcw', 'uagdflhaihoidhgodh [9ugqduf 9]]0fqh0eh 08qgt08e t0q eg0\r\ne\r\ng0qeghe-8qe -t- - q-e8\r\ny h-9<br><br>Related to the ad: <a href=\"https://searchjobs.global/cdwvcw/18\">Click here to see</a>', 'resumes/lk/30/77e760504d724e64a1bd7f90287488e3.pdf', 0, 1, NULL, '2020-12-27 18:49:58', '2020-12-29 10:56:11', NULL),
(58, 19, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', 'bnbvnmbnmnn nmhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhjhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh<br><br>Related to the ad: <a href=\"https://searchjobs.global/pearlinngreen/19\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-27 19:03:12', '2020-12-27 19:03:12', NULL),
(59, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 14, NULL, 'GAYATHRI', 'gayathri@adage.lk', '+94777816191', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, NULL, '2020-12-27 20:41:28', '2020-12-27 20:41:28', NULL),
(60, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 17, NULL, 'Shaaz', 'shafrazmohamed444@gmail.com', '+94778212117', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, NULL, '2020-12-27 21:20:29', '2020-12-27 21:20:29', NULL),
(61, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 30, 'DCCCCCCCCCC', 'Thevanath Sivakumar', 'thevanathsivakumar@gmail.com', '2132656', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, NULL, '2020-12-28 08:07:17', '2020-12-28 08:07:17', NULL),
(62, 20, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 30, 'Interior Designer Needed', 'Thevanath Sivakumar', 'thevanathsivakumar@gmail.com', '2132656', 'New Connexion request', ' Wants to connect with You', NULL, 0, 1, NULL, '2020-12-28 08:15:45', '2020-12-28 08:15:45', NULL),
(63, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 30, 'Pearlinngreen', 'Thevanath Sivakumar', 'thevanathsivakumar@gmail.com', '2132656', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, NULL, '2020-12-28 08:28:50', '2020-12-28 08:28:50', NULL),
(64, 19, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 30, NULL, 'Thevanath Sivakumar', 'thevanathsivakumar@gmail.com', '2132656', 'New Connexion request', ' Wants to connect with You', NULL, 0, 1, NULL, '2020-12-28 09:00:15', '2020-12-28 09:02:18', NULL),
(65, 15, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 30, NULL, 'Thevanath Sivakumar', 'thevanathsivakumar@gmail.com', '2132656', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, NULL, '2020-12-28 09:04:36', '2020-12-28 09:04:36', NULL),
(66, 10, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 30, 'Sdaaaaaaaaa', 'Thevanath Sivakumar', 'thevanathsivakumar@gmail.com', '2132656', 'New Connexion request', ' Wants to connect with You', NULL, 0, 1, NULL, '2020-12-28 09:08:35', '2020-12-28 09:09:06', NULL),
(67, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 33, NULL, 'Didier S', 'dcsimen@gmail.com', '+237697007079', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, NULL, '2020-12-29 00:48:26', '2020-12-29 00:48:26', NULL),
(68, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/5bb1a8fc41575699018a0ed3a48c815f.png', 0, 0, NULL, '2020-12-29 01:10:31', '2020-12-29 01:10:31', NULL),
(69, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 33, NULL, 'Didier S', 'dcsimen@gmail.com', '+237697007079', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, NULL, '2020-12-29 01:49:38', '2020-12-29 01:49:38', NULL),
(70, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 33, NULL, 'Didier S', 'dcsimen@gmail.com', '+237697007079', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, NULL, '2020-12-29 01:49:44', '2020-12-29 01:49:44', NULL),
(71, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 33, NULL, 'Didier S', 'dcsimen@gmail.com', '+237697007079', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, NULL, '2020-12-29 01:56:10', '2020-12-29 01:56:10', NULL),
(72, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 07:23:36', '2020-12-29 07:23:36', NULL),
(73, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 07:25:02', '2020-12-29 07:25:02', NULL),
(74, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 07:36:29', '2020-12-29 07:36:29', NULL),
(75, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 07:43:13', '2020-12-29 07:43:13', NULL),
(76, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 07:44:20', '2020-12-29 07:44:20', NULL),
(77, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 07:49:26', '2020-12-29 07:49:26', NULL),
(78, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 07:50:11', '2020-12-29 07:50:11', NULL),
(79, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 07:51:34', '2020-12-29 07:51:34', NULL),
(80, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 07:52:51', '2020-12-29 07:52:51', NULL),
(81, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 07:55:06', '2020-12-29 07:55:06', NULL),
(82, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 07:56:01', '2020-12-29 07:56:01', NULL),
(83, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 07:59:12', '2020-12-29 07:59:12', NULL),
(84, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:01:15', '2020-12-29 08:01:15', NULL),
(85, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:03:05', '2020-12-29 08:03:05', NULL),
(86, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:03:35', '2020-12-29 08:03:35', NULL),
(87, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:04:45', '2020-12-29 08:04:45', NULL),
(88, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:06:12', '2020-12-29 08:06:12', NULL),
(89, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:06:49', '2020-12-29 08:06:49', NULL),
(90, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:08:53', '2020-12-29 08:08:53', NULL),
(91, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:10:13', '2020-12-29 08:10:13', NULL),
(92, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:11:57', '2020-12-29 08:11:57', NULL),
(93, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:13:10', '2020-12-29 08:13:10', NULL),
(94, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:13:57', '2020-12-29 08:13:57', NULL),
(95, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:15:31', '2020-12-29 08:15:31', NULL),
(96, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:18:08', '2020-12-29 08:18:08', NULL),
(97, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/5bb1a8fc41575699018a0ed3a48c815f.png', 0, 0, NULL, '2020-12-29 08:18:38', '2020-12-29 08:18:38', NULL),
(98, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:20:56', '2020-12-29 08:20:56', NULL),
(99, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:21:44', '2020-12-29 08:21:44', NULL),
(100, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:23:05', '2020-12-29 08:23:05', NULL),
(101, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/5bb1a8fc41575699018a0ed3a48c815f.png', 0, 0, NULL, '2020-12-29 08:25:16', '2020-12-29 08:25:16', NULL),
(102, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:25:46', '2020-12-29 08:25:46', NULL),
(103, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:26:39', '2020-12-29 08:26:39', NULL),
(104, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:28:50', '2020-12-29 08:28:50', NULL),
(105, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:29:32', '2020-12-29 08:29:32', NULL),
(106, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:30:27', '2020-12-29 08:30:27', NULL),
(107, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:31:12', '2020-12-29 08:31:12', NULL),
(108, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:32:15', '2020-12-29 08:32:15', NULL),
(109, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:32:29', '2020-12-29 08:32:29', NULL),
(110, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:33:00', '2020-12-29 08:33:00', NULL),
(111, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:34:57', '2020-12-29 08:34:57', NULL),
(112, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:37:33', '2020-12-29 08:37:33', NULL),
(113, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:43:13', '2020-12-29 08:43:13', NULL),
(114, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:44:20', '2020-12-29 08:44:20', NULL),
(115, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:46:16', '2020-12-29 08:46:16', NULL),
(116, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:47:22', '2020-12-29 08:47:22', NULL),
(117, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:48:38', '2020-12-29 08:48:38', NULL),
(118, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:49:38', '2020-12-29 08:49:38', NULL),
(119, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:52:54', '2020-12-29 08:52:54', NULL),
(120, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:56:04', '2020-12-29 08:56:04', NULL),
(121, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:56:24', '2020-12-29 08:56:24', NULL),
(122, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:57:50', '2020-12-29 08:57:50', NULL),
(123, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 08:59:21', '2020-12-29 08:59:21', NULL),
(124, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 09:04:27', '2020-12-29 09:04:27', NULL),
(125, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 09:05:17', '2020-12-29 09:05:17', NULL),
(126, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 09:08:15', '2020-12-29 09:08:15', NULL),
(127, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 09:11:25', '2020-12-29 09:11:25', NULL),
(128, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 09:11:57', '2020-12-29 09:11:57', NULL),
(129, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 09:12:58', '2020-12-29 09:12:58', NULL),
(130, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 09:14:20', '2020-12-29 09:14:20', NULL),
(131, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 09:14:40', '2020-12-29 09:14:40', NULL),
(132, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 09:29:40', '2020-12-29 09:29:40', NULL),
(133, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 09:30:52', '2020-12-29 09:30:52', NULL),
(134, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 09:31:47', '2020-12-29 09:31:47', NULL),
(135, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/5bb1a8fc41575699018a0ed3a48c815f.png', 0, 0, NULL, '2020-12-29 09:32:51', '2020-12-29 09:32:51', NULL),
(136, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 09:33:54', '2020-12-29 09:33:54', NULL),
(137, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 09:34:50', '2020-12-29 09:34:50', NULL);
INSERT INTO `messages` (`id`, `post_id`, `parent_id`, `from_user_id`, `from_name`, `from_email`, `from_phone`, `to_user_id`, `job_title`, `to_name`, `to_email`, `to_phone`, `subject`, `message`, `filename`, `is_read`, `is_approved`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(138, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 09:41:22', '2020-12-29 09:41:22', NULL),
(139, 22, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Pearlinngreen', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/pearlinngreen/22\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 09:47:42', '2020-12-29 09:47:42', NULL),
(140, 0, 0, 7, 'Zakib Rizan', 'zrirecruitment@gmail.com', '+94728941243', 6, NULL, 'Zakib Rizan', 'jobs.zrirecruitment@gmail.com', '+94778941243', 'New Connexion request', ' Wants to connect with You', NULL, 1, 0, NULL, '2020-12-29 10:45:54', '2020-12-29 11:05:12', NULL),
(141, 18, 0, 6, 'Zakib Rizan', 'jobs.zrirecruitment@gmail.com', '+94778941243', 7, NULL, 'Zakib Rizan', 'zrirecruitment@gmail.com', '+94728941243', 'Cdwvcw', '<br><br>Related to the ad: <a href=\"https://searchjobs.global/cdwvcw/18\">Click here to see</a>', 'resumes/lk/6/eb8ea18258cb57c7556a47f65cb5dd1d.jpg', 0, 0, NULL, '2020-12-29 11:02:51', '2020-12-29 11:02:51', NULL),
(142, 21, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Studio for two', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/studio-for-two/21\">Click here to see</a>', 'resumes/lk/2/7e906398325020e7f3fa74aea06a864c.png', 0, 0, NULL, '2020-12-29 15:21:12', '2020-12-29 15:21:12', NULL),
(143, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 34, NULL, 'Didier Cedrid SIMEN', 'dcsimen@gmail.com', '+237697007079', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, 34, '2020-12-29 21:22:17', '2020-12-29 23:28:12', NULL),
(144, 0, 0, 31, 'Xcelron', 'jackshanan95@gmail.com', '+94772502545', 32, NULL, 'Khushal', 'khushalasdeo@gmail.com', '931427084', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, 32, '2020-12-29 23:39:29', '2021-01-04 17:43:06', NULL),
(145, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 32, NULL, 'Khushal', 'khushalasdeo@gmail.com', '931427084', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, 32, '2020-12-29 23:43:18', '2021-01-04 17:43:06', NULL),
(146, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 6, NULL, 'Zakib Rizan', 'jobs.zrirecruitment@gmail.com', '+94778941243', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, NULL, '2020-12-30 14:53:15', '2020-12-30 14:53:15', NULL),
(147, 0, 0, 7, 'Zakib Rizan', 'zrirecruitment@gmail.com', '+94728941243', 6, NULL, 'Zakib Rizan', 'jobs.zrirecruitment@gmail.com', '+94778941243', 'New Connexion request', ' Wants to connect with You', NULL, 0, 1, NULL, '2020-12-30 15:43:46', '2021-01-19 14:24:06', NULL),
(148, 21, 0, 39, 'Shaaz2', 'shaaz2@shaaz2.com', '+94776512341', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'UI/UX Engineer', '<br><br>Related to the ad: <a href=\"https://searchjobs.global/ui-ux-engineer/21\">Click here to see</a>', 'resumes/lk/39/652ca1bb5cae6da356d4054dcf1ad37b.pdf', 0, 0, NULL, '2021-01-20 15:45:36', '2021-01-20 15:45:36', NULL),
(149, 30, 0, 39, 'Shaaz2', 'shaaz2@shaaz2.com', '+94776512341', 1, NULL, 'John Doe', 'admin@mail.com', '0123456789', 'Delivery Riders - Colombo', '<br><br>Related to the ad: <a href=\"https://searchjobs.global/delivery-riders-colombo/30\">Click here to see</a>', 'resumes/lk/39/652ca1bb5cae6da356d4054dcf1ad37b.pdf', 1, 1, NULL, '2021-01-20 15:49:30', '2021-01-20 15:50:05', NULL),
(150, 23, 0, 39, 'Shaaz2', 'shaaz2@shaaz2.com', '+94776512341', 38, NULL, 'Shaaz', 'shaaz@shaaz.com', '+94776512342', 'Operations & Marketing Intern', '<br><br>Related to the ad: <a href=\"https://searchjobs.global/operations-marketing-intern/23\">Click here to see</a>', 'resumes/lk/39/652ca1bb5cae6da356d4054dcf1ad37b.pdf', 1, 1, NULL, '2021-01-20 15:53:07', '2021-01-20 15:53:31', NULL),
(151, 31, 0, 0, 'Joe Smith', 'joesmith@example.com', '0776512342', 0, NULL, 'Joe', 'joesmith@example.com', '', 'Engineer', '<br><br>Related to the ad: <a href=\"https://searchjobs.global/engineer/31\">Click here to see</a>', 'files/lk/31/applications/c553430290d46325cd49d65b629f4f37.pdf', 0, 0, NULL, '2021-01-20 16:26:17', '2021-01-20 16:26:17', NULL),
(152, 31, 0, 39, 'Shaaz2', 'shaaz2@shaaz2.com', '+94776512341', 0, NULL, 'Joe', 'joesmith@example.com', '', 'Engineer', '<br><br>Related to the ad: <a href=\"https://searchjobs.global/engineer/31\">Click here to see</a>', 'resumes/lk/39/652ca1bb5cae6da356d4054dcf1ad37b.pdf', 0, 0, NULL, '2021-01-20 16:55:42', '2021-01-20 16:55:42', NULL),
(153, 31, 0, 0, 'Joe Smith', 'shafrazmohamed444@gmail.com', '0778212117', 0, NULL, 'Joe', 'shafrazmohamed444@gmail.com', '', 'Engineer', '<br><br>Related to the ad: <a href=\"https://www.searchjobs.global/engineer/31\">Click here to see</a>', 'files/lk/31/applications/781e0a39ecf5ce072cf7e6385514297b.pdf', 0, 0, NULL, '2021-01-20 17:01:55', '2021-01-20 17:01:55', NULL),
(154, 40, 0, 6, 'Zakib Rizan', 'jobs.zrirecruitment@gmail.com', '+94778941243', 7, NULL, 'Zakib Rizan', 'zrirecruitment@gmail.com', '+94728941243', 'Intern- Marketing', '<br><br>Related to the ad: <a href=\"https://searchjobs.global/intern-marketing/40\">Click here to see</a>', 'resumes/lk/6/eb8ea18258cb57c7556a47f65cb5dd1d.jpg', 1, 1, NULL, '2021-01-23 18:21:13', '2021-01-23 18:50:40', NULL),
(155, 0, 0, 7, 'Zakib Rizan', 'zrirecruitment@gmail.com', '+94728941243', 39, NULL, 'Shaaz2', 'shaaz2@shaaz2.com', '+94776512341', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, NULL, '2021-01-23 19:02:43', '2021-01-23 19:02:43', NULL),
(156, 0, 0, 7, 'Zakib Rizan', 'zrirecruitment@gmail.com', '+94728941243', 39, NULL, 'Shaaz2', 'shaaz2@shaaz2.com', '+94776512341', 'New Connexion request', ' Wants to connect with You', NULL, 0, 0, NULL, '2021-01-23 19:06:52', '2021-01-23 19:06:52', NULL),
(157, 39, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 38, NULL, 'Shaaz', 'shaaz@shaaz.com', '+94776512342', 'JOB123', '<br><br>Related to the ad: <a href=\"https://searchjobs.global/job123/39\">Click here to see</a>', 'resumes/lk/2/0c979b4d65ba11b586d3a9d988503e2f.pdf', 0, 0, NULL, '2021-01-26 00:35:43', '2021-01-26 00:35:43', NULL),
(158, 39, 0, 2, 'John Doe', 'johndoe@gmail.com', '+94542100655', 38, NULL, 'Shaaz', 'shaaz@shaaz.com', '+94776512342', 'JOB123', '<br><br>Related to the ad: <a href=\"https://searchjobs.global/job123/39\">Click here to see</a>', 'resumes/lk/2/0c979b4d65ba11b586d3a9d988503e2f.pdf', 0, 0, NULL, '2021-01-26 00:36:01', '2021-01-26 00:36:01', NULL),
(159, 0, 0, 1, 'John Doe', 'admin@mail.com', '0123456789', 37, NULL, 'Joe Smith', 'joesmith@example.com', '', 'New Connexion request', 'John Wants to connect with You', NULL, 0, 0, NULL, '2021-01-26 16:17:32', '2021-01-26 16:17:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `meta_tags`
--

CREATE TABLE `meta_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `translation_of` int(10) UNSIGNED NOT NULL,
  `page` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meta_tags`
--

INSERT INTO `meta_tags` (`id`, `translation_lang`, `translation_of`, `page`, `title`, `description`, `keywords`, `active`) VALUES
(1, 'en', 1, 'home', '{app_name} - The Platform That Connects Employers With Candidates', 'Welcome to {app_name} : 100% Job Board. Find a job near you. Simple, fast and efficient - {country}', '{app_name}, {country}, jobs ads, jobs, ads, script, app, premium jobs', 1),
(2, 'en', 2, 'register', 'Sign Up - {app_name}', 'Sign Up on {app_name}', '{app_name}, {country}, jobs ads, jobs, ads, script, app, premium jobs', 1),
(3, 'en', 3, 'login', 'Login - {app_name}', 'Log in to {app_name}', '{app_name}, {country}, jobs ads, jobs, ads, script, app, premium jobs', 1),
(4, 'en', 4, 'create', 'Post a Job', 'Post a Job - {country}.', '{app_name}, {country}, jobs ads, jobs, ads, script, app, premium jobs', 1),
(5, 'en', 5, 'countries', 'Jobs in the World', 'Welcome to {app_name} : 100% Job Board. Find a job near you. Simple, fast and efficient.', '{app_name}, {country}, jobs ads, jobs, ads, script, app, premium jobs', 1),
(6, 'en', 6, 'contact', 'Contact Us - {app_name}', 'Contact Us - {app_name}', '{app_name}, {country}, jobs ads, jobs, ads, script, app, premium jobs', 1),
(7, 'en', 7, 'sitemap', 'Sitemap {app_name} - {country}', 'Sitemap {app_name} - {country}. Job Bord.', '{app_name}, {country}, jobs ads, jobs, ads, script, app, premium jobs', 1),
(8, 'en', 8, 'password', 'Lost your password? - {app_name}', 'Lost your password? - {app_name}', '{app_name}, {country}, jobs ads, jobs, ads, script, app, premium jobs', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_id`, `model_type`) VALUES
(1, 38, 'App\\Models\\User'),
(2, 38, 'App\\Models\\User'),
(3, 38, 'App\\Models\\User'),
(4, 38, 'App\\Models\\User'),
(5, 38, 'App\\Models\\User'),
(6, 38, 'App\\Models\\User'),
(7, 38, 'App\\Models\\User'),
(8, 38, 'App\\Models\\User'),
(9, 2, 'App\\Models\\User'),
(9, 38, 'App\\Models\\User');

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_id`, `model_type`) VALUES
(1, 1, 'App\\Models\\User');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'In country language',
  `short_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'In country language',
  `ribbon` enum('red','orange','green') COLLATE utf8_unicode_ci DEFAULT NULL,
  `has_badge` tinyint(1) UNSIGNED DEFAULT '0',
  `price` decimal(10,2) UNSIGNED DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` int(10) UNSIGNED DEFAULT '30' COMMENT 'In days',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'In country language',
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `translation_lang`, `translation_of`, `name`, `short_name`, `ribbon`, `has_badge`, `price`, `currency_code`, `duration`, `description`, `parent_id`, `lft`, `rgt`, `depth`, `active`, `created_at`, `updated_at`) VALUES
(4, 'en', 4, 'Free Trial', 'Free Trial', 'green', 0, 0.00, 'LKR', 120, 'Job Posts Unlimited with 4 months Duration', 0, 8, 9, 1, 1, '2021-01-14 16:29:52', '2021-01-15 08:19:20'),
(5, 'en', 5, 'Bronze', 'Bronze', 'green', 0, 1200.00, 'LKR', 30, 'Job Posts Unlimited with 12 months Duration', 0, 10, 11, 1, 1, '2021-01-14 16:43:03', '2021-01-15 08:19:26'),
(6, 'en', 6, 'Silver', 'Silver', 'orange', 0, 2000.00, 'LKR', 30, 'Job Posts Unlimited with 12 months Duration and 15 Connects', 0, 12, 13, 1, 0, '2021-01-14 16:45:39', '2021-01-15 08:18:35'),
(7, 'en', 7, 'Gold', 'Gold', 'orange', 0, 5000.00, 'LKR', 30, 'Job Posts Unlimited with 12 months Duration and 50 Connects', 0, 14, 15, 1, 0, '2021-01-14 16:47:12', '2021-01-15 08:18:38'),
(8, 'en', 8, 'Platinum', 'Platinum', 'red', 0, 15000.00, 'LKR', 30, 'Job Posts Unlimited with 12 months Duration and Unlimited Connects', 0, 16, 17, 1, 1, '2021-01-14 16:49:06', '2021-01-15 08:19:31');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('standard','terms','privacy','tips') COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `external_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `name_color` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_color` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_blank` tinyint(1) UNSIGNED DEFAULT '0',
  `excluded_from_footer` tinyint(1) UNSIGNED DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `translation_lang`, `translation_of`, `parent_id`, `type`, `name`, `slug`, `title`, `picture`, `content`, `external_link`, `lft`, `rgt`, `depth`, `name_color`, `title_color`, `target_blank`, `excluded_from_footer`, `active`, `created_at`, `updated_at`) VALUES
(1, 'en', 1, 0, 'terms', 'Terms', 'terms', 'Terms & Conditions', NULL, '<h4><b>Definitions</b></h4><p>Each of the terms mentioned below have in these Conditions of Sale JobClass Service (hereinafter the \"Conditions\") the following meanings:</p><ol><li>Announcement&nbsp;: refers to all the elements and data (visual, textual, sound, photographs, drawings), presented by an Advertiser editorial under his sole responsibility, in order to buy, rent or sell a product or service and broadcast on the Website and Mobile Site.</li><li>Advertiser&nbsp;: means any natural or legal person, a major, established in France, holds an account and having submitted an announcement, from it, on the Website. Any Advertiser must be connected to the Personal Account for deposit and or manage its ads. Ad first deposit automatically entails the establishment of a Personal Account to the Advertiser.</li><li>Personal Account&nbsp;: refers to the free space than any Advertiser must create and which it should connect from the Website to disseminate, manage and view its ads.</li><li>JobClass&nbsp;: means the company that publishes and operates the Website and Mobile Site {YourCompany}, registered at the Trade and Companies Register of Cotonou under the number {YourCompany Registration Number} whose registered office is at {YourCompany Address}.</li><li>Customer Service&nbsp;: JobClass means the department to which the Advertiser may obtain further information. This service can be contacted via email by clicking the link on the Website and Mobile Site.</li><li>JobClass Service&nbsp;: JobClass means the services made available to Users and Advertisers on the Website and Mobile Site.</li><li>Website&nbsp;: means the website operated by JobClass accessed mainly from the URL <a href=\"http://www.bedigit.com\">http://www.bedigit.com</a> and allowing Users and Advertisers to access the Service via internet JobClass.</li><li>Mobile Site&nbsp;: is the mobile site operated by JobClass accessible from the URL <a href=\"http://www.bedigit.com\">http://www.bedigit.com</a> and allowing Users and Advertisers to access via their mobile phone service {YourSiteName}.</li><li>User&nbsp;: any visitor with access to JobClass Service via the Website and Mobile Site and Consultant Service JobClass accessible from different media.</li></ol><h4><b>Subject</b></h4><p>These Terms and Conditions Of Use establish the contractual conditions applicable to any subscription by an Advertiser connected to its Personal Account from the Website and Mobile Site.<br></p><h4><b>Acceptance</b></h4><p>Any use of the website by an Advertiser is full acceptance of the current Terms.<br></p><h4><b>Responsibility</b></h4><p>Responsibility for JobClass can not be held liable for non-performance or improper performance of due control, either because of the Advertiser, or a case of major force.<br></p><h4><b>Modification of these terms</b></h4><p>JobClass reserves the right, at any time, to modify all or part of the Terms and Conditions.</p><p>Advertisers are advised to consult the Terms to be aware of the changes.</p><h4><b>Miscellaneous</b></h4><p>If part of the Terms should be illegal, invalid or unenforceable for any reason whatsoever, the provisions in question would be deemed unwritten, without questioning the validity of the remaining provisions will continue to apply between Advertisers and JobClass.</p><p>Any complaints should be addressed to Customer Service JobClass.</p>', NULL, 6, 7, 1, NULL, NULL, 0, 0, 1, '2017-02-10 11:10:40', '2017-02-13 15:22:30'),
(2, 'en', 2, 0, 'privacy', 'Privacy', 'privacy', 'Privacy', NULL, '<p>Your privacy is an important part of our relationship with you. Protecting your privacy is only part of our mission to provide a secure web environment. When using our site, including our services, your information will remain strictly confidential. Contributions made on our blog or on our forum are open to public view; so please do not post any personal information in your dealings with others. We accept no liability for those actions because it is your sole responsibility to adequate and safe post content on our site. We will not share, rent or share your information with third parties.</p><p>When you visit our site, we collect technical information about your computer and how you access our website and analyze this information such as Internet Protocol (IP) address of your computer, the operating system used by your computer, the browser (eg, Chrome, Firefox, Internet Explorer or other) your computer uses, the name of your Internet service provider (ISP), the Uniform Resource Locator (URL) of the website from which you come and the URL to which you go next and certain operating metrics such as the number of times you use our website. This general information can be used to help us better understand how our site is viewed and used. We may share this general information about our site with our business partners or the general public. For example, we may share the information on the number of daily unique visitors to our site with potential corporate partners or use them for advertising purposes. This information does contain any of your personal data that can be used to contact you or identify you.</p><p>When we place links or banners to other sites of our website, please note that we do not control this kind of content or practices or privacy policies of those sites. We do not endorse or assume no responsibility for the privacy policies or information collection practices of any other website other than managed sites JobClass.</p><p>We use the highest security standard available to protect your identifiable information in transit to us. All data stored on our servers are protected by a secure firewall for the unauthorized use or activity can not take place. Although we make every effort to protect your personal information against loss, misuse or alteration by third parties, you should be aware that there is always a risk that low-intentioned manage to find a way to thwart our security system or that Internet transmissions could be intercepted.</p><p>We reserve the right, without notice, to change, modify, add or remove portions of our Privacy Policy at any time and from time to time. These changes will be posted publicly on our website. When you visit our website, you accept all the terms of our privacy policy. Your continued use of this website constitutes your continued agreement to these terms. If you do not agree with the terms of our privacy policy, you should cease using our website.</p>', NULL, 8, 9, 1, NULL, NULL, 0, 0, 1, '2017-02-10 11:28:37', '2017-02-12 20:24:52'),
(3, 'en', 3, 0, 'standard', 'Anti-Scam', 'anti-scam', 'Anti-Scam', NULL, '<p><b>Protect yourself against Internet fraud!</b></p><p>The vast majority of ads are posted by honest people and trust. So you can do excellent business. Despite this, it is important to follow a few common sense rules following to prevent any attempt to scam.</p><p><b>Our advices</b></p><ul><li>Doing business with people you can meet in person.</li><li>Never send money by Western Union, MoneyGram or other anonymous payment systems.</li><li>Never send money or products abroad.</li><li>Do not accept checks.</li><li>Ask about the person you\'re dealing with another confirming source name, address and telephone number.</li><li>Keep copies of all correspondence (emails, ads, letters, etc.) and details of the person.</li><li>If a deal seems too good to be true, there is every chance that this is the case. Refrain.</li></ul><p><b>Recognize attempted scam</b></p><ul><li>The majority of scams have one or more of these characteristics:</li><li>The person is abroad or traveling abroad.</li><li>The person refuses to meet you in person.</li><li>Payment is made through Western Union, Money Gram or check.</li><li>The messages are in broken language (English or French or ...).</li><li>The texts seem to be copied and pasted.</li><li>The deal seems to be too good to be true.</li></ul>', NULL, 4, 5, 1, NULL, NULL, 0, 0, 0, '2017-02-10 11:31:56', '2020-11-21 23:44:44'),
(4, 'en', 4, 0, 'standard', 'FAQ', 'faq', 'Frequently Asked Questions', NULL, '<table style=\"border: 1px solid white;\"> \r\n      <tr style=\"table-layout: fixed;width: 100%; border: 1px solid white;\" >\r\n        <td style=\"width: 50%; column-width: 50%\" >\r\n          <img style=\"display:block; padding-left: 1rem; padding-right: 1rem;\"    src=\"https://serving.photos.photobox.com/410585384ad762e6e7f65a0587aa794badcab2de4d2a51794aee5b1401b06cc599577c72.jpg\">\r\n        </td>\r\n        <td style=\"width: 50%; column-width: 50%\" >    \r\n          <img style=\"display:block; padding-left: 1rem; padding-right: 1rem;\"   src=\"https://serving.photos.photobox.com/40528478d307d69a43fe7e3c9935d51372b310d21129207f3adf03e48ea48d106559e545.jpg\"/>\r\n        </td>\r\n      </tr>\r\n    </table>', NULL, 2, 3, 1, NULL, NULL, 0, 0, 1, '2017-02-10 11:34:56', '2017-02-14 05:23:52'),
(5, 'en', 5, NULL, 'standard', 'About Us', 'about-us', 'About Search Jobs', NULL, '<p>We are one of Sri Lanka’s leading online employment marketplaces.</p><p>Helping facilitate the matching and communication of job opportunities between candidates and employers in Sri Lanka and around the world.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, '2020-11-15 05:46:57', '2020-12-27 16:55:12'),
(6, 'en', 6, NULL, 'standard', 'Career', 'career', 'Career - Search Jobs', NULL, '<p>Are you looking for a job? Here’s how you should organize yourself through the hundreds of available opportunities to find the one that’s right for you.</p><p>Your resume is perfect. It’s keyword-optimized, industry-specified, full of achievements, backed by data, and double-checked by an expert. (If it’s none of these things, contact us get a free resume evaluation today!)</p><p>But with more than hundreds of jobs on Search Jobs, do you know where to begin? Follow the 6 steps tips below to help you find the best job better, faster and smarter.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, '2020-11-21 23:53:04', '2020-11-21 23:53:04'),
(7, 'en', 7, NULL, 'standard', 'Blog', 'blog', 'Tips on how to start looking for a new job', 'app/page/0ffc8e0c438c2ea9239e473875dad78c.jpeg', '<p><b>Are you looking for a job? Here’s how you should organize yourself through the hundreds of available opportunities to find the one that’s right for you.</b></p><p>Your resume is perfect. It’s keyword-optimized, industry-specified, full of achievements, backed by data, and double-checked by an expert. (If it’s none of these things, contact us get a free resume evaluation today!)</p><p>But with more than hundreds of jobs on Search Jobs, do you know where to begin? Follow the 6 steps tips below to help you find the best job better, faster and smarter.</p><h2><strong>1. Make sure your resume is complete<br></strong></h2><p>Your resume is one of the key factors to kicking off a strong job search. Not sure how yours stand? Get a free resume evaluation today from the experts at&nbsp;<a href=\"https://www.monster.com/resumes/post-resume2\" target=\"_blank\">Search Jobs</a>. You’ll get detailed feedback in two business days, including a review of your resume’s appearance and content, and a prediction of a recruiter’s first impression. (Insider tip: Make sure your resume is complete and is with genuine information.)</p><h2><strong>2. Let the employers find you</strong></h2><p>This one is a no-brainer:&nbsp;<a href=\"https://member.monster.com/\">Signing up for an account on Search Jobs</a>&nbsp;is the quickest way to turn that shiny new resume of yours into interviews.</p><p>When you register for an account in Search Jobs, you’ll be able to upload your resume and make it accessible to employers who use our site to find candidates for hard-to-fill positions. (Insider tip: Setting your resume to “visible” will allow the employers to see everything you’ve uploaded, including contact info; “limited” will allow employers to see you but keep your contact info and current employer hidden—though you can still be contacted through the site’s messaging center); “private” will keep your resume all to yourself for further editing or for easy application to jobs.)</p><p>Other perks of having an account: You can save job searches and review your apply history. You’ll also be able to apply to jobs without having to upload a new resume each time. Additionally, if you click on your profile avatar while signed in, then go into your “Account Settings” and&nbsp;click on “Notification Settings,” you’ll be able to check boxes for a variety of useful email alerts.</p><h2><strong>3. Get alerted as soon as your preferred jobs are posted</strong></h2><p>Be the first to know about recently posted jobs by setting up job alerts on Search Jobs. There are two different ways to do this: First, if you’re signed into your account, you can search for a job and click the “Email me jobs” button to the right of the search. You’ll automatically be delivered new, matching jobs when they are posted, and the search will be stored under your “saved searches” area of your profile.</p><p>If you’d rather not sign up for an account, you can click the same button on any job search results page and enter the email address to where you want to receive job alerts. It’s as simple as that.</p><p>By having jobs curated to your interests, you can spend less time digging through the hundreds of jobs on Search Jobs and more time applying to jobs you’re really interested in.</p><h2><strong>4. Stay on up to date with your search</strong></h2><p>Here’s the thing&nbsp;about the job market: It changes constantly. New jobs open up all the time, which is great for you because that means the odds of you finding a great job&nbsp;increase by the minute. That’s why it’s crucial to check in on a daily basis—otherwise you&nbsp;risk missing out on a golden opportunity.</p><h2><strong>5. Do some research on prospective employers</strong></h2><p>You can set up job alerts on not only job titles but also companies. But you might be wondering, “How do I determine which companies I’d like to work for?”</p><p>You can get the inside scoop on employers by checking out&nbsp;<a href=\"https://www.monster.com/company/\">Search Jobs’s company profiles and employee reviews</a>. The reviews, posted by current and former employees, can give you a sense of culture, pay, and benefits to help you identify a match.</p><h2><strong>A brief recap</strong></h2><p>Got all that? It may seem like we just threw a lot at you, but the essence of the message is this: have a strategy and get out there. Need some guidance on taking&nbsp;the first few steps?&nbsp;<a href=\"https://member.monster.com/\">Join Search Jobs today.</a>&nbsp;Recruiters use Search Jobs every day looking to fill top jobs with qualified candidates, just like you. Plus, you’ll receive career advice and job search tips to help you through every phase.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, '2020-11-22 00:33:51', '2020-11-22 22:47:54');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `phone`, `token`, `created_at`) VALUES
('jackshanan95@gmail.com', NULL, '$2y$10$cuHSs5He/QW9zH7mGFvOn.kB.S4eGEhnhX2DzYLp2VKGQNu60EJ9i', '2020-11-27 02:08:44'),
('jefferdomd@gmail.com', NULL, '$2y$10$I.owanBG3N.svYppMkMeROmRz3ylXV.Bfx3nhZhwL6NtAvL5J0ktm', '2020-11-30 16:09:17'),
(NULL, '+94778212117', '630331', '2020-12-03 03:58:15');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_method_id` int(10) UNSIGNED DEFAULT '0',
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Transaction''s ID at the Provider',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `has_ccbox` tinyint(1) UNSIGNED DEFAULT '0',
  `is_compatible_api` tinyint(1) DEFAULT '0',
  `countries` text COLLATE utf8_unicode_ci COMMENT 'Countries codes separated by comma.',
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT '0',
  `active` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `display_name`, `description`, `has_ccbox`, `is_compatible_api`, `countries`, `lft`, `rgt`, `depth`, `parent_id`, `active`) VALUES
(1, 'paypal1', 'Paypal1', 'Payment with Paypal', 0, 0, NULL, 0, 0, 1, 0, 1),
(2, 'DirectPay', 'DirectPay', 'Payment with DirectPay', 0, 0, NULL, 0, 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `updated_at`, `created_at`) VALUES
(1, 'list-permission', 'web', '2020-11-13 05:18:56', '2020-11-13 05:18:56'),
(2, 'create-permission', 'web', '2020-11-13 05:18:56', '2020-11-13 05:18:56'),
(3, 'update-permission', 'web', '2020-11-13 05:18:56', '2020-11-13 05:18:56'),
(4, 'delete-permission', 'web', '2020-11-13 05:18:57', '2020-11-13 05:18:57'),
(5, 'list-role', 'web', '2020-11-13 05:18:57', '2020-11-13 05:18:57'),
(6, 'create-role', 'web', '2020-11-13 05:18:57', '2020-11-13 05:18:57'),
(7, 'update-role', 'web', '2020-11-13 05:18:57', '2020-11-13 05:18:57'),
(8, 'delete-role', 'web', '2020-11-13 05:18:57', '2020-11-13 05:18:57'),
(9, 'access-dashboard', 'web', '2020-11-13 05:18:57', '2020-11-13 05:18:57');

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE `pictures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `active` tinyint(1) UNSIGNED DEFAULT '1' COMMENT 'Set at 0 on updating the ad',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT '0',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `post_type_id` int(10) UNSIGNED DEFAULT NULL,
  `company_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_description` text COLLATE utf8_unicode_ci,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salary_min` decimal(10,2) UNSIGNED DEFAULT NULL,
  `salary_max` decimal(10,2) UNSIGNED DEFAULT NULL,
  `salary_type_id` int(10) UNSIGNED DEFAULT '1',
  `negotiable` tinyint(1) UNSIGNED DEFAULT '0',
  `start_date` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `application_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_hidden` tinyint(1) UNSIGNED DEFAULT '0',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `lon` float DEFAULT NULL COMMENT 'longitude in decimal degrees (wgs84)',
  `lat` float DEFAULT NULL COMMENT 'latitude in decimal degrees (wgs84)',
  `ip_addr` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visits` int(10) UNSIGNED DEFAULT '0',
  `email_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tmp_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified_email` tinyint(1) UNSIGNED DEFAULT '0',
  `verified_phone` tinyint(1) UNSIGNED DEFAULT '1',
  `reviewed` tinyint(1) UNSIGNED DEFAULT '0',
  `featured` tinyint(1) UNSIGNED DEFAULT '0',
  `archived` tinyint(1) UNSIGNED DEFAULT '0',
  `archived_at` timestamp NULL DEFAULT NULL,
  `archived_manually` tinyint(1) UNSIGNED DEFAULT '0',
  `deletion_mail_sent_at` timestamp NULL DEFAULT NULL,
  `partner` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `country_code`, `user_id`, `company_id`, `category_id`, `post_type_id`, `company_name`, `company_description`, `logo`, `title`, `description`, `tags`, `salary_min`, `salary_max`, `salary_type_id`, `negotiable`, `start_date`, `application_url`, `contact_name`, `email`, `phone`, `phone_hidden`, `address`, `city_id`, `lon`, `lat`, `ip_addr`, `visits`, `email_token`, `phone_token`, `tmp_token`, `verified_email`, `verified_phone`, `reviewed`, `featured`, `archived`, `archived_at`, `archived_manually`, `deletion_mail_sent_at`, `partner`, `approved_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'LK', 1, 3, 6, 2, 'Trey Llc', 'fghfghfghgfSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.', 'files/lk/3/cc278fab1f349bf34ff0855841d8317f.png', 'Career - Search Jobs', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.<br></p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'John Doe', 'admin@mail.com', '0123456789', NULL, NULL, 1248991, 6.93194, 79.8478, '102.176.65.47', 7, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2020-11-24 20:40:45', '2021-01-23 06:26:34', NULL),
(2, 'LK', 1, 2, 29, 1, 'Lorem Ipsum Company', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.', 'files/lk/2/0be6fc7bbae92448f71fa5b946749455.jpeg', 'The Platform That Connects Employers With Candidates', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.<br></p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'John Doe', 'admin@mail.com', '0123456789', NULL, NULL, 1248991, 6.93194, 79.8478, '102.176.65.47', 44, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, '2020-12-30 11:24:32', '2020-11-24 20:43:49', '2021-01-23 18:09:45', NULL),
(3, 'LK', 1, 3, 16, 0, 'Trey Llc', 'fghfghfghgfSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.', 'files/lk/3/cc278fab1f349bf34ff0855841d8317f.png', ',m ,m', '<p>, ,m lm </p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'John Doe', 'admin@mail.com', '0123456789', NULL, NULL, 1248991, 6.93194, 79.8478, '123.231.121.73', 0, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2020-11-30 10:25:27', '2020-11-30 10:26:01', NULL),
(4, 'LK', 1, 3, 16, 0, 'Trey Llc', 'fghfghfghgfSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.', 'files/lk/3/cc278fab1f349bf34ff0855841d8317f.png', 'kl.m lm', '<p>lknlknklnk</p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'John Doe', 'admin@mail.com', '0123456789', NULL, NULL, 1248991, 6.93194, 79.8478, '112.134.246.86', 0, NULL, NULL, 'f93709d83db6b820abe44425354c42f8', 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2020-12-02 18:25:09', '2020-12-02 18:25:09', NULL),
(5, 'LK', 1, 3, 17, 0, 'Trey Llc', 'fghfghfghgfSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.', 'files/lk/3/cc278fab1f349bf34ff0855841d8317f.png', 'km lmn mm m', '<p>kjnkon</p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'John Doe', 'admin@mail.com', '0123456789', NULL, NULL, 1248991, 6.93194, 79.8478, '112.134.246.153', 0, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2020-12-03 00:15:38', '2020-12-03 00:16:02', NULL),
(6, 'LK', 1, 3, 18, 0, 'Trey Llc', 'fghfghfghgfSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.', 'files/lk/3/cc278fab1f349bf34ff0855841d8317f.png', ',m ,m', '<p>,m ml </p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'John Doe', 'admin@mail.com', '0123456789', NULL, NULL, 1248991, 6.93194, 79.8478, '112.134.246.153', 0, NULL, NULL, '9de66deebf9397fd946a79a723055486', 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2020-12-03 00:19:59', '2020-12-03 00:19:59', NULL),
(7, 'LK', 1, 3, 17, 1, 'Trey Llc', 'fghfghfghgfSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.', 'files/lk/3/cc278fab1f349bf34ff0855841d8317f.png', 'ICT 1 Answers', '<p>sdhnvnbgcfvcfvfxvfdxdf</p>', 'se', NULL, NULL, 1, NULL, NULL, NULL, 'John Doe', 'admin@mail.com', '0123456789', NULL, NULL, 1248991, 6.93194, 79.8478, '123.231.127.217', 14, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, '2020-12-30 11:24:44', '2020-12-03 11:25:27', '2021-01-14 16:14:59', NULL),
(8, 'LK', 1, 3, 17, 0, 'Trey Llc', 'fghfghfghgfSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.', 'files/lk/3/cc278fab1f349bf34ff0855841d8317f.png', 'hbjhjb', '<p>hbhb, ,m  </p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'John Doe', 'admin@mail.com', '0123456789', NULL, NULL, 1248991, 6.93194, 79.8478, '123.231.111.94', 0, NULL, NULL, 'a98e6efd06334623c391c6a8a166462d', 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2020-12-03 15:35:18', '2020-12-03 15:35:18', NULL),
(9, 'LK', 1, 3, 17, 0, 'Trey Llc', 'fghfghfghgfSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.', 'files/lk/3/cc278fab1f349bf34ff0855841d8317f.png', 'hbjhjb', '<p>hbhb, ,m  </p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'John Doe', 'admin@mail.com', '0123456789', NULL, NULL, 1248991, 6.93194, 79.8478, '123.231.111.94', 0, NULL, NULL, 'eea67c4bd8c3c0c114b95e46bf582e64', 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2020-12-03 15:35:21', '2020-12-03 15:35:21', NULL),
(10, 'LK', 1, 3, 17, 0, 'Trey Llc', 'fghfghfghgfSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.', 'files/lk/3/cc278fab1f349bf34ff0855841d8317f.png', 'sdaaaaaaaaa', '<p>cddasssssssssssssc<br></p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'John Doe', 'admin@mail.com', '0123456789', NULL, NULL, 1231410, 6.7132, 79.9026, '123.231.127.223', 0, NULL, NULL, '651854ab7bb5857c8462b28c654bad58', 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2020-12-03 19:36:16', '2020-12-03 19:36:16', NULL),
(11, 'LK', 1, 3, 17, 1, 'Trey Llc', 'fghfghfghgfSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.', 'files/lk/3/cc278fab1f349bf34ff0855841d8317f.png', 'dCCCCCCCCCC', '<p>DDDDDDDDDDDDDDDDD</p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'John Doe', 'admin@mail.com', '0123456789', NULL, NULL, 1231410, 6.7132, 79.9026, '123.231.127.223', 27, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2020-12-03 19:38:05', '2021-01-10 09:21:37', NULL),
(12, 'LK', 1, 7, 19, 1, 'MENSI Plc', 'kjn aoiapsjmäpo kvdsä posdäv psld\r\ns-mvösomväovsdvs', 'files/lk/7/b2185f823b6f7a30010ddc231ea976c8.png', 'Good post', '<p>the post description nö oidsj9jsdmäpasdj</p><p><br></p><p>dSÜ DSKG¨\' OKr¨\'wi</p>', NULL, 100.00, 150.00, 1, 1, NULL, NULL, 'John Doe', 'admin@mail.com', '0123456789', NULL, NULL, 1244397, 6.9909, 79.883, '129.0.205.81', 18, NULL, NULL, '7b162129fe88a973c2c7c2d750942ee1', 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2020-12-18 10:31:43', '2021-01-10 09:21:44', NULL),
(13, 'LK', 0, 0, 17, 1, NULL, 'Job description', NULL, 'A good job for you', 'Description of company', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'Didier', 'didier@mail.com', NULL, NULL, NULL, 1244596, 6.8916, 80.5955, '154.72.163.46', 1, '2127f1d43c4f2276e77a4d8ab455ebc1', NULL, NULL, 0, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2020-12-18 16:30:16', '2020-12-27 04:37:11', NULL),
(14, 'LK', 0, 0, 18, 1, NULL, 'gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg', NULL, 'ggggggggggggggggggggggggggggggggg', 'ggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'kjblj', 'jackshnan2017@gmail.com', '+94752651624', NULL, NULL, 1248991, 6.93194, 79.8478, '112.134.240.142', 0, '234a1c65b10333626741b42fd520fcae', NULL, '11f3e58ce5b5df5b900c500d633e74c7', 0, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2020-12-18 17:12:50', '2020-12-18 17:12:50', NULL),
(15, 'LK', 1, 7, 19, 6, 'MENSI Plc', 'kjn aoiapsjmäpo kvdsä posdäv psld\r\ns-mvösomväovsdvs', 'files/lk/7/b2185f823b6f7a30010ddc231ea976c8.png', 'Interior Designer Needed', 'The unique post description', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'John Doe', 'admin@mail.com', '0123456789', NULL, NULL, 1244596, 6.8916, 80.5955, '129.0.205.225', 17, NULL, NULL, '595ba354778495679445393a2b93e7fb', 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2020-12-19 17:38:37', '2021-01-12 02:37:51', NULL),
(16, 'LK', 0, 0, 17, 1, 'Navotar Inc', 'We are Total Human resource Support experts, providing temporary,contract and permanent recruitment services. We help companies recruit the top talent of the industry. We provide 100% dedicated team of sources and recruiters to fill client\'s requirements', 'files/lk/3/cc278fab1f349bf34ff0855841d8317f.png', 'Customer Support Executive', '<p>Only the hustlers, the doers and the go-getters!\r\n\r\nNavotar the leading Car Rental Software provider is looking to hire some kickass folks for it\'s award winning Customer Relationship Team\r\n\r\n</p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'mens', 'second@test.com', '58697423', NULL, NULL, 1244773, 6.9012, 80.0852, '129.0.205.225', 15, '4d01b1423186e53f39d56ebcc8c1f484', NULL, NULL, 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2020-12-19 17:52:25', '2021-01-24 10:32:58', NULL),
(17, 'LK', 1, 9, 17, 2, 'Navotar Inc', 'Navotar the leading Car Rental Software provider is looking to hire some kickass folks for its Web Development Team', 'files/lk/7/b2185f823b6f7a30010ddc231ea976c8.png\r\n', 'WordPress Developer', '<p>Building, updating and maintaining responsive websites in Wordpress\r\n\r\nDesign web elements with Photoshop or graphic design software\r\n\r\nWork closely with digital strategists, SEO specialists & designers\r\n\r\nUnderstand client requirements and translate them into proper UX and UI functionality\r\n\r\nConfiguring & customizing WordPress, WP plug-ins & integrating with other tools<p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'John Doe', 'admin@mail.com', '0123456789', NULL, NULL, 1248991, 6.93194, 79.8478, '112.134.244.225', 23, NULL, NULL, '1cb5c3aecfcf30a808799e8947f35785', 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2020-12-19 17:55:35', '2021-01-26 12:39:05', NULL),
(18, 'LK', 7, 8, 17, 1, 'ZRI Recruitment', '<p>ZRI Recruitment is an agency pioneered to adapt to your demanding needs, to help you find the right job with hourly support.</p>', 'files/lk/8/421fb99aa34e4f52e90beae3de3a20cf.png', 'Multimedia Executive', '<p>We are looking for a Senior Multimed Executive to produce and oversee digital and print creative solutions to address our marketing needs.\r\n\r\n</p>', NULL, 0.00, 0.00, 1, 1, 'f ef', NULL, 'Zakib Rizan', 'zrirecruitment@gmail.com', '+94728941243', NULL, NULL, 9259456, 6.83947, 79.8645, '116.206.246.156', 43, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2020-12-21 12:51:38', '2021-01-26 00:53:02', NULL),
(19, 'LK', 1, 9, 19, 4, 'Emerald International Pvt Ltd', '“The best marketing doesn’t feel like marketing.” Emerald is on the lookout for individuals who are experienced in all mediums of marketing and ready to revolutionise the fashion industry.', 'files/lk/2/0be6fc7bbae92448f71fa5b946749455.jpeg', 'Marketing Manager', '<p>Below the age of 35 years should possess a degree in a local/international university or an equivalent professional qualification from a reputed institution with at least 5 years of work experience in a similar position.</p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'John Doe', 'admin@mail.com', '0123456789', NULL, NULL, 1248991, 6.93194, 79.8478, '112.134.247.202', 17, NULL, NULL, '3fe38e406b1e19c8ea44dd7661259744', 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2020-12-27 07:05:31', '2021-01-21 18:52:05', NULL),
(20, 'LK', 1, 9, 18, 1, 'Hashcode Labs', 'Our client is is Sri Lanka\'s flagship telecommunications service provider which operates the country\'s largest mobile network. It is the 5th largest listed company in the Colombo Stock Exchange by Market Capitalization and has been at the forefront of innovation in Sri Lanka since the late 1990s..', 'files/lk/3/cc278fab1f349bf34ff0855841d8317f.png', 'Specialist - Cloud Operations', '<p><span style=\"color: rgb(102, 102, 102); font-size: 10px;\">Responsible for automation, cloud infrastructure planning, performance analysis, scripting, and troubleshooting of cloud hosted business applications and solutions.</span></span></span><br></p>', NULL, 52.00, NULL, 1, NULL, '03/14/2020', NULL, 'John Doe', 'admin@mail.com', '0123456789', NULL, NULL, 1233369, 7.2083, 79.8358, '49.126.145.184', 23, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2020-12-27 16:59:20', '2021-01-25 15:28:44', NULL),
(21, 'LK', 1, 9, 17, 1, 'Nextjob', 'Nextjob is the premier leader in Contract-To-Hire, Contract Staffing and Direct-Hire Solutions for Startups, SMEs & Corporates hunting for IT/Tech/Engineering Talent.​', 'files/lk/3/cc278fab1f349bf34ff0855841d8317f.png', 'UI/UX Engineer', '<p><span style=\"color: rgb(102, 102, 102); font-size: 10px;\">, Responsibilities for this position include gathering user requirements, designing graphic elements and building navigation components. To be successful in this role, you should have experience with design software and wireframe tools. If you also have a portfolio of professional design projects that includes work with web/mobile applications, we’d like to meet you.</span><br></p>', NULL, 52.00, NULL, 1, NULL, '02/29/2020', NULL, 'John Doe', 'admin@mail.com', '0123456789', NULL, NULL, 1233369, 7.2083, 79.8358, '49.126.145.184', 232, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, '2020-12-30 14:59:33', '2020-12-27 19:21:58', '2021-01-20 15:45:38', NULL),
(22, 'LK', 1, 6, 17, 2, 'CreativeHub', 'Since our inception, CreativeHub has been committed to delivering end-to-end digital solutions that help businesses and communities grow. At CreativeHub we provide our clients with holistic and customisable digital solutions ranging from high-end Web development, E-commerce solutions, customised ERP solutionsc edge to be at the top of your game ', 'files/lk/6/084cd1dc9bf6c8db91010764c96a3ef2.png', 'Senior Creative Designer', '<p>Leading a team of creative designers in training and guiding them, Participating in brainstorming sessions to share new design perspectives and ideas.</p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'John Doe', 'admin@mail.com', '0123456789', NULL, NULL, 1248991, 6.93194, 79.8478, '112.134.245.152', 54, NULL, NULL, 'c1c25379b6f2ced0b434f82e498152b1', 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, '2020-12-30 11:24:50', '2020-12-27 20:15:48', '2021-01-22 03:23:50', NULL),
(23, 'LK', 38, 10, 30, 5, 'Allex', '<p>Allex is a digital agency that leverages marketing, data and technology to help businesses grow. Our team comprises of creatives, writers and analysts that help brands across the world generate measurable results through sophisticated storytelling.</p>\n\n<p>Embracing a culture of transparency and equality in the workplace, we’ve built an environment helping Sri Lanka’s best marketing and creative talent thrive. Our team looks at untangling multivariate problems with an open mind and the willingness to constantly test and learn.</p>', 'files/lk/10/815caf0f899d4f5a0d11bf6fc509faef.jpg', 'Operations & Marketing Intern', '<p>At Help.lk, we\'re changing how students learn.</p>\n\n<p>When studying, Students bump into small problems. We connect students with a tutor instantly for a shorter 1-on-1 session.</p>\n\n<p>Ex. Amal is doing a physics past-paper &amp; struggling to get an answer to a question. He can\'t remember the correct theory for it. He\'s helpless! Tries to ask friends &amp; family but, the help isn\'t sufficient and, on the verge of giving up. At this point of struggle, we instantly connect Amal with a tutor for a shorter 1-on-1 help-session.</p>\n\n<p>For tutors, This is like driving uber. Tutors will get a notification &amp; whoever picks first will get the session.</p>\n\n<h2>What we expect from you:</h2>\n\n<ul><li>Ability to take ownership in work and deliver results</li><li>Plan &amp; Initiate marketing campaigns</li><li>Come up with new marketing ideas &amp; test them.</li><li>Reach to influencers and build connections.</li><li>Work alongside with the rest of the team to pump the platform to students &amp; tutors.</li><li>Post on social channels.</li><li>Handle basics company operations.</li></ul>\n\n<h2>Qualifications:</h2>\n\n<ul><li>If you believe you\'re the best fit for the above, Go ahead and apply.</li></ul>\n\n<p>It\'s not a must to have/doing a degree or any formal educational qualification. All we care about is your ability to learn new skills on-demand and drive yourself.</p>\n\n<p>Please highlight the extracurricular activities you\'ve done in the past and type out a proper cover letter.</p>\n\n<p>We\'re a startup, We\'ll pay you Rs 10,000 -Rs 15,000 until we secure our next funding round, Once the investment is in the bank we will pay what you deserve. And if you stick with the company, you will be eligible for the team equity pool.</p>', 'it,marketing', 10000.00, 30000.00, 3, 1, '12-02-2021', NULL, 'Shaaz', 'shaaz@shaaz.com', '+94776512342', NULL, NULL, 1248991, 6.93194, 79.8478, '175.157.42.122', 5, NULL, NULL, NULL, 1, 1, 0, 0, 0, '2021-01-15 02:15:31', 0, NULL, NULL, '2021-01-23 06:08:40', '2021-01-14 23:19:12', '2021-01-23 13:08:40', NULL),
(24, 'LK', 0, 0, 18, 2, NULL, '<p>mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm</p>', NULL, 'Pearlinngreen', '<p>mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm</p>', NULL, NULL, NULL, 1, 1, NULL, NULL, 'kjblj', 'jackshnan2017@gmail.com', '+94752651624', NULL, NULL, 1248991, 6.93194, 79.8478, '112.134.242.6', 0, '92ebe3990013f4a3a62e5be727295c23', NULL, NULL, 0, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2021-01-17 23:15:29', '2021-01-17 23:15:32', NULL),
(25, 'LK', 31, 0, 16, 3, NULL, '<p>mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm</p>', NULL, 'lkbb', '<p>mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm</p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'kjblj', 'jackshanan2017@gmail.com', '+94772502545', NULL, NULL, 1248991, 6.93194, 79.8478, '112.134.242.6', 3, 'e14f667bc243baefa5f749a7d521b1c9', NULL, NULL, 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2021-01-17 23:17:46', '2021-01-18 23:32:30', NULL),
(26, 'LK', 0, 0, 17, 1, NULL, '<p>nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn</p>', NULL, 'Pearlinngreen', '<p>nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn</p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'kjblj', 'jackshanan2017@gmail.com', '+94752651624', NULL, NULL, 1248991, 6.93194, 79.8478, '175.157.42.42', 0, 'a0b343c3a9d28728f0751c6f8ed955e1', NULL, NULL, 0, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2021-01-19 21:42:14', '2021-01-19 21:42:19', NULL),
(28, 'LK', 0, 0, 30, 1, 'Dialog', '<p>The Job</p>\r\n\r\n<p>• Research on new technologies upon suggestions from other team members and senior management </p>\r\n\r\n<p>• Have a fundamental and practical understanding about the emerging technologies to have a basic understanding about the marketplace availability of the product. </p>\r\n\r\n<p>• Evaluate and resolve technical feasibility to fulfil various business requirements</p>\r\n\r\n<p>• Ensure to get the competitive edge to the final product through innovative introduction ofmnew features. </p>', 'files/lk/28https://www.searchjobs.global/storage/app/default/picture.jpg', 'Engineer - Research and Development', '<p>The Job</p><p>• Research on new technologies upon suggestions from other team members and senior management&nbsp;</p><p>• Have a fundamental and practical understanding about the emerging technologies to have a basic understanding about the marketplace availability of the product.&nbsp;</p><p>• Evaluate and resolve technical feasibility to fulfil various business requirements</p><p>• Ensure to get the competitive edge to the final product through innovative introduction ofmnew features.&nbsp;</p>', 'it,engineering', 100000.00, 300000.00, 3, 0, '12-02-2021', 'https://xpress.jobs/jobs/view/64360/engineer-research-and-development-dialog-axiata-plc', 'Dialog Admin', 'admin@dialog.com', '+94777123456', 0, NULL, 1248991, 6.93194, 79.8478, '116.206.247.229', 2, 'd267c4bc202c4edb3824e130591e91bf', NULL, NULL, 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, '2021-01-20 06:06:17', '2021-01-20 13:03:28', '2021-01-23 09:55:25', NULL),
(29, 'LK', 0, 0, 16, 1, 'ABC', '<p>ZXCZZX ASDWSDFCVASDCVZX<br></p>', 'files/lk/29/ea29459a143587742862fd295c1f4e53.jpeg', 'Abc', '<p>abcsdvascfdscxzasC<br></p>', 'abc', 10000.00, 30000.00, 1, 0, '12-02-2021', 'https://www.rooster.jobs/jobs/845', 'Joe', 'joesmith@example.com', NULL, 0, NULL, 1248991, 6.93194, 79.8478, '116.206.247.229', 6, '9f52a0c1b1b6f1b53c5094ff8b2c04b3', NULL, NULL, 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, '2021-01-20 07:33:47', '2021-01-20 13:29:39', '2021-01-21 16:28:03', NULL),
(30, 'LK', 1, 9, 40, 1, 'Hashcodelabs', 'devvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv', 'app/default/picture.jpg', 'Delivery Riders - Colombo', '<p></p>\n\n<p>තනතුර: බෙදාහැරීමේ නියෝජිතයින් - කොළොඹ, නුවර, වත්තල, මීගමුව</p>\n\n<p>ආයතනය පිලිබඳ තොරතුරු:</p>\n\n<p>ආයුබෝවන්! PickMe</p>\n\n<p>Food රියදුරු ලියාපදිංචි අංශය වෙත සාදරයෙන් පිළිගනිමු.</p>\n\n<p>මසකට රුපියල් ලක්ෂයක් ඉපයීමේ අවස්ථාව දැන් ඔබටත්! අදම PickMe<br></p>\n\n<p>Food ආහාර ඩිලිවරි සේවාව සමග එකතු වෙන්න!</p>\n\n<p><br></p>', 'drive', 10000.00, 300000.00, 1, NULL, '01-02-2021', NULL, 'John Doe', 'admin@mail.com', '0123456789', NULL, NULL, 1248991, 6.93194, 79.8478, '123.231.106.39', 3, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, '2021-01-20 08:48:46', '2021-01-20 15:48:07', '2021-01-24 18:21:28', NULL),
(31, 'LK', 0, 0, 19, 1, 'ABC', '<p>, Responsibilities for this position include gathering user requirements, designing graphic elements and building navigation components. To be successful in this role, you should have experience with design software and wireframe tools. If you also have a portfolio of professional design projects that includes work with web/mobile applications, we’d like to meet you.<br></p>', 'files/lk/31/56d64469ec5c0886218d00d7c87f6a80.jpeg', 'Engineer', '<p>, Responsibilities for this position include gathering user requirements, designing graphic elements and building navigation components. To be successful in this role, you should have experience with design software and wireframe tools. If you also have a portfolio of professional design projects that includes work with web/mobile applications, we’d like to meet you.<br></p>', NULL, 100000.00, 300000.00, 3, 0, '12-02-2021', NULL, 'Joe', 'shafrazmohamed444@gmail.com', NULL, 0, NULL, 1241622, 7.2955, 80.6356, '123.231.106.39', 7, '3eadbc30506c9bfbf2bca4e097b53218', NULL, NULL, 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, '2021-01-20 09:17:35', '2021-01-20 16:17:13', '2021-01-25 05:57:23', NULL),
(36, 'LK', 1, 9, 16, 4, 'Hashcodelabs', 'devvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv', 'app/default/picture.jpg', 'Pearlinngreen', '<p>hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh</p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'John Doe', 'admin@mail.com', '0123456789', NULL, NULL, 1248991, 6.93194, 79.8478, '112.134.240.238', 1, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2021-01-22 09:51:55', '2021-01-23 11:39:34', NULL),
(37, 'LK', 38, 10, 17, 1, 'Allex', '<p>Allex is a digital agency that leverages marketing, data and technology to help businesses grow. Our team comprises of creatives, writers and analysts that help brands across the world generate measurable results through sophisticated storytelling.</p>\n\n<p>Embracing a culture of transparency and equality in the workplace, we’ve built an environment helping Sri Lanka’s best marketing and creative talent thrive. Our team looks at untangling multivariate problems with an open mind and the willingness to constantly test and learn.</p>', 'files/lk/10/815caf0f899d4f5a0d11bf6fc509faef.jpg', 'fff', '<p>fff</p>', NULL, 10000.00, 10000.00, 2, NULL, '12/.23', NULL, 'Shaaz', 'shaaz@shaaz.com', '+94776512342', NULL, NULL, 1241622, 7.2955, 80.6356, '175.157.197.167', 1, NULL, NULL, '5f7458613209622b91ada938a546ddb7', 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2021-01-23 11:41:50', '2021-01-25 17:55:49', NULL),
(38, 'LK', 1, 9, 20, 1, 'Hashcodelabs', 'devvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv', 'app/default/picture.jpg', 'BA', '<p>Business analyst Wanted</p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'John Doe', 'admin@mail.com', '0123456789', NULL, NULL, 1248991, 6.93194, 79.8478, '175.157.82.203', 0, NULL, NULL, 'cb3a11f88abc9a9988a94d783a275d45', 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, '2021-01-23 06:07:44', '2021-01-23 12:51:16', '2021-01-23 13:07:44', NULL),
(39, 'LK', 38, 10, 17, 2, 'Allex', '<p>Allex is a digital agency that leverages marketing, data and technology to help businesses grow. Our team comprises of creatives, writers and analysts that help brands across the world generate measurable results through sophisticated storytelling.</p>\n\n<p>Embracing a culture of transparency and equality in the workplace, we’ve built an environment helping Sri Lanka’s best marketing and creative talent thrive. Our team looks at untangling multivariate problems with an open mind and the willingness to constantly test and learn.</p>', 'files/lk/10/815caf0f899d4f5a0d11bf6fc509faef.jpg', 'JOB123', '<p>JOB123<br></p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'Shaaz', 'shaaz@shaaz.com', '+94776512342', NULL, NULL, 1248991, 6.93194, 79.8478, '123.231.127.150', 6, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, '2021-01-23 06:12:23', '2021-01-23 13:10:07', '2021-01-26 19:18:16', NULL),
(40, 'LK', 7, 8, 40, 1, 'ZRI Recruitment', '<p>ZRI Recruitment is an agency pioneered to adapt to your demanding needs, to help you find the right job with hourly support.</p>', 'files/lk/8/421fb99aa34e4f52e90beae3de3a20cf.png', 'Intern- Marketing', '<p>Company Profile: A Leading Campus in Sri Lanka</p>\n\n<p>Position : Intern- Marketing</p>\n\n<p>Location: Dehiwala</p>\n\n<p>Working Days : Monday - Friday ​</p>\n\n<p>Working Hours: 8.30 AM - 5:00 PM​</p>\n\n<p><br></p>\n\n<p>Requirements:</p>\n\n<p>- Good communication in English</p>\n\n<p>- ﻿Ability to converse in Tamil, Sinhala and English is an added advantage</p>\n\n<p>- ﻿Young and Energetic</p>\n\n<p>- Familiar with sending emails and Microsoft Office</p>\n\n<p>- Ability to handle social media and calls</p>\n\n<p>- Knowledge in designing is an added advantage</p>', 'internship,marketing', 10000.00, 20000.00, 3, NULL, '01/01/2021', NULL, 'Zakib Rizan', 'zrirecruitment@gmail.com', '+94728941243', NULL, NULL, 1234569, 6.84019, 79.8712, '123.231.126.175', 7, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2021-01-23 18:16:25', '2021-01-24 18:21:02', NULL),
(41, 'LK', 0, 0, 17, 4, NULL, '<p>Demo <br><br></p>', NULL, 'dddddd', '<p>Demo <br><br></p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'pokeman', 'jackshanan2017@gmail.com', NULL, NULL, NULL, 1248991, 6.93194, 79.8478, '175.157.40.247', 0, '28449b0e39bd1a83f395471d6e78ac77', NULL, 'd6bdd2b67ddfd13ec7511f7789b2e4b8', 0, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2021-01-26 14:22:54', '2021-01-26 14:22:54', NULL),
(42, 'LK', 0, 0, 17, 4, NULL, '<p>Demo <br><br></p>', NULL, 'dddddd', '<p>Demo <br><br></p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'pokeman', 'jackshanan2017@gmail.com', NULL, NULL, NULL, 1248991, 6.93194, 79.8478, '175.157.40.247', 0, '963bcb94cebcee4b82149e2ea0a68213', NULL, 'd590b6b7829bfa04de914fbf3fb911c6', 0, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2021-01-26 14:25:20', '2021-01-26 14:25:20', NULL),
(43, 'LK', 0, 0, 17, 2, NULL, '<p>sfbfdnggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg<br></p>', NULL, 'bsfbsfbsfbbbbbbbbbbbbbbbbbbbbbbb', '<p>sfbfdnggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg<br></p>', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'fbfd', 'bdg@hgn.com', NULL, NULL, NULL, 1248991, 6.93194, 79.8478, '123.231.126.175', 0, '3c618d96e88c306a96c9f0937499469f', NULL, NULL, 0, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2021-01-26 19:35:13', '2021-01-26 19:36:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_types`
--

CREATE TABLE `post_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post_types`
--

INSERT INTO `post_types` (`id`, `translation_lang`, `translation_of`, `name`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, 'en', 1, 'Full-time', NULL, NULL, NULL, 1),
(2, 'en', 2, 'Part-time', NULL, NULL, NULL, 1),
(3, 'en', 3, 'Temporary', NULL, NULL, NULL, 1),
(4, 'en', 4, 'Contract', NULL, NULL, NULL, 1),
(5, 'en', 5, 'Internship', NULL, NULL, NULL, 1),
(6, 'en', 6, 'Permanent', NULL, NULL, NULL, 1),
(7, 'en', 7, 'Optional', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `report_types`
--

CREATE TABLE `report_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `report_types`
--

INSERT INTO `report_types` (`id`, `translation_lang`, `translation_of`, `name`) VALUES
(1, 'en', 1, 'Fraud'),
(2, 'en', 2, 'Duplicate'),
(3, 'en', 3, 'Spam'),
(4, 'en', 4, 'Wrong category'),
(5, 'en', 5, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `resumes`
--

CREATE TABLE `resumes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `resumes`
--

INSERT INTO `resumes` (`id`, `country_code`, `user_id`, `name`, `filename`, `active`, `created_at`, `updated_at`) VALUES
(2, 'LK', 2, NULL, 'resumes/lk/2/5bb1a8fc41575699018a0ed3a48c815f.png', 1, '2020-12-02 09:57:10', '2020-12-02 09:57:10'),
(3, 'LK', 16, NULL, 'resumes/lk/16/9944b88863d527de3b32640ddd0bb3b7.docx', 1, '2020-12-02 16:01:55', '2020-12-02 16:01:55'),
(4, 'LK', 2, NULL, 'resumes/lk/2/1d57967aa0615aa02b0740c94b8c8d81.png', 1, '2020-12-03 05:05:01', '2020-12-03 05:05:01'),
(5, 'LK', 14, NULL, 'resumes/lk/14/2dcbdeaf452a3de00f7a1dbd82cb77f8.pdf', 1, '2020-12-10 12:38:43', '2020-12-10 12:38:43'),
(7, 'LK', 2, NULL, 'resumes/lk/2/c7e8031a2cff0caad60a7c9e4d5f7ffd.pdf', 1, '2020-12-17 19:09:15', '2020-12-17 19:09:15'),
(8, 'LK', 30, NULL, 'resumes/lk/30/93899d8107b2b272e2ca212a15e7befb.pdf', 1, '2020-12-27 18:12:17', '2020-12-27 18:12:17'),
(9, 'LK', 30, NULL, 'resumes/lk/30/77e760504d724e64a1bd7f90287488e3.pdf', 1, '2020-12-27 18:12:29', '2020-12-27 18:12:29'),
(10, 'LK', 39, NULL, 'resumes/lk/39/652ca1bb5cae6da356d4054dcf1ad37b.pdf', 1, '2021-01-20 14:56:38', '2021-01-20 14:56:38'),
(11, 'LK', 6, NULL, 'resumes/lk/6/656bcb69eb19e4853a5ad9e676bec651.docx', 1, '2021-01-23 18:24:20', '2021-01-23 18:24:20'),
(12, 'LK', 2, NULL, 'resumes/lk/2/0c979b4d65ba11b586d3a9d988503e2f.pdf', 1, '2021-01-26 00:35:43', '2021-01-26 00:35:43');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reviewer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `reviewer_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 2, 25, 'great worker! I like him', '2020-12-24 11:50:12', '2020-12-24 11:50:12'),
(2, 25, 1, 'I\'ve appreciated our collaboration. \r\nGreat communication skills ttt', '2020-12-24 12:02:58', '2020-12-24 15:07:32'),
(3, 28, 1, 'great', '2020-12-24 12:15:52', '2020-12-24 16:00:45'),
(4, 28, 2, '', '2020-12-24 14:52:13', '2020-12-24 14:55:00'),
(5, 25, 2, 'great', '2020-12-24 14:55:15', '2020-12-24 16:51:51'),
(6, 6, 7, 'nkscna', '2020-12-29 05:59:08', '2020-12-29 05:59:08'),
(7, 34, 1, 'Great', '2020-12-29 09:38:40', '2020-12-29 10:06:36'),
(8, 34, 2, 'good', '2020-12-29 09:49:50', '2020-12-29 09:49:50'),
(9, 30, 2, 'good', '2020-12-29 19:55:36', '2020-12-29 19:55:52'),
(10, 6, 6, 'good', '2021-01-23 11:39:31', '2021-01-23 11:39:31'),
(11, 6, 2, 'good', '2021-01-25 04:37:15', '2021-01-25 04:37:15');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `updated_at`, `created_at`) VALUES
(1, 'super-admin', 'web', '2020-11-13 05:18:56', '2020-11-13 05:18:56');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `salary_types`
--

CREATE TABLE `salary_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `salary_types`
--

INSERT INTO `salary_types` (`id`, `translation_lang`, `translation_of`, `name`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, 'en', 1, 'hour', NULL, NULL, NULL, 1),
(2, 'en', 2, 'day', NULL, NULL, NULL, 1),
(3, 'en', 3, 'month', NULL, NULL, NULL, 1),
(4, 'en', 4, 'year', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `saved_candidates`
--

CREATE TABLE `saved_candidates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `candidate_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `saved_candidates`
--

INSERT INTO `saved_candidates` (`id`, `user_id`, `candidate_id`, `created_at`, `updated_at`) VALUES
(20, 1, 19, '2020-12-27 16:22:32', '2020-12-27 16:22:32'),
(21, 1, 5, '2020-12-27 16:24:36', '2020-12-27 16:24:36'),
(23, 1, 17, '2020-12-27 16:29:41', '2020-12-27 16:29:41'),
(32, 1, 30, '2020-12-28 00:27:58', '2020-12-28 00:27:58'),
(34, 1, 28, '2020-12-28 00:27:59', '2020-12-28 00:27:59'),
(35, 2, 30, '2020-12-28 17:56:34', '2020-12-28 17:56:34'),
(36, 7, 33, '2020-12-29 10:43:20', '2020-12-29 10:43:20'),
(37, 7, 6, '2020-12-29 10:43:27', '2020-12-29 10:43:27'),
(38, 2, 19, '2021-01-13 11:14:22', '2021-01-13 11:14:22');

-- --------------------------------------------------------

--
-- Table structure for table `saved_posts`
--

CREATE TABLE `saved_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `saved_posts`
--

INSERT INTO `saved_posts` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(4, 16, 2, '2020-12-02 16:03:15', '2020-12-02 16:03:15'),
(5, 16, 1, '2020-12-02 16:03:22', '2020-12-02 16:03:22'),
(6, 2, 2, '2020-12-03 04:45:04', '2020-12-03 04:45:04'),
(8, 1, 2, '2020-12-03 05:33:32', '2020-12-03 05:33:32'),
(11, 1, 1, '2020-12-12 18:42:25', '2020-12-12 18:42:25'),
(12, 1, 7, '2020-12-12 18:43:58', '2020-12-12 18:43:58'),
(13, 6, 2, '2020-12-20 20:12:28', '2020-12-20 20:12:28'),
(14, 6, 18, '2020-12-21 13:00:11', '2020-12-21 13:00:11'),
(20, 2, 19, '2020-12-27 16:10:48', '2020-12-27 16:10:48'),
(22, 30, 20, '2020-12-27 18:13:52', '2020-12-27 18:13:52'),
(23, 1, 22, '2020-12-28 00:07:00', '2020-12-28 00:07:00'),
(25, 1, NULL, '2020-12-29 16:17:54', '2020-12-29 16:17:54'),
(26, 2, NULL, '2021-01-13 11:13:48', '2021-01-13 11:13:48'),
(27, 38, 22, '2021-01-14 15:59:49', '2021-01-14 15:59:49'),
(28, 39, 22, '2021-01-14 16:12:35', '2021-01-14 16:12:35'),
(29, 2, 22, '2021-01-14 18:24:04', '2021-01-14 18:24:04'),
(30, 38, 23, '2021-01-15 00:40:44', '2021-01-15 00:40:44'),
(33, 39, 23, '2021-01-20 15:02:14', '2021-01-20 15:02:14'),
(34, 6, 40, '2021-01-23 18:19:22', '2021-01-23 18:19:22');

-- --------------------------------------------------------

--
-- Table structure for table `saved_search`
--

CREATE TABLE `saved_search` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'To show',
  `query` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payload` text COLLATE utf8_unicode_ci,
  `last_activity` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(250) COLLATE utf8_unicode_ci DEFAULT '',
  `user_agent` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field` text COLLATE utf8_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `name`, `value`, `description`, `field`, `parent_id`, `lft`, `rgt`, `depth`, `active`, `created_at`, `updated_at`) VALUES
(1, 'app', 'Application', '{\"purchase_code\":\"18776089\",\"app_name\":\"Search Jobs\",\"slogan\":\"THE PLATFORM THAT CONNECTS EMPLOYERS WITH CANDIDATES\",\"logo\":\"app\\/logo\\/logo-5fbb676fd911f.png\",\"favicon\":\"app\\/ico\\/ico-5fbb78923a955.png\",\"email\":\"richard@job.remaxroyalproperty.com\",\"phone_number\":null,\"auto_detect_language\":\"0\",\"default_date_format\":\"%d %B %Y\",\"default_datetime_format\":\"%d %B %Y %H:%M\",\"default_timezone\":\"America\\/New_York\",\"date_force_utf8\":\"0\",\"show_countries_charts\":\"1\",\"latest_entries_limit\":\"5\"}', 'Application Setup', NULL, 0, 2, 3, 1, 1, NULL, NULL),
(2, 'style', 'Style', '{\"app_skin\":\"skin-default\",\"body_background_color\":null,\"body_text_color\":\"#001289\",\"body_background_image\":\"app\\/logo\\/body-background-5fe49b6d8969d.png\",\"body_background_image_fixed\":\"1\",\"page_width\":null,\"title_color\":\"#001289\",\"progress_background_color\":null,\"link_color\":\"#03989e\",\"link_color_hover\":\"#001289\",\"header_sticky\":\"0\",\"header_height\":null,\"header_background_color\":\"#ffffff\",\"header_bottom_border_width\":\"1px\",\"header_bottom_border_color\":\"#001289\",\"header_link_color\":\"#040101\",\"header_link_color_hover\":\"#001289\",\"footer_background_color\":null,\"footer_text_color\":\"#000000\",\"footer_title_color\":\"#001289\",\"footer_link_color\":\"#03989e\",\"footer_link_color_hover\":\"#001289\",\"payment_icon_top_border_width\":null,\"payment_icon_top_border_color\":null,\"payment_icon_bottom_border_width\":null,\"payment_icon_bottom_border_color\":null,\"btn_post_bg_top_color\":\"#001289\",\"btn_post_bg_bottom_color\":\"#001289\",\"btn_post_border_color\":\"#001289\",\"btn_post_text_color\":\"#03989e\",\"btn_post_bg_top_color_hover\":null,\"btn_post_bg_bottom_color_hover\":null,\"btn_post_border_color_hover\":\"#21bca5\",\"btn_post_text_color_hover\":\"#000000\",\"custom_css\":null,\"admin_skin\":\"skin-blue\"}', 'Style Customization', NULL, 0, 4, 5, 1, 1, NULL, NULL),
(3, 'listing', 'Listing & Search', NULL, 'Listing & Search Options', NULL, 0, 6, 7, 1, 1, NULL, NULL),
(4, 'single', 'Ads Single Page', NULL, 'Ads Single Page Options', NULL, 0, 8, 9, 1, 1, NULL, NULL),
(5, 'mail', 'Mail', '{\"driver\":\"smtp\",\"host\":\"smtp.job.remaxroyalproperty.com\",\"port\":\"465\",\"username\":\"richard@job.remaxroyalproperty.com\",\"password\":\"HH6j8KiC%nZ{\",\"encryption\":\"ssl\\/tls\",\"mailgun_domain\":null,\"mailgun_secret\":null,\"mandrill_secret\":null,\"ses_key\":null,\"ses_secret\":null,\"ses_region\":null,\"sparkpost_secret\":null,\"sendmail_path\":\"\\/usr\\/sbin\\/sendmail -bs\",\"email_sender\":\"richard@job.remaxroyalproperty.com\",\"email_verification\":\"1\",\"confirmation\":\"1\",\"admin_notification\":\"0\",\"payment_notification\":\"0\"}', 'Mail Sending Configuration', NULL, 0, 10, 11, 1, 1, NULL, NULL),
(6, 'sms', 'SMS', NULL, 'SMS Sending Configuration', NULL, 0, 12, 13, 1, 1, NULL, NULL),
(7, 'upload', 'Upload', NULL, 'Upload Settings', NULL, 0, 14, 15, 1, 1, NULL, NULL),
(8, 'geo_location', 'Geo Location', '{\"default_country_code\":\"LK\"}', 'Geo Location Configuration', NULL, 0, 16, 17, 1, 1, NULL, NULL),
(9, 'security', 'Security', NULL, 'Security Options', NULL, 0, 18, 19, 1, 1, NULL, NULL),
(10, 'social_auth', 'Social Login', '{\"social_login_activation\":\"1\",\"facebook_client_id\":\"403901387465785\",\"facebook_client_secret\":\"21b9d65f99a806d58f0eda072bb8b7d6\",\"linkedin_client_id\":null,\"linkedin_client_secret\":null,\"twitter_client_id\":null,\"twitter_client_secret\":null,\"google_client_id\":null,\"google_client_secret\":null}', 'Social Network Login', NULL, 0, 20, 21, 1, 1, NULL, NULL),
(11, 'social_link', 'Social Network', NULL, 'Social Network Profiles', NULL, 0, 22, 23, 1, 1, NULL, NULL),
(12, 'optimization', 'Optimization', NULL, 'Optimization Tools', NULL, 0, 24, 25, 1, 1, NULL, NULL),
(13, 'seo', 'SEO', NULL, 'SEO Tools', NULL, 0, 26, 27, 1, 1, NULL, NULL),
(14, 'other', 'Others', NULL, 'Other Options', NULL, 0, 28, 29, 1, 1, NULL, NULL),
(15, 'cron', 'Cron', NULL, 'Cron Job', NULL, 0, 30, 31, 1, 1, NULL, NULL),
(16, 'footer', 'Footer', NULL, 'Pages Footer', NULL, 0, 32, 33, 1, 1, NULL, NULL),
(17, 'backup', 'Backup', NULL, 'Backup Configuration', NULL, 0, 34, 35, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subadmin1`
--

CREATE TABLE `subadmin1` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `asciiname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subadmin1`
--

INSERT INTO `subadmin1` (`id`, `code`, `country_code`, `name`, `asciiname`, `active`) VALUES
(1717, 'LK.36', 'LK', 'Western', 'Western', 1),
(1718, 'LK.35', 'LK', 'Uva', 'Uva', 1),
(1719, 'LK.34', 'LK', 'Southern', 'Southern', 1),
(1720, 'LK.33', 'LK', 'Sabaragamuwa', 'Sabaragamuwa', 1),
(1721, 'LK.32', 'LK', 'North Western', 'North Western', 1),
(1722, 'LK.30', 'LK', 'North Central', 'North Central', 1),
(1723, 'LK.29', 'LK', 'Central', 'Central', 1),
(1724, 'LK.38', 'LK', 'Northern Province', 'Northern Province', 1),
(1725, 'LK.37', 'LK', 'Eastern Province', 'Eastern Province', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subadmin2`
--

CREATE TABLE `subadmin2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subadmin1_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `asciiname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subadmin2`
--

INSERT INTO `subadmin2` (`id`, `code`, `country_code`, `subadmin1_code`, `name`, `asciiname`, `active`) VALUES
(21035, 'LK.38.1225017', 'LK', 'LK.38', 'Vavuniya District', 'Vavuniya District', 1),
(21036, 'LK.37.1226258', 'LK', 'LK.37', 'Trincomalee District', 'Trincomalee District', 1),
(21037, 'LK.33.1228729', 'LK', 'LK.33', 'Ratnapura District', 'Ratnapura District', 1),
(21038, 'LK.32.1229292', 'LK', 'LK.32', 'Puttalam District', 'Puttalam District', 1),
(21039, 'LK.30.1229899', 'LK', 'LK.30', 'Polonnaruwa District', 'Polonnaruwa District', 1),
(21040, 'LK.29.1232781', 'LK', 'LK.29', 'Nuwara Eliya District', 'Nuwara Eliya District', 1),
(21041, 'LK.38.1234392', 'LK', 'LK.38', 'Mullaitivu District', 'Mullaitivu District', 1),
(21042, 'LK.35.1234818', 'LK', 'LK.35', 'Moneragala District', 'Moneragala District', 1),
(21043, 'LK.34.1235845', 'LK', 'LK.34', 'Matara District', 'Matara District', 1),
(21044, 'LK.29.1235854', 'LK', 'LK.29', 'Matale District', 'Matale District', 1),
(21045, 'LK.38.1236148', 'LK', 'LK.38', 'Mannar District', 'Mannar District', 1),
(21046, 'LK.32.1237978', 'LK', 'LK.32', 'Kurunegala District', 'Kurunegala District', 1),
(21047, 'LK.38.1240371', 'LK', 'LK.38', 'Kilinochchi District', 'Kilinochchi District', 1),
(21048, 'LK.33.1240722', 'LK', 'LK.33', 'Kegalle District', 'Kegalle District', 1),
(21049, 'LK.29.1241621', 'LK', 'LK.29', 'Kandy District', 'Kandy District', 1),
(21050, 'LK.36.1241963', 'LK', 'LK.36', 'Kalutara District', 'Kalutara District', 1),
(21051, 'LK.38.1242831', 'LK', 'LK.38', 'Jaffna District', 'Jaffna District', 1),
(21052, 'LK.34.1244925', 'LK', 'LK.34', 'Hambantota District', 'Hambantota District', 1),
(21053, 'LK.36.1246005', 'LK', 'LK.36', 'Gampaha District', 'Gampaha District', 1),
(21054, 'LK.34.1246292', 'LK', 'LK.34', 'Galle District', 'Galle District', 1),
(21055, 'LK.36.1248990', 'LK', 'LK.36', 'Colombo District', 'Colombo District', 1),
(21056, 'LK.37.1250159', 'LK', 'LK.37', 'Batticaloa District', 'Batticaloa District', 1),
(21057, 'LK.35.1250614', 'LK', 'LK.35', 'Badulla District', 'Badulla District', 1),
(21058, 'LK.30.1251080', 'LK', 'LK.30', 'Anuradhapura District', 'Anuradhapura District', 1),
(21059, 'LK.37.1251460', 'LK', 'LK.37', 'Ampara District', 'Ampara District', 1);

-- --------------------------------------------------------

--
-- Table structure for table `time_zones`
--

CREATE TABLE `time_zones` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `time_zone_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `gmt` double DEFAULT NULL,
  `dst` double DEFAULT NULL,
  `raw` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `time_zones`
--

INSERT INTO `time_zones` (`id`, `country_code`, `time_zone_id`, `gmt`, `dst`, `raw`) VALUES
(1, 'CI', 'Africa/Abidjan', 0, 0, 0),
(2, 'GH', 'Africa/Accra', 0, 0, 0),
(3, 'ET', 'Africa/Addis_Ababa', 3, 3, 3),
(4, 'DZ', 'Africa/Algiers', 1, 1, 1),
(5, 'ER', 'Africa/Asmara', 3, 3, 3),
(6, 'ML', 'Africa/Bamako', 0, 0, 0),
(7, 'CF', 'Africa/Bangui', 1, 1, 1),
(8, 'GM', 'Africa/Banjul', 0, 0, 0),
(9, 'GW', 'Africa/Bissau', 0, 0, 0),
(10, 'MW', 'Africa/Blantyre', 2, 2, 2),
(11, 'CG', 'Africa/Brazzaville', 1, 1, 1),
(12, 'BI', 'Africa/Bujumbura', 2, 2, 2),
(13, 'EG', 'Africa/Cairo', 2, 2, 2),
(14, 'MA', 'Africa/Casablanca', 0, 1, 0),
(15, 'ES', 'Africa/Ceuta', 1, 2, 1),
(16, 'GN', 'Africa/Conakry', 0, 0, 0),
(17, 'SN', 'Africa/Dakar', 0, 0, 0),
(18, 'TZ', 'Africa/Dar_es_Salaam', 3, 3, 3),
(19, 'DJ', 'Africa/Djibouti', 3, 3, 3),
(20, 'CM', 'Africa/Douala', 1, 1, 1),
(21, 'EH', 'Africa/El_Aaiun', 0, 1, 0),
(22, 'SL', 'Africa/Freetown', 0, 0, 0),
(23, 'BW', 'Africa/Gaborone', 2, 2, 2),
(24, 'ZW', 'Africa/Harare', 2, 2, 2),
(25, 'ZA', 'Africa/Johannesburg', 2, 2, 2),
(26, 'SS', 'Africa/Juba', 3, 3, 3),
(27, 'UG', 'Africa/Kampala', 3, 3, 3),
(28, 'SD', 'Africa/Khartoum', 3, 3, 3),
(29, 'RW', 'Africa/Kigali', 2, 2, 2),
(30, 'CD', 'Africa/Kinshasa', 1, 1, 1),
(31, 'NG', 'Africa/Lagos', 1, 1, 1),
(32, 'GA', 'Africa/Libreville', 1, 1, 1),
(33, 'TG', 'Africa/Lome', 0, 0, 0),
(34, 'AO', 'Africa/Luanda', 1, 1, 1),
(35, 'CD', 'Africa/Lubumbashi', 2, 2, 2),
(36, 'ZM', 'Africa/Lusaka', 2, 2, 2),
(37, 'GQ', 'Africa/Malabo', 1, 1, 1),
(38, 'MZ', 'Africa/Maputo', 2, 2, 2),
(39, 'LS', 'Africa/Maseru', 2, 2, 2),
(40, 'SZ', 'Africa/Mbabane', 2, 2, 2),
(41, 'SO', 'Africa/Mogadishu', 3, 3, 3),
(42, 'LR', 'Africa/Monrovia', 0, 0, 0),
(43, 'KE', 'Africa/Nairobi', 3, 3, 3),
(44, 'TD', 'Africa/Ndjamena', 1, 1, 1),
(45, 'NE', 'Africa/Niamey', 1, 1, 1),
(46, 'MR', 'Africa/Nouakchott', 0, 0, 0),
(47, 'BF', 'Africa/Ouagadougou', 0, 0, 0),
(48, 'BJ', 'Africa/Porto-Novo', 1, 1, 1),
(49, 'ST', 'Africa/Sao_Tome', 0, 0, 0),
(50, 'LY', 'Africa/Tripoli', 2, 2, 2),
(51, 'TN', 'Africa/Tunis', 1, 1, 1),
(52, 'NA', 'Africa/Windhoek', 2, 1, 1),
(53, 'US', 'America/Adak', -10, -9, -10),
(54, 'US', 'America/Anchorage', -9, -8, -9),
(55, 'AI', 'America/Anguilla', -4, -4, -4),
(56, 'AG', 'America/Antigua', -4, -4, -4),
(57, 'BR', 'America/Araguaina', -3, -3, -3),
(58, 'AR', 'America/Argentina/Buenos_Aires', -3, -3, -3),
(59, 'AR', 'America/Argentina/Catamarca', -3, -3, -3),
(60, 'AR', 'America/Argentina/Cordoba', -3, -3, -3),
(61, 'AR', 'America/Argentina/Jujuy', -3, -3, -3),
(62, 'AR', 'America/Argentina/La_Rioja', -3, -3, -3),
(63, 'AR', 'America/Argentina/Mendoza', -3, -3, -3),
(64, 'AR', 'America/Argentina/Rio_Gallegos', -3, -3, -3),
(65, 'AR', 'America/Argentina/Salta', -3, -3, -3),
(66, 'AR', 'America/Argentina/San_Juan', -3, -3, -3),
(67, 'AR', 'America/Argentina/San_Luis', -3, -3, -3),
(68, 'AR', 'America/Argentina/Tucuman', -3, -3, -3),
(69, 'AR', 'America/Argentina/Ushuaia', -3, -3, -3),
(70, 'AW', 'America/Aruba', -4, -4, -4),
(71, 'PY', 'America/Asuncion', -3, -4, -4),
(72, 'CA', 'America/Atikokan', -5, -5, -5),
(73, 'BR', 'America/Bahia', -3, -3, -3),
(74, 'MX', 'America/Bahia_Banderas', -6, -5, -6),
(75, 'BB', 'America/Barbados', -4, -4, -4),
(76, 'BR', 'America/Belem', -3, -3, -3),
(77, 'BZ', 'America/Belize', -6, -6, -6),
(78, 'CA', 'America/Blanc-Sablon', -4, -4, -4),
(79, 'BR', 'America/Boa_Vista', -4, -4, -4),
(80, 'CO', 'America/Bogota', -5, -5, -5),
(81, 'US', 'America/Boise', -7, -6, -7),
(82, 'CA', 'America/Cambridge_Bay', -7, -6, -7),
(83, 'BR', 'America/Campo_Grande', -3, -4, -4),
(84, 'MX', 'America/Cancun', -5, -5, -5),
(85, 'VE', 'America/Caracas', -4, -4, -4),
(86, 'GF', 'America/Cayenne', -3, -3, -3),
(87, 'KY', 'America/Cayman', -5, -5, -5),
(88, 'US', 'America/Chicago', -6, -5, -6),
(89, 'MX', 'America/Chihuahua', -7, -6, -7),
(90, 'CR', 'America/Costa_Rica', -6, -6, -6),
(91, 'CA', 'America/Creston', -7, -7, -7),
(92, 'BR', 'America/Cuiaba', -3, -4, -4),
(93, 'CW', 'America/Curacao', -4, -4, -4),
(94, 'GL', 'America/Danmarkshavn', 0, 0, 0),
(95, 'CA', 'America/Dawson', -8, -7, -8),
(96, 'CA', 'America/Dawson_Creek', -7, -7, -7),
(97, 'US', 'America/Denver', -7, -6, -7),
(98, 'US', 'America/Detroit', -5, -4, -5),
(99, 'DM', 'America/Dominica', -4, -4, -4),
(100, 'CA', 'America/Edmonton', -7, -6, -7),
(101, 'BR', 'America/Eirunepe', -5, -5, -5),
(102, 'SV', 'America/El_Salvador', -6, -6, -6),
(103, 'CA', 'America/Fort_Nelson', -7, -7, -7),
(104, 'BR', 'America/Fortaleza', -3, -3, -3),
(105, 'CA', 'America/Glace_Bay', -4, -3, -4),
(106, 'GL', 'America/Godthab', -3, -2, -3),
(107, 'CA', 'America/Goose_Bay', -4, -3, -4),
(108, 'TC', 'America/Grand_Turk', -4, -4, -4),
(109, 'GD', 'America/Grenada', -4, -4, -4),
(110, 'GP', 'America/Guadeloupe', -4, -4, -4),
(111, 'GT', 'America/Guatemala', -6, -6, -6),
(112, 'EC', 'America/Guayaquil', -5, -5, -5),
(113, 'GY', 'America/Guyana', -4, -4, -4),
(114, 'CA', 'America/Halifax', -4, -3, -4),
(115, 'CU', 'America/Havana', -5, -4, -5),
(116, 'MX', 'America/Hermosillo', -7, -7, -7),
(117, 'US', 'America/Indiana/Indianapolis', -5, -4, -5),
(118, 'US', 'America/Indiana/Knox', -6, -5, -6),
(119, 'US', 'America/Indiana/Marengo', -5, -4, -5),
(120, 'US', 'America/Indiana/Petersburg', -5, -4, -5),
(121, 'US', 'America/Indiana/Tell_City', -6, -5, -6),
(122, 'US', 'America/Indiana/Vevay', -5, -4, -5),
(123, 'US', 'America/Indiana/Vincennes', -5, -4, -5),
(124, 'US', 'America/Indiana/Winamac', -5, -4, -5),
(125, 'CA', 'America/Inuvik', -7, -6, -7),
(126, 'CA', 'America/Iqaluit', -5, -4, -5),
(127, 'JM', 'America/Jamaica', -5, -5, -5),
(128, 'US', 'America/Juneau', -9, -8, -9),
(129, 'US', 'America/Kentucky/Louisville', -5, -4, -5),
(130, 'US', 'America/Kentucky/Monticello', -5, -4, -5),
(131, 'BQ', 'America/Kralendijk', -4, -4, -4),
(132, 'BO', 'America/La_Paz', -4, -4, -4),
(133, 'PE', 'America/Lima', -5, -5, -5),
(134, 'US', 'America/Los_Angeles', -8, -7, -8),
(135, 'SX', 'America/Lower_Princes', -4, -4, -4),
(136, 'BR', 'America/Maceio', -3, -3, -3),
(137, 'NI', 'America/Managua', -6, -6, -6),
(138, 'BR', 'America/Manaus', -4, -4, -4),
(139, 'MF', 'America/Marigot', -4, -4, -4),
(140, 'MQ', 'America/Martinique', -4, -4, -4),
(141, 'MX', 'America/Matamoros', -6, -5, -6),
(142, 'MX', 'America/Mazatlan', -7, -6, -7),
(143, 'US', 'America/Menominee', -6, -5, -6),
(144, 'MX', 'America/Merida', -6, -5, -6),
(145, 'US', 'America/Metlakatla', -9, -8, -9),
(146, 'MX', 'America/Mexico_City', -6, -5, -6),
(147, 'PM', 'America/Miquelon', -3, -2, -3),
(148, 'CA', 'America/Moncton', -4, -3, -4),
(149, 'MX', 'America/Monterrey', -6, -5, -6),
(150, 'UY', 'America/Montevideo', -3, -3, -3),
(151, 'MS', 'America/Montserrat', -4, -4, -4),
(152, 'BS', 'America/Nassau', -5, -4, -5),
(153, 'US', 'America/New_York', -5, -4, -5),
(154, 'CA', 'America/Nipigon', -5, -4, -5),
(155, 'US', 'America/Nome', -9, -8, -9),
(156, 'BR', 'America/Noronha', -2, -2, -2),
(157, 'US', 'America/North_Dakota/Beulah', -6, -5, -6),
(158, 'US', 'America/North_Dakota/Center', -6, -5, -6),
(159, 'US', 'America/North_Dakota/New_Salem', -6, -5, -6),
(160, 'MX', 'America/Ojinaga', -7, -6, -7),
(161, 'PA', 'America/Panama', -5, -5, -5),
(162, 'CA', 'America/Pangnirtung', -5, -4, -5),
(163, 'SR', 'America/Paramaribo', -3, -3, -3),
(164, 'US', 'America/Phoenix', -7, -7, -7),
(165, 'HT', 'America/Port-au-Prince', -5, -4, -5),
(166, 'TT', 'America/Port_of_Spain', -4, -4, -4),
(167, 'BR', 'America/Porto_Velho', -4, -4, -4),
(168, 'PR', 'America/Puerto_Rico', -4, -4, -4),
(169, 'CL', 'America/Punta_Arenas', -3, -3, -3),
(170, 'CA', 'America/Rainy_River', -6, -5, -6),
(171, 'CA', 'America/Rankin_Inlet', -6, -5, -6),
(172, 'BR', 'America/Recife', -3, -3, -3),
(173, 'CA', 'America/Regina', -6, -6, -6),
(174, 'CA', 'America/Resolute', -6, -5, -6),
(175, 'BR', 'America/Rio_Branco', -5, -5, -5),
(176, 'BR', 'America/Santarem', -3, -3, -3),
(177, 'CL', 'America/Santiago', -3, -4, -4),
(178, 'DO', 'America/Santo_Domingo', -4, -4, -4),
(179, 'BR', 'America/Sao_Paulo', -2, -3, -3),
(180, 'GL', 'America/Scoresbysund', -1, 0, -1),
(181, 'US', 'America/Sitka', -9, -8, -9),
(182, 'BL', 'America/St_Barthelemy', -4, -4, -4),
(183, 'CA', 'America/St_Johns', -3.5, -2.5, -3.5),
(184, 'KN', 'America/St_Kitts', -4, -4, -4),
(185, 'LC', 'America/St_Lucia', -4, -4, -4),
(186, 'VI', 'America/St_Thomas', -4, -4, -4),
(187, 'VC', 'America/St_Vincent', -4, -4, -4),
(188, 'CA', 'America/Swift_Current', -6, -6, -6),
(189, 'HN', 'America/Tegucigalpa', -6, -6, -6),
(190, 'GL', 'America/Thule', -4, -3, -4),
(191, 'CA', 'America/Thunder_Bay', -5, -4, -5),
(192, 'MX', 'America/Tijuana', -8, -7, -8),
(193, 'CA', 'America/Toronto', -5, -4, -5),
(194, 'VG', 'America/Tortola', -4, -4, -4),
(195, 'CA', 'America/Vancouver', -8, -7, -8),
(196, 'CA', 'America/Whitehorse', -8, -7, -8),
(197, 'CA', 'America/Winnipeg', -6, -5, -6),
(198, 'US', 'America/Yakutat', -9, -8, -9),
(199, 'CA', 'America/Yellowknife', -7, -6, -7),
(200, 'AQ', 'Antarctica/Casey', 11, 11, 11),
(201, 'AQ', 'Antarctica/Davis', 7, 7, 7),
(202, 'AQ', 'Antarctica/DumontDUrville', 10, 10, 10),
(203, 'AU', 'Antarctica/Macquarie', 11, 11, 11),
(204, 'AQ', 'Antarctica/Mawson', 5, 5, 5),
(205, 'AQ', 'Antarctica/McMurdo', 13, 12, 12),
(206, 'AQ', 'Antarctica/Palmer', -3, -3, -3),
(207, 'AQ', 'Antarctica/Rothera', -3, -3, -3),
(208, 'AQ', 'Antarctica/Syowa', 3, 3, 3),
(209, 'AQ', 'Antarctica/Troll', 0, 2, 0),
(210, 'AQ', 'Antarctica/Vostok', 6, 6, 6),
(211, 'SJ', 'Arctic/Longyearbyen', 1, 2, 1),
(212, 'YE', 'Asia/Aden', 3, 3, 3),
(213, 'KZ', 'Asia/Almaty', 6, 6, 6),
(214, 'JO', 'Asia/Amman', 2, 3, 2),
(215, 'RU', 'Asia/Anadyr', 12, 12, 12),
(216, 'KZ', 'Asia/Aqtau', 5, 5, 5),
(217, 'KZ', 'Asia/Aqtobe', 5, 5, 5),
(218, 'TM', 'Asia/Ashgabat', 5, 5, 5),
(219, 'KZ', 'Asia/Atyrau', 5, 5, 5),
(220, 'IQ', 'Asia/Baghdad', 3, 3, 3),
(221, 'BH', 'Asia/Bahrain', 3, 3, 3),
(222, 'AZ', 'Asia/Baku', 4, 4, 4),
(223, 'TH', 'Asia/Bangkok', 7, 7, 7),
(224, 'RU', 'Asia/Barnaul', 7, 7, 7),
(225, 'LB', 'Asia/Beirut', 2, 3, 2),
(226, 'KG', 'Asia/Bishkek', 6, 6, 6),
(227, 'BN', 'Asia/Brunei', 8, 8, 8),
(228, 'RU', 'Asia/Chita', 9, 9, 9),
(229, 'MN', 'Asia/Choibalsan', 8, 8, 8),
(230, 'LK', 'Asia/Colombo', 5.5, 5.5, 5.5),
(231, 'SY', 'Asia/Damascus', 2, 3, 2),
(232, 'BD', 'Asia/Dhaka', 6, 6, 6),
(233, 'TL', 'Asia/Dili', 9, 9, 9),
(234, 'AE', 'Asia/Dubai', 4, 4, 4),
(235, 'TJ', 'Asia/Dushanbe', 5, 5, 5),
(236, 'CY', 'Asia/Famagusta', 3, 3, 3),
(237, 'PS', 'Asia/Gaza', 2, 3, 2),
(238, 'PS', 'Asia/Hebron', 2, 3, 2),
(239, 'VN', 'Asia/Ho_Chi_Minh', 7, 7, 7),
(240, 'HK', 'Asia/Hong_Kong', 8, 8, 8),
(241, 'MN', 'Asia/Hovd', 7, 7, 7),
(242, 'RU', 'Asia/Irkutsk', 8, 8, 8),
(243, 'ID', 'Asia/Jakarta', 7, 7, 7),
(244, 'ID', 'Asia/Jayapura', 9, 9, 9),
(245, 'IL', 'Asia/Jerusalem', 2, 3, 2),
(246, 'AF', 'Asia/Kabul', 4.5, 4.5, 4.5),
(247, 'RU', 'Asia/Kamchatka', 12, 12, 12),
(248, 'PK', 'Asia/Karachi', 5, 5, 5),
(249, 'NP', 'Asia/Kathmandu', 5.75, 5.75, 5.75),
(250, 'RU', 'Asia/Khandyga', 9, 9, 9),
(251, 'IN', 'Asia/Kolkata', 5.5, 5.5, 5.5),
(252, 'RU', 'Asia/Krasnoyarsk', 7, 7, 7),
(253, 'MY', 'Asia/Kuala_Lumpur', 8, 8, 8),
(254, 'MY', 'Asia/Kuching', 8, 8, 8),
(255, 'KW', 'Asia/Kuwait', 3, 3, 3),
(256, 'MO', 'Asia/Macau', 8, 8, 8),
(257, 'RU', 'Asia/Magadan', 11, 11, 11),
(258, 'ID', 'Asia/Makassar', 8, 8, 8),
(259, 'PH', 'Asia/Manila', 8, 8, 8),
(260, 'OM', 'Asia/Muscat', 4, 4, 4),
(261, 'CY', 'Asia/Nicosia', 2, 3, 2),
(262, 'RU', 'Asia/Novokuznetsk', 7, 7, 7),
(263, 'RU', 'Asia/Novosibirsk', 7, 7, 7),
(264, 'RU', 'Asia/Omsk', 6, 6, 6),
(265, 'KZ', 'Asia/Oral', 5, 5, 5),
(266, 'KH', 'Asia/Phnom_Penh', 7, 7, 7),
(267, 'ID', 'Asia/Pontianak', 7, 7, 7),
(268, 'KP', 'Asia/Pyongyang', 8.5, 8.5, 8.5),
(269, 'QA', 'Asia/Qatar', 3, 3, 3),
(270, 'KZ', 'Asia/Qyzylorda', 6, 6, 6),
(271, 'SA', 'Asia/Riyadh', 3, 3, 3),
(272, 'RU', 'Asia/Sakhalin', 11, 11, 11),
(273, 'UZ', 'Asia/Samarkand', 5, 5, 5),
(274, 'KR', 'Asia/Seoul', 9, 9, 9),
(275, 'CN', 'Asia/Shanghai', 8, 8, 8),
(276, 'SG', 'Asia/Singapore', 8, 8, 8),
(277, 'RU', 'Asia/Srednekolymsk', 11, 11, 11),
(278, 'TW', 'Asia/Taipei', 8, 8, 8),
(279, 'UZ', 'Asia/Tashkent', 5, 5, 5),
(280, 'GE', 'Asia/Tbilisi', 4, 4, 4),
(281, 'IR', 'Asia/Tehran', 3.5, 4.5, 3.5),
(282, 'BT', 'Asia/Thimphu', 6, 6, 6),
(283, 'JP', 'Asia/Tokyo', 9, 9, 9),
(284, 'RU', 'Asia/Tomsk', 7, 7, 7),
(285, 'MN', 'Asia/Ulaanbaatar', 8, 8, 8),
(286, 'CN', 'Asia/Urumqi', 6, 6, 6),
(287, 'RU', 'Asia/Ust-Nera', 10, 10, 10),
(288, 'LA', 'Asia/Vientiane', 7, 7, 7),
(289, 'RU', 'Asia/Vladivostok', 10, 10, 10),
(290, 'RU', 'Asia/Yakutsk', 9, 9, 9),
(291, 'MM', 'Asia/Yangon', 6.5, 6.5, 6.5),
(292, 'RU', 'Asia/Yekaterinburg', 5, 5, 5),
(293, 'AM', 'Asia/Yerevan', 4, 4, 4),
(294, 'PT', 'Atlantic/Azores', -1, 0, -1),
(295, 'BM', 'Atlantic/Bermuda', -4, -3, -4),
(296, 'ES', 'Atlantic/Canary', 0, 1, 0),
(297, 'CV', 'Atlantic/Cape_Verde', -1, -1, -1),
(298, 'FO', 'Atlantic/Faroe', 0, 1, 0),
(299, 'PT', 'Atlantic/Madeira', 0, 1, 0),
(300, 'IS', 'Atlantic/Reykjavik', 0, 0, 0),
(301, 'GS', 'Atlantic/South_Georgia', -2, -2, -2),
(302, 'SH', 'Atlantic/St_Helena', 0, 0, 0),
(303, 'FK', 'Atlantic/Stanley', -3, -3, -3),
(304, 'AU', 'Australia/Adelaide', 10.5, 9.5, 9.5),
(305, 'AU', 'Australia/Brisbane', 10, 10, 10),
(306, 'AU', 'Australia/Broken_Hill', 10.5, 9.5, 9.5),
(307, 'AU', 'Australia/Currie', 11, 10, 10),
(308, 'AU', 'Australia/Darwin', 9.5, 9.5, 9.5),
(309, 'AU', 'Australia/Eucla', 8.75, 8.75, 8.75),
(310, 'AU', 'Australia/Hobart', 11, 10, 10),
(311, 'AU', 'Australia/Lindeman', 10, 10, 10),
(312, 'AU', 'Australia/Lord_Howe', 11, 10.5, 10.5),
(313, 'AU', 'Australia/Melbourne', 11, 10, 10),
(314, 'AU', 'Australia/Perth', 8, 8, 8),
(315, 'AU', 'Australia/Sydney', 11, 10, 10),
(316, 'NL', 'Europe/Amsterdam', 1, 2, 1),
(317, 'AD', 'Europe/Andorra', 1, 2, 1),
(318, 'RU', 'Europe/Astrakhan', 4, 4, 4),
(319, 'GR', 'Europe/Athens', 2, 3, 2),
(320, 'RS', 'Europe/Belgrade', 1, 2, 1),
(321, 'DE', 'Europe/Berlin', 1, 2, 1),
(322, 'SK', 'Europe/Bratislava', 1, 2, 1),
(323, 'BE', 'Europe/Brussels', 1, 2, 1),
(324, 'RO', 'Europe/Bucharest', 2, 3, 2),
(325, 'HU', 'Europe/Budapest', 1, 2, 1),
(326, 'DE', 'Europe/Busingen', 1, 2, 1),
(327, 'MD', 'Europe/Chisinau', 2, 3, 2),
(328, 'DK', 'Europe/Copenhagen', 1, 2, 1),
(329, 'IE', 'Europe/Dublin', 0, 1, 0),
(330, 'GI', 'Europe/Gibraltar', 1, 2, 1),
(331, 'GG', 'Europe/Guernsey', 0, 1, 0),
(332, 'FI', 'Europe/Helsinki', 2, 3, 2),
(333, 'IM', 'Europe/Isle_of_Man', 0, 1, 0),
(334, 'TR', 'Europe/Istanbul', 3, 3, 3),
(335, 'JE', 'Europe/Jersey', 0, 1, 0),
(336, 'RU', 'Europe/Kaliningrad', 2, 2, 2),
(337, 'UA', 'Europe/Kiev', 2, 3, 2),
(338, 'RU', 'Europe/Kirov', 3, 3, 3),
(339, 'PT', 'Europe/Lisbon', 0, 1, 0),
(340, 'SI', 'Europe/Ljubljana', 1, 2, 1),
(341, 'UK', 'Europe/London', 0, 1, 0),
(342, 'LU', 'Europe/Luxembourg', 1, 2, 1),
(343, 'ES', 'Europe/Madrid', 1, 2, 1),
(344, 'MT', 'Europe/Malta', 1, 2, 1),
(345, 'AX', 'Europe/Mariehamn', 2, 3, 2),
(346, 'BY', 'Europe/Minsk', 3, 3, 3),
(347, 'MC', 'Europe/Monaco', 1, 2, 1),
(348, 'RU', 'Europe/Moscow', 3, 3, 3),
(349, 'NO', 'Europe/Oslo', 1, 2, 1),
(350, 'FR', 'Europe/Paris', 1, 2, 1),
(351, 'ME', 'Europe/Podgorica', 1, 2, 1),
(352, 'CZ', 'Europe/Prague', 1, 2, 1),
(353, 'LV', 'Europe/Riga', 2, 3, 2),
(354, 'IT', 'Europe/Rome', 1, 2, 1),
(355, 'RU', 'Europe/Samara', 4, 4, 4),
(356, 'SM', 'Europe/San_Marino', 1, 2, 1),
(357, 'BA', 'Europe/Sarajevo', 1, 2, 1),
(358, 'RU', 'Europe/Saratov', 4, 4, 4),
(359, 'RU', 'Europe/Simferopol', 3, 3, 3),
(360, 'MK', 'Europe/Skopje', 1, 2, 1),
(361, 'BG', 'Europe/Sofia', 2, 3, 2),
(362, 'SE', 'Europe/Stockholm', 1, 2, 1),
(363, 'EE', 'Europe/Tallinn', 2, 3, 2),
(364, 'AL', 'Europe/Tirane', 1, 2, 1),
(365, 'RU', 'Europe/Ulyanovsk', 4, 4, 4),
(366, 'UA', 'Europe/Uzhgorod', 2, 3, 2),
(367, 'LI', 'Europe/Vaduz', 1, 2, 1),
(368, 'VA', 'Europe/Vatican', 1, 2, 1),
(369, 'AT', 'Europe/Vienna', 1, 2, 1),
(370, 'LT', 'Europe/Vilnius', 2, 3, 2),
(371, 'RU', 'Europe/Volgograd', 3, 3, 3),
(372, 'PL', 'Europe/Warsaw', 1, 2, 1),
(373, 'HR', 'Europe/Zagreb', 1, 2, 1),
(374, 'UA', 'Europe/Zaporozhye', 2, 3, 2),
(375, 'CH', 'Europe/Zurich', 1, 2, 1),
(376, 'MG', 'Indian/Antananarivo', 3, 3, 3),
(377, 'IO', 'Indian/Chagos', 6, 6, 6),
(378, 'CX', 'Indian/Christmas', 7, 7, 7),
(379, 'CC', 'Indian/Cocos', 6.5, 6.5, 6.5),
(380, 'KM', 'Indian/Comoro', 3, 3, 3),
(381, 'TF', 'Indian/Kerguelen', 5, 5, 5),
(382, 'SC', 'Indian/Mahe', 4, 4, 4),
(383, 'MV', 'Indian/Maldives', 5, 5, 5),
(384, 'MU', 'Indian/Mauritius', 4, 4, 4),
(385, 'YT', 'Indian/Mayotte', 3, 3, 3),
(386, 'RE', 'Indian/Reunion', 4, 4, 4),
(387, 'WS', 'Pacific/Apia', 14, 13, 13),
(388, 'NZ', 'Pacific/Auckland', 13, 12, 12),
(389, 'PG', 'Pacific/Bougainville', 11, 11, 11),
(390, 'NZ', 'Pacific/Chatham', 13.75, 12.75, 12.75),
(391, 'FM', 'Pacific/Chuuk', 10, 10, 10),
(392, 'CL', 'Pacific/Easter', -5, -6, -6),
(393, 'VU', 'Pacific/Efate', 11, 11, 11),
(394, 'KI', 'Pacific/Enderbury', 13, 13, 13),
(395, 'TK', 'Pacific/Fakaofo', 13, 13, 13),
(396, 'FJ', 'Pacific/Fiji', 13, 12, 12),
(397, 'TV', 'Pacific/Funafuti', 12, 12, 12),
(398, 'EC', 'Pacific/Galapagos', -6, -6, -6),
(399, 'PF', 'Pacific/Gambier', -9, -9, -9),
(400, 'SB', 'Pacific/Guadalcanal', 11, 11, 11),
(401, 'GU', 'Pacific/Guam', 10, 10, 10),
(402, 'US', 'Pacific/Honolulu', -10, -10, -10),
(403, 'KI', 'Pacific/Kiritimati', 14, 14, 14),
(404, 'FM', 'Pacific/Kosrae', 11, 11, 11),
(405, 'MH', 'Pacific/Kwajalein', 12, 12, 12),
(406, 'MH', 'Pacific/Majuro', 12, 12, 12),
(407, 'PF', 'Pacific/Marquesas', -9.5, -9.5, -9.5),
(408, 'UM', 'Pacific/Midway', -11, -11, -11),
(409, 'NR', 'Pacific/Nauru', 12, 12, 12),
(410, 'NU', 'Pacific/Niue', -11, -11, -11),
(411, 'NF', 'Pacific/Norfolk', 11, 11, 11),
(412, 'NC', 'Pacific/Noumea', 11, 11, 11),
(413, 'AS', 'Pacific/Pago_Pago', -11, -11, -11),
(414, 'PW', 'Pacific/Palau', 9, 9, 9),
(415, 'PN', 'Pacific/Pitcairn', -8, -8, -8),
(416, 'FM', 'Pacific/Pohnpei', 11, 11, 11),
(417, 'PG', 'Pacific/Port_Moresby', 10, 10, 10),
(418, 'CK', 'Pacific/Rarotonga', -10, -10, -10),
(419, 'MP', 'Pacific/Saipan', 10, 10, 10),
(420, 'PF', 'Pacific/Tahiti', -10, -10, -10),
(421, 'KI', 'Pacific/Tarawa', 12, 12, 12),
(422, 'TO', 'Pacific/Tongatapu', 14, 13, 13),
(423, 'UM', 'Pacific/Wake', 12, 12, 12),
(424, 'WF', 'Pacific/Wallis', 12, 12, 12);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type_id` int(10) UNSIGNED DEFAULT NULL,
  `gender_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_hidden` tinyint(1) UNSIGNED DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) UNSIGNED DEFAULT '0',
  `can_be_impersonated` tinyint(1) UNSIGNED DEFAULT '1',
  `disable_comments` tinyint(1) UNSIGNED DEFAULT '0',
  `receive_newsletter` tinyint(1) UNSIGNED DEFAULT '1',
  `receive_advice` tinyint(1) UNSIGNED DEFAULT '1',
  `ip_addr` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_id` int(10) UNSIGNED DEFAULT NULL,
  `email_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified_email` tinyint(1) UNSIGNED DEFAULT '1',
  `verified_phone` tinyint(1) UNSIGNED DEFAULT '0',
  `blocked` tinyint(1) UNSIGNED DEFAULT '0',
  `closed` tinyint(1) UNSIGNED DEFAULT '0',
  `last_login_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `age` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qualifications` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `experience` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salary` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skills` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extra_educations` longtext COLLATE utf8_unicode_ci,
  `extra_skills` longtext COLLATE utf8_unicode_ci,
  `extra_experiences` longtext COLLATE utf8_unicode_ci,
  `sector_id` int(10) UNSIGNED DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_me` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `country_code`, `language_code`, `user_type_id`, `gender_id`, `name`, `photo`, `about`, `phone`, `phone_hidden`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `is_admin`, `can_be_impersonated`, `disable_comments`, `receive_newsletter`, `receive_advice`, `ip_addr`, `provider`, `provider_id`, `email_token`, `phone_token`, `verified_email`, `verified_phone`, `blocked`, `closed`, `last_login_at`, `created_at`, `updated_at`, `deleted_at`, `age`, `gender`, `location`, `qualifications`, `experience`, `salary`, `skills`, `extra_educations`, `extra_skills`, `extra_experiences`, `sector_id`, `avatar_url`, `about_me`) VALUES
(1, 'LK', NULL, 1, 1, 'John Doe', NULL, 'Administrator', '0123456789', NULL, 'John', 'admin@mail.com', NULL, '$2y$10$iHYdMIudBv1IvI52FaOvU.5Z8dkBu5cuCPoncI4RW7T40swH/9rae', NULL, NULL, 1, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, '2021-01-26 08:45:40', NULL, '2021-01-26 15:45:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'avatars/UQYrWSYEiZb7W4Apka7WtEpnCzHKHJRXORiusDEh.png', NULL),
(2, 'LK', 'en', 2, 1, 'John Doe', NULL, NULL, '+94542100655', NULL, 'mnmlm', 'johndoe@gmail.com', NULL, '$2y$10$cY12gHLfXpXshZTRXs9mK.8gmVMVOMlUJhlaaAB.D35CLnszeSB/S', NULL, 1, 1, 0, 1, 1, '127.0.0.1', NULL, NULL, NULL, NULL, 1, 1, 0, 0, '2021-01-26 12:30:29', '2020-11-13 05:28:10', '2021-01-26 19:30:29', NULL, '30', 'male', 'Ragama', 'Testing qualification', '1y', '30000', 'php', '{\"start_date\":[\"2011-04-08\",\"2021-01-19\"],\"end_date\":[\"2021-01-13\",null],\"title\":[\"higher education boards\",\"+2\"],\"description\":[\"Hss\",\"HSS\"]}', '{\"start_date\":[\"2021-01-05\",\"2020-11-01\"],\"end_date\":[null,null],\"title\":[\"Basic Computer\",\"DCA\"],\"description\":[\"basic computer,excel,pw,word,ms-paint,ms-access,\",\"Diploma in software engineer\"]}', '{\"start_date\":[\"2020-09-01\"],\"end_date\":[\"2021-01-05\"],\"title\":[\"Software technicians\"],\"description\":[\"i have done,technical work there.\\r\\n\\r\\nelitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam\\r\\n\\r\\nelitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam\\r\\n\\r\\nelitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam\"]}', 21, 'avatars/u94MzRw7gRbBeJIP2ULxB8QOhtHQisViAInG6YCX.png', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.'),
(5, 'LK', 'en', 2, NULL, 'Gayathri', NULL, NULL, '+94773973970', NULL, NULL, 'gaya_2511@yahoo.com', NULL, '$2y$10$k68CMXixmsOstmJPemcjUOfPirEJNHP9Nm2zT8ZWrcJwomfYilF3a', NULL, 0, 1, 0, 1, 1, '112.134.9.113', NULL, NULL, NULL, NULL, 1, 1, 0, 0, '2020-11-16 23:45:06', '2020-11-17 04:43:21', '2020-11-17 04:45:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'LK', 'en', 2, 1, 'Zakib Rizan', NULL, NULL, '+94778941243', NULL, 'zakibrizan', 'jobs.zrirecruitment@gmail.com', NULL, '$2y$10$N3JIBc1OYo65IC9jAhFMJ.Ysr3nKwAWkkNj.rQvWDq6/6j8uAQSRS', NULL, 0, 1, 0, 1, 1, '123.231.86.252', NULL, NULL, NULL, NULL, 1, 1, 0, 0, '2021-01-26 12:39:37', '2020-11-17 22:30:06', '2021-01-26 19:39:37', NULL, '18', 'male', 'Colombo', 'Education\r\nDegree', '2y', '40000', 'IT, Hardware', '{\"start_date\":[\"2020-12-02\"],\"end_date\":[\"2021-01-22\"],\"title\":[\"Accounting and Finance\"],\"description\":[\"First class\"]}', '{\"start_date\":[\"2020-12-09\"],\"end_date\":[\"2021-01-21\"],\"title\":[\"k;kn\"],\"description\":[\"lknlk\"]}', '{\"start_date\":[\"2021-01-20\"],\"end_date\":[\"2021-01-21\"],\"title\":[\"Accountant\"],\"description\":[\"Search Jobs\"]}', 30, 'avatars/97Gh9Xa1KjrZbq4UmupKaH44mKfjakFIUYoFCWhk.png', 'I am a hard working person'),
(7, 'LK', 'en', 1, NULL, 'Zakib Rizan', NULL, NULL, '+94728941243', NULL, NULL, 'zrirecruitment@gmail.com', NULL, '$2y$10$PY46oKRilGdrtzfkSQlE0OreNlRziff8vm.rI.BaQFKePbnkx/7wq', NULL, 0, 1, 0, 1, 1, '123.231.86.252', NULL, NULL, NULL, NULL, 1, 1, 0, 0, '2021-01-26 12:36:33', '2020-11-17 22:32:29', '2021-01-26 19:36:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'LK', 'en', 1, NULL, 'Darth Vadar', NULL, NULL, '1234567890', 1, NULL, 'vadar@gmail.com', NULL, '$2y$10$MwI/NKpAc22c5pM3Fq/CbeopnHs1tU4rzKTNeR2PVJgBUXVVcOUGm', NULL, 0, 1, 0, 1, 1, '102.176.65.11', NULL, NULL, NULL, NULL, 1, 1, 0, 0, '2020-12-01 22:56:22', '2020-11-22 11:27:37', '2020-12-02 03:56:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'LK', 'en', 2, NULL, 'Wytiner', NULL, NULL, NULL, NULL, NULL, 'froomzim@gmail.com', NULL, '$2y$10$sx8QqCXSBk.uQADg8KZ1HeAUPjuLHtKzJ4hH0aDqdULhLRgGRV0wC', NULL, 0, 1, 0, 1, 1, '186.251.224.143', NULL, NULL, '3d3d37444c38d476a178b61dad4dacd4', NULL, 0, 1, 0, 0, NULL, '2020-11-29 03:46:48', '2020-11-29 03:46:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'LK', 'en', 1, NULL, 'Jeewaka Sanka Fernando', NULL, NULL, '+94777066311', NULL, NULL, 'jefferdomd@gmail.com', NULL, '$2y$10$Vlb6YYkf6WZMDTbfvXOkieXWrNT4c2ztq6xhONPBpv5LsCA9irLGy', NULL, 0, 1, 0, 1, 1, '124.43.85.229', NULL, NULL, '38f18f7f8c1808391ed17bc7ee96b3b5', NULL, 0, 1, 0, 0, NULL, '2020-11-30 21:08:43', '2020-11-30 21:08:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'LK', 'en', 2, 1, 'GAYATHRI', NULL, NULL, '+94777816191', 0, NULL, 'gayathri@adage.lk', NULL, '$2y$10$ZmcJlkqT3E8nbQw7bwXdtO1cWpHu0rUBXUzuZVfhtMd.NKw8rULsC', NULL, NULL, 1, 0, 1, 1, '113.59.194.43', NULL, NULL, 'c671413edd650127a421f801df69ccdf', NULL, 1, 1, 0, 0, '2020-12-02 12:24:36', '2020-12-02 13:30:14', '2020-12-02 17:24:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'LK', 'en', 2, 1, 'Smith', NULL, NULL, '07777777', 0, NULL, 'smith@email.com', NULL, '$2y$10$RPULXqq/Miu7umaMvTXGGe0WMB9F/am94IX5BIaS4kXFp7p15KK3a', NULL, NULL, 1, 0, 1, 1, '123.231.127.217', NULL, NULL, '1f9671c503100a01a7eb39b454f04454', NULL, 1, 1, 0, 0, '2020-12-03 04:28:29', '2020-12-02 15:53:07', '2020-12-03 09:28:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'LK', 'en', 2, 1, 'Shaaz', NULL, NULL, '+94778212117', 0, NULL, 'shafrazmohamed444@gmail.com', NULL, '$2y$10$CKFahRr5/2Di1EaMaCJi/e4AnNtYP9S9hPetikFM9EkG7KwvLrady', NULL, NULL, 1, 0, 1, 1, '123.231.127.217', NULL, NULL, 'a1a6d05281bf9697ed9dcf6867cf6cbd', NULL, 1, 1, 0, 0, '2020-12-03 03:47:53', '2020-12-03 08:42:26', '2020-12-03 08:47:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'LK', 'en', 1, 1, 'Abc', NULL, NULL, '+94776543126', 0, NULL, 'b@email.com', NULL, '$2y$10$AXfxYVmwJl/OdvIE/US8BOtO3YjhUj/QRJktaBu0M6xKDOxXxcvp6', NULL, NULL, 1, 0, 1, 1, '123.231.127.217', NULL, NULL, '5fcfa5dce6bacd6fc1f15eff950b83e9', NULL, 1, 1, 0, 0, '2020-12-03 08:18:11', '2020-12-03 09:17:07', '2020-12-03 13:18:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'LK', 'en', 1, NULL, 'Sathiyaraj', NULL, NULL, '+94773973070', NULL, NULL, 'sathiuarajarulampalam123@gmail.com', NULL, '$2y$10$G1pFcHmDi1OQkojYHv7oDeo7ENpFwDuwMRaA/pETJg8WL09Jg7uEq', NULL, 0, 1, 0, 1, 1, '112.134.13.60', NULL, NULL, '180e26543414af878300a173bdae5835', NULL, 0, 1, 0, 0, NULL, '2020-12-18 15:17:20', '2020-12-18 15:17:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'LK', 'en', 2, NULL, 'praveen', NULL, NULL, '+94775895666', NULL, NULL, 'praveenvijayaretna@gmail.com', NULL, '$2y$10$RFolCyrEmEe5Gr4i2SX7kuNaAs3AaZvXeLJ0E16eShIuFMcKdhNky', NULL, 0, 1, 0, 1, 1, '112.134.14.126', NULL, NULL, '234544e0f6cf4a2404ad83771a55191b', NULL, 0, 1, 0, 0, NULL, '2020-12-19 11:28:52', '2020-12-19 11:28:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'LK', 'en', 1, NULL, 'Adage Digital', NULL, NULL, '+94112540738', NULL, NULL, 'digitalmarketing@adage.lk', NULL, '$2y$10$O13i2SivS5R5K.5F5vWoR.Nrb46BI9DpdLjG2N7vGt3Z24HoE4MJ2', NULL, 0, 1, 0, 1, 1, '112.134.14.247', NULL, NULL, '306926bb12f5507da3c9524eb42c187c', NULL, 1, 1, 0, 0, '2020-12-27 11:39:48', '2020-12-27 16:38:59', '2020-12-27 16:39:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'LK', 'en', 2, NULL, 'Thevanath Sivakumar', NULL, NULL, '2132656', NULL, NULL, 'thevanathsivakumar@gmail.com', NULL, '$2y$10$1/E30/dGzGzG6dGOkXrKj.1wOAWygP5d5p4GN6nI4CKke1iXkE5eq', NULL, 0, 1, 0, 1, 1, '112.134.14.247', NULL, NULL, '23573a063326964d5831ee09fa7b645a', NULL, 1, 1, 0, 0, '2020-12-27 13:09:07', '2020-12-27 18:06:46', '2020-12-27 18:16:16', NULL, '23', 'male', 'colombo', 'degree in business management', '6m', '20000', 'graphics, multimedia', '{\"start_date\":[\"1998-02-01\"],\"title\":[\"ol\"],\"description\":[\"gce\"]}', '{\"start_date\":[\"2020-01-12\"],\"title\":[\"degree\"],\"description\":[\"business\"]}', NULL, 16, NULL, NULL),
(31, 'LK', 'en', 1, NULL, 'xcelron', NULL, NULL, '+94772502545', NULL, NULL, 'jackshanan95@gmail.com', NULL, '$2y$10$cc8gGapK94KN6OGkYvqdcuVnG.dI5Whzn19lhZm58OvXmYSJL2U0q', NULL, 0, 1, 0, 1, 1, '112.134.245.152', NULL, NULL, '0addccc59829c858a016f1fa24769bec', NULL, 1, 1, 0, 0, '2020-12-29 18:37:28', '2020-12-27 19:07:01', '2020-12-29 23:37:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'LK', 'en', 1, NULL, 'roger stone', NULL, NULL, NULL, NULL, NULL, 'rogerstone@gmail.com', NULL, '$2y$10$VRDgUyr0w7OBycO/Zt2VD.vpQ1BvEjJ1QLkAZStrCiS8SqZsBZ6xe', NULL, 0, 1, 0, 1, 1, '102.176.65.82', NULL, NULL, 'e7a9bd0c0cf31ae72b37624e0e6cc49c', NULL, 1, 1, 0, 0, NULL, '2021-01-05 22:39:41', '2021-01-05 22:39:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'LK', 'en', 2, NULL, 'Joe Smith', NULL, NULL, NULL, NULL, NULL, 'joesmith@example.com', NULL, '$2y$10$MOz//UmjjkO6uSxePYASFO8uniXc/IqLrBcno/3Rvzas4SSAHxVhq', NULL, 0, 1, 0, 1, 1, '123.231.122.216', NULL, NULL, '83a7479af796abcede8fbf0a9cb40123', NULL, 1, 1, 0, 0, '2021-01-11 08:32:47', '2021-01-11 15:31:35', '2021-01-11 15:32:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'LK', 'en', 1, 1, 'Shaaz', NULL, NULL, '+94776512342', 1, 'allexinternational', 'shaaz@shaaz.com', NULL, '$2y$10$9ZJ4mgiDh3Z41O.WGkS1FeH5ORe.ND67By/8NgekODw/YS1xqpRHe', NULL, 1, 1, 0, 1, 1, '116.206.247.150', NULL, NULL, '4e20ff480c0d860b1207b6096ea194aa', NULL, 1, 1, 0, 0, '2021-01-23 18:20:17', '2021-01-13 17:46:16', '2021-01-24 01:20:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'avatars/rEmxDfxQrvvQ4oWvxGkWXbhpzV4ngDnDm5KW7wZz.png', NULL),
(39, 'LK', 'en', 2, 1, 'Shaaz2', NULL, NULL, '+94776512341', 1, 'Shafraz', 'shaaz2@shaaz2.com', NULL, '$2y$10$LEk4xgWucP8llrGU0YLddOwnUgfz2GWAzx2DBwDtvqojWnOtUWCY6', NULL, 0, 1, 0, 1, 1, '175.157.40.215', NULL, NULL, '3471066396cb8447cf472d47cf2173ba', NULL, 1, 1, 0, 0, '2021-01-21 11:44:49', '2021-01-14 16:09:54', '2021-01-21 18:44:49', NULL, '24', 'male', 'colombo', 'Beng', '1y', '10000', 'software', '{\"start_date\":[\"2016-09-20\"],\"end_date\":[\"2021-01-08\"],\"title\":[\"ABC College\"],\"description\":[\"Software Dev\"]}', '{\"start_date\":[\"2001-01-01\"],\"end_date\":[\"2016-01-01\"],\"title\":[\"school\"],\"description\":[\"123\"]}', '{\"start_date\":[\"2019-01-01\"],\"end_date\":[\"2020-01-01\"],\"title\":[\"school\"],\"description\":[\"school\"]}', 31, 'avatars/NKiWeLLXMHVy08dbjQuhR5jqfi0uRLlFc6gCqlJN.jpeg', 'Im a software engineering graduate student at Informatics institute of technology. Looking to obtain Software Developer \'s place in a fast-paced tech world to use excellently-honed software engineering expertise and experience working in designing custom applications based on varying client needs.'),
(41, 'LK', 'en', 2, NULL, 'raj', NULL, NULL, '+94773624880', NULL, NULL, 'suntharansnr@gmail.com', NULL, '$2y$10$zeATTp.w.WFhdsMZta.9heBQQ3vJy.Ppgan0iC8qbMlxSeb1Y7gom', NULL, 0, 1, 0, 1, 1, '112.135.43.89', NULL, NULL, 'ff7a62ca92d40dfc3da837c3426d3685', NULL, 1, 1, 0, 0, NULL, '2021-01-24 18:24:52', '2021-01-24 18:24:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `name`, `active`) VALUES
(1, 'Employer', 1),
(2, 'Job seeker', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertising`
--
ALTER TABLE `advertising`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `applicants`
--
ALTER TABLE `applicants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`entry`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `name` (`name`),
  ADD KEY `subadmin1_code` (`subadmin1_code`),
  ADD KEY `subadmin2_code` (`subadmin2_code`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `company_followers`
--
ALTER TABLE `company_followers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `continents`
--
ALTER TABLE `continents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `endorsements`
--
ALTER TABLE `endorsements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`);

--
-- Indexes for table `hireds`
--
ALTER TABLE `hireds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_sections`
--
ALTER TABLE `home_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `job_alerts`
--
ALTER TABLE `job_alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `abbr` (`abbr`),
  ADD KEY `active` (`active`),
  ADD KEY `default` (`default`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `from_user_id` (`from_user_id`),
  ADD KEY `to_user_id` (`to_user_id`),
  ADD KEY `deleted_by` (`deleted_by`);

--
-- Indexes for table `meta_tags`
--
ALTER TABLE `meta_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_method_id` (`payment_method_id`),
  ADD KEY `package_id` (`package_id`) USING BTREE,
  ADD KEY `post_id` (`post_id`),
  ADD KEY `active` (`active`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `has_ccbox` (`has_ccbox`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lat` (`lon`,`lat`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `title` (`title`),
  ADD KEY `contact_name` (`contact_name`),
  ADD KEY `address` (`address`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `active` (`verified_email`),
  ADD KEY `reviewed` (`reviewed`),
  ADD KEY `salary` (`salary_min`,`salary_max`),
  ADD KEY `featured` (`featured`),
  ADD KEY `post_type_id` (`post_type_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `tags` (`tags`);

--
-- Indexes for table `post_types`
--
ALTER TABLE `post_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `report_types`
--
ALTER TABLE `report_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`);

--
-- Indexes for table `resumes`
--
ALTER TABLE `resumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `salary_types`
--
ALTER TABLE `salary_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `saved_candidates`
--
ALTER TABLE `saved_candidates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `candidate_id` (`candidate_id`) USING BTREE;

--
-- Indexes for table `saved_posts`
--
ALTER TABLE `saved_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `saved_search`
--
ALTER TABLE `saved_search`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `country_code` (`country_code`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `key` (`key`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `subadmin1`
--
ALTER TABLE `subadmin1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `name` (`name`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `subadmin2`
--
ALTER TABLE `subadmin2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `subadmin1_code` (`subadmin1_code`),
  ADD KEY `name` (`name`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `time_zones`
--
ALTER TABLE `time_zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `time_zone_id` (`time_zone_id`),
  ADD KEY `country_code` (`country_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `user_type_id` (`user_type_id`),
  ADD KEY `gender_id` (`gender_id`),
  ADD KEY `phone` (`phone`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`),
  ADD KEY `verified_email` (`verified_email`),
  ADD KEY `verified_phone` (`verified_phone`),
  ADD KEY `is_admin` (`is_admin`),
  ADD KEY `can_be_impersonated` (`can_be_impersonated`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertising`
--
ALTER TABLE `advertising`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `applicants`
--
ALTER TABLE `applicants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blacklist`
--
ALTER TABLE `blacklist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `company_followers`
--
ALTER TABLE `company_followers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `continents`
--
ALTER TABLE `continents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `endorsements`
--
ALTER TABLE `endorsements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hireds`
--
ALTER TABLE `hireds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_sections`
--
ALTER TABLE `home_sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `job_alerts`
--
ALTER TABLE `job_alerts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `meta_tags`
--
ALTER TABLE `meta_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `post_types`
--
ALTER TABLE `post_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `report_types`
--
ALTER TABLE `report_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `resumes`
--
ALTER TABLE `resumes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `salary_types`
--
ALTER TABLE `salary_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `saved_candidates`
--
ALTER TABLE `saved_candidates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `saved_posts`
--
ALTER TABLE `saved_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `saved_search`
--
ALTER TABLE `saved_search`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `subadmin1`
--
ALTER TABLE `subadmin1`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1726;

--
-- AUTO_INCREMENT for table `subadmin2`
--
ALTER TABLE `subadmin2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21060;

--
-- AUTO_INCREMENT for table `time_zones`
--
ALTER TABLE `time_zones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
