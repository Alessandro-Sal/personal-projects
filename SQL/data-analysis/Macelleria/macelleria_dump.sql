CREATE DATABASE  IF NOT EXISTS `macelleria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `macelleria`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: macelleria
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
-- Table structure for table `canale`
--

DROP TABLE IF EXISTS `canale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canale` (
  `CodiceCanale` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`CodiceCanale`),
  UNIQUE KEY `CodiceCanale_UNIQUE` (`CodiceCanale`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canale`
--

LOCK TABLES `canale` WRITE;
/*!40000 ALTER TABLE `canale` DISABLE KEYS */;
INSERT INTO `canale` VALUES (1,'E-mail'),(2,'Cellulare'),(3,'Telefono'),(4,'Instagram'),(5,'Sito'),(6,'Linkedin');
/*!40000 ALTER TABLE `canale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clienti`
--

DROP TABLE IF EXISTS `clienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clienti` (
  `CodiceCliente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Cognome` varchar(45) NOT NULL,
  `Indirizzo` varchar(45) DEFAULT NULL,
  `Eta` int DEFAULT NULL,
  `Mail` varchar(45) DEFAULT NULL,
  `PEC` varchar(45) DEFAULT NULL,
  `CodiceFiscale` varchar(16) DEFAULT NULL,
  `PartitaIva` varchar(11) DEFAULT NULL,
  `DataInserimento` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CodiceCliente`),
  UNIQUE KEY `CodiceFiscale_UNIQUE` (`CodiceFiscale`),
  UNIQUE KEY `PartitaIva_UNIQUE` (`PartitaIva`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienti`
--

LOCK TABLES `clienti` WRITE;
/*!40000 ALTER TABLE `clienti` DISABLE KEYS */;
INSERT INTO `clienti` VALUES (1,'Alessandro','Saladino','Strada Cavour',25,'Alessandro.saladino@live.it',NULL,'SLDLSN00P19M208Y',NULL,'2026-03-25 14:32:20'),(2,'Tizio','Caio',NULL,NULL,NULL,NULL,'12545478561','12455687410','2026-03-25 14:33:33'),(3,'Mario','Rossi','Via Roma 1',45,'mario.rossi@email.it','mario.rossi@pec.it','RSSMRA80A01H501Z','12345678901','2024-03-01 10:00:00'),(4,'Giulia','Bianchi','Corso Milano 22',32,'g.bianchi@email.it',NULL,'BNCGLI91B42F205X',NULL,'2024-03-02 11:30:00'),(5,'Luca','Verdi','Via Garibaldi 5',55,'luca.verdi@email.com','verdi.luca@pec.it','VRDLCU68C15D969Q','98765432109','2024-03-03 09:15:00'),(6,'Francesca','Neri','Piazza Dante 12',28,'fra.neri@email.it',NULL,'NREFNC95D52H501Y',NULL,'2024-03-04 14:20:00'),(7,'Alessandro','Gallo','Via Torino 8',41,'a.gallo@email.it','gallo.a@pec.it','GLLLSN82E10F205W','45612378901','2024-03-05 16:45:00'),(8,'Martina','Costa','Via Venezia 33',36,'marti.costa@email.it',NULL,'CSTMTN87F60H501K',NULL,'2024-03-06 10:10:00'),(9,'Marco','Fontana','Viale dei Pini 4',60,'m.fontana@email.com','fontana.marco@pec.it','FNTMRC63G05D969J','32165498701','2024-03-07 12:05:00'),(10,'Chiara','Russo','Via Firenze 19',25,'chiara.russo@email.it',NULL,'RSSCHR98H42F205P',NULL,'2024-03-08 15:30:00'),(11,'Matteo','Ferrari','Corso Italia 7',50,'matteo.ferrari@email.it','m.ferrari@pec.it','FRRMTT73I12H501A','74185296301','2024-03-09 08:50:00'),(12,'Sara','Esposito','Via Napoli 2',29,'sara.espo@email.it',NULL,'SPSSRA94L55D969C',NULL,'2024-03-10 11:25:00'),(13,'Andrea','Romano','Via Palermo 14',48,'andrea.romano@email.com','romano.a@pec.it','RMNDNR75M18F205B','85296374101','2024-03-11 13:40:00'),(14,'Elena','Colombo','Piazza San Marco 9',39,'elena.c@email.it',NULL,'CLMLNE84N45H501D',NULL,'2024-03-12 17:15:00'),(15,'Giovanni','Ricci','Via Genova 21',65,'g.ricci@email.it','ricci.g@pec.it','RCCGNN58P20D969E','96385274101','2024-03-13 09:35:00'),(16,'Laura','Marino','Viale Kennedy 3',31,'laura.marino@email.it',NULL,'MRNLRA92Q52F205F',NULL,'2024-03-14 14:55:00'),(17,'Davide','Greco','Via Bari 11',43,'davide.greco@email.com','greco.d@pec.it','GRCDVD80R15H501G','15975346801','2024-03-15 16:00:00'),(18,'Silvia','Bruno','Corso Vittorio 25',27,'silvia.bruno@email.it',NULL,'BRNSLV96S60D969H',NULL,'2024-03-16 10:45:00'),(19,'Antonio','De Luca','Via Roma 100',52,'antonio.deluca@email.it','deluca.a@pec.it','DLCNTN71T10F205I','35715926401','2024-03-17 12:20:00'),(20,'Valeria','Galli','Piazza Repubblica 6',34,'v.galli@email.it',NULL,'GLLVLR89U45H501L',NULL,'2024-03-18 15:10:00'),(21,'Roberto','Moretti','Via Dante 42',47,'roberto.moretti@email.com','moretti.r@pec.it','MRTRRT76V25D969M','25836914701','2024-03-19 08:30:00'),(22,'Federica','Barbieri','Viale Europa 15',30,'fede.barbieri@email.it',NULL,'BRBFRC93Z50F205N',NULL,'2024-03-20 11:05:00');
/*!40000 ALTER TABLE `clienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dettaglioordini`
--

DROP TABLE IF EXISTS `dettaglioordini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dettaglioordini` (
  `CodiceOrdineDettaglio` int NOT NULL,
  `CodiceOrdine` int DEFAULT NULL,
  `CodiceProdotto` int DEFAULT NULL,
  `CodiceConfezione` int DEFAULT NULL,
  `DipendenteConsegna` int DEFAULT NULL,
  `Prezzo` decimal(4,2) DEFAULT NULL,
  `Quantita` int DEFAULT NULL,
  `DataConsegna` datetime DEFAULT NULL,
  PRIMARY KEY (`CodiceOrdineDettaglio`),
  UNIQUE KEY `CodiceOrdineDettaglio_UNIQUE` (`CodiceOrdineDettaglio`),
  KEY `Contiene_idx` (`CodiceOrdine`),
  KEY `Richiede_idx` (`CodiceConfezione`),
  KEY `Riguarda_idx` (`CodiceProdotto`),
  KEY `Consegna_idx` (`DipendenteConsegna`),
  CONSTRAINT `Consegna` FOREIGN KEY (`DipendenteConsegna`) REFERENCES `dipendenti` (`CodiceDipendente`),
  CONSTRAINT `Contiene` FOREIGN KEY (`CodiceOrdine`) REFERENCES `ordini` (`CodiceOrdine`),
  CONSTRAINT `Richiede` FOREIGN KEY (`CodiceConfezione`) REFERENCES `tipoconfezionamento` (`Codice`),
  CONSTRAINT `Riguarda` FOREIGN KEY (`CodiceProdotto`) REFERENCES `prodotti` (`CodiceProdotto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dettaglioordini`
--

LOCK TABLES `dettaglioordini` WRITE;
/*!40000 ALTER TABLE `dettaglioordini` DISABLE KEYS */;
INSERT INTO `dettaglioordini` VALUES (1,1,3,2,7,9.50,2,'2024-03-20 12:00:00'),(2,1,7,1,7,15.00,1,'2024-03-20 12:00:00'),(3,2,5,3,11,12.00,3,'2024-03-21 09:30:00'),(4,3,1,5,19,25.50,1,'2024-03-20 14:00:00'),(5,4,16,7,7,35.00,2,'2024-03-22 10:00:00'),(6,5,8,4,11,18.50,1,'2024-03-21 11:15:00'),(7,6,11,10,19,14.50,4,'2024-03-21 10:30:00'),(8,7,20,1,7,38.00,1,'2024-03-21 15:45:00'),(9,8,4,2,11,7.50,5,'2024-03-23 09:00:00'),(10,9,14,1,19,13.50,2,'2024-03-22 12:30:00'),(11,10,6,3,7,10.50,3,'2024-03-22 11:00:00'),(12,11,2,5,11,22.00,2,'2024-03-24 10:15:00'),(13,12,17,4,19,10.00,1,'2024-03-22 13:00:00'),(14,13,9,8,7,20.00,2,'2024-03-23 11:30:00'),(15,14,12,2,11,8.00,1,'2024-03-23 10:45:00'),(16,15,18,13,19,12.50,3,'2024-03-25 09:30:00'),(17,16,15,1,7,16.50,1,'2024-03-23 14:15:00'),(18,17,10,5,11,16.00,2,'2024-03-24 11:30:00'),(19,18,19,1,19,9.00,4,'2024-03-26 10:00:00'),(20,19,13,2,7,11.00,1,'2024-03-25 12:15:00');
/*!40000 ALTER TABLE `dettaglioordini` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dipendenti`
--

DROP TABLE IF EXISTS `dipendenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dipendenti` (
  `CodiceDipendente` int NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Cognome` varchar(45) DEFAULT NULL,
  `Ruolo` varchar(45) DEFAULT NULL,
  `Area` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CodiceDipendente`),
  UNIQUE KEY `CodiceDipendente_UNIQUE` (`CodiceDipendente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dipendenti`
--

LOCK TABLES `dipendenti` WRITE;
/*!40000 ALTER TABLE `dipendenti` DISABLE KEYS */;
INSERT INTO `dipendenti` VALUES (1,'Luigi','Gialli','Responsabile','Amministrazione'),(2,'Marta','Neri','Primo Macellaio','Taglio'),(3,'Pietro','Sarti','Macellaio','Taglio'),(4,'Anna','Conti','Cassiera','Cassa'),(5,'Giorgio','Riva','Apprendista','Taglio'),(6,'Elena','Bassi','Addetta Vendite','Vendita'),(7,'Fabio','Gatti','Magazziniere','Magazzino'),(8,'Serena','Lombardi','Addetta Vendite','Vendita'),(9,'Roberto','Pellegrini','Macellaio','Taglio'),(10,'Silvia','Marchetti','Cassiera','Cassa'),(11,'Davide','Vitale','Addetto Pulizie','Generale'),(12,'Giulia','Longo','Responsabile Vendite','Vendita'),(13,'Antonio','Sanna','Macellaio','Taglio'),(14,'Chiara','De Angelis','Apprendista','Vendita'),(15,'Marco','Farina','Magazziniere','Magazzino'),(16,'Valeria','Morelli','Cassiera','Cassa'),(17,'Simone','Rizzi','Macellaio','Taglio'),(18,'Francesca','Testa','Addetta Vendite','Vendita'),(19,'Stefano','Caruso','Addetto Pulizie','Generale'),(20,'Martina','Galli','Apprendista','Taglio');
/*!40000 ALTER TABLE `dipendenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordini`
--

DROP TABLE IF EXISTS `ordini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordini` (
  `CodiceOrdine` int NOT NULL AUTO_INCREMENT,
  `DataInserimento` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DataConsegna` datetime(6) DEFAULT NULL,
  `CodiceCanale` int DEFAULT NULL,
  `CodiceCliente` int DEFAULT NULL,
  `GestoreOrdine` int DEFAULT NULL,
  PRIMARY KEY (`CodiceOrdine`),
  KEY `Effettua_idx` (`CodiceCliente`),
  KEY `Nasce_idx` (`CodiceCanale`),
  KEY `Prepara_idx` (`GestoreOrdine`),
  CONSTRAINT `Effettua` FOREIGN KEY (`CodiceCliente`) REFERENCES `clienti` (`CodiceCliente`) ON UPDATE CASCADE,
  CONSTRAINT `Nasce` FOREIGN KEY (`CodiceCanale`) REFERENCES `canale` (`CodiceCanale`) ON UPDATE CASCADE,
  CONSTRAINT `Prepara` FOREIGN KEY (`GestoreOrdine`) REFERENCES `dipendenti` (`CodiceDipendente`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordini`
--

LOCK TABLES `ordini` WRITE;
/*!40000 ALTER TABLE `ordini` DISABLE KEYS */;
INSERT INTO `ordini` VALUES (1,'2024-03-20 07:30:00','2024-03-20 12:00:00.000000',1,3,4),(2,'2024-03-20 08:15:00','2024-03-21 09:30:00.000000',2,7,10),(3,'2024-03-20 09:05:00','2024-03-20 14:00:00.000000',1,12,16),(4,'2024-03-20 10:20:00','2024-03-22 10:00:00.500000',3,1,2),(5,'2024-03-20 13:45:00','2024-03-21 11:15:00.000000',2,19,4),(6,'2024-03-21 07:10:00','2024-03-21 10:30:00.000000',1,5,10),(7,'2024-03-21 08:50:00','2024-03-21 15:45:00.000000',1,8,16),(8,'2024-03-21 09:30:00','2024-03-23 09:00:00.250000',3,15,6),(9,'2024-03-21 14:20:00','2024-03-22 12:30:00.000000',2,2,8),(10,'2024-03-22 07:45:00','2024-03-22 11:00:00.000000',1,9,4),(11,'2024-03-22 08:30:00','2024-03-24 10:15:00.750000',3,14,10),(12,'2024-03-22 10:10:00','2024-03-22 13:00:00.000000',1,4,16),(13,'2024-03-22 15:05:00','2024-03-23 11:30:00.000000',2,20,6),(14,'2024-03-23 07:25:00','2024-03-23 10:45:00.000000',1,11,8),(15,'2024-03-23 09:00:00','2024-03-25 09:30:00.500000',3,6,4),(16,'2024-03-23 10:40:00','2024-03-23 14:15:00.000000',1,18,10),(17,'2024-03-24 08:05:00','2024-03-24 11:30:00.000000',1,17,16),(18,'2024-03-24 09:55:00','2024-03-26 10:00:00.250000',3,13,6),(19,'2024-03-24 14:30:00','2024-03-25 12:15:00.000000',2,10,8),(20,'2024-03-25 07:15:00','2024-03-25 10:00:00.000000',1,16,4);
/*!40000 ALTER TABLE `ordini` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotti`
--

DROP TABLE IF EXISTS `prodotti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodotti` (
  `CodiceProdotto` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Tipologia` varchar(45) DEFAULT NULL,
  `Categoria` varchar(45) DEFAULT NULL,
  `Giacenza` varchar(45) DEFAULT NULL,
  `PrezzoUnitario` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`CodiceProdotto`),
  UNIQUE KEY `CodiceProdotto_UNIQUE` (`CodiceProdotto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotti`
--

LOCK TABLES `prodotti` WRITE;
/*!40000 ALTER TABLE `prodotti` DISABLE KEYS */;
INSERT INTO `prodotti` VALUES (1,'Fiorentina','Bovino Adulto','Taglio Fresco','15 kg',25.50),(2,'Costata','Bovino Adulto','Taglio Fresco','20 kg',22.00),(3,'Petto di Pollo','Avicolo','Taglio Fresco','30 kg',9.50),(4,'Cosce di Pollo','Avicolo','Taglio Fresco','25 kg',7.50),(5,'Salsiccia di Suino','Suino','Preparato','40 kg',12.00),(6,'Costine di Suino','Suino','Taglio Fresco','18 kg',10.50),(7,'Hamburger di Manzo','Bovino Adulto','Preparato','50 pz',15.00),(8,'Arrosto di Vitello','Vitello','Taglio Fresco','12 kg',18.50),(9,'Fettine di Vitello','Vitello','Taglio Fresco','10 kg',20.00),(10,'Agnello a Metà','Ovicaprino','Taglio Fresco','5 pz',16.00),(11,'Arrosticini','Ovicaprino','Preparato','100 pz',14.50),(12,'Tacchino Intero','Avicolo','Taglio Fresco','8 pz',8.00),(13,'Fesa di Tacchino','Avicolo','Taglio Fresco','15 kg',11.00),(14,'Pancetta a Fette','Suino','Salumi e Insaccati','5 kg',13.50),(15,'Guanciale','Suino','Salumi e Insaccati','3 kg',16.50),(16,'Filetto di Manzo','Bovino Adulto','Taglio Fresco','6 kg',35.00),(17,'Macinato Misto','Misto','Preparato','25 kg',10.00),(18,'Pollo Allo Spiedo','Avicolo','Cotto','10 pz',12.50),(19,'Cotechino','Suino','Preparato','20 pz',9.00),(20,'Bresaola','Bovino Adulto','Salumi e Insaccati','4 kg',38.00);
/*!40000 ALTER TABLE `prodotti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoconfezionamento`
--

DROP TABLE IF EXISTS `tipoconfezionamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoconfezionamento` (
  `Codice` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(45) NOT NULL,
  `Materiale` varchar(45) NOT NULL,
  `PrezzoUnitario` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`Codice`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoconfezionamento`
--

LOCK TABLES `tipoconfezionamento` WRITE;
/*!40000 ALTER TABLE `tipoconfezionamento` DISABLE KEYS */;
INSERT INTO `tipoconfezionamento` VALUES (1,'Sottovuoto Standard','Plastica',0.50),(2,'Vaschetta Media','Polistirolo',0.30),(3,'Carta Macellaio','Carta',0.10),(4,'Vaschetta Grande','Polistirolo',0.45),(5,'Sottovuoto Goffrato','Plastica',0.65),(6,'Busta Bio','Bioplastica',0.40),(7,'Vassoio Alluminio','Alluminio',0.80),(8,'Pellicola Trasparente','PVC',0.05),(9,'Carta Paglia','Carta',0.15),(10,'Vaschetta Piccola','Polistirolo',0.20),(11,'Borsa Termica','Multimateriale',1.50),(12,'Sacchetto Gelo','Plastica',0.10),(13,'Contenitore Microonde','Polipropilene',0.90),(14,'Vassoio Cartone','Cartone',0.35),(15,'Rete Elastica Arrosto','Cotone',0.25),(16,'Busta Semplice','PE',0.08),(17,'Carta Forno','Carta',0.12),(18,'Scatola Regalo','Cartone Rigido',2.50),(19,'Vaschetta Sigillata','PET',0.70),(20,'Spago Cucina','Lino',0.05);
/*!40000 ALTER TABLE `tipoconfezionamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-25 15:03:56
