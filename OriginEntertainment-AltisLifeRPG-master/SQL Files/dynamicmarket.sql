CREATE TABLE `dynmarket` (
  `id` INT NOT NULL DEFAULT 1,
  `prices` TEXT NOT NULL,
  PRIMARY KEY (`id`));

INSERT INTO `dynmarket` VALUES (1,'[]');