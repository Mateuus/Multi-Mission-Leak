/*
Script File Author: Moss & Lifeman
Script File Mod: RP Project
Script File: RPP_SQL.sql

Description:
Database Tables etc.
*/
CREATE DATABASE IF NOT EXISTS `RPProject_DB`;
GRANT ALL PRIVILEGES ON `RPProject_DB` . * TO 'root'@'%';
USE `RPProject_DB`;

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `pid` varchar(64) NOT NULL,
  `name` varchar(64),
  `cash` int(100) NOT NULL DEFAULT '0',
  `bank` int(100) NOT NULL DEFAULT '0',
  `adminLevel` int(20),
  `emtLevel` int(20),
  `copLevel` int(20),
  `donorLevel` int(20),
  `gear` text NOT NULL,
  `inventory` text NOT NULL,
  `VehicleStorage` text NOT NULL,
  `Weight` int(20),
  `licenses` text NOT NULL,
  `Skill_Vehicle` int(20),
  `skill_Crafting` int(20),
  `Skill_Mining` int(20),
  `Skill_Gathering` int(20),
  `Skill_Fishing` int(20),
  `hunger` int(20) NOT NULL DEFAULT '100',
  `thirst` int(20) NOT NULL DEFAULT '100',
  `isinjail` tinyint(1) NOT NULL DEFAULT '0',
  `Jail_H` int(20),
  `Jail_M` int(20),
  `Jail_S` int(20),
  `JailPOS` int(100),
  `JailDir` int(100),
  `CompanyOwning` varchar(64),
  `InGangName` varchar(64),
  `insert_time` timestamp DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

CREATE TABLE IF NOT EXISTS `game_logins` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `pid` varchar(64) NOT NULL,
  `username` varchar(64),
  `password` varchar(64),
  PRIMARY KEY (`id`),
  UNIQUE KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2;

CREATE TABLE IF NOT EXISTS `Duty` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `pid` varchar(64) NOT NULL,
  `locker_civ` text NOT NULL,
  `locker_cop` text NOT NULL,
  `locker_ems` text NOT NULL,
  `onduty_civ` int(5),
  `onduty_cop` int(5),
  `onduty_ems` int(5),
  PRIMARY KEY (`id`),
  UNIQUE KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2;

CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` varchar(64) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `classname` varchar(64) NOT NULL,
  `plate` varchar(64) NOT NULL,
  `active` int(100),
  `trunk` text NOT NULL,
  `MaxWeight` int(100),
  `Weight` int(100),
  `VehStatus` text NOT NULL,
  `upgrades` text NOT NULL,
  `isveh` text NOT NULL,
  `owners` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


CREATE TABLE IF NOT EXISTS `PoliceDB` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` varchar(64) NOT NULL,
  `Name` varchar(20),
  `Submitby` varchar(20),
  `UID` varchar(64) NOT NULL,
  `Crime_Records` text NOT NULL,
  `Race` varchar(20),
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Housing` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` varchar(64),
  `mainowner` varchar(64),
  `owners` text NOT NULL,
  `house` text NOT NULL,
  `pos` text NOT NULL,
  `trunk` text NOT NULL,
  `locked` int(100),
  `weight` int(100),
  `Maxweight` int(100),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


CREATE TABLE IF NOT EXISTS `Companys` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` varchar(64) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `CompanyName` varchar(64) NOT NULL,
  `Settings` text NOT NULL,
  `Workers` text NOT NULL,
  `Storage` text NOT NULL,
  `Applications` text NOT NULL,
  `CompanyBank` int(100),
  `Type` varchar(64) NOT NULL,
  `MaxWorkers` int(100),
  `WorkerSlots` int(100),
  `Description` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

CREATE TABLE IF NOT EXISTS `Gangs` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` varchar(64) NOT NULL,
  `Gangleader` varchar(64) NOT NULL,
  `GangName` varchar(64) NOT NULL,
  `GangMembersUID` text NOT NULL,
  `GangMembersname` text NOT NULL,
  `Locked` int(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;