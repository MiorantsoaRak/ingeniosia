-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 13 juil. 2021 à 19:16
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `test-ingenosya`
--

-- --------------------------------------------------------

--
-- Structure de la table `code_postal`
--

DROP TABLE IF EXISTS `code_postal`;
CREATE TABLE IF NOT EXISTS `code_postal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `code_postal`
--

INSERT INTO `code_postal` (`id`, `code`) VALUES
(1, 100),
(5, 200),
(6, 300),
(9, 600);

-- --------------------------------------------------------

--
-- Structure de la table `dirigeant`
--

DROP TABLE IF EXISTS `dirigeant`;
CREATE TABLE IF NOT EXISTS `dirigeant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexe` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `dirigeant`
--

INSERT INTO `dirigeant` (`id`, `nom_prenom`, `sexe`, `email`) VALUES
(2, 'Miorantsoa Rakotozafy', 'Homme', 'miorantsoarak@gmail.com'),
(3, 'Randrianasolo Jean', 'Homme', 'admin@phaelflor.com');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210713090003', '2021-07-13 09:00:34', 1998),
('DoctrineMigrations\\Version20210713091648', '2021-07-13 09:16:58', 1123),
('DoctrineMigrations\\Version20210713111605', '2021-07-13 11:16:13', 1961),
('DoctrineMigrations\\Version20210713121056', '2021-07-13 12:11:07', 1366);

-- --------------------------------------------------------

--
-- Structure de la table `societe`
--

DROP TABLE IF EXISTS `societe`;
CREATE TABLE IF NOT EXISTS `societe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ville_id` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `code_postal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_19653DBDA73F0036` (`ville_id`),
  KEY `IDX_19653DBDB2B59251` (`code_postal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `societe`
--

INSERT INTO `societe` (`id`, `ville_id`, `nom`, `description`, `code_postal_id`) VALUES
(1, 5, 'Nivo', 'Lorem ipsum', 6),
(2, 1, 'Actiflora', 'This is a description', 1);

-- --------------------------------------------------------

--
-- Structure de la table `societe_type_societe`
--

DROP TABLE IF EXISTS `societe_type_societe`;
CREATE TABLE IF NOT EXISTS `societe_type_societe` (
  `societe_id` int(11) NOT NULL,
  `type_societe_id` int(11) NOT NULL,
  PRIMARY KEY (`societe_id`,`type_societe_id`),
  KEY `IDX_FB9E3F15FCF77503` (`societe_id`),
  KEY `IDX_FB9E3F15E1F4A326` (`type_societe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `societe_type_societe`
--

INSERT INTO `societe_type_societe` (`societe_id`, `type_societe_id`) VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `type_societe`
--

DROP TABLE IF EXISTS `type_societe`;
CREATE TABLE IF NOT EXISTS `type_societe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type_societe`
--

INSERT INTO `type_societe` (`id`, `label`, `description`) VALUES
(1, 'SARL', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(2, 'EURL', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(3, 'SELARL', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(4, 'SA', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(5, 'SAS', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(6, 'SASU', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(7, 'SNC', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(8, 'SCP', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_43C3D9C327DAFE17` (`code_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`id`, `code_id`, `nom`) VALUES
(1, 1, 'Antananarivo'),
(2, 1, 'Andoharanofotsy'),
(3, 1, 'Ivato'),
(4, 1, 'Tanjombato'),
(5, 6, 'Fianarantsoa'),
(6, 6, 'Ambositra'),
(7, 1, 'Antsirabe'),
(8, 9, 'Tolear'),
(9, 9, 'Ambovombe'),
(10, 9, 'Fort-Dauphin'),
(11, 6, 'Vohiposa');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `societe`
--
ALTER TABLE `societe`
  ADD CONSTRAINT `FK_19653DBDA73F0036` FOREIGN KEY (`ville_id`) REFERENCES `ville` (`id`),
  ADD CONSTRAINT `FK_19653DBDB2B59251` FOREIGN KEY (`code_postal_id`) REFERENCES `code_postal` (`id`);

--
-- Contraintes pour la table `societe_type_societe`
--
ALTER TABLE `societe_type_societe`
  ADD CONSTRAINT `FK_FB9E3F15E1F4A326` FOREIGN KEY (`type_societe_id`) REFERENCES `type_societe` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_FB9E3F15FCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `ville`
--
ALTER TABLE `ville`
  ADD CONSTRAINT `FK_43C3D9C327DAFE17` FOREIGN KEY (`code_id`) REFERENCES `code_postal` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
