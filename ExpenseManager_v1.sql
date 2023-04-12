CREATE DATABASE  IF NOT EXISTS `expenseapp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `expenseapp`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: expenseapp
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounttype`
--

DROP TABLE IF EXISTS `accounttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounttype` (
  `accountTypeId` int NOT NULL AUTO_INCREMENT,
  `accountType` varchar(30) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`accountTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounttype`
--

LOCK TABLES `accounttype` WRITE;
/*!40000 ALTER TABLE `accounttype` DISABLE KEYS */;
INSERT INTO `accounttype` VALUES (1,'cash',0),(2,'credit card',0),(3,'debit card',0),(4,'cheque',0);
/*!40000 ALTER TABLE `accounttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `categoryId` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(30) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Lunch',1),(2,'Dinner',1),(3,'BreakFast',1),(4,'Coffee',1),(5,'Automobile',0),(6,'Groceary',0),(7,'House',1),(8,'Electronics',0),(9,'Repairing',0),(10,'Medical',0),(11,'Clothes',0),(12,'Food',0),(13,'Stationery',0),(14,'House Hold',0),(15,'Books for maths',0),(16,'Other',0),(17,'D-Mart',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense` (
  `expenseId` int NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL,
  `categoryId` int DEFAULT NULL,
  `subCategoryId` int DEFAULT NULL,
  `vendorId` int DEFAULT NULL,
  `accountTypeId` int DEFAULT NULL,
  `statusId` int DEFAULT NULL,
  `ammount` int DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`expenseId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense`
--

LOCK TABLES `expense` WRITE;
/*!40000 ALTER TABLE `expense` DISABLE KEYS */;
INSERT INTO `expense` VALUES (2,'With Friends',12,6,1,2,5,700,'2023-03-12','Bought Three Cold Coffe in StarBucks. I paid 700 rs.',11),(7,'Furniture',7,3,5,1,5,10000,'2023-03-14','purchased 2 chairs',11),(12,'Pizza',12,6,6,3,9,300,'2023-03-29','Pizza Party',8),(13,'College Fees',16,9,8,4,8,32000,'2023-03-30','College Fees',27),(14,'Lunch',12,6,2,1,5,5000,'2023-04-01','With friends',11),(15,'dmy',5,1,1,3,8,500,'2023-04-02','dmy',4),(16,'dmy 2',14,3,2,1,5,700,'2023-04-02','gkjhvjhvjj',4),(17,'College Fees',16,9,8,4,6,15000,'2023-02-04','College Fees',27),(18,'Canteen BreakFast',12,9,7,1,5,200,'2023-04-03','Canteen Food',27),(19,'Coolege Books',13,9,7,1,5,1500,'2023-01-12','Books For College',27),(20,'Grocery',6,9,10,3,5,5000,'2023-01-20','Grocery for Home',18),(21,'Shopping',14,3,5,2,8,5000,'2023-01-18','Just Shopping',18),(22,'Dummy',12,9,3,1,5,4000,'2023-05-16','Dummy',8),(23,'Fees',16,9,7,4,5,5000,'2023-06-08','College Fees',5),(25,'Grocery',14,9,10,1,6,2000,'2023-04-11','I purchased grocery from D-Mart at 11/April',11),(26,'Candy',12,9,10,1,5,10,'2023-04-11','Dairy Milk',4),(27,'Dummy',12,1,6,1,5,800,'2023-07-20','asd',5),(28,'adsd',1,1,1,1,5,50000,'2023-08-16','',5),(29,'adsf',1,1,1,1,5,10000,'2023-10-13','asf',5),(30,'afs',1,1,1,1,5,23847,'2023-09-13','as',5),(31,'asfasf',1,1,1,4,8,14142,'2023-11-16','',5),(32,'asdsdmfbsdjfb',1,1,1,2,8,600,'2023-12-07','saf',5);
/*!40000 ALTER TABLE `expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income`
--

DROP TABLE IF EXISTS `income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `income` (
  `incomeId` int NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `accountTypeId` int DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `statusId` int DEFAULT NULL,
  `ammount` int DEFAULT NULL,
  PRIMARY KEY (`incomeId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income`
--

LOCK TABLES `income` WRITE;
/*!40000 ALTER TABLE `income` DISABLE KEYS */;
INSERT INTO `income` VALUES (1,'Salary','2023-03-19',11,3,'have just got 1 week salary',5,100000),(7,'Dinner','2023-03-23',11,2,'i had taken dinner at 23 march',6,2000),(8,'Stock Market','2023-03-27',11,2,'profit in treding',5,50000),(9,'Treding','2023-03-29',8,3,'profit of 2500 in treding',6,2500),(10,'SALARY','2023-04-11',4,4,'Got my salary',5,5000),(11,'salary','2023-04-11',11,4,'INcome',5,3000);
/*!40000 ALTER TABLE `income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `statusId` int NOT NULL AUTO_INCREMENT,
  `statusShow` varchar(30) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`statusId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'paid',1),(2,'unpaid',1),(3,'unpaid',1),(4,'unpaid',1),(5,'paid',0),(6,'partial paid',0),(7,'asd',1),(8,'unpaid',0),(9,'Not Decided Yet',0),(10,'Dummy',1),(11,'Dmy',1);
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategory` (
  `subCategoryId` int NOT NULL AUTO_INCREMENT,
  `subCategoryName` varchar(30) DEFAULT NULL,
  `categoryId` int DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`subCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES (1,'Bike',5,0),(2,'Car',5,0),(3,'Chair',7,0),(4,'chair',7,1),(5,'Paracetamol',10,0),(6,'Break Fast',12,0),(7,NULL,11,1),(8,'T-Shirts',11,0),(9,'Others',16,0);
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `role` int DEFAULT NULL,
  `otp` varchar(10) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `contactNum` varchar(20) DEFAULT NULL,
  `joindate` varchar(20) DEFAULT NULL,
  `imageURL` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Warren','Buffet','Warran@gmail.com','ll',2,NULL,'female','2005-05-25','9998887770','2023-03-08',NULL),(2,'Bill','Gates','Va@gmail.com','12345',2,NULL,'male','2005-05-25','9998887770','2023-03-08',NULL),(3,'Ram','Sita','ram@sita.com','ramsita',2,'F75K','male','2007-07-07','9998887770','2023-03-08',NULL),(4,'Elon','Musk','qwe@ewq.com','qwe',2,'IFVZ','male','2005-05-25','9998887770','2023-03-10','assets/profiles/4/Elon_images.jpeg'),(5,'admin','admin','admin@admin.com','admin',1,NULL,'male','2010-10-10','99999999','2023-02-20','assets/profiles/5/Admin image.png'),(7,'Gautam','Adani','qw@wq.com','1234',2,'EMXX','male','2005-05-25','9998887770','2023-03-01',NULL),(8,'Vaibhav','social','vaibhavsocial1111@gmail.com','asdfg',2,'VJP9','male','2002-01-24','9998887770','2023-03-15',NULL),(9,'pqr','rqp','pqr@rpq.com','pqr',2,NULL,'male','2011-05-11','9998887770','2023-03-11',NULL),(10,'xyz','zyx','xyz@zyx.com','xyz',2,NULL,'male','2005-05-25','9998887770','2023-03-11',NULL),(11,'VAIBHAV','Adessara','vaibhavadesara1111@gmail.com','242424',2,'','male','2002-01-24','12345678','2023-02-24','assets/profiles/11/logo.jpg'),(12,'Ravan','Lanka','ravan@lanka.com','ravan',2,NULL,'male','2005-06-19','9998887770','2023-03-25',NULL),(18,'z','z','z@z.com','z',2,NULL,'male','2005-05-25','9998887770','2023-03-21',NULL),(20,'x','x','x@x.com','xxx',2,NULL,'female','2011-06-15','9998887770','2023-03-21',NULL),(21,'d','d','d@d.com','234234',2,NULL,'female','2023-03-11','9998887770','2023-03-21',NULL),(22,'dd','dd','dd@d.com','zcczxczxczxc',2,NULL,'male','2023-03-11','9998887770','2023-03-25',NULL),(23,'validFn','validLn','valid@email.com','vvvvvvvv',2,NULL,'male','2021-01-24','9998887770','2023-03-25',NULL),(25,'dummy','dm','dummy@dummy.com','dmdmdmdm',2,NULL,'female','2023-03-09','9998887770','2023-03-26',NULL),(26,'dd','mm','d@m.com','dddddddd',2,NULL,'female','2023-03-30','9998887770','2023-03-26',NULL),(27,'salCollege','engineering','191260107001setice@gmail.com','11111111',2,'','male','2019-06-19','12312313123','2023-03-27',NULL),(28,'dmy','dmy','dmy1@dmy.com','dddddddd',2,NULL,'female','2023-03-09','8908901234','2023-03-27',NULL),(29,'asd','dsa','asd@dsa.in','asdasdasd',2,NULL,'male','2023-03-04','1231309843','2023-03-29',NULL),(30,'zxc','cxz','zxc@zxc.com','zxczxczxc',2,NULL,'female','2022-07-21','3213121233','2023-03-29',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `vendorId` int NOT NULL AUTO_INCREMENT,
  `vendorName` varchar(30) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`vendorId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'StarBucks',0),(2,'McDonald\'s',0),(3,'BBQ Nation',0),(4,'BBQ Nation',1),(5,'Croma',0),(6,'Domino\'s Pizza',0),(7,'College',0),(8,'Other',0),(9,'dmy',0),(10,'D-Mart',0);
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-12 12:21:07
