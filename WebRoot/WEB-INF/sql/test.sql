/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.45 : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test`;

/*Table structure for table `tb_item` */

DROP TABLE IF EXISTS `tb_item`;

CREATE TABLE `tb_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` float(10,1) DEFAULT NULL,
  `detail` text,
  `pic` varchar(64) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

/*Data for the table `tb_item` */

insert  into `tb_item`(`id`,`name`,`price`,`detail`,`pic`,`createtime`) values (23,'背包a222',250.0,'物美价廉',NULL,'2012-07-10 13:59:51'),(26,'笔记本',5000.0,'价优，性能好！',NULL,'2019-06-06 11:36:35'),(27,'背包',223.0,'设计符合人体工学原理，容量大！',NULL,'2019-06-06 11:37:09'),(31,'aaa',12.0,'dfsdff','小猪.jpg','2019-06-04 08:55:17'),(32,'aa',23.0,'df','882F384A96C842E78EE65CD7287E9630.jpg','2019-06-05 09:42:13'),(39,'bb',49.0,'测试数据',NULL,NULL),(40,'cc',50.0,'测试数据',NULL,NULL),(41,'dd',51.0,'测试数据',NULL,NULL),(42,'ee',52.0,'测试数据',NULL,NULL),(43,'ff',53.0,'测试数据',NULL,NULL),(44,'gg',54.0,'测试数据',NULL,NULL),(45,'hh',55.0,'测试数据',NULL,NULL),(46,'ii',56.0,'测试数据',NULL,NULL),(47,'jj',57.0,'测试数据',NULL,NULL),(48,'kk',58.0,'测试数据',NULL,NULL),(49,'mm',59.0,'测试数据',NULL,NULL),(50,'nn',60.0,'测试数据',NULL,NULL),(51,'oo',61.0,'测试数据',NULL,NULL),(52,'pp',62.0,'测试数据',NULL,NULL),(53,'qq',63.0,'测试数据',NULL,NULL),(54,'rr',64.0,'测试数据',NULL,NULL),(55,'ss',65.0,'测试数据',NULL,NULL),(56,'tt',66.0,'测试数据',NULL,NULL),(57,'uu',67.0,'测试数据',NULL,NULL),(58,'vv',68.0,'测试数据',NULL,NULL),(59,'ww',69.0,'测试数据',NULL,NULL),(60,'xx',70.0,'测试数据',NULL,NULL),(61,'yy',71.0,'测试数据',NULL,NULL),(62,'zz',72.0,'测试数据',NULL,NULL);

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `tb_user` */

insert  into `tb_user`(`id`,`username`,`password`,`birthday`,`sex`) values (2,'jerry','123',NULL,NULL),(4,'rose','123',NULL,NULL),(6,'tom','123',NULL,NULL),(7,'li3','2233','2019-01-09 00:00:00',1),(8,'henry','202cb962ac59075b964b07152d234b70','2019-02-09 17:24:08',0),(9,'eve','202cb962ac59075b964b07152d234b70',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
