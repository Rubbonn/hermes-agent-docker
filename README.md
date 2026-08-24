# Hermes Agent - Docker Edition

Una versione containerizzata di **Hermes Agent** che mantiene pulita la macchina host, isolando completamente l'agente e le sue dipendenze in un contenitore Docker.

## 📋 Descrizione

Questo repository fornisce un `Dockerfile` pre-configurato per eseguire **Hermes Agent** in un container Docker. In questo modo, la macchina host rimane pulita e isolata, senza rischio di conflitti di dipendenze o modifiche non controllate al sistema.

## 🚀 Prerequisiti

- **Docker** installato e in esecuzione ([Scarica Docker](https://www.docker.com/products/docker-desktop))

## 📦 Build dell'immagine

Costruisci l'immagine Docker:

```bash
docker build -t hermes-agent .
```

## ▶️ Esecuzione

### Modalità base

Esegui il container con l'interfaccia TUI (Text User Interface):

```bash
docker run -it --rm hermes-agent
```

### Con persistenza dei dati

Per mantenere i dati e le configurazioni di Hermes Agent anche dopo l'arresto del container, monta il volume `/root/.hermes`:

```bash
docker run -it --rm -v hermes-data:/root/.hermes hermes-agent
```

Questo crea un volume named `hermes-data` che persiste tra le esecuzioni.

### Con accesso alla porta API

Se desideri accedere all'API di Hermes sulla porta 9119:

```bash
docker run -it --rm -p 9119:9119 -v hermes-data:/root/.hermes hermes-agent
```

## 🔧 Configurazione

### Variabili di ambiente

Puoi passare variabili di ambiente al container:

```bash
docker run -it --rm -e VAR_NAME=value hermes-agent
```

### Volume personalizzato

Per usare una directory locale anziché un volume named:

```bash
docker run -it --rm -v /path/to/local/hermes:/root/.hermes hermes-agent
```

## 📊 Cosa è incluso nel container

- **Debian 13** come immagine base
- **Git**, **curl**, **build-essential** per lo sviluppo
- **Python 3** e **pip** per l'ecosistema Python
- **Hermes Agent** installato dall'immagine ufficiale

## 🛑 Arresto del container

- Premi `Ctrl+C` per interrompere il container
- Il flag `--rm` pulisce automaticamente il container dopo l'arresto

## 🐳 Comandi utili

Visualizza i container attivi:
```bash
docker ps
```

Visualizza i volumi creati:
```bash
docker volume ls
```

Rimuovi un volume:
```bash
docker volume rm hermes-data
```

Esegui comandi aggiuntivi nel container:
```bash
docker run -it --rm hermes-agent bash
```

## 📝 Note

- L'interfaccia di default è la **TUI** (interfaccia testuale)
- La porta **9119** è esposta per accesso esterno, se necessario
- I dati persistenti sono salvati in `/root/.hermes`

## 🔗 Risorse

- [Hermes Agent Official](https://www.nousresearch.com/)
- [Docker Documentation](https://docs.docker.com/)

## 📄 Licenza

Questo Dockerfile è fornito come-è. Per informazioni sulla licenza di Hermes Agent, fai riferimento al sito ufficiale.
