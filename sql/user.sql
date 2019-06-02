/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.6.12-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `tb_user` (
	`id` bigint (20),
	`username` varchar (300),
	`password` varchar (300)
); 
insert into `tb_user` (`id`, `username`, `password`) values('1','admin','admin');
insert into `tb_user` (`id`, `username`, `password`) values('2','q1010515662','123');
insert into `tb_user` (`id`, `username`, `password`) values('3','user01','123');
