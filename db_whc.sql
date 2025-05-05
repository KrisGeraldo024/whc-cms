-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 05, 2025 at 02:01 PM
-- Server version: 8.0.34
-- PHP Version: 8.1.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_whc`
--

-- --------------------------------------------------------

--
-- Table structure for table `accordions`
--

CREATE TABLE `accordions` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `order` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL,
  `enabled` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` timestamp NOT NULL,
  `keyword` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL,
  `enabled` tinyint NOT NULL DEFAULT '1',
  `featured` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `category_id`, `title`, `content`, `date`, `keyword`, `slug`, `order`, `enabled`, `featured`, `created_at`, `updated_at`, `deleted_at`) VALUES
('9f3df741-9aaa-470c-839b-460f65faaa21', '34256fb1-e45a-43f4-980b-eae60bbdaafd', 'yuvl', '<p>84878</p>', '2025-04-16 16:00:00', 'yuvl,yuvl,yuvl,hgttgcg,hgttgcg,hgttgcg', 'yuvl', 1, 1, 0, '2025-04-23 06:37:25', '2025-04-23 06:37:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `awarding_body` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` timestamp NOT NULL,
  `enabled` tinyint NOT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE `boards` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL,
  `biography` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buttons`
--

CREATE TABLE `buttons` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_link_out` tinyint NOT NULL DEFAULT '0',
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buttons`
--

INSERT INTO `buttons` (`id`, `parent`, `button_name`, `is_link_out`, `link`, `order`, `created_at`, `updated_at`, `deleted_at`) VALUES
('0aaf7f66-0957-4b4b-8b36-1f4f8490648f', 'bd7fc5bf-5a56-470b-9a52-ad9efd8ec8a0', 'House & Lots', 0, '/house-and-lot', 1, NULL, NULL, NULL),
('1284e866-8214-4a74-b008-9d054bacf715', '8a80eeb2-76a1-4a94-9333-26ca473ac979', 'Condominiums', 0, '/condominium', 2, NULL, NULL, NULL),
('16605523-0b1c-4940-a8cf-9232a4c5fbe3', '6b2932d1-991e-4408-b64e-bd259dbd2c59', 'Get a Quote Today', 0, '/get-quote', 1, NULL, NULL, NULL),
('1c085d7d-1e6e-4847-9335-d7d38d4c943c', '5dd9c277-7371-4d1a-8de7-1bafe6670dd6', 'House & Lots', 0, '/house-and-lot', 1, NULL, NULL, NULL),
('24c18b83-d344-4890-892b-9b676c339a85', '3292f821-403e-4535-aa7a-b2cf9523d594', 'Condominiums', 0, '/condominium', 2, NULL, NULL, NULL),
('29d5d279-c93e-4fb5-b316-db48c7ae12ef', '21d49cd4-e07a-4c32-a70b-0f095f78d426', 'Get a Quote Today', 0, '/get-quote', 1, NULL, NULL, NULL),
('2b3cbb02-dfe6-40ec-bf4c-3581ea976508', '1bbd3a0e-7f72-43db-9730-a3153e2cf4a8', 'Sample Button 1', 0, '/sample-link', 1, NULL, NULL, NULL),
('2c4304f8-6915-4cb7-bbeb-2a3e44d79192', '8a80eeb2-76a1-4a94-9333-26ca473ac979', 'House & Lots', 0, '/house-and-lot', 1, NULL, NULL, NULL),
('33dac03d-f4cd-48cc-8100-6fac21c458be', 'e27861b3-d662-4e3c-ad70-59f1096dfb5f', 'Condominiums', 0, '/condominium', 2, NULL, NULL, NULL),
('34abfae4-6aa5-49f5-8804-ca9589f2dcd3', '1bbd3a0e-7f72-43db-9730-a3153e2cf4a8', 'Explore Payment Channel', 0, '/payment-channels', 1, NULL, NULL, NULL),
('43d51d30-bb88-4808-840d-3aecaca74b41', 'e9ab159a-2561-4c99-b1e3-9a9b8054f8b9', 'Contact Us', 0, '/contact-us', 1, NULL, NULL, NULL),
('472e029d-9e93-413f-83b5-1fca3ff6e0c3', '15f82e7b-8c7f-4210-a2e9-73e37a786ba5', 'House & Lots', 0, '/house-and-lot', 1, NULL, NULL, NULL),
('49a430ac-80d0-48bf-9065-0148961761ac', '81be283c-e3a6-44f6-94b1-d30e83e6c17a', 'Sample Button 1', 0, '/sample-link', 1, NULL, NULL, NULL),
('4ae839f5-197f-4d04-865c-c0fdf7c4d895', 'f3f0c4b4-2e2b-46ca-a7d0-53df8871e1ce', 'Condominiums', 0, '/condominium', 2, NULL, NULL, NULL),
('4bbaf965-f532-4045-a5d1-72c4dfddfe00', 'a56cc38a-3ea9-4def-974d-9f5771fa1391', 'Get a Quote Today', 0, '/get-quote', 1, NULL, NULL, NULL),
('5ad6a6ee-19a7-49b5-b457-cb5518074a1e', 'e000d3f8-cf5e-4ca9-b2a6-7bc8853e6a7b', 'House & Lots', 0, '/house-and-lot', 1, NULL, NULL, NULL),
('644943c0-2c25-4513-97b2-5e60f974d86b', '9c21f551-a695-4e39-b3bb-9ae76a3f9069', 'Get a Quote Today', 0, '/get-quote', 1, NULL, NULL, NULL),
('73a4a9be-0e46-4ea2-a33d-e36e48514cb0', 'e262b7e0-9210-44e6-a436-df61f8d891cb', 'Follow us on Instagram', 1, '/instagram.com', 1, NULL, NULL, NULL),
('75ac3061-26ab-4841-acda-51b0d67a812c', '9c21f551-a695-4e39-b3bb-9ae76a3f9069', 'Get a Quote Today', 0, '/get-quote', 1, NULL, NULL, NULL),
('7b77e4fb-b79d-469e-931d-ae5bdeb9964d', 'd659c087-74f1-41a2-b847-ccc9298b25dc', 'Condominiums', 0, '/condominium', 2, NULL, NULL, NULL),
('7d35f35b-f61b-4761-93da-88a6895b63ec', '0bdf8343-332e-4623-a818-668da3258534', 'Explore Buyer\'s Portal', 1, '/sample-link', 1, NULL, NULL, NULL),
('83f90aa8-7794-4855-9a7e-0607b75c33a5', 'f3f0c4b4-2e2b-46ca-a7d0-53df8871e1ce', 'House & Lots', 0, '/house-and-lot', 1, NULL, NULL, NULL),
('89934ae8-9a2a-47f3-9452-bbbb4d2e9044', 'de5ef3af-0473-41f4-86b8-d02d4fe1f34f', 'House & Lots', 0, '/house-and-lot', 1, NULL, NULL, NULL),
('89bee655-a7b3-41e7-be2e-e1f1d44fc07d', '038dea10-53b9-41fe-a7fd-9bdb35a4163c', 'Explore Buyer\'s Portal', 1, '/sample-link', 1, NULL, NULL, NULL),
('906b6a14-11f8-4570-bc4e-bac7b1737995', 'bd7fc5bf-5a56-470b-9a52-ad9efd8ec8a0', 'Condominiums', 0, '/condominium', 2, NULL, NULL, NULL),
('9305af72-23df-4462-ba8b-540597ab039e', '0555b5c5-b120-4aab-b24a-adc6b32121cf', 'Condominiums', 0, '/condominium', 2, NULL, NULL, NULL),
('9a014147-9166-4c25-8ba9-8c330992b401', 'de5ef3af-0473-41f4-86b8-d02d4fe1f34f', 'Condominiums', 0, '/condominium', 2, NULL, NULL, NULL),
('a6d42c16-4473-4dd3-bbd9-1f4876c1c237', '5dd9c277-7371-4d1a-8de7-1bafe6670dd6', 'Condominiums', 0, '/condominium', 2, NULL, NULL, NULL),
('b31f7f13-83f4-4f16-8779-c757ad3e51f9', 'a56cc38a-3ea9-4def-974d-9f5771fa1391', 'Get a Quote Today', 0, '/get-quote', 1, NULL, NULL, NULL),
('b912dabf-b934-4d0d-baed-4882bb62c7f1', '5ac3c1e1-1b27-47e6-a5c1-f20215d1a0c6', 'Explore House & Lots', 0, '/house-and-lots', 1, NULL, NULL, NULL),
('bc3fd185-e271-458a-8f7f-8959c75bb428', 'd659c087-74f1-41a2-b847-ccc9298b25dc', 'House & Lots', 0, '/house-and-lot', 1, NULL, NULL, NULL),
('caf5fbaf-1096-4ec3-b56c-f7acf87bed6e', 'e27861b3-d662-4e3c-ad70-59f1096dfb5f', 'House & Lots', 0, '/house-and-lot', 1, NULL, NULL, NULL),
('e1fc3da8-9e02-4a9c-8aa1-406534c28d86', '3292f821-403e-4535-aa7a-b2cf9523d594', 'House & Lots', 0, '/house-and-lot', 1, NULL, NULL, NULL),
('e4cb38ca-72d9-4363-8165-c25ff4113ad3', '7d0fad6e-4ca3-43e5-8d7d-bfd34f9070b9', 'Explore About Us', 0, '/about-us', 1, NULL, NULL, NULL),
('e73e5d10-f352-407c-8b40-c4c13353c583', 'fccff17d-91a8-414a-96c1-d09806280755', 'Explore Condominiums', 0, '/condominium', 1, NULL, NULL, NULL),
('ecf7175b-98f5-4941-91a9-2be180810e92', '81be283c-e3a6-44f6-94b1-d30e83e6c17a', 'Explore Payment Channel', 0, '/payment-channels', 1, NULL, NULL, NULL),
('f27b0975-5b4f-46a4-8e74-6e08b31f7ff5', '0555b5c5-b120-4aab-b24a-adc6b32121cf', 'House & Lots', 0, '/house-and-lot', 1, NULL, NULL, NULL),
('f72cb539-8797-4081-8ca6-4e83607c9747', 'e000d3f8-cf5e-4ca9-b2a6-7bc8853e6a7b', 'Condominiums', 0, '/condominium', 2, NULL, NULL, NULL),
('fd350079-4f1c-43c0-9ca3-1513311ce07b', '15f82e7b-8c7f-4210-a2e9-73e37a786ba5', 'Condominiums', 0, '/condominium', 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `careers`
--

CREATE TABLE `careers` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `qualifications` longtext COLLATE utf8mb4_unicode_ci,
  `employment_type_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` timestamp NOT NULL,
  `enabled` tinyint NOT NULL DEFAULT '1',
  `order` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'property feature',
  `order` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` longtext COLLATE utf8mb4_unicode_ci,
  `sequence` int DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_resized` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` longtext COLLATE utf8mb4_unicode_ci,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` longtext COLLATE utf8mb4_unicode_ci,
  `sequence` int DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_resized` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` longtext COLLATE utf8mb4_unicode_ci,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

CREATE TABLE `inquiries` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inquiry_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inquiry_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partnership` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `resume_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `landmarks`
--

CREATE TABLE `landmarks` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `editor_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `editor_id`, `action`, `page`, `item_name`, `item_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
('08b56853-46e6-4972-bc42-634c9b792060', '50cc330f-885b-4c37-a8df-1b73e06e0005', 'Login', NULL, NULL, NULL, '2025-04-22 03:56:44', '2025-04-22 03:56:44', NULL),
('2950403c-e0dc-441f-a6a5-81adda75d567', '50cc330f-885b-4c37-a8df-1b73e06e0005', 'Logout', NULL, NULL, NULL, '2025-04-28 04:36:49', '2025-04-28 04:36:49', NULL),
('2f0df85c-893e-432c-868c-274396ee42ca', '50cc330f-885b-4c37-a8df-1b73e06e0005', 'Login', NULL, NULL, NULL, '2025-04-22 03:49:50', '2025-04-22 03:49:50', NULL),
('3e76342f-9365-4d38-a224-ddbcea58844a', '50cc330f-885b-4c37-a8df-1b73e06e0005', 'Login', NULL, NULL, NULL, '2025-05-05 02:23:01', '2025-05-05 02:23:01', NULL),
('51ffc830-d459-415f-a88a-1041dde01c98', '50cc330f-885b-4c37-a8df-1b73e06e0005', 'Login', NULL, NULL, NULL, '2025-04-30 07:33:47', '2025-04-30 07:33:47', NULL),
('5a4e61d4-57fb-41e0-bf9a-8f8f34f5d4e5', '50cc330f-885b-4c37-a8df-1b73e06e0005', 'Login', NULL, NULL, NULL, '2025-04-24 06:17:20', '2025-04-24 06:17:20', NULL),
('612e2297-76c4-4b9b-8fa2-e12b84de5d80', '50cc330f-885b-4c37-a8df-1b73e06e0005', 'Login', NULL, NULL, NULL, '2025-04-28 07:01:19', '2025-04-28 07:01:19', NULL),
('64f05715-38ef-4cbb-8fb1-0bdd84f48c1c', '50cc330f-885b-4c37-a8df-1b73e06e0005', 'Login', NULL, NULL, NULL, '2025-04-23 06:11:39', '2025-04-23 06:11:39', NULL),
('76ad21f6-8dde-4fe3-9314-a3cbd2e7a6a7', '50cc330f-885b-4c37-a8df-1b73e06e0005', 'Login', NULL, NULL, NULL, '2025-04-22 09:41:29', '2025-04-22 09:41:29', NULL),
('9134fd18-abd8-4d4f-9b22-9b529117414b', '50cc330f-885b-4c37-a8df-1b73e06e0005', 'Logout', NULL, NULL, NULL, '2025-04-29 05:47:47', '2025-04-29 05:47:47', NULL),
('91503078-5f83-47db-af2a-17984afafe2e', '50cc330f-885b-4c37-a8df-1b73e06e0005', 'Created', 'News & Articles', 'yuvl', '9f3df741-9aaa-470c-839b-460f65faaa21', '2025-04-23 06:37:25', '2025-04-23 06:37:25', NULL),
('bf623e36-988d-4d91-aedb-25f699fe4757', '50cc330f-885b-4c37-a8df-1b73e06e0005', 'Login', NULL, NULL, NULL, '2025-04-28 07:40:59', '2025-04-28 07:40:59', NULL),
('c5c8ec46-881b-4f28-8c19-bbffa02f27c4', '50cc330f-885b-4c37-a8df-1b73e06e0005', 'Login', NULL, NULL, NULL, '2025-04-28 05:13:01', '2025-04-28 05:13:01', NULL),
('c7750417-d633-4b39-8965-022630a8ea92', '50cc330f-885b-4c37-a8df-1b73e06e0005', 'Login', NULL, NULL, NULL, '2025-04-29 05:48:27', '2025-04-29 05:48:27', NULL),
('c99a5145-61b4-4408-9f1b-468a2563052a', '50cc330f-885b-4c37-a8df-1b73e06e0005', 'Login', NULL, NULL, NULL, '2025-04-28 02:34:12', '2025-04-28 02:34:12', NULL),
('d8846105-8152-43fb-9b2d-3cf967dd060f', '50cc330f-885b-4c37-a8df-1b73e06e0005', 'Login', NULL, NULL, NULL, '2025-04-22 06:46:19', '2025-04-22 06:46:19', NULL),
('ec20973c-bf7b-4192-b833-e307d9cd8c14', '50cc330f-885b-4c37-a8df-1b73e06e0005', 'Logout', NULL, NULL, NULL, '2025-04-30 07:33:46', '2025-04-30 07:33:46', NULL),
('fa3d14a3-5714-47ed-b169-58423a7f73bb', '50cc330f-885b-4c37-a8df-1b73e06e0005', 'Login', NULL, NULL, NULL, '2025-05-05 02:52:50', '2025-05-05 02:52:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `metadata`
--

CREATE TABLE `metadata` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_rel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `metadata`
--

INSERT INTO `metadata` (`id`, `parent_id`, `meta_title`, `meta_description`, `link_rel`, `created_at`, `updated_at`, `deleted_at`) VALUES
('4a0c34c2-5abb-4411-8303-7785d9342648', '9f3df741-9aaa-470c-839b-460f65faaa21', NULL, NULL, 'Canonical', '2025-04-23 06:37:25', '2025-04-23 06:37:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2022_10_17_154329_create_logs_table', 1),
(11, '2022_10_17_154335_create_metadata_table', 1),
(12, '2022_10_17_154341_create_images_table', 1),
(13, '2022_10_17_154523_create_user_details_table', 1),
(14, '2022_10_17_154726_create_roles_table', 1),
(15, '2024_10_14_131221_create_pages_table', 1),
(16, '2024_10_14_132345_create_page_sections_table', 1),
(17, '2024_10_17_131453_create_buttons_table', 1),
(18, '2024_10_25_142611_create_accordions_table', 1),
(19, '2024_10_26_125854_create_taxonomies_table', 1),
(20, '2024_10_27_225608_create_boards_table', 1),
(21, '2024_10_28_114536_create_files_table', 1),
(22, '2024_10_30_111714_create_properties_table', 1),
(23, '2024_10_30_114353_create_units_table', 1),
(24, '2024_10_30_133414_create_amenities_table', 1),
(25, '2024_10_30_135004_create_features_table', 1),
(26, '2024_10_30_144057_create_videos_table', 1),
(27, '2024_11_06_115436_add_tracking_code_column_on_properties_table', 1),
(28, '2024_11_06_205845_add_tracking_code_column_on_units_table', 1),
(29, '2024_11_06_212455_add_property_type_column_on_taxonomies_table', 1),
(30, '2024_11_07_112828_add_gmap_url_on_units_table', 1),
(31, '2024_11_07_204319_add_enabled_column_on_amenities_table', 1),
(32, '2024_11_08_091558_create_payment_methods_table', 1),
(33, '2024_11_08_094242_create_payment_platforms_table', 1),
(34, '2024_11_08_160235_create_landmarks_table', 1),
(35, '2024_11_08_234647_add_description_column_on_features_table', 1),
(36, '2024_11_09_132026_create_vicinities_table', 1),
(37, '2024_11_10_111213_create_articles_table', 1),
(38, '2024_11_13_115524_create_careers_table', 1),
(39, '2024_11_14_170013_create_awards_table', 1),
(40, '2024_11_17_172511_add_identifier_column_on_payment_platform_table', 1),
(41, '2024_11_20_135041_create_jobs_table', 1),
(42, '2024_11_21_115900_create_website_settings_table', 1),
(43, '2025_01_22_101641_create_inquiries_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0e06b5b39d0fa946d175f9b431bd9f61b20c626655261a72bf0cc8e32b6d4d82ae50d5342e657605', '50cc330f-885b-4c37-a8df-1b73e06e0005', '9ebbb346-f45c-4618-8977-36f647ff36e6', 'AHC {ucfirst({\"id\":\"3e6bf8b0-bb98-47bb-9387-237867ccea2f\",\"name\":\"Admin\",\"type\":\"admin\"}->type)}', '[]', 0, '2025-04-28 05:13:01', '2025-04-28 05:13:01', '2026-04-28 13:13:01'),
('1e6fe4972063f301aba7c6125d14662f607d5ae257be00a655572f3d7358feda671b14bf23df43ec', '50cc330f-885b-4c37-a8df-1b73e06e0005', '9ebbb346-f45c-4618-8977-36f647ff36e6', 'AHC {ucfirst({\"id\":\"3e6bf8b0-bb98-47bb-9387-237867ccea2f\",\"name\":\"Admin\",\"type\":\"admin\"}->type)}', '[]', 0, '2025-05-05 02:23:01', '2025-05-05 02:23:01', '2026-05-05 10:23:01'),
('4a04c6d255da85cbb626b66c51c544ce6a8cb72057dff2ddfcf80ed75cd997cb5b2ab3209fbe35b5', '50cc330f-885b-4c37-a8df-1b73e06e0005', '9ebbb346-f45c-4618-8977-36f647ff36e6', 'AHC {ucfirst({\"id\":\"3e6bf8b0-bb98-47bb-9387-237867ccea2f\",\"name\":\"Admin\",\"type\":\"admin\"}->type)}', '[]', 0, '2025-04-23 06:11:39', '2025-04-23 06:11:39', '2026-04-23 14:11:39'),
('77b3845e66e380fb02ce029e835d45ee9e0edb60d95a35a71f8edcde96d87e3e7554a4b72245a37e', '50cc330f-885b-4c37-a8df-1b73e06e0005', '9ebbb346-f45c-4618-8977-36f647ff36e6', 'AHC {ucfirst({\"id\":\"3e6bf8b0-bb98-47bb-9387-237867ccea2f\",\"name\":\"Admin\",\"type\":\"admin\"}->type)}', '[]', 0, '2025-04-30 07:33:47', '2025-04-30 07:33:47', '2026-04-30 15:33:47'),
('78dbc9846c8e6781ad38e37bfde9ede68e14574ffe4713b454da7e335d07231e18798db65adab552', '50cc330f-885b-4c37-a8df-1b73e06e0005', '9ebbb346-f45c-4618-8977-36f647ff36e6', 'AHC {ucfirst({\"id\":\"3e6bf8b0-bb98-47bb-9387-237867ccea2f\",\"name\":\"Admin\",\"type\":\"admin\"}->type)}', '[]', 0, '2025-04-22 03:49:50', '2025-04-22 03:49:50', '2026-04-22 11:49:50'),
('793962a3796deb31ecfced1acc77647b05e53ce3eda24ed69704352a17ac7f1492b0882d22752ad1', '50cc330f-885b-4c37-a8df-1b73e06e0005', '9ebbb346-f45c-4618-8977-36f647ff36e6', 'AHC {ucfirst({\"id\":\"3e6bf8b0-bb98-47bb-9387-237867ccea2f\",\"name\":\"Admin\",\"type\":\"admin\"}->type)}', '[]', 0, '2025-04-28 07:01:19', '2025-04-28 07:01:19', '2026-04-28 15:01:19'),
('7c745aa1bdc260769dc4cecefa8d284e5873e01ec478411b6caae44a295c14f7a6d0d93f68e2d83b', '50cc330f-885b-4c37-a8df-1b73e06e0005', '9ebbb346-f45c-4618-8977-36f647ff36e6', 'AHC {ucfirst({\"id\":\"3e6bf8b0-bb98-47bb-9387-237867ccea2f\",\"name\":\"Admin\",\"type\":\"admin\"}->type)}', '[]', 1, '2025-04-28 07:40:59', '2025-04-29 05:47:47', '2026-04-28 15:40:59'),
('7f75c20f03bb2af7b7ffc37749974a45c3432c5ff03595904ab6a9f8b05eaa53fcd0ea350972dc3b', '50cc330f-885b-4c37-a8df-1b73e06e0005', '9ebbb346-f45c-4618-8977-36f647ff36e6', 'AHC {ucfirst({\"id\":\"3e6bf8b0-bb98-47bb-9387-237867ccea2f\",\"name\":\"Admin\",\"type\":\"admin\"}->type)}', '[]', 0, '2025-04-24 06:17:19', '2025-04-24 06:17:20', '2026-04-24 14:17:19'),
('874fc6935678f399f2b2292bffab2783eea2e11ea68c21736a2864860d24040f8469037c886f65ec', '50cc330f-885b-4c37-a8df-1b73e06e0005', '9ebbb346-f45c-4618-8977-36f647ff36e6', 'AHC {ucfirst({\"id\":\"3e6bf8b0-bb98-47bb-9387-237867ccea2f\",\"name\":\"Admin\",\"type\":\"admin\"}->type)}', '[]', 0, '2025-05-05 02:52:50', '2025-05-05 02:52:50', '2026-05-05 10:52:50'),
('b5650defe9baeb0b0a08a8df11ba0dfa80099e32ab5d51fa02c55d89880799b3cededfe1aa6fe692', '50cc330f-885b-4c37-a8df-1b73e06e0005', '9ebbb346-f45c-4618-8977-36f647ff36e6', 'AHC {ucfirst({\"id\":\"3e6bf8b0-bb98-47bb-9387-237867ccea2f\",\"name\":\"Admin\",\"type\":\"admin\"}->type)}', '[]', 0, '2025-04-22 06:46:19', '2025-04-22 06:46:19', '2026-04-22 14:46:19'),
('bf6754d77e705b48736bd59949ae6a50ce861b68e272eb6a85fd0214c3b24f58cb43241b5e7104c0', '50cc330f-885b-4c37-a8df-1b73e06e0005', '9ebbb346-f45c-4618-8977-36f647ff36e6', 'AHC {ucfirst({\"id\":\"3e6bf8b0-bb98-47bb-9387-237867ccea2f\",\"name\":\"Admin\",\"type\":\"admin\"}->type)}', '[]', 1, '2025-04-29 05:48:27', '2025-04-30 07:33:45', '2026-04-29 13:48:27'),
('ceebb1d6a46cf19c586982b384639b1ce6dbf2e139685533f1a09c769f935e5122fd183dce4ca9e8', '50cc330f-885b-4c37-a8df-1b73e06e0005', '9ebbb346-f45c-4618-8977-36f647ff36e6', 'AHC {ucfirst({\"id\":\"3e6bf8b0-bb98-47bb-9387-237867ccea2f\",\"name\":\"Admin\",\"type\":\"admin\"}->type)}', '[]', 0, '2025-04-22 03:56:44', '2025-04-22 03:56:44', '2026-04-22 11:56:44'),
('d8257bf287f2009a3fac5e2fe1990fdeb3ed771b13e15fff143352ea698475c6d47ac7300adfe6c0', '50cc330f-885b-4c37-a8df-1b73e06e0005', '9ebbb346-f45c-4618-8977-36f647ff36e6', 'AHC {ucfirst({\"id\":\"3e6bf8b0-bb98-47bb-9387-237867ccea2f\",\"name\":\"Admin\",\"type\":\"admin\"}->type)}', '[]', 1, '2025-04-28 02:34:12', '2025-04-28 04:36:49', '2026-04-28 10:34:12'),
('e62725929eb45653b9bc370d05c8ed9a1408a458b8d960d9225f1c289fbd06667777bb6bb22e3b04', '50cc330f-885b-4c37-a8df-1b73e06e0005', '9ebbb346-f45c-4618-8977-36f647ff36e6', 'AHC {ucfirst({\"id\":\"3e6bf8b0-bb98-47bb-9387-237867ccea2f\",\"name\":\"Admin\",\"type\":\"admin\"}->type)}', '[]', 0, '2025-04-22 09:41:29', '2025-04-22 09:41:29', '2026-04-22 17:41:29');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
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
('9ebbb346-f45c-4618-8977-36f647ff36e6', NULL, 'Laravel Personal Access Client', 'H7lbTToCErxRzOKcHRnZDccqLPuaHe7pqVEp2QhW', NULL, 'http://localhost', 1, 0, 0, '2025-04-22 02:47:18', '2025-04-22 02:47:18'),
('9ebbb346-fe0f-48b2-a5e9-190bf47f730b', NULL, 'Laravel Password Grant Client', 'gL9CQg1OGNaTKfLCmO3sfXlKPq27EANJYlw4p6xY', 'users', 'http://localhost', 0, 1, 0, '2025-04-22 02:47:18', '2025-04-22 02:47:18');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, '9ebbb346-f45c-4618-8977-36f647ff36e6', '2025-04-22 02:47:18', '2025-04-22 02:47:18');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL,
  `page_parent` tinyint NOT NULL DEFAULT '0',
  `page_parent_seq` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `identifier`, `category`, `order`, `page_parent`, `page_parent_seq`, `created_at`, `updated_at`, `deleted_at`) VALUES
('15a1e44c-03ef-4501-ad63-79248ba66c56', 'Condominiums', 'condominiums', 'condominiums', 'Our Properties', 3, 1, 'B2', NULL, NULL, NULL),
('30be7018-7cf6-4b4f-8c17-d018094c2231', 'Seller\'s guide', 'sellers-guide', 'sellers-guide', 'Seller\'s Guide', 6, 1, 'E1', NULL, NULL, NULL),
('4aec8dfe-c751-4ff1-adb9-4d612064e873', 'News & Articles', 'news-and-articles', 'news-and-articles', 'News & Articles', 8, 1, 'G1', NULL, NULL, NULL),
('4e90146b-06fc-4bf1-a593-2bbafca3e25e', 'About Us', 'about-us', 'about-us', 'About Us', 5, 1, 'D1', NULL, NULL, NULL),
('58b94fbd-590e-4392-bf57-69e71a95c55c', 'House & Lots', 'house-and-lots', 'house-and-lots', 'Our Properties', 2, 1, 'B1', NULL, NULL, NULL),
('7e3bbfec-724a-419d-a32b-aaa414fbba6e', 'Homebuyer\'s Guide', 'homebuyers-guide', 'homebuyers-guide', 'Homebuyer\'s Guide', 4, 1, 'C1', NULL, NULL, NULL),
('8b8c7a97-66d6-43f2-b1bc-c2df146119d7', 'Homepage', 'homepage', 'homepage', 'Homepage', 1, 1, 'A1', NULL, NULL, NULL),
('b3281e03-1ee9-4a28-a15f-88d93ee4d6db', 'Payment Channel', 'payment-channel', 'payment-channel', 'Payment Channel', 7, 1, 'F1', NULL, NULL, NULL),
('b3323d39-e4b0-4528-a18f-7ffee3fb92c0', 'Get a Quote', 'get-a-quote', 'get-a-quote', 'Get a Quote', 11, 1, 'J1', NULL, NULL, NULL),
('be609687-0cf6-40cd-b1ad-42276454f958', 'Contact Us', 'contact-us', 'contact-us', 'Contact Us', 10, 1, 'I1', NULL, NULL, NULL),
('ee8c257c-c4ca-457d-8e96-c1fdfc8a9dd1', 'Corporate Careers', 'careers', 'careers', 'Careers', 9, 1, 'H1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page_sections`
--

CREATE TABLE `page_sections` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `order` tinyint NOT NULL,
  `has_button` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_sections`
--

INSERT INTO `page_sections` (`id`, `page_id`, `name`, `title`, `description`, `order`, `has_button`, `created_at`, `updated_at`, `deleted_at`) VALUES
('038dea10-53b9-41fe-a7fd-9bdb35a4163c', '7e3bbfec-724a-419d-a32b-aaa414fbba6e', 'Buyer\'s Portal Banner', 'Exclusive Buyer’s Hub Just for You', '', 3, 1, NULL, NULL, NULL),
('0555b5c5-b120-4aab-b24a-adc6b32121cf', '7e3bbfec-724a-419d-a32b-aaa414fbba6e', 'Top Banner', 'Sample', '', 1, 0, NULL, NULL, NULL),
('0bdf8343-332e-4623-a818-668da3258534', '30be7018-7cf6-4b4f-8c17-d018094c2231', 'Agent\'s Portal', 'Exclusive Access for Suntrust Agents', '', 2, 1, NULL, NULL, NULL),
('15f82e7b-8c7f-4210-a2e9-73e37a786ba5', 'be609687-0cf6-40cd-b1ad-42276454f958', 'Top Banner', 'Sample', '', 1, 0, NULL, NULL, NULL),
('18ec29f5-c7e6-490d-a899-9e0e51d4aa9f', '4e90146b-06fc-4bf1-a593-2bbafca3e25e', 'Other Property Development', 'Browse Our Other Developments', '', 5, 0, NULL, NULL, NULL),
('1bbd3a0e-7f72-43db-9730-a3153e2cf4a8', '8b8c7a97-66d6-43f2-b1bc-c2df146119d7', 'Payment Channel CTA', 'Payments made easy and secure!                    ', '', 6, 1, NULL, NULL, NULL),
('21d49cd4-e07a-4c32-a70b-0f095f78d426', '7e3bbfec-724a-419d-a32b-aaa414fbba6e', 'Get a Quote CTA', 'Ready to find your dream property?', '', 5, 1, NULL, NULL, NULL),
('30d9747b-17e4-44f6-895d-d7e49a02dc9d', '4aec8dfe-c751-4ff1-adb9-4d612064e873', 'Latest News', 'Latest News & Articles', '', 2, 0, NULL, NULL, NULL),
('3292f821-403e-4535-aa7a-b2cf9523d594', '15a1e44c-03ef-4501-ad63-79248ba66c56', 'Top Banner', 'Sample', '', 1, 0, NULL, NULL, NULL),
('3d0f5bb9-de0b-4a86-9457-9c6dc41ca0b2', '4e90146b-06fc-4bf1-a593-2bbafca3e25e', 'Mission', 'mission', 'Our goal is to become the benchmark in affordable township development, setting the highest standards of quality and value. We aim to be the premier choice for buyers, offering exceptional communities that meet their needs and aspirations.', 3, 0, NULL, NULL, NULL),
('45bd0c73-40ae-4055-935a-efdc3dab0cae', '30be7018-7cf6-4b4f-8c17-d018094c2231', 'Business Partner Network', 'Be a Suntrust Real Estate Broker', '', 4, 0, NULL, NULL, NULL),
('4f33089f-bc9b-41d9-bc2b-60fc6d094f95', '7e3bbfec-724a-419d-a32b-aaa414fbba6e', 'Steps', 'Step by Step Guide to Buying a Property', '', 2, 0, NULL, NULL, NULL),
('5ac3c1e1-1b27-47e6-a5c1-f20215d1a0c6', '8b8c7a97-66d6-43f2-b1bc-c2df146119d7', 'Featured House & Lots', 'Spacious living awaits you.', '', 2, 1, NULL, NULL, NULL),
('5dd9c277-7371-4d1a-8de7-1bafe6670dd6', '30be7018-7cf6-4b4f-8c17-d018094c2231', 'Top Banner', 'Sample', '', 1, 0, NULL, NULL, NULL),
('667dcbf9-9a88-4aac-b4ca-6a0cd2d35279', '30be7018-7cf6-4b4f-8c17-d018094c2231', 'In-house Sales Group', 'Become a Suntrustee', '', 3, 0, NULL, NULL, NULL),
('6b2932d1-991e-4408-b64e-bd259dbd2c59', '8b8c7a97-66d6-43f2-b1bc-c2df146119d7', 'Get a Quote CTA', 'Get In Touch With Us', '', 7, 1, NULL, NULL, NULL),
('7d0fad6e-4ca3-43e5-8d7d-bfd34f9070b9', '8b8c7a97-66d6-43f2-b1bc-c2df146119d7', 'About Us', 'Over 20 Years of Building Quality Homes for Filipinos', '', 5, 1, NULL, NULL, NULL),
('7edd6345-38e6-47c2-baee-8218364def83', '4e90146b-06fc-4bf1-a593-2bbafca3e25e', 'Suntrust Officers', 'Our Leadership Team', '', 6, 0, NULL, NULL, NULL),
('81be283c-e3a6-44f6-94b1-d30e83e6c17a', '7e3bbfec-724a-419d-a32b-aaa414fbba6e', 'Payment Channel CTA', 'Payments made easy and secure!', '', 4, 1, NULL, NULL, NULL),
('8a80eeb2-76a1-4a94-9333-26ca473ac979', 'b3323d39-e4b0-4528-a18f-7ffee3fb92c0', 'Top Banner', 'Sample', '', 1, 0, NULL, NULL, NULL),
('8bea930c-cf65-4768-8664-76af15adb8da', '4e90146b-06fc-4bf1-a593-2bbafca3e25e', 'Company Profile', 'Company Profile', 'Suntrust Properties, Inc. (SPI) is a 100% wholly-owned subsidiary of Megaworld Corporation, a company under the umbrella of the Alliance Global Group, Inc.', 2, 0, NULL, NULL, NULL),
('9c21f551-a695-4e39-b3bb-9ae76a3f9069', '15a1e44c-03ef-4501-ad63-79248ba66c56', 'Get a Quote Banner', 'Ready to find your dream property?', '', 2, 1, NULL, NULL, NULL),
('a56cc38a-3ea9-4def-974d-9f5771fa1391', '58b94fbd-590e-4392-bf57-69e71a95c55c', 'Get a Quote Banner', 'Ready to find your dream property?', '', 2, 1, NULL, NULL, NULL),
('bd7fc5bf-5a56-470b-9a52-ad9efd8ec8a0', 'ee8c257c-c4ca-457d-8e96-c1fdfc8a9dd1', 'Top Banner', 'Sample', '', 1, 0, NULL, NULL, NULL),
('c83c61af-a6ce-43f6-aaac-01f6f85c9f7c', 'be609687-0cf6-40cd-b1ad-42276454f958', 'After Sales Officers', 'Get In Touch With Us', '', 2, 0, NULL, NULL, NULL),
('d30fab91-d2e0-46d0-ac07-840f9fe5c978', '8b8c7a97-66d6-43f2-b1bc-c2df146119d7', 'Browse by Locations', 'Find Your Ideal Property Nationwide', '', 4, 0, NULL, NULL, NULL),
('d659c087-74f1-41a2-b847-ccc9298b25dc', '4aec8dfe-c751-4ff1-adb9-4d612064e873', 'Top Banner', 'Sample', '', 1, 0, NULL, NULL, NULL),
('de5ef3af-0473-41f4-86b8-d02d4fe1f34f', '58b94fbd-590e-4392-bf57-69e71a95c55c', 'Top Banner', 'Sample', '', 1, 0, NULL, NULL, NULL),
('e000d3f8-cf5e-4ca9-b2a6-7bc8853e6a7b', '8b8c7a97-66d6-43f2-b1bc-c2df146119d7', 'Top Banner', 'Sample', '', 1, 1, NULL, NULL, NULL),
('e0875473-ff9e-4b76-a8dd-0781012f0e5b', '4e90146b-06fc-4bf1-a593-2bbafca3e25e', 'Awards', 'Latest Awards and Recognitions', '', 6, 0, NULL, NULL, NULL),
('e262b7e0-9210-44e6-a436-df61f8d891cb', '4aec8dfe-c751-4ff1-adb9-4d612064e873', 'Instagram', 'Follow us on Instagram', '', 3, 1, NULL, NULL, NULL),
('e27861b3-d662-4e3c-ad70-59f1096dfb5f', 'b3281e03-1ee9-4a28-a15f-88d93ee4d6db', 'Top Banner', 'Sample', '', 1, 0, NULL, NULL, NULL),
('e9ab159a-2561-4c99-b1e3-9a9b8054f8b9', 'b3323d39-e4b0-4528-a18f-7ffee3fb92c0', 'Contact Us CTA', 'Ready to find your dream property?', '', 2, 1, NULL, NULL, NULL),
('f3f0c4b4-2e2b-46ca-a7d0-53df8871e1ce', '4e90146b-06fc-4bf1-a593-2bbafca3e25e', 'Top Banner', 'Sample', '', 1, 0, NULL, NULL, NULL),
('fccff17d-91a8-414a-96c1-d09806280755', '8b8c7a97-66d6-43f2-b1bc-c2df146119d7', 'Featured Condominiums', 'Experience urban living at its finest.', '', 3, 1, NULL, NULL, NULL),
('ffd70182-327f-41bb-87f9-37efb6c231d9', '4e90146b-06fc-4bf1-a593-2bbafca3e25e', 'Vision', 'vision', 'This mission is being accomplished through the dedication of a highly motivated workforce and the strategic direction of a dynamic management team. Together, they are committed to fostering teamwork, upholding the highest standards of professionalism, and adhering to principles of corporate social responsibility.', 4, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `title`, `published`, `created_at`, `updated_at`, `deleted_at`) VALUES
('36b619d5-a0ab-4c7d-a8d7-f13df190f20c', 'Online Payment', '1', '2025-04-22 02:46:58', '2025-04-22 02:46:58', NULL),
('8d9b0e69-4049-462f-a575-84e4e78d05f0', 'Auto Debit', '1', '2025-04-22 02:46:58', '2025-04-22 02:46:58', NULL),
('a5a5c528-a5a0-4d85-9f3d-ecc5ae5b0ff7', 'Over the Counter', '1', '2025-04-22 02:46:58', '2025-04-22 02:46:58', NULL),
('f667435e-73ba-4144-934c-7b1e115691e9', 'Overseas Transaction', '1', '2025-04-22 02:46:58', '2025-04-22 02:46:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_platforms`
--

CREATE TABLE `payment_platforms` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequence` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `steps` json DEFAULT NULL,
  `buttonText` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buttonLink` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buttonActive` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_type` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `towers` tinyint DEFAULT NULL,
  `starts_at` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gmaps_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `location_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL,
  `featured` tinyint NOT NULL DEFAULT '0',
  `enabled` tinyint NOT NULL DEFAULT '1',
  `tracking_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` set('admin','editor','customer') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `identifier`, `type`, `permissions`, `created_at`, `updated_at`, `deleted_at`) VALUES
('3e6bf8b0-bb98-47bb-9387-237867ccea2f', 'Admin', 'id-ut-quia-blanditiis-est-aperiam-sapiente', 'admin', '[\n  {\n    \"name\": \"Properties\",\n    \"unique\": \"properties\",\n    \"route_name\": [\n      \"properties-propertyType\",\n      \"properties-propertyType-id-amenities-amenity_id\",\n      \"properties-propertyType-id-amenities-create\",\n      \"properties-propertyType-id-amenities\",\n      \"properties-propertyType-id-landmarks-landmark_id\",\n      \"properties-propertyType-id-landmarks-create\",\n      \"properties-propertyType-id-landmarks\",\n      \"properties-propertyType-id-units-unit_id\",\n      \"properties-propertyType-id-units-create\",\n      \"properties-propertyType-id-units\",\n      \"properties-propertyType-id-update\",\n      \"properties-propertyType-create\"\n    ]\n  },\n  {\n    \"name\": \"News and Articles\",\n    \"unique\": \"news-and-articles\",\n    \"route_name\": [\n      \"articles\",\n      \"articles-id\",\n      \"articles-create\"\n    ]\n  },\n  {\n    \"name\": \"Payment Channels\",\n    \"unique\": \"payment-channels\",\n    \"route_name\": [\n      \"payment-channels-payment-methods\",\n      \"payment-channels-payment-methods-methodId-edit\",\n      \"payment-channels-payment-methods-methodId-payment-platforms-platformId-edit\",\n      \"payment-channels-payment-methods-methodId-payment-platforms-platformId\",\n      \"payment-channels-payment-methods-methodId-payment-platforms-create\",\n      \"payment-channels-payment-methods-methodId-payment-platforms\",\n      \"payment-channels-payment-methods-create\"\n    ]\n  },\n  {\n    \"name\": \"Awards\",\n    \"unique\": \"awards\",\n    \"route_name\": [\n      \"awards\",\n      \"awards-id\",\n      \"awards-create\"\n    ]\n  },\n  {\n    \"name\": \"Careers\",\n    \"unique\": \"careers\",\n    \"route_name\": [\n      \"careers-type\",\n      \"careers-type-id\",\n      \"careers-type-create\"\n    ]\n  },\n  {\n    \"name\": \"Inquiries\",\n    \"unique\": \"inquiries\",\n    \"route_name\": [\n      \"inquiries-get-quote\",\n      \"inquiries-in-house-sales-group\",\n      \"inquiries-business-partner-network\",\n      \"inquiries-corporate-careers\",\n      \"inquiries-contact-us\"\n    ]\n  },\n  {\n    \"name\": \"Taxonomies\",\n    \"unique\": \"taxonomies\",\n    \"route_name\": [\n      \"taxonomies\",\n      \"taxonomies-id\",\n      \"taxonomies-careers-employment-types\",\n      \"taxonomies-careers-job-locations\",\n      \"taxonomies-contact-us-after-sales-officers\",\n      \"taxonomies-contact-us-inquiry-types-id\",\n      \"taxonomies-contact-us-inquiry-types-create\",\n      \"taxonomies-contact-us-inquiry-types\",\n      \"taxonomies-contact-us-office-locations\",\n      \"taxonomies-contact-us-referral-types\",\n      \"taxonomies-media-center-article-categories\",\n      \"taxonomies-categories-property-locations\",\n      \"taxonomies-categories-property-statuses\",\n      \"taxonomies-categories-brands\",\n      \"taxonomies-categories-material\",\n      \"taxonomies-categories-types\",\n      \"taxonomies-categories-purpose\",\n      \"taxonomies-categories-size\",\n      \"taxonomies-categories-finish\",\n      \"taxonomies-categories-shade\",\n      \"taxonomies-categories-features\",\n      \"taxonomies-categories-color\",\n      \"taxonomies-categories-application\",\n      \"taxonomies-sellers-priority-locations\",\n      \"taxonomies-email-recipients-form-pages\",\n      \"taxonomies-email-recipients-form-pages-create\",\n      \"taxonomies-email-recipients-form-pages-id\"\n    ]\n  },\n  {\n    \"name\": \"Admin Setting\",\n    \"unique\": \"admin-settings\",\n    \"route_name\": [\n      \"admin-settings\",\n      \"admin-settings-cms-editors-id-change-password\",\n      \"admin-settings-cms-editors-id-update\",\n      \"admin-settings-cms-editors-create\",\n      \"admin-settings-cms-editors\",\n      \"admin-settings-roles-id\",\n      \"admin-settings-roles-create\",\n      \"admin-settings-roles\",\n      \"admin-settings-website-settings\"\n    ]\n  },\n  {\n    \"name\": \"Homepage\",\n    \"unique\": \"pages-homepage\",\n    \"route_name\": [\n      \"homepageSection_id\",\n      \"metadata_id\"\n    ]\n  },\n  {\n    \"name\": \"Page Our Properties\",\n    \"unique\": \"pages-our-properties\",\n    \"route_name\": [\n      \"condoSection_id\",\n      \"houseSection_id\",\n      \"metadata_id\"\n    ]\n  },\n  {\n    \"name\": \"Page Homebuyer\'s Guide\",\n    \"unique\": \"pages-homebuyers-guide\",\n    \"route_name\": [\n      \"buyerSection_id\",\n      \"steps_id\",\n      \"metadata_id\"\n    ]\n  },\n  {\n    \"name\": \"Page About Us\",\n    \"unique\": \"pages-about-us\",\n    \"route_name\": [\n      \"aboutUsSection_id\",\n      \"otherProperty_id\",\n      \"officers_id\",\n      \"metadata_id\"\n    ]\n  },\n  {\n    \"name\": \"Page Seller\'s Guide\",\n    \"unique\": \"pages-sellers-guide\",\n    \"route_name\": [\n      \"sellersGuideSection_id\",\n      \"metadata_id\"\n    ]\n  },\n  {\n    \"name\": \"Page Payment Channel\",\n    \"unique\": \"pages-payment-channel\",\n    \"route_name\": [\n      \"paymentChannelSection_id\",\n      \"metadata_id\"\n    ]\n  },\n  {\n    \"name\": \"Page News & Articles\",\n    \"unique\": \"pages-news-and-articles\",\n    \"route_name\": [\n      \"newsSection_id\",\n      \"metadata_id\"\n    ]\n  },\n  {\n    \"name\": \"Page Careers\",\n    \"unique\": \"pages-careers\",\n    \"route_name\": [\n      \"careersSection_id\",\n      \"metadata_id\"\n    ]\n  },\n  {\n    \"name\": \"Page Contact Us\",\n    \"unique\": \"pages-contact-us\",\n    \"route_name\": [\n      \"contactUsSection_id\",\n      \"metadata_id\"\n    ]\n  },\n  {\n    \"name\": \"Page Get a Quote\",\n    \"unique\": \"pages-get-a-quote\",\n    \"route_name\": [\n      \"getQuoteSection_id\",\n      \"metadata_id\"\n    ]\n  },\n  {\n    \"name\": \"Page Privacy Policy\",\n    \"unique\": \"pages-privacy-policy\",\n    \"route_name\": [\n      \"policySection_id\",\n      \"metadata_id\"\n    ]\n  },\n  {\n    \"name\": \"Page Terms and Conditions\",\n    \"unique\": \"pages-terms-and-conditions\",\n    \"route_name\": [\n      \"termsSection_id\",\n      \"metadata_id\"\n    ]\n  },\n  {\n    \"name\": \"All Pages\",\n    \"unique\": \"pages-all\",\n    \"route_name\": [\n      \"pages\"\n    ]\n  }\n]', '2025-04-22 02:46:57', '2025-04-22 02:46:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `taxonomies`
--

CREATE TABLE `taxonomies` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_recipients` json DEFAULT NULL,
  `property_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_url` text COLLATE utf8mb4_unicode_ci,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `officer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxonomies`
--

INSERT INTO `taxonomies` (`id`, `name`, `first_name`, `last_name`, `type`, `email_recipients`, `property_type`, `location_type`, `address`, `map_url`, `contact_number`, `officer_type`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
('0102eafa-878c-44fa-8bc1-22eae2073d0c', 'sdgdsghsdf', NULL, NULL, 'brand', NULL, 'house-and-lot', NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-22 10:09:47', '2025-04-23 06:12:18', '2025-04-23 06:12:18'),
('02c94831-4ad5-4a2b-b8eb-a12f31e1dd76', 'Utility Room', NULL, NULL, 'application', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 09:20:07', '2025-04-28 09:20:07', NULL),
('0a631f05-6926-48d9-9ad4-af3a0edf9cb6', 'Indoor & Outdoor Tiles', NULL, NULL, 'type', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-24 06:47:52', '2025-04-24 06:48:50', NULL),
('0b49dd06-f7cb-48e2-83f0-e15df2085442', '500mm x 500mm', NULL, NULL, 'size', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 06:04:35', '2025-04-28 06:04:35', NULL),
('0bd28611-c81f-409c-ac20-5319bc9f7709', 'Black', NULL, NULL, 'color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 07:52:28', '2025-04-28 07:52:28', NULL),
('11dacc23-d797-457e-891a-d4cb8bf9943d', 'asdsad', NULL, NULL, 'brand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-24 06:49:33', '2025-04-24 06:49:33', NULL),
('16f65e0e-0c63-41c7-8b61-fd51f3b17849', 'cxv', NULL, NULL, 'brand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-24 06:49:43', '2025-04-24 06:49:43', NULL),
('1c831d34-2fa0-4599-af41-c0c6ba7ba393', 'Light Grey', NULL, NULL, 'color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 07:56:40', '2025-04-28 07:56:40', NULL),
('1ea336a6-b6dd-4083-ad84-f2940d05125c', 'Offices', NULL, NULL, 'application', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 09:19:49', '2025-04-28 09:19:54', NULL),
('22c91ded-7bc4-4732-b3c6-820b55020e2a', '300mm x 300mm', NULL, NULL, 'size', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 06:05:08', '2025-04-28 06:05:08', NULL),
('25e76ec0-5a1f-4a62-b78d-d4f6b4057e32', 'Smooth Grip', NULL, NULL, 'feature', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 07:30:18', '2025-04-28 07:30:18', NULL),
('2a7f997d-d8c9-4a3a-84ce-c65a9c09f61b', 'White Horse', NULL, NULL, 'brand', NULL, 'house-and-lot', NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-23 06:12:11', '2025-04-23 06:12:11', NULL),
('2aade589-5765-45f4-b340-35dc82c697eb', 'Indoor Tiles', NULL, NULL, 'type', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-24 06:49:02', '2025-04-24 06:49:02', NULL),
('2d67ff65-323f-4285-b178-7fc29d508708', 'Cavallo', NULL, NULL, 'brand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-24 06:06:33', '2025-04-24 06:07:31', NULL),
('2ffa6485-f74e-49fe-b0f9-2802afa976f0', 'V1 - Uniform', NULL, NULL, 'shade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-05 02:53:34', '2025-05-05 02:53:34', NULL),
('3107b898-5596-405d-a300-2832e4386e0f', '300mm x 600mm', NULL, NULL, 'size', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 06:04:55', '2025-04-28 06:04:55', NULL),
('34256fb1-e45a-43f4-980b-eae60bbdaafd', 'hgttgcg', NULL, NULL, 'article_category', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-23 06:36:43', '2025-04-23 06:36:43', NULL),
('347c932c-72a4-4dde-83b1-1d6bfabe4fd6', 'Ash Gray', NULL, NULL, 'color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 07:55:46', '2025-04-28 07:55:46', NULL),
('3499966d-140a-4436-925f-ad9f24d090d4', 'Gloss', NULL, NULL, 'finish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 06:15:38', '2025-04-28 06:15:38', NULL),
('38c7c53b-3bf7-4990-9586-6e50b30b6383', 'Garden', NULL, NULL, 'application', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 09:20:11', '2025-04-28 09:20:11', NULL),
('3fb23369-27b9-475c-b167-959156c710d8', '5y', NULL, NULL, 'brand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-24 06:49:49', '2025-04-24 06:49:49', NULL),
('42fb71de-5ea6-456b-99a7-9480a9d4a006', 'tyytj', NULL, NULL, 'brand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-24 06:49:46', '2025-04-24 06:49:46', NULL),
('459e530e-bd32-41f3-8878-875af9ec0c7b', 'sdfdsf', NULL, NULL, 'brand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-24 06:08:45', '2025-04-24 06:08:45', NULL),
('5d9f0523-c901-4bad-a4b5-8d759f80c487', 'Matte', NULL, NULL, 'finish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 06:15:42', '2025-04-28 06:15:42', NULL),
('629ae67a-c7b0-4ebf-bcda-b8eff102ee69', 'Stairs', NULL, NULL, 'application', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 09:20:30', '2025-04-28 09:20:30', NULL),
('6630758a-b4f1-4352-9857-4edd1a81ed94', 'Cavallo1233', NULL, NULL, 'brand', NULL, 'house-and-lot', NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-23 06:12:15', '2025-04-24 05:57:06', '2025-04-24 05:57:06'),
('6724d8d4-f051-4bdc-8629-99fab170f98a', 'Floor/Wall Tiles', NULL, NULL, 'purpose', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 05:44:28', '2025-04-28 05:44:28', NULL),
('672cc0ad-d74e-452a-910d-304e22a0b1b5', 'Cream Beige', NULL, NULL, 'color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 07:56:11', '2025-04-28 07:56:11', NULL),
('687d692f-d25e-4cf4-8862-6cdaf8196c3e', 'Living Room', NULL, NULL, 'application', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 09:17:38', '2025-04-28 09:17:38', NULL),
('6c61e60f-bd19-4558-9f95-1e5d88615c1d', 'V4 - Distinctly', NULL, NULL, 'shade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-05 02:54:24', '2025-05-05 02:54:24', NULL),
('7224fa8d-3bc3-4622-9e3a-d4992c6cbe8a', 'Gray', NULL, NULL, 'color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 07:56:19', '2025-04-28 07:56:19', NULL),
('732e34a1-8a6a-4259-9ff0-563f04e57d39', 'Decor', NULL, NULL, 'property_location', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-22 06:20:11', '2025-04-22 06:20:11', NULL),
('7454c5bd-5c72-44bd-b942-dfbf3ec6eb54', 'Polished', NULL, NULL, 'finish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 06:15:53', '2025-04-28 06:15:53', NULL),
('748aa0ff-44e0-4f33-bd4e-422846bc3652', 'Honed', NULL, NULL, 'feature', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 07:31:06', '2025-04-28 07:31:06', NULL),
('7b3d9f3d-cd3a-4aa6-ac51-5c85df3ff90e', 'V3 - Moderately', NULL, NULL, 'shade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-05 02:54:15', '2025-05-05 02:54:15', NULL),
('7e2acda5-5184-481d-9597-74f12f9c60c1', 'rh54', NULL, NULL, 'brand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-24 06:49:53', '2025-04-24 06:49:53', NULL),
('82711328-6921-4e13-9ba3-f9777ef90bbe', 'Outdoor Tiles', NULL, NULL, 'type', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-24 06:49:12', '2025-04-24 06:49:12', NULL),
('8c466a3e-2387-499b-8b3b-4ed957032530', 'Wall Tile', NULL, NULL, 'purpose', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 05:44:11', '2025-04-28 05:44:16', NULL),
('8e0a6fc2-0277-4e5e-848c-bfe538a6b614', 'Rustic', NULL, NULL, 'finish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 06:15:48', '2025-04-28 06:15:48', NULL),
('8e8c658f-bed5-4444-b287-a75a37a14b0e', 'Porcelain', NULL, NULL, 'property_location', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-22 06:19:49', '2025-04-22 06:19:49', NULL),
('97fc15f7-0ef1-442e-9d77-bd9a26715b0b', 'Satin', NULL, NULL, 'feature', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 07:30:51', '2025-04-28 07:30:51', NULL),
('999ca636-402c-487b-a0fc-9f432a841e39', 'Beige', NULL, NULL, 'color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 07:56:15', '2025-04-28 07:56:15', NULL),
('99c2e322-8faf-4377-b6b3-e4cb90b857f4', 'Rock', NULL, NULL, 'feature', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 07:31:01', '2025-04-28 07:31:01', NULL),
('a2f4b86a-f3c6-44bc-bf4f-7d069d3e9f5b', 'Bullnose', NULL, NULL, 'feature', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 07:30:29', '2025-04-28 07:30:29', NULL),
('a4a9a8af-0753-4f1b-9ad7-d33e66c545f9', 'vxvc', NULL, NULL, 'brand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-24 06:49:39', '2025-04-24 06:49:39', NULL),
('a4b1ce8d-8f61-4069-9373-544e1a73940f', 'Garage', NULL, NULL, 'application', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 09:20:15', '2025-04-28 09:20:15', NULL),
('abc7b352-415a-4bc1-bb66-dd9d0ab35854', 'White', NULL, NULL, 'color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 07:55:52', '2025-04-28 07:55:52', NULL),
('ac77e994-983a-467e-8c26-2edd9b70c67a', 'Glazed Polished Porcelain', NULL, NULL, 'property_location', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-22 06:20:04', '2025-04-22 06:20:04', NULL),
('ae5728d8-2e6e-446f-b375-65917a7f2bdd', 'asd', NULL, NULL, 'brand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-24 06:49:36', '2025-04-24 06:49:36', NULL),
('ae5b9b95-04d9-4f5b-bd41-fe4e791b5009', 'Accent', NULL, NULL, 'color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 07:56:49', '2025-04-28 07:56:49', NULL),
('b129dcdd-bee7-447e-86ba-77e363376ce2', 'Lappato', NULL, NULL, 'feature', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 07:31:10', '2025-04-28 07:31:10', NULL),
('b7a4b309-c477-44f4-b43b-6587bfa86c7d', 'Bedroom', NULL, NULL, 'application', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 09:19:44', '2025-04-28 09:19:44', NULL),
('ba70177a-d610-46da-bbe5-1d45caa2a8fa', '26', NULL, NULL, 'purpose', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 05:36:33', '2025-04-28 05:36:33', NULL),
('bb0bfb2e-7754-420d-ab2e-204db439fe94', 'Structured', NULL, NULL, 'feature', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 07:30:36', '2025-04-28 07:30:36', NULL),
('be38da44-7407-411b-bd4d-29e45da03deb', 'V2 - Slightly', NULL, NULL, 'shade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-05 02:54:03', '2025-05-05 02:54:03', NULL),
('bffba93b-009a-4ad2-b77f-85e7079a9f57', 'Kitchen', NULL, NULL, 'application', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 09:19:32', '2025-04-28 09:19:32', NULL),
('c0cd5400-81fb-4dda-a097-5752ac6bcb5c', '600mm x 400mm', NULL, NULL, 'size', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 06:04:10', '2025-04-28 06:04:10', NULL),
('cf2debce-7dec-4ab3-9f2e-7ab0f10aa81f', 'Moss Green', NULL, NULL, 'color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 07:56:34', '2025-04-28 07:56:34', NULL),
('dd90293f-39ad-4cff-b5a9-51363568e10b', '150mm x 900mm', NULL, NULL, 'size', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 06:05:43', '2025-04-28 06:05:43', NULL),
('ddee9498-54aa-48b8-916c-ff1cf5766704', '5y4', NULL, NULL, 'brand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-24 06:50:02', '2025-04-24 06:50:02', NULL),
('deaaa35a-07fd-4b75-9b1f-76b0ad51e323', '600mm x 600mm', NULL, NULL, 'size', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 05:57:12', '2025-04-28 05:57:12', NULL),
('e06b984f-5c01-469c-a564-abaeecc02e3a', 'Brown', NULL, NULL, 'color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 07:56:28', '2025-04-28 07:56:28', NULL),
('ecf13307-c826-471f-903e-daeda4ec49d0', '200mm x 200mm', NULL, NULL, 'size', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 06:05:32', '2025-04-28 06:05:32', NULL),
('edd80add-fd49-4c93-a862-443ff6843d16', 'asd', NULL, NULL, 'feature', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 07:29:36', '2025-04-28 07:29:36', NULL),
('ef818a24-4bff-4c53-81bc-351a5cea21ef', 'Floor Tile', NULL, NULL, 'purpose', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 05:44:06', '2025-04-28 05:44:06', NULL),
('f40ccc91-5def-47cc-9f0a-7f9e0dfffefd', '1500mm x 900mm', NULL, NULL, 'size', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 06:05:53', '2025-04-28 06:05:53', NULL),
('f6732348-3bbe-44f9-96d7-94ae9b16ecbd', 'Ceramic', NULL, NULL, 'property_location', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-22 06:19:40', '2025-04-22 06:19:40', NULL),
('f7165d45-c8b6-4074-876a-e5593960ac5b', '400mm x 400mm', NULL, NULL, 'size', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 06:04:46', '2025-04-28 06:04:46', NULL),
('fc0f7b88-2beb-41a9-a29d-d096397cf1bf', '200mm x 400mm', NULL, NULL, 'size', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 06:05:22', '2025-04-28 06:05:22', NULL),
('fd891e3f-231b-46ef-b043-c019201f479d', 'Anti-Slip', NULL, NULL, 'feature', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 07:30:10', '2025-04-28 07:30:10', NULL),
('fe81a93a-253a-42c7-894f-b0d59dc547d9', '600mm x 1200mm', NULL, NULL, 'size', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-28 06:04:23', '2025-04-28 06:04:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tiles`
--

CREATE TABLE `tiles` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `material` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shade_tone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `features` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `application` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL,
  `featured` tinyint NOT NULL DEFAULT '0',
  `enabled` tinyint NOT NULL DEFAULT '1',
  `tracking_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gmap_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_at` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `floor_area` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lot_area` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bedroom` tinyint DEFAULT NULL,
  `t_and_b` tinyint DEFAULT NULL,
  `storeys` tinyint DEFAULT NULL,
  `powder_room` tinyint DEFAULT NULL,
  `order` tinyint NOT NULL,
  `enabled` tinyint NOT NULL DEFAULT '1',
  `tracking_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `role_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `enabled`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `role_id`) VALUES
('50cc330f-885b-4c37-a8df-1b73e06e0005', 'admin@admin.com', '2025-04-22 02:46:57', '$2y$10$Li21QyioXCpzd86mpSPs0OcA0bvTJFpHnvnjysVgvM5uyuoj8beDS', 1, 'GpZG2tEMkQ', '2025-04-22 02:46:58', '2025-04-22 02:46:58', NULL, '3e6bf8b0-bb98-47bb-9387-237867ccea2f');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `user_id`, `member_id`, `first_name`, `last_name`, `full_name`, `contact_number`, `telephone_number`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
('84bd6da1-17ab-42ae-b184-6ea68c2e365a', '50cc330f-885b-4c37-a8df-1b73e06e0005', 'e61480f4-ba0f-425e-9347-3b38c9e8d901', 'John', 'Doe', 'John Doe', '620.357.6982', NULL, '', '2025-04-22 02:46:58', '2025-04-22 02:46:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vicinities`
--

CREATE TABLE `vicinities` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `yt_id` longtext COLLATE utf8mb4_unicode_ci,
  `yt_url` longtext COLLATE utf8mb4_unicode_ci,
  `embed_url` longtext COLLATE utf8mb4_unicode_ci,
  `yt_title` longtext COLLATE utf8mb4_unicode_ci,
  `yt_thumbnail` longtext COLLATE utf8mb4_unicode_ci,
  `yt_published_date` timestamp NULL DEFAULT NULL,
  `keyword` longtext COLLATE utf8mb4_unicode_ci,
  `featured` tinyint NOT NULL DEFAULT '0',
  `enabled` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `website_settings`
--

CREATE TABLE `website_settings` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accordions`
--
ALTER TABLE `accordions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amenities_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boards`
--
ALTER TABLE `boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buttons`
--
ALTER TABLE `buttons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `careers`
--
ALTER TABLE `careers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `landmarks`
--
ALTER TABLE `landmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `landmarks_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logs_editor_id_foreign` (`editor_id`);

--
-- Indexes for table `metadata`
--
ALTER TABLE `metadata`
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
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_sections`
--
ALTER TABLE `page_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_platforms`
--
ALTER TABLE `payment_platforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_platforms_payment_method_id_foreign` (`payment_method_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxonomies`
--
ALTER TABLE `taxonomies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taxonomies_type_index` (`type`);

--
-- Indexes for table `tiles`
--
ALTER TABLE `tiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_details_user_id_foreign` (`user_id`);

--
-- Indexes for table `vicinities`
--
ALTER TABLE `vicinities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vicinities_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `website_settings`
--
ALTER TABLE `website_settings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `amenities`
--
ALTER TABLE `amenities`
  ADD CONSTRAINT `amenities_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `landmarks`
--
ALTER TABLE `landmarks`
  ADD CONSTRAINT `landmarks_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_editor_id_foreign` FOREIGN KEY (`editor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_platforms`
--
ALTER TABLE `payment_platforms`
  ADD CONSTRAINT `payment_platforms_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vicinities`
--
ALTER TABLE `vicinities`
  ADD CONSTRAINT `vicinities_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `landmarks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
