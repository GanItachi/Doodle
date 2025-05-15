-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 15 mai 2025 à 12:07
-- Version du serveur : 11.5.2-MariaDB-log
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `doodle_new`
--

-- --------------------------------------------------------

--
-- Structure de la table `acceuil_evaluation`
--

CREATE TABLE `acceuil_evaluation` (
  `id` bigint(20) NOT NULL,
  `note` int(11) NOT NULL,
  `commentaire` longtext DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `cours_id` bigint(20) NOT NULL,
  `etudiant_id` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_permission`
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
(25, 'Can add evaluation', 7, 'add_evaluation'),
(26, 'Can change evaluation', 7, 'change_evaluation'),
(27, 'Can delete evaluation', 7, 'delete_evaluation'),
(28, 'Can view evaluation', 7, 'view_evaluation'),
(29, 'Can add etudiants', 8, 'add_etudiants'),
(30, 'Can change etudiants', 8, 'change_etudiants'),
(31, 'Can delete etudiants', 8, 'delete_etudiants'),
(32, 'Can view etudiants', 8, 'view_etudiants'),
(33, 'Can add cours', 9, 'add_cours'),
(34, 'Can change cours', 9, 'change_cours'),
(35, 'Can delete cours', 9, 'delete_cours'),
(36, 'Can view cours', 9, 'view_cours'),
(37, 'Can add ressource', 10, 'add_ressource'),
(38, 'Can change ressource', 10, 'change_ressource'),
(39, 'Can delete ressource', 10, 'delete_ressource'),
(40, 'Can view ressource', 10, 'view_ressource'),
(41, 'Can add postulation', 11, 'add_postulation'),
(42, 'Can change postulation', 11, 'change_postulation'),
(43, 'Can delete postulation', 11, 'delete_postulation'),
(44, 'Can view postulation', 11, 'view_postulation'),
(45, 'Can add classe', 12, 'add_classe'),
(46, 'Can change classe', 12, 'change_classe'),
(47, 'Can delete classe', 12, 'delete_classe'),
(48, 'Can view classe', 12, 'view_classe'),
(49, 'Can add login', 13, 'add_login'),
(50, 'Can change login', 13, 'change_login'),
(51, 'Can delete login', 13, 'delete_login'),
(52, 'Can view login', 13, 'view_login'),
(53, 'Can add login p', 14, 'add_loginp'),
(54, 'Can change login p', 14, 'change_loginp'),
(55, 'Can delete login p', 14, 'delete_loginp'),
(56, 'Can view login p', 14, 'view_loginp'),
(57, 'Can add professeurs', 15, 'add_professeurs'),
(58, 'Can change professeurs', 15, 'change_professeurs'),
(59, 'Can delete professeurs', 15, 'delete_professeurs'),
(60, 'Can view professeurs', 15, 'view_professeurs'),
(61, 'Can add message', 16, 'add_message'),
(62, 'Can change message', 16, 'change_message'),
(63, 'Can delete message', 16, 'delete_message'),
(64, 'Can view message', 16, 'view_message');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$IuqcWXEya7d9KWNJg8oxGL$y633Jv+V/QCpa2wcJ+8MnUTXYEifcyeq2A3THM7seb0=', '2025-05-15 01:16:26.684365', 0, 'Moussa@ensea.ed.ci', ' Richard \r', 'Moussa ', 'Moussa@ensea.ed.ci', 0, 1, '2025-05-15 00:09:04.383695'),
(2, 'pbkdf2_sha256$720000$aZxAzylPvvgdsSIn1RGNwx$xEw6MAoW8WcyfPfKF5y7vXkngJ8N85LS3kkv4upUKUA=', '2025-05-15 09:19:15.739981', 0, 'Kouame@ensea.ed.ci', ' Dares\r', 'Kouame ', 'Kouame@ensea.ed.ci', 0, 1, '2025-05-15 00:09:04.692337'),
(3, 'pbkdf2_sha256$720000$OBmpkj2PkLMyiDL8hTAFvJ$lto3V7KkVJxO2Y/2jlIWwaKEXhJyuNUTUejEqlTrZ0Y=', '2025-05-15 00:09:04.988121', 0, 'Kouadio@ensea.ed.ci', ' Alice\r', 'Kouadio ', 'Kouadio@ensea.ed.ci', 0, 1, '2025-05-15 00:09:04.988121'),
(4, 'pbkdf2_sha256$720000$atebrfSM0l055fgPrG3XpO$/5p/bKA7QXg04u+Be+8w9Y0yeqmO1c4OaK8vibAZtAQ=', '2025-05-15 00:09:05.282771', 0, 'Gbenro@ensea.ed.ci', ' Nathanael\r', 'Gbenro ', 'Gbenro@ensea.ed.ci', 0, 1, '2025-05-15 00:09:05.282771'),
(5, 'pbkdf2_sha256$720000$BlmTrlVxzbMoJfEqMtMGZ3$3Lv3cvK3M5cm/4Xxork2X5JR1QX3pN4B9aroyPWmEmU=', '2025-05-15 09:16:17.902897', 1, 'Bobet@ensea.ed.ci', ' Goualo Victorien\r', 'Bobet ', 'Bobet@ensea.ed.ci', 0, 1, '2025-05-15 00:09:05.574238'),
(6, 'pbkdf2_sha256$720000$5LTX87JRIEbx3q1To5uons$OtK2Q2emnHBT1R/K3qk0w8DWFniW4RPGyrGSdH5IuXA=', '2025-05-15 00:09:05.859142', 0, 'Diomande@ensea.ed.ci', ' Syndou\r', 'Diomande ', 'Diomande@ensea.ed.ci', 0, 1, '2025-05-15 00:09:05.859142'),
(7, 'pbkdf2_sha256$720000$se0p9C8peWgbxfrzQUTnS0$MSVyb4vNJ1NF8bFLajrrhJJOCUjjjTC9A0YCPU0SE1w=', '2025-05-15 00:09:06.145041', 0, 'Zuri@ensea.ed.ci', ' Nkrumah\r', 'Zuri ', 'Zuri@ensea.ed.ci', 0, 1, '2025-05-15 00:09:06.145041'),
(8, 'pbkdf2_sha256$720000$BMzQnVAfxEvBJ6RtyDgnm9$W8RGhZqbunj+v2x4ybYh7CLoHmmBVWECtpn0IuO2CSw=', '2025-05-15 00:09:06.436788', 0, 'Kwame@ensea.ed.ci', ' Oduro\r', 'Kwame ', 'Kwame@ensea.ed.ci', 0, 1, '2025-05-15 00:09:06.436788'),
(9, 'pbkdf2_sha256$720000$jcW6ZaxZVhgPsLWW5Vvhdn$JE76tqbil1/qcHOYt78C1GWMvt23+VKFIIj23TYjgOw=', '2025-05-15 00:09:06.731408', 0, 'Amina@ensea.ed.ci', ' Diallo\r', 'Amina ', 'Amina@ensea.ed.ci', 0, 1, '2025-05-15 00:09:06.731408'),
(10, 'pbkdf2_sha256$720000$urrLDLtKch37qK7olEpkxP$pqwp7wMTWTOChssmdYY8gA4hlstrHe8Az9brFiBZsVo=', '2025-05-15 00:09:07.033469', 0, 'Fatou@ensea.ed.ci', ' Bamba\r', 'Fatou ', 'Fatou@ensea.ed.ci', 0, 1, '2025-05-15 00:09:07.033469'),
(11, 'pbkdf2_sha256$720000$GFedCDfI7M5VlakHVwMN8i$ajgIE/W70jpsB1y3egoi9s9a5pG9yJxma5LVShwY20Y=', '2025-05-15 00:09:07.324052', 0, 'Nia@ensea.ed.ci', ' Adebayo\r', 'Nia ', 'Nia@ensea.ed.ci', 0, 1, '2025-05-15 00:09:07.324052'),
(12, 'pbkdf2_sha256$720000$wO3WaZsfQJfxNit1vcMUUA$wkTwit5rkgjfmMFKLsWn0iR91hNFjEXJTSpLGYKYCWQ=', '2025-05-15 00:09:07.615313', 0, 'Kofi@ensea.ed.ci', ' Mensah\r', 'Kofi ', 'Kofi@ensea.ed.ci', 0, 1, '2025-05-15 00:09:07.615313'),
(13, 'pbkdf2_sha256$720000$e6bcShdamfkjzyib7gp3hF$1FjEd+6H7uFerPQdwrOeeOlqH3ubXQ/yA+FZre8iKdQ=', '2025-05-15 00:09:07.902797', 0, 'Chike@ensea.ed.ci', ' Obi\r', 'Chike ', 'Chike@ensea.ed.ci', 0, 1, '2025-05-15 00:09:07.903796'),
(14, 'pbkdf2_sha256$720000$c7RI3Vk8ewTy4ZywSh2Qkv$rHRCnId0UAlaKCdmXC6oAhddb3+nEW6lzi2duB0M6P8=', '2025-05-15 00:09:08.195800', 0, 'Asha@ensea.ed.ci', ' Moyo\r', 'Asha ', 'Asha@ensea.ed.ci', 0, 1, '2025-05-15 00:09:08.195800'),
(15, 'pbkdf2_sha256$720000$Xq518qM7GHzt5OqfwtQgNE$wU5yyleAxll+n+rdC/RwnnBbAF8yqWQKtpkR3ZE1bXs=', '2025-05-15 00:09:32.834471', 0, 'alexandriemonnier@sfr.fr', 'Victoire', 'Bousquet', 'alexandriemonnier@sfr.fr', 0, 1, '2025-05-15 00:09:32.834471'),
(16, 'pbkdf2_sha256$720000$lwfbPQGPmPxMlX2qxIuIAm$qGM0VBX9zbzIeKA4kbqaFB1FP4F2TeH7Nxkvh2W82iI=', '2025-05-15 00:09:33.410054', 0, 'alixledoux@gimenez.com', 'Corinne', 'Riou', 'alixledoux@gimenez.com', 0, 1, '2025-05-15 00:09:33.410214'),
(17, 'pbkdf2_sha256$720000$NBDoG6CX8sCzD5JQvC7l98$Jl0PIST4osXfE2x+XXRI8we9AoUUIY1Q8vdVzxW7ksk=', '2025-05-15 00:09:34.015361', 0, 'aubryvincent@noos.fr', 'Estelle', 'Leclercq', 'aubryvincent@noos.fr', 0, 1, '2025-05-15 00:09:34.015361'),
(18, 'pbkdf2_sha256$720000$25EK4H7VU47OFW0UDGhSbM$h6Gd7ScFdx58ITgIPsFDFnNNFaNAIPv+/5RSk5dJ7N0=', '2025-05-15 00:09:34.594572', 0, 'bazinmichelle@yahoo.fr', 'Éléonore', 'Bigot', 'bazinmichelle@yahoo.fr', 0, 1, '2025-05-15 00:09:34.594572'),
(19, 'pbkdf2_sha256$720000$ZoE0HNwptWK6GxEwa4ICI2$GomaslEovY0R4hwI4g26CJJVAJ1Kcl3tpqzQArFct3I=', '2025-05-15 00:09:35.168285', 0, 'boulangermaurice@moreno.com', 'Thérèse', 'Baron', 'boulangermaurice@moreno.com', 0, 1, '2025-05-15 00:09:35.168285'),
(20, 'pbkdf2_sha256$720000$qKQ0aeUZj1oDLAyPxbT5k0$4E9rnFOcDvg1icjGhraShBp9aQscO3xnpxOYLUo5lt8=', '2025-05-15 00:09:35.795947', 0, 'catherinegauthier@yahoo.fr', 'Henri', 'Couturier', 'catherinegauthier@yahoo.fr', 0, 1, '2025-05-15 00:09:35.795947'),
(21, 'pbkdf2_sha256$720000$K1LWGtKbliL3l2DDla2AUm$tuV+TDO7iTTgVFLlenJcUIgEc5rjnwueEfdxrOzlgGg=', '2025-05-15 00:09:36.369353', 0, 'charles98@wanadoo.fr', 'André', 'Gosselin', 'charles98@wanadoo.fr', 0, 1, '2025-05-15 00:09:36.369353'),
(22, 'pbkdf2_sha256$720000$V8M4e4uoNwRZ6X4Y4vqP0i$0z9knPZMzcJkovk3FKQIrlS00NKn3R+UvjwF+vYf/3k=', '2025-05-15 00:09:36.953895', 0, 'danielmoreau@aol.fr', 'Danielle', 'Pichon', 'danielmoreau@aol.fr', 0, 1, '2025-05-15 00:09:36.953895'),
(23, 'pbkdf2_sha256$720000$rf4yLlfQ1smDyMs8S9hK9a$iiG+r+VdOsDOaRmksXC6e8lql0aw+jB6X4O6dMJpPVk=', '2025-05-15 00:09:37.531656', 0, 'delahayechristophe@da-silva.com', 'Pascal', 'Hamon', 'delahayechristophe@da-silva.com', 0, 1, '2025-05-15 00:09:37.531656'),
(24, 'pbkdf2_sha256$720000$32Evq4qD08TR7OXPBzqjca$pOzllCev1bGoS0k79DK6JEnmhVciYpPpXxFJSAyf9gs=', '2025-05-15 00:09:38.109735', 0, 'dominique17@wanadoo.fr', 'Patrice', 'Jouve', 'dominique17@wanadoo.fr', 0, 1, '2025-05-15 00:09:38.109735'),
(25, 'pbkdf2_sha256$720000$Q1TmfWME1Jh2rpbW6iCEHl$xMYghuypkvs3H1X+oRc9UYBgLTddTz1i/CzAosWD4Mo=', '2025-05-15 09:53:47.150044', 0, 'evelyne37@orange.fr', 'Xavier', 'Maury', 'evelyne37@orange.fr', 0, 1, '2025-05-15 00:09:38.695578'),
(26, 'pbkdf2_sha256$720000$T8ZKQY2CsekOyBL86hMmT6$13OuSpOI9TlO9AX2Zv+TBWAjmjPZruaJeJ7PgNb2EQo=', '2025-05-15 00:09:39.271179', 0, 'evelyne91@outlook.fr', 'Annie', 'Germain', 'evelyne91@outlook.fr', 0, 1, '2025-05-15 00:09:39.271179'),
(27, 'pbkdf2_sha256$720000$spIKmybffaqlq0spW0poKB$AHMONt0s0GK8Z78Mog0kGRebRwn/0aBpKIZQIXPwxlM=', '2025-05-15 00:09:39.852841', 0, 'garnierdanielle@yahoo.fr', 'Gilbert', 'Antoine', 'garnierdanielle@yahoo.fr', 0, 1, '2025-05-15 00:09:39.852841'),
(28, 'pbkdf2_sha256$720000$p6oavhFHI0aDgagISugcyv$3OWSaPoabcD0/e+QIJ1Mid0NptPvOf9PhqHilpLTZAE=', '2025-05-15 00:09:40.439089', 0, 'guerinmathilde@rolland.com', 'Michel', 'Lenoir', 'guerinmathilde@rolland.com', 0, 1, '2025-05-15 00:09:40.439089'),
(29, 'pbkdf2_sha256$720000$ZxxT1DfgSNht9igXjx2g6P$uRSTI4xo8nUl1Cxrc8eA4UpoyQ3kFdYx3RIF5NPTaUI=', '2025-05-15 00:09:41.013560', 0, 'hmonnier@blanchard.fr', 'Brigitte', 'Lemoine', 'hmonnier@blanchard.fr', 0, 1, '2025-05-15 00:09:41.013560'),
(30, 'pbkdf2_sha256$720000$Ynh9h9zovhdj1lj0ueasAz$h6dskObsA8ltFpnybyvhwLtsLhqYNZzr0hsVX76WfU8=', '2025-05-15 00:09:41.580604', 0, 'hoareauedouard@club-internet.fr', 'Nathalie', 'Bertrand', 'hoareauedouard@club-internet.fr', 0, 1, '2025-05-15 00:09:41.580604'),
(31, 'pbkdf2_sha256$720000$yYTYarbnnKt6CMsTGhR1VW$jHtfrM1bwJZS6sm9u7aO510WT3kHEKyIYefwG709TaQ=', '2025-05-15 00:09:42.145339', 0, 'jacquelinegirard@yahoo.fr', 'Luc', 'Laporte', 'jacquelinegirard@yahoo.fr', 0, 1, '2025-05-15 00:09:42.145339'),
(32, 'pbkdf2_sha256$720000$HZYPouLQYeIPY1Pguo0K0g$66sWGi3Isy7SdfASFjJPZA18w+bWhBvsazJQdO8ZP3Y=', '2025-05-15 00:09:42.740300', 0, 'jourdanlaurence@club.fr', 'Hugo', 'Delorme', 'jourdanlaurence@club.fr', 0, 1, '2025-05-15 00:09:42.740300'),
(33, 'pbkdf2_sha256$720000$pfkBLeg5B6svGpWIvUZ8oB$nw+ta9PUIVr35cg2EMSbajWAabNgHqCb33aOyCeH09c=', '2025-05-15 00:09:43.313225', 0, 'kamelbouvet@yahoo.fr', 'Sylvie', 'Pascal', 'kamelbouvet@yahoo.fr', 0, 1, '2025-05-15 00:09:43.313225'),
(34, 'pbkdf2_sha256$720000$5XCQMOKxpNXRGICyIgze0q$XhDYdyyQe3uK5Uapo70UWc0Ik+EXdML0HbRDhXQ5B3E=', '2025-05-15 00:09:43.885495', 0, 'lucaschevallier@club.fr', 'Inès', 'Gomes', 'lucaschevallier@club.fr', 0, 1, '2025-05-15 00:09:43.885495'),
(35, 'pbkdf2_sha256$720000$vQX4vHhveI7jITTeS7JHNk$TY50ImNWdMCd7HQysZgoRg59Zf+19qfhgLM7soF14xw=', '2025-05-15 00:09:44.450601', 0, 'margauxollivier@aubry.fr', 'Patricia', 'Muller', 'margauxollivier@aubry.fr', 0, 1, '2025-05-15 00:09:44.450601'),
(36, 'pbkdf2_sha256$720000$RPjEISKV4xygq7jabDCmHj$qeWbK9jDZdgBH1QWFaB6h9mDifF0jxo5AzRKDyGHF9s=', '2025-05-15 00:09:45.027318', 0, 'pascal61@laposte.net', 'Yves', 'Lebon', 'pascal61@laposte.net', 0, 1, '2025-05-15 00:09:45.027318'),
(37, 'pbkdf2_sha256$720000$Mwnq3pUefjwyw6Xtmz8GpE$X5qFvlMAbFMKbI9oWh3rw4JeE/a5zk8rGg+44PyuH+Y=', '2025-05-15 00:09:45.617197', 0, 'patrick32@labbe.com', 'Frédéric', 'Riou', 'patrick32@labbe.com', 0, 1, '2025-05-15 00:09:45.617197'),
(38, 'pbkdf2_sha256$720000$i481Tasx3EyLOzoWkVrcmk$XOgVgpSKkcLF4Of5/oFAfa55h9NQTyuPLHa/Fn9ao6w=', '2025-05-15 00:09:46.204192', 0, 'pierre71@hotmail.fr', 'Roger', 'Remy', 'pierre71@hotmail.fr', 0, 1, '2025-05-15 00:09:46.204192'),
(39, 'pbkdf2_sha256$720000$TJLoqwV8igyjGbbF1QyRhI$LYiWnR+Qrd/TdloL1ZPPELowBbC6Xcw2o/QD5EFHnLU=', '2025-05-15 00:09:46.775953', 0, 'regis68@noos.fr', 'Christian', 'Fischer', 'regis68@noos.fr', 0, 1, '2025-05-15 00:09:46.775953'),
(40, 'pbkdf2_sha256$720000$KPfBknrqunP8SX8L4tdnX4$YpUC7mJ4quyf1/0L/EPPDWsdCiLBybC2MwhXW/nZ2To=', '2025-05-15 00:09:47.353656', 0, 'rocheelodie@yahoo.fr', 'Suzanne', 'Baron', 'rocheelodie@yahoo.fr', 0, 1, '2025-05-15 00:09:47.353656'),
(41, 'pbkdf2_sha256$720000$OsTh8lKBC63N5trNz48TZH$fmYF6UVZCburZyG949bG3mSORDJ/UAob5AFY5g6Tb1s=', '2025-05-15 00:09:47.911393', 0, 'rollandvalentine@gmail.com', 'Marianne', 'Vasseur', 'rollandvalentine@gmail.com', 0, 1, '2025-05-15 00:09:47.911393'),
(42, 'pbkdf2_sha256$720000$jBZzXcoV8v79lTzraKyJS4$McU5JQzzzaHRbTG/VrSJOh/hDBwzGEAAlm22nmL2blY=', '2025-05-15 00:09:48.493090', 0, 'suzanne02@noos.fr', 'Matthieu', 'Humbert', 'suzanne02@noos.fr', 0, 1, '2025-05-15 00:09:48.493090'),
(43, 'pbkdf2_sha256$720000$J6GOjl2VyBD0KyN1MoX1rT$qhIKX9hVWdSbxRCxrp+20j/3eM1na3/KAv6TgYmySQ0=', '2025-05-15 00:09:49.069950', 0, 'veronique92@free.fr', 'Madeleine', 'Marty', 'veronique92@free.fr', 0, 1, '2025-05-15 00:09:49.069950'),
(44, 'pbkdf2_sha256$720000$fGm0EHhTLdb0bk8g8Crvwg$r5+nA2xt4ZhTyQEH5oZ4DWyWocyZlaa0/HyzKdBXqQw=', '2025-05-15 00:09:49.643618', 0, 'zguillon@live.com', 'Paul', 'Joly', 'zguillon@live.com', 0, 1, '2025-05-15 00:09:49.643699'),
(45, 'pbkdf2_sha256$720000$XefQEWfMKKoGAr2Tc69r8a$wQo7zFEIembuKqA+GPt4hvlgKM7V7f68+zah7dk1WK4=', '2025-05-15 09:46:55.041609', 0, 'Itachi@gmail.com', 'Abdoulaye', 'Ganamé', 'Itachi@gmail.com', 0, 1, '2025-05-15 08:43:04.103145'),
(46, 'pbkdf2_sha256$720000$NMSZxWVWKTAWuTEX74eqAo$Uvo2m7hcr0XEpdbUU2fbLLjAGJCyHeZgwj4Wm3afLJE=', '2025-05-15 09:51:40.544221', 1, 'gan', '', '', 'abdoulayeidrissaganame@gmail.com', 1, 1, '2025-05-15 09:51:06.707015');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cours_classe`
--

CREATE TABLE `cours_classe` (
  `id` bigint(20) NOT NULL,
  `cours_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cours_classe`
--

INSERT INTO `cours_classe` (`id`, `cours_id`) VALUES
(1, 2),
(2, 16),
(3, 20);

-- --------------------------------------------------------

--
-- Structure de la table `cours_classe_etudiants`
--

CREATE TABLE `cours_classe_etudiants` (
  `id` bigint(20) NOT NULL,
  `classe_id` bigint(20) NOT NULL,
  `etudiants_id` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cours_classe_etudiants`
--

INSERT INTO `cours_classe_etudiants` (`id`, `classe_id`, `etudiants_id`) VALUES
(1, 1, 'evelyne37@orange.fr'),
(2, 2, 'patrick32@labbe.com'),
(3, 3, 'kamelbouvet@yahoo.fr');

-- --------------------------------------------------------

--
-- Structure de la table `cours_cours`
--

CREATE TABLE `cours_cours` (
  `id` bigint(20) NOT NULL,
  `titre` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `categorie` varchar(100) DEFAULT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date DEFAULT NULL,
  `nombre_heures` int(10) UNSIGNED DEFAULT NULL CHECK (`nombre_heures` >= 0),
  `niveau` varchar(50) DEFAULT NULL,
  `illustration` varchar(100) DEFAULT NULL,
  `actif` tinyint(1) NOT NULL,
  `date_ajout` datetime(6) NOT NULL,
  `professeur_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cours_cours`
--

INSERT INTO `cours_cours` (`id`, `titre`, `slug`, `description`, `categorie`, `date_debut`, `date_fin`, `nombre_heures`, `niveau`, `illustration`, `actif`, `date_ajout`, `professeur_id`) VALUES
(1, 'Econometrie des variables qualitatives', 'econometrie-des-variables-qualitatives', 'Ce cours explore les methodes econometriques appliquees aux variables qualitatives, telles que les modèles logit et probit, et leur utilisation dans l’analyse des donnees categorielles.', 'Général', '2024-10-28', '2025-01-20', 20, 'Licence 3', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 1),
(2, 'Traitement des donnees', 'traitement-des-donnees', 'Ce cours couvre les techniques de traitement et de manipulation des donnees...', 'Général', '2025-03-31', '2025-04-06', 15, 'Licence 1', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 2),
(3, 'Organisation et Management des services statistiques', 'organisation-et-management-des-services-statistiqu', 'Ce cours aborde les principes de gestion...', 'Général', '2025-03-28', '2025-04-04', 18, 'Licence 3', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 3),
(4, 'Econometrie des series temporelles', 'econometrie-des-series-temporelles', 'Ce cours traite des techniques econometriques...', 'Général', '2024-12-01', '2025-03-15', 22, 'Licence 1', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 4),
(5, 'Programmation web', 'programmation-web', 'Ce cours introduit les concepts fondamentaux...', 'Général', '2024-11-12', '2025-02-18', 25, 'Licence 1', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 5),
(6, 'Archivage et diffusion', 'archivage-et-diffusion', 'Ce cours couvre les pratiques et technologies d’archivage...', 'Général', '2025-01-09', '2025-04-22', 12, 'Licence 3', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 6),
(7, 'Ethique, qualite et securite des donnees', 'ethique-qualite-et-securite-des-donnees', 'Ce cours examine les enjeux ethiques...', 'Général', '2024-11-14', '2025-01-28', 15, 'Licence 3', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 7),
(8, 'Pratique des enquetes 3 : Traitement des donnees', 'pratique-des-enquetes-3-traitement-des-donnees', 'Ce cours pratique se concentre sur les techniques de traitement...', 'Général', '2025-06-27', '2025-07-27', 20, 'Licence 3', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 8),
(9, 'Programmation (Python)', 'programmation-python', 'Ce cours enseigne les bases de la programmation en Python...', 'Général', '2024-10-05', '2025-01-05', 18, 'Licence 3', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 9),
(10, 'Bases de donnees - Programmation WEB', 'bases-de-donnees-programmation-web', 'Ce cours couvre les concepts de base des bases de donnees...', 'Général', '2024-11-12', '2025-02-12', 20, 'Licence 3', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 10),
(11, 'Data Mining', 'data-mining', 'Ce cours explore les techniques de data mining...', 'Général', '2024-09-23', '2024-12-23', 22, 'Licence 3', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 11),
(12, 'Data Visualisation', 'data-visualisation', 'Ce cours enseigne les principes et outils de visualisation...', 'Général', '2024-11-14', '2025-02-14', 20, 'Licence 1', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 12),
(13, 'Techniques de Redaction Scientifique', 'techniques-de-redaction-scientifique', 'Ce cours offre des conseils pratiques pour la redaction scientifique...', 'Général', '2025-03-28', '2025-05-09', 18, 'Licence 1', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 13),
(14, 'Anglais 5', 'anglais-5', 'Ce cours de niveau Licence 3 en anglais...', 'Général', '2024-10-31', '2025-01-14', 15, 'Licence 1', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 14),
(15, 'Preparation a l\'insertion professionnelle', 'preparation-a-l-insertion-professionnelle', 'Ce cours prepare les etudiants a leur entree sur le marche du travail...', 'Général', '2025-01-23', '2025-04-21', 10, 'Licence 1', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 15),
(16, 'Le droit de louer à la pointe', 'le-droit-de-louer-a-la-pointe', 'Humide danser ou propos. Élever paupière amuser vue séparer grain bruit. Autrefois avoir oh aujourd\'hui dos partager. Prêter fier nu écraser lisser gris ressembler.', 'Statistiques', '2025-01-23', '2025-04-23', 50, 'Licence 2', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 2),
(17, 'L\'art de concrétiser vos projets autrement', 'l-art-de-concretiser-vos-projets-autrement', 'Énergie énergie devant unique. Auquel savoir bête blanc quart rocher militaire. Vague mode plaisir fumée son traverser goût terminer.', 'Statistiques', '2025-01-10', '2025-04-10', 22, 'Licence 1', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 10),
(18, 'L\'avantage d\'innover avant-tout', 'l-avantage-d-innover-avant-tout', 'Livre choix jeunesse séparer étranger militaire calmer. Mouvement rien sentier vieux rouler.', 'Python', '2025-04-30', '2025-07-29', 44, 'Licence 3', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 3),
(19, 'L\'avantage d\'innover de manière efficace', 'l-avantage-d-innover-de-maniere-efficace', 'Premier en établir accepter solitude. Personne autant que vide beaux manger fer.', 'Math', '2025-03-30', '2025-06-28', 30, 'Licence 2', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 10),
(20, 'Le confort de louer en toute tranquillité', 'le-confort-de-louer-en-toute-tranquillite', 'Nouveau sourd chose rapidement armer avouer heure. Jour hésiter donner rappeler calme gris. Poche note mal en dans.', 'Math', '2025-04-27', '2025-07-26', 33, 'Licence 2', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 2),
(21, 'Le confort d\'innover en toute tranquillité', 'le-confort-d-innover-en-toute-tranquillite', 'Accord quinze complètement fidèle. Lèvre scène riche autre situation. Haine importer avec.', 'Data', '2025-03-02', '2025-05-31', 25, 'Licence 3', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 1),
(22, 'L\'avantage d\'atteindre vos buts à sa source', 'l-avantage-d-atteindre-vos-buts-a-sa-source', 'Camarade aide entrée rêve ouvert. Battre sens dernier noire mais forcer. Queue danser rendre avant partager.', 'Math', '2025-04-14', '2025-07-13', 56, 'Licence 2', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 2),
(23, 'L\'art de louer à sa source', 'l-art-de-louer-a-sa-source', 'Bord devenir compagnie chien réalité. Comprendre relever le rapidement.', 'Math', '2025-04-23', '2025-07-22', 59, 'Licence 1', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 9),
(24, 'Le confort de concrétiser vos projets plus rapidement', 'le-confort-de-concretiser-vos-projets-plus-rapidem', 'Parole retirer nommer étroit autrement impression. Assez sauver avant. Ou livre inconnu mien.', 'Data', '2025-01-08', '2025-04-08', 45, 'Licence 1', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 8),
(25, 'L\'avantage de changer avant-tout', 'l-avantage-de-changer-avant-tout', 'Liberté valeur huit roche secours visite barbe. Apparence présent voix mais. Cinquante faux droit front est nuage résistance paysan. Épaule million finir détacher.', 'Python', '2025-05-08', '2025-08-06', 48, 'Licence 2', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 9),
(26, 'L\'art d\'avancer sans soucis', 'l-art-d-avancer-sans-soucis', 'Encore personnage peur cercle président barbe. Ferme respecter rôle plaisir santé quart pont.', 'Data', '2025-04-13', '2025-07-12', 58, 'Licence 3', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 9),
(27, 'La liberté d\'atteindre vos buts à la pointe', 'la-liberte-d-atteindre-vos-buts-a-la-pointe', 'Extraordinaire condition croix. Contraire yeux choix écrire réserver livrer matin. Apercevoir essayer réflexion certainement ferme clef sauver.', 'Data', '2025-05-02', '2025-07-31', 35, 'Licence 3', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 5),
(28, 'Le droit de rouler autrement', 'le-droit-de-rouler-autrement', 'Vêtir on ramener répéter delà. En rire intention se fait. Vivre impossible drame figurer malade vers rouge.', 'Python', '2025-04-28', '2025-07-27', 43, 'Licence 2', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 8),
(29, 'L\'assurance de rouler à l\'état pur', 'l-assurance-de-rouler-a-l-etat-pur', 'Mien bonheur sentiment seuil droite recueillir. Hors loup sauvage beaux tempête. Sourire tout garder forêt faveur fine avouer.', 'Math', '2025-02-13', '2025-05-14', 24, 'Licence 1', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 4),
(30, 'Le confort d\'évoluer de manière efficace', 'le-confort-d-evoluer-de-maniere-efficace', 'Pousser champ près horizon accent avenir devenir. Mensonge propos malade ça.', 'Python', '2025-02-25', '2025-05-26', 47, 'Licence 3', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 1),
(31, 'L\'assurance d\'avancer de manière efficace', 'l-assurance-d-avancer-de-maniere-efficace', 'Passage papa attirer seconde lever mari. Lui depuis charge grave oser dépasser général pied.', 'Data', '2025-01-17', '2025-04-17', 24, 'Licence 1', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 10),
(32, 'Le plaisir de rouler autrement', 'le-plaisir-de-rouler-autrement', 'Partir visible détruire. Exiger auquel déposer. Bouche naturellement rare cesser étude est patron sauvage.', 'Math', '2025-05-13', '2025-08-11', 24, 'Licence 1', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 1),
(33, 'Le droit d\'évoluer de manière sûre', 'le-droit-d-evoluer-de-maniere-sure', 'Prière trésor annoncer couper. Soutenir enfoncer encore fort rose.', 'Math', '2025-04-02', '2025-07-01', 14, 'Licence 3', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 6),
(34, 'L\'art d\'atteindre vos buts autrement', 'l-art-d-atteindre-vos-buts-autrement', 'Et considérer poste fait retomber disparaître. Prononcer avenir observer saint. École bonheur environ écrire hiver printemps combat.', 'Data', '2025-03-28', '2025-06-26', 52, 'Licence 2', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 5),
(35, 'Le droit de rouler à sa source', 'le-droit-de-rouler-a-sa-source', 'Vue dormir violent trou avance pas face rêve. Un chaque offrir renverser. Celui demande payer.', 'Data', '2025-03-12', '2025-06-10', 18, 'Licence 3', 'default_images/defaut.jpeg', 1, '0000-00-00 00:00:00.000000', 9);

-- --------------------------------------------------------

--
-- Structure de la table `cours_postulation`
--

CREATE TABLE `cours_postulation` (
  `id` bigint(20) NOT NULL,
  `statut` varchar(20) NOT NULL,
  `date_postulation` datetime(6) NOT NULL,
  `cours_id` bigint(20) NOT NULL,
  `etudiant_id` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cours_postulation`
--

INSERT INTO `cours_postulation` (`id`, `statut`, `date_postulation`, `cours_id`, `etudiant_id`) VALUES
(41, 'refuse', '2025-03-16 00:00:00.000000', 19, 'zguillon@live.com	'),
(42, 'accepte', '2025-04-21 00:00:00.000000', 8, 'hoareauedouard@club-internet.fr	'),
(43, 'en_attente', '2025-01-07 00:00:00.000000', 14, 'rocheelodie@yahoo.fr'),
(44, 'refuse', '2025-04-28 00:00:00.000000', 4, 'bazinmichelle@yahoo.fr'),
(45, 'accepte', '2025-01-30 00:00:00.000000', 12, 'guerinmathilde@rolland.com'),
(46, 'refuse', '2025-05-12 00:00:00.000000', 15, 'guerinmathilde@rolland.com'),
(47, 'en_attente', '2025-03-29 00:00:00.000000', 4, 'alixledoux@gimenez.com'),
(48, 'en_attente', '2025-03-14 00:00:00.000000', 11, 'garnierdanielle@yahoo.fr'),
(49, 'en_attente', '2025-03-14 00:00:00.000000', 7, 'danielmoreau@aol.fr'),
(50, 'en_attente', '2025-03-28 00:00:00.000000', 15, 'jourdanlaurence@club.fr'),
(51, 'accepte', '2025-01-15 00:00:00.000000', 6, 'guerinmathilde@rolland.com'),
(52, 'en_attente', '2025-04-22 00:00:00.000000', 8, 'hmonnier@blanchard.fr'),
(53, 'en_attente', '2025-01-27 00:00:00.000000', 18, 'hmonnier@blanchard.fr'),
(54, 'en_attente', '2025-04-13 00:00:00.000000', 18, 'alixledoux@gimenez.com'),
(55, 'en_attente', '2025-03-13 00:00:00.000000', 8, 'aubryvincent@noos.fr'),
(56, 'accepte', '2025-03-19 00:00:00.000000', 16, 'guerinmathilde@rolland.com'),
(57, 'en_attente', '2025-03-03 00:00:00.000000', 13, 'charles98@wanadoo.fr'),
(58, 'en_attente', '2025-05-07 00:00:00.000000', 13, 'catherinegauthier@yahoo.fr'),
(59, 'accepte', '2025-02-24 00:00:00.000000', 9, 'garnierdanielle@yahoo.fr'),
(60, 'refuse', '2025-02-18 00:00:00.000000', 14, 'dominique17@wanadoo.fr'),
(61, 'refuse', '2025-01-23 00:00:00.000000', 18, 'pierre71@hotmail.fr'),
(62, 'accepte', '2025-01-06 00:00:00.000000', 16, 'patrick32@labbe.com'),
(63, 'en_attente', '2025-02-06 00:00:00.000000', 10, 'charles98@wanadoo.fr'),
(64, 'refuse', '2025-04-07 00:00:00.000000', 19, 'alixledoux@gimenez.com'),
(65, 'refuse', '2025-04-11 00:00:00.000000', 2, 'jourdanlaurence@club.fr'),
(66, 'accepte', '2025-03-17 00:00:00.000000', 2, 'evelyne37@orange.fr'),
(67, 'refuse', '2025-04-20 00:00:00.000000', 16, 'kamelbouvet@yahoo.fr'),
(68, 'en_attente', '2025-01-23 00:00:00.000000', 17, 'zguillon@live.com'),
(69, 'en_attente', '2025-02-20 00:00:00.000000', 17, 'alixledoux@gimenez.com'),
(70, 'en_attente', '2025-02-20 00:00:00.000000', 6, 'suzanne02@noos.fr'),
(71, 'refuse', '2025-03-28 00:00:00.000000', 3, 'lucaschevallier@club.fr'),
(72, 'accepte', '2025-02-11 00:00:00.000000', 8, 'suzanne02@noos.fr'),
(73, 'en_attente', '2025-04-29 00:00:00.000000', 19, 'bazinmichelle@yahoo.fr'),
(74, 'accepte', '2025-02-25 00:00:00.000000', 20, 'kamelbouvet@yahoo.fr'),
(75, 'refuse', '2025-02-08 00:00:00.000000', 19, 'pascal61@laposte.net'),
(76, 'accepte', '2025-01-24 00:00:00.000000', 11, 'jacquelinegirard@yahoo.fr'),
(77, 'en_attente', '2025-01-27 00:00:00.000000', 11, 'charles98@wanadoo.fr'),
(78, 'en_attente', '2025-01-15 00:00:00.000000', 13, 'delahayechristophe@da-silva.com'),
(79, 'accepte', '2025-03-29 00:00:00.000000', 10, 'pascal61@laposte.net'),
(80, 'en_attente', '2025-05-15 08:55:51.191138', 5, 'Itachi@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `cours_ressource`
--

CREATE TABLE `cours_ressource` (
  `id` bigint(20) NOT NULL,
  `titre` varchar(200) NOT NULL,
  `type` varchar(50) NOT NULL,
  `fichier` varchar(100) NOT NULL,
  `description` longtext DEFAULT NULL,
  `illustration` varchar(100) DEFAULT NULL,
  `date_ajout` datetime(6) NOT NULL,
  `cours_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cours_ressource`
--

INSERT INTO `cours_ressource` (`id`, `titre`, `type`, `fichier`, `description`, `illustration`, `date_ajout`, `cours_id`) VALUES
(1, 'Traiter efficacement', 'pdf', 'ressources/Rapport_Djiagni_Roosvelt.pdf', '', 'ressources_illustrations/illust_pdf_VhbP51X.png', '2025-05-15 09:27:44.710160', 2),
(3, 'Traiter efficacement', 'pdf', 'ressources/Rapport_Djiagni_Roosvelt_yJPKBjf.pdf', '', 'ressources_illustrations/illust_pdf_iEbFdz9.png', '2025-05-15 09:39:50.773986', 2),
(4, 'Traiter efficacement', 'pdf', 'ressources/Rapport_Djiagni_Roosvelt_BjSyKXY.pdf', '', 'ressources_illustrations/illust_pdf_2W3R6hD.png', '2025-05-15 09:41:32.223927', 2),
(5, 'Traiter efficacement', 'pdf', 'ressources/Rapport_Djiagni_Roosvelt_5vRIra4.pdf', '', 'ressources_illustrations/illust_pdf_1gTHPTw.png', '2025-05-15 09:43:24.232919', 2),
(6, 'Traiter efficacement', 'pdf', 'ressources/Rapport_Djiagni_Roosvelt_SRTCfAc.pdf', '', 'ressources_illustrations/illust_pdf_4jz9m2S.png', '2025-05-15 09:45:06.140125', 2);

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-05-15 09:53:04.235606', '25', 'evelyne37@orange.fr', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 46),
(2, '2025-05-15 09:53:08.203884', '25', 'evelyne37@orange.fr', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 46),
(3, '2025-05-15 09:53:12.486850', '25', 'evelyne37@orange.fr', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 46);

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(7, 'Acceuil', 'evaluation'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(12, 'Cours', 'classe'),
(9, 'Cours', 'cours'),
(11, 'Cours', 'postulation'),
(10, 'Cours', 'ressource'),
(8, 'Etudiants', 'etudiants'),
(13, 'login', 'login'),
(14, 'loginP', 'loginp'),
(16, 'messagerie', 'message'),
(15, 'Professeur', 'professeurs'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-05-14 23:45:13.896148'),
(2, 'auth', '0001_initial', '2025-05-14 23:45:14.158417'),
(3, 'Etudiants', '0001_initial', '2025-05-14 23:45:14.192638'),
(4, 'Professeur', '0001_initial', '2025-05-14 23:45:14.234810'),
(5, 'Cours', '0001_initial', '2025-05-14 23:45:14.316530'),
(6, 'Cours', '0002_alter_cours_niveau_postulation', '2025-05-14 23:45:14.389370'),
(7, 'Cours', '0003_classe', '2025-05-14 23:45:14.492533'),
(8, 'Acceuil', '0001_initial', '2025-05-14 23:45:14.563634'),
(9, 'Professeur', '0002_alter_professeurs_user', '2025-05-14 23:45:15.120267'),
(10, 'admin', '0001_initial', '2025-05-14 23:45:15.178143'),
(11, 'admin', '0002_logentry_remove_auto_add', '2025-05-14 23:45:15.184249'),
(12, 'admin', '0003_logentry_add_action_flag_choices', '2025-05-14 23:45:15.189348'),
(13, 'contenttypes', '0002_remove_content_type_name', '2025-05-14 23:45:15.232423'),
(14, 'auth', '0002_alter_permission_name_max_length', '2025-05-14 23:45:15.263383'),
(15, 'auth', '0003_alter_user_email_max_length', '2025-05-14 23:45:15.280050'),
(16, 'auth', '0004_alter_user_username_opts', '2025-05-14 23:45:15.285703'),
(17, 'auth', '0005_alter_user_last_login_null', '2025-05-14 23:45:15.309166'),
(18, 'auth', '0006_require_contenttypes_0002', '2025-05-14 23:45:15.311573'),
(19, 'auth', '0007_alter_validators_add_error_messages', '2025-05-14 23:45:15.319725'),
(20, 'auth', '0008_alter_user_username_max_length', '2025-05-14 23:45:15.349193'),
(21, 'auth', '0009_alter_user_last_name_max_length', '2025-05-14 23:45:15.366781'),
(22, 'auth', '0010_alter_group_name_max_length', '2025-05-14 23:45:15.385115'),
(23, 'auth', '0011_update_proxy_permissions', '2025-05-14 23:45:15.393024'),
(24, 'auth', '0012_alter_user_first_name_max_length', '2025-05-14 23:45:15.409064'),
(25, 'login', '0001_initial', '2025-05-14 23:45:15.416745'),
(26, 'loginP', '0001_initial', '2025-05-14 23:45:15.424915'),
(27, 'messagerie', '0001_initial', '2025-05-14 23:45:15.480735'),
(28, 'sessions', '0001_initial', '2025-05-14 23:45:15.507481'),
(29, 'Etudiants', '0002_alter_etudiants_user', '2025-05-14 23:49:18.524394');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('vapwi303ufd9b8a4nfte5woxofpjlcnn', '.eJxVjEEOgjAQRe_StWk6HaCtS_ecgQzTqUVNSSisjHcXEha6fe_9_1YDbWsetirLMEV1VbZVl184Ej-lHCY-qNxnzXNZl2nUR6JPW3U_R3ndzvbvIFPN-xocupYDdA5E0AcKbCx0DXm7c88NoUNAQbGRXEL23hoDCcg0MY2oPl_b7zc9:1uFVHf:UciTmDtihy33ksFwGCoqYrUM_hK4gw5rDM6mA32BvEc', '2025-05-29 09:53:47.153657');

-- --------------------------------------------------------

--
-- Structure de la table `etudiants_etudiants`
--

CREATE TABLE `etudiants_etudiants` (
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(128) NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `sexe` varchar(1) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `etablissement` varchar(150) NOT NULL,
  `niveau_etude` varchar(20) NOT NULL,
  `filiere` varchar(100) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `nationalite` varchar(2) NOT NULL,
  `date_inscription` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etudiants_etudiants`
--

INSERT INTO `etudiants_etudiants` (`nom`, `prenom`, `email`, `password`, `date_naissance`, `sexe`, `telephone`, `etablissement`, `niveau_etude`, `filiere`, `photo`, `nationalite`, `date_inscription`, `is_active`, `user_id`) VALUES
('Bousquet', 'Victoire', 'alexandriemonnier@sfr.fr', 'motdepasse123', '2005-10-07', 'M', '0119283276', 'Riou', 'Licence 2', 'Économie', 'default_images/user.png', 'BJ', '2024-09-26 00:00:00.000000', 0, 15),
('Riou', 'Corinne', 'alixledoux@gimenez.com', 'motdepasse123', '2004-07-21', 'M', '0470154303', 'Clément et Fils', 'Licence 1', 'Finance', 'default_images/user.png', 'BF', '2024-02-18 00:00:00.000000', 0, 16),
('Leclercq', 'Estelle', 'aubryvincent@noos.fr', 'motdepasse123', '1999-08-25', 'F', '01 79 88 14 58', 'Jacquot', 'Licence 2', 'Finance', 'default_images/user.png', 'CM', '2024-11-27 00:00:00.000000', 0, 17),
('Bigot', 'Éléonore', 'bazinmichelle@yahoo.fr', 'motdepasse123', '2005-12-18', 'F', '0151462704', 'Guillou Gautier et Fils', 'Licence 2', 'Statistique', 'default_images/user.png', 'ML', '2022-07-16 00:00:00.000000', 0, 18),
('Baron', 'Thérèse', 'boulangermaurice@moreno.com', 'motdepasse123', '2001-10-13', 'F', '01 86 68 39 19', 'Loiseau Lefort', 'Licence 3', 'Informatique', 'default_images/user.png', 'NE', '2023-10-02 00:00:00.000000', 0, 19),
('Couturier', 'Henri', 'catherinegauthier@yahoo.fr', 'motdepasse123', '1996-09-20', 'M', '+33 2 94 70 18 78', 'Richard', 'Master 2', 'Économie', 'default_images/user.png', 'NE', '2023-08-23 00:00:00.000000', 0, 20),
('Gosselin', 'André', 'charles98@wanadoo.fr', 'motdepasse123', '1997-07-24', 'M', '01 71 90 30 20', 'Pasquier', 'Master 1', 'Finance', 'default_images/user.png', 'BF', '2023-01-21 00:00:00.000000', 0, 21),
('Pichon', 'Danielle', 'danielmoreau@aol.fr', 'motdepasse123', '2000-03-19', 'F', '01 45 48 67 57', 'Fontaine', 'Licence 3', 'Informatique', 'default_images/user.png', 'CI', '2022-09-08 00:00:00.000000', 0, 22),
('Hamon', 'Pascal', 'delahayechristophe@da-silva.com', 'motdepasse123', '2001-01-03', 'M', '0381763011', 'Mahe S.A.S.', 'Licence 2', 'Économie', 'default_images/user.png', 'BF', '2022-05-30 00:00:00.000000', 0, 23),
('Jouve', 'Patrice', 'dominique17@wanadoo.fr', 'motdepasse123', '1999-06-11', 'M', '01 50 99 00 78', 'Fernandez', 'Licence 3', 'Finance', 'default_images/user.png', 'CM', '2024-10-30 00:00:00.000000', 0, 24),
('Maury', 'Xavier', 'evelyne37@orange.fr', '1234', '2002-02-28', 'M', '02 67 41 50 42', 'Moreau', 'Licence 2', 'Informatique', 'default_images/user.png', 'NE', '2024-01-15 00:00:00.000000', 0, 25),
('Germain', 'Annie', 'evelyne91@outlook.fr', 'motdepasse123', '2001-06-29', 'F', '0141259016', 'Blanchet', 'Licence 3', 'Statistique', 'default_images/user.png', 'NE', '2022-10-15 00:00:00.000000', 0, 26),
('Antoine', 'Gilbert', 'garnierdanielle@yahoo.fr', 'motdepasse123', '2002-06-28', 'M', '01 70 26 63 62', 'Delaunay', 'Licence 3', 'Économie', 'default_images/user.png', 'NE', '2022-11-12 00:00:00.000000', 0, 27),
('Lenoir', 'Michel', 'guerinmathilde@rolland.com', 'motdepasse123', '1999-12-27', 'F', '+33 (0)4 83 47 38 29', 'Berger', 'Master 2', 'Économie', 'default_images/user.png', 'CM', '2024-01-09 00:00:00.000000', 0, 28),
('Lemoine', 'Brigitte', 'hmonnier@blanchard.fr', 'motdepasse123', '1998-10-03', 'F', '02 60 62 55 12', 'Schneider', 'Master 1', 'Statistique', 'default_images/user.png', 'CI', '2024-12-01 00:00:00.000000', 0, 29),
('Bertrand', 'Nathalie', 'hoareauedouard@club-internet.fr', 'motdepasse123', '2005-01-22', 'F', '0809310341', 'Roussel Gillet SARL', 'Licence 1', 'Économie', 'default_images/user.png', 'BF', '2023-11-09 00:00:00.000000', 0, 30),
('Ganamé', 'Abdoulaye', 'Itachi@gmail.com', '1234', '2003-01-23', 'M', '', 'ENSEA', 'Licence 2', 'AS', 'photos/IMG_20250513_181340_526.jpg', 'ML', '2025-05-15 08:43:01.173740', 1, 45),
('Laporte', 'Luc', 'jacquelinegirard@yahoo.fr', 'motdepasse123', '2003-11-22', 'M', '0144786983', 'Jean Lefevre', 'Licence 1', 'Statistique', 'default_images/user.png', 'BJ', '2023-07-03 00:00:00.000000', 0, 31),
('Delorme', 'Hugo', 'jourdanlaurence@club.fr', 'motdepasse123', '2000-04-06', 'M', '01 42 51 35 34', 'Boucher', 'Licence 3', 'Statistique', 'default_images/user.png', 'NE', '2023-05-10 00:00:00.000000', 0, 32),
('Pascal', 'Sylvie', 'kamelbouvet@yahoo.fr', 'motdepasse123', '2005-05-21', 'F', '01 33 57 55 83', 'Laborde', 'Licence 1', 'Finance', 'default_images/user.png', 'BJ', '2024-06-17 00:00:00.000000', 0, 33),
('Gomes', 'Inès', 'lucaschevallier@club.fr', 'motdepasse123', '2003-02-07', 'F', '02 84 64 38 45', 'Frérot SARL', 'Licence 1', 'Informatique', 'default_images/user.png', 'NE', '2023-04-19 00:00:00.000000', 0, 34),
('Muller', 'Patricia', 'margauxollivier@aubry.fr', 'motdepasse123', '1997-12-20', 'F', '+33 4 46 57 87 13', 'Andre Maillot SA', 'Licence 3', 'Informatique', 'default_images/user.png', 'CI', '2025-01-01 00:00:00.000000', 0, 35),
('Lebon', 'Yves', 'pascal61@laposte.net', 'motdepasse123', '1995-11-07', 'M', '+33 6 36 14 90 33', 'Pariset', 'Master 2', 'Statistique', 'default_images/user.png', 'SN', '2023-03-04 00:00:00.000000', 0, 36),
('Riou', 'Frédéric', 'patrick32@labbe.com', 'motdepasse123', '2004-05-30', 'M', '03 00 13 38 90', 'Auger Delahaye et Fils', 'Licence 1', 'Informatique', 'default_images/user.png', 'BJ', '2024-08-20 00:00:00.000000', 0, 37),
('Remy', 'Roger', 'pierre71@hotmail.fr', 'motdepasse123', '1996-05-14', 'M', '+33 1 54 71 77 63', 'Lopez', 'Master 2', 'Informatique', 'default_images/user.png', 'CI', '2023-02-17 00:00:00.000000', 0, 38),
('Fischer', 'Christian', 'regis68@noos.fr', 'motdepasse123', '2004-09-04', 'M', '01 64 63 02 69', 'Da Costa', 'Licence 2', 'Statistique', 'default_images/user.png', 'ML', '2023-01-03 00:00:00.000000', 0, 39),
('Baron', 'Suzanne', 'rocheelodie@yahoo.fr', 'motdepasse123', '1997-01-18', 'F', '+33 4 29 10 66 15', 'Dupuis', 'Master 1', 'Finance', 'default_images/user.png', 'ML', '2022-12-20 00:00:00.000000', 0, 40),
('Vasseur', 'Marianne', 'rollandvalentine@gmail.com', 'motdepasse123', '1999-09-25', 'F', '01 41 39 53 76', 'Meunier', 'Licence 2', 'Finance', 'default_images/user.png', 'SN', '2022-04-02 00:00:00.000000', 0, 41),
('Humbert', 'Matthieu', 'suzanne02@noos.fr', 'motdepasse123', '2000-02-26', 'M', '0123511615', 'Texier', 'Licence 2', 'Économie', 'default_images/user.png', 'BF', '2022-04-01 00:00:00.000000', 0, 42),
('Marty', 'Madeleine', 'veronique92@free.fr', 'motdepasse123', '2001-03-14', 'F', '01 89 01 00 61', 'Jourdan', 'Licence 3', 'Statistique', 'default_images/user.png', 'ML', '2023-06-12 00:00:00.000000', 0, 43),
('Joly', 'Paul', 'zguillon@live.com', 'motdepasse123', '1998-02-04', 'M', '+33 1 87 10 12 26', 'Collin S.A.R.L.', 'Licence 2', 'Finance', 'default_images/user.png', 'ML', '2025-01-25 00:00:00.000000', 0, 44);

-- --------------------------------------------------------

--
-- Structure de la table `loginp_loginp`
--

CREATE TABLE `loginp_loginp` (
  `id` bigint(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `login_login`
--

CREATE TABLE `login_login` (
  `id` bigint(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `messagerie_message`
--

CREATE TABLE `messagerie_message` (
  `id` bigint(20) NOT NULL,
  `contenu` longtext NOT NULL,
  `date_envoi` datetime(6) NOT NULL,
  `lu` tinyint(1) NOT NULL,
  `destinataire_id` int(11) NOT NULL,
  `expediteur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `messagerie_message`
--

INSERT INTO `messagerie_message` (`id`, `contenu`, `date_envoi`, `lu`, `destinataire_id`, `expediteur_id`) VALUES
(1, 'Bonjour Monsieur je voudrais integrer votre cours', '2025-05-15 08:55:28.158414', 0, 5, 45),
(2, 'Nouveau contenu disponible pour votre cours \'Traitement des donnees\' : Traiter efficacement', '2025-05-15 09:45:06.147981', 1, 25, 2);

-- --------------------------------------------------------

--
-- Structure de la table `professeur_professeurs`
--

CREATE TABLE `professeur_professeurs` (
  `id` bigint(20) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(50) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `biographie` longtext DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `date_embauche` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `professeur_professeurs`
--

INSERT INTO `professeur_professeurs` (`id`, `nom`, `prenom`, `email`, `password`, `photo`, `biographie`, `telephone`, `date_embauche`, `user_id`) VALUES
(1, 'Moussa ', ' Richard \r', 'Moussa@ensea.ed.ci', '1234', 'default_images/user.png', NULL, '781121101', '2024-10-28', 1),
(2, 'Kouame', 'Dares', 'Kouame@ensea.ed.ci', '1234', 'professeurs_photos/421feff03d5cf389e676cf2c9a4c590e_TyesiEb.jpg', '', '165881392', '2025-03-31', 2),
(3, 'Kouadio ', ' Alice\r', 'Kouadio@ensea.ed.ci', '1234', 'default_images/user.png', NULL, '3486843817', '2025-03-28', 3),
(4, 'Gbenro ', ' Nathanael\r', 'Gbenro@ensea.ed.ci', '1234', 'default_images/user.png', NULL, '3060729964', '2024-12-01', 4),
(5, 'Bobet', 'Goualo Victorien', 'Bobet@ensea.ed.ci', '1234', 'professeurs_photos/1e36c04fd65c8c2bf92a27edb3df4adf.jpg', '', '7968206010', '2024-11-12', 5),
(6, 'Diomande ', ' Syndou\r', 'Diomande@ensea.ed.ci', '1234', 'default_images/user.png', NULL, '5237088036', '2025-01-09', 6),
(7, 'Zuri ', ' Nkrumah\r', 'Zuri@ensea.ed.ci', '1234', 'default_images/user.png', NULL, '1272702168', '2024-11-14', 7),
(8, 'Kwame ', ' Oduro\r', 'Kwame@ensea.ed.ci', '1234', 'default_images/user.png', NULL, '2076385191', '2025-06-27', 8),
(9, 'Amina ', ' Diallo\r', 'Amina@ensea.ed.ci', '1234', 'default_images/user.png', NULL, '6482961153', '2024-10-05', 9),
(10, 'Fatou ', ' Bamba\r', 'Fatou@ensea.ed.ci', '1234', 'default_images/user.png', NULL, '2880574713', '2024-11-12', 10),
(11, 'Nia ', ' Adebayo\r', 'Nia@ensea.ed.ci', '1234', 'default_images/user.png', NULL, '7650998567', '2024-09-23', 11),
(12, 'Kofi ', ' Mensah\r', 'Kofi@ensea.ed.ci', '1234', 'default_images/user.png', NULL, '5773089666', '2024-11-14', 12),
(13, 'Chike ', ' Obi\r', 'Chike@ensea.ed.ci', '1234', 'default_images/user.png', NULL, '5836725185', '2025-03-28', 13),
(14, 'Asha ', ' Moyo\r', 'Asha@ensea.ed.ci', '1234', 'default_images/user.png', NULL, '2057333225', '2024-10-31', 14);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acceuil_evaluation`
--
ALTER TABLE `acceuil_evaluation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Acceuil_evaluation_etudiant_id_cours_id_611d12b7_uniq` (`etudiant_id`,`cours_id`),
  ADD KEY `Acceuil_evaluation_cours_id_024e6665_fk_Cours_cours_id` (`cours_id`);

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `cours_classe`
--
ALTER TABLE `cours_classe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cours_id` (`cours_id`);

--
-- Index pour la table `cours_classe_etudiants`
--
ALTER TABLE `cours_classe_etudiants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Cours_classe_etudiants_classe_id_etudiants_id_1d8b465f_uniq` (`classe_id`,`etudiants_id`),
  ADD KEY `Cours_classe_etudian_etudiants_id_5a929794_fk_Etudiants` (`etudiants_id`);

--
-- Index pour la table `cours_cours`
--
ALTER TABLE `cours_cours`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `Cours_cours_professeur_id_40546087_fk_Professeur_professeurs_id` (`professeur_id`);

--
-- Index pour la table `cours_postulation`
--
ALTER TABLE `cours_postulation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Cours_postulation_etudiant_id_cours_id_deedb41b_uniq` (`etudiant_id`,`cours_id`),
  ADD KEY `Cours_postulation_cours_id_0fb4721b_fk_Cours_cours_id` (`cours_id`);

--
-- Index pour la table `cours_ressource`
--
ALTER TABLE `cours_ressource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Cours_ressource_cours_id_04aae9f2_fk_Cours_cours_id` (`cours_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Index pour la table `etudiants_etudiants`
--
ALTER TABLE `etudiants_etudiants`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Index pour la table `loginp_loginp`
--
ALTER TABLE `loginp_loginp`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `login_login`
--
ALTER TABLE `login_login`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messagerie_message`
--
ALTER TABLE `messagerie_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messagerie_message_destinataire_id_e5a9c7e9_fk_auth_user_id` (`destinataire_id`),
  ADD KEY `messagerie_message_expediteur_id_9bb70195_fk_auth_user_id` (`expediteur_id`);

--
-- Index pour la table `professeur_professeurs`
--
ALTER TABLE `professeur_professeurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `acceuil_evaluation`
--
ALTER TABLE `acceuil_evaluation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cours_classe`
--
ALTER TABLE `cours_classe`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `cours_classe_etudiants`
--
ALTER TABLE `cours_classe_etudiants`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `cours_cours`
--
ALTER TABLE `cours_cours`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `cours_postulation`
--
ALTER TABLE `cours_postulation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT pour la table `cours_ressource`
--
ALTER TABLE `cours_ressource`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `loginp_loginp`
--
ALTER TABLE `loginp_loginp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `login_login`
--
ALTER TABLE `login_login`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messagerie_message`
--
ALTER TABLE `messagerie_message`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `professeur_professeurs`
--
ALTER TABLE `professeur_professeurs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `acceuil_evaluation`
--
ALTER TABLE `acceuil_evaluation`
  ADD CONSTRAINT `Acceuil_evaluation_cours_id_024e6665_fk_Cours_cours_id` FOREIGN KEY (`cours_id`) REFERENCES `cours_cours` (`id`),
  ADD CONSTRAINT `Acceuil_evaluation_etudiant_id_0e59cb28_fk_Etudiants` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiants_etudiants` (`email`);

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `cours_classe`
--
ALTER TABLE `cours_classe`
  ADD CONSTRAINT `Cours_classe_cours_id_a1217fb1_fk_Cours_cours_id` FOREIGN KEY (`cours_id`) REFERENCES `cours_cours` (`id`);

--
-- Contraintes pour la table `cours_classe_etudiants`
--
ALTER TABLE `cours_classe_etudiants`
  ADD CONSTRAINT `Cours_classe_etudian_etudiants_id_5a929794_fk_Etudiants` FOREIGN KEY (`etudiants_id`) REFERENCES `etudiants_etudiants` (`email`),
  ADD CONSTRAINT `Cours_classe_etudiants_classe_id_b2a44df8_fk_Cours_classe_id` FOREIGN KEY (`classe_id`) REFERENCES `cours_classe` (`id`);

--
-- Contraintes pour la table `cours_cours`
--
ALTER TABLE `cours_cours`
  ADD CONSTRAINT `Cours_cours_professeur_id_40546087_fk_Professeur_professeurs_id` FOREIGN KEY (`professeur_id`) REFERENCES `professeur_professeurs` (`id`);

--
-- Contraintes pour la table `cours_postulation`
--
ALTER TABLE `cours_postulation`
  ADD CONSTRAINT `Cours_postulation_cours_id_0fb4721b_fk_Cours_cours_id` FOREIGN KEY (`cours_id`) REFERENCES `cours_cours` (`id`),
  ADD CONSTRAINT `Cours_postulation_etudiant_id_7601659f_fk_Etudiants` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiants_etudiants` (`email`);

--
-- Contraintes pour la table `cours_ressource`
--
ALTER TABLE `cours_ressource`
  ADD CONSTRAINT `Cours_ressource_cours_id_04aae9f2_fk_Cours_cours_id` FOREIGN KEY (`cours_id`) REFERENCES `cours_cours` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `etudiants_etudiants`
--
ALTER TABLE `etudiants_etudiants`
  ADD CONSTRAINT `Etudiants_etudiants_user_id_8dec1d47_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `messagerie_message`
--
ALTER TABLE `messagerie_message`
  ADD CONSTRAINT `messagerie_message_destinataire_id_e5a9c7e9_fk_auth_user_id` FOREIGN KEY (`destinataire_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `messagerie_message_expediteur_id_9bb70195_fk_auth_user_id` FOREIGN KEY (`expediteur_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `professeur_professeurs`
--
ALTER TABLE `professeur_professeurs`
  ADD CONSTRAINT `Professeur_professeurs_user_id_e0d6e665_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
