# 📊 Job Tracker Analytics

Sistema automatizzato per il monitoraggio delle candidature lavorative via email: scarica, classifica e visualizza in una dashboard interattiva lo stato di tutte le candidature inviate, leggendo direttamente dalle caselle di posta via IMAP.

## 🎯 Cosa fa

Il progetto è composto da due script Python (in `Job Application Tracker.ipynb` e `Analytics Dashboard.ipynb`) che lavorano in pipeline:

1. **Email Scraper & Classifier** — si collega a una o più caselle Gmail via IMAP, scarica le email relative a candidature lavorative e le classifica automaticamente in categorie (candidatura ricevuta, colloquio fissato, esito negativo, ecc.), esportando tutto in un CSV.
2. **Dashboard Generator** — legge il CSV prodotto dallo step 1 e genera una dashboard HTML interattiva con Plotly, con KPI e grafici sull'andamento delle candidature.

## 📁 Struttura del progetto

```
.
├── Job Application Tracker.ipynb       # Notebook scraper
├── Analytics Dashboard.ipynb.ipynb     # Notebook dashboard
├── report_candidature_definitivo.csv   # Output dello scraper / input della dashboard
└── dashboard_interattiva.html          # Dashboard interattiva generata
```

## ⚙️ Come funziona

### 1. Email Scraper (`scan_account` + classificazione)

- Si connette via `imaplib` a uno o più account configurati in `ACCOUNTS` (email, password, server IMAP).
- Cerca le email che contengono nell'oggetto parole chiave come `application`, `candidatura`, `colloquio`, `interview`, `esito`.
- Per ogni email trovata:
  - **Pulisce il nome del mittente** (`clean_company_name`) per estrarre il nome dell'azienda, gestendo header codificati, ATS generici (no-reply, HR, recruiting...) e fallback sul dominio email.
  - **Estrae il corpo del messaggio** (`get_email_body`), gestendo sia email multipart che plain text.
  - **Classifica l'email** (`classify_email`) in una delle categorie seguenti, in ordine di priorità:

| Categoria | Criterio |
|---|---|
| `Ignorato` / `Ignorato (Newsletter/Spam)` | Mittenti come GitHub, newsletter, LinkedIn, ecc. |
| `Esito Negativo` | Parole chiave come "purtroppo", "not moving forward" |
| `Contatto / Nuova Opportunità` | Proposte di lavoro spontanee/recruiting |
| `Candidatura Ricevuta` | Conferme di invio candidatura |
| `Colloquio / Riunione Fissata` | Inviti a colloquio, link Calendly/Teams, ecc. |
| `Esito Ricevuto (Da Leggere)` | Oggetto contiene "esito" senza altri match |
| `Da Verificare / Altro` | Nessuna regola applicata |

- **Gestione duplicati**: se più email di "colloquio" arrivano per la stessa azienda nello stesso giorno (es. reminder), solo la prima viene marcata come `Colloquio / Riunione Fissata`; le successive diventano `Colloquio (Update/Reminder stesso giorno)`.
- Il risultato finale viene esportato in `report_candidature_definitivo.csv`.

> ⚠️ **Nota sicurezza**: le credenziali nello script sono lette da variabili d'ambiente (`os.getenv("GMAIL_PWD_00", ...)`). Prima di eseguire lo script, configura le password reali in un file `.env` (vedi sezione [Setup](#-setup)) — non lasciare mai password in chiaro nel codice.

### 2. Dashboard Generator (`genera_dashboard_interattiva`)

- Legge il CSV prodotto dallo scraper, escludendo le righe `Ignorato`.
- Calcola i KPI principali: totale candidature, totale colloqui, **tasso di conversione** candidatura → colloquio.
- Genera una dashboard a griglia 2x2 con Plotly (`make_subplots`):
  1. **Esito Generale delle Candidature** — barre orizzontali con il conteggio per ogni stato.
  2. **Volume Comunicazioni nel Tempo** — andamento mensile delle email ricevute.
  3. **Top 10 Aziende per Interazioni** — aziende con cui c'è stato più scambio.
  4. **Aziende con Colloqui Fissati** — focus sulle aziende che hanno portato a un colloquio.
- Esporta il risultato in `dashboard_interattiva.html`, apribile direttamente nel browser (auto-open all'esecuzione dello script).

## 📊 Stato attuale dei dati

Dal CSV incluso nel progetto (70 email classificate, 29 aziende coinvolte):

| Stato | Conteggio |
|---|---|
| Candidatura Ricevuta | 64 |
| Colloquio / Riunione Fissata | 4 |
| Colloquio (Update/Reminder stesso giorno) | 2 |

## 🚀 Setup

### Requisiti

```bash
pip install pandas plotly
```

### Configurazione account email

Nello script dello scraper, sostituisci i placeholder con i tuoi dati reali:

```python
ACCOUNTS = [
    {
        "email": "tuamail@gmail.com",
        "password": os.getenv("GMAIL_PWD_00"),
        "server": "imap.gmail.com"
    },
]
```

Crea un file `.env` nella root del progetto (e aggiungilo a `.gitignore`):

```
GMAIL_PWD_00=la_tua_app_password
```

> 💡 Per Gmail è necessaria una **App Password** dedicata (non la password dell'account), generabile dalle impostazioni di sicurezza Google se hai l'autenticazione a due fattori attiva. Assicurati inoltre che l'accesso IMAP sia abilitato sull'account.

### Esecuzione

```bash
# 1. Scarica e classifica le email
python scraper.py
# → genera report_candidature_definitivo.csv

# 2. Genera la dashboard
python dashboard.py
# → genera e apre dashboard_interattiva.html
```

## 🛠️ Stack tecnico

- **Python** — `imaplib`, `email` (libreria standard) per l'accesso IMAP e il parsing delle email
- **pandas** — pulizia dati, gestione duplicati, aggregazioni temporali
- **Plotly** — generazione della dashboard interattiva (grafici a barre, serie temporali)

## 💡 Possibili sviluppi futuri

- Estendere le regole di `classify_email` con altre lingue/pattern man mano che emergono nuovi casi.
- Aggiungere un filtro per intervallo di date nella dashboard.
- Automatizzare l'esecuzione periodica (es. cron job) per mantenere il CSV sempre aggiornato.
- Sostituire le password in chiaro con un gestore di secret più robusto (es. `keyring`) per uso prolungato.
