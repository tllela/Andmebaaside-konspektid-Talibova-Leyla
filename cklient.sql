-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Mai 14, 2026 kell 10:40 EL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `cklient`
--

DELIMITER $$
--
-- Toimingud
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `lisaklient` (IN `uusNimi` VARCHAR(20), IN `uuslinn` VARCHAR(20), IN `uusvanus` INT, IN `uusraha` INT)   BEGIN 
    INSERT INTO klient(klientnimi, klientlinn, klientvanus, klientraha)
    VALUES(uusNimi, uuslinn, uusvanus, uusraha);
    SELECT * FROM klient;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `muuda` (IN `uuslinn` VARCHAR(20), IN `uuendaid` INT)   BEGIN
UPDATE klient
SET linn=uuslinn
WHERE klientid=uuendaid;
SELECT * FROM klient;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `nimi` (IN `klientnimi` VARCHAR(20))   BEGIN
     SELECT klientNimi FROM klient;
     SELECT klientlinn FROM klient;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `klient`
--

CREATE TABLE `klient` (
  `klientid` int(11) NOT NULL,
  `klientNimi` varchar(20) NOT NULL,
  `klientlinn` varchar(20) DEFAULT NULL,
  `klientvanus` int(11) DEFAULT NULL,
  `klientraha` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `klient`
--

INSERT INTO `klient` (`klientid`, `klientNimi`, `klientlinn`, `klientvanus`, `klientraha`) VALUES
(1, '', NULL, NULL, NULL),
(2, 'sasha', NULL, NULL, NULL),
(3, '', 'tallinn', NULL, NULL),
(4, '', 'tallinn', NULL, NULL),
(5, '', 'tallinn', NULL, NULL),
(6, '', 'tallinn', NULL, NULL),
(7, 'leyla', 'talliinn', 18, 1567.00),
(8, 'leyla12', 'tartu', 12, 2345.00);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`klientid`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `klient`
--
ALTER TABLE `klient`
  MODIFY `klientid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
