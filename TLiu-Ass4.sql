-- MySQL dump 10.13  Distrib 8.0.41, for macos15 (x86_64)
--
-- Host: localhost    Database: unitedhelpers
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `volunteerId` int NOT NULL,
  `taskCode` int NOT NULL,
  `startDateTime` datetime NOT NULL,
  `endDateTime` datetime NOT NULL,
  PRIMARY KEY (`volunteerId`,`taskCode`),
  KEY `fk_taskcode_idx` (`taskCode`),
  CONSTRAINT `fk_volunteer` FOREIGN KEY (`volunteerId`) REFERENCES `volunteer` (`volunteerId`),
  CONSTRAINT `taskcode` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,45,'2025-02-15 08:00:00','2025-02-15 16:00:00'),(1,48,'2025-02-16 08:00:00','2025-02-16 16:00:00'),(2,46,'2025-02-15 08:00:00','2025-02-15 16:00:00'),(2,51,'2025-02-18 08:00:00','2025-02-18 16:00:00'),(3,47,'2025-02-15 09:00:00','2025-02-15 17:00:00'),(4,49,'2025-02-17 08:00:00','2025-02-17 16:00:00'),(5,50,'2025-02-17 09:00:00','2025-02-17 17:00:00'),(6,52,'2025-02-18 08:00:00','2025-02-18 16:00:00'),(7,53,'2025-02-19 08:00:00','2025-02-20 15:00:00'),(8,54,'2025-02-20 09:00:00','2025-02-20 15:00:00'),(9,55,'2025-02-21 08:00:00','2025-02-21 16:00:00'),(10,45,'2025-02-21 08:00:00','2025-02-21 16:00:00');
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemId` int NOT NULL AUTO_INCREMENT,
  `itemDescription` varchar(45) NOT NULL,
  `itemValue` int NOT NULL,
  `quantityOnHand` int NOT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Bandages (box of 50)',6,5000),(2,'Antiseptic wipes (pack of 20)',3,7500),(3,'Pain relievers (bottle of 100)',9,3000),(4,'Children\'s books',5,2000),(5,'Stuffed animals',7,1800),(6,'Coloring books and crayons',5,2200),(7,'Rice (5 lb bag)',5,5000),(8,'Canned beans (15 oz)',1,8000),(9,'Dried fruit (1 lb package)',4,4000),(10,'Soap bars',1,10000),(11,'Toothbrushes',2,8000),(12,'Toothpaste (4 oz)',3,7500),(13,'Water purification tablets (pack of 50)',13,2000),(14,'Tarp (10\'x12\')',16,1000),(15,'Rope (50 ft)',9,1500),(16,'Basic tool kit',25,800);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `packageId` int NOT NULL AUTO_INCREMENT,
  `taskCode` int NOT NULL,
  `packageTypeId` int NOT NULL,
  `packageCreateDate` date NOT NULL,
  `packageWeight` int NOT NULL,
  PRIMARY KEY (`packageId`),
  KEY `fk_package_task_idx` (`taskCode`),
  KEY `fk_package_type_idx` (`packageTypeId`),
  CONSTRAINT `fk_package_task` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`),
  CONSTRAINT `fk_package_type` FOREIGN KEY (`packageTypeId`) REFERENCES `package_type` (`packageTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,45,1,'2025-02-15',3),(2,46,1,'2025-02-15',3),(3,47,1,'2025-02-15',3),(4,48,2,'2025-02-17',2),(5,49,2,'2025-02-17',2),(6,50,2,'2025-02-17',3),(7,51,3,'2025-02-18',8),(8,52,3,'2025-02-18',8),(9,53,3,'2025-02-18',8),(10,54,4,'2025-02-21',4),(11,55,4,'2025-02-21',4),(12,45,1,'2025-02-20',3),(13,46,2,'2025-02-21',4),(14,47,3,'2025-02-22',5);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_contents`
--

DROP TABLE IF EXISTS `package_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_contents` (
  `itemId` int NOT NULL,
  `packageId` int NOT NULL,
  `itemQuantity` int NOT NULL,
  PRIMARY KEY (`itemId`,`packageId`),
  KEY `fk_contents_package_idx` (`packageId`),
  CONSTRAINT `fk_contents_item` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `fk_contents_package` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_contents`
--

LOCK TABLES `package_contents` WRITE;
/*!40000 ALTER TABLE `package_contents` DISABLE KEYS */;
INSERT INTO `package_contents` VALUES (1,1,2),(1,2,2),(1,3,2),(2,1,3),(2,2,3),(2,3,3),(3,1,1),(3,2,1),(3,3,1),(4,4,1),(4,5,1),(4,6,1),(5,4,1),(5,5,1),(5,6,1),(6,4,1),(6,5,1),(6,6,1),(7,7,1),(7,8,1),(7,9,1),(8,7,6),(8,8,6),(8,9,6),(9,7,2),(9,8,2),(9,9,2),(10,10,3),(10,11,3),(11,10,2),(11,11,2),(12,10,2),(12,11,2),(13,10,1),(13,11,1);
/*!40000 ALTER TABLE `package_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_type`
--

DROP TABLE IF EXISTS `package_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_type` (
  `packageTypeId` int NOT NULL AUTO_INCREMENT,
  `packageTypeName` varchar(20) NOT NULL,
  PRIMARY KEY (`packageTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_type`
--

LOCK TABLES `package_type` WRITE;
/*!40000 ALTER TABLE `package_type` DISABLE KEYS */;
INSERT INTO `package_type` VALUES (1,'basic medical'),(2,'child-care'),(3,'food'),(4,'hygiene'),(5,'shelter');
/*!40000 ALTER TABLE `package_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_list`
--

DROP TABLE IF EXISTS `packing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_list` (
  `packingListId` int NOT NULL AUTO_INCREMENT,
  `packingListName` varchar(45) NOT NULL,
  `packingListDescription` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`packingListId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_list`
--

LOCK TABLES `packing_list` WRITE;
/*!40000 ALTER TABLE `packing_list` DISABLE KEYS */;
INSERT INTO `packing_list` VALUES (6,'Emergency Response Medical','2,000 medical packages. '),(7,'Children Support Program','1,500 child-care packages for refugee camp.'),(8,'Food Relief Initiative','3,000 food packages with non-perishable items.'),(9,'Flood Response Hygiene','1,000 hygiene packages for flood victims.'),(10,'Shelter Kit Assembly','500 shelter packages.'),(11,'Emergency Response Medical','2,000 medical packages. '),(12,'Children Support Program','1,500 child-care packages for refugee camp.'),(13,'Food Relief Initiative','3,000 food packages with non-perishable items.'),(14,'Flood Response Hygiene','1,000 hygiene packages for flood victims.'),(15,'Shelter Kit Assembly','500 shelter packages.');
/*!40000 ALTER TABLE `packing_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `taskCode` int NOT NULL AUTO_INCREMENT,
  `packingListId` int DEFAULT NULL,
  `taskTypeId` int NOT NULL,
  `taskStatusId` int NOT NULL,
  `taskDescription` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`taskCode`),
  KEY `taskStatusId_idx` (`taskStatusId`),
  KEY `taskTypeId_idx` (`taskTypeId`),
  KEY `packingListId_idx` (`packingListId`),
  CONSTRAINT `packlist` FOREIGN KEY (`packingListId`) REFERENCES `packing_list` (`packingListId`),
  CONSTRAINT `taskStatus` FOREIGN KEY (`taskStatusId`) REFERENCES `task_status` (`taskStatusId`),
  CONSTRAINT `taskType` FOREIGN KEY (`taskTypeId`) REFERENCES `task_type` (`taskTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (45,6,1,2,'Prepare 2,000 medical packages for hurricane victims'),(46,NULL,2,3,'Answer donation hotline calls'),(47,NULL,4,2,'Coordinate transportation of supplies to Houston'),(48,8,1,1,'Assemble 1,500 child-care packages'),(49,NULL,5,3,'Update donor database'),(50,9,1,2,'Prepare 3,000 food packages for drought affected areas'),(51,NULL,4,3,'Manage inventory at central warehouse'),(52,NULL,3,1,'Distribute flyers for upcoming fundraiser'),(53,10,1,2,'Assemble 1,000 hygiene kits for flood victims'),(54,NULL,5,1,'Train new volunteers on package assembly'),(55,12,1,1,'Prepare 500 shelter kits for earthquake response');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_status`
--

DROP TABLE IF EXISTS `task_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_status` (
  `taskStatusId` int NOT NULL AUTO_INCREMENT,
  `taskStatusName` varchar(20) NOT NULL,
  PRIMARY KEY (`taskStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_status`
--

LOCK TABLES `task_status` WRITE;
/*!40000 ALTER TABLE `task_status` DISABLE KEYS */;
INSERT INTO `task_status` VALUES (1,'open'),(2,'in progress'),(3,'ongoing'),(4,'completed'),(5,'cancelled');
/*!40000 ALTER TABLE `task_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_type`
--

DROP TABLE IF EXISTS `task_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_type` (
  `taskTypeId` int NOT NULL AUTO_INCREMENT,
  `taskTypeName` varchar(20) NOT NULL,
  PRIMARY KEY (`taskTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_type`
--

LOCK TABLES `task_type` WRITE;
/*!40000 ALTER TABLE `task_type` DISABLE KEYS */;
INSERT INTO `task_type` VALUES (1,'packing'),(2,'recurring'),(3,'distribution'),(4,'logistics'),(5,'administration');
/*!40000 ALTER TABLE `task_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer`
--

DROP TABLE IF EXISTS `volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer` (
  `volunteerId` int NOT NULL AUTO_INCREMENT,
  `volunteerName` varchar(20) NOT NULL,
  `volunteerAddress` varchar(45) NOT NULL,
  `volunteerTelephone` char(20) NOT NULL,
  PRIMARY KEY (`volunteerId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer`
--

LOCK TABLES `volunteer` WRITE;
/*!40000 ALTER TABLE `volunteer` DISABLE KEYS */;
INSERT INTO `volunteer` VALUES (1,'John Smith','123 Main St, New York, NY 10001','212-555-1234'),(2,'Maria Garcia','456 Park Ave, Boston, MA 02115','617-555-5678'),(3,'David Johnson','789 Elm St, Chicago, IL 60007','312-555-9012'),(4,'Sarah Williams','101 Pine St, San Francisco, CA 94111','415-555-3456'),(5,'Robert Brown','202 Oak St, Dallas, TX 75001','214-555-7890'),(6,'Jennifer Lee','303 Maple Ave, Seattle, WA 98101','206-555-2345'),(7,'Michael Wilson','404 Cedar Blvd, Miami, FL 33101','305-555-6789'),(8,'Lisa Anderson','505 Birch Ln, Denver, CO 80201','303-555-0123'),(9,'James Taylor','606 Spruce Dr, Atlanta, GA 30301','404-555-4567'),(10,'Emily Martinez','707 Willow Way, Phoenix, AZ 85001','602-555-8901');
/*!40000 ALTER TABLE `volunteer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-05  0:21:54
