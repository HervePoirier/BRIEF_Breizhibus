-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8081
-- Generation Time: Mar 03, 2022 at 10:41 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `breizhibus`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `selection_ligne` (IN `input` VARCHAR(50))  NO SQL
SELECT arrets.nom, arrets.adresse
FROM arrets 
INNER JOIN arrets_lignes ON arrets.id_arret = arrets_lignes.id_arret
INNER JOIN lignes ON arrets_lignes.id_ligne = lignes.id_ligne
WHERE lignes.nom = input$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `arrets`
--

CREATE TABLE `arrets` (
  `id_arret` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `adresse` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `arrets`
--

INSERT INTO `arrets` (`id_arret`, `nom`, `adresse`) VALUES
(1, 'Korrigan', '1 impasse du Korrigan'),
(2, 'Morgana', '2 plage Morgana'),
(3, 'L\'Ankou', '3 place de l\'Ankou'),
(4, 'Ys', '4 rue de l\'île d\'Ys'),
(5, 'Viviane', '5 avenue de Viviane'),
(6, 'Guénolé', '6 rue Saint-Guénolé');

-- --------------------------------------------------------

--
-- Table structure for table `arrets_lignes`
--

CREATE TABLE `arrets_lignes` (
  `id_arret` int(11) NOT NULL,
  `id_ligne` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `arrets_lignes`
--

INSERT INTO `arrets_lignes` (`id_arret`, `id_ligne`) VALUES
(1, 1),
(2, 1),
(3, 1),
(2, 2),
(4, 2),
(6, 2),
(4, 3),
(5, 3),
(6, 3),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `id_bus` int(11) NOT NULL,
  `numero` varchar(4) NOT NULL,
  `immatriculation` varchar(9) NOT NULL,
  `nombre_place` int(11) NOT NULL,
  `id_ligne` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`id_bus`, `numero`, `immatriculation`, `nombre_place`, `id_ligne`) VALUES
(1, 'BB01', 'UM 642 RH', 20, 3),
(2, 'BB02', 'SK 369 WY', 30, 2),
(3, 'BB03', 'ER 916 BI', 20, 3),
(4, 'BB04', 'CA 852 RI', 30, 1),
(5, 'BB05', 'FRR 45 YT', 30, 3),
(6, 'BB06', 'FE 857 TO', 50, 1),
(7, 'BB07', 'DE 456 TE', 70, 2),
(11, 'BB08', 'GT 609 LT', 69, 1),
(12, 'BB09', 'KH 938 SK', 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `lignes`
--

CREATE TABLE `lignes` (
  `id_ligne` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lignes`
--

INSERT INTO `lignes` (`id_ligne`, `nom`) VALUES
(1, 'Rouge'),
(2, 'Vert'),
(3, 'Bleu');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `identifiant` varchar(50) NOT NULL,
  `mdp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `identifiant`, `mdp`) VALUES
(1, 'franky_tanguy', 'franky'),
(2, 'herve_poirier', 'herve'),
(3, 'fabio_cassiano', 'fabio');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arrets`
--
ALTER TABLE `arrets`
  ADD PRIMARY KEY (`id_arret`);

--
-- Indexes for table `arrets_lignes`
--
ALTER TABLE `arrets_lignes`
  ADD KEY `id_arret` (`id_arret`),
  ADD KEY `id_ligne` (`id_ligne`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id_bus`),
  ADD KEY `id_ligne` (`id_ligne`);

--
-- Indexes for table `lignes`
--
ALTER TABLE `lignes`
  ADD PRIMARY KEY (`id_ligne`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `arrets`
--
ALTER TABLE `arrets`
  MODIFY `id_arret` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `id_bus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `lignes`
--
ALTER TABLE `lignes`
  MODIFY `id_ligne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arrets_lignes`
--
ALTER TABLE `arrets_lignes`
  ADD CONSTRAINT `arrets_lignes_ibfk_1` FOREIGN KEY (`id_arret`) REFERENCES `arrets` (`id_arret`),
  ADD CONSTRAINT `arrets_lignes_ibfk_2` FOREIGN KEY (`id_ligne`) REFERENCES `lignes` (`id_ligne`);

--
-- Constraints for table `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`id_ligne`) REFERENCES `lignes` (`id_ligne`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
