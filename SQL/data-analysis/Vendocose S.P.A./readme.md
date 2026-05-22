# 🛒 VendiCose SpA — Database SQL | Build Week

> **Master in Data Analytics & AI** — SQL Build Week Project  
> Progettazione e sviluppo di un database relazionale per la gestione operativa di una catena di supermercati.

---

## 📋 Indice

- [Descrizione del Progetto](#descrizione-del-progetto)
- [Il Problema di Business](#il-problema-di-business)
- [Flusso Operativo](#flusso-operativo)
- [Struttura del Database](#struttura-del-database)
- [Schema ER](#schema-er)
- [Tabelle](#tabelle)
- [Viste (Views)](#viste-views)
- [Processi SQL Principali](#processi-sql-principali)
- [Come Importare il Database](#come-importare-il-database)
- [Tecnologie Utilizzate](#tecnologie-utilizzate)
- [Team](#team)

---

## 📌 Descrizione del Progetto

**VendiCose SpA** è una società che gestisce una rete di supermercati distribuiti sul territorio nazionale. Questo progetto è stato sviluppato nell'arco di una settimana come **Build Week** del Master in Data Analytics & AI, con l'obiettivo di progettare e implementare un database relazionale completo capace di gestire:

- Le **vendite** nei punti vendita
- L'**inventario** nei magazzini collegati
- Il **monitoraggio delle soglie di restock** per categoria di prodotto
- Gli **ordini automatici ai fornitori** quando le scorte scendono sotto soglia

---

## 💼 Il Problema di Business

La richiesta originale del cliente era la seguente:

> *"Avete una settimana per creare un DB che permetta alla VendiCose SpA di gestire il flusso degli ordini per i magazzini e i punti vendita ad essi associati. Ogni categoria di prodotto ha un livello di restock associato ad ogni magazzino: quando le unità di un prodotto scendono sotto una soglia in un determinato magazzino, bisogna effettuare un nuovo ordine. Ogni qualvolta viene effettuata una vendita in un negozio, i dati vengono aggiornati. Ogni magazzino può servire più di un negozio."*

**Vincoli progettuali:**
- Progettazione con schema ER documentato
- Creazione DDL completa (schema + dati di esempio)
- Query per aggiornamento tabelle a ogni vendita
- Query per monitoraggio disponibilità e soglie di restock
- Rispetto del principio di normalizzazione (minimizzazione ridondanza)

---

## 🔄 Flusso Operativo

Il sistema è articolato in **4 fasi** che compongono il ciclo di vita di una transazione:

```
┌─────────────────────────────────────────────────────────────────┐
│                    FLUSSO VENDICOSE SPA                         │
│                                                                 │
│  FASE 1              FASE 2              FASE 3    FASE 4       │
│  Il cliente    →   L'inventario   →   Controllo →  Ordine al    │
│  acquista          si aggiorna        sicurezza    fornitore    │
└─────────────────────────────────────────────────────────────────┘
```

| Fase | Descrizione | Tabelle coinvolte |
|------|-------------|-------------------|
| **1** | Il cliente acquista in un negozio (con o senza carta fedeltà) | `customer`, `sales`, `sales_details`, `product`, `payment_method`, `shop` |
| **2** | L'inventario del magazzino collegato al negozio viene aggiornato | `sales_details`, `warehouse`, `stock` |
| **3** | Controllo automatico sulla soglia minima di restock per categoria | `stock`, `category`, `restock` |
| **4** | Se la soglia è superata, viene generato un ordine al fornitore | `supplier`, `supplier_purchase`, `supplier_purchase_details`, `stock` |

---

## 🗂 Struttura del Database

Il database `vendocosespa` è composto da **13 tabelle** e **2 viste**, progettate seguendo la **terza forma normale (3NF)**.

### Panoramica delle Entità

```
vendocosespa
│
├── 🏪 VENDITE
│   ├── customer          — Clienti e carte fedeltà
│   ├── sales             — Transazioni di vendita
│   ├── sales_details     — Righe dettaglio di ogni vendita
│   ├── payment_method    — Metodi di pagamento
│   └── shop              — Punti vendita
│
├── 📦 INVENTARIO
│   ├── product           — Catalogo prodotti
│   ├── category          — Categorie prodotti
│   ├── warehouse         — Magazzini
│   ├── stock             — Giacenze per magazzino/prodotto
│   └── restock           — Soglie minime di riordino per magazzino/categoria
│
└── 🚚 FORNITORI
    ├── supplier          — Anagrafica fornitori
    ├── supplier_purchase — Ordini ai fornitori
    ├── supplier_purchase_details — Dettaglio righe ordine fornitore
    └── status            — Stati degli ordini (Pending, Processing, Shipped, Delivered)
```

---

## 📐 Schema ER

### Diagramma ER Completo (con attributi)

> *Vedi file `Vendocose_SPA_ER.png` nella repository*

### EER Diagram — Solo PK/FK

> *Vedi file `DB_-_EER_Diagram_only_PKFK.png` nella repository*

Le relazioni principali tra le entità sono:

- `shop` → `warehouse` (N:1) — ogni negozio è servito da un magazzino
- `sales` → `shop`, `customer`, `payment_method` (N:1)
- `sales_details` → `sales`, `product` (N:1)
- `stock` → `warehouse`, `product` (N:1 composite key)
- `restock` → `warehouse`, `category` (N:1 composite key — soglia per magazzino/categoria)
- `supplier_purchase` → `supplier`, `status` (N:1)
- `supplier_purchase_details` → `supplier_purchase`, `product`, `warehouse`

---

## 📊 Tabelle

### `category`
Categorie di prodotti (es. Groceries, Cosmetics, Electronics…)

| Colonna | Tipo | Note |
|---------|------|------|
| `ID_Category` | INT PK | Auto-increment |
| `CategoryName` | VARCHAR(45) | |
| `Description` | VARCHAR(255) | |
| `IsActive` | TINYINT(1) | Flag attivo/disattivo |

> **14 categorie** precaricate (Groceries, Cosmetics & Personal Care, Beverages, Pasta & Rice, ecc.)

---

### `product`
Catalogo completo dei prodotti.

| Colonna | Tipo | Note |
|---------|------|------|
| `ID_Product` | INT PK | |
| `ProductName` | VARCHAR(45) | |
| `Barcode` | VARCHAR(13) | UNIQUE |
| `Brand` | VARCHAR(100) | |
| `UnitPrice` | DECIMAL(10,2) | Prezzo al cliente |
| `TaxRate` | DECIMAL(4,2) | Aliquota IVA |
| `FK_CategoryID` | INT FK | → `category` |
| `Description` | TEXT | |

---

### `customer`
Anagrafica clienti con gestione carta fedeltà.

| Colonna | Tipo | Note |
|---------|------|------|
| `ID_Customer` | INT PK | |
| `FirstName`, `LastName` | VARCHAR(50) | |
| `FiscalCode` | VARCHAR(16) | Codice fiscale |
| `LoyaltyCardNumber` | VARCHAR(20) | UNIQUE — es. `VC-0001` |
| `LoyaltyPoints` | INT | Punti accumulati |
| `RegistrationDate` | DATETIME | |

> **20 clienti** precaricati con dati realistici.

---

### `sales` & `sales_details`
Gestione delle transazioni di vendita.

**`sales`** — testata dello scontrino:

| Colonna | Tipo | Note |
|---------|------|------|
| `ID_Sales` | INT PK | |
| `FK_ShopID` | INT FK | → `shop` |
| `FK_PaymentMethodID` | INT FK | → `payment_method` |
| `FK_CustomerID` | INT FK | → `customer` (nullable) |
| `DateOrderSale` | DATETIME | |

**`sales_details`** — righe dello scontrino:

| Colonna | Tipo | Note |
|---------|------|------|
| `ID_SalesDetails` | INT PK | |
| `FK_SalesID` | INT FK | → `sales` |
| `FK_ProductID` | INT FK | → `product` |
| `Quantity` | INT | |
| `TotalPrice` | DECIMAL(10,2) | |

---

### `warehouse` & `shop`

**`warehouse`** — 5 hub logistici nazionali:
- `North Hub - Milano`
- `Central Hub - Roma`
- `South Hub - Napoli`
- `Islands Hub - Palermo`
- `East Hub - Venezia`

**`shop`** — punti vendita con attributi: `ShopName`, `Location`, `Address`, `ContactPhone`, `SquareMeters`, `OpeningHours`, `FK_WarehouseID`

---

### `stock`
Giacenze aggiornate in tempo reale per ogni coppia magazzino/prodotto.

| Colonna | Tipo | Note |
|---------|------|------|
| `ID_Stock` | INT PK | |
| `FK_WarehouseID` | INT FK | → `warehouse` |
| `FK_ProductID` | INT FK | → `product` |
| `QuantityAvailable` | INT | Aggiornata ad ogni vendita/rifornimento |

> Constraint UNIQUE su `(FK_WarehouseID, FK_ProductID)` per evitare duplicati.

---

### `restock`
Soglie minime di riordino per magazzino e categoria di prodotto. **Cuore del sistema di alert automatico.**

| Colonna | Tipo | Note |
|---------|------|------|
| `ID_Restock` | INT PK | |
| `FK_WarehouseID` | INT FK | → `warehouse` |
| `FK_CategoryID` | INT FK | → `category` |
| `Min_Level_Category` | INT | Soglia minima unità totali della categoria nel magazzino |

---

### `supplier`, `supplier_purchase`, `supplier_purchase_details`

**`supplier`** — fornitori con anagrafica completa (VAT, email, indirizzo, città, paese).

**`supplier_purchase`** — ordine al fornitore con stato trackato tramite la tabella `status`.

**`supplier_purchase_details`** — righe ordine: quale prodotto, in quale quantità, a quale magazzino, a quale prezzo d'acquisto.

---

### `status`
Stati degli ordini ai fornitori:

| ID | Descrizione |
|----|-------------|
| 1 | Pending |
| 2 | Processing |
| 3 | Shipped |
| 4 | Delivered |

---

### `payment_method`
Metodi di pagamento supportati:
- Cash, Credit Card, Debit Card (Bancomat), Mobile App (Satispay/Apple Pay), Meal Vouchers

---

## 👁 Viste (Views)

### `ordertosupplier`
Vista che aggrega le giacenze per magazzino e categoria e **mostra solo le categorie che hanno superato la soglia minima di restock**.

```sql
-- Logica della view:
-- Somma le QuantityAvailable di tutti i prodotti per categoria e magazzino
-- Mostra solo le righe dove TotalCategoryStock <= RestockLevel (MIN_LEVEL)
SELECT WarehouseName, CategoryID, CategoryName, 
       TotalCategoryStock, RestockLevel
FROM ordertosupplier;
```

### `productordersupplier`
Vista derivata da `ordertosupplier` che espone anche i singoli **prodotti** appartenenti alle categorie sotto soglia, per facilitare la compilazione dell'ordine al fornitore.

---

## ⚙️ Processi SQL Principali

### Fase 1 — Vendita con carta fedeltà (Cliente esistente)

```sql
-- 1. Verifico il cliente dalla carta fedeltà
SELECT ID_Customer FROM customer WHERE LoyaltyCardNumber = 'VC-0001';

-- 2. Registro la vendita in una singola transazione atomica
START TRANSACTION;

INSERT INTO sales (FK_ShopID, FK_PaymentMethodID, FK_CustomerID, DateOrderSale) 
VALUES (1, 3, 1, NOW());

INSERT INTO sales_details (FK_SalesID, FK_ProductID, Quantity, TotalPrice) 
VALUES (LAST_INSERT_ID(), 2, 3, 2.70),
       (LAST_INSERT_ID(), 6, 1, 3.50);

-- 3. Aggiorno lo stock contestualmente
UPDATE stock SET QuantityAvailable = QuantityAvailable - 3 
WHERE FK_WarehouseID = 1 AND FK_ProductID = 2;

UPDATE stock SET QuantityAvailable = QuantityAvailable - 1 
WHERE FK_WarehouseID = 1 AND FK_ProductID = 6;

COMMIT;
```

### Fase 1 — Vendita con registrazione nuovo cliente

```sql
START TRANSACTION;

-- Creo il nuovo cliente (con carta fedeltà)
INSERT INTO customer (FirstName, LastName, FiscalCode, LoyaltyCardNumber, City, DateOfBirth, PhoneNumber, Email) 
VALUES ('Francesco', 'Gualazzi', 'RPSMRA85E12F205Z', 'VC-0021', 'Milano', '2001-09-19', '+39 333 4445558', 'FrancescoGual@live.it');

-- Collego subito la vendita al nuovo ID cliente
INSERT INTO sales (FK_ShopID, FK_PaymentMethodID, FK_CustomerID, DateOrderSale) 
VALUES (1, 3, LAST_INSERT_ID(), NOW());

-- ... (sales_details e UPDATE stock come sopra)

COMMIT;
```

### Fase 1 — Vendita anonima (senza carta fedeltà)

```sql
START TRANSACTION;

-- FK_CustomerID omesso (nullable)
INSERT INTO sales (FK_ShopID, FK_PaymentMethodID, DateOrderSale) 
VALUES (1, 3, NOW());

-- ... (sales_details e UPDATE stock come sopra)

COMMIT;
```

### Fase 3 — Controllo soglie di restock

```sql
-- Visualizzo tutte le categorie sotto soglia per magazzino
SELECT * FROM ordertosupplier;

-- Visualizzo i prodotti specifici da ordinare
SELECT * FROM productordersupplier;
```

### Fase 4 — Emissione ordine al fornitore

```sql
START TRANSACTION;

INSERT INTO supplier_purchase (FK_SupplierID, OrderDate, FK_Status) 
VALUES (1, NOW(), 1 /* Pending */);

INSERT INTO supplier_purchase_details (FK_Supplier_PurchaseID, FK_ProductID, FK_WarehouseID, OrderQuantity, UnitPurchasePrice) 
VALUES 
    (LAST_INSERT_ID(), 10, 3, 1000, 0.75),
    (LAST_INSERT_ID(), 38, 3, 800, 0.50),
    (LAST_INSERT_ID(), 23, 3, 200, 4.00);

COMMIT;
```

### Fase 4 — Ricezione merce e aggiornamento stock

```sql
START TRANSACTION;

-- Aggiorno lo stato dell'ordine a "Delivered"
UPDATE supplier_purchase SET FK_Status = 4 WHERE ID_Supplier_Purchase = 11;

-- Incremento le giacenze
UPDATE stock SET QuantityAvailable = QuantityAvailable + 1000 WHERE FK_WarehouseID = 3 AND FK_ProductID = 10;
UPDATE stock SET QuantityAvailable = QuantityAvailable + 800  WHERE FK_WarehouseID = 3 AND FK_ProductID = 38;
UPDATE stock SET QuantityAvailable = QuantityAvailable + 200  WHERE FK_WarehouseID = 3 AND FK_ProductID = 23;

COMMIT;
```

---

## 🚀 Come Importare il Database

### Prerequisiti
- MySQL Server 8.0+
- MySQL Workbench (o qualsiasi client SQL)

### Importazione

```bash
# Da terminale
mysql -u root -p < Structure_Data_and_Create_Schema_NEW.sql
```

Oppure da **MySQL Workbench**:
1. `File` → `Open SQL Script` → seleziona `Structure_Data_and_Create_Schema_NEW.sql`
2. Esegui lo script (⚡)
3. Il database `vendocosespa` verrà creato con schema e dati di esempio

Per eseguire i processi:
1. Apri `Processo_New.sql`
2. Esegui le sezioni che ti interessano commentate per fase

---

## 📁 File nella Repository

| File | Descrizione |
|------|-------------|
| `Structure_Data_and_Create_Schema_NEW.sql` | DDL completo: creazione tabelle, viste e dati di esempio |
| `Processo_New.sql` | Query operative commentate per fase (vendita, restock, ordine fornitore) |
| `Vendocose_SPA_ER.png` | Diagramma ER con entità e attributi |
| `Flusso_VendocoseSPA.png` | Diagramma del flusso operativo in 4 fasi |
| `DB_-_EER_Diagram_only_PKFK.png` | EER Diagram con sole PK/FK |
| `DB_-_EER_Diagram.png` | EER Diagram completo con tutti gli attributi |

---

## 🛠 Tecnologie Utilizzate

![MySQL](https://img.shields.io/badge/MySQL-8.0-blue?logo=mysql&logoColor=white)
![MySQL Workbench](https://img.shields.io/badge/MySQL_Workbench-8.0-orange?logo=mysql)

- **DBMS:** MySQL 8.0
- **Design:** MySQL Workbench EER Diagram
- **Standard:** SQL DDL/DML, Transazioni ACID, Viste
- **Normalizzazione:** Terza Forma Normale (3NF)

---

## 👥 Team

Progetto realizzato durante la **Build Week SQL** del Master in **Data Analytics & AI**.

> *"Il senior si è ammalato. Abbiamo avuto una settimana. Ce la siamo cavata."* 💪

---

## 📝 Note Progettuali

- La tabella `restock` lavora a livello di **categoria** e non di singolo prodotto, permettendo soglie aggregate più flessibili e realistiche
- Le **viste** `ordertosupplier` e `productordersupplier` fungono da layer di business intelligence per il monitoraggio operativo
- Il campo `FK_CustomerID` in `sales` è **nullable** per supportare le vendite anonime senza carta fedeltà
- Le transazioni SQL garantiscono **atomicità ACID**: vendita e aggiornamento stock avvengono sempre insieme o non avvengono
- Il `LoyaltyCardNumber` usa il formato `VC-XXXX` e ha un vincolo `UNIQUE` per prevenire duplicati

---

*Master in Data Analytics & AI — Build Week SQL*
