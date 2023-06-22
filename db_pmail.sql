# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_pmail
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    18-06-2023 13:58:45
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_pmail'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_pmail" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_pmail";


#
# Table structure for table 'tbl_complaint'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complaint" (
  "complaint_id" int(10) unsigned NOT NULL auto_increment,
  "complaint_content" varchar(50) default NULL,
  "complaint_date" varchar(50) default NULL,
  "complaint_reply" varchar(50) default 'Not Yet Replyed',
  "complaint_reply_date" varchar(50) default NULL,
  "complaint_status" varchar(50) default '0',
  PRIMARY KEY  ("complaint_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_complaint'
#

LOCK TABLES "tbl_complaint" WRITE;
/*!40000 ALTER TABLE "tbl_complaint" DISABLE KEYS;*/
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_content", "complaint_date", "complaint_reply", "complaint_reply_date", "complaint_status") VALUES
	('1','its very annoying
','2023-06-17','we will sort it out','2023-06-17','1');
/*!40000 ALTER TABLE "tbl_complaint" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_district" (
  "district_id" int(11) NOT NULL auto_increment,
  "district_name" varchar(100) NOT NULL,
  PRIMARY KEY  ("district_id")
) AUTO_INCREMENT=17;



#
# Dumping data for table 'tbl_district'
#

LOCK TABLES "tbl_district" WRITE;
/*!40000 ALTER TABLE "tbl_district" DISABLE KEYS;*/
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(16,'Ernakulam');
/*!40000 ALTER TABLE "tbl_district" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_feedback'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_feedback" (
  "feedback_id" int(3) unsigned NOT NULL auto_increment,
  "feedback_content" varchar(300) default NULL,
  "feedback_date" varchar(50) default NULL,
  PRIMARY KEY  ("feedback_id")
);



#
# Dumping data for table 'tbl_feedback'
#

# No data found.



#
# Table structure for table 'tbl_grade'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_grade" (
  "grade_id" int(11) NOT NULL auto_increment,
  "grade_name" varchar(100) NOT NULL,
  "grade_type" varchar(100) NOT NULL,
  PRIMARY KEY  ("grade_id")
) AUTO_INCREMENT=18;



#
# Dumping data for table 'tbl_grade'
#

LOCK TABLES "tbl_grade" WRITE;
/*!40000 ALTER TABLE "tbl_grade" DISABLE KEYS;*/
REPLACE INTO "tbl_grade" ("grade_id", "grade_name", "grade_type") VALUES
	(4,'SI','Sub Officer');
REPLACE INTO "tbl_grade" ("grade_id", "grade_name", "grade_type") VALUES
	(5,'DYSP','Higher Officer');
REPLACE INTO "tbl_grade" ("grade_id", "grade_name", "grade_type") VALUES
	(7,'CI','Sub Officer');
REPLACE INTO "tbl_grade" ("grade_id", "grade_name", "grade_type") VALUES
	(8,'ASI','Sub Officer');
REPLACE INTO "tbl_grade" ("grade_id", "grade_name", "grade_type") VALUES
	(9,'SP','Higher Officer');
REPLACE INTO "tbl_grade" ("grade_id", "grade_name", "grade_type") VALUES
	(10,'CONSTABLE','Sub Officer');
REPLACE INTO "tbl_grade" ("grade_id", "grade_name", "grade_type") VALUES
	(11,'HEAD CONSTABLE','Sub Officer');
REPLACE INTO "tbl_grade" ("grade_id", "grade_name", "grade_type") VALUES
	(12,'DGP','Higher Officer');
REPLACE INTO "tbl_grade" ("grade_id", "grade_name", "grade_type") VALUES
	(13,'ADGP','Higher Officer');
REPLACE INTO "tbl_grade" ("grade_id", "grade_name", "grade_type") VALUES
	(14,'DIG','Higher Officer');
REPLACE INTO "tbl_grade" ("grade_id", "grade_name", "grade_type") VALUES
	(16,'ACP','Higher Officer');
REPLACE INTO "tbl_grade" ("grade_id", "grade_name", "grade_type") VALUES
	(17,'DCP','Higher Officer');
/*!40000 ALTER TABLE "tbl_grade" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_higher_officer'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_higher_officer" (
  "higher_officer_id" int(11) NOT NULL auto_increment,
  "higher_officer_name" varchar(100) NOT NULL,
  "higher_officer_contact" varchar(100) NOT NULL,
  "higher_officer_address" varchar(100) NOT NULL,
  "district_id" int(11) NOT NULL,
  "grade_id" int(11) NOT NULL,
  "higher_officer_photo" varchar(100) NOT NULL,
  "login_id" int(11) NOT NULL,
  PRIMARY KEY  ("higher_officer_id")
) AUTO_INCREMENT=17;



#
# Dumping data for table 'tbl_higher_officer'
#

LOCK TABLES "tbl_higher_officer" WRITE;
/*!40000 ALTER TABLE "tbl_higher_officer" DISABLE KEYS;*/
REPLACE INTO "tbl_higher_officer" ("higher_officer_id", "higher_officer_name", "higher_officer_contact", "higher_officer_address", "district_id", "grade_id", "higher_officer_photo", "login_id") VALUES
	(12,'ALIAS','9995203656','ABCDE',16,5,'HigherOfficer_2020.png',20);
REPLACE INTO "tbl_higher_officer" ("higher_officer_id", "higher_officer_name", "higher_officer_contact", "higher_officer_address", "district_id", "grade_id", "higher_officer_photo", "login_id") VALUES
	(13,'BASIL ','7900793439','XYZ',16,4,'HigherOfficer_1248.jpg',21);
REPLACE INTO "tbl_higher_officer" ("higher_officer_id", "higher_officer_name", "higher_officer_contact", "higher_officer_address", "district_id", "grade_id", "higher_officer_photo", "login_id") VALUES
	(14,'JEKSON','9072749068','ASDFG',16,15,'HigherOfficer_1565.jpg',23);
REPLACE INTO "tbl_higher_officer" ("higher_officer_id", "higher_officer_name", "higher_officer_contact", "higher_officer_address", "district_id", "grade_id", "higher_officer_photo", "login_id") VALUES
	(16,'Abhi','9072749062','abcdefg',16,14,'HigherOfficer_1676.jpg',27);
/*!40000 ALTER TABLE "tbl_higher_officer" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_login'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_login" (
  "login_id" int(11) NOT NULL auto_increment,
  "login_email" varchar(100) NOT NULL,
  "login_password" varchar(100) NOT NULL,
  "login_type" varchar(100) NOT NULL,
  "login_status" int(11) NOT NULL default '0',
  "iv" varchar(200) NOT NULL default '0',
  "keystring" varchar(200) NOT NULL default '0',
  PRIMARY KEY  ("login_id")
) AUTO_INCREMENT=28;



#
# Dumping data for table 'tbl_login'
#

LOCK TABLES "tbl_login" WRITE;
/*!40000 ALTER TABLE "tbl_login" DISABLE KEYS;*/
REPLACE INTO "tbl_login" ("login_id", "login_email", "login_password", "login_type", "login_status", "iv", "keystring") VALUES
	(19,'alias@gmail.com','alias@123','Admin',0,'0','0');
REPLACE INTO "tbl_login" ("login_id", "login_email", "login_password", "login_type", "login_status", "iv", "keystring") VALUES
	(20,'aliasbenny1330@gmail.com','Alias@99','HigherOfficer',0,'DZqrBq13DLGVfBlb2los6g==','eZBjd4ldecuVFnWuiCKS4g==');
REPLACE INTO "tbl_login" ("login_id", "login_email", "login_password", "login_type", "login_status", "iv", "keystring") VALUES
	(21,'basilvaleth@gmail.com','KUNJAVA','HigherOfficer',0,'V4NREJHr0JL5B3Xi0Yy7mQ==','Bt7iP3lHQJoeKrF6VwAtig==');
REPLACE INTO "tbl_login" ("login_id", "login_email", "login_password", "login_type", "login_status", "iv", "keystring") VALUES
	(22,'arjunreghu22@gmail.com','Arjun@22','SubOfficer',0,'J72RQS83aKrA4zZGXXU4og==','q2nU2EOc1aSd2u3/9EvxVw==');
REPLACE INTO "tbl_login" ("login_id", "login_email", "login_password", "login_type", "login_status", "iv", "keystring") VALUES
	(23,'jeksonvarughese007@gmail.com','Jekson','HigherOfficer',0,'gE8pkQOH+lgRH0XeHwvjug==','ES25bwWxZ+BTRD/rfQ/JIw==');
REPLACE INTO "tbl_login" ("login_id", "login_email", "login_password", "login_type", "login_status", "iv", "keystring") VALUES
	(24,'geevarghesechacko111@gmail.com','Chacko','SubOfficer',0,'7xr1grRthUIg1HK9Gd2XCQ==','op9BHiqzr4Qwu2wNzTn6yw==');
REPLACE INTO "tbl_login" ("login_id", "login_email", "login_password", "login_type", "login_status", "iv", "keystring") VALUES
	(25,'abhinavreji4320@gmail.com','Unni@2255','SubOfficer',0,'df5it0GauIhQHWkrND2phg==','78LQFuepe5UZJJS7mfh/yQ==');
REPLACE INTO "tbl_login" ("login_id", "login_email", "login_password", "login_type", "login_status", "iv", "keystring") VALUES
	(27,'steveebraham@gmail.com','Steve@123','HigherOfficer',0,'OrTZ0u2eByaPLrzcmAQkvQ==','LprCSSewAdIA5QZnMxc33Q==');
/*!40000 ALTER TABLE "tbl_login" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_mail'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_mail" (
  "mail_id" int(11) NOT NULL auto_increment,
  "mail_from" varchar(100) NOT NULL,
  "mail_to" varchar(100) NOT NULL,
  "mail_time" varchar(100) NOT NULL,
  "mail_subject" varchar(100) NOT NULL,
  "mail_body" varchar(500) NOT NULL,
  "mail_latitude" varchar(100) NOT NULL default '0',
  "mail_longitude" varchar(100) NOT NULL default '0',
  "mail_status" int(11) NOT NULL default '0',
  PRIMARY KEY  ("mail_id")
) AUTO_INCREMENT=28;



#
# Dumping data for table 'tbl_mail'
#

LOCK TABLES "tbl_mail" WRITE;
/*!40000 ALTER TABLE "tbl_mail" DISABLE KEYS;*/
REPLACE INTO "tbl_mail" ("mail_id", "mail_from", "mail_to", "mail_time", "mail_subject", "mail_body", "mail_latitude", "mail_longitude", "mail_status") VALUES
	(21,'20','22','13:09:14','Details of case ','FzpjRp/sS4RPfaLT3A6j5n2XDMLrZkfeDluhY1rqu2XSDkcH8JbreB179GAuEOz5','0','0',0);
REPLACE INTO "tbl_mail" ("mail_id", "mail_from", "mail_to", "mail_time", "mail_subject", "mail_body", "mail_latitude", "mail_longitude", "mail_status") VALUES
	(22,'20','23','12:53:56','escape','Brrxib4qYFdq4m7DUOmDDb3nsBbS1VAuIBTfFOm8OBs=','0','0',0);
REPLACE INTO "tbl_mail" ("mail_id", "mail_from", "mail_to", "mail_time", "mail_subject", "mail_body", "mail_latitude", "mail_longitude", "mail_status") VALUES
	(23,'23','23','11:51:59','arjun','at7On4dD5T1Boe3mKWq7nttMO660hGfXYOUhmQro2EQ3TFZQ6uEgNHo35+RpXcvi','0','0',0);
REPLACE INTO "tbl_mail" ("mail_id", "mail_from", "mail_to", "mail_time", "mail_subject", "mail_body", "mail_latitude", "mail_longitude", "mail_status") VALUES
	(24,'23','20','11:57:08','leave','U0VKSkItwG0FgZQ9BCsq+2JVYYs2X/GId8Pk5/YIkzU=','0','0',0);
REPLACE INTO "tbl_mail" ("mail_id", "mail_from", "mail_to", "mail_time", "mail_subject", "mail_body", "mail_latitude", "mail_longitude", "mail_status") VALUES
	(25,'23','22','13:56:38','kliuygf','YsSnArlVylbN5kYOwHhK5Q==','0','0',0);
REPLACE INTO "tbl_mail" ("mail_id", "mail_from", "mail_to", "mail_time", "mail_subject", "mail_body", "mail_latitude", "mail_longitude", "mail_status") VALUES
	(26,'23','24','13:56:38','kliuygf','XeI3Xv1tg2bhgas03szbTwi0RBw1XVLQ6l27puTNLoQ=','0','0',0);
REPLACE INTO "tbl_mail" ("mail_id", "mail_from", "mail_to", "mail_time", "mail_subject", "mail_body", "mail_latitude", "mail_longitude", "mail_status") VALUES
	(27,'23','25','13:56:38','kliuygf','PHLC7EkYnmtSx1d6Wj0b9NHRZHIzi3e7VjHCr5fVGxCZNE82NMRAWGzOTutyEIAl','0','0',0);
/*!40000 ALTER TABLE "tbl_mail" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_place'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_place" (
  "place_id" int(11) NOT NULL auto_increment,
  "place_name" varchar(100) NOT NULL,
  "district_id" int(11) NOT NULL,
  PRIMARY KEY  ("place_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_place'
#

LOCK TABLES "tbl_place" WRITE;
/*!40000 ALTER TABLE "tbl_place" DISABLE KEYS;*/
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	(4,'Muvattupuzha',16);
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	(5,'Kolenchery',16);
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	(6,'Piravom',16);
/*!40000 ALTER TABLE "tbl_place" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_sub_officer'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_sub_officer" (
  "sub_officer_id" int(11) NOT NULL auto_increment,
  "sub_officer_name" varchar(100) NOT NULL,
  "sub_officer_address" varchar(100) NOT NULL,
  "sub_officer_photo" varchar(100) NOT NULL,
  "sub_officer_contact" varchar(100) NOT NULL,
  "place_id" int(11) NOT NULL,
  "grade_id" int(11) NOT NULL,
  "login_id" int(11) NOT NULL,
  PRIMARY KEY  ("sub_officer_id")
) AUTO_INCREMENT=9;



#
# Dumping data for table 'tbl_sub_officer'
#

LOCK TABLES "tbl_sub_officer" WRITE;
/*!40000 ALTER TABLE "tbl_sub_officer" DISABLE KEYS;*/
REPLACE INTO "tbl_sub_officer" ("sub_officer_id", "sub_officer_name", "sub_officer_address", "sub_officer_photo", "sub_officer_contact", "place_id", "grade_id", "login_id") VALUES
	(6,'Arjun','KLMNO','SubOfficer_1888.webp','9847261210',4,4,22);
REPLACE INTO "tbl_sub_officer" ("sub_officer_id", "sub_officer_name", "sub_officer_address", "sub_officer_photo", "sub_officer_contact", "place_id", "grade_id", "login_id") VALUES
	(7,'GEEVARGHESE','FDSA','SubOfficer_1985.jpg','9633447068',5,8,24);
REPLACE INTO "tbl_sub_officer" ("sub_officer_id", "sub_officer_name", "sub_officer_address", "sub_officer_photo", "sub_officer_contact", "place_id", "grade_id", "login_id") VALUES
	(8,'ABHINAV','QWERT','SubOfficer_1353.jpg','9074075416',6,11,25);
/*!40000 ALTER TABLE "tbl_sub_officer" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
