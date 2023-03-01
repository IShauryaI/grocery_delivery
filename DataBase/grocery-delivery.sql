-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2023 at 07:27 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grocery-delivery`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add city', 8, 'add_city'),
(30, 'Can change city', 8, 'change_city'),
(31, 'Can delete city', 8, 'delete_city'),
(32, 'Can view city', 8, 'view_city'),
(33, 'Can add store', 9, 'add_store'),
(34, 'Can change store', 9, 'change_store'),
(35, 'Can delete store', 9, 'delete_store'),
(36, 'Can view store', 9, 'view_store'),
(37, 'Can add product', 10, 'add_product'),
(38, 'Can change product', 10, 'change_product'),
(39, 'Can delete product', 10, 'delete_product'),
(40, 'Can view product', 10, 'view_product'),
(41, 'Can add client', 11, 'add_client'),
(42, 'Can change client', 11, 'change_client'),
(43, 'Can delete client', 11, 'delete_client'),
(44, 'Can view client', 11, 'view_client'),
(45, 'Can add cart', 12, 'add_cart'),
(46, 'Can change cart', 12, 'change_cart'),
(47, 'Can delete cart', 12, 'delete_cart'),
(48, 'Can view cart', 12, 'view_cart'),
(49, 'Can add orderDetails', 13, 'add_orderdetails'),
(50, 'Can change orderDetails', 13, 'change_orderdetails'),
(51, 'Can delete orderDetails', 13, 'delete_orderdetails'),
(52, 'Can view orderDetails', 13, 'view_orderdetails'),
(53, 'Can add order', 14, 'add_order'),
(54, 'Can change order', 14, 'change_order'),
(55, 'Can delete order', 14, 'delete_order'),
(56, 'Can view order', 14, 'view_order'),
(57, 'Can add review', 15, 'add_reviews'),
(58, 'Can change review', 15, 'change_reviews'),
(59, 'Can delete review', 15, 'delete_reviews'),
(60, 'Can view review', 15, 'view_reviews');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$aC1LIBUWZiBc8E8vZQtGAp$flnfof8MnlKSQpJ5tCh0ksguMZcBWhQe5gMke1Gxhok=', '2023-02-23 10:51:09.859316', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2023-02-20 10:27:39.104513');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL,
  `cart_quantity` int(11) NOT NULL,
  `cart_total_price` varchar(50) NOT NULL,
  `Client_id` bigint(20) NOT NULL,
  `Product_id` bigint(20) NOT NULL,
  `Store_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_name` varchar(80) NOT NULL,
  `category_description` longtext NOT NULL,
  `category_image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_name`, `category_description`, `category_image`) VALUES
('Bread & Bakery', 'Bread, tortillas, pies, muffins, bagels, cookies, etc.', 'images/category-images/1_BZnApt7.png'),
('Condiments & Spices', 'Black pepper, oregano, cinnamon, sugar, olive oil, ketchup, mayonnaise, etc.', 'images/category-images/2_G3vDD0i.png'),
('Dairy', 'Butter, cheese, eggs, milk, yogurt, etc.', 'images/category-images/3_v98Eqas.png'),
('Fresh Fruits and Vegetables', 'Fresh Fruits and Vegetables', 'images/category-images/4_vaJyt3Z.png'),
('Frozens & Sweets', 'Frozens & Sweets', 'images/category-images/5_LwM5aoe.png'),
('Grains and Pulses', 'Grains and Pulses', 'images/category-images/6_JTHyEu6.png'),
('Household & Cleaning Supplies', 'Laundry detergent, dish soap, dishwashing liquid, paper towels, tissues, trash bags, aluminum foil, zip bags, etc.', 'images/category-images/7_CAP17Cp.png'),
('Ready to eat Snacks', 'Ready to eat Snacks', 'images/category-images/8_BbLjZvz.png');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` bigint(20) NOT NULL,
  `city_name` varchar(255) NOT NULL,
  `city_state` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `city_name`, `city_state`) VALUES
(1, 'Amritsar', 'Punjab'),
(2, 'Jalandhar', 'Punjab'),
(3, 'Ludhiana', 'Punjab'),
(4, 'Delhi', 'U.T.'),
(5, 'Chandigarh', 'U.T.'),
(6, 'Patiala', 'Punjab');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` bigint(20) NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `client_mobile` varchar(20) NOT NULL,
  `client_email` varchar(254) NOT NULL,
  `client_password` varchar(50) NOT NULL,
  `client_otp` varchar(10) DEFAULT NULL,
  `client_address` longtext NOT NULL,
  `City_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `client_name`, `client_mobile`, `client_email`, `client_password`, `client_otp`, `client_address`, `City_id`) VALUES
(1, 'PHP', '9988278402', 'pagalhaipagal@php.com', '1234567890', NULL, 'Kali Ghati ke peeche andheri gali ke saath wali tapri paan wali\r\n                                                         \r\n                                                        \r\n                                                        \r\n                                                        \r\n                                                        \r\n                                                        \r\n                                                        \r\n                                                        ', 1),
(6, 'Jhon Doe', '9915000000', 'jhondoe@developer.com', '1234567890', NULL, 'Jhon Doe Villa, street no. 420', 1),
(7, 'test', '99999999999', 'test@test.com', '1234567890', NULL, 'test house\r\n                                                        \r\n                                                        \r\n                                                        \r\n                                                        ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-02-20 10:30:51.343222', 'Bread & Bakery', 'Bread & Bakery', 1, '[{\"added\": {}}]', 7, 1),
(2, '2023-02-20 10:31:17.212104', 'Frozen Foods', 'Frozen Foods', 1, '[{\"added\": {}}]', 7, 1),
(3, '2023-02-20 10:31:31.305297', 'Household & Cleaning Supplies', 'Household & Cleaning Supplies', 1, '[{\"added\": {}}]', 7, 1),
(4, '2023-02-20 10:31:44.203022', 'Dairy', 'Dairy', 1, '[{\"added\": {}}]', 7, 1),
(5, '2023-02-20 10:32:01.657045', 'Condiments & Spices', 'Condiments & Spices', 1, '[{\"added\": {}}]', 7, 1),
(6, '2023-02-20 10:32:19.319042', 'Grains and Pulses', 'Grains and Pulses', 1, '[{\"added\": {}}]', 7, 1),
(7, '2023-02-20 10:32:38.967141', '1', 'Amritsar', 1, '[{\"added\": {}}]', 8, 1),
(8, '2023-02-20 10:32:52.828905', '2', 'Jalandhar', 1, '[{\"added\": {}}]', 8, 1),
(9, '2023-02-20 10:35:40.496804', '1', 'D Mart', 2, '[{\"changed\": {\"fields\": [\"Store status\"]}}]', 9, 1),
(10, '2023-02-21 08:48:08.251190', '11', 'Amul Masti Dahi', 2, '[{\"changed\": {\"fields\": [\"Product status\"]}}]', 10, 1),
(11, '2023-02-21 08:48:08.251190', '10', 'Amul Butter 100g', 2, '[{\"changed\": {\"fields\": [\"Product status\"]}}]', 10, 1),
(12, '2023-02-21 08:48:08.261314', '9', 'Amul Butter 500g', 2, '[{\"changed\": {\"fields\": [\"Product status\"]}}]', 10, 1),
(13, '2023-02-21 08:48:08.261314', '8', 'Parle G Biscuits', 2, '[{\"changed\": {\"fields\": [\"Product status\"]}}]', 10, 1),
(14, '2023-02-21 08:48:08.277082', '6', 'Amul Milk ', 2, '[{\"changed\": {\"fields\": [\"Product status\"]}}]', 10, 1),
(15, '2023-02-21 08:48:08.277082', '5', 'Good Day Cookies', 2, '[{\"changed\": {\"fields\": [\"Product status\"]}}]', 10, 1),
(16, '2023-02-21 08:48:08.292586', '4', 'Britannia Jim Jam Biscuits', 2, '[{\"changed\": {\"fields\": [\"Product status\"]}}]', 10, 1),
(17, '2023-02-21 08:48:17.715909', '5', 'Good Day Cookies', 2, '[{\"changed\": {\"fields\": [\"Product status\"]}}]', 10, 1),
(18, '2023-02-23 11:18:59.771367', 'Household & Cleaning Supplies', 'Household & Cleaning Supplies', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 7, 1),
(19, '2023-02-23 11:19:10.849449', 'Grains and Pulses', 'Grains and Pulses', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 7, 1),
(20, '2023-02-23 11:19:20.183314', 'Frozen Foods', 'Frozen Foods', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 7, 1),
(21, '2023-02-23 11:19:26.810934', 'Dairy', 'Dairy', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 7, 1),
(22, '2023-02-23 11:19:35.523853', 'Condiments & Spices', 'Condiments & Spices', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 7, 1),
(23, '2023-02-23 11:19:43.460696', 'Bread & Bakery', 'Bread & Bakery', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 7, 1),
(24, '2023-02-23 11:49:28.658228', 'Ready to eat Snacks', 'Ready to eat Snacks', 1, '[{\"added\": {}}]', 7, 1),
(25, '2023-02-23 11:49:49.691935', 'Household & Cleaning Supplies', 'Household & Cleaning Supplies', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 7, 1),
(26, '2023-02-23 11:50:02.782858', 'Grains and Pulses', 'Grains and Pulses', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 7, 1),
(27, '2023-02-23 11:50:20.634695', 'Frozens & Sweets', 'Frozens & Sweets', 1, '[{\"added\": {}}]', 7, 1),
(28, '2023-02-23 11:50:57.109258', 'Frozen Foods', 'Frozen Foods', 3, '', 7, 1),
(29, '2023-02-23 11:51:15.349012', 'Fresh Fruits and Vegetables', 'Fresh Fruits and Vegetables', 1, '[{\"added\": {}}]', 7, 1),
(30, '2023-02-23 11:51:44.759199', 'Condiments & Spices', 'Condiments & Spices', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 7, 1),
(31, '2023-02-23 11:58:23.419635', 'Bread & Bakery', 'Bread & Bakery', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 7, 1),
(32, '2023-02-23 11:59:28.603716', 'Condiments & Spices', 'Condiments & Spices', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 7, 1),
(33, '2023-02-23 11:59:48.701264', 'Dairy', 'Dairy', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 7, 1),
(34, '2023-02-23 12:00:19.133955', 'Frozens & Sweets', 'Frozens & Sweets', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 7, 1),
(35, '2023-02-23 12:00:33.675207', 'Grains and Pulses', 'Grains and Pulses', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 7, 1),
(36, '2023-02-23 12:00:43.472219', 'Household & Cleaning Supplies', 'Household & Cleaning Supplies', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 7, 1),
(37, '2023-02-23 12:00:50.735522', 'Ready to eat Snacks', 'Ready to eat Snacks', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 7, 1),
(38, '2023-02-23 12:20:30.845014', '3', 'Ludhiana', 1, '[{\"added\": {}}]', 8, 1),
(39, '2023-02-23 12:20:35.717734', '4', 'Delhi', 1, '[{\"added\": {}}]', 8, 1),
(40, '2023-02-23 12:20:41.151811', '5', 'Chandigarh', 1, '[{\"added\": {}}]', 8, 1),
(41, '2023-02-23 12:21:19.381620', '6', 'Patiala', 1, '[{\"added\": {}}]', 8, 1),
(42, '2023-02-23 12:44:28.947622', '2', 'Raashan Paani Store', 2, '[{\"changed\": {\"fields\": [\"Store status\"]}}]', 9, 1),
(43, '2023-02-23 12:56:58.278464', '9', 'Amul Butter 500g', 2, '[{\"changed\": {\"fields\": [\"Product status\"]}}]', 10, 1),
(44, '2023-02-23 12:56:58.294099', '5', 'Good Day Cookies', 2, '[{\"changed\": {\"fields\": [\"Product status\"]}}]', 10, 1),
(45, '2023-02-23 12:57:08.825012', '15', 'Kidney Beans 1 KG', 2, '[{\"changed\": {\"fields\": [\"Product status\"]}}]', 10, 1),
(46, '2023-02-23 12:57:08.831172', '14', 'Aashirvaad whole wheat atta', 2, '[{\"changed\": {\"fields\": [\"Product status\"]}}]', 10, 1),
(47, '2023-02-23 12:57:08.835173', '13', 'MDH Garam Masala', 2, '[{\"changed\": {\"fields\": [\"Product status\"]}}]', 10, 1),
(48, '2023-02-23 12:57:08.839195', '12', 'MDH Lal Mirch Powder', 2, '[{\"changed\": {\"fields\": [\"Product status\"]}}]', 10, 1),
(49, '2023-02-24 05:22:51.094630', '16', 'Kabuli Chana', 2, '[{\"changed\": {\"fields\": [\"Product status\"]}}]', 10, 1),
(50, '2023-02-24 08:53:54.610925', '3', 'Reliance Fresh', 2, '[{\"changed\": {\"fields\": [\"Store status\"]}}]', 9, 1),
(51, '2023-02-24 09:03:10.917501', '21', 'Avocado 1Kg', 2, '[{\"changed\": {\"fields\": [\"Product status\"]}}]', 10, 1),
(52, '2023-02-24 09:03:10.921510', '20', 'Corn 250g', 2, '[{\"changed\": {\"fields\": [\"Product status\"]}}]', 10, 1),
(53, '2023-02-24 09:03:10.924711', '19', 'Baby corn 100g', 2, '[{\"changed\": {\"fields\": [\"Product status\"]}}]', 10, 1),
(54, '2023-02-24 09:03:10.925772', '18', 'Lattice 500g', 2, '[{\"changed\": {\"fields\": [\"Product status\"]}}]', 10, 1),
(55, '2023-02-24 09:03:10.929783', '17', 'Broccali 500g', 2, '[{\"changed\": {\"fields\": [\"Product status\"]}}]', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(12, 'client', 'cart'),
(11, 'client', 'client'),
(14, 'client', 'order'),
(13, 'client', 'orderdetails'),
(15, 'client', 'reviews'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'store', 'category'),
(8, 'store', 'city'),
(10, 'store', 'product'),
(9, 'store', 'store');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-02-20 10:24:42.429865'),
(2, 'auth', '0001_initial', '2023-02-20 10:24:42.944914'),
(3, 'admin', '0001_initial', '2023-02-20 10:24:43.085227'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-02-20 10:24:43.106665'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-02-20 10:24:43.106665'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-02-20 10:24:43.185782'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-02-20 10:24:43.217748'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-02-20 10:24:43.233391'),
(9, 'auth', '0004_alter_user_username_opts', '2023-02-20 10:24:43.249017'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-02-20 10:24:43.312220'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-02-20 10:24:43.312220'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-02-20 10:24:43.327964'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-02-20 10:24:43.359113'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-02-20 10:24:43.374826'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-02-20 10:24:43.407049'),
(16, 'auth', '0011_update_proxy_permissions', '2023-02-20 10:24:43.422413'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-02-20 10:24:43.453168'),
(18, 'sessions', '0001_initial', '2023-02-20 10:24:43.507296'),
(19, 'store', '0001_initial', '2023-02-20 10:24:43.751133'),
(20, 'store', '0002_category_category_image', '2023-02-21 08:44:13.016843'),
(21, 'client', '0001_initial', '2023-02-21 08:44:13.111333'),
(22, 'client', '0002_cart', '2023-02-25 06:00:16.513019'),
(23, 'client', '0003_order_orderdetails', '2023-02-25 17:34:38.757143'),
(24, 'client', '0004_remove_order_store', '2023-02-25 18:34:18.542559'),
(25, 'client', '0005_orderdetails_order_delivery_status', '2023-02-28 08:28:04.789198'),
(26, 'client', '0006_orderdetails_client', '2023-02-28 11:53:12.554561'),
(27, 'client', '0007_reviews', '2023-02-28 15:50:04.849592');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('h0pi6miircv4uxwxdl97a1shpsx0mkfz', '.eJxVjzFuxCAQRa8SUXsRGEOwqyjFdmlyAWuAsU1igwS4Wu3dA5GLpJz_Pm-GB5nhLNt8Zkyzd2QinHR_MwP2G0MD7gvCGqmNoSRvaKvQi2b6ER3u71f3n2CDvNXXo35lUsqxRwsCnGIII2o5GFycAMVhsEr3olfMGMGs4Rqk0gtXlg9cSl2lucSEsw9LJNODtGNFRwIcWPWfuHsIFl_uCeu-juABfq8gXWBp-dva0vqF41cH5cy1AnVIUHxYyXTjlD2fP27cWnM:1pWxKB:DmzAyI-sJsInWf7RdoRqfP5bQfaq2kYTanrpVy2Kp1I', '2023-03-14 10:35:11.616455'),
('odzwe0usk1hzzq5j6n9bqe33gprji9zj', '.eJx1jL0KwkAQhF9Fto4hCYKXq1JYpBHyBrJezmThfsLdWkjIu7sRCxurYb4ZvhUyx2RvFB4R9Ao0gq4LCOgtaLgcrpgYCrAeyQkYvXTMqZt2UJroZcyM_MyyopSETGECfazLaivAOLKB_-iHfvhxLzihm5E-2S3z8tX7eCe339tWqeasTlUj1BC_xLVtb6niPOw:1pWzGu:xSck0s0pytFp1yB6XOFzc0X9Lxa8WnTEp-_X2LMhIlo', '2023-03-14 12:39:56.910282'),
('sbidq9j36qee96vkk24uqnjsbkocgfzj', '.eJwlzEEKgzAUhOGryKxVWpdZ9QilHqAMGu0D8yJJupLc3USXw_czB2LywX5FFw9zQGaYoYXSWRh8yPijNm9SpRlriRbWUbai4da94vXyWqv0k3elionpH0vGMgKT6ArTPftHzick6idG:1pXFlL:YHOiRHMsj3x3iPgSwsQ6_vVr8Zzq6xYO8olhyRxsLpY', '2023-03-15 06:16:27.466715');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` bigint(20) NOT NULL,
  `total_price` double NOT NULL,
  `order_date` date DEFAULT NULL,
  `payment_mtd` varchar(1) NOT NULL,
  `order_status` varchar(1) NOT NULL,
  `Client_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `total_price`, `order_date`, `payment_mtd`, `order_status`, `Client_id`) VALUES
(9, 2135, '2023-02-28', 'o', 'p', 1),
(10, 180.85, '2023-02-28', 'o', 'p', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` bigint(20) NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `item_total_price` varchar(50) NOT NULL,
  `Order_id` bigint(20) NOT NULL,
  `Product_id` bigint(20) NOT NULL,
  `Store_id` bigint(20) NOT NULL,
  `order_delivery_status` varchar(1) NOT NULL,
  `Client_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `item_quantity`, `item_total_price`, `Order_id`, `Product_id`, `Store_id`, `order_delivery_status`, `Client_id`) VALUES
(10, 1, '270.0', 9, 17, 3, 'p', 1),
(11, 1, '153.0', 9, 18, 3, 'p', 1),
(12, 3, '342.0', 9, 19, 3, 'p', 1),
(13, 1, '256.5', 9, 14, 2, 'd', 1),
(14, 1, '218.5', 9, 16, 2, 'p', 1),
(15, 3, '855.0', 9, 9, 1, 'd', 1),
(16, 1, '57.85', 10, 6, 1, 'd', 1),
(17, 1, '38.0', 10, 11, 1, 'd', 1),
(18, 2, '76.0', 10, 4, 1, 'd', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `product_name` varchar(80) NOT NULL,
  `product_description` longtext NOT NULL,
  `product_image` varchar(100) DEFAULT NULL,
  `product_price` varchar(80) NOT NULL,
  `product_offer` varchar(80) NOT NULL,
  `product_new_price` varchar(80) NOT NULL,
  `product_status` varchar(1) NOT NULL,
  `Category_id` varchar(80) NOT NULL,
  `Store_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_name`, `product_description`, `product_image`, `product_price`, `product_offer`, `product_new_price`, `product_status`, `Category_id`, `Store_id`) VALUES
(4, 'Britannia Jim Jam Biscuits', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis porttitor iaculis mauris, at eleifend erat scelerisque at. Duis tempor accumsan quam, vitae laoreet ligula maximus ultrices. Quisque interdum, velit a accumsan mollis, dui metus semper diam, non porttitor lectus massa eu nunc. Duis facilisis ipsum nec augue condimentum, eu rutrum.', 'images/product-images/jimjam_MxQqR23.png', '40', '5', '38.0', 'a', 'Bread & Bakery', 1),
(5, 'Good Day Cookies', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis porttitor iaculis mauris, at eleifend erat scelerisque at. Duis tempor accumsan quam, vitae laoreet ligula maximus ultrices. Quisque interdum, velit a accumsan mollis, dui metus semper diam, non porttitor lectus massa eu nunc. Duis facilisis ipsum nec augue condimentum, eu rutrum.', 'images/product-images/biscuit_N5p6WUA.png', '32', '10', '28.8', 'a', 'Bread & Bakery', 1),
(6, 'Amul Milk ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis porttitor iaculis mauris, at eleifend erat scelerisque at. Duis tempor accumsan quam, vitae laoreet ligula maximus ultrices. Quisque interdum, velit a accumsan mollis, dui metus semper diam, non porttitor lectus massa eu nunc. Duis facilisis ipsum nec augue condimentum, eu rutrum.', 'images/product-images/milk_ogdQ7ab.png', '65', '11', '57.85', 'a', 'Dairy', 1),
(8, 'Parle G Biscuits', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis porttitor iaculis mauris, at eleifend erat scelerisque at. Duis tempor accumsan quam, vitae laoreet ligula maximus ultrices. Quisque interdum, velit a accumsan mollis, dui metus semper diam, non porttitor lectus massa eu nunc. Duis facilisis ipsum nec augue condimentum, eu rutrum.', 'images/product-images/parleg_7izP5BA.png', '30', '15', '25.5', 'a', 'Bread & Bakery', 1),
(9, 'Amul Butter 500g', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis porttitor iaculis mauris, at eleifend erat scelerisque at. Duis tempor accumsan quam, vitae laoreet ligula maximus ultrices. Quisque interdum, velit a accumsan mollis, dui metus semper diam, non porttitor lectus massa eu nunc. Duis facilisis ipsum nec augue condimentum, eu rutrum.', 'images/product-images/amul-butter_aEkrvkR.png', '300', '5', '285.0', 'a', 'Dairy', 1),
(10, 'Amul Butter 100g', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis porttitor iaculis mauris, at eleifend erat scelerisque at. Duis tempor accumsan quam, vitae laoreet ligula maximus ultrices. Quisque interdum, velit a accumsan mollis, dui metus semper diam, non porttitor lectus massa eu nunc. Duis facilisis ipsum nec augue condimentum, eu rutrum.', 'images/product-images/amul-butter-100_rxDQrFN.png', '60', '5', '57.0', 'a', 'Dairy', 1),
(11, 'Amul Masti Dahi', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis porttitor iaculis mauris, at eleifend erat scelerisque at. Duis tempor accumsan quam, vitae laoreet ligula maximus ultrices. Quisque interdum, velit a accumsan mollis, dui metus semper diam, non porttitor lectus massa eu nunc. Duis facilisis ipsum nec augue condimentum, eu rutrum.', 'images/product-images/dahi_XMbSBWy.png', '40', '5', '38.0', 'a', 'Dairy', 1),
(12, 'MDH Lal Mirch Powder', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultrices elit molestie feugiat dictum. Quisque volutpat mauris at dui ornare, sed pharetra enim tempus. Vivamus at sollicitudin elit. Quisque venenatis consectetur dui, vel molestie justo elementum sit amet. Suspendisse aliquet dictum nisi. Pellentesque faucibus felis vitae efficitur cursus. Praesent ipsum.', 'images/product-images/lalMirch.png', '140', '20', '112.0', 'a', 'Condiments & Spices', 2),
(13, 'MDH Garam Masala', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultrices elit molestie feugiat dictum. Quisque volutpat mauris at dui ornare, sed pharetra enim tempus. Vivamus at sollicitudin elit. Quisque venenatis consectetur dui, vel molestie justo elementum sit amet. Suspendisse aliquet dictum nisi. Pellentesque faucibus felis vitae efficitur cursus. Praesent ipsum.', 'images/product-images/garammasala.png', '170', '15', '144.5', 'a', 'Condiments & Spices', 2),
(14, 'Aashirvaad whole wheat atta', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultrices elit molestie feugiat dictum. Quisque volutpat mauris at dui ornare, sed pharetra enim tempus. Vivamus at sollicitudin elit. Quisque venenatis consectetur dui, vel molestie justo elementum sit amet. Suspendisse aliquet dictum nisi. Pellentesque faucibus felis vitae efficitur cursus. Praesent ipsum.', 'images/product-images/aashirwaad.png', '270', '5', '256.5', 'a', 'Grains and Pulses', 2),
(15, 'Kidney Beans 1 KG', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ultrices elit molestie feugiat dictum. Quisque volutpat mauris at dui ornare, sed pharetra enim tempus. Vivamus at sollicitudin elit. Quisque venenatis consectetur dui, vel molestie justo elementum sit amet. Suspendisse aliquet dictum nisi. Pellentesque faucibus felis vitae efficitur cursus. Praesent ipsum.', 'images/product-images/wdw.png', '300', '5', '285.0', 'a', 'Grains and Pulses', 2),
(16, 'Kabuli Chana', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vitae sem semper, semper neque eget, finibus ante. Aenean lobortis a mauris vestibulum faucibus. Donec pretium vel lacus porttitor fringilla. Quisque pharetra cursus elit, sed bibendum urna dapibus mollis. Quisque commodo enim in fringilla malesuada. Praesent finibus, arcu eget porta placerat.', 'images/product-images/kabulu.png', '230', '5', '218.5', 'a', 'Grains and Pulses', 2),
(17, 'Broccali 500g', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vitae sem semper, semper neque eget, finibus ante. Aenean lobortis a mauris vestibulum faucibus. Donec pretium vel lacus porttitor fringilla. Quisque pharetra cursus elit, sed bibendum urna dapibus mollis. Quisque commodo enim in fringilla malesuada. Praesent finibus, arcu eget porta placerat.', 'images/product-images/broc.jpg', '300', '10', '270.0', 'a', 'Fresh Fruits and Vegetables', 3),
(18, 'Lattice 500g', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vitae sem semper, semper neque eget, finibus ante. Aenean lobortis a mauris vestibulum faucibus. Donec pretium vel lacus porttitor fringilla. Quisque pharetra cursus elit, sed bibendum urna dapibus mollis. Quisque commodo enim in fringilla malesuada. Praesent finibus, arcu eget porta placerat.', 'images/product-images/cbhke.png', '170', '10', '153.0', 'a', 'Fresh Fruits and Vegetables', 3),
(19, 'Baby corn 100g', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vitae sem semper, semper neque eget, finibus ante. Aenean lobortis a mauris vestibulum faucibus. Donec pretium vel lacus porttitor fringilla. Quisque pharetra cursus elit, sed bibendum urna dapibus mollis. Quisque commodo enim in fringilla malesuada. Praesent finibus, arcu eget porta placerat.', 'images/product-images/chebk.png', '120', '5', '114.0', 'a', 'Fresh Fruits and Vegetables', 3),
(20, 'Corn 250g', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vitae sem semper, semper neque eget, finibus ante. Aenean lobortis a mauris vestibulum faucibus. Donec pretium vel lacus porttitor fringilla. Quisque pharetra cursus elit, sed bibendum urna dapibus mollis. Quisque commodo enim in fringilla malesuada. Praesent finibus, arcu eget porta placerat.', 'images/product-images/cebhj.png', '70', '5', '66.5', 'a', 'Fresh Fruits and Vegetables', 3),
(21, 'Avocado 1Kg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vitae sem semper, semper neque eget, finibus ante. Aenean lobortis a mauris vestibulum faucibus. Donec pretium vel lacus porttitor fringilla. Quisque pharetra cursus elit, sed bibendum urna dapibus mollis. Quisque commodo enim in fringilla malesuada. Praesent finibus, arcu eget porta placerat.', 'images/product-images/JCEB.png', '750', '5', '712.5', 'a', 'Fresh Fruits and Vegetables', 3);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` bigint(20) NOT NULL,
  `review_date` date DEFAULT NULL,
  `review_score` int(11) NOT NULL,
  `review_title` varchar(100) NOT NULL,
  `review_description` longtext NOT NULL,
  `Client_id` bigint(20) NOT NULL,
  `Store_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `id` bigint(20) NOT NULL,
  `store_name` varchar(80) NOT NULL,
  `store_email` varchar(254) NOT NULL,
  `store_mobile` varchar(20) NOT NULL,
  `store_password` varchar(50) NOT NULL,
  `store_otp` varchar(20) DEFAULT NULL,
  `store_image` varchar(100) DEFAULT NULL,
  `store_address` longtext NOT NULL,
  `store_status` varchar(1) NOT NULL,
  `store_rating` double NOT NULL,
  `City_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`id`, `store_name`, `store_email`, `store_mobile`, `store_password`, `store_otp`, `store_image`, `store_address`, `store_status`, `store_rating`, `City_id`) VALUES
(1, 'D Mart', 'dmartasr@gmail.com', '99150000023', '1234567890', NULL, 'images/store-images/dmart-2_KesRgbQ.png', 'Plot No. 18, Lawrence Road, Dayanand Nagar, Amritsar, Punjab 143001', 'a', -1, 1),
(2, 'Raashan Paani Store', 'raashanpaanistore@gmail.com', '7788998888', '1234567890', NULL, 'images/store-images/sd.png', 'Gf-24,A, Block Market, Ranjit Avenue, Amritsar, Punjab 143001', 'a', -1, 1),
(3, 'Reliance Fresh', 'reliancefresh@gmail.com', '9234567890', '1234567890', NULL, 'images/store-images/rel.png', 'Raj Bhawan, Hindu College Rd, opp. Janana Hospital, Dhab Khatikan, Katra Ahluwalia, Amritsar, Punjab 143001', 'a', -1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_Client_id_20c0c846_fk_client_id` (`Client_id`),
  ADD KEY `cart_Product_id_06c90092_fk_product_id` (`Product_id`),
  ADD KEY `cart_Store_id_3c209703_fk_store_id` (`Store_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_name`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_City_id_7375769c_fk_city_id` (`City_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_Client_id_49c7354f_fk_client_id` (`Client_id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderDetails_Order_id_621b8735_fk_order_id` (`Order_id`),
  ADD KEY `orderDetails_Product_id_203cd2d4_fk_product_id` (`Product_id`),
  ADD KEY `orderDetails_Store_id_02d150ec_fk_store_id` (`Store_id`),
  ADD KEY `orderDetails_Client_id_dc017858_fk_client_id` (`Client_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_Category_id_bd3e5246_fk_category_category_name` (`Category_id`),
  ADD KEY `product_Store_id_3f578b0b_fk_store_id` (`Store_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_Client_id_e22397be_fk_client_id` (`Client_id`),
  ADD KEY `review_Store_id_d8fdfc5d_fk_store_id` (`Store_id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_City_id_e5309d67_fk_city_id` (`City_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_Client_id_20c0c846_fk_client_id` FOREIGN KEY (`Client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `cart_Product_id_06c90092_fk_product_id` FOREIGN KEY (`Product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `cart_Store_id_3c209703_fk_store_id` FOREIGN KEY (`Store_id`) REFERENCES `store` (`id`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_City_id_7375769c_fk_city_id` FOREIGN KEY (`City_id`) REFERENCES `city` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_Client_id_49c7354f_fk_client_id` FOREIGN KEY (`Client_id`) REFERENCES `client` (`id`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderDetails_Client_id_dc017858_fk_client_id` FOREIGN KEY (`Client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `orderDetails_Order_id_621b8735_fk_order_id` FOREIGN KEY (`Order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `orderDetails_Product_id_203cd2d4_fk_product_id` FOREIGN KEY (`Product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `orderDetails_Store_id_02d150ec_fk_store_id` FOREIGN KEY (`Store_id`) REFERENCES `store` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_Category_id_bd3e5246_fk_category_category_name` FOREIGN KEY (`Category_id`) REFERENCES `category` (`category_name`),
  ADD CONSTRAINT `product_Store_id_3f578b0b_fk_store_id` FOREIGN KEY (`Store_id`) REFERENCES `store` (`id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_Client_id_e22397be_fk_client_id` FOREIGN KEY (`Client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `review_Store_id_d8fdfc5d_fk_store_id` FOREIGN KEY (`Store_id`) REFERENCES `store` (`id`);

--
-- Constraints for table `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `store_City_id_e5309d67_fk_city_id` FOREIGN KEY (`City_id`) REFERENCES `city` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
