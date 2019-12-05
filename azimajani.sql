-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2019 at 08:17 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `azimajani`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `picture`, `name`) VALUES
(1, 'admin', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', NULL, 'Mark');

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `subcat_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `description` text,
  `picture` text,
  `firstname` varchar(100) DEFAULT '0',
  `lastname` varchar(100) DEFAULT '0',
  `phone` varchar(100) DEFAULT '0',
  `country` varchar(100) DEFAULT '238',
  `state` varchar(100) DEFAULT '0',
  `city` varchar(100) DEFAULT '0',
  `address` varchar(100) DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('active','inactive','sold','expired','deleted') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `cat_id`, `subcat_id`, `title`, `price`, `description`, `picture`, `firstname`, `lastname`, `phone`, `country`, `state`, `city`, `address`, `views`, `user_id`, `featured`, `status`, `created_at`) VALUES
(23, 1, 3, 'Rado Ex-1', '5500.00', 'Rolex Submariner blue dial two-tone Steel Gold\r\n\r\nReference number:16613\r\n\r\nWe deals in all kinds of luxury watches contact us on WhatsApp for more details', 'image11.jpg,image2.jpg,image3.jpg', 'Abdul', 'Hafeez', '3123349398', '170', 'Sindh', 'Sukkur', 'Sukkur Pakistan', 0, 3, 1, 'active', '2019-08-23 05:59:43'),
(58, 1, 2, 'ssddssdf', '2000.00', 'sdfsdfsdfsdfsdfsdf                                            ', 'image2.jpg', '0', '0', '0', '170', '0', '0', 'wsdfsdfsf', 0, 3, 0, 'active', '2019-09-13 06:20:32'),
(108, 1, 2, 'pt', '20000.00', '              mdsfjesjzncjhelfoijmxnc                              ', 'eid.jpg', '0', '0', '0', '238', '0', '0', 'gulshan clock b', 0, 3, 0, 'active', '2019-09-18 08:56:16');

-- --------------------------------------------------------

--
-- Table structure for table `app_home_banner`
--

CREATE TABLE `app_home_banner` (
  `id` int(11) NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `picture` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_home_banner`
--

INSERT INTO `app_home_banner` (`id`, `title`, `picture`) VALUES
(1, 'Premimum', 'banner_01.jpg'),
(2, 'Premimum', 'banner_02.jpg'),
(3, 'Premimum', 'banner_03.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `branch_table`
--

CREATE TABLE `branch_table` (
  `branch_id` int(11) NOT NULL,
  `branch_title` varchar(255) DEFAULT NULL,
  `branch_info_title` varchar(255) DEFAULT NULL,
  `branch_info_phone` varchar(255) DEFAULT NULL,
  `branch_info_address` char(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `company_id_fk` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch_table`
--

INSERT INTO `branch_table` (`branch_id`, `branch_title`, `branch_info_title`, `branch_info_phone`, `branch_info_address`, `email`, `company_id_fk`) VALUES
(1, 'HABIB BANK LIMITED DEMO', 'SSDEMO1', '12345678', 'I.I. CHUNDRIGHAR ROAD KARACHI', 'azim@aajani.info', '3'),
(2, 'JS BANK LIMITED', 'LNDDEMO1', '32488888', 'SHAHEEN COMPLEX KARACHI', 'azim@aajani.info', '4'),
(3, 'UFONE FRANCHIES', 'PPDEMO1C', '02135877888', 'DHA PHASE-II', 'azim@aajani.info', '5'),
(4, 'AFZAL ROAD', 'LNDEMO1', '234565432', '1234 DHSGHEN BJJS', 'arehmans@live.com', '6');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `picture`, `status`) VALUES
(1, 'Watches', 'Watches5.jpg', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `company_table`
--

CREATE TABLE `company_table` (
  `company_id` int(11) NOT NULL,
  `company_title` varchar(255) DEFAULT NULL,
  `zone_id_fk` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_table`
--

INSERT INTO `company_table` (`company_id`, `company_title`, `zone_id_fk`) VALUES
(3, 'HBL', '1'),
(4, 'JSL', '1'),
(5, 'UFONE', '1'),
(6, 'UFONE', '2');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `alpha2Code` varchar(2) DEFAULT NULL,
  `alpha3Code` varchar(3) DEFAULT NULL,
  `callingCodes` varchar(10) DEFAULT NULL,
  `capital` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `subregion` varchar(100) DEFAULT NULL,
  `currencies` varchar(100) DEFAULT NULL,
  `flag` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `alpha2Code`, `alpha3Code`, `callingCodes`, `capital`, `region`, `subregion`, `currencies`, `flag`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '93', 'Kabul', 'Asia', 'Southern Asia', 'AFN', 'https://restcountries.eu/data/afg.svg'),
(2, 'Åland Islands', 'AX', 'ALA', '358', 'Mariehamn', 'Europe', 'Northern Europe', 'EUR', 'https://restcountries.eu/data/ala.svg'),
(3, 'Albania', 'AL', 'ALB', '355', 'Tirana', 'Europe', 'Southern Europe', 'ALL', 'https://restcountries.eu/data/alb.svg'),
(4, 'Algeria', 'DZ', 'DZA', '213', 'Algiers', 'Africa', 'Northern Africa', 'DZD', 'https://restcountries.eu/data/dza.svg'),
(5, 'American Samoa', 'AS', 'ASM', '1684', 'Pago Pago', 'Oceania', 'Polynesia', 'USD', 'https://restcountries.eu/data/asm.svg'),
(6, 'Andorra', 'AD', 'AND', '376', 'Andorra la Vella', 'Europe', 'Southern Europe', 'EUR', 'https://restcountries.eu/data/and.svg'),
(7, 'Angola', 'AO', 'AGO', '244', 'Luanda', 'Africa', 'Middle Africa', 'AOA', 'https://restcountries.eu/data/ago.svg'),
(8, 'Anguilla', 'AI', 'AIA', '1264', 'The Valley', 'Americas', 'Caribbean', 'XCD', 'https://restcountries.eu/data/aia.svg'),
(9, 'Antarctica', 'AQ', 'ATA', '672', '', 'Polar', '', 'AUD', 'https://restcountries.eu/data/ata.svg'),
(10, 'Antigua and Barbuda', 'AG', 'ATG', '1268', 'Saint John\'s', 'Americas', 'Caribbean', 'XCD', 'https://restcountries.eu/data/atg.svg'),
(11, 'Argentina', 'AR', 'ARG', '54', 'Buenos Aires', 'Americas', 'South America', 'ARS', 'https://restcountries.eu/data/arg.svg'),
(12, 'Armenia', 'AM', 'ARM', '374', 'Yerevan', 'Asia', 'Western Asia', 'AMD', 'https://restcountries.eu/data/arm.svg'),
(13, 'Aruba', 'AW', 'ABW', '297', 'Oranjestad', 'Americas', 'Caribbean', 'AWG', 'https://restcountries.eu/data/abw.svg'),
(14, 'Australia', 'AU', 'AUS', '61', 'Canberra', 'Oceania', 'Australia and New Zealand', 'AUD', 'https://restcountries.eu/data/aus.svg'),
(15, 'Austria', 'AT', 'AUT', '43', 'Vienna', 'Europe', 'Western Europe', 'EUR', 'https://restcountries.eu/data/aut.svg'),
(16, 'Azerbaijan', 'AZ', 'AZE', '994', 'Baku', 'Asia', 'Western Asia', 'AZN', 'https://restcountries.eu/data/aze.svg'),
(17, 'Bahamas', 'BS', 'BHS', '1242', 'Nassau', 'Americas', 'Caribbean', 'BSD', 'https://restcountries.eu/data/bhs.svg'),
(18, 'Bahrain', 'BH', 'BHR', '973', 'Manama', 'Asia', 'Western Asia', 'BHD', 'https://restcountries.eu/data/bhr.svg'),
(19, 'Bangladesh', 'BD', 'BGD', '880', 'Dhaka', 'Asia', 'Southern Asia', 'BDT', 'https://restcountries.eu/data/bgd.svg'),
(20, 'Barbados', 'BB', 'BRB', '1246', 'Bridgetown', 'Americas', 'Caribbean', 'BBD', 'https://restcountries.eu/data/brb.svg'),
(21, 'Belarus', 'BY', 'BLR', '375', 'Minsk', 'Europe', 'Eastern Europe', 'BYN', 'https://restcountries.eu/data/blr.svg'),
(22, 'Belgium', 'BE', 'BEL', '32', 'Brussels', 'Europe', 'Western Europe', 'EUR', 'https://restcountries.eu/data/bel.svg'),
(23, 'Belize', 'BZ', 'BLZ', '501', 'Belmopan', 'Americas', 'Central America', 'BZD', 'https://restcountries.eu/data/blz.svg'),
(24, 'Benin', 'BJ', 'BEN', '229', 'Porto-Novo', 'Africa', 'Western Africa', 'XOF', 'https://restcountries.eu/data/ben.svg'),
(25, 'Bermuda', 'BM', 'BMU', '1441', 'Hamilton', 'Americas', 'Northern America', 'BMD', 'https://restcountries.eu/data/bmu.svg'),
(26, 'Bhutan', 'BT', 'BTN', '975', 'Thimphu', 'Asia', 'Southern Asia', 'BTN', 'https://restcountries.eu/data/btn.svg'),
(27, 'Bolivia (Plurinational State of)', 'BO', 'BOL', '591', 'Sucre', 'Americas', 'South America', 'BOB', 'https://restcountries.eu/data/bol.svg'),
(28, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '5997', 'Kralendijk', 'Americas', 'Caribbean', 'USD', 'https://restcountries.eu/data/bes.svg'),
(29, 'Bosnia and Herzegovina', 'BA', 'BIH', '387', 'Sarajevo', 'Europe', 'Southern Europe', 'BAM', 'https://restcountries.eu/data/bih.svg'),
(30, 'Botswana', 'BW', 'BWA', '267', 'Gaborone', 'Africa', 'Southern Africa', 'BWP', 'https://restcountries.eu/data/bwa.svg'),
(31, 'Bouvet Island', 'BV', 'BVT', '', '', '', '', 'NOK', 'https://restcountries.eu/data/bvt.svg'),
(32, 'Brazil', 'BR', 'BRA', '55', 'Brasília', 'Americas', 'South America', 'BRL', 'https://restcountries.eu/data/bra.svg'),
(33, 'British Indian Ocean Territory', 'IO', 'IOT', '246', 'Diego Garcia', 'Africa', 'Eastern Africa', 'USD', 'https://restcountries.eu/data/iot.svg'),
(34, 'United States Minor Outlying Islands', 'UM', 'UMI', '', '', 'Americas', 'Northern America', 'USD', 'https://restcountries.eu/data/umi.svg'),
(35, 'Virgin Islands (British)', 'VG', 'VGB', '1284', 'Road Town', 'Americas', 'Caribbean', NULL, 'https://restcountries.eu/data/vgb.svg'),
(36, 'Virgin Islands (U.S.)', 'VI', 'VIR', '1 340', 'Charlotte Amalie', 'Americas', 'Caribbean', 'USD', 'https://restcountries.eu/data/vir.svg'),
(37, 'Brunei Darussalam', 'BN', 'BRN', '673', 'Bandar Seri Begawan', 'Asia', 'South-Eastern Asia', 'BND', 'https://restcountries.eu/data/brn.svg'),
(38, 'Bulgaria', 'BG', 'BGR', '359', 'Sofia', 'Europe', 'Eastern Europe', 'BGN', 'https://restcountries.eu/data/bgr.svg'),
(39, 'Burkina Faso', 'BF', 'BFA', '226', 'Ouagadougou', 'Africa', 'Western Africa', 'XOF', 'https://restcountries.eu/data/bfa.svg'),
(40, 'Burundi', 'BI', 'BDI', '257', 'Bujumbura', 'Africa', 'Eastern Africa', 'BIF', 'https://restcountries.eu/data/bdi.svg'),
(41, 'Cambodia', 'KH', 'KHM', '855', 'Phnom Penh', 'Asia', 'South-Eastern Asia', 'KHR', 'https://restcountries.eu/data/khm.svg'),
(42, 'Cameroon', 'CM', 'CMR', '237', 'Yaoundé', 'Africa', 'Middle Africa', 'XAF', 'https://restcountries.eu/data/cmr.svg'),
(43, 'Canada', 'CA', 'CAN', '1', 'Ottawa', 'Americas', 'Northern America', 'CAD', 'https://restcountries.eu/data/can.svg'),
(44, 'Cabo Verde', 'CV', 'CPV', '238', 'Praia', 'Africa', 'Western Africa', 'CVE', 'https://restcountries.eu/data/cpv.svg'),
(45, 'Cayman Islands', 'KY', 'CYM', '1345', 'George Town', 'Americas', 'Caribbean', 'KYD', 'https://restcountries.eu/data/cym.svg'),
(46, 'Central African Republic', 'CF', 'CAF', '236', 'Bangui', 'Africa', 'Middle Africa', 'XAF', 'https://restcountries.eu/data/caf.svg'),
(47, 'Chad', 'TD', 'TCD', '235', 'N\'Djamena', 'Africa', 'Middle Africa', 'XAF', 'https://restcountries.eu/data/tcd.svg'),
(48, 'Chile', 'CL', 'CHL', '56', 'Santiago', 'Americas', 'South America', 'CLP', 'https://restcountries.eu/data/chl.svg'),
(49, 'China', 'CN', 'CHN', '86', 'Beijing', 'Asia', 'Eastern Asia', 'CNY', 'https://restcountries.eu/data/chn.svg'),
(50, 'Christmas Island', 'CX', 'CXR', '61', 'Flying Fish Cove', 'Oceania', 'Australia and New Zealand', 'AUD', 'https://restcountries.eu/data/cxr.svg'),
(51, 'Cocos (Keeling) Islands', 'CC', 'CCK', '61', 'West Island', 'Oceania', 'Australia and New Zealand', 'AUD', 'https://restcountries.eu/data/cck.svg'),
(52, 'Colombia', 'CO', 'COL', '57', 'Bogotá', 'Americas', 'South America', 'COP', 'https://restcountries.eu/data/col.svg'),
(53, 'Comoros', 'KM', 'COM', '269', 'Moroni', 'Africa', 'Eastern Africa', 'KMF', 'https://restcountries.eu/data/com.svg'),
(54, 'Congo', 'CG', 'COG', '242', 'Brazzaville', 'Africa', 'Middle Africa', 'XAF', 'https://restcountries.eu/data/cog.svg'),
(55, 'Congo (Democratic Republic of the)', 'CD', 'COD', '243', 'Kinshasa', 'Africa', 'Middle Africa', 'CDF', 'https://restcountries.eu/data/cod.svg'),
(56, 'Cook Islands', 'CK', 'COK', '682', 'Avarua', 'Oceania', 'Polynesia', 'NZD', 'https://restcountries.eu/data/cok.svg'),
(57, 'Costa Rica', 'CR', 'CRI', '506', 'San José', 'Americas', 'Central America', 'CRC', 'https://restcountries.eu/data/cri.svg'),
(58, 'Croatia', 'HR', 'HRV', '385', 'Zagreb', 'Europe', 'Southern Europe', 'HRK', 'https://restcountries.eu/data/hrv.svg'),
(59, 'Cuba', 'CU', 'CUB', '53', 'Havana', 'Americas', 'Caribbean', 'CUC', 'https://restcountries.eu/data/cub.svg'),
(60, 'Curaçao', 'CW', 'CUW', '599', 'Willemstad', 'Americas', 'Caribbean', 'ANG', 'https://restcountries.eu/data/cuw.svg'),
(61, 'Cyprus', 'CY', 'CYP', '357', 'Nicosia', 'Europe', 'Southern Europe', 'EUR', 'https://restcountries.eu/data/cyp.svg'),
(62, 'Czech Republic', 'CZ', 'CZE', '420', 'Prague', 'Europe', 'Eastern Europe', 'CZK', 'https://restcountries.eu/data/cze.svg'),
(63, 'Denmark', 'DK', 'DNK', '45', 'Copenhagen', 'Europe', 'Northern Europe', 'DKK', 'https://restcountries.eu/data/dnk.svg'),
(64, 'Djibouti', 'DJ', 'DJI', '253', 'Djibouti', 'Africa', 'Eastern Africa', 'DJF', 'https://restcountries.eu/data/dji.svg'),
(65, 'Dominica', 'DM', 'DMA', '1767', 'Roseau', 'Americas', 'Caribbean', 'XCD', 'https://restcountries.eu/data/dma.svg'),
(66, 'Dominican Republic', 'DO', 'DOM', '1809', 'Santo Domingo', 'Americas', 'Caribbean', 'DOP', 'https://restcountries.eu/data/dom.svg'),
(67, 'Ecuador', 'EC', 'ECU', '593', 'Quito', 'Americas', 'South America', 'USD', 'https://restcountries.eu/data/ecu.svg'),
(68, 'Egypt', 'EG', 'EGY', '20', 'Cairo', 'Africa', 'Northern Africa', 'EGP', 'https://restcountries.eu/data/egy.svg'),
(69, 'El Salvador', 'SV', 'SLV', '503', 'San Salvador', 'Americas', 'Central America', 'USD', 'https://restcountries.eu/data/slv.svg'),
(70, 'Equatorial Guinea', 'GQ', 'GNQ', '240', 'Malabo', 'Africa', 'Middle Africa', 'XAF', 'https://restcountries.eu/data/gnq.svg'),
(71, 'Eritrea', 'ER', 'ERI', '291', 'Asmara', 'Africa', 'Eastern Africa', 'ERN', 'https://restcountries.eu/data/eri.svg'),
(72, 'Estonia', 'EE', 'EST', '372', 'Tallinn', 'Europe', 'Northern Europe', 'EUR', 'https://restcountries.eu/data/est.svg'),
(73, 'Ethiopia', 'ET', 'ETH', '251', 'Addis Ababa', 'Africa', 'Eastern Africa', 'ETB', 'https://restcountries.eu/data/eth.svg'),
(74, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '500', 'Stanley', 'Americas', 'South America', 'FKP', 'https://restcountries.eu/data/flk.svg'),
(75, 'Faroe Islands', 'FO', 'FRO', '298', 'Tórshavn', 'Europe', 'Northern Europe', 'DKK', 'https://restcountries.eu/data/fro.svg'),
(76, 'Fiji', 'FJ', 'FJI', '679', 'Suva', 'Oceania', 'Melanesia', 'FJD', 'https://restcountries.eu/data/fji.svg'),
(77, 'Finland', 'FI', 'FIN', '358', 'Helsinki', 'Europe', 'Northern Europe', 'EUR', 'https://restcountries.eu/data/fin.svg'),
(78, 'France', 'FR', 'FRA', '33', 'Paris', 'Europe', 'Western Europe', 'EUR', 'https://restcountries.eu/data/fra.svg'),
(79, 'French Guiana', 'GF', 'GUF', '594', 'Cayenne', 'Americas', 'South America', 'EUR', 'https://restcountries.eu/data/guf.svg'),
(80, 'French Polynesia', 'PF', 'PYF', '689', 'Papeet?', 'Oceania', 'Polynesia', 'XPF', 'https://restcountries.eu/data/pyf.svg'),
(81, 'French Southern Territories', 'TF', 'ATF', '', 'Port-aux-Français', 'Africa', 'Southern Africa', 'EUR', 'https://restcountries.eu/data/atf.svg'),
(82, 'Gabon', 'GA', 'GAB', '241', 'Libreville', 'Africa', 'Middle Africa', 'XAF', 'https://restcountries.eu/data/gab.svg'),
(83, 'Gambia', 'GM', 'GMB', '220', 'Banjul', 'Africa', 'Western Africa', 'GMD', 'https://restcountries.eu/data/gmb.svg'),
(84, 'Georgia', 'GE', 'GEO', '995', 'Tbilisi', 'Asia', 'Western Asia', 'GEL', 'https://restcountries.eu/data/geo.svg'),
(85, 'Germany', 'DE', 'DEU', '49', 'Berlin', 'Europe', 'Western Europe', 'EUR', 'https://restcountries.eu/data/deu.svg'),
(86, 'Ghana', 'GH', 'GHA', '233', 'Accra', 'Africa', 'Western Africa', 'GHS', 'https://restcountries.eu/data/gha.svg'),
(87, 'Gibraltar', 'GI', 'GIB', '350', 'Gibraltar', 'Europe', 'Southern Europe', 'GIP', 'https://restcountries.eu/data/gib.svg'),
(88, 'Greece', 'GR', 'GRC', '30', 'Athens', 'Europe', 'Southern Europe', 'EUR', 'https://restcountries.eu/data/grc.svg'),
(89, 'Greenland', 'GL', 'GRL', '299', 'Nuuk', 'Americas', 'Northern America', 'DKK', 'https://restcountries.eu/data/grl.svg'),
(90, 'Grenada', 'GD', 'GRD', '1473', 'St. George\'s', 'Americas', 'Caribbean', 'XCD', 'https://restcountries.eu/data/grd.svg'),
(91, 'Guadeloupe', 'GP', 'GLP', '590', 'Basse-Terre', 'Americas', 'Caribbean', 'EUR', 'https://restcountries.eu/data/glp.svg'),
(92, 'Guam', 'GU', 'GUM', '1671', 'Hagåtña', 'Oceania', 'Micronesia', 'USD', 'https://restcountries.eu/data/gum.svg'),
(93, 'Guatemala', 'GT', 'GTM', '502', 'Guatemala City', 'Americas', 'Central America', 'GTQ', 'https://restcountries.eu/data/gtm.svg'),
(94, 'Guernsey', 'GG', 'GGY', '44', 'St. Peter Port', 'Europe', 'Northern Europe', 'GBP', 'https://restcountries.eu/data/ggy.svg'),
(95, 'Guinea', 'GN', 'GIN', '224', 'Conakry', 'Africa', 'Western Africa', 'GNF', 'https://restcountries.eu/data/gin.svg'),
(96, 'Guinea-Bissau', 'GW', 'GNB', '245', 'Bissau', 'Africa', 'Western Africa', 'XOF', 'https://restcountries.eu/data/gnb.svg'),
(97, 'Guyana', 'GY', 'GUY', '592', 'Georgetown', 'Americas', 'South America', 'GYD', 'https://restcountries.eu/data/guy.svg'),
(98, 'Haiti', 'HT', 'HTI', '509', 'Port-au-Prince', 'Americas', 'Caribbean', 'HTG', 'https://restcountries.eu/data/hti.svg'),
(99, 'Heard Island and McDonald Islands', 'HM', 'HMD', '', '', '', '', 'AUD', 'https://restcountries.eu/data/hmd.svg'),
(100, 'Holy See', 'VA', 'VAT', '379', 'Rome', 'Europe', 'Southern Europe', 'EUR', 'https://restcountries.eu/data/vat.svg'),
(101, 'Honduras', 'HN', 'HND', '504', 'Tegucigalpa', 'Americas', 'Central America', 'HNL', 'https://restcountries.eu/data/hnd.svg'),
(102, 'Hong Kong', 'HK', 'HKG', '852', 'City of Victoria', 'Asia', 'Eastern Asia', 'HKD', 'https://restcountries.eu/data/hkg.svg'),
(103, 'Hungary', 'HU', 'HUN', '36', 'Budapest', 'Europe', 'Eastern Europe', 'HUF', 'https://restcountries.eu/data/hun.svg'),
(104, 'Iceland', 'IS', 'ISL', '354', 'Reykjavík', 'Europe', 'Northern Europe', 'ISK', 'https://restcountries.eu/data/isl.svg'),
(105, 'India', 'IN', 'IND', '91', 'New Delhi', 'Asia', 'Southern Asia', 'INR', 'https://restcountries.eu/data/ind.svg'),
(106, 'Indonesia', 'ID', 'IDN', '62', 'Jakarta', 'Asia', 'South-Eastern Asia', 'IDR', 'https://restcountries.eu/data/idn.svg'),
(107, 'Côte d\'Ivoire', 'CI', 'CIV', '225', 'Yamoussoukro', 'Africa', 'Western Africa', 'XOF', 'https://restcountries.eu/data/civ.svg'),
(108, 'Iran (Islamic Republic of)', 'IR', 'IRN', '98', 'Tehran', 'Asia', 'Southern Asia', 'IRR', 'https://restcountries.eu/data/irn.svg'),
(109, 'Iraq', 'IQ', 'IRQ', '964', 'Baghdad', 'Asia', 'Western Asia', 'IQD', 'https://restcountries.eu/data/irq.svg'),
(110, 'Ireland', 'IE', 'IRL', '353', 'Dublin', 'Europe', 'Northern Europe', 'EUR', 'https://restcountries.eu/data/irl.svg'),
(111, 'Isle of Man', 'IM', 'IMN', '44', 'Douglas', 'Europe', 'Northern Europe', 'GBP', 'https://restcountries.eu/data/imn.svg'),
(112, 'Israel', 'IL', 'ISR', '972', 'Jerusalem', 'Asia', 'Western Asia', 'ILS', 'https://restcountries.eu/data/isr.svg'),
(113, 'Italy', 'IT', 'ITA', '39', 'Rome', 'Europe', 'Southern Europe', 'EUR', 'https://restcountries.eu/data/ita.svg'),
(114, 'Jamaica', 'JM', 'JAM', '1876', 'Kingston', 'Americas', 'Caribbean', 'JMD', 'https://restcountries.eu/data/jam.svg'),
(115, 'Japan', 'JP', 'JPN', '81', 'Tokyo', 'Asia', 'Eastern Asia', 'JPY', 'https://restcountries.eu/data/jpn.svg'),
(116, 'Jersey', 'JE', 'JEY', '44', 'Saint Helier', 'Europe', 'Northern Europe', 'GBP', 'https://restcountries.eu/data/jey.svg'),
(117, 'Jordan', 'JO', 'JOR', '962', 'Amman', 'Asia', 'Western Asia', 'JOD', 'https://restcountries.eu/data/jor.svg'),
(118, 'Kazakhstan', 'KZ', 'KAZ', '76', 'Astana', 'Asia', 'Central Asia', 'KZT', 'https://restcountries.eu/data/kaz.svg'),
(119, 'Kenya', 'KE', 'KEN', '254', 'Nairobi', 'Africa', 'Eastern Africa', 'KES', 'https://restcountries.eu/data/ken.svg'),
(120, 'Kiribati', 'KI', 'KIR', '686', 'South Tarawa', 'Oceania', 'Micronesia', 'AUD', 'https://restcountries.eu/data/kir.svg'),
(121, 'Kuwait', 'KW', 'KWT', '965', 'Kuwait City', 'Asia', 'Western Asia', 'KWD', 'https://restcountries.eu/data/kwt.svg'),
(122, 'Kyrgyzstan', 'KG', 'KGZ', '996', 'Bishkek', 'Asia', 'Central Asia', 'KGS', 'https://restcountries.eu/data/kgz.svg'),
(123, 'Lao People\'s Democratic Republic', 'LA', 'LAO', '856', 'Vientiane', 'Asia', 'South-Eastern Asia', 'LAK', 'https://restcountries.eu/data/lao.svg'),
(124, 'Latvia', 'LV', 'LVA', '371', 'Riga', 'Europe', 'Northern Europe', 'EUR', 'https://restcountries.eu/data/lva.svg'),
(125, 'Lebanon', 'LB', 'LBN', '961', 'Beirut', 'Asia', 'Western Asia', 'LBP', 'https://restcountries.eu/data/lbn.svg'),
(126, 'Lesotho', 'LS', 'LSO', '266', 'Maseru', 'Africa', 'Southern Africa', 'LSL', 'https://restcountries.eu/data/lso.svg'),
(127, 'Liberia', 'LR', 'LBR', '231', 'Monrovia', 'Africa', 'Western Africa', 'LRD', 'https://restcountries.eu/data/lbr.svg'),
(128, 'Libya', 'LY', 'LBY', '218', 'Tripoli', 'Africa', 'Northern Africa', 'LYD', 'https://restcountries.eu/data/lby.svg'),
(129, 'Liechtenstein', 'LI', 'LIE', '423', 'Vaduz', 'Europe', 'Western Europe', 'CHF', 'https://restcountries.eu/data/lie.svg'),
(130, 'Lithuania', 'LT', 'LTU', '370', 'Vilnius', 'Europe', 'Northern Europe', 'EUR', 'https://restcountries.eu/data/ltu.svg'),
(131, 'Luxembourg', 'LU', 'LUX', '352', 'Luxembourg', 'Europe', 'Western Europe', 'EUR', 'https://restcountries.eu/data/lux.svg'),
(132, 'Macao', 'MO', 'MAC', '853', '', 'Asia', 'Eastern Asia', 'MOP', 'https://restcountries.eu/data/mac.svg'),
(133, 'Macedonia (the former Yugoslav Republic of)', 'MK', 'MKD', '389', 'Skopje', 'Europe', 'Southern Europe', 'MKD', 'https://restcountries.eu/data/mkd.svg'),
(134, 'Madagascar', 'MG', 'MDG', '261', 'Antananarivo', 'Africa', 'Eastern Africa', 'MGA', 'https://restcountries.eu/data/mdg.svg'),
(135, 'Malawi', 'MW', 'MWI', '265', 'Lilongwe', 'Africa', 'Eastern Africa', 'MWK', 'https://restcountries.eu/data/mwi.svg'),
(136, 'Malaysia', 'MY', 'MYS', '60', 'Kuala Lumpur', 'Asia', 'South-Eastern Asia', 'MYR', 'https://restcountries.eu/data/mys.svg'),
(137, 'Maldives', 'MV', 'MDV', '960', 'Malé', 'Asia', 'Southern Asia', 'MVR', 'https://restcountries.eu/data/mdv.svg'),
(138, 'Mali', 'ML', 'MLI', '223', 'Bamako', 'Africa', 'Western Africa', 'XOF', 'https://restcountries.eu/data/mli.svg'),
(139, 'Malta', 'MT', 'MLT', '356', 'Valletta', 'Europe', 'Southern Europe', 'EUR', 'https://restcountries.eu/data/mlt.svg'),
(140, 'Marshall Islands', 'MH', 'MHL', '692', 'Majuro', 'Oceania', 'Micronesia', 'USD', 'https://restcountries.eu/data/mhl.svg'),
(141, 'Martinique', 'MQ', 'MTQ', '596', 'Fort-de-France', 'Americas', 'Caribbean', 'EUR', 'https://restcountries.eu/data/mtq.svg'),
(142, 'Mauritania', 'MR', 'MRT', '222', 'Nouakchott', 'Africa', 'Western Africa', 'MRO', 'https://restcountries.eu/data/mrt.svg'),
(143, 'Mauritius', 'MU', 'MUS', '230', 'Port Louis', 'Africa', 'Eastern Africa', 'MUR', 'https://restcountries.eu/data/mus.svg'),
(144, 'Mayotte', 'YT', 'MYT', '262', 'Mamoudzou', 'Africa', 'Eastern Africa', 'EUR', 'https://restcountries.eu/data/myt.svg'),
(145, 'Mexico', 'MX', 'MEX', '52', 'Mexico City', 'Americas', 'Central America', 'MXN', 'https://restcountries.eu/data/mex.svg'),
(146, 'Micronesia (Federated States of)', 'FM', 'FSM', '691', 'Palikir', 'Oceania', 'Micronesia', NULL, 'https://restcountries.eu/data/fsm.svg'),
(147, 'Moldova (Republic of)', 'MD', 'MDA', '373', 'Chi?in?u', 'Europe', 'Eastern Europe', 'MDL', 'https://restcountries.eu/data/mda.svg'),
(148, 'Monaco', 'MC', 'MCO', '377', 'Monaco', 'Europe', 'Western Europe', 'EUR', 'https://restcountries.eu/data/mco.svg'),
(149, 'Mongolia', 'MN', 'MNG', '976', 'Ulan Bator', 'Asia', 'Eastern Asia', 'MNT', 'https://restcountries.eu/data/mng.svg'),
(150, 'Montenegro', 'ME', 'MNE', '382', 'Podgorica', 'Europe', 'Southern Europe', 'EUR', 'https://restcountries.eu/data/mne.svg'),
(151, 'Montserrat', 'MS', 'MSR', '1664', 'Plymouth', 'Americas', 'Caribbean', 'XCD', 'https://restcountries.eu/data/msr.svg'),
(152, 'Morocco', 'MA', 'MAR', '212', 'Rabat', 'Africa', 'Northern Africa', 'MAD', 'https://restcountries.eu/data/mar.svg'),
(153, 'Mozambique', 'MZ', 'MOZ', '258', 'Maputo', 'Africa', 'Eastern Africa', 'MZN', 'https://restcountries.eu/data/moz.svg'),
(154, 'Myanmar', 'MM', 'MMR', '95', 'Naypyidaw', 'Asia', 'South-Eastern Asia', 'MMK', 'https://restcountries.eu/data/mmr.svg'),
(155, 'Namibia', 'NA', 'NAM', '264', 'Windhoek', 'Africa', 'Southern Africa', 'NAD', 'https://restcountries.eu/data/nam.svg'),
(156, 'Nauru', 'NR', 'NRU', '674', 'Yaren', 'Oceania', 'Micronesia', 'AUD', 'https://restcountries.eu/data/nru.svg'),
(157, 'Nepal', 'NP', 'NPL', '977', 'Kathmandu', 'Asia', 'Southern Asia', 'NPR', 'https://restcountries.eu/data/npl.svg'),
(158, 'Netherlands', 'NL', 'NLD', '31', 'Amsterdam', 'Europe', 'Western Europe', 'EUR', 'https://restcountries.eu/data/nld.svg'),
(159, 'New Caledonia', 'NC', 'NCL', '687', 'Nouméa', 'Oceania', 'Melanesia', 'XPF', 'https://restcountries.eu/data/ncl.svg'),
(160, 'New Zealand', 'NZ', 'NZL', '64', 'Wellington', 'Oceania', 'Australia and New Zealand', 'NZD', 'https://restcountries.eu/data/nzl.svg'),
(161, 'Nicaragua', 'NI', 'NIC', '505', 'Managua', 'Americas', 'Central America', 'NIO', 'https://restcountries.eu/data/nic.svg'),
(162, 'Niger', 'NE', 'NER', '227', 'Niamey', 'Africa', 'Western Africa', 'XOF', 'https://restcountries.eu/data/ner.svg'),
(163, 'Nigeria', 'NG', 'NGA', '234', 'Abuja', 'Africa', 'Western Africa', 'NGN', 'https://restcountries.eu/data/nga.svg'),
(164, 'Niue', 'NU', 'NIU', '683', 'Alofi', 'Oceania', 'Polynesia', 'NZD', 'https://restcountries.eu/data/niu.svg'),
(165, 'Norfolk Island', 'NF', 'NFK', '672', 'Kingston', 'Oceania', 'Australia and New Zealand', 'AUD', 'https://restcountries.eu/data/nfk.svg'),
(166, 'Korea (Democratic People\'s Republic of)', 'KP', 'PRK', '850', 'Pyongyang', 'Asia', 'Eastern Asia', 'KPW', 'https://restcountries.eu/data/prk.svg'),
(167, 'Northern Mariana Islands', 'MP', 'MNP', '1670', 'Saipan', 'Oceania', 'Micronesia', 'USD', 'https://restcountries.eu/data/mnp.svg'),
(168, 'Norway', 'NO', 'NOR', '47', 'Oslo', 'Europe', 'Northern Europe', 'NOK', 'https://restcountries.eu/data/nor.svg'),
(169, 'Oman', 'OM', 'OMN', '968', 'Muscat', 'Asia', 'Western Asia', 'OMR', 'https://restcountries.eu/data/omn.svg'),
(170, 'Pakistan', 'PK', 'PAK', '92', 'Islamabad', 'Asia', 'Southern Asia', 'PKR', 'https://restcountries.eu/data/pak.svg'),
(171, 'Palau', 'PW', 'PLW', '680', 'Ngerulmud', 'Oceania', 'Micronesia', '(none)', 'https://restcountries.eu/data/plw.svg'),
(172, 'Palestine, State of', 'PS', 'PSE', '970', 'Ramallah', 'Asia', 'Western Asia', 'ILS', 'https://restcountries.eu/data/pse.svg'),
(173, 'Panama', 'PA', 'PAN', '507', 'Panama City', 'Americas', 'Central America', 'PAB', 'https://restcountries.eu/data/pan.svg'),
(174, 'Papua New Guinea', 'PG', 'PNG', '675', 'Port Moresby', 'Oceania', 'Melanesia', 'PGK', 'https://restcountries.eu/data/png.svg'),
(175, 'Paraguay', 'PY', 'PRY', '595', 'Asunción', 'Americas', 'South America', 'PYG', 'https://restcountries.eu/data/pry.svg'),
(176, 'Peru', 'PE', 'PER', '51', 'Lima', 'Americas', 'South America', 'PEN', 'https://restcountries.eu/data/per.svg'),
(177, 'Philippines', 'PH', 'PHL', '63', 'Manila', 'Asia', 'South-Eastern Asia', 'PHP', 'https://restcountries.eu/data/phl.svg'),
(178, 'Pitcairn', 'PN', 'PCN', '64', 'Adamstown', 'Oceania', 'Polynesia', 'NZD', 'https://restcountries.eu/data/pcn.svg'),
(179, 'Poland', 'PL', 'POL', '48', 'Warsaw', 'Europe', 'Eastern Europe', 'PLN', 'https://restcountries.eu/data/pol.svg'),
(180, 'Portugal', 'PT', 'PRT', '351', 'Lisbon', 'Europe', 'Southern Europe', 'EUR', 'https://restcountries.eu/data/prt.svg'),
(181, 'Puerto Rico', 'PR', 'PRI', '1787', 'San Juan', 'Americas', 'Caribbean', 'USD', 'https://restcountries.eu/data/pri.svg'),
(182, 'Qatar', 'QA', 'QAT', '974', 'Doha', 'Asia', 'Western Asia', 'QAR', 'https://restcountries.eu/data/qat.svg'),
(183, 'Republic of Kosovo', 'XK', 'KOS', '383', 'Pristina', 'Europe', 'Eastern Europe', 'EUR', 'https://restcountries.eu/data/kos.svg'),
(184, 'Réunion', 'RE', 'REU', '262', 'Saint-Denis', 'Africa', 'Eastern Africa', 'EUR', 'https://restcountries.eu/data/reu.svg'),
(185, 'Romania', 'RO', 'ROU', '40', 'Bucharest', 'Europe', 'Eastern Europe', 'RON', 'https://restcountries.eu/data/rou.svg'),
(186, 'Russian Federation', 'RU', 'RUS', '7', 'Moscow', 'Europe', 'Eastern Europe', 'RUB', 'https://restcountries.eu/data/rus.svg'),
(187, 'Rwanda', 'RW', 'RWA', '250', 'Kigali', 'Africa', 'Eastern Africa', 'RWF', 'https://restcountries.eu/data/rwa.svg'),
(188, 'Saint Barthélemy', 'BL', 'BLM', '590', 'Gustavia', 'Americas', 'Caribbean', 'EUR', 'https://restcountries.eu/data/blm.svg'),
(189, 'Saint Helena, Ascension and Tristan da Cunha', 'SH', 'SHN', '290', 'Jamestown', 'Africa', 'Western Africa', 'SHP', 'https://restcountries.eu/data/shn.svg'),
(190, 'Saint Kitts and Nevis', 'KN', 'KNA', '1869', 'Basseterre', 'Americas', 'Caribbean', 'XCD', 'https://restcountries.eu/data/kna.svg'),
(191, 'Saint Lucia', 'LC', 'LCA', '1758', 'Castries', 'Americas', 'Caribbean', 'XCD', 'https://restcountries.eu/data/lca.svg'),
(192, 'Saint Martin (French part)', 'MF', 'MAF', '590', 'Marigot', 'Americas', 'Caribbean', 'EUR', 'https://restcountries.eu/data/maf.svg'),
(193, 'Saint Pierre and Miquelon', 'PM', 'SPM', '508', 'Saint-Pierre', 'Americas', 'Northern America', 'EUR', 'https://restcountries.eu/data/spm.svg'),
(194, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '1784', 'Kingstown', 'Americas', 'Caribbean', 'XCD', 'https://restcountries.eu/data/vct.svg'),
(195, 'Samoa', 'WS', 'WSM', '685', 'Apia', 'Oceania', 'Polynesia', 'WST', 'https://restcountries.eu/data/wsm.svg'),
(196, 'San Marino', 'SM', 'SMR', '378', 'City of San Marino', 'Europe', 'Southern Europe', 'EUR', 'https://restcountries.eu/data/smr.svg'),
(197, 'Sao Tome and Principe', 'ST', 'STP', '239', 'São Tomé', 'Africa', 'Middle Africa', 'STD', 'https://restcountries.eu/data/stp.svg'),
(198, 'Saudi Arabia', 'SA', 'SAU', '966', 'Riyadh', 'Asia', 'Western Asia', 'SAR', 'https://restcountries.eu/data/sau.svg'),
(199, 'Senegal', 'SN', 'SEN', '221', 'Dakar', 'Africa', 'Western Africa', 'XOF', 'https://restcountries.eu/data/sen.svg'),
(200, 'Serbia', 'RS', 'SRB', '381', 'Belgrade', 'Europe', 'Southern Europe', 'RSD', 'https://restcountries.eu/data/srb.svg'),
(201, 'Seychelles', 'SC', 'SYC', '248', 'Victoria', 'Africa', 'Eastern Africa', 'SCR', 'https://restcountries.eu/data/syc.svg'),
(202, 'Sierra Leone', 'SL', 'SLE', '232', 'Freetown', 'Africa', 'Western Africa', 'SLL', 'https://restcountries.eu/data/sle.svg'),
(203, 'Singapore', 'SG', 'SGP', '65', 'Singapore', 'Asia', 'South-Eastern Asia', 'BND', 'https://restcountries.eu/data/sgp.svg'),
(204, 'Sint Maarten (Dutch part)', 'SX', 'SXM', '1721', 'Philipsburg', 'Americas', 'Caribbean', 'ANG', 'https://restcountries.eu/data/sxm.svg'),
(205, 'Slovakia', 'SK', 'SVK', '421', 'Bratislava', 'Europe', 'Eastern Europe', 'EUR', 'https://restcountries.eu/data/svk.svg'),
(206, 'Slovenia', 'SI', 'SVN', '386', 'Ljubljana', 'Europe', 'Southern Europe', 'EUR', 'https://restcountries.eu/data/svn.svg'),
(207, 'Solomon Islands', 'SB', 'SLB', '677', 'Honiara', 'Oceania', 'Melanesia', 'SBD', 'https://restcountries.eu/data/slb.svg'),
(208, 'Somalia', 'SO', 'SOM', '252', 'Mogadishu', 'Africa', 'Eastern Africa', 'SOS', 'https://restcountries.eu/data/som.svg'),
(209, 'South Africa', 'ZA', 'ZAF', '27', 'Pretoria', 'Africa', 'Southern Africa', 'ZAR', 'https://restcountries.eu/data/zaf.svg'),
(210, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', '500', 'King Edward Point', 'Americas', 'South America', 'GBP', 'https://restcountries.eu/data/sgs.svg'),
(211, 'Korea (Republic of)', 'KR', 'KOR', '82', 'Seoul', 'Asia', 'Eastern Asia', 'KRW', 'https://restcountries.eu/data/kor.svg'),
(212, 'South Sudan', 'SS', 'SSD', '211', 'Juba', 'Africa', 'Middle Africa', 'SSP', 'https://restcountries.eu/data/ssd.svg'),
(213, 'Spain', 'ES', 'ESP', '34', 'Madrid', 'Europe', 'Southern Europe', 'EUR', 'https://restcountries.eu/data/esp.svg'),
(214, 'Sri Lanka', 'LK', 'LKA', '94', 'Colombo', 'Asia', 'Southern Asia', 'LKR', 'https://restcountries.eu/data/lka.svg'),
(215, 'Sudan', 'SD', 'SDN', '249', 'Khartoum', 'Africa', 'Northern Africa', 'SDG', 'https://restcountries.eu/data/sdn.svg'),
(216, 'Suriname', 'SR', 'SUR', '597', 'Paramaribo', 'Americas', 'South America', 'SRD', 'https://restcountries.eu/data/sur.svg'),
(217, 'Svalbard and Jan Mayen', 'SJ', 'SJM', '4779', 'Longyearbyen', 'Europe', 'Northern Europe', 'NOK', 'https://restcountries.eu/data/sjm.svg'),
(218, 'Swaziland', 'SZ', 'SWZ', '268', 'Lobamba', 'Africa', 'Southern Africa', 'SZL', 'https://restcountries.eu/data/swz.svg'),
(219, 'Sweden', 'SE', 'SWE', '46', 'Stockholm', 'Europe', 'Northern Europe', 'SEK', 'https://restcountries.eu/data/swe.svg'),
(220, 'Switzerland', 'CH', 'CHE', '41', 'Bern', 'Europe', 'Western Europe', 'CHF', 'https://restcountries.eu/data/che.svg'),
(221, 'Syrian Arab Republic', 'SY', 'SYR', '963', 'Damascus', 'Asia', 'Western Asia', 'SYP', 'https://restcountries.eu/data/syr.svg'),
(222, 'Taiwan', 'TW', 'TWN', '886', 'Taipei', 'Asia', 'Eastern Asia', 'TWD', 'https://restcountries.eu/data/twn.svg'),
(223, 'Tajikistan', 'TJ', 'TJK', '992', 'Dushanbe', 'Asia', 'Central Asia', 'TJS', 'https://restcountries.eu/data/tjk.svg'),
(224, 'Tanzania, United Republic of', 'TZ', 'TZA', '255', 'Dodoma', 'Africa', 'Eastern Africa', 'TZS', 'https://restcountries.eu/data/tza.svg'),
(225, 'Thailand', 'TH', 'THA', '66', 'Bangkok', 'Asia', 'South-Eastern Asia', 'THB', 'https://restcountries.eu/data/tha.svg'),
(226, 'Timor-Leste', 'TL', 'TLS', '670', 'Dili', 'Asia', 'South-Eastern Asia', 'USD', 'https://restcountries.eu/data/tls.svg'),
(227, 'Togo', 'TG', 'TGO', '228', 'Lomé', 'Africa', 'Western Africa', 'XOF', 'https://restcountries.eu/data/tgo.svg'),
(228, 'Tokelau', 'TK', 'TKL', '690', 'Fakaofo', 'Oceania', 'Polynesia', 'NZD', 'https://restcountries.eu/data/tkl.svg'),
(229, 'Tonga', 'TO', 'TON', '676', 'Nuku\'alofa', 'Oceania', 'Polynesia', 'TOP', 'https://restcountries.eu/data/ton.svg'),
(230, 'Trinidad and Tobago', 'TT', 'TTO', '1868', 'Port of Spain', 'Americas', 'Caribbean', 'TTD', 'https://restcountries.eu/data/tto.svg'),
(231, 'Tunisia', 'TN', 'TUN', '216', 'Tunis', 'Africa', 'Northern Africa', 'TND', 'https://restcountries.eu/data/tun.svg'),
(232, 'Turkey', 'TR', 'TUR', '90', 'Ankara', 'Asia', 'Western Asia', 'TRY', 'https://restcountries.eu/data/tur.svg'),
(233, 'Turkmenistan', 'TM', 'TKM', '993', 'Ashgabat', 'Asia', 'Central Asia', 'TMT', 'https://restcountries.eu/data/tkm.svg'),
(234, 'Turks and Caicos Islands', 'TC', 'TCA', '1649', 'Cockburn Town', 'Americas', 'Caribbean', 'USD', 'https://restcountries.eu/data/tca.svg'),
(235, 'Tuvalu', 'TV', 'TUV', '688', 'Funafuti', 'Oceania', 'Polynesia', 'AUD', 'https://restcountries.eu/data/tuv.svg'),
(236, 'Uganda', 'UG', 'UGA', '256', 'Kampala', 'Africa', 'Eastern Africa', 'UGX', 'https://restcountries.eu/data/uga.svg'),
(237, 'Ukraine', 'UA', 'UKR', '380', 'Kiev', 'Europe', 'Eastern Europe', 'UAH', 'https://restcountries.eu/data/ukr.svg'),
(238, 'United Arab Emirates', 'AE', 'ARE', '971', 'Abu Dhabi', 'Asia', 'Western Asia', 'AED', 'https://restcountries.eu/data/are.svg'),
(239, 'United Kingdom of Great Britain and Northern Ireland', 'GB', 'GBR', '44', 'London', 'Europe', 'Northern Europe', 'GBP', 'https://restcountries.eu/data/gbr.svg'),
(240, 'United States of America', 'US', 'USA', '1', 'Washington, D.C.', 'Americas', 'Northern America', 'USD', 'https://restcountries.eu/data/usa.svg'),
(241, 'Uruguay', 'UY', 'URY', '598', 'Montevideo', 'Americas', 'South America', 'UYU', 'https://restcountries.eu/data/ury.svg'),
(242, 'Uzbekistan', 'UZ', 'UZB', '998', 'Tashkent', 'Asia', 'Central Asia', 'UZS', 'https://restcountries.eu/data/uzb.svg'),
(243, 'Vanuatu', 'VU', 'VUT', '678', 'Port Vila', 'Oceania', 'Melanesia', 'VUV', 'https://restcountries.eu/data/vut.svg'),
(244, 'Venezuela (Bolivarian Republic of)', 'VE', 'VEN', '58', 'Caracas', 'Americas', 'South America', 'VEF', 'https://restcountries.eu/data/ven.svg'),
(245, 'Viet Nam', 'VN', 'VNM', '84', 'Hanoi', 'Asia', 'South-Eastern Asia', 'VND', 'https://restcountries.eu/data/vnm.svg'),
(246, 'Wallis and Futuna', 'WF', 'WLF', '681', 'Mata-Utu', 'Oceania', 'Polynesia', 'XPF', 'https://restcountries.eu/data/wlf.svg'),
(247, 'Western Sahara', 'EH', 'ESH', '212', 'El Aaiún', 'Africa', 'Northern Africa', 'MAD', 'https://restcountries.eu/data/esh.svg'),
(248, 'Yemen', 'YE', 'YEM', '967', 'Sana\'a', 'Asia', 'Western Asia', 'YER', 'https://restcountries.eu/data/yem.svg'),
(249, 'Zambia', 'ZM', 'ZMB', '260', 'Lusaka', 'Africa', 'Eastern Africa', 'ZMW', 'https://restcountries.eu/data/zmb.svg'),
(250, 'Zimbabwe', 'ZW', 'ZWE', '263', 'Harare', 'Africa', 'Eastern Africa', 'BWP', 'https://restcountries.eu/data/zwe.svg');

-- --------------------------------------------------------

--
-- Table structure for table `csv_list`
--

CREATE TABLE `csv_list` (
  `id` int(11) NOT NULL,
  `zone_id` int(255) NOT NULL,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `csv_list`
--

INSERT INTO `csv_list` (`id`, `zone_id`, `company_id`, `branch_id`, `user_id`, `date`) VALUES
(21, 1, 3, 1, 9, '2019-11-25'),
(22, 1, 3, 1, 9, '2019-11-25');

-- --------------------------------------------------------

--
-- Table structure for table `data_csv_report_table`
--

CREATE TABLE `data_csv_report_table` (
  `Asset_ID` varchar(50) NOT NULL,
  `Asset_Name` varchar(50) DEFAULT NULL,
  `Total_Value` varchar(50) DEFAULT NULL,
  `Depreciation` varchar(50) DEFAULT NULL,
  `NET_Value` varchar(50) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `auto_id` int(11) NOT NULL,
  `SYSTEM_GENERATED` char(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `data_csv_report_table1`
-- (See below for the actual view)
--
CREATE TABLE `data_csv_report_table1` (
`Asset_ID` varchar(50)
,`Asset_Name` varchar(50)
,`Total_Value` varchar(50)
,`Depreciation` varchar(50)
,`NET_Value` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `data_csv_report_table2`
--

CREATE TABLE `data_csv_report_table2` (
  `Asset_ID` varchar(50) DEFAULT NULL,
  `Asset_Name` varchar(50) DEFAULT NULL,
  `Total_Value` varchar(50) DEFAULT NULL,
  `Depreciation` varchar(50) DEFAULT NULL,
  `NET_Value` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_list`
--

CREATE TABLE `data_list` (
  `id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_list`
--

INSERT INTO `data_list` (`id`, `zone_id`, `company_id`, `branch_id`, `user_id`, `date`) VALUES
(65, 1, 3, 1, 9, '2019-11-29'),
(66, 2, 6, 4, 9, '2019-11-29'),
(68, 1, 4, 2, 9, '2019-11-29'),
(69, 1, 5, 3, 9, '2019-11-29');

-- --------------------------------------------------------

--
-- Table structure for table `data_table_01`
--

CREATE TABLE `data_table_01` (
  `sno` varchar(100) NOT NULL,
  `tag_id` varchar(100) NOT NULL DEFAULT '',
  `asset_id` varchar(100) DEFAULT NULL,
  `asset_name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `invoice_cost` varchar(100) DEFAULT NULL,
  `date_in_use` varchar(100) DEFAULT NULL,
  `vendor` varchar(100) DEFAULT NULL,
  `life_in_year` varchar(100) DEFAULT NULL,
  `dep_type` varchar(100) DEFAULT NULL,
  `TimeStamp` varchar(100) DEFAULT NULL,
  `is_deleted` varchar(100) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `ad_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`id`, `user_id`, `ad_id`) VALUES
(47, '18', '22'),
(50, '18', '23'),
(55, '3', '21'),
(56, '26', '22'),
(58, '28', '21'),
(59, '28', '53'),
(60, '3', '23');

-- --------------------------------------------------------

--
-- Stand-in structure for view `filter_subcategory_view`
-- (See below for the actual view)
--
CREATE TABLE `filter_subcategory_view` (
`subcat_id` int(11)
,`id` int(11)
,`title` varchar(100)
,`price` decimal(10,2)
,`address` varchar(100)
,`featured` tinyint(1)
,`picture` text
,`created_at` timestamp
,`user_id` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `report_list`
--

CREATE TABLE `report_list` (
  `id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report_list`
--

INSERT INTO `report_list` (`id`, `zone_id`, `company_id`, `branch_id`, `user_id`, `date`) VALUES
(4, 1, 3, 1, 9, '2019-11-01 01:11:00'),
(5, 1, 3, 2, 9, '2019-12-02 11:41:43'),
(6, 1, 3, 1, 9, '2019-11-19 13:04:10'),
(7, 1, 3, 1, 9, '2019-11-21 13:04:10');

-- --------------------------------------------------------

--
-- Stand-in structure for view `single_ad_fav_view`
-- (See below for the actual view)
--
CREATE TABLE `single_ad_fav_view` (
`ad_id` int(11)
,`ad_title` varchar(100)
,`ad_price` decimal(10,2)
,`ad_desc` text
,`ad_pictures` text
,`ad_address` varchar(100)
,`ad_featured` tinyint(1)
,`ad_created` timestamp
,`cat_name` varchar(100)
,`subcat_name` varchar(100)
,`user_id` int(11)
,`firebaseUserId` varchar(255)
,`user_name` varchar(100)
,`user_phone` varchar(100)
,`user_picture` varchar(100)
,`fav_ad_id` varchar(255)
,`fav_user_id` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `single_ad_view`
-- (See below for the actual view)
--
CREATE TABLE `single_ad_view` (
`ad_id` int(11)
,`ad_title` varchar(100)
,`ad_price` decimal(10,2)
,`ad_desc` text
,`ad_pictures` text
,`ad_address` varchar(100)
,`ad_featured` tinyint(1)
,`ad_created` timestamp
,`cat_name` varchar(100)
,`subcat_name` varchar(100)
,`user_id` int(11)
,`firebaseUserId` varchar(255)
,`user_name` varchar(100)
,`user_phone` varchar(100)
,`user_picture` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `picture`, `status`, `category_id`) VALUES
(1, 'Rolex', 'Rolex2.jpg', 'active', 1),
(2, 'Tag Heuer', 'Tag_Heuer1.jpg', 'active', 1),
(3, 'Rado', 'Rado1.jpg', 'active', 1),
(11, 'Omega', 'Omega.jpg', 'active', 1),
(12, 'Breitling', 'Breitling.jpg', 'active', 1),
(13, 'Patek Philippe', 'Patek_Philippe.jpg', 'active', 1),
(14, 'Tissot', 'Tissot.jpg', 'active', 1),
(16, 'Audemars Piguet', 'Audemars_Piguet.jpg', 'active', 1),
(24, 'Panerai', 'Panerai.jpg', 'active', 1),
(25, 'Piaget', 'Piaget.jpg', 'active', 1),
(26, 'A. Lange & Sohne', 'A._LangeSohne.jpg', 'active', 1);

-- --------------------------------------------------------

--
-- Table structure for table `table_csv_01`
--

CREATE TABLE `table_csv_01` (
  `csv_id_auto` int(11) NOT NULL,
  `csv_id` varchar(255) DEFAULT NULL,
  `csv_epc` varchar(255) DEFAULT NULL,
  `csv_pc` varchar(255) DEFAULT NULL,
  `csv_count` varchar(255) DEFAULT NULL,
  `csv_rssi` varchar(255) DEFAULT NULL,
  `csv_riss` varchar(255) DEFAULT NULL,
  `csv_timeStamp` varchar(255) DEFAULT NULL,
  `csv_zoneid` int(11) NOT NULL,
  `csv_companyid` int(11) NOT NULL,
  `csv_branchId` int(11) NOT NULL,
  `csv_reportid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_csv_01`
--

INSERT INTO `table_csv_01` (`csv_id_auto`, `csv_id`, `csv_epc`, `csv_pc`, `csv_count`, `csv_rssi`, `csv_riss`, `csv_timeStamp`, `csv_zoneid`, `csv_companyid`, `csv_branchId`, `csv_reportid`) VALUES
(810, '1204115', 'E28011700000020A7A6BD47C', 'ABC3033', 'VISITOR CHAIR', '4500', '4500', '2019-11-25', 1, 3, 1, 22),
(812, '1204117', 'E28011700000020A7A6BA900', 'ABC3035', 'VISITOR CHAIR', '4500', '4500', '2019-11-25', 1, 3, 1, 22),
(811, '1204116', 'E28011700000020A7A6B8550', 'ABC3034', 'VISITOR CHAIR', '4500', '4500', '2019-11-25', 1, 3, 1, 22),
(809, '1204114', 'E28011700000020A7A6AACDF', 'ABC3031', 'STAFF CHAIR', '4500', '4500', '2019-11-25', 1, 3, 1, 22),
(808, '1204113', 'E28011700000020A7A6BD467', 'ABC3030', 'STAFF CHAIR', '4500', '4500', '2019-11-25', 1, 3, 1, 22),
(807, '1204112', 'E28011700000020A7A6A9A3E', 'ABC3029', 'STAFF CHAIR', '4500', '4500', '2019-11-25', 1, 3, 1, 22),
(806, '1204111', 'E28011700000020A7A6BD47B', 'ABC3028', 'STAFF TABLE', '6500', '6500', '2019-11-25', 1, 3, 1, 22),
(805, '1204110', 'E28011700000020A7A6B7C17', 'ABC3025', 'STAFF TABLE', '6500', '6500', '2019-11-25', 1, 3, 1, 22),
(804, '1204109', 'E28011700000020A7A6B480C', 'ABC3024', 'OFFICER TABLE', '12000', '12000', '2019-11-25', 1, 3, 1, 22),
(803, '1204108', 'E28011700000020A7A6B5110', 'ABC3022', 'OFFICER TABLE', '12000', '12000', '2019-11-25', 1, 3, 1, 22),
(802, '1204107', 'E28011700000020A7A6BA8FB', 'ABC3021', 'OFFICER TABLE', '12000', '12000', '2019-11-25', 1, 3, 1, 22),
(801, '1204106', 'E28011700000020A7A6B7C5C', 'ABC3009', 'VISITOR CHAIR', '5800', '5800', '2019-11-25', 1, 3, 1, 22),
(800, '1204105', 'E28011700000020A7A6B6B90', 'ABC3008', 'VISITOR CHAIR', '5800', '5800', '2019-11-25', 1, 3, 1, 22),
(799, '1204104', 'E28011700000020A7A6B02AA', 'ABC3007', 'VISITOR CHAIR', '5800', '5800', '2019-11-25', 1, 3, 1, 22),
(798, '1204103', 'E28011700000020A7A6BD4DF', 'ABC3006', 'OFFICER CHAIR', '7000', '7000', '2019-11-25', 1, 3, 1, 22),
(797, '1204102', 'E28011700000020A7A69EC5C', 'ABC3002', 'OFFICER CHAIR', '7000', '7000', '2019-11-25', 1, 3, 1, 22),
(796, '1204101', 'E28011700000020A7A6B51B0', 'ABC3001', 'OFFICER CHAIR', '7000', '7000', '2019-11-25', 1, 3, 1, 22),
(795, '1304150', 'E28011700000020A7A6A441F', 'ABC5041', 'GENERATOR 125KVA', '1650000', '1825000', '2019-11-25', 1, 3, 1, 21),
(794, '1304149', 'E28011700000020A7A6B6ABC', 'ABC5040', 'DAWLANCE 2T OUTTER', '49000', '52000', '2019-11-25', 1, 3, 1, 21),
(793, '1304148', 'E28011700000020A7A6B6ABB', 'ABC5039', 'DAWLANCE 2T INNER', '49000', '52000', '2019-11-25', 1, 3, 1, 21),
(792, '1304147', 'E28011700000020A7A6B0289', 'ABC5038', 'DAWLANCE 2T OUTTER', '49000', '52000', '2019-11-25', 1, 3, 1, 21),
(790, '1304145', 'E28011700000020A7A6BC2CB', 'ABC5023', 'HP PRINTER 56550', '78000', '81000', '2019-11-25', 1, 3, 1, 21),
(791, '1304146', 'E28011700000020A7A6B6AD8', 'ABC5037', 'DAWLANCE 2T INNER', '49000', '52000', '2019-11-25', 1, 3, 1, 21),
(788, '1304143', 'E28011700000020A7A6B02FE', 'ABC5020', 'DELL CPU', '65000', '73500', '2019-11-25', 1, 3, 1, 21),
(789, '1304144', 'E28011700000020A7A6A3AAC', 'ABC5021', 'HP PRINTER 5958', '54000', '56500', '2019-11-25', 1, 3, 1, 21),
(787, '1304142', 'E28011700000020A7A69EC5A', 'ABC5019', 'DELL MONITER', '18200', '19000', '2019-11-25', 1, 3, 1, 21),
(784, '1304139', 'E28011700000020A7A6AACCE', 'ABC5014', 'DELL CPU', '67000', '76000', '2019-11-25', 1, 3, 1, 21),
(785, '1304140', 'E28011700000020A7A6BC27F', 'ABC5015', 'DELL MONITER', '19000', '20500', '2019-11-25', 1, 3, 1, 21),
(786, '1304141', 'E28011700000020A7A6BC29C', 'ABC5018', 'DELL CPU', '65000', '73500', '2019-11-25', 1, 3, 1, 21),
(783, '1304138', 'E28011700000020A7A6A787E', 'ABC5013', 'DELL MONITER', '19000', '20500', '2019-11-25', 1, 3, 1, 21),
(782, '1304137', 'E28011700000020A7A6A781C', 'ABC5012', 'DELL CPU', '67000', '76000', '2019-11-25', 1, 3, 1, 21),
(781, '1304136', 'E28011700000020A7A6B7C59', 'ABC5011', 'DELL MONITER', '19000', '20500', '2019-11-25', 1, 3, 1, 21),
(780, '1304135', 'E28011700000020A7A69ECFC', 'ABC5010', 'DELL CPU', '67000', '76000', '2019-11-25', 1, 3, 1, 21),
(779, '1304134', 'E28011700000020A7A6A4459', 'ABC5005', 'DELL MONITER', '19000', '20500', '2019-11-25', 1, 3, 1, 21),
(777, '1304132', 'E28011700000020A7A6BA8EC', 'ABC5004', 'COUNTING MACHINE', '157000', '162000', '2019-11-25', 1, 3, 1, 21),
(778, '1304133', 'E28011700000020A7A6B141F', 'ABC5004', 'COUNTING MACHINE', '157000', '162000', '2019-11-25', 1, 3, 1, 21),
(776, '1304131', 'E28011700000020A7A6AE0FB', 'ABC5001', 'COUNTING MACHINE', '135000', '138000', '2019-11-25', 1, 3, 1, 21),
(775, '1304130', 'E28011700000020A7A6BA809', 'ABC3058', 'CASHER CHAIR', '7800', '7800', '2019-11-25', 1, 3, 1, 21),
(774, '1304129', 'E28011700000020A7A6A188F', 'ABC3057', 'CASHER CHAIR', '7800', '7800', '2019-11-25', 1, 3, 1, 21),
(773, '1304128', 'E28011700000020A7A6A9ABB', 'ABC3056', 'CASHER CHAIR', '7800', '7800', '2019-11-25', 1, 3, 1, 21),
(772, '1304127', 'E28011700000020A7A6BA83C', 'ABC3055', 'CASHER CHAIR', '7800', '7800', '2019-11-25', 1, 3, 1, 21),
(771, '1304126', 'E28011700000020A7A6A18DB', 'ABC3054', 'CASHER CHAIR', '7800', '7800', '2019-11-25', 1, 3, 1, 21),
(769, '1304124', 'E28011700000020CFEE972E7', 'ABC3052', 'VISITOR SEAT (3)', '16000', '16000', '2019-11-25', 1, 3, 1, 21),
(770, '1304125', 'E28011700000020A7A6A9A7C', 'ABC3053', 'VISITOR SEAT (3)', '16000', '16000', '2019-11-25', 1, 3, 1, 21),
(766, '1304121', 'E28011700000020A7A6BA8EB', 'ABC3045', 'VISITOR CHAIR', '7500', '7500', '2019-11-25', 1, 3, 1, 21),
(767, '1304122', 'E28011700000020A7A6B6A79', 'ABC3046', 'MAN. SOFA', '52000', '52000', '2019-11-25', 1, 3, 1, 21),
(768, '1304123', 'E28011700000020A7A6A9AA9', 'ABC3047', 'VISITOR SEAT (3)', '16000', '16000', '2019-11-25', 1, 3, 1, 21),
(765, '1304120', 'E28011700000020A7A6AAC1F', 'ABC3044', 'VISITOR CHAIR', '7500', '7500', '2019-11-25', 1, 3, 1, 21),
(764, '1304119', 'E28011700000020A7A6B7C98', 'ABC3043', 'MAN CHAIR', '14500', '14500', '2019-11-25', 1, 3, 1, 21),
(763, '1304118', 'E28011700000020A7A6B02BC', 'ABC3041', 'MAN. TABLE', '22000', '22000', '2019-11-25', 1, 3, 1, 21),
(762, '1304117', 'E28011700000020A7A6BA900', 'ABC3035', 'VISITOR CHAIR', '4500', '4500', '2019-11-25', 1, 3, 1, 21),
(761, '1304116', 'E28011700000020A7A6B8550', 'ABC3034', 'VISITOR CHAIR', '4500', '4500', '2019-11-25', 1, 3, 1, 21),
(760, '1304115', 'E28011700000020A7A6BD47C', 'ABC3033', 'VISITOR CHAIR', '4500', '4500', '2019-11-25', 1, 3, 1, 21),
(759, '1304114', 'E28011700000020A7A6AACDF', 'ABC3031', 'STAFF CHAIR', '4500', '4500', '2019-11-25', 1, 3, 1, 21),
(758, '1304113', 'E28011700000020A7A6BD467', 'ABC3030', 'STAFF CHAIR', '4500', '4500', '2019-11-25', 1, 3, 1, 21),
(757, '1304112', 'E28011700000020A7A6A9A3E', 'ABC3029', 'STAFF CHAIR', '4500', '4500', '2019-11-25', 1, 3, 1, 21),
(756, '1304111', 'E28011700000020A7A6BD47B', 'ABC3028', 'STAFF TABLE', '6500', '6500', '2019-11-25', 1, 3, 1, 21),
(755, '1304110', 'E28011700000020A7A6B7C17', 'ABC3025', 'STAFF TABLE', '6500', '6500', '2019-11-25', 1, 3, 1, 21),
(746, '1304101', 'E28011700000020A7A6B51B0', 'ABC3001', 'OFFICER CHAIR', '7000', '7000', '2019-11-25', 1, 3, 1, 21),
(747, '1304102', 'E28011700000020A7A69EC5C', 'ABC3002', 'OFFICER CHAIR', '7000', '7000', '2019-11-25', 1, 3, 1, 21),
(748, '1304103', 'E28011700000020A7A6BD4DF', 'ABC3006', 'OFFICER CHAIR', '7000', '7000', '2019-11-25', 1, 3, 1, 21),
(749, '1304104', 'E28011700000020A7A6B02AA', 'ABC3007', 'VISITOR CHAIR', '5800', '5800', '2019-11-25', 1, 3, 1, 21),
(750, '1304105', 'E28011700000020A7A6B6B90', 'ABC3008', 'VISITOR CHAIR', '5800', '5800', '2019-11-25', 1, 3, 1, 21),
(751, '1304106', 'E28011700000020A7A6B7C5C', 'ABC3009', 'VISITOR CHAIR', '5800', '5800', '2019-11-25', 1, 3, 1, 21),
(752, '1304107', 'E28011700000020A7A6BA8FB', 'ABC3021', 'OFFICER TABLE', '12000', '12000', '2019-11-25', 1, 3, 1, 21),
(753, '1304108', 'E28011700000020A7A6B5110', 'ABC3022', 'OFFICER TABLE', '12000', '12000', '2019-11-25', 1, 3, 1, 21),
(754, '1304109', 'E28011700000020A7A6B480C', 'ABC3024', 'OFFICER TABLE', '12000', '12000', '2019-11-25', 1, 3, 1, 21),
(845, '1204150', 'E28011700000020A7A6A441F', 'ABC5041', 'GENERATOR 125KVA', '1650000', '1825000', '2019-11-25', 1, 3, 1, 22),
(844, '1204149', 'E28011700000020A7A6B6ABC', 'ABC5040', 'DAWLANCE 2T OUTTER', '49000', '52000', '2019-11-25', 1, 3, 1, 22),
(842, '1204147', 'E28011700000020A7A6B0289', 'ABC5038', 'DAWLANCE 2T OUTTER', '49000', '52000', '2019-11-25', 1, 3, 1, 22),
(843, '1204148', 'E28011700000020A7A6B6ABB', 'ABC5039', 'DAWLANCE 2T INNER', '49000', '52000', '2019-11-25', 1, 3, 1, 22),
(841, '1204146', 'E28011700000020A7A6B6AD8', 'ABC5037', 'DAWLANCE 2T INNER', '49000', '52000', '2019-11-25', 1, 3, 1, 22),
(840, '1204145', 'E28011700000020A7A6BC2CB', 'ABC5023', 'HP PRINTER 56550', '78000', '81000', '2019-11-25', 1, 3, 1, 22),
(839, '1204144', 'E28011700000020A7A6A3AAC', 'ABC5021', 'HP PRINTER 5958', '54000', '56500', '2019-11-25', 1, 3, 1, 22),
(838, '1204143', 'E28011700000020A7A6B02FE', 'ABC5020', 'DELL CPU', '65000', '73500', '2019-11-25', 1, 3, 1, 22),
(837, '1204142', 'E28011700000020A7A69EC5A', 'ABC5019', 'DELL MONITER', '18200', '19000', '2019-11-25', 1, 3, 1, 22),
(836, '1204141', 'E28011700000020A7A6BC29C', 'ABC5018', 'DELL CPU', '65000', '73500', '2019-11-25', 1, 3, 1, 22),
(835, '1204140', 'E28011700000020A7A6BC27F', 'ABC5015', 'DELL MONITER', '19000', '20500', '2019-11-25', 1, 3, 1, 22),
(834, '1204139', 'E28011700000020A7A6AACCE', 'ABC5014', 'DELL CPU', '67000', '76000', '2019-11-25', 1, 3, 1, 22),
(832, '1204137', 'E28011700000020A7A6A781C', 'ABC5012', 'DELL CPU', '67000', '76000', '2019-11-25', 1, 3, 1, 22),
(833, '1204138', 'E28011700000020A7A6A787E', 'ABC5013', 'DELL MONITER', '19000', '20500', '2019-11-25', 1, 3, 1, 22),
(831, '1204136', 'E28011700000020A7A6B7C59', 'ABC5011', 'DELL MONITER', '19000', '20500', '2019-11-25', 1, 3, 1, 22),
(830, '1204135', 'E28011700000020A7A69ECFC', 'ABC5010', 'DELL CPU', '67000', '76000', '2019-11-25', 1, 3, 1, 22),
(829, '1204134', 'E28011700000020A7A6A4459', 'ABC5005', 'DELL MONITER', '19000', '20500', '2019-11-25', 1, 3, 1, 22),
(827, '1204132', 'E28011700000020A7A6BA8EC', 'ABC5004', 'COUNTING MACHINE', '157000', '162000', '2019-11-25', 1, 3, 1, 22),
(828, '1204133', 'E28011700000020A7A6B141F', 'ABC5004', 'COUNTING MACHINE', '157000', '162000', '2019-11-25', 1, 3, 1, 22),
(826, '1204131', 'E28011700000020A7A6AE0FB', 'ABC5001', 'COUNTING MACHINE', '135000', '138000', '2019-11-25', 1, 3, 1, 22),
(825, '1204130', 'E28011700000020A7A6BA809', 'ABC3058', 'CASHER CHAIR', '7800', '7800', '2019-11-25', 1, 3, 1, 22),
(824, '1204129', 'E28011700000020A7A6A188F', 'ABC3057', 'CASHER CHAIR', '7800', '7800', '2019-11-25', 1, 3, 1, 22),
(823, '1204128', 'E28011700000020A7A6A9ABB', 'ABC3056', 'CASHER CHAIR', '7800', '7800', '2019-11-25', 1, 3, 1, 22),
(822, '1204127', 'E28011700000020A7A6BA83C', 'ABC3055', 'CASHER CHAIR', '7800', '7800', '2019-11-25', 1, 3, 1, 22),
(820, '1204125', 'E28011700000020A7A6A9A7C', 'ABC3053', 'VISITOR SEAT (3)', '16000', '16000', '2019-11-25', 1, 3, 1, 22),
(821, '1204126', 'E28011700000020A7A6A18DB', 'ABC3054', 'CASHER CHAIR', '7800', '7800', '2019-11-25', 1, 3, 1, 22),
(819, '1204124', 'E28011700000020CFEE972E7', 'ABC3052', 'VISITOR SEAT (3)', '16000', '16000', '2019-11-25', 1, 3, 1, 22),
(818, '1204123', 'E28011700000020A7A6A9AA9', 'ABC3047', 'VISITOR SEAT (3)', '16000', '16000', '2019-11-25', 1, 3, 1, 22),
(817, '1204122', 'E28011700000020A7A6B6A79', 'ABC3046', 'MAN. SOFA', '52000', '52000', '2019-11-25', 1, 3, 1, 22),
(816, '1204121', 'E28011700000020A7A6BA8EB', 'ABC3045', 'VISITOR CHAIR', '7500', '7500', '2019-11-25', 1, 3, 1, 22),
(815, '1204120', 'E28011700000020A7A6AAC1F', 'ABC3044', 'VISITOR CHAIR', '7500', '7500', '2019-11-25', 1, 3, 1, 22),
(814, '1204119', 'E28011700000020A7A6B7C98', 'ABC3043', 'MAN CHAIR', '14500', '14500', '2019-11-25', 1, 3, 1, 22),
(813, '1204118', 'E28011700000020A7A6B02BC', 'ABC3041', 'MAN. TABLE', '22000', '22000', '2019-11-25', 1, 3, 1, 22);

-- --------------------------------------------------------

--
-- Table structure for table `table_data_01`
--

CREATE TABLE `table_data_01` (
  `data_id_auto` int(11) NOT NULL,
  `data_sNo` varchar(255) DEFAULT NULL,
  `data_tagId` varchar(255) DEFAULT NULL,
  `data_assetId` varchar(255) DEFAULT NULL,
  `data_assetName` varchar(255) DEFAULT NULL,
  `data_innoiceCost` varchar(255) DEFAULT NULL,
  `data_totalCost` varchar(255) DEFAULT NULL,
  `data_dateInUse` varchar(255) DEFAULT NULL,
  `data_vendor` varchar(255) DEFAULT NULL,
  `data_lifeInYear` varchar(255) DEFAULT NULL,
  `data_depType` varchar(255) DEFAULT NULL,
  `data_timeStamp` varchar(255) DEFAULT NULL,
  `data_netValue` varchar(255) DEFAULT NULL,
  `remaning_years` varchar(255) DEFAULT NULL,
  `LOCATION` varchar(255) DEFAULT NULL,
  `BR_CODE` varchar(255) DEFAULT NULL,
  `data_zoneid` int(11) NOT NULL,
  `data_companyid` int(11) NOT NULL,
  `data_branchId` int(11) NOT NULL,
  `data_reportid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_data_01`
--

INSERT INTO `table_data_01` (`data_id_auto`, `data_sNo`, `data_tagId`, `data_assetId`, `data_assetName`, `data_innoiceCost`, `data_totalCost`, `data_dateInUse`, `data_vendor`, `data_lifeInYear`, `data_depType`, `data_timeStamp`, `data_netValue`, `remaning_years`, `LOCATION`, `BR_CODE`, `data_zoneid`, `data_companyid`, `data_branchId`, `data_reportid`) VALUES
(1169, '7004145', 'E28011700000020A7A6BD4EF', 'ABC5040', 'DAWLANCE 2T OUTTER', '49000', '52000', '42665', 'MAMJI', '5', 'STRAIGHT', '2019-11-29', '52000', '5', 'STRAIGHT', '52000', 1, 5, 3, 69),
(1168, '7004144', 'E28011700000020A7A6B51C0', 'ABC5039', 'DAWLANCE 2T INNER', '49000', '52000', '42665', 'MAMJI', '5', 'STRAIGHT', '2019-11-29', '52000', '5', 'STRAIGHT', '52000', 1, 5, 3, 69),
(1167, '7004143', 'E28011700000020A7A6B7C2F', 'ABC5038', 'DAWLANCE 2T OUTTER', '49000', '52000', '42665', 'MAMJI', '5', 'STRAIGHT', '2019-11-29', '52000', '5', 'STRAIGHT', '52000', 1, 5, 3, 69),
(1166, '7004142', 'E28011700000020A7A6BD48C', 'ABC5037', 'DAWLANCE 2T INNER', '49000', '52000', '42665', 'MAMJI', '5', 'STRAIGHT', '2019-11-29', '52000', '5', 'STRAIGHT', '52000', 1, 5, 3, 69),
(1165, '7004141', 'E28011700000020A7A6A9ADE', 'ABC5023', 'HP PRINTER 56550', '78000', '81000', '43307', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '81000', '5', 'DOUBLE DEP', '81000', 1, 5, 3, 69),
(1164, '7004140', 'E28011700000020A7A6B7C4C', 'ABC5021', 'HP PRINTER 5958', '54000', '56500', '43307', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '56500', '5', 'DOUBLE DEP', '56500', 1, 5, 3, 69),
(1163, '7004139', 'E28011700000020A7A6A9A6F', 'ABC5020', 'DELL CPU', '65000', '73500', '43508', 'COMPUTER ONE', '5', 'DOUBLE DEP', '2019-11-29', '73500', '5', 'DOUBLE DEP', '73500', 1, 5, 3, 69),
(1162, '7004138', 'E28011700000020A7A6BDD30', 'ABC5019', 'DELL MONITER', '18200', '19000', '43508', 'COMPUTER ONE', '5', 'DOUBLE DEP', '2019-11-29', '19000', '5', 'DOUBLE DEP', '19000', 1, 5, 3, 69),
(1161, '7004137', 'E28011700000020A7A6BC3A0', 'ABC5018', 'DELL CPU', '65000', '73500', '43508', 'COMPUTER ONE', '5', 'DOUBLE DEP', '2019-11-29', '73500', '5', 'DOUBLE DEP', '73500', 1, 5, 3, 69),
(1160, '7004136', 'E28011700000020A7A6BD41F', 'ABC5015', 'DELL MONITER', '19000', '20500', '43244', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '20500', '5', 'DOUBLE DEP', '20500', 1, 5, 3, 69),
(1159, '7004135', 'E28011700000020A7A6BC390', 'ABC5014', 'DELL CPU', '67000', '76000', '43244', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '76000', '5', 'DOUBLE DEP', '76000', 1, 5, 3, 69),
(1158, '7004134', 'E28011700000020A7A6BD42F', 'ABC5013', 'DELL MONITER', '19000', '20500', '43244', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '20500', '5', 'DOUBLE DEP', '20500', 1, 5, 3, 69),
(1157, '7004133', 'E28011700000020A7A6B140F', 'ABC5012', 'DELL CPU', '67000', '76000', '43244', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '76000', '5', 'DOUBLE DEP', '76000', 1, 5, 3, 69),
(1156, '7004132', 'E28011700000020A7A6A3A3F', 'ABC5011', 'DELL MONITER', '19000', '20500', '43244', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '20500', '5', 'DOUBLE DEP', '20500', 1, 5, 3, 69),
(1155, '7004131', 'E28011700000020A7A6B7C9B', 'ABC5004', 'COUNTING MACHINE', '157000', '162000', '43487', 'ZEBRA', '5', 'DOUBLE DEP', '2019-11-29', '162000', '5', 'DOUBLE DEP', '162000', 1, 5, 3, 69),
(1154, '7004130', 'E28011700000020A7A6B6A4F', 'ABC5001', 'COUNTING MACHINE', '135000', '138000', '42075', 'FINTECH', '5', 'DOUBLE DEP', '2019-11-29', '138000', '5', 'DOUBLE DEP', '138000', 1, 5, 3, 69),
(1153, '7004129', 'E28011700000020A7A6B024F', 'ABC3058', 'CASHER CHAIR', '7800', '7800', '42060', 'VISION NEXT', '6', 'STRAIGHT', '2019-11-29', '7800', '6', 'STRAIGHT', '7800', 1, 5, 3, 69),
(1152, '7004128', 'E28011700000020A7A6AE9E0', 'ABC3056', 'CASHER CHAIR', '7800', '7800', '42060', 'VISION NEXT', '6', 'STRAIGHT', '2019-11-29', '7800', '6', 'STRAIGHT', '7800', 1, 5, 3, 69),
(1151, '7004127', 'E28011700000020A7A6A44BF', 'ABC3055', 'CASHER CHAIR', '7800', '7800', '42060', 'VISION NEXT', '6', 'STRAIGHT', '2019-11-29', '7800', '6', 'STRAIGHT', '7800', 1, 5, 3, 69),
(1150, '7004126', 'E28011700000020A7A6A789F', 'ABC3054', 'CASHER CHAIR', '7800', '7800', '42060', 'VISION NEXT', '6', 'STRAIGHT', '2019-11-29', '7800', '6', 'STRAIGHT', '7800', 1, 5, 3, 69),
(1149, '7004125', 'E28011700000020A7A6AAC0F', 'ABC3053', 'VISITOR SEAT (3)', '16000', '16000', '42060', 'VISION NEXT', '10', 'STRAIGHT', '2019-11-29', '16000', '10', 'STRAIGHT', '16000', 1, 5, 3, 69),
(1148, '7004124', 'E28011700000020A7A6BA9D0', 'ABC3052', 'VISITOR SEAT (3)', '16000', '16000', '42060', 'VISION NEXT', '10', 'STRAIGHT', '2019-11-29', '16000', '10', 'STRAIGHT', '16000', 1, 5, 3, 69),
(1147, '7004123', 'E28011700000020A7A6AAC6C', 'ABC3047', 'VISITOR SEAT (3)', '16000', '16000', '42060', 'VISION NEXT', '10', 'STRAIGHT', '2019-11-29', '16000', '10', 'STRAIGHT', '16000', 1, 5, 3, 69),
(1146, '7004122', 'E28011700000020A7A6B489F', 'ABC3046', 'MAN. SOFA', '52000', '52000', '43175', 'DIAMENSION', '4', 'STRAIGHT', '2019-11-29', '52000', '4', 'STRAIGHT', '52000', 1, 5, 3, 69),
(1145, '7004121', 'E28011700000020A7A6B6BA0', 'ABC3045', 'VISITOR CHAIR', '7500', '7500', '43175', 'DIAMENSION', '4', 'STRAIGHT', '2019-11-29', '7500', '4', 'STRAIGHT', '7500', 1, 5, 3, 69),
(1144, '7004120', 'E28011700000020A7A6B6AAC', 'ABC3044', 'VISITOR CHAIR', '7500', '7500', '43175', 'DIAMENSION', '4', 'STRAIGHT', '2019-11-29', '7500', '4', 'STRAIGHT', '7500', 1, 5, 3, 69),
(1143, '7004119', 'E28011700000020A7A6B14FF', 'ABC3043', 'MAN CHAIR', '14500', '14500', '43175', 'DIAMENSION', '4', 'STRAIGHT', '2019-11-29', '14500', '4', 'STRAIGHT', '14500', 1, 5, 3, 69),
(1142, '7004118', 'E28011700000020A7A6A788F', 'ABC3041', 'MAN. TABLE', '22000', '22000', '43175', 'DIAMENSION', '4', 'STRAIGHT', '2019-11-29', '22000', '4', 'STRAIGHT', '22000', 1, 5, 3, 69),
(1141, '7004117', 'E28011700000020A7A6AE0BF', 'ABC3035', 'VISITOR CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 1, 5, 3, 69),
(1140, '7004116', 'E28011700000020A7A6BA83B', 'ABC3034', 'VISITOR CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 1, 5, 3, 69),
(1139, '7004115', 'E28011700000020A7A6A782A', 'ABC3033', 'VISITOR CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 1, 5, 3, 69),
(1138, '7004114', 'E28011700000020A7A6BA8FC', 'ABC3031', 'STAFF CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 1, 5, 3, 69),
(1137, '7004113', 'E28011700000020A7A6B0B80', 'ABC3030', 'STAFF CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 1, 5, 3, 69),
(1136, '7004112', 'E28011700000020A7A6AACCF', 'ABC3029', 'STAFF CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 1, 5, 3, 69),
(1135, '7004111', 'E28011700000020A7A6B025F', 'ABC3028', 'STAFF TABLE', '6500', '6500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '6500', '10', 'STRAIGHT', '6500', 1, 5, 3, 69),
(1134, '7004110', 'E28011700000020A7A6BA9E0', 'ABC3025', 'STAFF TABLE', '6500', '6500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '6500', '10', 'STRAIGHT', '6500', 1, 5, 3, 69),
(1133, '7004109', 'E28011700000020A7A6B7C3F', 'ABC3024', 'OFFICER TABLE', '12000', '12000', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '12000', '7', 'DOUBLE DEP', '12000', 1, 5, 3, 69),
(1132, '7004108', 'E28011700000020A7A6B488F', 'ABC3022', 'OFFICER TABLE', '12000', '12000', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '12000', '7', 'DOUBLE DEP', '12000', 1, 5, 3, 69),
(1131, '7004107', 'E28011700000020A7A6B85F0', 'ABC3021', 'OFFICER TABLE', '12000', '12000', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '12000', '7', 'DOUBLE DEP', '12000', 1, 5, 3, 69),
(1130, '7004106', 'E28011700000020A7A6B5120', 'ABC3009', 'VISITOR CHAIR', '5800', '5800', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '5800', '7', 'DOUBLE DEP', '5800', 1, 5, 3, 69),
(1129, '7004105', 'E28011700000020A7A6B48EC', 'ABC3008', 'VISITOR CHAIR', '5800', '5800', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '5800', '7', 'DOUBLE DEP', '5800', 1, 5, 3, 69),
(1128, '7004104', 'E28011700000020A7A6BA8AF', 'ABC3007', 'VISITOR CHAIR', '5800', '5800', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '5800', '7', 'DOUBLE DEP', '5800', 1, 5, 3, 69),
(1127, '7004103', 'E28011700000020A7A6B6A5F', 'ABC3006', 'OFFICER CHAIR', '7000', '7000', '42917', 'VISION NEXT', '4', 'DOUBLE DEP', '2019-11-29', '7000', '4', 'DOUBLE DEP', '7000', 1, 5, 3, 69),
(1126, '7004102', 'E28011700000020A7A6B029B', 'ABC3002', 'OFFICER CHAIR', '7000', '7000', '42917', 'VISION NEXT', '4', 'DOUBLE DEP', '2019-11-29', '7000', '4', 'DOUBLE DEP', '7000', 1, 5, 3, 69),
(1125, '7004101', 'E28011700000020A7A6B8560', 'ABC3001', 'OFFICER CHAIR', '7000', '7000', '42917', 'VISION NEXT', '4', 'DOUBLE DEP', '2019-11-29', '7000', '4', 'DOUBLE DEP', '7000', 1, 5, 3, 69),
(1123, '8004144', 'E28011700000020A7A6B51C0', 'ABC5039', 'DAWLANCE 2T INNER', '49000', '52000', '42665', 'MAMJI', '5', 'STRAIGHT', '2019-11-29', '52000', '5', 'STRAIGHT', '52000', 1, 4, 2, 68),
(1124, '8004145', 'E28011700000020A7A6BD4EF', 'ABC5040', 'DAWLANCE 2T OUTTER', '49000', '52000', '42665', 'MAMJI', '5', 'STRAIGHT', '2019-11-29', '52000', '5', 'STRAIGHT', '52000', 1, 4, 2, 68),
(1122, '8004143', 'E28011700000020A7A6B7C2F', 'ABC5038', 'DAWLANCE 2T OUTTER', '49000', '52000', '42665', 'MAMJI', '5', 'STRAIGHT', '2019-11-29', '52000', '5', 'STRAIGHT', '52000', 1, 4, 2, 68),
(1121, '8004142', 'E28011700000020A7A6BD48C', 'ABC5037', 'DAWLANCE 2T INNER', '49000', '52000', '42665', 'MAMJI', '5', 'STRAIGHT', '2019-11-29', '52000', '5', 'STRAIGHT', '52000', 1, 4, 2, 68),
(1119, '8004140', 'E28011700000020A7A6B7C4C', 'ABC5021', 'HP PRINTER 5958', '54000', '56500', '43307', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '56500', '5', 'DOUBLE DEP', '56500', 1, 4, 2, 68),
(1120, '8004141', 'E28011700000020A7A6A9ADE', 'ABC5023', 'HP PRINTER 56550', '78000', '81000', '43307', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '81000', '5', 'DOUBLE DEP', '81000', 1, 4, 2, 68),
(1118, '8004139', 'E28011700000020A7A6A9A6F', 'ABC5020', 'DELL CPU', '65000', '73500', '43508', 'COMPUTER ONE', '5', 'DOUBLE DEP', '2019-11-29', '73500', '5', 'DOUBLE DEP', '73500', 1, 4, 2, 68),
(1117, '8004138', 'E28011700000020A7A6BDD30', 'ABC5019', 'DELL MONITER', '18200', '19000', '43508', 'COMPUTER ONE', '5', 'DOUBLE DEP', '2019-11-29', '19000', '5', 'DOUBLE DEP', '19000', 1, 4, 2, 68),
(1116, '8004137', 'E28011700000020A7A6BC3A0', 'ABC5018', 'DELL CPU', '65000', '73500', '43508', 'COMPUTER ONE', '5', 'DOUBLE DEP', '2019-11-29', '73500', '5', 'DOUBLE DEP', '73500', 1, 4, 2, 68),
(1114, '8004135', 'E28011700000020A7A6BC390', 'ABC5014', 'DELL CPU', '67000', '76000', '43244', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '76000', '5', 'DOUBLE DEP', '76000', 1, 4, 2, 68),
(1115, '8004136', 'E28011700000020A7A6BD41F', 'ABC5015', 'DELL MONITER', '19000', '20500', '43244', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '20500', '5', 'DOUBLE DEP', '20500', 1, 4, 2, 68),
(1113, '8004134', 'E28011700000020A7A6BD42F', 'ABC5013', 'DELL MONITER', '19000', '20500', '43244', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '20500', '5', 'DOUBLE DEP', '20500', 1, 4, 2, 68),
(1112, '8004133', 'E28011700000020A7A6B140F', 'ABC5012', 'DELL CPU', '67000', '76000', '43244', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '76000', '5', 'DOUBLE DEP', '76000', 1, 4, 2, 68),
(1111, '8004132', 'E28011700000020A7A6A3A3F', 'ABC5011', 'DELL MONITER', '19000', '20500', '43244', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '20500', '5', 'DOUBLE DEP', '20500', 1, 4, 2, 68),
(1109, '8004130', 'E28011700000020A7A6B6A4F', 'ABC5001', 'COUNTING MACHINE', '135000', '138000', '42075', 'FINTECH', '5', 'DOUBLE DEP', '2019-11-29', '138000', '5', 'DOUBLE DEP', '138000', 1, 4, 2, 68),
(1110, '8004131', 'E28011700000020A7A6B7C9B', 'ABC5004', 'COUNTING MACHINE', '157000', '162000', '43487', 'ZEBRA', '5', 'DOUBLE DEP', '2019-11-29', '162000', '5', 'DOUBLE DEP', '162000', 1, 4, 2, 68),
(1108, '8004129', 'E28011700000020A7A6B024F', 'ABC3058', 'CASHER CHAIR', '7800', '7800', '42060', 'VISION NEXT', '6', 'STRAIGHT', '2019-11-29', '7800', '6', 'STRAIGHT', '7800', 1, 4, 2, 68),
(1107, '8004128', 'E28011700000020A7A6AE9E0', 'ABC3056', 'CASHER CHAIR', '7800', '7800', '42060', 'VISION NEXT', '6', 'STRAIGHT', '2019-11-29', '7800', '6', 'STRAIGHT', '7800', 1, 4, 2, 68),
(1106, '8004127', 'E28011700000020A7A6A44BF', 'ABC3055', 'CASHER CHAIR', '7800', '7800', '42060', 'VISION NEXT', '6', 'STRAIGHT', '2019-11-29', '7800', '6', 'STRAIGHT', '7800', 1, 4, 2, 68),
(1105, '8004126', 'E28011700000020A7A6A789F', 'ABC3054', 'CASHER CHAIR', '7800', '7800', '42060', 'VISION NEXT', '6', 'STRAIGHT', '2019-11-29', '7800', '6', 'STRAIGHT', '7800', 1, 4, 2, 68),
(1103, '8004124', 'E28011700000020A7A6BA9D0', 'ABC3052', 'VISITOR SEAT (3)', '16000', '16000', '42060', 'VISION NEXT', '10', 'STRAIGHT', '2019-11-29', '16000', '10', 'STRAIGHT', '16000', 1, 4, 2, 68),
(1104, '8004125', 'E28011700000020A7A6AAC0F', 'ABC3053', 'VISITOR SEAT (3)', '16000', '16000', '42060', 'VISION NEXT', '10', 'STRAIGHT', '2019-11-29', '16000', '10', 'STRAIGHT', '16000', 1, 4, 2, 68),
(1102, '8004123', 'E28011700000020A7A6AAC6C', 'ABC3047', 'VISITOR SEAT (3)', '16000', '16000', '42060', 'VISION NEXT', '10', 'STRAIGHT', '2019-11-29', '16000', '10', 'STRAIGHT', '16000', 1, 4, 2, 68),
(1101, '8004122', 'E28011700000020A7A6B489F', 'ABC3046', 'MAN. SOFA', '52000', '52000', '43175', 'DIAMENSION', '4', 'STRAIGHT', '2019-11-29', '52000', '4', 'STRAIGHT', '52000', 1, 4, 2, 68),
(1100, '8004121', 'E28011700000020A7A6B6BA0', 'ABC3045', 'VISITOR CHAIR', '7500', '7500', '43175', 'DIAMENSION', '4', 'STRAIGHT', '2019-11-29', '7500', '4', 'STRAIGHT', '7500', 1, 4, 2, 68),
(1099, '8004120', 'E28011700000020A7A6B6AAC', 'ABC3044', 'VISITOR CHAIR', '7500', '7500', '43175', 'DIAMENSION', '4', 'STRAIGHT', '2019-11-29', '7500', '4', 'STRAIGHT', '7500', 1, 4, 2, 68),
(1098, '8004119', 'E28011700000020A7A6B14FF', 'ABC3043', 'MAN CHAIR', '14500', '14500', '43175', 'DIAMENSION', '4', 'STRAIGHT', '2019-11-29', '14500', '4', 'STRAIGHT', '14500', 1, 4, 2, 68),
(1097, '8004118', 'E28011700000020A7A6A788F', 'ABC3041', 'MAN. TABLE', '22000', '22000', '43175', 'DIAMENSION', '4', 'STRAIGHT', '2019-11-29', '22000', '4', 'STRAIGHT', '22000', 1, 4, 2, 68),
(1096, '8004117', 'E28011700000020A7A6AE0BF', 'ABC3035', 'VISITOR CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 1, 4, 2, 68),
(1094, '8004115', 'E28011700000020A7A6A782A', 'ABC3033', 'VISITOR CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 1, 4, 2, 68),
(1095, '8004116', 'E28011700000020A7A6BA83B', 'ABC3034', 'VISITOR CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 1, 4, 2, 68),
(1093, '8004114', 'E28011700000020A7A6BA8FC', 'ABC3031', 'STAFF CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 1, 4, 2, 68),
(1092, '8004113', 'E28011700000020A7A6B0B80', 'ABC3030', 'STAFF CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 1, 4, 2, 68),
(1090, '8004111', 'E28011700000020A7A6B025F', 'ABC3028', 'STAFF TABLE', '6500', '6500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '6500', '10', 'STRAIGHT', '6500', 1, 4, 2, 68),
(1091, '8004112', 'E28011700000020A7A6AACCF', 'ABC3029', 'STAFF CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 1, 4, 2, 68),
(1089, '8004110', 'E28011700000020A7A6BA9E0', 'ABC3025', 'STAFF TABLE', '6500', '6500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '6500', '10', 'STRAIGHT', '6500', 1, 4, 2, 68),
(1087, '8004108', 'E28011700000020A7A6B488F', 'ABC3022', 'OFFICER TABLE', '12000', '12000', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '12000', '7', 'DOUBLE DEP', '12000', 1, 4, 2, 68),
(1088, '8004109', 'E28011700000020A7A6B7C3F', 'ABC3024', 'OFFICER TABLE', '12000', '12000', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '12000', '7', 'DOUBLE DEP', '12000', 1, 4, 2, 68),
(1086, '8004107', 'E28011700000020A7A6B85F0', 'ABC3021', 'OFFICER TABLE', '12000', '12000', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '12000', '7', 'DOUBLE DEP', '12000', 1, 4, 2, 68),
(1084, '8004105', 'E28011700000020A7A6B48EC', 'ABC3008', 'VISITOR CHAIR', '5800', '5800', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '5800', '7', 'DOUBLE DEP', '5800', 1, 4, 2, 68),
(1085, '8004106', 'E28011700000020A7A6B5120', 'ABC3009', 'VISITOR CHAIR', '5800', '5800', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '5800', '7', 'DOUBLE DEP', '5800', 1, 4, 2, 68),
(1083, '8004104', 'E28011700000020A7A6BA8AF', 'ABC3007', 'VISITOR CHAIR', '5800', '5800', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '5800', '7', 'DOUBLE DEP', '5800', 1, 4, 2, 68),
(1081, '8004102', 'E28011700000020A7A6B029B', 'ABC3002', 'OFFICER CHAIR', '7000', '7000', '42917', 'VISION NEXT', '4', 'DOUBLE DEP', '2019-11-29', '7000', '4', 'DOUBLE DEP', '7000', 1, 4, 2, 68),
(1082, '8004103', 'E28011700000020A7A6B6A5F', 'ABC3006', 'OFFICER CHAIR', '7000', '7000', '42917', 'VISION NEXT', '4', 'DOUBLE DEP', '2019-11-29', '7000', '4', 'DOUBLE DEP', '7000', 1, 4, 2, 68),
(1080, '8004101', 'E28011700000020A7A6B8560', 'ABC3001', 'OFFICER CHAIR', '7000', '7000', '42917', 'VISION NEXT', '4', 'DOUBLE DEP', '2019-11-29', '7000', '4', 'DOUBLE DEP', '7000', 1, 4, 2, 68),
(1034, '7004145', 'E28011700000020A7A6BD4EF', 'ABC5040', 'DAWLANCE 2T OUTTER', '49000', '52000', '42665', 'MAMJI', '5', 'STRAIGHT', '2019-11-29', '52000', '5', 'STRAIGHT', '52000', 2, 6, 4, 66),
(1032, '7004143', 'E28011700000020A7A6B7C2F', 'ABC5038', 'DAWLANCE 2T OUTTER', '49000', '52000', '42665', 'MAMJI', '5', 'STRAIGHT', '2019-11-29', '52000', '5', 'STRAIGHT', '52000', 2, 6, 4, 66),
(1033, '7004144', 'E28011700000020A7A6B51C0', 'ABC5039', 'DAWLANCE 2T INNER', '49000', '52000', '42665', 'MAMJI', '5', 'STRAIGHT', '2019-11-29', '52000', '5', 'STRAIGHT', '52000', 2, 6, 4, 66),
(1031, '7004142', 'E28011700000020A7A6BD48C', 'ABC5037', 'DAWLANCE 2T INNER', '49000', '52000', '42665', 'MAMJI', '5', 'STRAIGHT', '2019-11-29', '52000', '5', 'STRAIGHT', '52000', 2, 6, 4, 66),
(1030, '7004141', 'E28011700000020A7A6A9ADE', 'ABC5023', 'HP PRINTER 56550', '78000', '81000', '43307', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '81000', '5', 'DOUBLE DEP', '81000', 2, 6, 4, 66),
(1028, '7004139', 'E28011700000020A7A6A9A6F', 'ABC5020', 'DELL CPU', '65000', '73500', '43508', 'COMPUTER ONE', '5', 'DOUBLE DEP', '2019-11-29', '73500', '5', 'DOUBLE DEP', '73500', 2, 6, 4, 66),
(1029, '7004140', 'E28011700000020A7A6B7C4C', 'ABC5021', 'HP PRINTER 5958', '54000', '56500', '43307', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '56500', '5', 'DOUBLE DEP', '56500', 2, 6, 4, 66),
(1027, '7004138', 'E28011700000020A7A6BDD30', 'ABC5019', 'DELL MONITER', '18200', '19000', '43508', 'COMPUTER ONE', '5', 'DOUBLE DEP', '2019-11-29', '19000', '5', 'DOUBLE DEP', '19000', 2, 6, 4, 66),
(1026, '7004137', 'E28011700000020A7A6BC3A0', 'ABC5018', 'DELL CPU', '65000', '73500', '43508', 'COMPUTER ONE', '5', 'DOUBLE DEP', '2019-11-29', '73500', '5', 'DOUBLE DEP', '73500', 2, 6, 4, 66),
(1024, '7004135', 'E28011700000020A7A6BC390', 'ABC5014', 'DELL CPU', '67000', '76000', '43244', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '76000', '5', 'DOUBLE DEP', '76000', 2, 6, 4, 66),
(1025, '7004136', 'E28011700000020A7A6BD41F', 'ABC5015', 'DELL MONITER', '19000', '20500', '43244', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '20500', '5', 'DOUBLE DEP', '20500', 2, 6, 4, 66),
(1023, '7004134', 'E28011700000020A7A6BD42F', 'ABC5013', 'DELL MONITER', '19000', '20500', '43244', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '20500', '5', 'DOUBLE DEP', '20500', 2, 6, 4, 66),
(1022, '7004133', 'E28011700000020A7A6B140F', 'ABC5012', 'DELL CPU', '67000', '76000', '43244', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '76000', '5', 'DOUBLE DEP', '76000', 2, 6, 4, 66),
(1020, '7004131', 'E28011700000020A7A6B7C9B', 'ABC5004', 'COUNTING MACHINE', '157000', '162000', '43487', 'ZEBRA', '5', 'DOUBLE DEP', '2019-11-29', '162000', '5', 'DOUBLE DEP', '162000', 2, 6, 4, 66),
(1021, '7004132', 'E28011700000020A7A6A3A3F', 'ABC5011', 'DELL MONITER', '19000', '20500', '43244', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '20500', '5', 'DOUBLE DEP', '20500', 2, 6, 4, 66),
(1019, '7004130', 'E28011700000020A7A6B6A4F', 'ABC5001', 'COUNTING MACHINE', '135000', '138000', '42075', 'FINTECH', '5', 'DOUBLE DEP', '2019-11-29', '138000', '5', 'DOUBLE DEP', '138000', 2, 6, 4, 66),
(1017, '7004128', 'E28011700000020A7A6AE9E0', 'ABC3056', 'CASHER CHAIR', '7800', '7800', '42060', 'VISION NEXT', '6', 'STRAIGHT', '2019-11-29', '7800', '6', 'STRAIGHT', '7800', 2, 6, 4, 66),
(1018, '7004129', 'E28011700000020A7A6B024F', 'ABC3058', 'CASHER CHAIR', '7800', '7800', '42060', 'VISION NEXT', '6', 'STRAIGHT', '2019-11-29', '7800', '6', 'STRAIGHT', '7800', 2, 6, 4, 66),
(1016, '7004127', 'E28011700000020A7A6A44BF', 'ABC3055', 'CASHER CHAIR', '7800', '7800', '42060', 'VISION NEXT', '6', 'STRAIGHT', '2019-11-29', '7800', '6', 'STRAIGHT', '7800', 2, 6, 4, 66),
(1014, '7004125', 'E28011700000020A7A6AAC0F', 'ABC3053', 'VISITOR SEAT (3)', '16000', '16000', '42060', 'VISION NEXT', '10', 'STRAIGHT', '2019-11-29', '16000', '10', 'STRAIGHT', '16000', 2, 6, 4, 66),
(1015, '7004126', 'E28011700000020A7A6A789F', 'ABC3054', 'CASHER CHAIR', '7800', '7800', '42060', 'VISION NEXT', '6', 'STRAIGHT', '2019-11-29', '7800', '6', 'STRAIGHT', '7800', 2, 6, 4, 66),
(1013, '7004124', 'E28011700000020A7A6BA9D0', 'ABC3052', 'VISITOR SEAT (3)', '16000', '16000', '42060', 'VISION NEXT', '10', 'STRAIGHT', '2019-11-29', '16000', '10', 'STRAIGHT', '16000', 2, 6, 4, 66),
(1012, '7004123', 'E28011700000020A7A6AAC6C', 'ABC3047', 'VISITOR SEAT (3)', '16000', '16000', '42060', 'VISION NEXT', '10', 'STRAIGHT', '2019-11-29', '16000', '10', 'STRAIGHT', '16000', 2, 6, 4, 66),
(1010, '7004121', 'E28011700000020A7A6B6BA0', 'ABC3045', 'VISITOR CHAIR', '7500', '7500', '43175', 'DIAMENSION', '4', 'STRAIGHT', '2019-11-29', '7500', '4', 'STRAIGHT', '7500', 2, 6, 4, 66),
(1011, '7004122', 'E28011700000020A7A6B489F', 'ABC3046', 'MAN. SOFA', '52000', '52000', '43175', 'DIAMENSION', '4', 'STRAIGHT', '2019-11-29', '52000', '4', 'STRAIGHT', '52000', 2, 6, 4, 66),
(1009, '7004120', 'E28011700000020A7A6B6AAC', 'ABC3044', 'VISITOR CHAIR', '7500', '7500', '43175', 'DIAMENSION', '4', 'STRAIGHT', '2019-11-29', '7500', '4', 'STRAIGHT', '7500', 2, 6, 4, 66),
(1007, '7004118', 'E28011700000020A7A6A788F', 'ABC3041', 'MAN. TABLE', '22000', '22000', '43175', 'DIAMENSION', '4', 'STRAIGHT', '2019-11-29', '22000', '4', 'STRAIGHT', '22000', 2, 6, 4, 66),
(1008, '7004119', 'E28011700000020A7A6B14FF', 'ABC3043', 'MAN CHAIR', '14500', '14500', '43175', 'DIAMENSION', '4', 'STRAIGHT', '2019-11-29', '14500', '4', 'STRAIGHT', '14500', 2, 6, 4, 66),
(1006, '7004117', 'E28011700000020A7A6AE0BF', 'ABC3035', 'VISITOR CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 2, 6, 4, 66),
(1004, '7004115', 'E28011700000020A7A6A782A', 'ABC3033', 'VISITOR CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 2, 6, 4, 66),
(1005, '7004116', 'E28011700000020A7A6BA83B', 'ABC3034', 'VISITOR CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 2, 6, 4, 66),
(1003, '7004114', 'E28011700000020A7A6BA8FC', 'ABC3031', 'STAFF CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 2, 6, 4, 66),
(1001, '7004112', 'E28011700000020A7A6AACCF', 'ABC3029', 'STAFF CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 2, 6, 4, 66),
(1002, '7004113', 'E28011700000020A7A6B0B80', 'ABC3030', 'STAFF CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 2, 6, 4, 66),
(1000, '7004111', 'E28011700000020A7A6B025F', 'ABC3028', 'STAFF TABLE', '6500', '6500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '6500', '10', 'STRAIGHT', '6500', 2, 6, 4, 66),
(999, '7004110', 'E28011700000020A7A6BA9E0', 'ABC3025', 'STAFF TABLE', '6500', '6500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '6500', '10', 'STRAIGHT', '6500', 2, 6, 4, 66),
(997, '7004108', 'E28011700000020A7A6B488F', 'ABC3022', 'OFFICER TABLE', '12000', '12000', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '12000', '7', 'DOUBLE DEP', '12000', 2, 6, 4, 66),
(998, '7004109', 'E28011700000020A7A6B7C3F', 'ABC3024', 'OFFICER TABLE', '12000', '12000', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '12000', '7', 'DOUBLE DEP', '12000', 2, 6, 4, 66),
(996, '7004107', 'E28011700000020A7A6B85F0', 'ABC3021', 'OFFICER TABLE', '12000', '12000', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '12000', '7', 'DOUBLE DEP', '12000', 2, 6, 4, 66),
(995, '7004106', 'E28011700000020A7A6B5120', 'ABC3009', 'VISITOR CHAIR', '5800', '5800', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '5800', '7', 'DOUBLE DEP', '5800', 2, 6, 4, 66),
(993, '7004104', 'E28011700000020A7A6BA8AF', 'ABC3007', 'VISITOR CHAIR', '5800', '5800', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '5800', '7', 'DOUBLE DEP', '5800', 2, 6, 4, 66),
(994, '7004105', 'E28011700000020A7A6B48EC', 'ABC3008', 'VISITOR CHAIR', '5800', '5800', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '5800', '7', 'DOUBLE DEP', '5800', 2, 6, 4, 66),
(992, '7004103', 'E28011700000020A7A6B6A5F', 'ABC3006', 'OFFICER CHAIR', '7000', '7000', '42917', 'VISION NEXT', '4', 'DOUBLE DEP', '2019-11-29', '7000', '4', 'DOUBLE DEP', '7000', 2, 6, 4, 66),
(991, '7004102', 'E28011700000020A7A6B029B', 'ABC3002', 'OFFICER CHAIR', '7000', '7000', '42917', 'VISION NEXT', '4', 'DOUBLE DEP', '2019-11-29', '7000', '4', 'DOUBLE DEP', '7000', 2, 6, 4, 66),
(990, '7004101', 'E28011700000020A7A6B8560', 'ABC3001', 'OFFICER CHAIR', '7000', '7000', '42917', 'VISION NEXT', '4', 'DOUBLE DEP', '2019-11-29', '7000', '4', 'DOUBLE DEP', '7000', 2, 6, 4, 66),
(989, '7004145', 'E28011700000020A7A6BD4EF', 'ABC5040', 'DAWLANCE 2T OUTTER', '49000', '52000', '42665', 'MAMJI', '5', 'STRAIGHT', '2019-11-29', '52000', '5', 'STRAIGHT', '52000', 1, 3, 1, 65),
(988, '7004144', 'E28011700000020A7A6B51C0', 'ABC5039', 'DAWLANCE 2T INNER', '49000', '52000', '42665', 'MAMJI', '5', 'STRAIGHT', '2019-11-29', '52000', '5', 'STRAIGHT', '52000', 1, 3, 1, 65),
(985, '7004141', 'E28011700000020A7A6A9ADE', 'ABC5023', 'HP PRINTER 56550', '78000', '81000', '43307', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '81000', '5', 'DOUBLE DEP', '81000', 1, 3, 1, 65),
(987, '7004143', 'E28011700000020A7A6B7C2F', 'ABC5038', 'DAWLANCE 2T OUTTER', '49000', '52000', '42665', 'MAMJI', '5', 'STRAIGHT', '2019-11-29', '52000', '5', 'STRAIGHT', '52000', 1, 3, 1, 65),
(986, '7004142', 'E28011700000020A7A6BD48C', 'ABC5037', 'DAWLANCE 2T INNER', '49000', '52000', '42665', 'MAMJI', '5', 'STRAIGHT', '2019-11-29', '52000', '5', 'STRAIGHT', '52000', 1, 3, 1, 65),
(982, '7004138', 'E28011700000020A7A6BDD30', 'ABC5019', 'DELL MONITER', '18200', '19000', '43508', 'COMPUTER ONE', '5', 'DOUBLE DEP', '2019-11-29', '19000', '5', 'DOUBLE DEP', '19000', 1, 3, 1, 65),
(983, '7004139', 'E28011700000020A7A6A9A6F', 'ABC5020', 'DELL CPU', '65000', '73500', '43508', 'COMPUTER ONE', '5', 'DOUBLE DEP', '2019-11-29', '73500', '5', 'DOUBLE DEP', '73500', 1, 3, 1, 65),
(984, '7004140', 'E28011700000020A7A6B7C4C', 'ABC5021', 'HP PRINTER 5958', '54000', '56500', '43307', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '56500', '5', 'DOUBLE DEP', '56500', 1, 3, 1, 65),
(981, '7004137', 'E28011700000020A7A6BC3A0', 'ABC5018', 'DELL CPU', '65000', '73500', '43508', 'COMPUTER ONE', '5', 'DOUBLE DEP', '2019-11-29', '73500', '5', 'DOUBLE DEP', '73500', 1, 3, 1, 65),
(978, '7004134', 'E28011700000020A7A6BD42F', 'ABC5013', 'DELL MONITER', '19000', '20500', '43244', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '20500', '5', 'DOUBLE DEP', '20500', 1, 3, 1, 65),
(979, '7004135', 'E28011700000020A7A6BC390', 'ABC5014', 'DELL CPU', '67000', '76000', '43244', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '76000', '5', 'DOUBLE DEP', '76000', 1, 3, 1, 65),
(980, '7004136', 'E28011700000020A7A6BD41F', 'ABC5015', 'DELL MONITER', '19000', '20500', '43244', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '20500', '5', 'DOUBLE DEP', '20500', 1, 3, 1, 65),
(977, '7004133', 'E28011700000020A7A6B140F', 'ABC5012', 'DELL CPU', '67000', '76000', '43244', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '76000', '5', 'DOUBLE DEP', '76000', 1, 3, 1, 65),
(976, '7004132', 'E28011700000020A7A6A3A3F', 'ABC5011', 'DELL MONITER', '19000', '20500', '43244', 'COMPUTECH', '5', 'DOUBLE DEP', '2019-11-29', '20500', '5', 'DOUBLE DEP', '20500', 1, 3, 1, 65),
(973, '7004129', 'E28011700000020A7A6B024F', 'ABC3058', 'CASHER CHAIR', '7800', '7800', '42060', 'VISION NEXT', '6', 'STRAIGHT', '2019-11-29', '7800', '6', 'STRAIGHT', '7800', 1, 3, 1, 65),
(975, '7004131', 'E28011700000020A7A6B7C9B', 'ABC5004', 'COUNTING MACHINE', '157000', '162000', '43487', 'ZEBRA', '5', 'DOUBLE DEP', '2019-11-29', '162000', '5', 'DOUBLE DEP', '162000', 1, 3, 1, 65),
(974, '7004130', 'E28011700000020A7A6B6A4F', 'ABC5001', 'COUNTING MACHINE', '135000', '138000', '42075', 'FINTECH', '5', 'DOUBLE DEP', '2019-11-29', '138000', '5', 'DOUBLE DEP', '138000', 1, 3, 1, 65),
(972, '7004128', 'E28011700000020A7A6AE9E0', 'ABC3056', 'CASHER CHAIR', '7800', '7800', '42060', 'VISION NEXT', '6', 'STRAIGHT', '2019-11-29', '7800', '6', 'STRAIGHT', '7800', 1, 3, 1, 65),
(969, '7004125', 'E28011700000020A7A6AAC0F', 'ABC3053', 'VISITOR SEAT (3)', '16000', '16000', '42060', 'VISION NEXT', '10', 'STRAIGHT', '2019-11-29', '16000', '10', 'STRAIGHT', '16000', 1, 3, 1, 65),
(971, '7004127', 'E28011700000020A7A6A44BF', 'ABC3055', 'CASHER CHAIR', '7800', '7800', '42060', 'VISION NEXT', '6', 'STRAIGHT', '2019-11-29', '7800', '6', 'STRAIGHT', '7800', 1, 3, 1, 65),
(970, '7004126', 'E28011700000020A7A6A789F', 'ABC3054', 'CASHER CHAIR', '7800', '7800', '42060', 'VISION NEXT', '6', 'STRAIGHT', '2019-11-29', '7800', '6', 'STRAIGHT', '7800', 1, 3, 1, 65),
(968, '7004124', 'E28011700000020A7A6BA9D0', 'ABC3052', 'VISITOR SEAT (3)', '16000', '16000', '42060', 'VISION NEXT', '10', 'STRAIGHT', '2019-11-29', '16000', '10', 'STRAIGHT', '16000', 1, 3, 1, 65),
(965, '7004121', 'E28011700000020A7A6B6BA0', 'ABC3045', 'VISITOR CHAIR', '7500', '7500', '43175', 'DIAMENSION', '4', 'STRAIGHT', '2019-11-29', '7500', '4', 'STRAIGHT', '7500', 1, 3, 1, 65),
(967, '7004123', 'E28011700000020A7A6AAC6C', 'ABC3047', 'VISITOR SEAT (3)', '16000', '16000', '42060', 'VISION NEXT', '10', 'STRAIGHT', '2019-11-29', '16000', '10', 'STRAIGHT', '16000', 1, 3, 1, 65),
(966, '7004122', 'E28011700000020A7A6B489F', 'ABC3046', 'MAN. SOFA', '52000', '52000', '43175', 'DIAMENSION', '4', 'STRAIGHT', '2019-11-29', '52000', '4', 'STRAIGHT', '52000', 1, 3, 1, 65),
(964, '7004120', 'E28011700000020A7A6B6AAC', 'ABC3044', 'VISITOR CHAIR', '7500', '7500', '43175', 'DIAMENSION', '4', 'STRAIGHT', '2019-11-29', '7500', '4', 'STRAIGHT', '7500', 1, 3, 1, 65),
(963, '7004119', 'E28011700000020A7A6B14FF', 'ABC3043', 'MAN CHAIR', '14500', '14500', '43175', 'DIAMENSION', '4', 'STRAIGHT', '2019-11-29', '14500', '4', 'STRAIGHT', '14500', 1, 3, 1, 65),
(962, '7004118', 'E28011700000020A7A6A788F', 'ABC3041', 'MAN. TABLE', '22000', '22000', '43175', 'DIAMENSION', '4', 'STRAIGHT', '2019-11-29', '22000', '4', 'STRAIGHT', '22000', 1, 3, 1, 65),
(959, '7004115', 'E28011700000020A7A6A782A', 'ABC3033', 'VISITOR CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 1, 3, 1, 65),
(961, '7004117', 'E28011700000020A7A6AE0BF', 'ABC3035', 'VISITOR CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 1, 3, 1, 65),
(960, '7004116', 'E28011700000020A7A6BA83B', 'ABC3034', 'VISITOR CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 1, 3, 1, 65),
(958, '7004114', 'E28011700000020A7A6BA8FC', 'ABC3031', 'STAFF CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 1, 3, 1, 65),
(957, '7004113', 'E28011700000020A7A6B0B80', 'ABC3030', 'STAFF CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 1, 3, 1, 65),
(956, '7004112', 'E28011700000020A7A6AACCF', 'ABC3029', 'STAFF CHAIR', '4500', '4500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '4500', '10', 'STRAIGHT', '4500', 1, 3, 1, 65),
(955, '7004111', 'E28011700000020A7A6B025F', 'ABC3028', 'STAFF TABLE', '6500', '6500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '6500', '10', 'STRAIGHT', '6500', 1, 3, 1, 65),
(954, '7004110', 'E28011700000020A7A6BA9E0', 'ABC3025', 'STAFF TABLE', '6500', '6500', '42481', 'INTERWOOD', '10', 'STRAIGHT', '2019-11-29', '6500', '10', 'STRAIGHT', '6500', 1, 3, 1, 65),
(953, '7004109', 'E28011700000020A7A6B7C3F', 'ABC3024', 'OFFICER TABLE', '12000', '12000', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '12000', '7', 'DOUBLE DEP', '12000', 1, 3, 1, 65),
(950, '7004106', 'E28011700000020A7A6B5120', 'ABC3009', 'VISITOR CHAIR', '5800', '5800', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '5800', '7', 'DOUBLE DEP', '5800', 1, 3, 1, 65),
(952, '7004108', 'E28011700000020A7A6B488F', 'ABC3022', 'OFFICER TABLE', '12000', '12000', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '12000', '7', 'DOUBLE DEP', '12000', 1, 3, 1, 65),
(951, '7004107', 'E28011700000020A7A6B85F0', 'ABC3021', 'OFFICER TABLE', '12000', '12000', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '12000', '7', 'DOUBLE DEP', '12000', 1, 3, 1, 65),
(949, '7004105', 'E28011700000020A7A6B48EC', 'ABC3008', 'VISITOR CHAIR', '5800', '5800', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '5800', '7', 'DOUBLE DEP', '5800', 1, 3, 1, 65),
(948, '7004104', 'E28011700000020A7A6BA8AF', 'ABC3007', 'VISITOR CHAIR', '5800', '5800', '42917', 'VISION NEXT', '7', 'DOUBLE DEP', '2019-11-29', '5800', '7', 'DOUBLE DEP', '5800', 1, 3, 1, 65),
(945, '7004101', 'E28011700000020A7A6B8560', 'ABC3001', 'OFFICER CHAIR', '7000', '7000', '42917', 'VISION NEXT', '4', 'DOUBLE DEP', '2019-11-29', '7000', '4', 'DOUBLE DEP', '7000', 1, 3, 1, 65),
(947, '7004103', 'E28011700000020A7A6B6A5F', 'ABC3006', 'OFFICER CHAIR', '7000', '7000', '42917', 'VISION NEXT', '4', 'DOUBLE DEP', '2019-11-29', '7000', '4', 'DOUBLE DEP', '7000', 1, 3, 1, 65),
(946, '7004102', 'E28011700000020A7A6B029B', 'ABC3002', 'OFFICER CHAIR', '7000', '7000', '42917', 'VISION NEXT', '4', 'DOUBLE DEP', '2019-11-29', '7000', '4', 'DOUBLE DEP', '7000', 1, 3, 1, 65);

-- --------------------------------------------------------

--
-- Table structure for table `table_data_csv`
--

CREATE TABLE `table_data_csv` (
  `id` int(11) NOT NULL,
  `assetID` varchar(30) DEFAULT NULL,
  `assetName` varchar(30) DEFAULT NULL,
  `totalValue` varchar(50) DEFAULT NULL,
  `depreciation` varchar(50) DEFAULT NULL,
  `netValue` varchar(50) DEFAULT NULL,
  `lifeInYear` varchar(50) DEFAULT NULL,
  `lifeInYear_update` varchar(50) DEFAULT NULL,
  `dateTime_split_UpdateTable` varchar(50) DEFAULT NULL,
  `branchId` varchar(50) DEFAULT NULL,
  `depType` varchar(255) DEFAULT NULL,
  `last_netValue` varchar(255) DEFAULT NULL,
  `lastReport_dateTime` varchar(255) DEFAULT NULL,
  `report_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_data_csv`
--

INSERT INTO `table_data_csv` (`id`, `assetID`, `assetName`, `totalValue`, `depreciation`, `netValue`, `lifeInYear`, `lifeInYear_update`, `dateTime_split_UpdateTable`, `branchId`, `depType`, `last_netValue`, `lastReport_dateTime`, `report_id`) VALUES
(994, '123123', 'DAWLANCE 2T OUTTER', '52000', '10400', '41600', '5', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '41600', '2019-11-25', 4),
(995, 'ABC5039(Missing)', 'DAWLANCE 2T INNER', '52000', '10400', '41600', '5', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '41600', '2019-11-25', 4),
(996, 'ABC5038(Missing)', 'DAWLANCE 2T OUTTER', '52000', '10400', '41600', '5', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '41600', '2019-11-25', 4),
(997, 'ABC5037(Missing)', 'DAWLANCE 2T INNER', '52000', '10400', '41600', '5', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '41600', '2019-11-25', 4),
(998, 'ABC5023(Missing)', 'HP PRINTER 56550', '81000', '16200', '64800', '5', '1', '2019-11-25 04:12:23pm', '1', 'DOUBLE DEP', '64800', '2019-11-25', 4),
(999, 'ABC5021(Missing)', 'HP PRINTER 5958', '56500', '11300', '45200', '5', '1', '2019-11-25 04:12:23pm', '1', 'DOUBLE DEP', '45200', '2019-11-25', 4),
(1000, 'ABC5020(Missing)', 'DELL CPU', '73500', '14700', '58800', '5', '1', '2019-11-25 04:12:23pm', '1', 'DOUBLE DEP', '58800', '2019-11-25', 4),
(1001, 'ABC5019(Missing)', 'DELL MONITER', '19000', '3800', '15200', '5', '1', '2019-11-25 04:12:23pm', '1', 'DOUBLE DEP', '15200', '2019-11-25', 4),
(1002, 'ABC5018(Missing)', 'DELL CPU', '73500', '14700', '58800', '5', '1', '2019-11-25 04:12:23pm', '1', 'DOUBLE DEP', '58800', '2019-11-25', 4),
(1003, 'ABC5015(Missing)', 'DELL MONITER', '20500', '4100', '16400', '5', '1', '2019-11-25 04:12:23pm', '1', 'DOUBLE DEP', '16400', '2019-11-25', 4),
(1004, 'ABC5014(Missing)', 'DELL CPU', '76000', '15200', '60800', '5', '1', '2019-11-25 04:12:23pm', '1', 'DOUBLE DEP', '60800', '2019-11-25', 4),
(1005, 'ABC5013(Missing)', 'DELL MONITER', '20500', '4100', '16400', '5', '1', '2019-11-25 04:12:23pm', '1', 'DOUBLE DEP', '16400', '2019-11-25', 4),
(1006, 'ABC5012(Missing)', 'DELL CPU', '76000', '15200', '60800', '5', '1', '2019-11-25 04:12:23pm', '1', 'DOUBLE DEP', '60800', '2019-11-25', 4),
(1007, 'ABC5011(Missing)', 'DELL MONITER', '20500', '4100', '16400', '5', '1', '2019-11-25 04:12:23pm', '1', 'DOUBLE DEP', '16400', '2019-11-25', 4),
(1008, 'ABC5004(Missing)', 'COUNTING MACHINE', '162000', '32400', '129600', '5', '1', '2019-11-25 04:12:23pm', '1', 'DOUBLE DEP', '129600', '2019-11-25', 4),
(1009, 'ABC5001(Missing)', 'COUNTING MACHINE', '138000', '27600', '110400', '5', '1', '2019-11-25 04:12:23pm', '1', 'DOUBLE DEP', '110400', '2019-11-25', 4),
(1010, 'ABC3058(Missing)', 'CASHER CHAIR', '7800', '1300', '6500', '6', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '6500', '2019-11-25', 4),
(1011, 'ABC3056(Missing)', 'CASHER CHAIR', '7800', '1300', '6500', '6', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '6500', '2019-11-25', 4),
(1012, 'ABC3055(Missing)', 'CASHER CHAIR', '7800', '1300', '6500', '6', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '6500', '2019-11-25', 4),
(1013, 'ABC3054(Missing)', 'CASHER CHAIR', '7800', '1300', '6500', '6', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '6500', '2019-11-25', 4),
(1014, 'ABC3053(Missing)', 'VISITOR SEAT (3)', '16000', '1600', '14400', '10', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '14400', '2019-11-25', 4),
(1015, 'ABC3052(Missing)', 'VISITOR SEAT (3)', '16000', '1600', '14400', '10', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '14400', '2019-11-25', 4),
(1016, 'ABC3047(Missing)', 'VISITOR SEAT (3)', '16000', '1600', '14400', '10', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '14400', '2019-11-25', 4),
(1017, 'ABC3046(Missing)', 'MAN. SOFA', '52000', '13000', '39000', '4', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '39000', '2019-11-25', 4),
(1018, 'ABC3045(Missing)', 'VISITOR CHAIR', '7500', '1875', '5625', '4', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '5625', '2019-11-25', 4),
(1019, 'ABC3044(Missing)', 'VISITOR CHAIR', '7500', '1875', '5625', '4', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '5625', '2019-11-25', 4),
(1020, 'ABC3043(Missing)', 'MAN CHAIR', '14500', '3625', '10875', '4', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '10875', '2019-11-25', 4),
(1021, 'ABC3041(Missing)', 'MAN. TABLE', '22000', '5500', '16500', '4', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '16500', '2019-11-25', 4),
(1022, 'ABC3035(Missing)', 'VISITOR CHAIR', '4500', '450', '4050', '10', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '4050', '2019-11-25', 4),
(1023, 'ABC3034(Missing)', 'VISITOR CHAIR', '4500', '450', '4050', '10', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '4050', '2019-11-25', 4),
(1024, 'ABC3033(Missing)', 'VISITOR CHAIR', '4500', '450', '4050', '10', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '4050', '2019-11-25', 4),
(1025, 'ABC3031(Missing)', 'STAFF CHAIR', '4500', '450', '4050', '10', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '4050', '2019-11-25', 4),
(1026, 'ABC3030(Missing)', 'STAFF CHAIR', '4500', '450', '4050', '10', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '4050', '2019-11-25', 4),
(1027, 'ABC3029(Missing)', 'STAFF CHAIR', '4500', '450', '4050', '10', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '4050', '2019-11-25', 4),
(1028, 'ABC3028(Missing)', 'STAFF TABLE', '6500', '650', '5850', '10', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '5850', '2019-11-25', 4),
(1029, 'ABC3025(Missing)', 'STAFF TABLE', '6500', '650', '5850', '10', '1', '2019-11-25 04:12:23pm', '1', 'STRAIGHT', '5850', '2019-11-25', 4),
(1030, 'ABC3024(Missing)', 'OFFICER TABLE', '12000', '1714', '10286', '7', '1', '2019-11-25 04:12:23pm', '1', 'DOUBLE DEP', '10286', '2019-11-25', 4),
(1031, 'ABC3022(Missing)', 'OFFICER TABLE', '12000', '1714', '10286', '7', '1', '2019-11-25 04:12:23pm', '1', 'DOUBLE DEP', '10286', '2019-11-25', 4),
(1032, 'ABC3021(Missing)', 'OFFICER TABLE', '12000', '1714', '10286', '7', '1', '2019-11-25 04:12:23pm', '1', 'DOUBLE DEP', '10286', '2019-11-25', 4),
(1033, 'ABC3009(Missing)', 'VISITOR CHAIR', '5800', '829', '4971', '7', '1', '2019-11-25 04:12:23pm', '1', 'DOUBLE DEP', '4971', '2019-11-25', 4),
(1034, 'ABC3008(Missing)', 'VISITOR CHAIR', '5800', '829', '4971', '7', '1', '2019-11-25 04:12:23pm', '1', 'DOUBLE DEP', '4971', '2019-11-25', 4),
(1035, 'ABC3007(Missing)', 'VISITOR CHAIR', '5800', '829', '4971', '7', '1', '2019-11-25 04:12:23pm', '1', 'DOUBLE DEP', '4971', '2019-11-25', 4),
(1036, 'ABC3006(Missing)', 'OFFICER CHAIR', '7000', '1750', '5250', '4', '1', '2019-11-25 04:12:23pm', '1', 'DOUBLE DEP', '5250', '2019-11-25', 4),
(1037, 'ABC3002(Missing)', 'OFFICER CHAIR', '7000', '1750', '5250', '4', '1', '2019-11-25 04:12:23pm', '1', 'DOUBLE DEP', '5250', '2019-11-25', 4),
(1038, 'ABC3001(Missing)', 'OFFICER CHAIR', '7000', '1750', '5250', '4', '1', '2019-11-25 04:12:23pm', '1', 'DOUBLE DEP', '5250', '2019-11-25', 4),
(1039, 'ABC5040(Missing)', 'DAWLANCE 2T OUTTER', '52000', '10400', '41600', '5', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '41600', '2019-11-25', 5),
(1040, 'ABC5039(Missing)', 'DAWLANCE 2T INNER', '52000', '10400', '41600', '5', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '41600', '2019-11-25', 5),
(1041, 'ABC5038(Missing)', 'DAWLANCE 2T OUTTER', '52000', '10400', '41600', '5', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '41600', '2019-11-25', 5),
(1042, 'ABC5037(Missing)', 'DAWLANCE 2T INNER', '52000', '10400', '41600', '5', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '41600', '2019-11-25', 5),
(1043, 'ABC5023(Missing)', 'HP PRINTER 56550', '81000', '16200', '64800', '5', '1', '2019-11-25 04:17:01pm', '1', 'DOUBLE DEP', '64800', '2019-11-25', 5),
(1044, 'ABC5021(Missing)', 'HP PRINTER 5958', '56500', '11300', '45200', '5', '1', '2019-11-25 04:17:01pm', '1', 'DOUBLE DEP', '45200', '2019-11-25', 5),
(1045, 'ABC5020(Missing)', 'DELL CPU', '73500', '14700', '58800', '5', '1', '2019-11-25 04:17:01pm', '1', 'DOUBLE DEP', '58800', '2019-11-25', 5),
(1046, 'ABC5019(Missing)', 'DELL MONITER', '19000', '3800', '15200', '5', '1', '2019-11-25 04:17:01pm', '1', 'DOUBLE DEP', '15200', '2019-11-25', 5),
(1047, 'ABC5018(Missing)', 'DELL CPU', '73500', '14700', '58800', '5', '1', '2019-11-25 04:17:01pm', '1', 'DOUBLE DEP', '58800', '2019-11-25', 5),
(1048, 'ABC5015(Missing)', 'DELL MONITER', '20500', '4100', '16400', '5', '1', '2019-11-25 04:17:01pm', '1', 'DOUBLE DEP', '16400', '2019-11-25', 5),
(1049, 'ABC5014(Missing)', 'DELL CPU', '76000', '15200', '60800', '5', '1', '2019-11-25 04:17:01pm', '1', 'DOUBLE DEP', '60800', '2019-11-25', 5),
(1050, 'ABC5013(Missing)', 'DELL MONITER', '20500', '4100', '16400', '5', '1', '2019-11-25 04:17:01pm', '1', 'DOUBLE DEP', '16400', '2019-11-25', 5),
(1051, 'ABC5012(Missing)', 'DELL CPU', '76000', '15200', '60800', '5', '1', '2019-11-25 04:17:01pm', '1', 'DOUBLE DEP', '60800', '2019-11-25', 5),
(1052, 'ABC5011(Missing)', 'DELL MONITER', '20500', '4100', '16400', '5', '1', '2019-11-25 04:17:01pm', '1', 'DOUBLE DEP', '16400', '2019-11-25', 5),
(1053, 'ABC5004(Missing)', 'COUNTING MACHINE', '162000', '32400', '129600', '5', '1', '2019-11-25 04:17:01pm', '1', 'DOUBLE DEP', '129600', '2019-11-25', 5),
(1054, 'ABC5001(Missing)', 'COUNTING MACHINE', '138000', '27600', '110400', '5', '1', '2019-11-25 04:17:01pm', '1', 'DOUBLE DEP', '110400', '2019-11-25', 5),
(1055, 'ABC3058(Missing)', 'CASHER CHAIR', '7800', '1300', '6500', '6', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '6500', '2019-11-25', 5),
(1056, 'ABC3056(Missing)', 'CASHER CHAIR', '7800', '1300', '6500', '6', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '6500', '2019-11-25', 5),
(1057, 'ABC3055(Missing)', 'CASHER CHAIR', '7800', '1300', '6500', '6', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '6500', '2019-11-25', 5),
(1058, 'ABC3054(Missing)', 'CASHER CHAIR', '7800', '1300', '6500', '6', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '6500', '2019-11-25', 5),
(1059, 'ABC3053(Missing)', 'VISITOR SEAT (3)', '16000', '1600', '14400', '10', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '14400', '2019-11-25', 5),
(1060, 'ABC3052(Missing)', 'VISITOR SEAT (3)', '16000', '1600', '14400', '10', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '14400', '2019-11-25', 5),
(1061, 'ABC3047(Missing)', 'VISITOR SEAT (3)', '16000', '1600', '14400', '10', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '14400', '2019-11-25', 5),
(1062, 'ABC3046(Missing)', 'MAN. SOFA', '52000', '13000', '39000', '4', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '39000', '2019-11-25', 5),
(1063, 'ABC3045(Missing)', 'VISITOR CHAIR', '7500', '1875', '5625', '4', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '5625', '2019-11-25', 5),
(1064, 'ABC3044(Missing)', 'VISITOR CHAIR', '7500', '1875', '5625', '4', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '5625', '2019-11-25', 5),
(1065, 'ABC3043(Missing)', 'MAN CHAIR', '14500', '3625', '10875', '4', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '10875', '2019-11-25', 5),
(1066, 'ABC3041(Missing)', 'MAN. TABLE', '22000', '5500', '16500', '4', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '16500', '2019-11-25', 5),
(1067, 'ABC3035(Missing)', 'VISITOR CHAIR', '4500', '450', '4050', '10', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '4050', '2019-11-25', 5),
(1068, 'ABC3034(Missing)', 'VISITOR CHAIR', '4500', '450', '4050', '10', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '4050', '2019-11-25', 5),
(1069, 'ABC3033(Missing)', 'VISITOR CHAIR', '4500', '450', '4050', '10', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '4050', '2019-11-25', 5),
(1070, 'ABC3031(Missing)', 'STAFF CHAIR', '4500', '450', '4050', '10', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '4050', '2019-11-25', 5),
(1071, 'ABC3030(Missing)', 'STAFF CHAIR', '4500', '450', '4050', '10', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '4050', '2019-11-25', 5),
(1072, 'ABC3029(Missing)', 'STAFF CHAIR', '4500', '450', '4050', '10', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '4050', '2019-11-25', 5),
(1073, 'ABC3028(Missing)', 'STAFF TABLE', '6500', '650', '5850', '10', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '5850', '2019-11-25', 5),
(1074, 'ABC3025(Missing)', 'STAFF TABLE', '6500', '650', '5850', '10', '1', '2019-11-25 04:17:01pm', '1', 'STRAIGHT', '5850', '2019-11-25', 5),
(1075, 'ABC3024(Missing)', 'OFFICER TABLE', '12000', '1714', '10286', '7', '1', '2019-11-25 04:17:01pm', '1', 'DOUBLE DEP', '10286', '2019-11-25', 5),
(1076, 'ABC3022(Missing)', 'OFFICER TABLE', '12000', '1714', '10286', '7', '1', '2019-11-25 04:17:01pm', '1', 'DOUBLE DEP', '10286', '2019-11-25', 5),
(1077, 'ABC3021(Missing)', 'OFFICER TABLE', '12000', '1714', '10286', '7', '1', '2019-11-25 04:17:01pm', '1', 'DOUBLE DEP', '10286', '2019-11-25', 5),
(1078, 'ABC3009(Missing)', 'VISITOR CHAIR', '5800', '829', '4971', '7', '1', '2019-11-25 04:17:01pm', '1', 'DOUBLE DEP', '4971', '2019-11-25', 5),
(1079, 'ABC3008(Missing)', 'VISITOR CHAIR', '5800', '829', '4971', '7', '1', '2019-11-25 04:17:01pm', '1', 'DOUBLE DEP', '4971', '2019-11-25', 5),
(1080, 'ABC3007(Missing)', 'VISITOR CHAIR', '5800', '829', '4971', '7', '1', '2019-11-25 04:17:01pm', '1', 'DOUBLE DEP', '4971', '2019-11-25', 5),
(1081, 'ABC3006(Missing)', 'OFFICER CHAIR', '7000', '1750', '5250', '4', '1', '2019-11-25 04:17:01pm', '1', 'DOUBLE DEP', '5250', '2019-11-25', 5),
(1082, 'ABC3002(Missing)', 'OFFICER CHAIR', '7000', '1750', '5250', '4', '1', '2019-11-25 04:17:01pm', '1', 'DOUBLE DEP', '5250', '2019-11-25', 5),
(1083, 'ABC3001(Missing)', 'OFFICER CHAIR', '7000', '1750', '5250', '4', '1', '2019-11-25 04:17:01pm', '1', 'DOUBLE DEP', '5250', '2019-11-25', 5);

-- --------------------------------------------------------

--
-- Table structure for table `table_data_csv_report`
--

CREATE TABLE `table_data_csv_report` (
  `Asset_ID` varchar(30) NOT NULL,
  `Asset_Name` varchar(30) DEFAULT NULL,
  `Total_Value` varchar(30) DEFAULT NULL,
  `Current_Value` varchar(50) DEFAULT NULL,
  `Depreciation` varchar(50) DEFAULT NULL,
  `NET_Value` varchar(255) DEFAULT NULL,
  `Life_In_Year` varchar(255) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `table_userdatainput`
--

CREATE TABLE `table_userdatainput` (
  `id_table_userDataInput` int(11) NOT NULL,
  `Branch_Code` varchar(255) DEFAULT NULL,
  `ASSET_ID` varchar(255) DEFAULT NULL,
  `ASSET_NAME` varchar(255) DEFAULT NULL,
  `INVOICE_COST` varchar(255) DEFAULT NULL,
  `TOTAL_COST` varchar(255) DEFAULT NULL,
  `DATE_IN_USE` varchar(255) DEFAULT NULL,
  `VENDOR` varchar(255) DEFAULT NULL,
  `LIFE_IN_YR` varchar(255) DEFAULT NULL,
  `DEP_TYPE` varchar(255) DEFAULT NULL,
  `NET_VALUE` varchar(255) DEFAULT NULL,
  `S_NO` varchar(255) DEFAULT NULL,
  `insertDate` varchar(255) DEFAULT NULL,
  `loginEmail` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `phone_verified` tinyint(1) NOT NULL DEFAULT '0',
  `code` varchar(100) DEFAULT NULL,
  `premium` tinyint(1) NOT NULL DEFAULT '0',
  `country` int(11) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `pass` char(200) DEFAULT NULL,
  `firebaseUserId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `password`, `gender`, `picture`, `phone`, `phone_verified`, `code`, `premium`, `country`, `state`, `city`, `address`, `pass`, `firebaseUserId`) VALUES
(3, 'John Doe', '', 'john@gmail.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', 'Male', 'profile.jpg', '03123349398', 1, '79145984', 0, 78, '', '', '', '123123', 'H7eJnnDNtXVtaVgLxSGjOMPSXRN2'),
(25, 'Daniel', NULL, 'daniel@gmail.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', 'Male', NULL, '03123349398', 0, '0', 0, 238, '0', '0', '0', '123123', 'AzUwH3iiLHMcHlo8ZdQKXjh8kbF3'),
(26, 'Danny', NULL, 'danny@gmail.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', 'Male', NULL, '03123349398', 0, '0', 0, 238, '0', '0', '0', '123123', '901swFHfNkWZiYxW9YL2qX3T8tH2'),
(27, 'Harry', NULL, 'harry@gmail.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', 'Male', NULL, '03123349398', 0, '0', 0, 238, NULL, NULL, NULL, '123123', 'Rd85mkjbGwRuP0TKN0bK465v72E3'),
(32, 'Anila', NULL, 'syedaanila742@gmail.com', '0df8c2666dcd55bbf5fe776a24adf6139c96461e04da6d285395e1d296ac23bb', 'Female', 'image-3d341d14-bd0f-4114-a105-3b3fd78b4df2.jpg', '03162947479', 0, NULL, 0, 238, '', '', '', 'anilayousuf', '74uPfRJX9JhoPwUwegPNtZ5TGWr1'),
(36, 'Abdul', NULL, 'jo12hn@gmail.com', 'be18c209a2192e0320406e24474c62e2e06b98ed3573b6647691552507077dac', 'Male', NULL, '03123349398', 0, NULL, 0, 238, NULL, NULL, NULL, 'jo12hn@gmail.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `users_table`
--

CREATE TABLE `users_table` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_table`
--

INSERT INTO `users_table` (`id`, `name`, `email`, `password`, `role`) VALUES
(2, 'Hafeez', 'hafeez@jazsoft.com', '4297f44b13955235245b2497399d7a93', '0'),
(7, 'Azeem Ajani', 'azeem@gmail.com', '0dd61bf6270f9d2c0e17b7b45203b94a', '0'),
(9, 'admin', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '1'),
(14, 'Ahmed', 'ahmed@gmail.com', '005282aa6747a2c82d09065d1194dd20', '0'),
(13, 'Ali Ahmed', 'ali@gmail.com', 'd4384c2e7aab2c22eb805c0f48852f23', '1');

-- --------------------------------------------------------

--
-- Table structure for table `zone_table`
--

CREATE TABLE `zone_table` (
  `zone_id` int(11) NOT NULL,
  `zone_title` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zone_table`
--

INSERT INTO `zone_table` (`zone_id`, `zone_title`) VALUES
(1, '3.1 KARACHI'),
(2, '1.1 LAHORE');

-- --------------------------------------------------------

--
-- Structure for view `data_csv_report_table1`
--
DROP TABLE IF EXISTS `data_csv_report_table1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jazsoftadmin`@`localhost` SQL SECURITY DEFINER VIEW `data_csv_report_table1`  AS  select `data_csv_report_table`.`Asset_ID` AS `Asset_ID`,`data_csv_report_table`.`Asset_Name` AS `Asset_Name`,`data_csv_report_table`.`Total_Value` AS `Total_Value`,`data_csv_report_table`.`Depreciation` AS `Depreciation`,`data_csv_report_table`.`NET_Value` AS `NET_Value` from `data_csv_report_table` ;

-- --------------------------------------------------------

--
-- Structure for view `filter_subcategory_view`
--
DROP TABLE IF EXISTS `filter_subcategory_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jazsoftadmin`@`localhost` SQL SECURITY DEFINER VIEW `filter_subcategory_view`  AS  select `ads`.`subcat_id` AS `subcat_id`,`ads`.`id` AS `id`,`ads`.`title` AS `title`,`ads`.`price` AS `price`,`ads`.`address` AS `address`,`ads`.`featured` AS `featured`,`ads`.`picture` AS `picture`,`ads`.`created_at` AS `created_at`,`favourites`.`user_id` AS `user_id` from (`ads` left join `favourites` on((`ads`.`id` = `favourites`.`ad_id`))) where (`ads`.`status` = 'active') ;

-- --------------------------------------------------------

--
-- Structure for view `single_ad_fav_view`
--
DROP TABLE IF EXISTS `single_ad_fav_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jazsoftadmin`@`localhost` SQL SECURITY DEFINER VIEW `single_ad_fav_view`  AS  select `single_ad_view`.`ad_id` AS `ad_id`,`single_ad_view`.`ad_title` AS `ad_title`,`single_ad_view`.`ad_price` AS `ad_price`,`single_ad_view`.`ad_desc` AS `ad_desc`,`single_ad_view`.`ad_pictures` AS `ad_pictures`,`single_ad_view`.`ad_address` AS `ad_address`,`single_ad_view`.`ad_featured` AS `ad_featured`,`single_ad_view`.`ad_created` AS `ad_created`,`single_ad_view`.`cat_name` AS `cat_name`,`single_ad_view`.`subcat_name` AS `subcat_name`,`single_ad_view`.`user_id` AS `user_id`,`single_ad_view`.`firebaseUserId` AS `firebaseUserId`,`single_ad_view`.`user_name` AS `user_name`,`single_ad_view`.`user_phone` AS `user_phone`,`single_ad_view`.`user_picture` AS `user_picture`,`favourites`.`ad_id` AS `fav_ad_id`,`favourites`.`user_id` AS `fav_user_id` from (`single_ad_view` left join `favourites` on((`single_ad_view`.`ad_id` = `favourites`.`ad_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `single_ad_view`
--
DROP TABLE IF EXISTS `single_ad_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jazsoftadmin`@`localhost` SQL SECURITY DEFINER VIEW `single_ad_view`  AS  select `ads`.`id` AS `ad_id`,`ads`.`title` AS `ad_title`,`ads`.`price` AS `ad_price`,`ads`.`description` AS `ad_desc`,`ads`.`picture` AS `ad_pictures`,`ads`.`address` AS `ad_address`,`ads`.`featured` AS `ad_featured`,`ads`.`created_at` AS `ad_created`,`categories`.`name` AS `cat_name`,`subcategories`.`name` AS `subcat_name`,`users`.`id` AS `user_id`,`users`.`firebaseUserId` AS `firebaseUserId`,`users`.`fname` AS `user_name`,`users`.`phone` AS `user_phone`,`users`.`picture` AS `user_picture` from (((`ads` join `categories` on((`ads`.`cat_id` = `categories`.`id`))) join `subcategories` on((`ads`.`subcat_id` = `subcategories`.`id`))) join `users` on((`users`.`id` = `ads`.`user_id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_home_banner`
--
ALTER TABLE `app_home_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branch_table`
--
ALTER TABLE `branch_table`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_table`
--
ALTER TABLE `company_table`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `csv_list`
--
ALTER TABLE `csv_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_csv_report_table`
--
ALTER TABLE `data_csv_report_table`
  ADD PRIMARY KEY (`auto_id`);

--
-- Indexes for table `data_list`
--
ALTER TABLE `data_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_table_01`
--
ALTER TABLE `data_table_01`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_list`
--
ALTER TABLE `report_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_csv_01`
--
ALTER TABLE `table_csv_01`
  ADD PRIMARY KEY (`csv_id_auto`);

--
-- Indexes for table `table_data_01`
--
ALTER TABLE `table_data_01`
  ADD PRIMARY KEY (`data_id_auto`);

--
-- Indexes for table `table_data_csv`
--
ALTER TABLE `table_data_csv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_data_csv_report`
--
ALTER TABLE `table_data_csv_report`
  ADD PRIMARY KEY (`Asset_ID`);

--
-- Indexes for table `table_userdatainput`
--
ALTER TABLE `table_userdatainput`
  ADD PRIMARY KEY (`id_table_userDataInput`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users_table`
--
ALTER TABLE `users_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zone_table`
--
ALTER TABLE `zone_table`
  ADD PRIMARY KEY (`zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `app_home_banner`
--
ALTER TABLE `app_home_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `branch_table`
--
ALTER TABLE `branch_table`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company_table`
--
ALTER TABLE `company_table`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `csv_list`
--
ALTER TABLE `csv_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `data_csv_report_table`
--
ALTER TABLE `data_csv_report_table`
  MODIFY `auto_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_list`
--
ALTER TABLE `data_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `data_table_01`
--
ALTER TABLE `data_table_01`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `report_list`
--
ALTER TABLE `report_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `table_csv_01`
--
ALTER TABLE `table_csv_01`
  MODIFY `csv_id_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=846;

--
-- AUTO_INCREMENT for table `table_data_01`
--
ALTER TABLE `table_data_01`
  MODIFY `data_id_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1170;

--
-- AUTO_INCREMENT for table `table_data_csv`
--
ALTER TABLE `table_data_csv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1084;

--
-- AUTO_INCREMENT for table `table_userdatainput`
--
ALTER TABLE `table_userdatainput`
  MODIFY `id_table_userDataInput` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `users_table`
--
ALTER TABLE `users_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `zone_table`
--
ALTER TABLE `zone_table`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
