# Analisi Dati COVID-19: Progetto Strategico per XYFARMA 🦠📊

**Cliente:** XYFARMA  
**Obiettivo:** Analisi dei dati COVID-19 (Contagiati, Deceduti, Guariti, Vaccinati) dal 2020 ad oggi per supportare la decisione strategica sullo sviluppo di un nuovo vaccino anti-Covid.

---

## 1. Fonte dei Dati e Metadati
I dati necessari per l'analisi sono stati estratti da fonti ufficiali governative (Dipartimento della Protezione Civile e Struttura Commissariale per l'Emergenza) messe a disposizione in formato Open Data su GitHub:
* **Dati Campagna Vaccinale:** File storici annuali e riepilogativi (dal 2020 al 2025).
* **Dati Andamentali:** File `dpc-covid19-ita-regioni.csv`, contenente lo storico dei contagi, decessi e guarigioni aggregati a livello regionale.

> **Nota Metodologica:** Nonostante il repository delle somministrazioni avesse rilevazioni di dati fino al 2026, per offrire un’analisi congrua si è deciso di porre come limite temporale il **7 gennaio 2025**. Questo garantisce una perfetta coerenza relazionale con il dataset andamentale, che si interrompe in tale data.

**Classificazione Open Data (3 Stelle):** I dati sono disponibili online liberamente (1★), in formato strutturato (2★) e non proprietario/aperto (CSV - 3★).

## 2. Metodologia e Processo (ETL e Data Modeling)
I dati grezzi sono stati importati in ambiente Excel e processati tramite **Power Query** per garantire qualità, pulizia e validazione:
* **Data Cleansing:** Rimozione delle colonne ridondanti e mantenimento dei campi essenziali (Data, Regione, Contagiati, Guariti, Deceduti, Tamponi, Somministrazione vaccini).
* **Trasformazione Temporale:** Conversione dei dati cumulativi in dati effettivi di periodo calcolando le differenze giornaliere.
* **Uniformazione per Merge:** Standardizzazione delle nomenclature geografiche (es. *Trentino-Alto Adige* ricodificato in *TRENTINO*) per garantire l'unione dei dataset tramite una chiave primaria `Regione-Anno-Mese` senza generare record orfani.

Il modello dati centralizzato è stato sviluppato in **Power Pivot**, fondato sulle seguenti entità:
* **Dimensioni (Filtri):** Spaziale (`Regione`), Temporale (`Data` espansa in Anno, Trimestre, Mese).
* **Misure Base:** Epidemiologiche (`Contagiati`, `Guariti`, `Deceduti`), Profilassi (`Vaccinati`).
* **KPI (Misure Derivate):** Rapporti tra Contagiati/Vaccinati, Contagiati/Deceduti, Contagiati/Guariti.

## 3. Strumenti di Consultazione e Reportistica
I dati analizzati sono stati strutturati in una cartella di lavoro Excel con due output principali:
1. **Maschera di Consultazione Interattiva:** Una dashboard dinamica in cui il cliente può inserire il nome di una Regione per ottenere istantaneamente valori assoluti e il ranking nazionale dei contagiati.
2. **Report Formale:** Fogli dedicati ai trend storici, dotati di filtri interattivi (Slicer per Regione e Trimestre) e formattati rigorosamente per l'esportazione professionale in A4.

## 4. Executive Summary e Raccomandazione Strategica
Sulla base dell'analisi integrata dei dati storici, emerge un quadro epidemiologico e di mercato molto chiaro per XYFARMA:

* **Da Pandemia a Endemia:** Dopo i picchi del 2020-2022, il Tasso di Letalità (Deceduti/Contagiati) è drasticamente crollato grazie alle prime campagne di massa.
* **Crollo della domanda:** I dati evidenziano una flessione verticale nelle dosi erogate negli ultimi due anni. La popolazione ha sviluppato un'immunità ibrida, riducendo la richiesta di nuovi cicli vaccinali per la popolazione generale.
* **Stagionalità del virus:** I contagi seguono ormai un andamento stagionale (Q1-Q4), con picchi nei mesi autunnali/invernali, assimilabile all'influenza.

### 💡 Raccomandazione per XYFARMA:
**NO allo sviluppo di un vaccino universale di massa.** I costi di Ricerca & Sviluppo non sarebbero giustificati vista l'attuale saturazione del mercato. 

Si consiglia invece di valutare la fattibilità di un **vaccino combinato (Antinfluenzale + Anti-Covid)**. Questa strategia massimizzerebbe la penetrazione in un mercato ormai ristretto, offrendo una doppia copertura con una singola dose mirata alla campagna autunnale.
## Project Architecture (Data Pipeline)
Il flusso dei dati segue un'architettura classica di Business Intelligence, suddivisa in quattro fasi principali: Ingestion, ETL (Extract, Transform, Load), Data Modeling e Data Visualization.

```mermaid
graph LR
    subgraph Data_Sources [1. Data Sources]
        A[GitHub: Vaccini CSV] --> C
        B[GitHub: Andamento CSV] --> C
    end
    subgraph ETL [2. ETL - Power Query]
        C[Data Extraction] --> D[Data Cleansing]
        D --> E[Merge via Relational Key]
    end
    subgraph Modeling [3. Data Modeling - Power Pivot]
        E --> F[(Centralized Model)]
        F --> G[Calculated KPIs]
    end
    subgraph Visualization [4. Presentation]
        G --> H[Interactive Dashboard]
        G --> I[Slicers & Pivot Charts]
    end
    
    %% Styling
    classDef source fill:#f9f9f9,stroke:#333,stroke-width:2px;
    classDef process fill:#e1f5fe,stroke:#0288d1,stroke-width:2px;
    classDef database fill:#e8f5e9,stroke:#388e3c,stroke-width:2px;
    classDef output fill:#fff3e0,stroke:#f57c00,stroke-width:2px;
    
    class A,B source;
    class C,D,E process;
    class F,G database;
    class H,I output;
