CREATE TABLE IF NOT EXISTS `player_crypto_mining` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(20) DEFAULT NULL,
  `rigdata` text DEFAULT '{}',
  `isSuspended` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;