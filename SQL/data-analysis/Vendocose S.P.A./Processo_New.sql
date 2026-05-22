-- Fase 1 e 2: Il cliente acquista e l'inventario si aggiorna
-- Verifichiamo se il customer X è Cliente o è un nuovo Cliente
-- Caso 1: Ha la carta fedeltà? Si, allora:
SELECT ID_Customer
FROM customer
WHERE LoyaltyCardNumber = /*Barcode carta*/ "VC-0001";
-- (Il database risponde: ID_Customer = 1, "Mario Rossi". Perfetto, procediamo!)
SELECT QuantityAvailable FROM stock WHERE FK_WarehouseID = 1 AND FK_ProductID = 2;
-- Risultato: 2500 unità di pasta
SELECT QuantityAvailable FROM stock WHERE FK_WarehouseID = 1 AND FK_ProductID = 6;
-- Risultato: 900 unità di shampoo
START TRANSACTION;
INSERT INTO sales (FK_ShopID, FK_PaymentMethodID, FK_CustomerID, DateOrderSale) 
VALUES (1/*VendiCose Duomo*/, 3/*Debit Card (Bancomat)*/, 1/*MarioRossi*/, NOW());

INSERT INTO sales_details (FK_SalesID, FK_ProductID, Quantity, TotalPrice) 
VALUES (LAST_INSERT_ID(), 2/*Tomato*/, 3, 2.70),
	   (LAST_INSERT_ID(), 6/*Shampoo*/, 1, 3.50);

UPDATE stock 
SET QuantityAvailable = QuantityAvailable - 3 
WHERE FK_WarehouseID = 1 AND FK_ProductID = 2;

UPDATE stock 
SET QuantityAvailable = QuantityAvailable - 1 
WHERE FK_WarehouseID = 1 AND FK_ProductID = 6;

COMMIT;
-- Verifichiamo le quantità
SELECT QuantityAvailable FROM stock WHERE FK_WarehouseID = 1 AND FK_ProductID = 2;
-- Risultato: 2497 (erano 2500, vendute 3)
SELECT QuantityAvailable FROM stock WHERE FK_WarehouseID = 1 AND FK_ProductID = 6;
-- Risultato: 899 (erano 900, venduta 1)
-- FINE CASO 1 - FASE 1

-- Caso 2: non ha la carta fedeltà e la vuole fare, allora:
-- Controllo se FiscalCode già presente, altrimenti inserisci dati.
SELECT ID_Customer 
FROM customer 
WHERE FiscalCode = /*Codice Fiscale*/'RPSMRA85E12F205Z';
-- (Il database risponde "Vuoto / Nessun record". Perfetto, possiamo crearlo! Altrimenti usa CASO 1)
SELECT QuantityAvailable FROM stock WHERE FK_WarehouseID = 1 AND FK_ProductID = 2;
-- Risultato: 2500 unità di pasta
SELECT QuantityAvailable FROM stock WHERE FK_WarehouseID = 1 AND FK_ProductID = 6;
-- Risultato: 900 unità di shampoo
-- 2. Start the registration and sale transaction
START TRANSACTION;
INSERT INTO customer (FirstName, LastName, FiscalCode, LoyaltyCardNumber, City, dateofbirth, phonenumber, email) 
VALUES ('Francesco', 'Gualazzi', 'RPSMRA85E12F205Z', 'VC-0021', 'Milano','2001-09-19','+39 333 4445558','FrancescoGual@live.it');
-- (Il database assegna al nuovo cliente l'ID 21. Ora lo usiamo per lo scontrino)

INSERT INTO sales (FK_ShopID, FK_PaymentMethodID, FK_CustomerID, DateOrderSale) 
VALUES (1/*VendiCose Duomo*/, 3/*Debit Card (Bancomat)*/,LAST_INSERT_ID(), NOW());

INSERT INTO sales_details (FK_SalesID, FK_ProductID, Quantity, TotalPrice) 
VALUES (LAST_INSERT_ID(), 2/*Tomato*/, 3, 2.70),
	   (LAST_INSERT_ID(), 6/*Shampoo*/, 1, 3.50);

UPDATE stock 
SET QuantityAvailable = QuantityAvailable - 3 
WHERE FK_WarehouseID = 1 AND FK_ProductID = 2;

UPDATE stock 
SET QuantityAvailable = QuantityAvailable - 1 
WHERE FK_WarehouseID = 1 AND FK_ProductID = 6;

COMMIT;
-- Verifichiamo le quantità
SELECT QuantityAvailable FROM stock WHERE FK_WarehouseID = 1 AND FK_ProductID = 2;
-- Risultato: 2497 (erano 2500, vendute 3)
SELECT QuantityAvailable FROM stock WHERE FK_WarehouseID = 1 AND FK_ProductID = 6;
-- Risultato: 899 (erano 900, venduta 1)
-- FINE CASO 2 - FASE 1

-- Caso 3: Non Ha la carta fedeltà e non la vuole fare, allora:
START TRANSACTION;
INSERT INTO sales (FK_ShopID, FK_PaymentMethodID, DateOrderSale) 
VALUES (1, 3, NOW());

INSERT INTO sales_details (FK_SalesID, FK_ProductID, Quantity, TotalPrice) 
VALUES (LAST_INSERT_ID(), 2/*Tomato*/, 3, 2.70),
	   (LAST_INSERT_ID(), 6/*Shampoo*/, 1, 3.50);

UPDATE stock 
SET QuantityAvailable = QuantityAvailable - 3 
WHERE FK_WarehouseID = 1 AND FK_ProductID = 2;

UPDATE stock 
SET QuantityAvailable = QuantityAvailable - 1 
WHERE FK_WarehouseID = 1 AND FK_ProductID = 6;

COMMIT;
-- Verifichiamo le quantità
SELECT QuantityAvailable FROM stock WHERE FK_WarehouseID = 1 AND FK_ProductID = 2;
-- Risultato: 2497 (erano 2500, vendute 3)
SELECT QuantityAvailable FROM stock WHERE FK_WarehouseID = 1 AND FK_ProductID = 6;
-- Risultato: 899 (erano 900, venduta 1)
-- FINE CASO 3 - FASE 1

-- Fase 3 e 4: Il controllo di sicurezza e l'ordine al fornitore
SELECT *
from ordertosupplier;
Select *
from productordersupplier;

-- Procediamo a fare l'ordine
START TRANSACTION;

INSERT INTO supplier_purchase (FK_SupplierID, OrderDate, FK_Status) 
VALUES (1/*Global Foods Inc.*/, NOW(), 1/*Pending*/);

INSERT INTO supplier_purchase_details (FK_Supplier_PurchaseID, FK_ProductID, FK_WarehouseID, OrderQuantity, UnitPurchasePrice) 
VALUES 
    (last_insert_id(), 10/*AA Batteries (4 Pack)*/, 3/*South Hub - Napoli*/, 1000, 0.75), 
    (last_insert_id(), 38/*Laundry Detergent 2L*/, 3/*South Hub - Napoli*/, 800, 0.50),  
    (last_insert_id(), 23/*Mineral Water 1.5L*/, 3/*South Hub - Napoli*/, 200, 4.00);
    
COMMIT;

-- Arriva la merce al magazzino
START TRANSACTION;

UPDATE supplier_purchase 
SET FK_Status = 4 /*Delivered*/
WHERE ID_Supplier_Purchase = 11;

UPDATE stock SET QuantityAvailable = QuantityAvailable + 1000 WHERE FK_WarehouseID = 3 AND FK_ProductID = 10;
UPDATE stock SET QuantityAvailable = QuantityAvailable + 800 WHERE FK_WarehouseID = 3 AND FK_ProductID = 38;
UPDATE stock SET QuantityAvailable = QuantityAvailable + 200 WHERE FK_WarehouseID = 3 AND FK_ProductID = 23;

COMMIT;
-- Fine Fase 3 e 4