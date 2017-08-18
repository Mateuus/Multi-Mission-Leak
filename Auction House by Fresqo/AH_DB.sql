CREATE TABLE `ah` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(5) NOT NULL DEFAULT '0',
  `amount` int(5) NOT NULL DEFAULT '0',
  `item` text NOT NULL,
  `price` int(100) NOT NULL DEFAULT '0',
  `seller` varchar(50) NOT NULL,
  `sellername` varchar(32) NOT NULL,
  `status` int(5) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;