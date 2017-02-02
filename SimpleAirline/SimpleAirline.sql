create database userdb;
use userdb;
grant all on userdb.* to 'admin'@'localhost' identified by 'admin'; 

CREATE TABLE userdb.`client` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `departure_date` date DEFAULT NULL,
  `mob_phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `series` varchar(5) DEFAULT NULL,
  `num` varchar(45) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `destination` varchar(45) DEFAULT NULL,
  `age` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8

CREATE TABLE userdb.`destination` (
  `destination_id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_name` varchar(45) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`destination_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8