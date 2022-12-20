-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2022 at 08:32 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nftsia`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `source`, `ip_address`, `location`, `created_at`, `updated_at`) VALUES
(1, 2, '1', 'Web', '127.0.0.1', '', '2022-11-16 07:10:44', '2022-11-16 07:10:44'),
(2, 2, '1', 'Web', '127.0.0.1', '', '2022-11-16 07:27:18', '2022-11-16 07:27:18'),
(3, 2, '1', 'Web', '127.0.0.1', '', '2022-11-16 07:46:17', '2022-11-16 07:46:17'),
(4, 2, '1', 'Web', '127.0.0.1', '', '2022-11-16 07:50:41', '2022-11-16 07:50:41'),
(5, 2, '1', 'Web', '127.0.0.1', '', '2022-11-16 08:29:00', '2022-11-16 08:29:00');

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bid_amount` decimal(19,8) NOT NULL,
  `service_charge` decimal(19,8) NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `is_sale_bid` tinyint(1) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bid_histories`
--

CREATE TABLE `bid_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bid_amount` decimal(19,8) NOT NULL,
  `coin_amount` decimal(19,8) NOT NULL,
  `service_charge` decimal(19,8) NOT NULL,
  `service_charge_coin` decimal(19,8) NOT NULL,
  `conversion_rate` decimal(19,8) NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `coin_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coin_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `refund_amount` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `wallet_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`, `priority`, `status`, `comment`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '', NULL, 1, 1, NULL, '2022-11-16 06:27:26', '2022-11-16 06:27:26', NULL),
(2, '', NULL, 2, 1, NULL, '2022-11-16 06:27:26', '2022-11-16 06:27:26', NULL),
(3, '', NULL, 3, 1, NULL, '2022-11-16 06:27:26', '2022-11-16 06:27:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `locale`, `category_id`, `title`, `description`) VALUES
(1, 'en', 1, 'Game', 'Game Category'),
(2, 'ar', 1, 'لعبة', 'فئة اللعبة'),
(3, 'es', 1, 'Juego', 'Categoría de juego'),
(4, 'en', 2, 'Photography', 'Photography Category'),
(5, 'ar', 2, 'التصوير', 'فئة التصوير'),
(6, 'es', 2, 'Fotografía', 'Categoría de fotografía'),
(7, 'en', 3, 'Music', 'Music Category'),
(8, 'ar', 3, 'موسيقى', 'فئة الموسيقى'),
(9, 'es', 3, 'Música', 'Categoría de música');

-- --------------------------------------------------------

--
-- Table structure for table `coins`
--

CREATE TABLE `coins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coin_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coin_icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_currency` tinyint(1) NOT NULL DEFAULT 0,
  `deposit_status` tinyint(4) NOT NULL DEFAULT 0,
  `withdrawal_status` tinyint(4) NOT NULL DEFAULT 0,
  `active_status` tinyint(4) NOT NULL DEFAULT 0,
  `minimum_buy_amount` decimal(19,8) NOT NULL DEFAULT 0.00000010,
  `minimum_sell_amount` decimal(19,8) NOT NULL DEFAULT 0.00000010,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coin_payment_api_logs`
--

CREATE TABLE `coin_payment_api_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `curl_object` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `response` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coin_settings`
--

CREATE TABLE `coin_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coin_id` bigint(20) UNSIGNED NOT NULL,
  `api_service` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `withdrawal_fee_percent` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `withdrawal_fee_fixed` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `withdrawal_fee_method` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'method: percent = 1, fixed = 2, both = 3',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'home_famous_title', '2022-11-16 06:27:27', '2022-11-16 06:27:27'),
(2, 'home_famous_content', '2022-11-16 06:27:27', '2022-11-16 06:27:27'),
(3, 'home_latest_title', '2022-11-16 06:27:27', '2022-11-16 06:27:27'),
(4, 'home_latest_content', '2022-11-16 06:27:27', '2022-11-16 06:27:27'),
(5, 'home_explorer_title', '2022-11-16 06:27:27', '2022-11-16 06:27:27'),
(6, 'home_explorer_content', '2022-11-16 06:27:27', '2022-11-16 06:27:27'),
(7, 'home_footer_title', '2022-11-16 06:27:27', '2022-11-16 06:27:27'),
(8, 'home_footer_content', '2022-11-16 06:27:27', '2022-11-16 06:27:27'),
(9, 'counters_title', '2022-11-16 06:27:27', '2022-11-16 06:27:27'),
(10, 'counters_content_one', '2022-11-16 06:27:27', '2022-11-16 06:27:27'),
(11, 'counters_content_two', '2022-11-16 06:27:27', '2022-11-16 06:27:27'),
(12, 'counters_content_three', '2022-11-16 06:27:27', '2022-11-16 06:27:27');

-- --------------------------------------------------------

--
-- Table structure for table `content_translations`
--

CREATE TABLE `content_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_id` bigint(20) UNSIGNED NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_translations`
--

INSERT INTO `content_translations` (`id`, `locale`, `content_id`, `value`) VALUES
(1, 'en', 1, 'Top famous NFTs and authors all in one place'),
(2, 'ar', 1, 'أفضل NFTs والمؤلفين المشهورين في مكان واحد'),
(3, 'es', 1, 'Los mejores NFT y autores famosos, todo en un solo lugar'),
(4, 'en', 2, 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.'),
(5, 'ar', 2, 'من الخطأ الشامل أن يكون هناك خطأ في الحالة الطبيعية ، حيث يمكن تفسير الأمر بشكل واضح.'),
(6, 'es', 2, 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.'),
(7, 'en', 3, 'Latest Collection'),
(8, 'ar', 3, 'أحدث مجموعة'),
(9, 'es', 3, 'Última Colección'),
(10, 'en', 4, 'Meridian sun strikes the upper surface of the impenetrable foliage of my trees, and but a few stray gleams steal into the inner'),
(11, 'ar', 4, 'تضرب شمس ميريديان السطح العلوي لأوراق الشجر التي لا يمكن اختراقها من أشجاري ، ولكن بعض الومضات الضالة تسرق الداخل'),
(12, 'es', 4, 'El sol meridiano golpea la superficie superior del follaje impenetrable de mis árboles, y solo unos pocos destellos perdidos se cuelan en el interior.'),
(13, 'en', 5, 'Explore More'),
(14, 'ar', 5, 'استكشاف المزيد'),
(15, 'es', 5, 'Explora Más'),
(16, 'en', 6, 'Meridian sun strikes the upper surface of the impenetrable foliatrees and but a few stray gleams steal into the inner'),
(17, 'ar', 6, 'تضرب شمس ميريديان السطح العلوي للأشجار الورقية التي لا يمكن اختراقها ، لكن القليل من الومضات الضالة تسرق الداخل'),
(18, 'es', 6, 'Meridian sun strikes the upper surface of the impenetrable foliatrees and but a few stray gleams steal into the inner'),
(19, 'en', 7, 'Get started with us today'),
(20, 'ar', 7, 'ابدأ معنا اليوم'),
(21, 'es', 7, 'Comienza con nosotros hoy'),
(22, 'en', 8, 'Earn exciting points and free crypto by submitting your work.'),
(23, 'ar', 8, 'اربح نقاطًا مثيرة وتشفيرًا مجانيًا من خلال إرسال عملك.'),
(24, 'es', 8, 'Gane puntos emocionantes y criptografía gratis al enviar su trabajo.'),
(25, 'en', 9, 'Amazing traditional Artworks, which is trending now'),
(26, 'ar', 9, 'الأعمال الفنية التقليدية المدهشة ، والتي تتجه الآن'),
(27, 'es', 9, 'Increíbles obras de arte tradicionales, que están de moda ahora'),
(28, 'en', 10, 'Artwork'),
(29, 'ar', 10, 'عمل فني'),
(30, 'es', 10, 'Obra de arte'),
(31, 'en', 11, 'Auction'),
(32, 'ar', 11, 'مزاد علني'),
(33, 'es', 11, 'Subasta'),
(34, 'en', 12, 'Artist'),
(35, 'ar', 12, 'فنان'),
(36, 'es', 12, 'Artista');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `receiver_wallet_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(19,8) NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fees` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `sender_wallet_id` bigint(20) DEFAULT NULL,
  `address_type` tinyint(4) NOT NULL DEFAULT 1,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doller` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmations` int(11) NOT NULL DEFAULT 0,
  `transaction_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'status: waiting = 0, processed = 1, pending = 2, cancelled = 3',
  `deposit_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `earnings`
--

CREATE TABLE `earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sell_id` bigint(20) DEFAULT NULL,
  `bid_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL COMMENT 'Who debited or credited amount',
  `coin_id` bigint(20) DEFAULT NULL,
  `user_to_platform` tinyint(4) DEFAULT NULL,
  `platform_to_user` tinyint(4) DEFAULT NULL,
  `trans_amount` decimal(19,8) NOT NULL,
  `amount` decimal(19,8) NOT NULL,
  `coin_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `author` bigint(20) DEFAULT NULL,
  `fh_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `status`, `author`, `fh_id`, `created_at`, `updated_at`) VALUES
(1, '', '', 1, NULL, 1, '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(2, '', '', 1, NULL, 2, '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(3, '', '', 1, NULL, 3, '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(4, '', '', 1, NULL, 4, '2022-11-16 06:27:26', '2022-11-16 06:27:26');

-- --------------------------------------------------------

--
-- Table structure for table `faq_heads`
--

CREATE TABLE `faq_heads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_heads`
--

INSERT INTO `faq_heads` (`id`, `title`, `icon`, `created_at`, `updated_at`) VALUES
(1, '', 'fas fa-home', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(2, '', 'fas fa-life-ring', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(3, '', 'fas fa-bolt', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(4, '', 'fas fa-pen-nib', '2022-11-16 06:27:26', '2022-11-16 06:27:26');

-- --------------------------------------------------------

--
-- Table structure for table `faq_head_translations`
--

CREATE TABLE `faq_head_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_head_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_head_translations`
--

INSERT INTO `faq_head_translations` (`id`, `locale`, `faq_head_id`, `title`) VALUES
(1, 'en', 1, 'General'),
(2, 'ar', 1, 'عام'),
(3, 'es', 1, 'General'),
(4, 'en', 2, 'Support'),
(5, 'ar', 2, 'الدعم'),
(6, 'es', 2, 'Apoyo'),
(7, 'en', 3, 'Hosting'),
(8, 'ar', 3, 'الاستضافة'),
(9, 'es', 3, 'Alojamiento'),
(10, 'en', 4, 'Products'),
(11, 'ar', 4, 'منتجات'),
(12, 'es', 4, 'Productos');

-- --------------------------------------------------------

--
-- Table structure for table `faq_translations`
--

CREATE TABLE `faq_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_id` bigint(20) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_translations`
--

INSERT INTO `faq_translations` (`id`, `locale`, `faq_id`, `question`, `answer`) VALUES
(1, 'en', 1, 'How does it work', 'Existence in this spot, which was created for the bliss of souls like mine. I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet I feel that I never was a greater artist than now. When, while the lovely valley teems'),
(2, 'ar', 1, 'كيف يعمل', 'الوجود في هذه البقعة التي خلقت لنعمة النفوس مثل لي. أنا سعيد جدًا ، يا صديقي العزيز ، منغمس جدًا في الإحساس الرائع بالوجود الهادئ المحض ، لدرجة أنني أهمل مواهبي. يجب أن أكون غير قادر على رسم ضربة واحدة في الوقت الحاضر ؛ ومع ذلك أشعر أنني لم أكن أبدًا فنانًا أعظم من الآن. متى ، بينما يعج الوادي الجميل'),
(3, 'es', 1, 'How does it work', 'Existencia en este lugar, que fue creado para la dicha de almas como la mía. Soy tan feliz, mi querido amigo, tan absorto en el exquisito sentido de la mera existencia tranquila, que descuido mis talentos. Sería incapaz de dibujar un solo trazo en este momento; y, sin embargo, siento que nunca fui un artista más grande que ahora. cuando, mientras el hermoso valle bulle'),
(4, 'en', 2, 'How does it work', 'Existence in this spot, which was created for the bliss of souls like mine. I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet I feel that I never was a greater artist than now. When, while the lovely valley teems'),
(5, 'ar', 2, 'كيف يعمل', 'الوجود في هذه البقعة التي خلقت لنعمة النفوس مثل لي. أنا سعيد جدًا ، يا صديقي العزيز ، منغمس جدًا في الإحساس الرائع بالوجود الهادئ المحض ، لدرجة أنني أهمل مواهبي. يجب أن أكون غير قادر على رسم ضربة واحدة في الوقت الحاضر ؛ ومع ذلك أشعر أنني لم أكن أبدًا فنانًا أعظم من الآن. متى ، بينما يعج الوادي الجميل'),
(6, 'es', 2, 'How does it work', 'Existencia en este lugar, que fue creado para la dicha de almas como la mía. Soy tan feliz, mi querido amigo, tan absorto en el exquisito sentido de la mera existencia tranquila, que descuido mis talentos. Sería incapaz de dibujar un solo trazo en este momento; y, sin embargo, siento que nunca fui un artista más grande que ahora. cuando, mientras el hermoso valle bulle'),
(7, 'en', 3, 'How does it work', 'Existence in this spot, which was created for the bliss of souls like mine. I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet I feel that I never was a greater artist than now. When, while the lovely valley teems'),
(8, 'ar', 3, 'كيف يعمل', 'الوجود في هذه البقعة التي خلقت لنعمة النفوس مثل لي. أنا سعيد جدًا ، يا صديقي العزيز ، منغمس جدًا في الإحساس الرائع بالوجود الهادئ المحض ، لدرجة أنني أهمل مواهبي. يجب أن أكون غير قادر على رسم ضربة واحدة في الوقت الحاضر ؛ ومع ذلك أشعر أنني لم أكن أبدًا فنانًا أعظم من الآن. متى ، بينما يعج الوادي الجميل'),
(9, 'es', 3, 'How does it work', 'Existencia en este lugar, que fue creado para la dicha de almas como la mía. Soy tan feliz, mi querido amigo, tan absorto en el exquisito sentido de la mera existencia tranquila, que descuido mis talentos. Sería incapaz de dibujar un solo trazo en este momento; y, sin embargo, siento que nunca fui un artista más grande que ahora. cuando, mientras el hermoso valle bulle'),
(10, 'en', 4, 'How does it work', 'Existence in this spot, which was created for the bliss of souls like mine. I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet I feel that I never was a greater artist than now. When, while the lovely valley teems'),
(11, 'ar', 4, 'كيف يعمل', 'الوجود في هذه البقعة التي خلقت لنعمة النفوس مثل لي. أنا سعيد جدًا ، يا صديقي العزيز ، منغمس جدًا في الإحساس الرائع بالوجود الهادئ المحض ، لدرجة أنني أهمل مواهبي. يجب أن أكون غير قادر على رسم ضربة واحدة في الوقت الحاضر ؛ ومع ذلك أشعر أنني لم أكن أبدًا فنانًا أعظم من الآن. متى ، بينما يعج الوادي الجميل'),
(12, 'es', 4, 'How does it work', 'Existencia en este lugar, que fue creado para la dicha de almas como la mía. Soy tan feliz, mi querido amigo, tan absorto en el exquisito sentido de la mera existencia tranquila, que descuido mis talentos. Sería incapaz de dibujar un solo trazo en este momento; y, sin embargo, siento que nunca fui un artista más grande que ahora. cuando, mientras el hermoso valle bulle');

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `follower_id` bigint(20) UNSIGNED NOT NULL,
  `following_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `prefix` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `prefix`, `name`, `direction`, `created_at`, `updated_at`) VALUES
(1, 'en', 'English', 'ltr', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(2, 'es', 'Spanish', 'ltr', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(3, 'ar', 'Arabic', 'rtl', '2022-11-16 06:27:26', '2022-11-16 06:27:26');

-- --------------------------------------------------------

--
-- Table structure for table `like_views`
--

CREATE TABLE `like_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `isLike` tinyint(4) NOT NULL DEFAULT 0,
  `isView` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `like_views`
--

INSERT INTO `like_views` (`id`, `user_id`, `service_id`, `isLike`, `isView`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 0, 1, '2022-11-16 07:59:49', '2022-11-16 07:59:49'),
(2, 2, 2, 0, 1, '2022-11-16 08:01:08', '2022-11-16 08:01:08');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_01_29_987898_create_users_table', 1),
(2, '2021_02_06_053527_create_coins_table', 1),
(3, '2021_02_26_064136_create_coin_payment_api_logs_table', 1),
(4, '2021_06_17_123519_create_faqs_table', 1),
(5, '2021_06_19_095619_create_send_mail_records_table', 1),
(6, '2021_06_19_183647_create_notifications_table', 1),
(7, '2021_06_24_092552_create_wallets_table', 1),
(8, '2021_07_24_092303_create_user_settings_table', 1),
(9, '2021_07_24_092409_create_activity_logs_table', 1),
(10, '2021_07_24_103207_create_user_verification_codes_table', 1),
(11, '2021_07_29_165701_create_withdrawal2fas_table', 1),
(12, '2021_10_12_100000_create_password_resets_table', 1),
(13, '2021_10_29_092331_create_settings_table', 1),
(14, '2021_11_05_114624_create_categories_table', 1),
(15, '2021_11_05_120709_create_services_table', 1),
(16, '2021_11_05_123947_create_comments_table', 1),
(17, '2021_11_05_124348_create_bids_table', 1),
(18, '2021_11_05_125637_create_transactions_table', 1),
(19, '2021_11_08_130533_create_user_social_media_table', 1),
(20, '2021_11_11_091920_create_news_table', 1),
(21, '2021_11_12_112426_create_jobs_table', 1),
(22, '2021_11_12_112758_create_failed_jobs_table', 1),
(23, '2021_11_16_092217_create_like_views_table', 1),
(24, '2021_11_17_064400_create_top_sellers_table', 1),
(25, '2021_11_19_075746_create_user_wallet_records_table', 1),
(26, '2021_11_19_124028_create_deposits_table', 1),
(27, '2021_11_20_052714_create_withdrawal_coin_limit_settings_table', 1),
(28, '2021_11_20_055540_create_withdrawals_table', 1),
(29, '2021_11_20_055732_create_withdrawal_cancel_reasons_table', 1),
(30, '2021_11_20_101944_create_coin_settings_table', 1),
(31, '2021_11_22_064057_create_subscribers_table', 1),
(32, '2021_11_25_053808_create_sell_services_table', 1),
(33, '2021_11_26_062638_create_sliders_table', 1),
(34, '2021_11_26_103159_create_faq_heads_table', 1),
(35, '2021_11_26_131629_create_contact_us_table', 1),
(36, '2021_12_02_060431_create_follows_table', 1),
(37, '2021_12_07_061136_create_bid_histories_table', 1),
(38, '2021_12_13_090643_create_service_charges_table', 1),
(39, '2021_12_13_115111_create_earnings_table', 1),
(40, '2021_12_24_025946_create_user_wallet_update_trigger', 1),
(41, '2021_12_24_055710_create_resell_services_table', 1),
(42, '2021_12_24_061755_create_user_wallet_insert_trigger', 1),
(43, '2021_12_24_063944_create_transfer_tokens_table', 1),
(44, '2022_02_15_105840_create_languages_table', 1),
(45, '2022_02_18_074319_create_category_translations_table', 1),
(46, '2022_02_18_093856_create_news_translations_table', 1),
(47, '2022_02_18_103651_create_faq_head_translations_table', 1),
(48, '2022_02_18_112220_create_faq_translations_table', 1),
(49, '2022_02_18_115445_create_slider_translations_table', 1),
(50, '2022_02_18_122400_create_contents_table', 1),
(51, '2022_02_18_122510_create_content_translations_table', 1),
(52, '2022_02_24_120414_add_status_to_sliders_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `likes` int(11) NOT NULL DEFAULT 0,
  `isHotNews` tinyint(4) NOT NULL DEFAULT 1,
  `IsTrending` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `slug`, `description`, `thumbnail`, `views`, `likes`, `isHotNews`, `IsTrending`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '', '', '', '1.jpg', 0, 0, 1, 1, '2022-11-16 06:27:26', '2022-11-16 06:27:26', NULL),
(2, '', '', '', '2.jpg', 0, 0, 1, 1, '2022-11-16 06:27:27', '2022-11-16 06:27:27', NULL),
(3, '', '', '', '3.jpg', 0, 0, 1, 1, '2022-11-16 06:27:27', '2022-11-16 06:27:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `news_translations`
--

CREATE TABLE `news_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `news_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news_translations`
--

INSERT INTO `news_translations` (`id`, `locale`, `news_id`, `title`, `slug`, `description`) VALUES
(1, 'en', 1, 'Record price drop of Bitcoin is about 5.6%', 'record-price-drop-of-bitcoin-is-about-5-6', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem  ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit,  sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>'),
(2, 'ar', 1, 'انخفض سعر البيتكوين القياسي بحوالي 5.6٪', 'nkhfd-saar-lbytkoyn-lky-sy-bho-ly-5-6', '<p>ولكن لكي تفهم من أين يكون كل خطأ مولودًا لذة الاتهام والثناء على الألم ، فسأشرح كل ما قيل من قبل مخترع الحقيقة هذا وباعتباره مهندس الحياة المباركة. فلا أحد يرفض المتعة أو يكرهها أو يتجنبها ، لأنها متعة بحد ذاتها ، ولكن لأن الآلام الشديدة تنجم عن أولئك الذين لا يعرفون كيف يتبعون اللذة بالعقل. علاوة على ذلك ، لا يوجد من يرغب في الحصول على الألم ، لأن الألم نفسه هو حب وتقوى ، ويريد اكتسابه ، ولكن لأن أوقاتًا من هذا القبيل لا تحدث ، حتى أنه من خلال الكد والألم قد يبحث عن بعض اللذة الكبيرة. فمن منا يقوم ، إلى أدنى درجة ، بأي تمرين بدني شاق ، باستثناء الحصول على بعض المزايا منه؟ ولكن من يستطيع أن يدين بحق من يريد أن يكون في تلك المتعة التي لا تنتج عن أي إزعاج؟</p>'),
(3, 'es', 1, 'La caída récord del precio de Bitcoin es de alrededor del 5,6%', 'la-caida-record-del-precio-de-bitcoin-es-de-alrededor-del-5-6', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem  ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit,  sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>'),
(4, 'en', 2, 'New Coin in the market!', 'new-coin-in-the-market', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem  ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit,  sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>'),
(5, 'ar', 2, 'عملة جديدة في السوق!', 'aaml-gdyd-fy-lsok', '<p>ولكن لكي تفهم من أين يكون كل خطأ مولودًا لذة الاتهام والثناء على الألم ، فسأشرح كل ما قيل من قبل مخترع الحقيقة هذا وباعتباره مهندس الحياة المباركة. فلا أحد يرفض المتعة أو يكرهها أو يتجنبها ، لأنها متعة بحد ذاتها ، ولكن لأن الآلام الشديدة تنجم عن أولئك الذين لا يعرفون كيف يتبعون اللذة بالعقل. علاوة على ذلك ، لا يوجد من يرغب في الحصول على الألم ، لأن الألم نفسه هو حب وتقوى ، ويريد اكتسابه ، ولكن لأن أوقاتًا من هذا القبيل لا تحدث ، حتى أنه من خلال الكد والألم قد يبحث عن بعض اللذة الكبيرة. فمن منا يقوم ، إلى أدنى درجة ، بأي تمرين بدني شاق ، باستثناء الحصول على بعض المزايا منه؟ ولكن من يستطيع أن يدين بحق من يريد أن يكون في تلك المتعة التي لا تنتج عن أي إزعاج؟</p>'),
(6, 'es', 2, 'Nueva moneda en el mercado!', 'new-coin-in-the-market', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem  ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit,  sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>'),
(7, 'en', 3, 'What’s happening in the crypto world?', 'whats-happening-in-the-crypto-world', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem  ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit,  sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>'),
(8, 'ar', 3, 'ماذا يحدث في عالم التشفير؟', 'whats-happening-in-the-crypto-world', '<p>ولكن لكي تفهم من أين يكون كل خطأ مولودًا لذة الاتهام والثناء على الألم ، فسأشرح كل ما قيل من قبل مخترع الحقيقة هذا وباعتباره مهندس الحياة المباركة. فلا أحد يرفض المتعة أو يكرهها أو يتجنبها ، لأنها متعة بحد ذاتها ، ولكن لأن الآلام الشديدة تنجم عن أولئك الذين لا يعرفون كيف يتبعون اللذة بالعقل. علاوة على ذلك ، لا يوجد من يرغب في الحصول على الألم ، لأن الألم نفسه هو حب وتقوى ، ويريد اكتسابه ، ولكن لأن أوقاتًا من هذا القبيل لا تحدث ، حتى أنه من خلال الكد والألم قد يبحث عن بعض اللذة الكبيرة. فمن منا يقوم ، إلى أدنى درجة ، بأي تمرين بدني شاق ، باستثناء الحصول على بعض المزايا منه؟ ولكن من يستطيع أن يدين بحق من يريد أن يكون في تلك المتعة التي لا تنتج عن أي إزعاج؟</p>'),
(9, 'es', 3, 'Qué está pasando en el mundo de las criptomonedas?', 'whats-happening-in-the-crypto-world', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem  ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit,  sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notification_body` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Type: Any = 0, transaction = 1, registration = 2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `notification_body`, `status`, `type`, `created_at`, `updated_at`) VALUES
(1, 2, 'Artwork Added', 'An Artwork is added by you', 0, 0, '2022-11-16 07:55:20', '2022-11-16 07:55:20'),
(2, 2, 'Artwork Added', 'An Artwork is added by you', 0, 0, '2022-11-16 07:56:37', '2022-11-16 07:56:37');

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
-- Table structure for table `resell_services`
--

CREATE TABLE `resell_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `new_service_id` bigint(20) UNSIGNED NOT NULL,
  `past_service_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_services`
--

CREATE TABLE `sell_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `price_amount` decimal(19,8) NOT NULL,
  `coin_amount` decimal(19,8) NOT NULL,
  `service_charge` decimal(19,8) NOT NULL,
  `service_charge_coin` decimal(19,8) NOT NULL,
  `conversion_rate` decimal(19,8) NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `is_sale_bid` tinyint(1) NOT NULL,
  `coin_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coin_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `refund_amount` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `wallet_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `send_mail_records`
--

CREATE TABLE `send_mail_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `email_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `expired_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `price_dollar` decimal(19,8) NOT NULL,
  `fees_percentage` decimal(19,8) NOT NULL,
  `fees_fixed` decimal(19,8) NOT NULL,
  `fees_type` tinyint(4) NOT NULL,
  `like` int(11) NOT NULL DEFAULT 0,
  `dislike` int(11) NOT NULL DEFAULT 0,
  `available_item` decimal(19,8) NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `isSlider` tinyint(4) NOT NULL DEFAULT 0,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buyer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_resellable` tinyint(4) NOT NULL DEFAULT 0,
  `resell_service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `origin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mint_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_bid_amount` decimal(8,2) NOT NULL DEFAULT 999999.00,
  `min_bid_amount` decimal(8,2) NOT NULL DEFAULT 0.01,
  `is_unlockable` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title`, `description`, `type`, `expired_at`, `price_dollar`, `fees_percentage`, `fees_fixed`, `fees_type`, `like`, `dislike`, `available_item`, `views`, `category_id`, `created_by`, `status`, `isSlider`, `comment`, `buyer_id`, `is_resellable`, `resell_service_id`, `thumbnail`, `video_link`, `color`, `origin`, `mint_address`, `max_bid_amount`, `min_bid_amount`, `is_unlockable`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'gfdsg', 'sdgsdgsdg', 1, '2022-11-16 08:59:49', '0.00000000', '2.00000000', '20.00000000', 1, 0, 0, '1.00000000', 1, 2, 2, 0, 0, NULL, NULL, 0, NULL, '6374a5783ca2a.jpg', NULL, 'Black', 'Afghanistan', 'ewrwerw', '999999.00', '0.01', 0, '2022-11-16 07:55:20', '2022-11-16 07:59:49', NULL),
(2, '345435435', '5435345435', 1, '2022-11-16 09:01:08', '2323.00000000', '2.00000000', '20.00000000', 1, 0, 0, '1.00000000', 1, 1, 2, 0, 0, NULL, NULL, 0, NULL, '6374a5c505a3c.jpg', NULL, 'Purple', 'Afghanistan', 'etrtt43', '999999.00', '0.01', 0, '2022-11-16 07:56:37', '2022-11-16 08:01:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_charges`
--

CREATE TABLE `service_charges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_holder` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '1 = Fixed, 2 = Percentage',
  `amount` decimal(19,8) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_charges`
--

INSERT INTO `service_charges` (`id`, `service_holder`, `type`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 'buyer', 1, '1.00000000', 0, '2022-11-16 06:27:27', '2022-11-16 06:27:27'),
(2, 'buyer', 2, '2.00000000', 1, '2022-11-16 06:27:27', '2022-11-16 06:27:27'),
(3, 'seller', 1, '2.00000000', 0, '2022-11-16 06:27:27', '2022-11-16 06:27:27'),
(4, 'seller', 2, '5.00000000', 1, '2022-11-16 06:27:27', '2022-11-16 06:27:27');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `slug`, `value`, `created_at`, `updated_at`) VALUES
(1, 'app_title', 'Nftzai', NULL, NULL),
(2, 'maximum_withdrawal_daily', '3', NULL, NULL),
(3, 'mail_from', 'noreply@ntfzi.com', NULL, NULL),
(4, 'maintenance_mode', 'no', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(5, 'logo', '', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(6, 'login_logo', '', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(7, 'landing_logo', '', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(8, 'favicon', '', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(9, 'dashboard_image', '', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(10, 'preloader_logo', '', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(11, 'copyright_text', 'Copyright@2020', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(12, 'pagination_count', '10', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(13, 'point_rate', '1', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(14, 'lang', 'en', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(15, 'company_name', 'Test Company', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(16, 'primary_email', 'test@email.com', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(17, 'sms_getway_name', 'twillo', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(18, 'twillo_secret_key', 'test', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(19, 'twillo_auth_token', 'test', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(20, 'twillo_number', 'test', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(21, 'ssl_verify', '', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(22, 'mail_driver', 'SMTP', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(23, 'mail_host', 'smtp.mailtrap.io', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(24, 'mail_port', '2525', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(25, 'mail_username', '04bc2d327c43e7', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(26, 'mail_password', 'de96fea5d103ca', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(27, 'mail_encryption', 'tls', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(28, 'mail_from_address', 'demo@demo.com', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(29, 'braintree_client_token', 'test', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(30, 'braintree_environment', 'sandbox', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(31, 'braintree_merchant_id', 'test', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(32, 'braintree_public_key', 'test', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(33, 'braintree_private_key', 'test', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(34, 'sms_getway_name', 'twillo', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(35, 'clickatell_api_key', 'test', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(36, 'number_of_confirmation', '6', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(37, 'coin_api_user', 'test', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(38, 'coin_api_pass', 'test', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(39, 'coin_api_host', 'test5', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(40, 'coin_api_port', 'test', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(41, 'send_fees_type', '1', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(42, 'send_fees_fixed', '0', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(43, 'send_fees_percentage', '0', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(44, 'max_send_limit', '0', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(45, 'deposit_time', '1', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(46, 'COIN_PAYMENT_PUBLIC_KEY', 'test', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(47, 'COIN_PAYMENT_PRIVATE_KEY', 'test', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(48, 'COIN_PAYMENT_CURRENCY', 'BTC', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(49, 'payment_method_coin_payment', '1', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(50, 'home_famous_title', 'Top famous NFTs and authors all in one place', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(51, 'home_famous_content', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. ', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(52, 'home_latest_title', 'Latest Collection', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(53, 'home_latest_content', 'Meridian sun strikes the upper surface of the impenetrable foliage of my trees, and but a few stray gleams steal into the inner', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(54, 'home_explorer_title', 'Explore More', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(55, 'home_explorer_content', 'Meridian sun strikes the upper surface of the impenetrable foliatrees and but a few stray gleams steal into the inner', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(56, 'home_footer_title', 'Get started with us today', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(57, 'home_footer_content', 'Earn exciting points and free crypto by submitting your work.', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(58, 'counters_title', 'Amazing traditional Artworks, which is trending now', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(59, 'counters_img_one', '', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(60, 'counters_img_two', '', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(61, 'counters_content_one', 'Artwork', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(62, 'counters_count_one', '20', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(63, 'counters_content_two', 'Auction', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(64, 'counters_count_two', '130', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(65, 'counters_content_three', 'Artist', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(66, 'counters_count_three', '14', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(67, 'service_charge', '5', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(68, 'meta_title', 'Nftzai - NFT Buy/Sell Marketplace', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(69, 'meta_description', 'NFT Buy/Sell Marketplace', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(70, 'meta_keywords', 'crypto currency, currency, crypto, nft marketplace, NFT, nft, NFT marketplace', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(71, 'meta_author', 'zainiktheme', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(72, 'cdn_base', 'nftzai.zainikthemes.com', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(73, 'is_cdn', '0', '2022-11-16 06:27:26', '2022-11-16 06:27:26'),
(74, 'version', '2', '2022-11-16 06:40:33', '2022-11-16 06:40:33');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `short_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_desc_header` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_desc_middle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_desc_footer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `short_description`, `long_desc_header`, `long_desc_middle`, `long_desc_footer`, `status`, `created_at`, `updated_at`) VALUES
(1, '', '', '', '', 1, '2022-11-16 06:27:26', '2022-11-16 06:27:26');

-- --------------------------------------------------------

--
-- Table structure for table `slider_translations`
--

CREATE TABLE `slider_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slider_id` bigint(20) UNSIGNED NOT NULL,
  `short_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_desc_header` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_desc_middle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_desc_footer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slider_translations`
--

INSERT INTO `slider_translations` (`id`, `locale`, `slider_id`, `short_description`, `long_desc_header`, `long_desc_middle`, `long_desc_footer`) VALUES
(1, 'en', 1, 'Buy and sell NFTs from the world’s top artists', 'The', 'New World', 'of Digital Collectibles'),
(2, 'ar', 1, 'شراء وبيع NFTs من أفضل الفنانين في العالم', 'ال', 'عالم جديد', 'المقتنيات الرقمية'),
(3, 'es', 1, 'Compra y vende NFT de los mejores artistas del mundo', 'El', 'Nuevo mundo', 'de Coleccionables Digitales');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email_address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `top_sellers`
--

CREATE TABLE `top_sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(19,8) NOT NULL DEFAULT 0.00000000,
  `activate_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(19,8) NOT NULL,
  `buyer_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_hash` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bid_id` bigint(20) UNSIGNED DEFAULT NULL,
  `fees` decimal(19,8) NOT NULL,
  `transaction_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(4) NOT NULL,
  `coin_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coin_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_tokens`
--

CREATE TABLE `transfer_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `resell_service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `prev_mint_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_mint_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_code` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT 2,
  `status` int(11) NOT NULL DEFAULT 1,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_verified` tinyint(4) NOT NULL DEFAULT 0,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT 1,
  `birth_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g2f_enabled` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `google2fa_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` tinyint(4) NOT NULL DEFAULT 0,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `device_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` tinyint(4) NOT NULL DEFAULT 1,
  `push_notification_status` tinyint(4) NOT NULL DEFAULT 1,
  `email_notification_status` tinyint(4) NOT NULL DEFAULT 1,
  `new_bid_notification` tinyint(4) NOT NULL DEFAULT 1,
  `item_purchased_notification` tinyint(4) NOT NULL DEFAULT 1,
  `people_follow_notification` tinyint(4) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `eth_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `bio`, `email`, `reset_code`, `role`, `status`, `country_code`, `phone`, `phone_verified`, `country`, `gender`, `birth_date`, `photo`, `cover_photo`, `website`, `g2f_enabled`, `google2fa_secret`, `is_verified`, `password`, `language`, `device_id`, `device_type`, `push_notification_status`, `email_notification_status`, `new_bid_notification`, `item_purchased_notification`, `people_follow_notification`, `remember_token`, `created_at`, `updated_at`, `eth_address`) VALUES
(1, 'Mr.', 'Admin', NULL, 'admin@email.com', NULL, 1, 1, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, NULL, '0', NULL, 1, '$2y$10$AfUJQHOw6RUmOZ3E5ZNkj.nyaDB/VWSxwl87.7iLz42/uOPC.7DKG', 'en', NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL),
(2, 'John', 'Doe', 'Wonderful serenity has taken possession of my entire soul, these mornings', 'user1@email.com', NULL, 2, 1, NULL, NULL, 0, 'Australia', 1, NULL, '1.jpg', NULL, NULL, '0', NULL, 1, '$2y$10$6C7HLYrPoTACH1x6YMg7BeVv4B9NJA.kWk5/Swop8uTRivMWu5PZ2', 'en', NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL),
(3, 'Hnik', 'Zairiya', 'Wonderful serenity has taken possession of my entire soul, these mornings', 'user2@email.com', NULL, 2, 1, NULL, NULL, 0, 'Australia', 1, NULL, '2.jpg', NULL, 'https://example.com', '0', NULL, 1, '$2y$10$VCC2eUKdqppvlgLeJGpv2O9BWe.Gq3Wx.BsSbT7aYO/g1bmjYLUsC', 'en', NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL),
(4, 'Robert', 'Gomez', 'Wonderful serenity has taken possession of my entire soul, these mornings', 'user3@email.com', NULL, 2, 1, NULL, NULL, 0, 'Australia', 1, NULL, '3.jpg', NULL, 'https://example.com', '0', NULL, 1, '$2y$10$HMuNdS58ypLQ7g2eVRca2usTsJXJCGhvtS/5ZmYZvruxcz7Bu9svC', 'en', NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL),
(5, 'MacKensie', 'Duke', 'Wonderful serenity has taken possession of my entire soul, these mornings', 'user4@email.com', NULL, 2, 1, NULL, NULL, 0, 'Australia', 1, NULL, '4.jpg', NULL, 'https://example.com', '0', NULL, 1, '$2y$10$V2VXsbmqo8I7WWtXKfRKC.3RaRVZCdvIMzhKyTcUHx3qiTN8BvErG', 'en', NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL),
(6, 'Petra', 'Garza', 'Wonderful serenity has taken possession of my entire soul, these mornings', 'user5@email.com', NULL, 2, 1, NULL, NULL, 0, 'Australia', 1, NULL, '5.jpg', NULL, 'https://example.com', '0', NULL, 1, '$2y$10$dj21KIw9sjzU4RnnHN1AmezP8B9ybJoCshw.RjM2cJ/gi1lZeIZ56', 'en', NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL),
(7, NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, NULL, '0', NULL, 0, NULL, 'en', NULL, 1, 1, 1, 1, 1, 1, NULL, '2022-11-27 03:54:39', '2022-11-27 03:54:39', '0x3d6640cB6748F59c2D06B829658C6189871592E0');

-- --------------------------------------------------------

--
-- Table structure for table `user_settings`
--

CREATE TABLE `user_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_social_media`
--

CREATE TABLE `user_social_media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_verification_codes`
--

CREATE TABLE `user_verification_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `expired_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `coin_id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `is_primary` tinyint(4) NOT NULL DEFAULT 0,
  `balance` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `on_hold` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `wallets`
--
DELIMITER $$
CREATE TRIGGER `BALANCE_UPDATE` AFTER UPDATE ON `wallets` FOR EACH ROW BEGIN
        IF (OLD.balance != NEW.balance) THEN
            INSERT INTO wallet_records  (wallet_id, previous_balance, current_balance, created_at, updated_at) VALUES (OLD.id, OLD.balance, NEW.balance, NOW(), NOW());
        END IF;
       END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `WALLET_CREATE` AFTER INSERT ON `wallets` FOR EACH ROW BEGIN
            INSERT INTO wallet_records  (wallet_id, previous_balance, current_balance, created_at, updated_at) VALUES (NEW.id, NEW.balance, NEW.balance, NOW(), NOW());
        END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_records`
--

CREATE TABLE `wallet_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `wallet_id` bigint(20) UNSIGNED NOT NULL,
  `previous_balance` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `current_balance` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal2fas`
--

CREATE TABLE `withdrawal2fas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `wallet_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `coin_id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(19,8) NOT NULL,
  `fees` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `transaction_hash` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'status: waiting = 0, processed = 1, pending = 2, cancelled = 3',
  `in_queue` tinyint(1) NOT NULL DEFAULT 0,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  `withdrawal_coin_limit_setting_id` bigint(20) NOT NULL,
  `url_validation_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_validation_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `verification_code` int(11) DEFAULT NULL,
  `expire_at` timestamp NULL DEFAULT NULL,
  `failed_count` smallint(6) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `wallet_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(19,8) NOT NULL,
  `address_type` tinyint(4) NOT NULL,
  `receiver_wallet_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fees` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `transaction_hash` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmations` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'status: waiting = 0, processed = 1, pending = 2, cancelled = 3',
  `in_queue` tinyint(1) NOT NULL DEFAULT 0,
  `doller` decimal(19,8) NOT NULL DEFAULT 0.00000000,
  `withdraw_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_cancel_reasons`
--

CREATE TABLE `withdrawal_cancel_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `withdrawal_id` bigint(20) UNSIGNED NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_coin_limit_settings`
--

CREATE TABLE `withdrawal_coin_limit_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from` decimal(19,8) NOT NULL,
  `to` decimal(19,8) NOT NULL,
  `id_verify_status` tinyint(4) NOT NULL DEFAULT 0,
  `phone_verify_status` tinyint(1) NOT NULL DEFAULT 1,
  `admin_approval` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `google2fa` tinyint(1) NOT NULL DEFAULT 0,
  `email2fa` tinyint(1) NOT NULL DEFAULT 0,
  `coin_id` bigint(20) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bids_service_id_index` (`service_id`),
  ADD KEY `bids_user_id_index` (`user_id`);

--
-- Indexes for table `bid_histories`
--
ALTER TABLE `bid_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bid_histories_service_id_index` (`service_id`),
  ADD KEY `bid_histories_user_id_index` (`user_id`),
  ADD KEY `bid_histories_coin_id_index` (`coin_id`),
  ADD KEY `bid_histories_wallet_id_index` (`wallet_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_translations_category_id_locale_unique` (`category_id`,`locale`),
  ADD KEY `category_translations_locale_index` (`locale`),
  ADD KEY `category_translations_category_id_index` (`category_id`);

--
-- Indexes for table `coins`
--
ALTER TABLE `coins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coins_coin_type_unique` (`coin_type`);

--
-- Indexes for table `coin_payment_api_logs`
--
ALTER TABLE `coin_payment_api_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coin_settings`
--
ALTER TABLE `coin_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coin_settings_coin_id_foreign` (`coin_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_translations`
--
ALTER TABLE `content_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_translations_content_id_locale_unique` (`content_id`,`locale`),
  ADD KEY `content_translations_locale_index` (`locale`),
  ADD KEY `content_translations_content_id_index` (`content_id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deposits_receiver_wallet_id_transaction_hash_unique` (`receiver_wallet_id`,`transaction_hash`);

--
-- Indexes for table `earnings`
--
ALTER TABLE `earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_heads`
--
ALTER TABLE `faq_heads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_head_translations`
--
ALTER TABLE `faq_head_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `faq_head_translations_faq_head_id_locale_unique` (`faq_head_id`,`locale`),
  ADD KEY `faq_head_translations_locale_index` (`locale`),
  ADD KEY `faq_head_translations_faq_head_id_index` (`faq_head_id`);

--
-- Indexes for table `faq_translations`
--
ALTER TABLE `faq_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `faq_translations_faq_id_locale_unique` (`faq_id`,`locale`),
  ADD KEY `faq_translations_locale_index` (`locale`),
  ADD KEY `faq_translations_faq_id_index` (`faq_id`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `like_views`
--
ALTER TABLE `like_views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_translations`
--
ALTER TABLE `news_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `news_translations_news_id_locale_unique` (`news_id`,`locale`),
  ADD KEY `news_translations_locale_index` (`locale`),
  ADD KEY `news_translations_news_id_index` (`news_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `resell_services`
--
ALTER TABLE `resell_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resell_services_new_service_id_index` (`new_service_id`),
  ADD KEY `resell_services_past_service_id_index` (`past_service_id`);

--
-- Indexes for table `sell_services`
--
ALTER TABLE `sell_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_services_service_id_index` (`service_id`),
  ADD KEY `sell_services_user_id_index` (`user_id`),
  ADD KEY `sell_services_coin_id_index` (`coin_id`),
  ADD KEY `sell_services_wallet_id_index` (`wallet_id`);

--
-- Indexes for table `send_mail_records`
--
ALTER TABLE `send_mail_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_charges`
--
ALTER TABLE `service_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider_translations`
--
ALTER TABLE `slider_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slider_translations_slider_id_locale_unique` (`slider_id`,`locale`),
  ADD KEY `slider_translations_locale_index` (`locale`),
  ADD KEY `slider_translations_slider_id_index` (`slider_id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `top_sellers`
--
ALTER TABLE `top_sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_buyer_id_index` (`buyer_id`),
  ADD KEY `transactions_seller_id_index` (`seller_id`),
  ADD KEY `transactions_bid_id_index` (`bid_id`),
  ADD KEY `transactions_coin_id_index` (`coin_id`);

--
-- Indexes for table `transfer_tokens`
--
ALTER TABLE `transfer_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_tokens_service_id_index` (`service_id`),
  ADD KEY `transfer_tokens_resell_service_id_index` (`resell_service_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_reset_code_unique` (`reset_code`);

--
-- Indexes for table `user_settings`
--
ALTER TABLE `user_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_settings_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_social_media`
--
ALTER TABLE `user_social_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_social_media_user_id_index` (`user_id`);

--
-- Indexes for table `user_verification_codes`
--
ALTER TABLE `user_verification_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_user_id_foreign` (`user_id`),
  ADD KEY `wallets_coin_id_foreign` (`coin_id`);

--
-- Indexes for table `wallet_records`
--
ALTER TABLE `wallet_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_records_wallet_id_foreign` (`wallet_id`);

--
-- Indexes for table `withdrawal2fas`
--
ALTER TABLE `withdrawal2fas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdrawal2fas_user_id_foreign` (`user_id`),
  ADD KEY `withdrawal2fas_wallet_id_foreign` (`wallet_id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdrawals_wallet_id_foreign` (`wallet_id`);

--
-- Indexes for table `withdrawal_cancel_reasons`
--
ALTER TABLE `withdrawal_cancel_reasons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdrawal_cancel_reasons_withdrawal_id_foreign` (`withdrawal_id`);

--
-- Indexes for table `withdrawal_coin_limit_settings`
--
ALTER TABLE `withdrawal_coin_limit_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdrawal_coin_limit_settings_created_by_foreign` (`created_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bid_histories`
--
ALTER TABLE `bid_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `coins`
--
ALTER TABLE `coins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coin_payment_api_logs`
--
ALTER TABLE `coin_payment_api_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coin_settings`
--
ALTER TABLE `coin_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `content_translations`
--
ALTER TABLE `content_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `earnings`
--
ALTER TABLE `earnings`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `faq_heads`
--
ALTER TABLE `faq_heads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `faq_head_translations`
--
ALTER TABLE `faq_head_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `faq_translations`
--
ALTER TABLE `faq_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `follows`
--
ALTER TABLE `follows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `like_views`
--
ALTER TABLE `like_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news_translations`
--
ALTER TABLE `news_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `resell_services`
--
ALTER TABLE `resell_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sell_services`
--
ALTER TABLE `sell_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `send_mail_records`
--
ALTER TABLE `send_mail_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service_charges`
--
ALTER TABLE `service_charges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `slider_translations`
--
ALTER TABLE `slider_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `top_sellers`
--
ALTER TABLE `top_sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfer_tokens`
--
ALTER TABLE `transfer_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_settings`
--
ALTER TABLE `user_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_social_media`
--
ALTER TABLE `user_social_media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_verification_codes`
--
ALTER TABLE `user_verification_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_records`
--
ALTER TABLE `wallet_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawal2fas`
--
ALTER TABLE `withdrawal2fas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawal_cancel_reasons`
--
ALTER TABLE `withdrawal_cancel_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawal_coin_limit_settings`
--
ALTER TABLE `withdrawal_coin_limit_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coin_settings`
--
ALTER TABLE `coin_settings`
  ADD CONSTRAINT `coin_settings_coin_id_foreign` FOREIGN KEY (`coin_id`) REFERENCES `coins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `content_translations`
--
ALTER TABLE `content_translations`
  ADD CONSTRAINT `content_translations_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `deposits`
--
ALTER TABLE `deposits`
  ADD CONSTRAINT `deposits_receiver_wallet_id_foreign` FOREIGN KEY (`receiver_wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faq_head_translations`
--
ALTER TABLE `faq_head_translations`
  ADD CONSTRAINT `faq_head_translations_faq_head_id_foreign` FOREIGN KEY (`faq_head_id`) REFERENCES `faq_heads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faq_translations`
--
ALTER TABLE `faq_translations`
  ADD CONSTRAINT `faq_translations_faq_id_foreign` FOREIGN KEY (`faq_id`) REFERENCES `faqs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news_translations`
--
ALTER TABLE `news_translations`
  ADD CONSTRAINT `news_translations_news_id_foreign` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `slider_translations`
--
ALTER TABLE `slider_translations`
  ADD CONSTRAINT `slider_translations_slider_id_foreign` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_settings`
--
ALTER TABLE `user_settings`
  ADD CONSTRAINT `user_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_coin_id_foreign` FOREIGN KEY (`coin_id`) REFERENCES `coins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wallet_records`
--
ALTER TABLE `wallet_records`
  ADD CONSTRAINT `wallet_records_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `withdrawal2fas`
--
ALTER TABLE `withdrawal2fas`
  ADD CONSTRAINT `withdrawal2fas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `withdrawal2fas_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD CONSTRAINT `withdrawals_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `withdrawal_cancel_reasons`
--
ALTER TABLE `withdrawal_cancel_reasons`
  ADD CONSTRAINT `withdrawal_cancel_reasons_withdrawal_id_foreign` FOREIGN KEY (`withdrawal_id`) REFERENCES `withdrawals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `withdrawal_coin_limit_settings`
--
ALTER TABLE `withdrawal_coin_limit_settings`
  ADD CONSTRAINT `withdrawal_coin_limit_settings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
