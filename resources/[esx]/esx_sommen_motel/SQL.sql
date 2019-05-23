CREATE TABLE IF NOT EXISTS `motel` (
  `id` int(11) DEFAULT NULL,
  `identifier` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `items` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;