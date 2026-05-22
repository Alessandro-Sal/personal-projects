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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-15 20:02:00
