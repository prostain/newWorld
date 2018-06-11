-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 07, 2018 at 01:16 PM
-- Server version: 10.2.15-MariaDB
-- PHP Version: 7.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u747752631_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `choixPointsAchat`
--

CREATE TABLE `choixPointsAchat` (
  `idPoint` int(11) NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `choixPointsAchat`
--

INSERT INTO `choixPointsAchat` (`idPoint`, `idUser`) VALUES
(1, 45),
(2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `choixPointsLivraison`
--

CREATE TABLE `choixPointsLivraison` (
  `idPoint` int(11) NOT NULL,
  `idProducteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `choixPointsLivraison`
--

INSERT INTO `choixPointsLivraison` (`idPoint`, `idProducteur`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE `commande` (
  `idCommande` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idPoint` int(11) NOT NULL,
  `dateCreation` datetime DEFAULT current_timestamp(),
  `dateHeureLivraisonPrevuee` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `control`
--

CREATE TABLE `control` (
  `idControl` int(11) NOT NULL,
  `dateControl` datetime DEFAULT NULL,
  `idTesteur` int(11) NOT NULL,
  `idProducteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

CREATE TABLE `employer` (
  `idEmployer` int(11) NOT NULL,
  `login` varchar(28) DEFAULT NULL,
  `mdpEmployer` varchar(28) DEFAULT NULL,
  `nomEmployer` varchar(28) DEFAULT NULL,
  `prenomEmployer` varchar(28) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employer`
--

INSERT INTO `employer` (`idEmployer`, `login`, `mdpEmployer`, `nomEmployer`, `prenomEmployer`) VALUES
(1, 'vergniez', 'pierre', NULL, NULL),
(2, 'courtial', 'kevin', NULL, NULL),
(3, 'rostain', 'peterson', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gerant`
--

CREATE TABLE `gerant` (
  `idPoint` int(11) NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gerant`
--

INSERT INTO `gerant` (`idPoint`, `idUser`) VALUES
(1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `jourDansSemaine`
--

CREATE TABLE `jourDansSemaine` (
  `idJour` int(11) NOT NULL,
  `nomJour` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jourDansSemaine`
--

INSERT INTO `jourDansSemaine` (`idJour`, `nomJour`) VALUES
(1, 'lundi'),
(2, 'mardi'),
(3, 'mercredi'),
(4, 'jeudi'),
(5, 'vendredi'),
(6, 'samedi'),
(7, 'dimanche');

-- --------------------------------------------------------

--
-- Table structure for table `ligneDeCde`
--

CREATE TABLE `ligneDeCde` (
  `idCommande` int(11) NOT NULL,
  `idLot` int(11) NOT NULL,
  `quantiteCommandee` int(11) DEFAULT NULL,
  `livreeParProducteur` tinyint(1) DEFAULT NULL,
  `etatLDC` enum('en préparation','livraison en cours','au point de vente','annulée','recupéré') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `livraison`
--

CREATE TABLE `livraison` (
  `idLivraison` int(11) NOT NULL,
  `dateLivraison` datetime DEFAULT NULL,
  `idProducteur` int(11) NOT NULL,
  `idPoint` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `livraison`
--

INSERT INTO `livraison` (`idLivraison`, `dateLivraison`, `idProducteur`, `idPoint`) VALUES
(1, '2018-03-27 09:30:00', 1, 1),
(2, '2018-03-27 09:00:00', 1, 1),
(3, '2018-04-03 09:30:00', 1, 1),
(4, '2018-04-03 09:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lot`
--

CREATE TABLE `lot` (
  `idLot` int(11) NOT NULL,
  `descLot` varchar(100) DEFAULT NULL,
  `prix` float DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `dateLimite` date DEFAULT NULL,
  `dateRecolte` date DEFAULT NULL,
  `idUnite` int(11) NOT NULL,
  `idVariete` int(11) NOT NULL,
  `idProducteur` int(11) NOT NULL,
  `idParcelle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lot`
--

INSERT INTO `lot` (`idLot`, `descLot`, `prix`, `quantite`, `dateLimite`, `dateRecolte`, `idUnite`, `idVariete`, `idProducteur`, `idParcelle`) VALUES
(1, 'lot de pomme reinette grise', 1.89, 30, '2018-06-20', '2018-03-26', 1, 2, 1, 1),
(2, 'lot de golden', 1.5, 150, '2018-05-29', '2018-03-26', 1, 1, 1, 2),
(3, 'Test lot n°1 via formulaire d\'ajout d\'un lot', 2.35, 10, '2018-06-18', '2018-05-18', 1, 3, 1, 2),
(4, 'lot de poire concorde', 1.49, 35, '2018-07-01', '2018-06-10', 1, 4, 1, 1),
(5, 'lot de poire concorde bio', 1.99, 20, '2018-06-30', '2018-06-05', 1, 4, 1, 3),
(6, 'lot de poire williams', 1.19, 45, '2018-07-01', '2018-06-10', 1, 5, 1, 2),
(7, 'lot de raisins primas', 2.5, 25, '2018-06-30', '2018-06-01', 1, 6, 1, 1),
(8, 'lot de raisins oras', 2.39, 20, '2018-06-30', '2018-06-01', 1, 7, 1, 4),
(9, 'lot d\'orange valencia late bio', 1.99, 15, '2018-06-25', '2018-06-01', 1, 8, 1, 3),
(10, 'lot de Pamplemousse ruby red', 2.25, 32, '2018-07-02', '2018-06-05', 1, 9, 1, 1),
(11, 'Pièce de Rumsteck 150g', 3.9, 10, '2018-06-30', '2018-06-01', 5, 10, 1, 1),
(12, 'Pièce de Tournedos 150g', 2.9, 10, '2018-06-30', '2018-06-01', 5, 11, 1, 1),
(13, 'Pièce de filet de saumon 150g', 4.9, 10, '2018-06-30', '2018-06-01', 5, 12, 1, 1),
(14, 'Sachet de galette de riz (10x25g) 250g', 1.89, 50, '2019-12-01', '2018-01-01', 7, 13, 1, 2),
(15, 'Sachet de noix de pecan 100g', 2.5, 10, '2019-12-01', '2018-01-01', 7, 14, 1, 2),
(16, 'Sachet de noix de cajoux 100g', 2.99, 10, '2019-12-01', '2018-01-01', 7, 15, 1, 2),
(17, 'Fromage de brebis pièce 100g', 3.5, 20, '2018-10-01', '2018-06-00', 4, 16, 1, 4),
(18, 'Jus de Pomme multi variété', 1.99, 20, '2018-08-01', '2018-06-01', 3, 17, 1, 2),
(19, 'Jus d\'orange bio sans pulpe', 2.1, 10, '2019-12-01', '2018-01-01', 3, 18, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `modeProduction`
--

CREATE TABLE `modeProduction` (
  `idProduction` int(11) NOT NULL,
  `modeProduction` varchar(25) DEFAULT NULL,
  `descModeProduction` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modeProduction`
--

INSERT INTO `modeProduction` (`idProduction`, `modeProduction`, `descModeProduction`) VALUES
(1, 'Agriculture conventionnel', 'Fortement mécanisée, cette agriculture tend à atteindre un rendement maximum des cultures'),
(2, 'Agriculture raisonnée', 'Forme d’agriculture qui correspond à des démarches globales de gestion d’exploitation qui visent, au-delà du respect de la réglementation, à renforcer les impacts positifs des pratiques agricoles sur '),
(3, 'Agriculture durable', 'Forme d’agriculture qui concilie des pratiques respectueuses de l’environnement et des préoccupations économiques. La fertilisation est pratiquée au plus juste. '),
(4, 'Agriculture biologique', 'Forme d’agriculture qui rejette totalement l\'emploi de produit chimique de synthèse. La culture d’Organisme Génétiquement Modifié (0,OGM) est proscrite. '),
(5, 'Agriculture conventionnel', 'Fortement mécanisée, cette agriculture tend à atteindre un rendement maximum des cultures'),
(6, 'Agriculture raisonnée', 'Forme d’agriculture qui correspond à des démarches globales de gestion d’exploitation qui visent, au-delà du respect de la réglementation, à renforcer les impacts positifs des pratiques agricoles sur '),
(7, 'Agriculture durable', 'Forme d’agriculture qui concilie des pratiques respectueuses de l’environnement et des préoccupations économiques. La fertilisation est pratiquée au plus juste. '),
(8, 'Agriculture biologique', 'Forme d’agriculture qui rejette totalement l\'emploi de produit chimique de synthèse. La culture d’Organisme Génétiquement Modifié (0,OGM) est proscrite. ');

-- --------------------------------------------------------

--
-- Table structure for table `ouverture`
--

CREATE TABLE `ouverture` (
  `idPoint` int(11) NOT NULL,
  `idJour` int(11) NOT NULL,
  `heureOuvertureMatin` time DEFAULT NULL,
  `heureFermetureMatin` time DEFAULT NULL,
  `heureOuvertureApresMidi` time DEFAULT NULL,
  `heureFermetureApresMidi` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ouverture`
--

INSERT INTO `ouverture` (`idPoint`, `idJour`, `heureOuvertureMatin`, `heureFermetureMatin`, `heureOuvertureApresMidi`, `heureFermetureApresMidi`) VALUES
(1, 1, '09:00:00', '12:00:00', '14:00:00', '18:00:00'),
(1, 2, '09:00:00', '12:00:00', '14:00:00', '18:00:00'),
(1, 3, '09:00:00', '12:00:00', '14:00:00', '18:00:00'),
(1, 4, '09:00:00', '12:00:00', '14:00:00', '18:00:00'),
(1, 5, '09:00:00', '12:00:00', '14:00:00', '18:00:00'),
(2, 1, '09:00:00', '12:00:00', '14:00:00', '18:00:00'),
(2, 2, '09:00:00', '12:00:00', '14:00:00', '18:00:00'),
(2, 3, '09:00:00', '12:00:00', '14:00:00', '18:00:00'),
(2, 4, '09:00:00', '12:00:00', '14:00:00', '18:00:00'),
(2, 5, '09:00:00', '12:00:00', '14:00:00', '18:00:00'),
(3, 1, '09:00:00', '12:00:00', '14:00:00', '18:00:00'),
(3, 2, '09:00:00', '12:00:00', '14:00:00', '18:00:00'),
(3, 3, '09:00:00', '12:00:00', '14:00:00', '18:00:00'),
(3, 4, '09:00:00', '12:00:00', '14:00:00', '18:00:00'),
(3, 5, '09:00:00', '12:00:00', '14:00:00', '18:00:00'),
(4, 1, '09:00:00', '12:00:00', '14:00:00', '18:00:00'),
(4, 2, '09:00:00', '12:00:00', '14:00:00', '18:00:00'),
(4, 3, '09:00:00', '12:00:00', '14:00:00', '18:00:00'),
(4, 4, '09:00:00', '12:00:00', '14:00:00', '18:00:00'),
(4, 5, '09:00:00', '12:00:00', '14:00:00', '18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `parametre`
--

CREATE TABLE `parametre` (
  `idParametre` int(11) NOT NULL,
  `libelleParametre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `valueParametre` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `parametre`
--

INSERT INTO `parametre` (`idParametre`, `libelleParametre`, `valueParametre`) VALUES
(1, 'nbArticleParPage', '25'),
(2, 'email_serviceCommunication', 'peterson.rostain@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `parcelles`
--

CREATE TABLE `parcelles` (
  `idParcelle` int(11) NOT NULL,
  `commune` varchar(25) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `photoParcelle` varchar(80) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `idProducteur` int(11) NOT NULL,
  `idProduction` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `parcelles`
--

INSERT INTO `parcelles` (`idParcelle`, `commune`, `latitude`, `photoParcelle`, `longitude`, `idProducteur`, `idProduction`) VALUES
(1, 'Gap', NULL, NULL, NULL, 1, 1),
(2, 'Veyne', NULL, NULL, NULL, 1, 2),
(3, 'ChampVille', NULL, NULL, NULL, 1, 4),
(4, 'ChampVille', NULL, NULL, NULL, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pointDeVente`
--

CREATE TABLE `pointDeVente` (
  `idPoint` int(11) NOT NULL,
  `ruePoint` varchar(25) DEFAULT NULL,
  `cpPoint` varchar(5) DEFAULT NULL,
  `villePoint` varchar(25) DEFAULT NULL,
  `nomPoint` varchar(20) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pointDeVente`
--

INSERT INTO `pointDeVente` (`idPoint`, `ruePoint`, `cpPoint`, `villePoint`, `nomPoint`, `latitude`, `longitude`) VALUES
(1, '1 Place Jean Marcellin', '05000', 'Gap', 'Gap', '44.5593347', '6.079711800000041'),
(2, 'Avenue du Commandant Dumo', '05400', 'Veynes', 'veynes', '44.5341025', '5.82534540000006'),
(3, '14 Rue de la République', '38000', 'Grenoble', 'Grenoble', '45.1901856', '5.730079100000012'),
(4, '23 Place Notre Dame', '80000', 'Amiens', 'Amiens', '49.8946601', '2.300804699999958');

-- --------------------------------------------------------

--
-- Table structure for table `producteur`
--

CREATE TABLE `producteur` (
  `idProducteur` int(11) NOT NULL,
  `entrepriseProducteur` varchar(25) DEFAULT NULL,
  `derniereVerif` date DEFAULT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producteur`
--

INSERT INTO `producteur` (`idProducteur`, `entrepriseProducteur`, `derniereVerif`, `idUser`) VALUES
(1, '', '2018-03-26', 45);

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `idProduit` int(11) NOT NULL,
  `libelleProduit` varchar(20) DEFAULT NULL,
  `photoProduit` varchar(20) DEFAULT NULL,
  `validiteProduit` tinyint(4) DEFAULT 0,
  `idRayon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`idProduit`, `libelleProduit`, `photoProduit`, `validiteProduit`, `idRayon`) VALUES
(1, 'Pomme', 'img/produit/pomme', 1, 1),
(2, 'Poire', 'img/produit/poire', 1, 1),
(3, 'Raisin', 'img/produit/raisin', 1, 1),
(4, 'Orange', 'img/produit/orange', 1, 1),
(5, 'Pamplemousse', 'img/produit/pamplemo', 1, 1),
(6, 'Boeuf', 'img/produit/steak', 1, 2),
(7, 'Saumon', 'img/produit/filet', 1, 2),
(8, 'Galette', 'img/produit/galette', 1, 3),
(9, 'Noix', 'img/produit/noix', 1, 3),
(10, 'Fromage', 'img/produit/fromage', 1, 4),
(11, 'Jus', 'img/produit/jus', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `proposerA`
--

CREATE TABLE `proposerA` (
  `idLot` int(11) NOT NULL,
  `idPoint` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `idQuestion` int(11) NOT NULL,
  `libelleQuestion` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`idQuestion`, `libelleQuestion`) VALUES
(1, 'Quelle est votre couleur '),
(2, 'Quelle est votre ville fa'),
(3, 'Quelle est votre équipe s'),
(4, 'Quelle était le nom de vo'),
(5, 'Quel est le nom de votre '),
(6, 'Quelle était le nom de vo'),
(7, 'Quelle est votre couleur '),
(8, 'Quelle est votre ville fa'),
(9, 'Quelle est votre équipe s'),
(10, 'Quelle était le nom de vo'),
(11, 'Quel est le nom de votre '),
(12, 'Quelle était le nom de vo');

-- --------------------------------------------------------

--
-- Table structure for table `questRep`
--

CREATE TABLE `questRep` (
  `reponse` varchar(200) DEFAULT NULL,
  `idUser` int(11) NOT NULL,
  `idQuestion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rayon`
--

CREATE TABLE `rayon` (
  `idRayon` int(11) NOT NULL,
  `libelleRayon` varchar(25) DEFAULT NULL,
  `photo` varchar(80) DEFAULT NULL,
  `DescRayon` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rayon`
--

INSERT INTO `rayon` (`idRayon`, `libelleRayon`, `photo`, `DescRayon`) VALUES
(1, 'Fruits et légumes', 'img/rayon/fruitLegume', ''),
(2, 'Viandes et poissons', 'img/rayon/viandePoisson', ''),
(3, 'Céréales', 'img/rayon/cereale', ''),
(4, 'Produits frais', 'img/rayon/produitFrais', ''),
(5, 'Boissons', 'img/rayon/boisson', '');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `idRole` int(11) NOT NULL,
  `libelleRole` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`idRole`, `libelleRole`) VALUES
(1, 'administrateur'),
(2, 'modérateur'),
(3, 'client'),
(4, 'producteur'),
(5, 'artisan');

-- --------------------------------------------------------

--
-- Table structure for table `testeur`
--

CREATE TABLE `testeur` (
  `idTesteur` int(11) NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `unite`
--

CREATE TABLE `unite` (
  `idUnite` int(11) NOT NULL,
  `libelleUnite` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unite`
--

INSERT INTO `unite` (`idUnite`, `libelleUnite`) VALUES
(1, 'kg'),
(2, 'g'),
(3, 'l'),
(4, 'cl'),
(5, 'u.'),
(6, 'kg'),
(7, 'g'),
(8, 'l'),
(9, 'cl'),
(10, 'u.');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idUser` int(11) NOT NULL,
  `username` varchar(25) DEFAULT NULL,
  `prenom` varchar(25) DEFAULT NULL,
  `nom` varchar(25) DEFAULT NULL,
  `dateIns` timestamp NULL DEFAULT current_timestamp(),
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `etatIns` tinyint(1) DEFAULT NULL,
  `ipUser` varchar(25) DEFAULT NULL,
  `nbConnect` int(11) DEFAULT NULL,
  `rue` varchar(25) DEFAULT NULL,
  `ville` varchar(25) DEFAULT NULL,
  `cp` varchar(25) DEFAULT NULL,
  `tel` varchar(10) DEFAULT NULL,
  `photoUser` varchar(80) DEFAULT NULL,
  `descUser` int(11) DEFAULT NULL,
  `dateNaissance` varchar(25) DEFAULT NULL,
  `validationCompte` tinyint(1) DEFAULT 0,
  `compteFacebook` varchar(80) DEFAULT NULL,
  `compteGoogle` varchar(80) DEFAULT NULL,
  `compteInstagram` varchar(80) DEFAULT NULL,
  `compteTweeter` varchar(80) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `idRole` int(11) DEFAULT NULL,
  `confirmKey` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`idUser`, `username`, `prenom`, `nom`, `dateIns`, `email`, `password`, `etatIns`, `ipUser`, `nbConnect`, `rue`, `ville`, `cp`, `tel`, `photoUser`, `descUser`, `dateNaissance`, `validationCompte`, `compteFacebook`, `compteGoogle`, `compteInstagram`, `compteTweeter`, `latitude`, `longitude`, `idRole`, `confirmKey`) VALUES
(8, NULL, 'Philippe', 'Rostain', '2018-05-30 17:27:05', 'le-colombier@gmail.com', '46f94c8de14fb36680850768ff1b7f2a', 0, '109.208.141.245', NULL, 'Chemin du Colombier', 'La Roche-des-Arnauds', '05400', '0608155749', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '44.56511', '5.958202', 3, '5633a617aba99c99c7d091ce499b8c48'),
(9, 'pvergnier', 'pierre', 'vergniez', '2018-03-27 14:19:00', 'p.vergniez@laposte.net', '*08F8F439977967B8968EF240132A69A745970D4F', 0, '109.208.130.145', NULL, '12 rue bon hotel', 'gap', '05000', '0666252940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'c72597a0890804436840653bb531d743'),
(45, 'jaltero', 'jérémy', 'altero', '2018-03-13 18:40:41', 'jeremy.altero@gmail.com', '46f94c8de14fb36680850768ff1b7f2a', 0, '109.208.130.147', NULL, 'Rue du Cheval Blanc', 'Gap', '05000', '0762880826', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '44.558', '6.07955', 4, 'c72597a0890804436840653bb531d743'),
(46, NULL, 'peterson', 'rostain', '2018-05-31 23:19:52', 'peterson.rostain@gmail.com', '46f94c8de14fb36680850768ff1b7f2a', 0, '109.208.141.245', NULL, 'Chemin du Colombier', 'La Roche-des-Arnauds', '05400', '0681605231', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '44.56511', '5.958202', 3, '847694a71faf762a35050b4b961e9322');

-- --------------------------------------------------------

--
-- Table structure for table `vacance`
--

CREATE TABLE `vacance` (
  `idVacance` int(11) NOT NULL,
  `dateDebut` datetime DEFAULT NULL,
  `dateFin` datetime DEFAULT NULL,
  `idPoint` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `variete`
--

CREATE TABLE `variete` (
  `idVariete` int(11) NOT NULL,
  `libelleVariete` varchar(25) DEFAULT NULL,
  `descVariete` varchar(500) DEFAULT NULL,
  `validiteVariete` int(11) DEFAULT 0,
  `photo` varchar(80) DEFAULT NULL,
  `idProduit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `variete`
--

INSERT INTO `variete` (`idVariete`, `libelleVariete`, `descVariete`, `validiteVariete`, `photo`, `idProduit`) VALUES
(1, 'Golden', '', 1, 'img/variete/golden.jpg', 1),
(2, 'Gala', '', 1, 'img/variete/gala.jpg', 1),
(3, 'Reinette grise', '', 1, 'img/variete/reinetteGrise.jpeg', 1),
(4, 'Concorde', '', 1, 'img/variete/concorde.jpg', 2),
(5, 'Williams', '', 1, 'img/variete/williams.jpg', 2),
(6, 'Prima', 'Raisins noirs', 1, 'img/variete/prima.jpeg', 3),
(7, 'Ora', 'Raisins blancs', 1, 'img/variete/ora.jpg', 3),
(8, 'Valencia Late', '', 1, 'img/variete/valenciaLate.jpg', 4),
(9, 'Ruby Red', 'Pamplemouse rose au goût naturellement sucré', 1, 'img/variete/rubeyRed.jpeg', 5),
(10, '(Rumsteck)', '', 1, 'img/variete/rumsteck.jpg', 6),
(11, '(Tournedos)', '', 1, 'img/variete/tournedos.jpg', 6),
(12, '(Filet)', '', 1, 'img/variete/filetSaumon.jpg', 7),
(13, 'de Riz', '', 1, 'img/variete/galetteRiz.jpg', 8),
(14, 'de Pecan', '', 1, 'img/variete/noixPecan.jpg', 9),
(15, 'de Cajoux', '', 1, 'img/variete/noixCajoux.jpeg', 9),
(16, 'de Brebis', '', 1, 'img/variete/fromageBrebis.jpeg', 10),
(17, 'de Pomme', '', 1, 'img/variete/jusPomme.jpg', 11),
(18, 'd\'Orange', '', 1, 'img/variete/jusOrange.jpg', 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `choixPointsAchat`
--
ALTER TABLE `choixPointsAchat`
  ADD PRIMARY KEY (`idPoint`,`idUser`);

--
-- Indexes for table `choixPointsLivraison`
--
ALTER TABLE `choixPointsLivraison`
  ADD PRIMARY KEY (`idPoint`,`idProducteur`);

--
-- Indexes for table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`idCommande`);

--
-- Indexes for table `control`
--
ALTER TABLE `control`
  ADD PRIMARY KEY (`idControl`);

--
-- Indexes for table `employer`
--
ALTER TABLE `employer`
  ADD PRIMARY KEY (`idEmployer`);

--
-- Indexes for table `gerant`
--
ALTER TABLE `gerant`
  ADD PRIMARY KEY (`idPoint`,`idUser`);

--
-- Indexes for table `jourDansSemaine`
--
ALTER TABLE `jourDansSemaine`
  ADD PRIMARY KEY (`idJour`);

--
-- Indexes for table `ligneDeCde`
--
ALTER TABLE `ligneDeCde`
  ADD PRIMARY KEY (`idCommande`,`idLot`);

--
-- Indexes for table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`idLivraison`);

--
-- Indexes for table `lot`
--
ALTER TABLE `lot`
  ADD PRIMARY KEY (`idLot`);

--
-- Indexes for table `modeProduction`
--
ALTER TABLE `modeProduction`
  ADD PRIMARY KEY (`idProduction`);

--
-- Indexes for table `ouverture`
--
ALTER TABLE `ouverture`
  ADD PRIMARY KEY (`idPoint`,`idJour`);

--
-- Indexes for table `parametre`
--
ALTER TABLE `parametre`
  ADD PRIMARY KEY (`idParametre`);

--
-- Indexes for table `parcelles`
--
ALTER TABLE `parcelles`
  ADD PRIMARY KEY (`idParcelle`);

--
-- Indexes for table `pointDeVente`
--
ALTER TABLE `pointDeVente`
  ADD PRIMARY KEY (`idPoint`);

--
-- Indexes for table `producteur`
--
ALTER TABLE `producteur`
  ADD PRIMARY KEY (`idProducteur`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`idProduit`);

--
-- Indexes for table `proposerA`
--
ALTER TABLE `proposerA`
  ADD PRIMARY KEY (`idLot`,`idPoint`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`idQuestion`);

--
-- Indexes for table `questRep`
--
ALTER TABLE `questRep`
  ADD PRIMARY KEY (`idUser`,`idQuestion`);

--
-- Indexes for table `rayon`
--
ALTER TABLE `rayon`
  ADD PRIMARY KEY (`idRayon`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`idRole`);

--
-- Indexes for table `testeur`
--
ALTER TABLE `testeur`
  ADD PRIMARY KEY (`idTesteur`);

--
-- Indexes for table `unite`
--
ALTER TABLE `unite`
  ADD PRIMARY KEY (`idUnite`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUser`);

--
-- Indexes for table `vacance`
--
ALTER TABLE `vacance`
  ADD PRIMARY KEY (`idVacance`);

--
-- Indexes for table `variete`
--
ALTER TABLE `variete`
  ADD PRIMARY KEY (`idVariete`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `choixPointsAchat`
--
ALTER TABLE `choixPointsAchat`
  ADD FOREIGN KEY (`idPoint`) REFERENCES `pointDeVente` (`idPoint`),
  ADD FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`idUser`);

--
-- Constraints for table `choixPointsLivraison`
--
ALTER TABLE `choixPointsLivraison`
  ADD FOREIGN KEY (`idPoint`) REFERENCES `pointDeVente` (`idPoint`),
  ADD FOREIGN KEY (`idProducteur`) REFERENCES `producteur` (`idProducteur`);

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`idUser`),
  ADD FOREIGN KEY (`idPoint`) REFERENCES `pointDeVente` (`idPoint`);

--
-- Constraints for table `control`
--
ALTER TABLE `control`
  ADD FOREIGN KEY (`idTesteur`) REFERENCES `testeur` (`idTesteur`),
  ADD FOREIGN KEY (`idProducteur`) REFERENCES `producteur` (`idProducteur`);

--
-- Constraints for table `gerant`
--
ALTER TABLE `gerant`
  ADD FOREIGN KEY (`idPoint`) REFERENCES `pointDeVente` (`idPoint`),
  ADD FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`idUser`);

--
-- Constraints for table `ligneDeCde`
--
ALTER TABLE `ligneDeCde`
  ADD FOREIGN KEY (`idLot`) REFERENCES `lot` (`idLot`),
  ADD FOREIGN KEY (`idCommande`) REFERENCES `commande` (`idCommande`);

--
-- Constraints for table `livraison`
--
ALTER TABLE `livraison`
  ADD FOREIGN KEY (`idProducteur`) REFERENCES `producteur` (`idProducteur`),
  ADD FOREIGN KEY (`idPoint`) REFERENCES `pointDeVente` (`idPoint`);

--
-- Constraints for table `lot`
--
ALTER TABLE `lot`
  ADD FOREIGN KEY (`idUnite`) REFERENCES `unite` (`idUnite`),
  ADD FOREIGN KEY (`idVariete`) REFERENCES `variete` (`idVariete`),
  ADD FOREIGN KEY (`idProducteur`) REFERENCES `producteur` (`idProducteur`),
  ADD FOREIGN KEY (`idParcelle`) REFERENCES `parcelles` (`idParcelle`);

--
-- Constraints for table `ouverture`
--
ALTER TABLE `ouverture`
  ADD FOREIGN KEY (`idPoint`) REFERENCES `pointDeVente` (`idPoint`),
  ADD FOREIGN KEY (`idJour`) REFERENCES `jourDansSemaine` (`idJour`);

--
-- Constraints for table `parcelles`
--
ALTER TABLE `parcelles`
  ADD FOREIGN KEY (`idProducteur`) REFERENCES `producteur` (`idProducteur`),
  ADD FOREIGN KEY (`idProduction`) REFERENCES `modeProduction` (`idProduction`);

--
-- Constraints for table `producteur`
--
ALTER TABLE `producteur`
  ADD FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`idUser`);

--
-- Constraints for table `produit`
--
ALTER TABLE `produit`
  ADD FOREIGN KEY (`idRayon`) REFERENCES `rayon` (`idRayon`);

--
-- Constraints for table `proposerA`
--
ALTER TABLE `proposerA`
  ADD FOREIGN KEY (`idLot`) REFERENCES `lot` (`idLot`),
  ADD FOREIGN KEY (`idPoint`) REFERENCES `pointDeVente` (`idPoint`);

--
-- Constraints for table `questRep`
--
ALTER TABLE `questRep`
  ADD FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`idUser`),
  ADD FOREIGN KEY (`idQuestion`) REFERENCES `question` (`idQuestion`);

--
-- Constraints for table `testeur`
--
ALTER TABLE `testeur`
  ADD FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`idUser`);

--
-- Constraints for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`);

--
-- Constraints for table `vacance`
--
ALTER TABLE `vacance`
  ADD FOREIGN KEY (`idPoint`) REFERENCES `pointDeVente` (`idPoint`);

--
-- Constraints for table `variete`
--
ALTER TABLE `variete`
  ADD FOREIGN KEY (`idProduit`) REFERENCES `produit` (`idProduit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
