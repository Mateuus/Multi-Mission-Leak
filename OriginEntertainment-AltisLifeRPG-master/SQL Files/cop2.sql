ALTER TABLE  `players` ADD (
`cop2_licenses` TEXT NULL DEFAULT NULL
);

ALTER TABLE  `players` ADD (
`cop2_gear` TEXT NOT NULL
);

ALTER TABLE  `players` ADD (
`cop2level` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0'
);