/*
SQLyog Ultimate v12.14 (64 bit)
MySQL - 10.0.38-MariaDB : Database - test_journals
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test_journals` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test_journals`;

/*Table structure for table `auth_assignment` */

DROP TABLE IF EXISTS `auth_assignment`;

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `idx-auth_assignment-user_id` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_assignment` */

insert  into `auth_assignment`(`item_name`,`user_id`,`created_at`) values 
('admin','1',1608060243),
('user','7',1608060262);

/*Table structure for table `auth_item` */

DROP TABLE IF EXISTS `auth_item`;

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_item` */

insert  into `auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) values 
('/*',2,NULL,NULL,NULL,1608060168,1608060168),
('/author/*',2,NULL,NULL,NULL,1608061318,1608061318),
('/author/create',2,NULL,NULL,NULL,1608061318,1608061318),
('/author/delete',2,NULL,NULL,NULL,1608061318,1608061318),
('/author/index',2,NULL,NULL,NULL,1608061318,1608061318),
('/author/update',2,NULL,NULL,NULL,1608061318,1608061318),
('/author/view',2,NULL,NULL,NULL,1608061318,1608061318),
('/debug/*',2,NULL,NULL,NULL,1608060168,1608060168),
('/debug/default/*',2,NULL,NULL,NULL,1608060168,1608060168),
('/debug/default/db-explain',2,NULL,NULL,NULL,1608060168,1608060168),
('/debug/default/download-mail',2,NULL,NULL,NULL,1608060168,1608060168),
('/debug/default/index',2,NULL,NULL,NULL,1608060168,1608060168),
('/debug/default/toolbar',2,NULL,NULL,NULL,1608060168,1608060168),
('/debug/default/view',2,NULL,NULL,NULL,1608060168,1608060168),
('/debug/user/*',2,NULL,NULL,NULL,1608060168,1608060168),
('/debug/user/reset-identity',2,NULL,NULL,NULL,1608060168,1608060168),
('/debug/user/set-identity',2,NULL,NULL,NULL,1608060168,1608060168),
('/gii/*',2,NULL,NULL,NULL,1608060168,1608060168),
('/gii/default/*',2,NULL,NULL,NULL,1608060168,1608060168),
('/gii/default/action',2,NULL,NULL,NULL,1608060168,1608060168),
('/gii/default/diff',2,NULL,NULL,NULL,1608060168,1608060168),
('/gii/default/index',2,NULL,NULL,NULL,1608060168,1608060168),
('/gii/default/preview',2,NULL,NULL,NULL,1608060168,1608060168),
('/gii/default/view',2,NULL,NULL,NULL,1608060168,1608060168),
('/journal-author/*',2,NULL,NULL,NULL,1608061318,1608061318),
('/journal-author/create',2,NULL,NULL,NULL,1608061318,1608061318),
('/journal-author/delete',2,NULL,NULL,NULL,1608061318,1608061318),
('/journal-author/index',2,NULL,NULL,NULL,1608061318,1608061318),
('/journal-author/update',2,NULL,NULL,NULL,1608061318,1608061318),
('/journal-author/view',2,NULL,NULL,NULL,1608061318,1608061318),
('/journal/*',2,NULL,NULL,NULL,1608061318,1608061318),
('/journal/create',2,NULL,NULL,NULL,1608061318,1608061318),
('/journal/delete',2,NULL,NULL,NULL,1608061318,1608061318),
('/journal/index',2,NULL,NULL,NULL,1608061318,1608061318),
('/journal/update',2,NULL,NULL,NULL,1608061318,1608061318),
('/journal/view',2,NULL,NULL,NULL,1608061318,1608061318),
('/rbac/*',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/assignment/*',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/assignment/assign',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/assignment/index',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/assignment/remove',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/assignment/view',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/permission/*',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/permission/assign',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/permission/create',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/permission/delete',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/permission/index',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/permission/remove',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/permission/update',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/permission/view',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/role/*',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/role/assign',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/role/create',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/role/delete',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/role/index',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/role/remove',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/role/update',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/role/view',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/route/*',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/route/assign',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/route/index',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/route/refresh',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/route/remove',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/rule/*',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/rule/create',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/rule/delete',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/rule/index',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/rule/update',2,NULL,NULL,NULL,1608060168,1608060168),
('/rbac/rule/view',2,NULL,NULL,NULL,1608060168,1608060168),
('/site/*',2,NULL,NULL,NULL,1608060168,1608060168),
('/site/about',2,NULL,NULL,NULL,1608060168,1608060168),
('/site/captcha',2,NULL,NULL,NULL,1608060168,1608060168),
('/site/contact',2,NULL,NULL,NULL,1608060168,1608060168),
('/site/error',2,NULL,NULL,NULL,1608060168,1608060168),
('/site/index',2,NULL,NULL,NULL,1608060168,1608060168),
('/site/login',2,NULL,NULL,NULL,1608060168,1608060168),
('/site/logout',2,NULL,NULL,NULL,1608060168,1608060168),
('/user/*',2,NULL,NULL,NULL,1608060168,1608060168),
('/user/create',2,NULL,NULL,NULL,1608060168,1608060168),
('/user/delete',2,NULL,NULL,NULL,1608060168,1608060168),
('/user/index',2,NULL,NULL,NULL,1608060168,1608060168),
('/user/update',2,NULL,NULL,NULL,1608060168,1608060168),
('/user/view',2,NULL,NULL,NULL,1608060168,1608060168),
('admin',2,NULL,NULL,NULL,1608060227,1608060227),
('user',2,NULL,NULL,NULL,1608060254,1608060254);

/*Table structure for table `auth_item_child` */

DROP TABLE IF EXISTS `auth_item_child`;

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_item_child` */

insert  into `auth_item_child`(`parent`,`child`) values 
('admin','/*'),
('admin','/author/*'),
('admin','/author/create'),
('admin','/author/delete'),
('admin','/author/index'),
('admin','/author/update'),
('admin','/author/view'),
('admin','/debug/*'),
('admin','/debug/default/*'),
('admin','/debug/default/db-explain'),
('admin','/debug/default/download-mail'),
('admin','/debug/default/index'),
('admin','/debug/default/toolbar'),
('admin','/debug/default/view'),
('admin','/debug/user/*'),
('admin','/debug/user/reset-identity'),
('admin','/debug/user/set-identity'),
('admin','/gii/*'),
('admin','/gii/default/*'),
('admin','/gii/default/action'),
('admin','/gii/default/diff'),
('admin','/gii/default/index'),
('admin','/gii/default/preview'),
('admin','/gii/default/view'),
('admin','/journal-author/*'),
('admin','/journal-author/create'),
('admin','/journal-author/delete'),
('admin','/journal-author/index'),
('admin','/journal-author/update'),
('admin','/journal-author/view'),
('admin','/journal/*'),
('admin','/journal/create'),
('admin','/journal/delete'),
('admin','/journal/index'),
('admin','/journal/update'),
('admin','/journal/view'),
('admin','/rbac/*'),
('admin','/rbac/assignment/*'),
('admin','/rbac/assignment/assign'),
('admin','/rbac/assignment/index'),
('admin','/rbac/assignment/remove'),
('admin','/rbac/assignment/view'),
('admin','/rbac/permission/*'),
('admin','/rbac/permission/assign'),
('admin','/rbac/permission/create'),
('admin','/rbac/permission/delete'),
('admin','/rbac/permission/index'),
('admin','/rbac/permission/remove'),
('admin','/rbac/permission/update'),
('admin','/rbac/permission/view'),
('admin','/rbac/role/*'),
('admin','/rbac/role/assign'),
('admin','/rbac/role/create'),
('admin','/rbac/role/delete'),
('admin','/rbac/role/index'),
('admin','/rbac/role/remove'),
('admin','/rbac/role/update'),
('admin','/rbac/role/view'),
('admin','/rbac/route/*'),
('admin','/rbac/route/assign'),
('admin','/rbac/route/index'),
('admin','/rbac/route/refresh'),
('admin','/rbac/route/remove'),
('admin','/rbac/rule/*'),
('admin','/rbac/rule/create'),
('admin','/rbac/rule/delete'),
('admin','/rbac/rule/index'),
('admin','/rbac/rule/update'),
('admin','/rbac/rule/view'),
('admin','/site/*'),
('admin','/site/about'),
('admin','/site/captcha'),
('admin','/site/contact'),
('admin','/site/error'),
('admin','/site/index'),
('admin','/site/login'),
('admin','/site/logout'),
('admin','/user/*'),
('admin','/user/create'),
('admin','/user/delete'),
('admin','/user/index'),
('admin','/user/update'),
('admin','/user/view'),
('admin','user'),
('user','/site/*');

/*Table structure for table `auth_rule` */

DROP TABLE IF EXISTS `auth_rule`;

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_rule` */

/*Table structure for table `author` */

DROP TABLE IF EXISTS `author`;

CREATE TABLE `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surname` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `patronomic` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `author` */

insert  into `author`(`id`,`surname`,`name`,`patronomic`,`slug`) values 
(3,'фамилияАвтор1','имяАвтор1','ОтчествоАвтор1','familiyaavtor1-imyaavtor1-otchestvoavtor11608097772'),
(5,'фамилияАвтор2','имяАвтор2','ОтчествоАвтор2','familiyaavtor2-imyaavtor2-otchestvoavtor2_1608097832'),
(6,'фамилияАвтор3','имяАвтор3','ОтчествоАвтор3','familiyaavtor3-imyaavtor3-otchestvoavtor3'),
(7,'Ясминов','Тест','Сергеевич','yasminov-test-sergeevich');

/*Table structure for table `journal` */

DROP TABLE IF EXISTS `journal`;

CREATE TABLE `journal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `journal` */

insert  into `journal`(`id`,`name`,`description`,`photo`,`publish_date`,`status`) values 
(1,'Журнал 1','Это тестовый журнал с номером 1','big_9481de7aeba794dc1ba9988503f846a0.jpg','2020-12-16',NULL),
(2,'Журнал 2','Это тестовый журнал с номером 2','big_9481de7aeba794dc1ba9988503f846a0.jpg','2020-12-11',NULL);

/*Table structure for table `journal_author` */

DROP TABLE IF EXISTS `journal_author`;

CREATE TABLE `journal_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_journal_id` (`journal_id`),
  KEY `FK_author_id` (`author_id`),
  CONSTRAINT `FK_author_id` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_journal_id` FOREIGN KEY (`journal_id`) REFERENCES `journal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `journal_author` */

insert  into `journal_author`(`id`,`journal_id`,`author_id`,`status`) values 
(1,1,6,1),
(2,1,7,1),
(3,2,3,1),
(4,2,5,1);

/*Table structure for table `migration` */

DROP TABLE IF EXISTS `migration`;

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `migration` */

insert  into `migration`(`version`,`apply_time`) values 
('m201215_193001_create_journal_table',1608061031),
('m201215_193006_create_authors_table',1608061031),
('m201215_193020_create_journal_authors',1608061034),
('m201216_053027_add_slug_column',1608096687);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(65) NOT NULL,
  `user_password` varchar(150) NOT NULL,
  `fio` varchar(255) DEFAULT NULL,
  `telefon` varchar(255) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `user_type` enum('admin','user','guest') NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `is_block` tinyint(2) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `auth_key` varchar(255) DEFAULT NULL,
  `secret_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_login_id` (`username`),
  KEY `updated_by` (`updated_by`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`username`,`user_password`,`fio`,`telefon`,`email`,`user_type`,`photo`,`is_block`,`created_at`,`created_by`,`updated_at`,`updated_by`,`auth_key`,`secret_key`) values 
(1,'admin','4baee7411b65cadc2c33bdc3a3155e06','Администратор','+992927001911','manu6699@mail.ru','admin','1.jpg',0,'2017-10-23 11:52:23',1,NULL,NULL,NULL,NULL),
(7,'user','a02ab6584c044fc7c03203928ce2b647','Muzafarov Manuchehr','12025550125','johndoe@example.com','user',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
(8,'guest','ec2a19dae54da19ca7494e3215b5cab7','Пользователь гость','12025550125','johndoe@example.com','guest',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
