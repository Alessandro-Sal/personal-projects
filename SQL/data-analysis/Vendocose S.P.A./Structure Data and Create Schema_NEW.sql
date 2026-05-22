CREATE DATABASE  IF NOT EXISTS `vendocosespa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `vendocosespa`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: vendocosespa
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `ID_Category` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(45) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ID_Category`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Groceries','Everyday food items, canned goods, and pantry staples.',1),(2,'Cosmetics & Personal Care','Hygiene products, makeup, skincare, and hair care.',1),(3,'Electronics & Appliances','Consumer electronics, batteries, and small home appliances.',1),(4,'Home & Garden','Tools, cleaning supplies, and outdoor gardening equipment.',1),(5,'Clothing & Apparel','Men, women, and children seasonal clothing and accessories.',1),(6,'Toys & Games','Action figures, board games, puzzles, and educational toys.',1),(7,'Beverages','Water, soft drinks, juices, beer, and wine.',1),(8,'Pet Supplies','Pet food, toys, litter, and grooming accessories.',1),(9,'Bakery & Fresh','Freshly baked bread, pastries, croissants, and cakes.',1),(10,'Stationery & Office','Pens, paper, notebooks, and general office supplies.',1),(11,'Pasta & Rice','All types of dry pasta and rice.',1),(12,'Canned Goods','Tomato sauce, beans, and canned vegetables.',1),(13,'Alcoholic Drinks','Wines, spirits, and craft beers.',1),(14,'Soft Drinks & Water','Mineral water, cola, and juices.',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `ID_Customer` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `FiscalCode` varchar(16) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `LoyaltyCardNumber` varchar(20) DEFAULT NULL,
  `LoyaltyPoints` int DEFAULT '0',
  `RegistrationDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Customer`,`FiscalCode`),
  UNIQUE KEY `LoyaltyCardNumber` (`LoyaltyCardNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Mario','Rossi','RSSMRA85E12F205Z','m.rossi@email.it','+39 333 1122334','1985-05-12','Milano','VC-0001',1500,'2024-01-10 09:00:00'),(2,'Giulia','Bianchi','BNCGLI85E52F205X','g.bianchi@provider.com','+39 333 1122334','1985-05-12','Milano','VC-0002',420,'2024-01-10 09:00:00'),(3,'Luca','Verdi','VRDLCU88P02L219Y','l.verdi@test.it','+39 335 6677889','1988-09-02','Torino','VC-0003',50,'2024-04-01 10:15:00'),(4,'Francesca','Neri','NREFNC78S63H501K','fra.neri@web.com','+39 347 5566778','1978-11-23','Roma','VC-0004',1800,'2024-02-15 14:30:00'),(5,'Alessandro','Gialli','GLLLSN85E12F205T',NULL,'+39 333 1122334','1985-05-12','Milano','VC-0005',10,'2024-01-10 09:00:00'),(6,'Martina','Marrone','MRRMTN92C70F839O','martina.m@email.it','+39 320 9988776','1992-03-30','Napoli','VC-0006',300,'2024-03-05 11:20:00'),(7,'Davide','Viola','VLADVD92C30F839U','davide.v@work.net','+39 320 9988776','1992-03-30','Napoli','VC-0007',850,'2024-03-05 11:20:00'),(8,'Chiara','Rosa','RSACHR80L55G273M',NULL,'+39 340 4433221','1980-07-15','Palermo','VC-0008',600,'2024-03-20 16:45:00'),(9,'Roberto','Gallo','GLLRRT88P02L219B','r.gallo@mail.com','+39 335 6677889','1988-09-02','Torino','VC-0009',120,'2024-04-01 10:15:00'),(10,'Elena','Costa','CSTLEN78S63H501J','elena.c@web.it','+39 347 5566778','1978-11-23','Roma','VC-0010',950,'2024-02-15 14:30:00'),(11,'Marco','Fontana','FNTMRC78S23F205W','marco.f@test.it','+39 347 5566778','1978-11-23','Milano','VC-0011',2500,'2024-02-15 14:30:00'),(12,'Sara','Rizzo','RZZSRA80L55G273N','s.rizzo@provider.com','+39 340 4433221','1980-07-15','Palermo','VC-0012',30,'2024-03-20 16:45:00'),(13,'Andrea','Moretti','MRTNDR88P02L219C',NULL,'+39 335 6677889','1988-09-02','Torino','VC-0013',0,'2024-04-01 10:15:00'),(14,'Silvia','Barbieri','BRBSLV95T58L736D','silvia.b@email.com','+39 331 2233445','1995-12-18','Venezia','VC-0014',450,'2024-04-12 17:00:00'),(15,'Stefano','Lombardi','LMBSFN95T18L736E','stefano.l@work.it','+39 331 2233445','1995-12-18','Venezia','VC-0015',890,'2024-04-12 17:00:00'),(16,'Laura','Cassano','CSSLRA80L55G273V','l.cassano@mail.net','+39 340 4433221','1980-07-15','Palermo','VC-0016',15,'2024-03-20 16:45:00'),(17,'Giovanni','Ferrara','FRRGNN85E12F205Q',NULL,'+39 333 1122334','1985-05-12','Milano','VC-0017',330,'2024-01-10 09:00:00'),(18,'Anna','Esposito','SPSNNA95T58L736F','anna.e@test.com','+39 331 2233445','1995-12-18','Venezia','VC-0018',750,'2024-04-12 17:00:00'),(19,'Michele','Ricci','RCCMHL78S23H501L','m.ricci@web.it','+39 347 5566778','1978-11-23','Roma','VC-0019',1100,'2024-02-15 14:30:00'),(20,'Paola','Marino','MRNPLA92C70F839P','paola.m@provider.com','+39 320 9988776','1992-03-30','Napoli','VC-0020',60,'2024-03-05 11:20:00');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ordertosupplier`
--

DROP TABLE IF EXISTS `ordertosupplier`;
/*!50001 DROP VIEW IF EXISTS `ordertosupplier`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordertosupplier` AS SELECT 
 1 AS `WarehouseName`,
 1 AS `CategoryID`,
 1 AS `CategoryName`,
 1 AS `TotalCategoryStock`,
 1 AS `RestockLevel`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `ID_PaymentMethod` int NOT NULL AUTO_INCREMENT,
  `MethodName` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_PaymentMethod`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES (1,'Cash'),(2,'Credit Card'),(3,'Debit Card (Bancomat)'),(4,'Mobile App (Satispay/Apple Pay)'),(5,'Meal Vouchers (Ticket Restaurant)');
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ID_Product` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(45) NOT NULL,
  `Barcode` varchar(13) DEFAULT NULL,
  `Brand` varchar(100) DEFAULT NULL,
  `Weight_Volume` varchar(20) DEFAULT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  `TaxRate` decimal(4,2) DEFAULT '22.00',
  `FK_CategoryID` int NOT NULL,
  `Description` text,
  PRIMARY KEY (`ID_Product`),
  UNIQUE KEY `Barcode` (`Barcode`),
  KEY `FK_Product_Category` (`FK_CategoryID`),
  CONSTRAINT `FK_Product_Category` FOREIGN KEY (`FK_CategoryID`) REFERENCES `category` (`ID_Category`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Pasta 500g','8001234560010','Barilla','500g',1.20,4.00,1,'Classic Italian durum wheat semolina pasta, perfect for daily meals.'),(2,'Tomato Sauce 700ml','8001234560027','Mutti','700ml',0.90,4.00,1,'100% Italian tomato puree, rich and smooth texture.'),(3,'Olive Oil 1L','8001234560034','Monini','1L',6.50,4.00,1,'Extra virgin olive oil, cold extracted.'),(4,'Coffee Beans 1kg','8001234560041','Lavazza','1kg',12.90,10.00,1,'Premium Arabica and Robusta coffee beans blend.'),(5,'Arborio Rice 1kg','8001234560058','Gallo','1kg',2.50,4.00,1,'High-quality Arborio rice, ideal for traditional risotto.'),(6,'Shampoo 250ml','8001234560065','Pantene','250ml',3.50,22.00,2,'Nourishing shampoo for dry and damaged hair.'),(7,'Face Cream 50ml','8001234560072','Nivea','50ml',15.00,22.00,2,'Hydrating day face cream with SPF 15.'),(8,'Toothpaste 75ml','8001234560089','Colgate','75ml',2.00,22.00,2,'Total protection toothpaste with fluoride.'),(9,'Body Wash 500ml','8001234560096','Dove','500ml',4.20,22.00,2,'Deep moisture body wash, gentle on sensitive skin.'),(10,'AA Batteries (4 Pack)','8001234560102','Duracell','4-Pack',4.50,22.00,3,'Long-lasting AA alkaline batteries.'),(11,'USB-C Cable 2m','8001234560119','Anker','2m',8.00,22.00,3,'Fast charging USB-C to USB-C braided cable.'),(12,'Wireless Mouse','8001234560126','Logitech','100g',25.00,22.00,3,'Ergonomic wireless mouse with nano receiver.'),(13,'Bluetooth Earbuds','8001234560133','Sony','50g',45.00,22.00,3,'Noise-cancelling bluetooth wireless earbuds.'),(14,'Frying Pan 24cm','8001234560140','Tefal','24cm',18.50,22.00,4,'Non-stick frying pan with thermo-signal technology.'),(15,'LED Bulb 10W','8001234560157','Philips','10W',5.00,22.00,4,'Energy-saving LED bulb, warm white (2700K).'),(16,'Garden Hose 15m','8001234560164','Gardena','15m',22.00,22.00,4,'Durable garden hose with adjustable nozzle.'),(17,'Cotton T-Shirt (M)','8001234560171','H&M','M',9.90,22.00,5,'100% basic cotton t-shirt.'),(18,'Winter Socks (Pair)','8001234560188','Calzedonia','Pair',6.50,22.00,5,'Thermal winter socks.'),(19,'Denim Jeans (L)','8001234560195','Levi\'s','L',35.00,22.00,5,'Classic fit denim jeans (501).'),(20,'Board Game - Monopoly','8001234560201','Hasbro','Box',35.00,22.00,6,'Classic property trading board game.'),(21,'Puzzle 1000 Pieces','8001234560218','Ravensburger','1000 Pcs',14.00,22.00,6,'Landscape jigsaw puzzle.'),(22,'Action Figure','8001234560225','Marvel','15cm',19.90,22.00,6,'Collectible superhero action figure.'),(23,'Mineral Water 1.5L','8001234560232','San Benedetto','1.5L',0.40,22.00,7,'Natural mineral water.'),(24,'Cola Can 330ml','8001234560249','Coca-Cola','330ml',0.80,22.00,7,'Classic cola carbonated soft drink.'),(25,'Craft Beer 500ml','8001234560256','Moretti','500ml',3.50,22.00,7,'Traditional Italian lager beer.'),(26,'Red Wine Bottle 750ml','8001234560263','Tavernello','750ml',8.50,22.00,7,'Table red wine.'),(27,'Dry Dog Food 3kg','8001234560270','Pedigree','3kg',12.00,22.00,8,'Complete dry pet food for adult dogs.'),(28,'Cat Litter 5L','8001234560287','Catsan','5L',6.50,22.00,8,'Absorbent hygiene litter for cats.'),(29,'Pet Toy Bone','8001234560294','Kong','1 Pc',4.00,22.00,8,'Durable rubber chew toy.'),(30,'Sliced Bread 400g','8001234560300','Mulino Bianco','400g',1.50,4.00,9,'Soft sliced bread for toast.'),(31,'Chocolate Croissant','8001234560317','Bauli','1 Pc',1.20,10.00,9,'Soft pastry croissant filled with chocolate cream.'),(32,'Baguette','8001234560324','VendiCose Bakery','250g',1.00,4.00,9,'Freshly baked crusty French baguette.'),(33,'A4 Paper (500 sheets)','8001234560331','Fabriano','500 Sheets',5.50,22.00,10,'A4 printer paper, 80gsm.'),(34,'Blue Pens (Pack of 10)','8001234560348','Bic','10-Pack',3.00,22.00,10,'Blue ballpoint pens.'),(35,'Sticky Notes','8001234560355','Post-it','100 Pcs',2.50,22.00,10,'Yellow sticky notes.'),(36,'Notebook A5','8001234560362','Moleskine','A5',4.00,22.00,10,'Hardcover ruled notebook.'),(37,'Green Tea (20 bags)','8001234560379','Lipton','20 Bags',2.80,10.00,7,'Pure green tea bags.'),(38,'Laundry Detergent 2L','8001234560386','Dash','2L',7.50,22.00,4,'Liquid laundry detergent for white and colored clothes.'),(39,'Shaving Cream 200ml','8001234560393','Gillette','200ml',3.20,22.00,2,'Sensitive skin shaving cream with aloe vera.'),(40,'HDMI Cable 1.5m','8001234560409','Amazon Basics','1.5m',6.00,22.00,3,'High-Speed 4K HDMI Cable.');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `productordersupplier`
--

DROP TABLE IF EXISTS `productordersupplier`;
/*!50001 DROP VIEW IF EXISTS `productordersupplier`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productordersupplier` AS SELECT 
 1 AS `WarehouseName`,
 1 AS `Category`,
 1 AS `Product`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `restock`
--

DROP TABLE IF EXISTS `restock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restock` (
  `ID_Restock` int NOT NULL AUTO_INCREMENT,
  `FK_WarehouseID` int NOT NULL,
  `FK_CategoryID` int NOT NULL,
  `Min_Level_Category` int DEFAULT '0',
  PRIMARY KEY (`ID_Restock`),
  UNIQUE KEY `UQ_Restock_Warehouse_Category` (`FK_WarehouseID`,`FK_CategoryID`),
  KEY `FK_Restock_Category` (`FK_CategoryID`),
  CONSTRAINT `FK_Restock_Category` FOREIGN KEY (`FK_CategoryID`) REFERENCES `category` (`ID_Category`),
  CONSTRAINT `FK_Restock_Warehouse` FOREIGN KEY (`FK_WarehouseID`) REFERENCES `warehouse` (`ID_Warehouse`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restock`
--

LOCK TABLES `restock` WRITE;
/*!40000 ALTER TABLE `restock` DISABLE KEYS */;
INSERT INTO `restock` VALUES (1,1,1,2000),(2,1,2,800),(3,1,3,300),(4,1,4,500),(5,1,7,3000),(6,2,1,1500),(7,2,2,600),(8,2,3,250),(9,2,4,400),(10,2,7,2500),(11,3,1,1200),(12,3,2,500),(13,3,3,150),(14,3,4,300),(15,3,7,2000),(16,4,1,800),(17,4,2,300),(18,4,3,100),(19,4,4,150),(20,4,7,1000),(21,5,1,1000),(22,5,2,400),(23,5,3,200),(24,5,4,200),(25,5,7,1500);
/*!40000 ALTER TABLE `restock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `ID_Sales` int NOT NULL AUTO_INCREMENT,
  `FK_ShopID` int NOT NULL,
  `DateOrderSale` datetime DEFAULT CURRENT_TIMESTAMP,
  `FK_PaymentMethodID` int DEFAULT NULL,
  `FK_CustomerID` int DEFAULT NULL,
  PRIMARY KEY (`ID_Sales`),
  KEY `FK_Sales_Shop` (`FK_ShopID`),
  KEY `FK_Sales_Customer` (`FK_CustomerID`),
  KEY `FK_Sales_Payment` (`FK_PaymentMethodID`),
  CONSTRAINT `FK_Sales_Customer` FOREIGN KEY (`FK_CustomerID`) REFERENCES `customer` (`ID_Customer`),
  CONSTRAINT `FK_Sales_Payment` FOREIGN KEY (`FK_PaymentMethodID`) REFERENCES `payment_method` (`ID_PaymentMethod`),
  CONSTRAINT `FK_Sales_Shop` FOREIGN KEY (`FK_ShopID`) REFERENCES `shop` (`ID_Shop`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,1,'2026-04-10 08:30:00',3,1),(2,1,'2026-04-10 09:15:00',1,NULL),(3,2,'2026-04-10 10:05:00',3,11),(4,3,'2026-04-10 11:20:00',2,2),(5,4,'2026-04-10 12:45:00',1,NULL),(6,5,'2026-04-11 08:10:00',3,4),(7,6,'2026-04-11 09:30:00',3,7),(8,7,'2026-04-11 10:15:00',1,NULL),(9,8,'2026-04-11 11:50:00',2,19),(10,9,'2026-04-11 13:25:00',3,10),(11,10,'2026-04-12 14:00:00',1,NULL),(12,11,'2026-04-12 15:30:00',3,8),(13,12,'2026-04-12 16:45:00',4,NULL),(14,13,'2026-04-12 17:10:00',4,14),(15,14,'2026-04-13 08:05:00',2,15),(16,15,'2026-04-13 09:20:00',1,NULL),(17,1,'2026-04-13 10:35:00',4,5),(18,2,'2026-04-13 11:50:00',3,16),(19,5,'2026-04-13 12:15:00',5,NULL),(20,8,'2026-04-14 13:30:00',2,18),(21,11,'2026-04-14 14:45:00',4,20),(22,13,'2026-04-14 15:00:00',5,NULL),(23,3,'2026-04-14 16:20:00',3,6),(24,6,'2026-04-15 08:45:00',2,9),(25,9,'2026-04-15 09:10:00',5,NULL),(26,12,'2026-04-15 10:25:00',4,12),(27,14,'2026-04-15 11:40:00',5,3),(28,4,'2026-04-15 12:55:00',5,NULL),(29,7,'2026-04-15 14:10:00',4,17),(30,10,'2026-04-15 15:30:00',2,13);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_details`
--

DROP TABLE IF EXISTS `sales_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_details` (
  `ID_SalesDetails` int NOT NULL AUTO_INCREMENT,
  `FK_ProductID` int NOT NULL,
  `FK_SalesID` int NOT NULL,
  `Quantity` int NOT NULL,
  `TotalPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_SalesDetails`),
  KEY `FK_SalesDet_Product` (`FK_ProductID`),
  KEY `FK_SalesDet_Sales` (`FK_SalesID`),
  CONSTRAINT `FK_SalesDet_Product` FOREIGN KEY (`FK_ProductID`) REFERENCES `product` (`ID_Product`),
  CONSTRAINT `FK_SalesDet_Sales` FOREIGN KEY (`FK_SalesID`) REFERENCES `sales` (`ID_Sales`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_details`
--

LOCK TABLES `sales_details` WRITE;
/*!40000 ALTER TABLE `sales_details` DISABLE KEYS */;
INSERT INTO `sales_details` VALUES (1,1,1,5,6.00),(2,2,1,3,2.70),(3,23,1,6,2.40),(4,4,2,1,12.90),(5,30,2,2,3.00),(6,10,3,2,9.00),(7,12,3,1,25.00),(8,33,3,1,5.50),(9,6,4,2,7.00),(10,9,4,1,4.20),(11,38,4,1,7.50),(12,20,5,1,35.00),(13,24,5,4,3.20),(14,3,6,2,13.00),(15,5,6,3,7.50),(16,26,6,2,17.00),(17,14,7,1,18.50),(18,1,7,4,4.80),(19,27,8,1,12.00),(20,29,8,2,8.00),(21,31,9,5,6.00),(22,4,9,2,25.80),(23,17,10,2,19.80),(24,19,10,1,35.00),(25,23,11,12,4.80),(26,2,11,5,4.50),(27,7,12,1,15.00),(28,8,12,3,6.00),(29,11,13,2,16.00),(30,40,13,1,6.00),(31,16,14,1,22.00),(32,15,14,4,20.00),(33,1,15,10,12.00),(34,2,15,10,9.00),(35,3,15,3,19.50),(36,34,16,2,6.00),(37,36,16,3,12.00),(38,13,17,1,45.00),(39,39,18,1,3.20),(40,9,18,2,8.40),(41,21,19,1,14.00),(42,22,19,2,39.80),(43,25,20,6,21.00),(44,26,20,3,25.50),(45,5,21,4,10.00),(46,1,21,2,2.40),(47,28,22,2,13.00),(48,27,22,1,12.00),(49,18,23,3,19.50),(50,30,24,3,4.50),(51,32,24,2,2.00),(52,23,25,24,9.60),(53,24,25,10,8.00),(54,6,26,3,10.50),(55,8,26,2,4.00),(56,10,27,4,18.00),(57,15,27,2,10.00),(58,33,28,5,27.50),(59,35,28,4,10.00),(60,38,29,2,15.00),(61,3,29,1,6.50),(62,20,30,2,70.00),(63,21,30,1,14.00);
/*!40000 ALTER TABLE `sales_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop` (
  `ID_Shop` int NOT NULL AUTO_INCREMENT,
  `ShopName` varchar(45) NOT NULL,
  `Location` varchar(45) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `ContactPhone` varchar(20) DEFAULT NULL,
  `SquareMeters` int DEFAULT NULL,
  `OpeningHours` varchar(100) DEFAULT NULL,
  `FK_WarehouseID` int NOT NULL,
  PRIMARY KEY (`ID_Shop`),
  KEY `FK_WarehouseShop` (`FK_WarehouseID`),
  CONSTRAINT `FK_WarehouseShop` FOREIGN KEY (`FK_WarehouseID`) REFERENCES `warehouse` (`ID_Warehouse`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES (1,'VendiCose Duomo','Milano Centro','Piazza del Duomo, 15','+39 02 112233',1200,'Mon-Sun: 08:00 - 22:00',1),(2,'VendiCose Navigli','Milano Sud','Ripa di Porta Ticinese, 45','+39 02 223344',800,'Mon-Sun: 08:30 - 23:00',1),(3,'VendiCose Bovisa','Milano Nord','Via Bovisasca, 80','+39 02 334455',2500,'Mon-Sat: 08:00 - 21:00',1),(4,'VendiCose Lingotto','Torino','Via Nizza, 262','+39 011 445566',1800,'Mon-Sun: 09:00 - 21:00',1),(5,'VendiCose Colosseo','Roma Centro','Piazza del Colosseo, 1','+39 06 556677',950,'Mon-Sun: 08:00 - 22:00',2),(6,'VendiCose Eur','Roma Sud','Viale Europa, 120','+39 06 667788',3000,'Mon-Sat: 08:30 - 21:30',2),(7,'VendiCose Parioli','Roma Nord','Viale Parioli, 40','+39 06 778899',600,'Mon-Sun: 09:00 - 20:30',2),(8,'VendiCose Vomero','Napoli','Via Alessandro Scarlatti, 110','+39 081 112233',1500,'Mon-Sun: 08:00 - 21:00',3),(9,'VendiCose Posillipo','Napoli Ovest','Via Posillipo, 300','+39 081 223344',700,'Mon-Sat: 08:30 - 20:30',3),(10,'VendiCose Bari','Bari Centro','Corso Vittorio Emanuele, 50','+39 080 334455',1100,'Mon-Sun: 08:00 - 21:00',3),(11,'VendiCose Politeama','Palermo','Piazza Ruggero Settimo, 15','+39 091 445566',1300,'Mon-Sun: 08:30 - 21:30',4),(12,'VendiCose Catania','Catania Centro','Via Etnea, 200','+39 095 556677',1000,'Mon-Sat: 08:00 - 21:00',4),(13,'VendiCose San Marco','Venezia','Sestiere San Marco, 300','+39 041 667788',400,'Mon-Sun: 09:00 - 20:00',5),(14,'VendiCose Mestre','Venezia Terraferma','Piazza Ferretto, 25','+39 041 778899',2200,'Mon-Sun: 08:00 - 21:00',5),(15,'VendiCose Padova','Padova Est','Via Venezia, 100','+39 049 889900',1600,'Mon-Sat: 08:30 - 21:00',5);
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `ID_Status` int NOT NULL AUTO_INCREMENT,
  `StatusDescription` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_Status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Pending'),(2,'Processing'),(3,'Shipped'),(4,'Delivered'),(5,'Cancelled');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `ID_Stock` int NOT NULL AUTO_INCREMENT,
  `FK_WarehouseID` int NOT NULL,
  `FK_ProductID` int NOT NULL,
  `QuantityAvailable` int DEFAULT '0',
  PRIMARY KEY (`ID_Stock`),
  UNIQUE KEY `UQ_Stock_Warehouse_Product` (`FK_WarehouseID`,`FK_ProductID`),
  KEY `FK_Stock_Product` (`FK_ProductID`),
  CONSTRAINT `FK_Stock_Product` FOREIGN KEY (`FK_ProductID`) REFERENCES `product` (`ID_Product`),
  CONSTRAINT `FK_Stock_Warehouse` FOREIGN KEY (`FK_WarehouseID`) REFERENCES `warehouse` (`ID_Warehouse`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,1,1,2500),(2,1,2,1800),(3,1,3,600),(4,1,4,450),(5,1,6,900),(6,1,7,300),(7,1,10,800),(8,1,12,150),(9,1,14,200),(10,1,20,80),(11,1,23,5000),(12,1,27,400),(13,1,30,800),(14,1,33,600),(15,1,38,550),(16,2,1,1800),(17,2,2,1200),(18,2,3,400),(19,2,6,700),(20,2,11,300),(21,2,15,600),(22,2,17,450),(23,2,21,120),(24,2,24,3000),(25,2,28,350),(26,2,31,500),(27,2,34,400),(28,2,39,250),(29,3,1,1500),(30,3,2,900),(31,3,4,300),(32,3,8,800),(33,3,13,100),(34,3,16,150),(35,3,18,500),(36,3,25,1200),(37,3,29,200),(38,3,32,600),(39,3,35,300),(40,4,1,900),(41,4,3,250),(42,4,9,400),(43,4,10,300),(44,4,19,150),(45,4,22,90),(46,4,26,600),(47,4,36,250),(48,4,40,120),(49,5,2,1000),(50,5,5,800),(51,5,7,200),(52,5,12,80),(53,5,14,150),(54,5,20,60),(55,5,23,2000),(56,5,27,250),(57,5,30,400),(58,5,37,500);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `ID_Supplier` int NOT NULL AUTO_INCREMENT,
  `SupplierName` varchar(100) NOT NULL,
  `VAT_Number` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Country` varchar(50) DEFAULT 'Italy',
  PRIMARY KEY (`ID_Supplier`),
  UNIQUE KEY `VAT_Number` (`VAT_Number`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Global Foods Inc.','IT01234567890','orders@globalfoods.com','+39 02 1234567','Via dell Industria, 10','Milano','Italy'),(2,'Beauty & Care Corp.','FR98765432109','sales@beautycare.com','+33 1 2345678','15 Rue de la Beauté','Paris','France'),(3,'Tech Gadgets Ltd.','GB112233445','supply@techgadgets.com','+44 20 7946 012','100 Innovation Way','London','United Kingdom'),(4,'Home Essentials LLC','IT09876543211','b2b@homeessentials.net','+39 055 987654','Viale dell Artigianato, 45','Firenze','Italy'),(5,'PlayTime Distributors','DE123456789','info@playtimedist.com','+49 30 123456','Spielstraße 12','Berlin','Germany'),(6,'Aqua Drink Group','IT11223344556','water@aquadrink.com','+39 045 112233','Via delle Fonti, 1','Verona','Italy'),(7,'Happy Pets Co.','NL987654321B01','wholesale@happypets.com','+31 20 1234567','Dierenlaan 5','Amsterdam','Netherlands'),(8,'Fresh Oven Bakery','IT22334455667','orders@freshoven.it','+39 081 223344','Corso del Forno, 88','Napoli','Italy'),(9,'Paper & Pens Ltd.','IT33445566778','sales@paperpens.com','+39 011 334455','Via della Carta, 20','Torino','Italy'),(10,'Fashion Trend B2B','IT44556677889','supply@fashiontrend.com','+39 02 445566','Via Monte Napoleone B2B, 5','Milano','Italy'),(11,'AgriFresh Produce','ESB12345678','produce@agrifresh.com','+34 91 123456','Avenida de la Agricultura, 100','Valencia','Spain'),(12,'ElectroWorld Imports','IT55667788990','import@electroworld.com','+39 06 556677','Viale della Tecnologia, 500','Roma','Italy');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_purchase`
--

DROP TABLE IF EXISTS `supplier_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_purchase` (
  `ID_Supplier_Purchase` int NOT NULL AUTO_INCREMENT,
  `FK_SupplierID` int NOT NULL,
  `OrderDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `FK_Status` int NOT NULL,
  PRIMARY KEY (`ID_Supplier_Purchase`),
  KEY `FK_Order_Supplier` (`FK_SupplierID`),
  KEY `FK_Order_Status_idx` (`FK_Status`),
  CONSTRAINT `FK_Order_Status` FOREIGN KEY (`FK_Status`) REFERENCES `status` (`ID_Status`),
  CONSTRAINT `FK_Order_Supplier` FOREIGN KEY (`FK_SupplierID`) REFERENCES `supplier` (`ID_Supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_purchase`
--

LOCK TABLES `supplier_purchase` WRITE;
/*!40000 ALTER TABLE `supplier_purchase` DISABLE KEYS */;
INSERT INTO `supplier_purchase` VALUES (1,1,'2026-04-01 10:00:00',4),(2,6,'2026-04-05 11:30:00',4),(3,2,'2026-04-10 14:00:00',3),(4,3,'2026-04-12 09:15:00',2),(5,7,'2026-04-13 16:45:00',2),(6,1,'2026-04-14 08:30:00',1),(7,4,'2026-04-14 10:20:00',1),(8,8,'2026-04-14 18:00:00',3),(9,10,'2026-04-15 07:45:00',1),(10,5,'2026-04-15 09:00:00',1);
/*!40000 ALTER TABLE `supplier_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_purchase_details`
--

DROP TABLE IF EXISTS `supplier_purchase_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_purchase_details` (
  `ID_Supplier_Purchase_Details` int NOT NULL AUTO_INCREMENT,
  `FK_Supplier_PurchaseID` int NOT NULL,
  `FK_ProductID` int NOT NULL,
  `FK_WarehouseID` int NOT NULL,
  `OrderQuantity` int NOT NULL,
  `UnitPurchasePrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Supplier_Purchase_Details`),
  KEY `FK_DetPurch_Order` (`FK_Supplier_PurchaseID`),
  KEY `FK_DetPurch_Product` (`FK_ProductID`),
  KEY `FK_DetPurch_Warehouse` (`FK_WarehouseID`),
  CONSTRAINT `FK_DetPurch_Order` FOREIGN KEY (`FK_Supplier_PurchaseID`) REFERENCES `supplier_purchase` (`ID_Supplier_Purchase`),
  CONSTRAINT `FK_DetPurch_Product` FOREIGN KEY (`FK_ProductID`) REFERENCES `product` (`ID_Product`),
  CONSTRAINT `FK_DetPurch_Warehouse` FOREIGN KEY (`FK_WarehouseID`) REFERENCES `warehouse` (`ID_Warehouse`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_purchase_details`
--

LOCK TABLES `supplier_purchase_details` WRITE;
/*!40000 ALTER TABLE `supplier_purchase_details` DISABLE KEYS */;
INSERT INTO `supplier_purchase_details` VALUES (1,1,1,1,2000,0.75),(2,1,2,1,1500,0.50),(3,1,1,2,1500,0.75),(4,2,23,3,3000,0.15),(5,2,24,3,1000,0.35),(6,2,23,4,1500,0.15),(7,3,6,1,500,1.80),(8,3,7,1,200,8.00),(9,3,9,1,400,2.10),(10,4,10,2,1000,2.00),(11,4,12,2,100,12.00),(12,4,13,2,50,20.00),(13,5,27,5,300,6.50),(14,5,28,5,400,3.20),(15,6,4,4,200,7.50),(16,6,5,4,500,1.20),(17,7,14,3,100,9.00),(18,7,16,3,50,11.50),(19,8,30,1,1000,0.60),(20,8,31,1,800,0.40),(21,9,17,2,300,4.50),(22,9,19,2,150,16.00),(23,10,20,5,100,18.00),(24,10,21,5,200,6.50);
/*!40000 ALTER TABLE `supplier_purchase_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `ID_Warehouse` int NOT NULL AUTO_INCREMENT,
  `WarehouseName` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Warehouse`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'North Hub - Milano'),(2,'Central Hub - Roma'),(3,'South Hub - Napoli'),(4,'Islands Hub - Palermo'),(5,'East Hub - Venezia');
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `ordertosupplier`
--

/*!50001 DROP VIEW IF EXISTS `ordertosupplier`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ordertosupplier` AS select concat(`w`.`ID_Warehouse`,' - ',`w`.`WarehouseName`) AS `WarehouseName`,`c`.`ID_Category` AS `CategoryID`,`c`.`CategoryName` AS `CategoryName`,sum(`s`.`QuantityAvailable`) AS `TotalCategoryStock`,`r`.`Min_Level_Category` AS `RestockLevel` from ((((`vendocosespa_3`.`stock` `s` join `vendocosespa_3`.`product` `p` on((`s`.`FK_ProductID` = `p`.`ID_Product`))) join `vendocosespa_3`.`category` `c` on((`p`.`FK_CategoryID` = `c`.`ID_Category`))) join `vendocosespa_3`.`warehouse` `w` on((`s`.`FK_WarehouseID` = `w`.`ID_Warehouse`))) join `vendocosespa_3`.`restock` `r` on(((`s`.`FK_WarehouseID` = `r`.`FK_WarehouseID`) and (`p`.`FK_CategoryID` = `r`.`FK_CategoryID`)))) group by concat(`w`.`ID_Warehouse`,' - ',`w`.`WarehouseName`),`c`.`ID_Category`,`c`.`CategoryName`,`r`.`Min_Level_Category` having (sum(`s`.`QuantityAvailable`) <= `r`.`Min_Level_Category`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productordersupplier`
--

/*!50001 DROP VIEW IF EXISTS `productordersupplier`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productordersupplier` AS select `o`.`WarehouseName` AS `WarehouseName`,concat(`o`.`CategoryID`,' - ',`o`.`CategoryName`) AS `Category`,concat(`p`.`ID_Product`,' - ',`p`.`ProductName`) AS `Product` from (`product` `p` join `ordertosupplier` `o` on((`p`.`FK_CategoryID` = `o`.`CategoryID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-16 21:18:10
