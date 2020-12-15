#DROP DATABASE `AutoPower`;
CREATE DATABASE  IF NOT EXISTS `AutoPower` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `AutoPower`;
create table `customer` (
		`id` varchar(100) ,
		`first_name` varchar(100) ,
        `last_name` varchar(100)  ,
        `local_address` varchar(100) ,
        `city` varchar(100) ,
        `state` varchar(100) ,
        `shop_license` varchar(100) ,
        `shop_name` varchar(100) ,
        primary key(id)
	);
ALTER TABLE customer
ADD contacts varchar(100) ;

ALTER TABLE customer
ADD email varchar(100) ;