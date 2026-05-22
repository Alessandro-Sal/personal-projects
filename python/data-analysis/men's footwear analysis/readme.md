# 👟 Analisi Competitiva — Mercato Calzature Uomo

![Python](https://img.shields.io/badge/Python-3.13-blue?logo=python&logoColor=white)
![pandas](https://img.shields.io/badge/pandas-2.x-150458?logo=pandas&logoColor=white)
![matplotlib](https://img.shields.io/badge/matplotlib-3.x-11557c)
![Status](https://img.shields.io/badge/status-completato-brightgreen)

> **Build Week Project** — Analisi dei competitor per brand di calzature, focalizzata su prezzi, tipologie di prodotto e varietà dell'offerta.

---

## 📁 Struttura del Progetto

```
.
├── scraping/
│   ├── Azienda_G.ipynb          # Scraping sito ufficiale Brand G
│   ├── Azienda_C.ipynb          # Scraping sito ufficiale Brand C
│   ├── Azienda_NG.ipynb         # Scraping sito ufficiale Brand NG
│   └── Azienda_Z.ipynb          # Scraping piattaforma multimarca Z
│
├── config/
│   ├── .env                     # URL e Variabili d'ambiente
│   └── Library.py               # File di importazione librerie
│
├── data/
│   ├── raw/
│   │   ├── Azienda_G.csv
│   │   ├── Azienda_C.csv
│   │   ├── Azienda_NG.csv
│   │   └── Azienda_Z.csv
│   └── clean/
│       ├── Azienda_G_clean.csv
│       ├── Azienda_C_clean.csv
│       ├── Azienda_NG_clean.csv
│       ├── Azienda_NG_modelli.csv   # Solo modelli unici (senza varianti colore)
│       └── Azienda_Z_clean.csv
│
└── Report.ipynb                 # Analisi comparativa e grafici per il CEO
```

---

## 🏢 Brand Analizzati

| Alias | Ruolo | Posizionamento |
|---|---|---|
| **Azienda G** | Brand cliente | Generalista, fascia media |
| **Azienda C** | Competitor principale | Mass-market, scarpe eleganti |
| **Azienda NG** | Competitor principale | Premium, nicchia maschile |
| **Azienda Z** | Piattaforma multimarca | Contesto di mercato / benchmark prezzi |

> I nomi reali dei brand sono stati anonimizzati per la pubblicazione su GitHub.

---

## 🔧 Stack Tecnico

```python
vedere Library.py
```

---

## 🗂️ Tassonomia Unificata

Per rendere comparabili i dataset — ognuno con un sistema di categorizzazione diverso — è stata costruita una **tassonomia comune** a due livelli applicata a tutti i brand.

### Macro-categorie

| Macro-categoria | Cosa include |
|---|---|
| **Sneakers** | Sneakers basse, slip-in, senza lacci, vintage, alte |
| **Scarpe eleganti** | Stringate, derby, oxford, scarpe in pelle/camoscio |
| **Mocassini** | Mocassini in pelle, scamosciati, boat shoes |
| **Sandali** | Aperti, chiusi, sportivi, infradito |
| **Stivali & Stivaletti** | Chelsea boots, desert boots, stivali |
| **Ciabatte & Pantofole** | Ciabatte, pantofole, espadrillas |

### Micro-categorie (dettaglio)

Ogni macro-categoria si articola in sottotipologie: ad esempio `Sneakers → Sneakers basse / Sneakers slip-in / Sneakers alte / Sneakers vintage`.

---

## 📊 Executive Summary e Posizionamento Competitivo

Dall'analisi delle collezioni stagionali e delle strategie di pricing emergono tre identità di mercato ben distinte:

- **Azienda C — Leader di Volume:** Domina per ampiezza dell'offerta (370 prodotti), concentrandosi quasi esclusivamente sulla macro-categoria *Scarpe eleganti*. Mantiene un prezzo medio altamente competitivo (**€112**), puntando su una strategia mass-market.

- **Azienda NG — Premium Niche:** Offerta molto selezionata (48 modelli unici) con il prezzo medio più alto del panel (**€154**). Presidia il mercato premium e detiene il monopolio assoluto nella categoria *Stivali & Stivaletti*, non coprendo però il segmento estivo (sandali/ciabatte).

- **Azienda G — Generalista Bilanciato:** Rappresenta il perfetto *middle-ground*. Con 91 prodotti offre il catalogo più omogeneo, coprendo quasi tutte le categorie. Si posiziona su una fascia di prezzo media (**€115**), vicina ad Azienda C ma con una proposta molto più versatile.

---

## 📦 Panoramica Offerta

### Prodotti per Brand e Macro-categoria

| Macro-categoria | Azienda G | Azienda C | Azienda NG |
|---|:---:|:---:|:---:|
| Ciabatte & Pantofole | 9 | 7 | 2 |
| Mocassini | 14 | — | 6 |
| Sandali | 10 | 9 | — |
| Scarpe eleganti | 16 | **297** | 14 |
| Sneakers | 42 | 57 | 19 |
| Stivali & Stivaletti | — | — | **7** |
| **Totale** | **91** | **370** | **48** |

> **Nota metodologica:** I dati di Azienda G includono 91 modelli distinti dopo rimozione dei duplicati (erano 289 righe raw). Per Azienda NG il conteggio si riferisce ai modelli unici, escludendo le varianti colore (160 righe raw, 3.3 varianti colore per modello in media).

---

## 🏷️ Analisi Prezzi

### Statistiche generali per Brand (sito ufficiale)

| Brand | Prezzo Medio | Minimo | Massimo |
|---|:---:|:---:|:---:|
| Azienda G | €115 | €69.90 | €199.90 |
| Azienda C | €112 | €49.95 | €230.00 |
| Azienda NG | €154 | €75.00 | €349.00 |

### Prezzi medi per Macro-categoria

| Macro-categoria | Azienda G | Azienda C | Azienda NG |
|---|:---:|:---:|:---:|
| Ciabatte & Pantofole | €84 | €69 | €82 |
| Mocassini | €132 | — | €148 |
| Sandali | €84 | €91 | — |
| Scarpe eleganti | €135 | €116 | €150 |
| Sneakers | €117 | €98 | €162 |
| Stivali & Stivaletti | — | — | €166 |

---

## 🏷️ Dinamiche di Prezzo e Politiche di Sconto (Piattaforma Z)

L'analisi della piattaforma multimarca ha rivelato approcci promozionali diametralmente opposti:

- **Aggressività Promozionale (Azienda C):** Adotta una strategia *push* marcata, con quasi un terzo del catalogo in saldo (**31.4%**) e lo sconto medio più profondo (**21.0%**). Questo favorisce alti volumi di vendita ma rischia di erodere il posizionamento del marchio. Il confronto sui modelli comuni mostra che su piattaforma Z, C è mediamente **€19 più economica** rispetto al proprio sito ufficiale (-15%).

- **Protezione del Valore (Azienda G):** Applica un approccio conservativo e focalizzato sulla profittabilità. Solo il **19.3%** dei prodotti è in sconto, con una percentuale di taglio prezzo più contenuta (**18.7%**).

- **Sconti Tattici (Azienda NG):** Pur essendo un brand premium, utilizza la leva dello sconto sul **29.3%** della sua linea, con un ribasso medio del **18.0%**.

### Riepilogo sconti su piattaforma Z

| Brand | N. Prodotti | In Sconto | % In Sconto | Sconto Medio € | Sconto Medio % |
|---|:---:|:---:|:---:|:---:|:---:|
| Azienda G | 477 | 92 | 19.3% | €4.53 | 3.6% |
| Azienda C | 204 | 64 | 31.4% | €8.50 | 6.6% |
| Azienda NG | 58 | 17 | 29.3% | €9.36 | 5.3% |

---

## 🎨 Bonus — Varietà Colori (Piattaforma Z)

| Brand | Colori Distinti Totali | Di cui nelle Sneakers |
|---|:---:|:---:|
| Azienda G | **119** | **103** |
| Azienda C | 67 | 53 |
| Azienda NG | 10 | 8 |

G domina nettamente la varietà cromatica, con quasi il doppio dei colori di C e dodici volte quelli di NG. Questa ricchezza è concentrata principalmente nelle Sneakers.

---

## 🎯 Conclusioni e Raccomandazioni Strategiche

### Azienda G

**1. Sviluppo Nuove Linee — Stivali & Stivaletti**
Esiste un evidente vuoto di mercato nella categoria *Stivali & Stivaletti*, attualmente monopolizzata da NG a prezzi premium (€166). Inserire una linea a prezzo medio (€120–€130) permetterebbe di aggredire una fascia di clientela attualmente non presidiata.

**2. Spinta Marketing sui Mocassini**
G è leader in questa categoria (14 modelli contro 0 di C). È un vantaggio competitivo netto da massimizzare con campagne di comunicazione mirate.

**3. Mantenimento Margini**
Si consiglia di continuare con l'attuale politica di sconti contenuti (sotto il 20%). Questo protegge la *brand equity* ed evita una guerra dei prezzi al ribasso con Azienda C.

**4. Valorizzare la Varietà Cromatica**
L'analisi su piattaforma Z evidenzia che G offre 119 colorazioni distinte (vs 67 di C e 10 di NG), con 103 varianti nelle sole Sneakers. Questa ricchezza va comunicata esplicitamente come punto di differenziazione, specialmente nei canali digitali dove la scelta del colore è leva decisiva di conversione.

---

### Azienda C

**1. Diversificazione del Catalogo**
L'eccessiva dipendenza di C dalle *Scarpe eleganti* (297 modelli su 370, 80% del catalogo) la espone a forti rischi qualora i trend di mercato si spostassero verso il casual. È prioritario espandere l'offerta verso categorie scoperte come *Mocassini* e *Stivali*.

**2. Revisione Politica Promozionale**
Si consiglia di ridurre progressivamente l'aggressività degli sconti (attualmente oltre il 31% del catalogo è tagliato del 21%). Il rischio è abituare il consumatore ad acquistare esclusivamente durante i saldi, erodendo la marginalità a lungo termine.

---

### Azienda NG

**1. Destagionalizzazione dell'Offerta**
Il catalogo attuale è fortemente sbilanciato sui mesi freddi e intermedi. Introdurre una *capsule collection* estiva di fascia alta (Sandali/Ciabatte) permetterebbe di mantenere flussi di cassa costanti durante tutto l'anno.

**2. Espansione Orizzontale nel Casual**
Essendo leader sulla fascia premium di Stivali e Scarpe eleganti, si consiglia un cauto ampliamento della linea *Sneakers* (attualmente 19 modelli) per intercettare il trend dell'abbigliamento daily-wear di lusso.

---

## ⚠️ Note Metodologiche

- L'analisi è stata condotta sui dati disponibili al momento dello scraping — i prezzi e la disponibilità dei prodotti possono variare nel tempo.
- Il dataset di Azienda NG include le varianti colore come righe separate (160 righe raw = 48 modelli unici). Tutti i confronti quantitativi utilizzano i modelli unici.
- La piattaforma Z contiene solo i brand G e C in modo significativo (477 e 204 prodotti). NG ha una presenza molto limitata (58 prodotti), pertanto i dati relativi a NG su Z vanno interpretati con cautela.
- La tassonomia unificata è una semplificazione necessaria per rendere comparabili sistemi di categorizzazione eterogenei. Alcune categorie originali (es. "Scarpe da uomo" di C) sono state assegnate alla macro-categoria più probabile.
