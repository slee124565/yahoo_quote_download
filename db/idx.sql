-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2017 at 12:01 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `woostock`
--

-- --------------------------------------------------------

--
-- Table structure for table `idx`
--

CREATE TABLE IF NOT EXISTS `idx` (
  `Index_ID` varchar(10) NOT NULL,
  `Index_Name` varchar(50) NOT NULL,
  `CountryName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `idx`
--

INSERT INTO `idx` (`Index_ID`, `Index_Name`, `CountryName`) VALUES
('^TWII', 'TSEC weighted index', 'Taiwan'),
('^TFNI', 'TSEC finance subindex', 'Taiwan'),
('^TPLI', 'TSEC plastics subindex', 'Taiwan'),
('^TFII', 'TSEC foods subindex', 'Taiwan'),
('^TEII', 'TSEC electrical subindex', 'Taiwan'),
('^DJI', 'Dow Jones', 'United States'),
('^GSPC', 'S&P 500', 'United States'),
('^OEX', 'S&P 100', 'United States'),
('^MID', 'S&P MID CAP 400 INDEX', 'United States'),
('^IXIC', 'NASDAQ', 'United States'),
('^NDX', 'NASDAQ 100', 'United States'),
('^BANK', 'NASDAQ Bank', 'United States'),
('^NBI', 'NASDAQ Biotechnology', 'United States'),
('^IXCO', 'NASDAQ Computer', 'United States'),
('^INDS', 'NASDAQ Industrial', 'United States'),
('^INSR', 'NASDAQ Insurance', 'United States'),
('^TRAN', 'NASDAQ Transportation', 'United States'),
('^NYA', 'NYSE COMPOSITE', 'United States'),
('^RUA', 'Russell 3000', 'United States'),
('^RUT', 'Russell 2000', 'United States'),
('^RUI', 'Russell 1000', 'United States'),
('^SOX', 'PHLX Semiconductor', 'United States'),
('^FTSE', 'FTSE 100', 'United Kingdom'),
('^GDAXI', 'DAX', 'Germany'),
('^FCHI', 'CAC 40', 'France'),
('^STOXX50E', 'ESTX50 EUR P', 'Europe'),
('^ATX', 'ATX', 'Austria'),
('^SSMI', 'Swiss Market', 'Switzerland'),
('^OSEAX', 'OSE All Share', 'Norway'),
('^SMSI', 'Madrid General', 'Spain'),
('^BFX', 'BEL-20', 'Belgium'),
('^MXX', 'IPC', 'Mexico'),
('^GSPTSE', 'S&P/TSX Composite index', 'Canada'),
('^BVSP', 'IBOVESPA', 'Brazil'),
('^SSEC', 'Shanghai Composite', 'China'),
('^SZSC', '深證成指', 'China'),
('^SZSA', '深證A指', 'China'),
('^SZSB', '深證B指', 'China'),
('^N225', 'Nikkei 225', 'Japan'),
('^HSI', 'Hang Seng', 'Hong Kong'),
('^AORD', 'ALL ORDINARIES', 'Australia'),
('^NZ50', 'NZX 50 INDEX GROSS', 'New Zealand'),
('^STI', 'STRAITS TIMES INDEX', 'Singapore'),
('^KS11', 'KOSPI Composite Index', 'South Korea'),
('^KLSE', 'FTSE Bursa Malaysia KLCI', 'Malaysia'),
('^JKSE', 'Composite Index', 'Indonesia'),
('^BSESN', 'S&P BSE SENSEX', 'India');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
