-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2022 at 08:22 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Laptops', 'laptops', '2022-10-24 21:59:54', '2022-10-24 21:59:54'),
(2, 'Desktops', 'desktops', '2022-10-24 21:59:54', '2022-10-24 21:59:54'),
(3, 'Phones', 'phones', '2022-10-24 21:59:54', '2022-10-24 21:59:54'),
(4, 'Tablets', 'tablets', '2022-10-24 21:59:54', '2022-10-24 21:59:54'),
(5, 'TVs', 'tvs', '2022-10-24 21:59:54', '2022-10-24 21:59:54'),
(6, 'Cameras', 'cameras', '2022-10-24 21:59:54', '2022-10-24 21:59:54');

-- --------------------------------------------------------

--
-- Table structure for table `country_visits`
--

CREATE TABLE `country_visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visits` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country_visits`
--

INSERT INTO `country_visits` (`id`, `country`, `visits`, `created_at`, `updated_at`) VALUES
(1, 'United States', 18, '2022-11-02 16:41:33', '2022-12-15 03:29:48');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) DEFAULT NULL,
  `percent_off` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `percent_off`, `created_at`, `updated_at`) VALUES
(1, 'ABC123', 'fixed', 20, NULL, '2022-10-24 21:59:55', '2022-10-24 21:59:55'),
(2, 'DEF456', 'percent', NULL, 40, '2022-10-24 21:59:55', '2022-10-24 21:59:55');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 1, 'provider_id', 'text', 'Provider', 0, 1, 1, 0, 0, 0, NULL, 13),
(23, 4, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(24, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(25, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:products,slug\"}}', 3),
(26, 4, 'details', 'text', 'Details', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 4),
(27, 4, 'price', 'number', 'Price', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 5),
(28, 4, 'image', 'image', 'Image', 1, 1, 1, 1, 1, 1, NULL, 6),
(29, 4, 'images', 'multiple_images', 'Images', 0, 1, 1, 1, 1, 1, NULL, 7),
(30, 4, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, '{\"on\":\"Yes\",\"off\":\"No\",\"checked\":\"true\"}', 8),
(31, 4, 'category_id', 'number', 'Category Id', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 9),
(32, 4, 'description', 'rich_text_box', 'Description', 1, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"required\"}}', 10),
(33, 4, 'quantity', 'number', 'Quantity', 1, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"required\"}}', 11),
(34, 4, 'product_belongsto_category_relationship', 'relationship', 'Category', 1, 1, 1, 1, 1, 0, '{\"model\":\"App\\\\Category\",\"table\":\"category\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"category\",\"pivot\":0}', 12),
(35, 4, 'product_belongstomany_tag_relationship', 'relationship', 'Tags', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Tag\",\"table\":\"tags\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"product_tag\",\"pivot\":\"1\",\"taggable\":\"on\"}', 13),
(36, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 14),
(37, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, NULL, 15),
(38, 5, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(39, 5, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(40, 5, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, NULL, 3),
(41, 5, 'category_hasmany_product_relationship', 'relationship', 'Products', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"hasMany\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"category\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(42, 5, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 5),
(43, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(44, 6, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'code', 'text', 'Code', 1, 1, 1, 1, 1, 1, NULL, 2),
(46, 6, 'type', 'select_dropdown', 'Type', 1, 1, 1, 1, 1, 1, '{\"default\":\"fixed\",\"options\":{\"fixed\":\"Fixed value\",\"percent_off\":\"Percent Off\"}}', 3),
(47, 6, 'value', 'number', 'Value', 0, 1, 1, 1, 1, 1, NULL, 4),
(48, 6, 'percent_off', 'number', 'Percent Off', 0, 1, 1, 1, 1, 1, NULL, 5),
(49, 6, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 6),
(50, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(51, 7, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(52, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{\"rules\":\"unique:tags,name\"}', 2),
(53, 7, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"rules\":\"unique:tags,slug\"}', 3),
(54, 7, 'tag_belongstomany_product_relationship', 'relationship', 'Products', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"product_tag\",\"pivot\":\"1\",\"taggable\":\"0\"}', 4),
(55, 7, 'create_at', 'timestamp', 'voyager::seeders.data_rows.create_at', 0, 0, 0, 0, 0, 0, NULL, 5),
(56, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(57, 9, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(58, 9, 'user_id', 'number', 'User Id', 0, 0, 1, 0, 0, 0, NULL, 2),
(59, 9, 'billing_email', 'text', 'Email', 1, 1, 1, 1, 1, 0, NULL, 3),
(60, 9, 'billing_name', 'text', 'Name', 1, 1, 1, 1, 1, 0, NULL, 4),
(61, 9, 'billing_city', 'text', 'City', 1, 1, 1, 1, 1, 0, NULL, 5),
(62, 9, 'billing_province', 'text', 'Province', 1, 0, 1, 1, 0, 0, NULL, 6),
(63, 9, 'billing_postalcode', 'text', 'Postal Code', 1, 0, 1, 1, 0, 0, NULL, 7),
(64, 9, 'billing_phone', 'number', 'Phone', 1, 0, 1, 0, 0, 0, NULL, 8),
(65, 9, 'billing_name_on_card', 'text', 'Name on card', 1, 0, 1, 0, 0, 0, NULL, 9),
(66, 9, 'billing_discount', 'number', 'Discount', 1, 0, 1, 0, 0, 0, NULL, 10),
(67, 9, 'billing_discount_code', 'text', 'Discount code', 0, 0, 1, 0, 0, 0, NULL, 11),
(68, 9, 'billing_subtotal', 'number', 'Subtotal', 1, 0, 1, 0, 0, 0, NULL, 15),
(69, 9, 'billing_tax', 'number', 'Tax', 1, 0, 1, 0, 0, 0, NULL, 13),
(70, 9, 'billing_total', 'number', 'Total', 1, 1, 1, 0, 0, 0, NULL, 14),
(71, 9, 'payment_gateway', 'text', 'Gateway', 1, 0, 1, 0, 0, 0, '{\"null\":\"\"}', 15),
(72, 9, 'shipped', 'checkbox', 'Shipped', 1, 1, 1, 0, 0, 0, '{\"checked\":\"false\",\"on\":\"Yes\",\"off\":\"No\"}', 16),
(73, 9, 'error', 'text', 'Error', 1, 1, 1, 0, 0, 0, '{\"null\":\"\"}', 17),
(74, 9, 'order_belongstomany_product_relationship', 'relationship', 'Order Products', 0, 1, 1, 0, 0, 0, '{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"order_product\",\"pivot\":1}', 18),
(75, 9, 'order_belongsto_user_relationship', 'relationship', 'User', 0, 1, 1, 0, 0, 0, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"orders\",\"pivot\":0}', 19),
(76, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 13),
(77, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, NULL, 14);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2022-10-24 22:00:20', '2022-10-24 22:00:20'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-10-24 22:00:20', '2022-10-24 22:00:20'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2022-10-24 22:00:20', '2022-10-24 22:00:20'),
(4, 'products', 'products', 'Product', 'Products', 'voyager-bag', 'App\\Product', '', '', '', 1, 0, NULL, '2022-10-24 22:00:31', '2022-10-24 22:00:31'),
(5, 'category', 'category', 'Category', 'Categories', 'voyager-categories', 'App\\Category', NULL, '', '', 1, 0, NULL, '2022-10-24 22:00:31', '2022-10-24 22:00:31'),
(6, 'coupons', 'coupons', 'Coupon', 'Coupons', 'voyager-buy', 'App\\Coupon', NULL, '', '', 1, 0, NULL, '2022-10-24 22:00:31', '2022-10-24 22:00:31'),
(7, 'tags', 'tags', 'Tag', 'Tags', 'voyager-tag', 'App\\Tag', NULL, '', '', 1, 0, NULL, '2022-10-24 22:00:31', '2022-10-24 22:00:31'),
(8, 'product_tag', 'product_tag', 'Product Tag', 'Products Tags', '', 'App\\ProductTag', NULL, '', '', 1, 0, NULL, '2022-10-24 22:00:32', '2022-10-24 22:00:32'),
(9, 'orders', 'orders', 'Order', 'Orders', 'voyager-documentation', 'App\\Order', '', 'App\\Http\\Controllers\\Voyager\\OrdersController', '', 1, 0, NULL, '2022-10-24 22:00:32', '2022-10-24 22:00:32'),
(10, 'visits', 'country_visits', 'Country Visit', 'Country Visits', 'voyager-documentation', 'App\\CountryVisit', '', NULL, '', 1, 0, NULL, '2022-10-24 22:00:32', '2022-10-24 22:00:32');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-10-24 22:00:22', '2022-10-24 22:00:22'),
(2, 'main', '2022-10-24 22:00:40', '2022-10-24 22:00:40');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-10-24 22:00:22', '2022-10-24 22:00:22', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2022-10-24 22:00:23', '2022-10-24 22:00:23', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2022-10-24 22:00:23', '2022-10-24 22:00:23', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2022-10-24 22:00:23', '2022-10-24 22:00:23', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2022-10-24 22:00:23', '2022-10-24 22:00:23', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2022-10-24 22:00:23', '2022-10-24 22:00:23', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2022-10-24 22:00:23', '2022-10-24 22:00:23', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2022-10-24 22:00:23', '2022-10-24 22:00:23', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2022-10-24 22:00:23', '2022-10-24 22:00:23', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2022-10-24 22:00:23', '2022-10-24 22:00:23', 'voyager.settings.index', NULL),
(11, 2, 'Shop', '', '_self', NULL, NULL, NULL, 1, '2022-10-24 22:00:41', '2022-10-24 22:00:41', 'shop.index', NULL),
(12, 2, 'About', '#', '_self', NULL, NULL, NULL, 2, '2022-10-24 22:00:41', '2022-10-24 22:00:41', NULL, NULL),
(13, 2, 'Blog', '#', '_self', NULL, NULL, NULL, 3, '2022-10-24 22:00:41', '2022-10-24 22:00:41', NULL, NULL),
(14, 2, 'Cart', '', '_self', NULL, NULL, NULL, 4, '2022-10-24 22:00:41', '2022-10-24 22:00:41', 'cart.index', NULL),
(15, 1, 'Products', '', '_self', 'voyager-bag', NULL, NULL, 15, '2022-10-24 22:00:41', '2022-10-24 22:00:41', 'voyager.products.index', NULL),
(16, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 16, '2022-10-24 22:00:41', '2022-10-24 22:00:41', 'voyager.category.index', NULL),
(17, 1, 'Coupons', '', '_self', 'voyager-wand', NULL, NULL, 17, '2022-10-24 22:00:41', '2022-10-24 22:00:41', 'voyager.coupons.index', NULL),
(18, 1, 'Tags', '', '_self', 'voyager-tag', NULL, NULL, 18, '2022-10-24 22:00:42', '2022-10-24 22:00:42', 'voyager.tags.index', NULL),
(19, 1, 'Orders', '', '_self', 'voyager-documentation', NULL, NULL, 19, '2022-10-24 22:00:42', '2022-10-24 22:00:42', 'voyager.orders.index', NULL),
(20, 1, 'Country Visits', '', '_self', 'voyager-pie-chart', NULL, NULL, 20, '2022-10-24 22:00:42', '2022-10-24 22:00:42', 'voyager.visits', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_10_16_185424_create_products_table', 1),
(25, '2019_10_17_195112_create_categories_table', 1),
(26, '2019_10_17_195227_add_category_id_to_products_table', 1),
(27, '2019_10_18_002421_create_coupons_table', 1),
(28, '2019_10_19_145706_add_images_column_to_products', 1),
(29, '2019_10_20_114921_create_tags_table', 1),
(30, '2019_10_20_115306_create_products_tags_table', 1),
(31, '2019_10_22_185425_create_orders_table', 1),
(32, '2019_10_22_190613_create_order_product_table', 1),
(33, '2019_11_09_002942_add_quantity_to_products_table', 1),
(34, '2020_06_27_012504_create_visits_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_postalcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_name_on_card` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_discount` int(11) NOT NULL DEFAULT 0,
  `billing_discount_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_subtotal` int(11) NOT NULL,
  `billing_tax` int(11) NOT NULL,
  `billing_total` int(11) NOT NULL,
  `payment_gateway` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'stripe',
  `shipped` tinyint(1) NOT NULL DEFAULT 0,
  `error` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `billing_email`, `billing_name`, `billing_address`, `billing_city`, `billing_province`, `billing_postalcode`, `billing_phone`, `billing_name_on_card`, `billing_discount`, `billing_discount_code`, `billing_subtotal`, `billing_tax`, `billing_total`, `payment_gateway`, `shipped`, `error`, `created_at`, `updated_at`) VALUES
(1, 1, 'orn.wendell@gmail.com', 'bashirian.sheridan', 'Suite 344', 'Schinnerhaven', 'Justicetown', '38839-5682', '+14962716572', 'nicholas.nicolas', 0, NULL, 1000, 200, 1200, 'stripe', 1, 'Error', '2022-10-24 22:00:49', '2022-10-24 22:00:49'),
(2, 1, 'berneice00@gmail.com', 'quitzon.marjory', 'Suite 004', 'West Connerchester', 'West Erica', '88001', '296.415.0291', 'macie74', 0, NULL, 1000, 200, 1200, 'stripe', 0, NULL, '2022-10-24 22:00:50', '2022-10-24 22:00:50'),
(3, 1, 'lakin.jewell@yahoo.com', 'schmitt.amely', 'Apt. 608', 'South Urbanshire', 'New Fredy', '91868-8412', '434-245-6491 x633', 'eldora.hamill', 0, NULL, 1000, 200, 1200, 'stripe', 1, NULL, '2022-10-24 22:00:50', '2022-10-24 22:00:50'),
(4, NULL, 'nicholas.bogisich@hotmail.com', 'conor49', 'Suite 554', 'Darrylton', 'Port Macy', '45607', '+1.219.885.2300', 'epouros', 0, NULL, 1000, 200, 1200, 'stripe', 0, NULL, '2022-10-24 22:00:50', '2022-10-24 22:00:50'),
(5, 1, 'ruby79@dickinson.com', 'angeline09', 'Apt. 806', 'Port Thea', 'Kingfort', '98564-5253', '958.748.8109 x6924', 'astrid54', 0, NULL, 1000, 200, 1200, 'stripe', 0, 'Error', '2022-10-24 22:00:50', '2022-10-24 22:00:50'),
(6, 1, 'katelyn38@gmail.com', 'richard.mckenzie', 'Apt. 395', 'Calebbury', 'East Toy', '15566', '835.895.5266', 'tyree19', 0, NULL, 1000, 200, 1200, 'stripe', 1, NULL, '2022-10-24 22:00:50', '2022-10-24 22:00:50'),
(7, 1, 'kohler.gregg@hotmail.com', 'baltenwerth', 'Suite 932', 'Strosinland', 'Port Rahulmouth', '31478', '+1 (934) 891-0980', 'devon48', 0, NULL, 1000, 200, 1200, 'stripe', 1, NULL, '2022-10-24 22:00:50', '2022-10-24 22:00:50'),
(8, NULL, 'schoen.christian@yahoo.com', 'eliezer24', 'Suite 486', 'Sigurdhaven', 'Altenwerthfurt', '20941', '+12085807233', 'marquardt.stanford', 0, NULL, 1000, 200, 1200, 'stripe', 0, NULL, '2022-10-24 22:00:50', '2022-10-24 22:00:50'),
(9, NULL, 'zfay@gmail.com', 'phayes', 'Suite 021', 'Lake Meagan', 'Donnellybury', '91600-8824', '1-761-453-4614', 'sporer.mae', 0, NULL, 1000, 200, 1200, 'stripe', 1, 'Error', '2022-10-24 22:00:50', '2022-10-24 22:00:50'),
(10, 1, 'edicki@gmail.com', 'satterfield.kurt', 'Suite 526', 'Kiehnberg', 'Lake Matt', '13562-7985', '803-794-5228 x5707', 'fhills', 0, NULL, 1000, 200, 1200, 'stripe', 0, NULL, '2022-10-24 22:00:50', '2022-10-24 22:00:50'),
(11, 2, 'hajo@gmail.com', 'هجو عبدالقادر', 'الإسكان', 'امدرمان', 'الاسكان', '1245868', '0992098618', 'هجو عبدالقادر', 0, NULL, 22500, 4725, 27225, 'stripe', 0, NULL, '2022-12-14 04:47:11', '2022-12-14 04:47:11');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `product_id`, `order_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, NULL, 7, 1, '2022-10-24 22:00:50', '2022-10-24 22:00:50'),
(2, NULL, 3, 2, '2022-10-24 22:00:50', '2022-10-24 22:00:50'),
(3, NULL, 5, 3, '2022-10-24 22:00:50', '2022-10-24 22:00:50'),
(4, NULL, 4, 3, '2022-10-24 22:00:50', '2022-10-24 22:00:50'),
(5, NULL, 4, 2, '2022-10-24 22:00:50', '2022-10-24 22:00:50'),
(6, NULL, 8, 3, '2022-10-24 22:00:51', '2022-10-24 22:00:51'),
(7, NULL, 4, 3, '2022-10-24 22:00:51', '2022-10-24 22:00:51'),
(8, NULL, 3, 3, '2022-10-24 22:00:51', '2022-10-24 22:00:51'),
(9, NULL, 6, 3, '2022-10-24 22:00:51', '2022-10-24 22:00:51'),
(10, NULL, 4, 2, '2022-10-24 22:00:51', '2022-10-24 22:00:51'),
(11, NULL, 1, 2, '2022-10-24 22:00:51', '2022-10-24 22:00:51'),
(12, NULL, 3, 1, '2022-10-24 22:00:51', '2022-10-24 22:00:51'),
(13, NULL, 9, 1, '2022-10-24 22:00:51', '2022-10-24 22:00:51'),
(14, NULL, 7, 2, '2022-10-24 22:00:51', '2022-10-24 22:00:51'),
(15, NULL, 1, 2, '2022-10-24 22:00:51', '2022-10-24 22:00:51'),
(16, NULL, 8, 2, '2022-10-24 22:00:51', '2022-10-24 22:00:51'),
(17, NULL, 3, 1, '2022-10-24 22:00:51', '2022-10-24 22:00:51'),
(18, NULL, 6, 1, '2022-10-24 22:00:51', '2022-10-24 22:00:51'),
(19, NULL, 1, 3, '2022-10-24 22:00:51', '2022-10-24 22:00:51'),
(20, NULL, 7, 1, '2022-10-24 22:00:51', '2022-10-24 22:00:51'),
(21, NULL, 10, 3, '2022-10-24 22:00:51', '2022-10-24 22:00:51'),
(22, NULL, 7, 2, '2022-10-24 22:00:51', '2022-10-24 22:00:51'),
(23, NULL, 1, 2, '2022-10-24 22:00:51', '2022-10-24 22:00:51'),
(24, NULL, 5, 2, '2022-10-24 22:00:52', '2022-10-24 22:00:52'),
(25, NULL, 6, 1, '2022-10-24 22:00:52', '2022-10-24 22:00:52'),
(26, NULL, 5, 3, '2022-10-24 22:00:52', '2022-10-24 22:00:52'),
(27, NULL, 10, 3, '2022-10-24 22:00:52', '2022-10-24 22:00:52'),
(28, NULL, 9, 2, '2022-10-24 22:00:52', '2022-10-24 22:00:52'),
(29, NULL, 8, 3, '2022-10-24 22:00:52', '2022-10-24 22:00:52'),
(30, NULL, 2, 3, '2022-10-24 22:00:52', '2022-10-24 22:00:52'),
(31, NULL, 11, 5, '2022-12-14 04:47:11', '2022-12-14 04:47:11');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-10-24 22:00:24', '2022-10-24 22:00:24'),
(2, 'browse_bread', NULL, '2022-10-24 22:00:24', '2022-10-24 22:00:24'),
(3, 'browse_database', NULL, '2022-10-24 22:00:24', '2022-10-24 22:00:24'),
(4, 'browse_media', NULL, '2022-10-24 22:00:24', '2022-10-24 22:00:24'),
(5, 'browse_compass', NULL, '2022-10-24 22:00:24', '2022-10-24 22:00:24'),
(6, 'browse_menus', 'menus', '2022-10-24 22:00:25', '2022-10-24 22:00:25'),
(7, 'read_menus', 'menus', '2022-10-24 22:00:25', '2022-10-24 22:00:25'),
(8, 'edit_menus', 'menus', '2022-10-24 22:00:25', '2022-10-24 22:00:25'),
(9, 'add_menus', 'menus', '2022-10-24 22:00:25', '2022-10-24 22:00:25'),
(10, 'delete_menus', 'menus', '2022-10-24 22:00:25', '2022-10-24 22:00:25'),
(11, 'browse_roles', 'roles', '2022-10-24 22:00:25', '2022-10-24 22:00:25'),
(12, 'read_roles', 'roles', '2022-10-24 22:00:25', '2022-10-24 22:00:25'),
(13, 'edit_roles', 'roles', '2022-10-24 22:00:25', '2022-10-24 22:00:25'),
(14, 'add_roles', 'roles', '2022-10-24 22:00:25', '2022-10-24 22:00:25'),
(15, 'delete_roles', 'roles', '2022-10-24 22:00:25', '2022-10-24 22:00:25'),
(16, 'browse_users', 'users', '2022-10-24 22:00:25', '2022-10-24 22:00:25'),
(17, 'read_users', 'users', '2022-10-24 22:00:25', '2022-10-24 22:00:25'),
(18, 'edit_users', 'users', '2022-10-24 22:00:25', '2022-10-24 22:00:25'),
(19, 'add_users', 'users', '2022-10-24 22:00:25', '2022-10-24 22:00:25'),
(20, 'delete_users', 'users', '2022-10-24 22:00:25', '2022-10-24 22:00:25'),
(21, 'browse_settings', 'settings', '2022-10-24 22:00:25', '2022-10-24 22:00:25'),
(22, 'read_settings', 'settings', '2022-10-24 22:00:25', '2022-10-24 22:00:25'),
(23, 'edit_settings', 'settings', '2022-10-24 22:00:26', '2022-10-24 22:00:26'),
(24, 'add_settings', 'settings', '2022-10-24 22:00:26', '2022-10-24 22:00:26'),
(25, 'delete_settings', 'settings', '2022-10-24 22:00:26', '2022-10-24 22:00:26'),
(26, 'browse_products', 'products', '2022-10-24 22:00:42', '2022-10-24 22:00:42'),
(27, 'read_products', 'products', '2022-10-24 22:00:42', '2022-10-24 22:00:42'),
(28, 'edit_products', 'products', '2022-10-24 22:00:42', '2022-10-24 22:00:42'),
(29, 'add_products', 'products', '2022-10-24 22:00:42', '2022-10-24 22:00:42'),
(30, 'delete_products', 'products', '2022-10-24 22:00:43', '2022-10-24 22:00:43'),
(31, 'browse_category', 'category', '2022-10-24 22:00:43', '2022-10-24 22:00:43'),
(32, 'read_category', 'category', '2022-10-24 22:00:43', '2022-10-24 22:00:43'),
(33, 'edit_category', 'category', '2022-10-24 22:00:43', '2022-10-24 22:00:43'),
(34, 'add_category', 'category', '2022-10-24 22:00:43', '2022-10-24 22:00:43'),
(35, 'delete_category', 'category', '2022-10-24 22:00:43', '2022-10-24 22:00:43'),
(36, 'browse_coupons', 'coupons', '2022-10-24 22:00:43', '2022-10-24 22:00:43'),
(37, 'read_coupons', 'coupons', '2022-10-24 22:00:43', '2022-10-24 22:00:43'),
(38, 'edit_coupons', 'coupons', '2022-10-24 22:00:43', '2022-10-24 22:00:43'),
(39, 'add_coupons', 'coupons', '2022-10-24 22:00:43', '2022-10-24 22:00:43'),
(40, 'delete_coupons', 'coupons', '2022-10-24 22:00:44', '2022-10-24 22:00:44'),
(41, 'browse_tags', 'tags', '2022-10-24 22:00:44', '2022-10-24 22:00:44'),
(42, 'read_tags', 'tags', '2022-10-24 22:00:44', '2022-10-24 22:00:44'),
(43, 'edit_tags', 'tags', '2022-10-24 22:00:44', '2022-10-24 22:00:44'),
(44, 'add_tags', 'tags', '2022-10-24 22:00:44', '2022-10-24 22:00:44'),
(45, 'delete_tags', 'tags', '2022-10-24 22:00:44', '2022-10-24 22:00:44'),
(46, 'browse_product_tag', 'product_tag', '2022-10-24 22:00:44', '2022-10-24 22:00:44'),
(47, 'read_product_tag', 'product_tag', '2022-10-24 22:00:44', '2022-10-24 22:00:44'),
(48, 'edit_product_tag', 'product_tag', '2022-10-24 22:00:44', '2022-10-24 22:00:44'),
(49, 'add_product_tag', 'product_tag', '2022-10-24 22:00:44', '2022-10-24 22:00:44'),
(50, 'delete_product_tag', 'product_tag', '2022-10-24 22:00:44', '2022-10-24 22:00:44'),
(51, 'browse_orders', 'orders', '2022-10-24 22:00:45', '2022-10-24 22:00:45'),
(52, 'read_orders', 'orders', '2022-10-24 22:00:45', '2022-10-24 22:00:45'),
(53, 'edit_orders', 'orders', '2022-10-24 22:00:45', '2022-10-24 22:00:45'),
(54, 'add_orders', 'orders', '2022-10-24 22:00:45', '2022-10-24 22:00:45'),
(55, 'delete_orders', 'orders', '2022-10-24 22:00:45', '2022-10-24 22:00:45'),
(56, 'browse_country_visits', 'country_visits', '2022-10-24 22:00:45', '2022-10-24 22:00:45'),
(57, 'read_country_visits', 'country_visits', '2022-10-24 22:00:45', '2022-10-24 22:00:45'),
(58, 'edit_country_visits', 'country_visits', '2022-10-24 22:00:45', '2022-10-24 22:00:45'),
(59, 'add_country_visits', 'country_visits', '2022-10-24 22:00:45', '2022-10-24 22:00:45'),
(60, 'delete_country_visits', 'country_visits', '2022-10-24 22:00:45', '2022-10-24 22:00:45');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `details`, `price`, `image`, `images`, `featured`, `quantity`, `category_id`, `description`, `created_at`, `updated_at`) VALUES
(124, 'ساعات رجاليه', 'ساعات', 'ساعة', 4500, 'products\\December2022\\q3hcjscDJxtagyAlOprx.jpg', '[\"products\\\\December2022\\\\M93JgJ0jqSXv6VESJHe5.jpg\"]', 0, 480, 4, '<p>ساعات حديثة وراقية</p>', '2022-12-14 04:58:25', '2022-12-14 04:58:25'),
(125, 'قميص', 'قميص', 'قميص', 4500, 'products\\December2022\\icZMKWVfm0mjsWLbHcJx.jpg', '[\"products\\\\December2022\\\\aTZM54kTolCEn2jK2IAs.jpg\"]', 0, 7999, 2, '<p>قميص راقي&nbsp;</p>', '2022-12-14 05:02:37', '2022-12-14 05:02:37');

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_tag`
--

INSERT INTO `product_tag` (`id`, `product_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(123, 124, 2, NULL, NULL),
(124, 125, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2022-10-24 22:00:24', '2022-10-24 22:00:24'),
(2, 'user', 'Normal User', '2022-10-24 22:00:24', '2022-10-24 22:00:24');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin'),
(11, 'site.stock_threshold', 'Stock Threshold', '5', '', 'number', 6, 'Site');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Tag 0', 'tag-0', '2022-10-24 21:59:54', '2022-10-24 21:59:54'),
(2, 'Tag 1', 'tag-1', '2022-10-24 21:59:55', '2022-10-24 21:59:55'),
(3, 'Tag 2', 'tag-2', '2022-10-24 21:59:55', '2022-10-24 21:59:55'),
(4, 'Tag 3', 'tag-3', '2022-10-24 21:59:55', '2022-10-24 21:59:55');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `github_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `github_id`, `facebook_id`, `google_id`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'بابكر', 'b@gmail.com', 'users/default.png', NULL, NULL, NULL, NULL, '$2y$10$3XD7PADTHOpjk/AupAoGHe7h0Xfb2cLnZPIRigfoyRcnUyS/ty2Sm', 'Rl7glYiZcKoJEAWTklM4Q8G9klcgWkfbDWBB5Dt3pcYr92S98VvImenwzZ0U', '{\"locale\":\"en\"}', '2022-10-24 22:00:30', '2022-12-13 21:14:59'),
(2, 2, 'adbo', 'hajo@gmail.com', 'users/default.png', NULL, NULL, NULL, NULL, '$2y$10$FlFejJsEKc3K18El1g5AEOSA3Yy3DRlUuoezT49ILuEUyleKRpHtW', NULL, NULL, '2022-12-14 01:37:40', '2022-12-14 01:37:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name_unique` (`name`),
  ADD UNIQUE KEY `category_slug_unique` (`slug`);

--
-- Indexes for table `country_visits`
--
ALTER TABLE `country_visits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_product_id_foreign` (`product_id`),
  ADD KEY `order_product_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_tag_product_id_foreign` (`product_id`),
  ADD KEY `product_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `country_visits`
--
ALTER TABLE `country_visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
