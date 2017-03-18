-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.17 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for autoparts
CREATE DATABASE IF NOT EXISTS `autoparts` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `autoparts`;


-- Dumping structure for table autoparts.answers
CREATE TABLE IF NOT EXISTS `answers` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `fk_question_id` int(255) DEFAULT NULL,
  `fk_qid` int(255) DEFAULT NULL,
  `text` text,
  `date` date DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `location` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='This table contains the answer to the questions that are asked by the customers related to the products.';

-- Data exporting was unselected.


-- Dumping structure for table autoparts.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT COMMENT 'product id',
  `sku` varchar(50) DEFAULT NULL COMMENT 'product sku',
  `name` varchar(100) DEFAULT NULL COMMENT 'product name',
  `new_review_date` date DEFAULT NULL COMMENT 'product new review date',
  `oldest_review_date` date DEFAULT NULL COMMENT 'product oldest review date',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='This table contains products';

-- Data exporting was unselected.


-- Dumping structure for table autoparts.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `fk_product_id` int(255) unsigned NOT NULL,
  `text` text,
  `qid` int(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `location` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='This table contains the question asked by the customer related to the products';

-- Data exporting was unselected.


-- Dumping structure for table autoparts.reviews
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT COMMENT 'auto increment review id',
  `fk_product_id` int(255) NOT NULL COMMENT 'product id from product''s table',
  `status` char(20) DEFAULT NULL COMMENT 'status of the review',
  `created_date` date DEFAULT NULL COMMENT 'review created date',
  `source` char(10) DEFAULT NULL COMMENT 'source of the review',
  `headline` text COMMENT 'review headline',
  `overall_rating` int(5) DEFAULT NULL COMMENT 'review overall rating',
  `comments` text COMMENT 'review comments',
  `nick_name` varchar(50) DEFAULT NULL COMMENT 'reviewer nick name',
  `location` text COMMENT 'reviewer location',
  `merchant_review_id` int(11) DEFAULT NULL COMMENT 'merchant review id',
  `merchant_email_address` varchar(50) DEFAULT NULL COMMENT 'merchant email address',
  `campaign_id` int(11) DEFAULT NULL COMMENT 'review campaign id',
  `site_id` int(11) DEFAULT NULL COMMENT 'review site id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contains the information of product reviews posted by the customers';

-- Data exporting was unselected.


-- Dumping structure for table autoparts.review_images
CREATE TABLE IF NOT EXISTS `review_images` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `fk_review_id` int(255) NOT NULL,
  `location` text,
  `thumbnail` text,
  `caption` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='This table contains the images of reviews';

-- Data exporting was unselected.


-- Dumping structure for table autoparts.review_videos
CREATE TABLE IF NOT EXISTS `review_videos` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT COMMENT 'auto increment review video id',
  `fk_review_id` int(255) NOT NULL COMMENT 'foriegn key review id',
  `location` text COMMENT 'video location',
  `thumbnail` text COMMENT 'video thumbnail',
  `caption` text COMMENT 'video caption',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='This table contains the table reviews';

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
