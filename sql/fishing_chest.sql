-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table xidb_asb.fishing_chest
DROP TABLE IF EXISTS `fishing_chest`;
CREATE TABLE IF NOT EXISTS `fishing_chest` (
  `chestid` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `model_index` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `quest_only` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `quest` tinyint(3) unsigned NOT NULL DEFAULT 255,
  `log` tinyint(3) unsigned NOT NULL DEFAULT 255,
  `zoneid` smallint(5) unsigned NOT NULL,
  `areaid` smallint(5) unsigned NOT NULL DEFAULT 0,
  `min_respawn` int(10) unsigned NOT NULL DEFAULT 0,
  `max_respawn` int(10) unsigned NOT NULL DEFAULT 0,
  `difficulty` tinyint(3) unsigned NOT NULL,
  `base_delay` tinyint(2) unsigned NOT NULL,
  `base_move` tinyint(2) unsigned NOT NULL,
  `required_baitid` smallint(5) unsigned NOT NULL DEFAULT 0,
  `alternative_baitid` smallint(5) unsigned NOT NULL DEFAULT 0,
  `required_keyitem` smallint(5) unsigned NOT NULL DEFAULT 0,
  `required_charVar` varchar(64) DEFAULT NULL,
  `required_charVarValue` int(10) unsigned NOT NULL DEFAULT 0,
  `disabled` tinyint(2) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`chestid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table xidb_asb.fishing_chest: ~4 rows (approximately)
INSERT INTO `fishing_chest` (`chestid`, `name`, `model_index`, `quest_only`, `quest`, `log`, `zoneid`, `areaid`, `min_respawn`, `max_respawn`, `difficulty`, `base_delay`, `base_move`, `required_baitid`, `alternative_baitid`, `required_keyitem`, `required_charVar`, `required_charVarValue`, `disabled`) VALUES
    (17261035, 'Jade Etui', 2, 1, 255, 255, 118, 0, 0, 0, 10, 10, 15, 0, 0, 0, 'HQuest[BrigChartQuest]Prog', 1, 0),
    (17261036, 'Jade Etui', 2, 1, 255, 255, 118, 0, 0, 0, 10, 10, 15, 0, 0, 0, 'HQuest[BrigChartQuest]Prog', 2, 0),
    (17261037, 'Jade Etui', 2, 1, 255, 255, 118, 0, 0, 0, 10, 10, 15, 0, 0, 0, 'HQuest[BrigChartQuest]Prog', 3, 0),
    (17261038, 'Jade Etui', 2, 1, 255, 255, 118, 0, 0, 0, 10, 10, 15, 0, 0, 0, 'HQuest[BrigChartQuest]Prog', 4, 0),
    (17261039, 'Jade Etui', 2, 1, 255, 255, 118, 0, 0, 0, 10, 10, 15, 0, 0, 0, 'HQuest[BrigChartQuest]Prog', 5, 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
