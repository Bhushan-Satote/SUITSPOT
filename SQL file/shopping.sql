-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2024 at 02:09 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '2024-01-03 16:21:18', '21-01-2024 08:27:55 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(7, 'Formal Suits', 'This is category for Formal Suits', '2024-03-09 05:11:45', '09-03-2024 11:49:12 AM'),
(8, 'Casual Suits', 'This Category for Casual Suits', '2024-03-09 06:19:49', NULL),
(9, 'Occasion-Specific Suits', 'This Category for Occasion-Specific Suites', '2024-03-09 06:20:33', NULL),
(10, 'Accessories', 'This Category for All Accessories ', '2024-03-09 06:21:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(7, 4, '3', 1, '2024-02-28 05:53:47', 'Internet Banking', 'Delivered'),
(8, 4, '4', 1, '2024-02-28 05:53:47', 'Internet Banking', NULL),
(9, 4, '15', 1, '2024-02-28 08:59:57', 'Debit / Credit card', 'in Process'),
(10, 4, '15', 1, '2024-02-29 07:59:24', 'COD', NULL),
(11, 5, '23', 1, '2024-03-12 03:45:50', 'COD', 'Delivered'),
(12, 5, '26', 4, '2024-03-12 03:45:50', 'COD', NULL),
(13, 5, '27', 1, '2024-03-12 03:49:48', 'COD', NULL),
(15, 5, '21', 1, '2024-03-12 11:23:09', 'COD', NULL),
(16, 5, '25', 1, '2024-03-12 11:23:09', 'COD', NULL),
(17, 5, '29', 1, '2024-03-12 11:25:51', 'COD', NULL),
(18, 5, '22', 1, '2024-03-12 12:15:10', 'COD', NULL),
(19, 5, '22', 1, '2024-03-12 12:19:47', 'COD', NULL),
(20, 5, '21', 1, '2024-03-12 14:32:01', 'Debit / Credit card', NULL),
(21, 1, '22', 1, '2024-03-13 17:22:26', 'COD', NULL),
(22, 1, '31', 4, '2024-03-14 02:35:19', 'COD', 'in Process'),
(23, 1, '25', 1, '2024-03-15 14:39:24', NULL, NULL),
(24, 1, '22', 1, '2024-03-20 16:37:57', NULL, NULL),
(25, 1, '23', 1, '2024-03-26 15:34:37', NULL, NULL),
(26, 1, '23', 1, '2024-03-26 15:36:17', NULL, NULL),
(27, 1, '23', 1, '2024-03-27 16:06:45', NULL, 'in Process');

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 7, 'Delivered', 'deliverd to customer', '2024-02-28 06:03:23'),
(2, 9, 'in Process', 'this product in in process', '2024-02-28 09:02:09'),
(7, 11, 'Delivered', 'product is diliver', '2024-03-12 04:46:38'),
(8, 22, 'in Process', 'in process', '2024-03-14 03:14:16'),
(9, 27, 'in Process', 'This Product is In Process', '2024-03-27 17:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(5, 21, 4, 3, 5, 'Hashad', 'about product', 'this product is so precious', '2024-03-09 06:06:55'),
(6, 32, 2, 2, 4, 'dhruv', 'about product', 'very good goggle', '2024-03-09 08:42:38'),
(7, 33, 1, 2, 4, 'dhriu', 'dnb vbv v', 'bvbvdfbvfb', '2024-03-11 04:29:10');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(21, 7, 13, 'Men Single Breasted - 2 button Solid Suit', 'PETER ENGLAND', 6999, 11999, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px; text-align: justify;\">Exquisitely cut in a Slim Fit , this Pink Solid three piece suit from Peter England Elite by Peter England is a smart investment for your style repertoire.</span><br>', 's-t516-blazer-ss-blue-ad-av-original-imafxqxx969g5gzd.jpg', 's-t516-blazer-ss-blue-ad-av-original-imafxqxxpnh2fcbq.jpg', 's-t516-blazer-ss-blue-ad-av-original-imafxqxxzqdaa6xm.jpg', 0, 'In Stock', '2024-03-09 05:16:07', NULL),
(23, 7, 15, 'Men Colorblock Tuxedo Style Casual Blazer', 'MATT PIE ', 375, 499, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px; text-align: justify;\">These shrugs are thoughtfully designed to not just make you look trendy but also feel cosy and comfortable whenever you put these on. These are designed to get along with almost your entire wardrobe and enhance the appearance of your casuals as well.</span><br>', 'xl-shrug3-pt-fs5000-dgy-wht-blk-matt-pie-original-imagyggnhg3a3geg.jpg', 'xl-shrug3-pt-fs5000-dgy-wht-blk-matt-pie-original-imagyggnkxvrhmuc.jpg', 'xl-shrug3-pt-fs5000-dgy-wht-blk-matt-pie-original-imagyggnpda89gnr.jpg', 0, 'In Stock', '2024-03-09 07:40:07', NULL),
(24, 7, 16, 'Men 3 Piece Suit Solid Suit', 'Diamond Style ', 3337, 15999, '<ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(135, 135, 135); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_3_27HS\" style=\"box-sizing: border-box; margin: 16px 0px 0px 45px; padding: 0px; list-style: decimal; color: rgb(0, 0, 0); line-height: 1.5;\">DIAMOND STYLE EMBROIDERY NEW SEELAMPUR,DELHI 110053</li></ul>', '38-ds-gd-01-diamond-style-original-imagz8nw9mzhnf6h.jpg', '38-ds-gd-01-diamond-style-original-imagz8nwfzk9mkbj.jpg', '38-ds-gd-01-diamond-style-original-imagz8nww4geuhbb.jpg', 0, 'Out of Stock', '2024-03-09 07:43:27', NULL),
(25, 8, 17, 'Men Self Design Single Breasted Formal Blazer  (Dark Blue)', 'PARK AVENUE ', 2165, 6999, '<ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(135, 135, 135); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_3_27HS\" style=\"box-sizing: border-box; margin: 16px 0px 0px 45px; padding: 0px; list-style: decimal; color: rgb(0, 0, 0); line-height: 1.5;\">LBS Marg And CST Road juntion Maharahstra 400070</li></ul>', '48-pmjw02799-b8-park-avenue-original-imaggnyvzpmkfuab.jpg', '48-pmjw02799-b8-park-avenue-original-imaggnyvx5wgfzvy.jpg', '48-pmjw02799-b8-park-avenue-original-imaggnyvgqrbtrkj.jpg', 0, 'In Stock', '2024-03-09 07:49:25', NULL),
(26, 8, 18, 'Men Solid Sports Jacket', 'Triptee ', 355, 1599, '<div class=\"_3-9BsV\" style=\"box-sizing: border-box; margin: 10px 0px 0px 30px; padding: 0px; font-size: 18px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">Manufactured by: <span style=\"color: rgb(0, 0, 0); font-size: 14px;\">Wonder Apparels</span></div>', 'm-6017-triptee-original-imaghhsjz78ggtsf.jpg', 'm-6017-triptee-original-imaghhsjbvb2zwxg.jpg', 'm-6017-triptee-original-imaghhsjayqp6vum.jpg', 0, 'In Stock', '2024-03-09 07:53:09', NULL),
(27, 9, 19, 'Solid Men Waistcoat', 'FAVOROSKI ', 1249, 3999, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px; text-align: justify;\">Favoroski brings to you an amazing collection of Nehru Jackets &amp; Waistcoats for Men in different various colour combinations.&nbsp;</span><br>', '42-favjc161127-42-favoroski-original-imafgmydgamajzgc-bb.jpg', '48-favjc161127-48-favoroski-original-imafgmydrpd4mnqk.jpg', '48-favjc161127-48-favoroski-original-imafgmydrpd4mnqk.jpg', 20, 'In Stock', '2024-03-09 07:58:54', NULL),
(28, 9, 20, 'Men Solid Single Breasted Casual, Party, Formal Blazer  (Black)', 'Rajusaini ', 1424, 4999, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px; text-align: justify;\">It seems like there might be a typo in your question. Did you mean to ask about a \"blazer\" and its description? If so, a blazer is a type of jacket that resembles a suit jacket but is more casual</span><br>', '38-new-bristed-rajusaini-original-imagx3ghmngxcdz9.jpg', '38-new-bristed-rajusaini-original-imagx3ghjarkxzgv.jpg', '38-new-bristed-rajusaini-original-imagx3ghcgvfnfsy.jpg', 0, 'In Stock', '2024-03-09 08:06:33', NULL),
(29, 10, 22, 'MUTAQINOTI Silk Tie Pin Set  (Blue)', 'MUTAQINOTI', 499, 3499, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">MUTAQINOTI suit accessories sets are designed for all urban men&nbsp;</span><br>', 'free-1-mq-tegpc-bu011-mutaqinoti-original-imagnz3xdzpyuzq7.jpg', 'free-1-mq-tegpc-bu011-mutaqinoti-original-imagnz3xerm3zpyf.jpg', 'free-1-mq-tegpc-bu011-mutaqinoti-original-imagnz3x8ayewzcg.jpg', 0, 'In Stock', '2024-03-09 08:14:31', NULL),
(30, 10, 22, 'Men Casual, Evening, Formal, Party Black, Brown Texas Leatherite Reversible Belt', 'FAZON', 287, 1299, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px; text-align: justify;\">SIZE: Choose the waist size as required from the drop down option.</span><br>', '44-artificial-leather-reversible-casual-and-formal-premium-original-imagha9hbp6gfvdc.jpg', '40-artificial-leather-reversible-casual-and-formal-premium-original-imaghaayg3gmqtrm.jpg', '40-artificial-leather-reversible-casual-and-formal-premium-original-imaghaaycubbuewt.jpg', 0, 'In Stock', '2024-03-09 08:17:43', NULL),
(31, 10, 23, 'Formal/Suit Wear Brown Synthetic With Minimalistic Laser Branding Lace Up For Men  (Brown)', 'ALBERTO TORRESI ', 1849, 3999, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px; text-align: justify;\">Presenting the first of the new range of formals from house Alberto.</span><br>', '11-88608-alberto-torresi-brown-original-imagwmdryuzzp7rm.jpg', '11-88608-alberto-torresi-brown-original-imagwmdrcemyqqr4.jpg', '10-88608-alberto-torresi-brown-original-imagwnpswgr7qm5y.jpg', 0, 'In Stock', '2024-03-09 08:21:25', NULL),
(32, 10, 21, 'UV Protection, Mirrored Rectangular Sunglasses (Free Size)  (For Men & Women, Red, Yellow)', 'Els ', 321, 899, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px; text-align: justify;\">ELS G-KING Unisex Sunglass Is Ideal Choice Of Everyone; Perfect Combination Of UV protection And Style.</span><br>', '8007-shiny-red-50-els-original-imaew24zmcge8hcp.jpg', '8007-shiny-red-50-els-original-imaew24xzn8hv2uz.jpg', '8007-shiny-red-50-els-original-imaew24xvhafp7yq.jpg', 0, 'In Stock', '2024-03-09 08:25:01', NULL),
(33, 10, 23, 'UV Protection, Mirrored Rectangular Sunglasses (Free Size)  (For Men & Women, Red, Yellow)', 'Els ', 1249, 6999, 'wdcvghnbvvghjgnbfghn', '10-88608-alberto-torresi-brown-original-imagwnpswgr7qm5y.jpg', '11-88608-alberto-torresi-brown-original-imagwmdrcemyqqr4.jpg', '11-88608-alberto-torresi-brown-original-imagwmdryuzzp7rm.jpg', 0, 'Out of Stock', '2024-03-11 04:28:35', NULL),
(34, 8, 17, 'Men Solid Single Breasted Casual Blazer  (Black)', 'minaar creations ', 2092, 5580, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px; text-align: justify;\">The MINAAR CREATIONS, stylish fashion wear blazer for men at the affordable price range.</span><br>', 'xs-black-34-minaar-creations-original-imaguhj2v8mwgqcc.jpg', 'xs-black-34-minaar-creations-original-imaguhj26eerpc5g.jpg', '', 0, 'In Stock', '2024-03-21 04:52:15', NULL),
(35, 7, 13, 'Men Self Design Single Breasted Formal Blazer  (Grey)', 'ARROW', 3719, 5999, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px; text-align: justify;\">Enhance your collection of formals with this polyester-blend knit blazer</span><br>', '36-arafbz5024-arrow-original-imagmy3m3zznv7cf.jpg', '36-arafbz5024-arrow-original-imagmy3mbpcmurgc.jpg', '36-arafbz5024-arrow-original-imagmy3mdbdhszwt.jpg', 0, 'In Stock', '2024-03-21 04:54:31', NULL),
(36, 8, 17, 'Men Self Design Single Breasted Casual Blazer  (Beige)', 'PETER ENGLAND ', 5999, 4759, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">The blazer looks good and gives you a decent appearance.</span><br>', '-original-imagtueqexeyxnsz.jpg', '-original-imagtueqhfmns85y.jpg', '-original-imagtueqyyth7uc2.jpg', 0, 'In Stock', '2024-03-21 04:57:37', NULL),
(37, 9, 19, 'Men jodhpuri bandhgala Solid Suit', 'ALJAAMI ', 3299, 6999, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px; text-align: justify;\">jodhpuri suit with design Button Select your suit size based on your chest dimension.</span><br>', '36-aj-suit-tr-balck-aljaami-original-imagsyfztmydydge.jpg', '36-aj-suit-tr-balck-aljaami-original-imagsyfz7sjzzagy.jpg', '36-aj-suit-tr-balck-aljaami-original-imagsyfzebg4d47z.jpg', 0, 'Out of Stock', '2024-03-21 15:00:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(13, 7, 'two-pis', '2024-03-09 05:15:21', '09-03-2024 11:38:27 AM'),
(14, 7, 'Business Suits', '2024-03-09 06:47:23', NULL),
(15, 7, 'Tuxedos', '2024-03-09 06:47:41', NULL),
(16, 7, 'Three-Piece Suits', '2024-03-09 06:47:53', NULL),
(17, 8, 'Blazers', '2024-03-09 06:48:09', NULL),
(18, 8, 'Sports Jackets', '2024-03-09 06:48:34', NULL),
(19, 9, 'Wedding Suits', '2024-03-09 06:49:01', NULL),
(20, 9, 'Party Suits', '2024-03-09 06:49:12', NULL),
(21, 10, 'Goggles', '2024-03-09 06:49:38', NULL),
(22, 10, 'Tie & Belt', '2024-03-09 06:51:52', NULL),
(23, 10, 'Shoes', '2024-03-09 06:55:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'dhruv01@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-28 05:51:47', NULL, 0),
(2, 'dhruv01@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-28 05:53:01', NULL, 0),
(3, 'dhruv@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-28 05:53:08', NULL, 0),
(4, 'dhruv@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-28 05:53:19', '28-02-2024 11:25:41 AM', 1),
(5, 'dhruv@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-28 08:59:23', NULL, 1),
(29, 'dhruv@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-28 09:29:39', NULL, 1),
(30, 'dhruv01@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-29 07:56:21', NULL, 0),
(31, 'dhruv@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-29 07:59:08', NULL, 1),
(32, 'dhruv01@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-08 15:14:16', NULL, 0),
(33, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-08 15:14:25', NULL, 0),
(34, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-08 15:16:01', '08-03-2024 08:50:16 PM', 1),
(35, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-08 16:58:02', NULL, 0),
(36, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-08 16:58:17', NULL, 1),
(37, 'dhruv01@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-11 04:22:49', NULL, 0),
(38, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-11 04:23:03', NULL, 1),
(39, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-12 03:38:07', '12-03-2024 09:08:35 AM', 1),
(40, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-12 03:39:02', NULL, 1),
(41, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-12 04:28:41', '12-03-2024 10:46:46 AM', 1),
(42, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-12 11:23:01', NULL, 1),
(43, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-13 09:42:44', '13-03-2024 03:21:47 PM', 1),
(44, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-13 17:22:04', NULL, 1),
(45, 'dhruv01@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-14 02:33:49', NULL, 0),
(46, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-14 02:34:14', '14-03-2024 08:39:34 AM', 1),
(47, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-14 03:10:10', NULL, 1),
(48, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-15 14:39:20', NULL, 1),
(49, 'bhushansatote@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-20 16:37:34', NULL, 0),
(50, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-20 16:37:51', '20-03-2024 10:46:21 PM', 1),
(51, 'dhruv01@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-20 17:17:55', '20-03-2024 10:48:47 PM', 1),
(52, 'pruthvraj01@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-20 17:19:13', NULL, 0),
(53, 'pruthvi01@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-20 17:19:57', '20-03-2024 10:51:23 PM', 1),
(54, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-20 17:21:41', '20-03-2024 10:54:35 PM', 1),
(55, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-22 12:43:38', NULL, 0),
(56, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-22 12:43:51', '22-03-2024 06:16:58 PM', 1),
(57, 'pruthvraj01@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-22 12:47:12', NULL, 0),
(58, 'pruthvi01@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-22 12:47:25', '22-03-2024 06:19:15 PM', 1),
(59, 'dhruv01@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-22 12:50:14', '22-03-2024 06:21:24 PM', 1),
(60, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-22 12:51:38', NULL, 1),
(61, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-26 15:34:32', NULL, 1),
(62, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-27 16:06:35', '27-03-2024 11:10:52 PM', 1),
(63, 'bhushansatote95@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-27 17:42:28', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(1, 'Bhushan Rajubhai Satote', 'bhushansatote95@gmail.com', 9856987412, '7d2fa1c2a91856a4470dd18e5f9fa031', 'Umiyanagar Soc. Godadara', 'Gujarat', 'Surat', 391050, NULL, NULL, NULL, NULL, '2024-02-29 07:56:45', NULL),
(6, 'Dhruv Trivedi', 'dhruv01@gmail.com', 9876543211, 'd6760880f41dfc85b159cc9f078006dc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-20 17:16:56', NULL),
(7, 'pruthviraj', 'pruthvi01@gmail.com', 9876543211, 'b442e787c49b929999145d7c7ec56d31', 'B-75\r\nGODADAra naher\r\nGODADARA', 'Gujarat', 'Surat', 391050, NULL, NULL, NULL, NULL, '2024-03-20 17:17:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(2, 4, 17, '2024-02-28 05:54:54'),
(3, 4, 4, '2024-02-28 09:29:51'),
(8, 5, 21, '2024-03-13 09:42:55'),
(10, 6, 26, '2024-03-20 17:18:06'),
(13, 7, 34, '2024-03-22 12:48:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
