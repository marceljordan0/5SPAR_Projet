# 🗃️ 5SPAR 📊 Streaming 🛠️

## 🏗️ **Architecture et Setup** ⚙️

Tous les composants du projet sont conteneurisés 📦 et orchestrés avec Docker 🐋 et Docker Compose 📜 pour faciliter le déploiement et la configuration. Voici les étapes pour initialiser les environnements 🌐 et le réseau :

### 🚀 **Lancer les containers Jupyter 📓, Spark (master et worker) ✨, Kafka 📨, et Zookeeper 🐾 avec Docker Compose :**

```sh
   docker-compose up
```

### 🐘 **Créer un container PostgreSQL :**

```sh
   docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -v some-postgres-data:/var/lib/postgresql/data -d -p 5432:5432 postgres
```

### 🌐 **Créer un réseau Docker et y connecter les containers :**

```sh
   docker network create bigdata_network
   docker network connect bigdata_network some-postgres
   docker network connect bigdata_network jupyter
   docker network connect bigdata_network spark-worker
   docker network connect bigdata_network kafka
   docker network connect bigdata_network spark-master
   docker network connect bigdata_network zookeeper
```

## 🔑 **Accès API Mastodon** 🐘

Les accès API générés pour le projet sont :

- **client\_id**: `izb9ti8Xlag6iauwHUAVORXSjL-l554tsFaZvU4RDII`
- **client\_secret**: `kXrzsq8fXTZEyIFbu1mcRCfDWY-8_ZJcLmaWJQRSGLg`
- **access\_token**: `wbhGh7WATwQJ2uHuWnBZ5rQ9SD-idQdk2O93_68Gvis`

## 📜 **Description des Scripts**

- **create\_app** : Enregistre une nouvelle application cliente 📝 sur Mastodon 🐘 pour obtenir `client_id` et `client_secret`. *(Ne pas exécuter 🚫)*.
- **jeton\_access** : Effectue une demande OAuth 🔑 pour obtenir un jeton d'accès à l'API Mastodon avec les informations d'identification. *(Ne pas exécuter 🚫)*.

### 📡 **Partie 1 : Streaming des Toots avec Kafka** 📨 (`partie1.ipynb`)

Configure une connexion avec l'API Mastodon 🐘 et Kafka 📨, et écoute les toots en temps réel ⏱️. Les toots filtrés sont envoyés à un sujet Kafka 📨.

### ⚙️ **Partie 2 : Traitement des Toots avec PySpark** ✨ (`partie2.ipynb`)

Configure un pipeline de streaming 🚀 avec PySpark ✨ pour lire les toots depuis Kafka 📨, appliquer des transformations (nettoyage 🧹, agrégation par fenêtre temporelle ⏳, etc.) et écrire les résultats dans PostgreSQL 🐘.

### 📊 **Partie 3 : Analyse Historique des Toots** 📜 (`partie3.ipynb`)

Traite les données de toots historiques 🕒 stockées dans PostgreSQL 🐘 avec PySpark ✨, appliquant des transformations, des agrégations et optimisations 🔧.

### 🚧 **Partie 4 : En Construction** 🏗️ (`partie4.ipynb`)

### 📈 **Partie 5 : Visualisations avec Pandas et Matplotlib** 📊 (`partie5.ipynb`)

Génère des visualisations à partir des données historiques 🕒 en utilisant Pandas 🐼, Matplotlib 📊, et Seaborn 🌊.

## 📦 **Installation des Dépendances**

Les dépendances nécessaires sont indiquées au début de chaque script Python 🐍.

## ▶️ **Instructions d'Exécution** 🏃‍♂️

1. **Assurez-vous que tous les containers Docker 🐋 sont en marche 🔄.**
2. **Exécutez les scripts dans l'ordre suivant :**
   - **partie1.ipynb** → **partie2.ipynb** → **partie3.ipynb** → **partie4.ipynb** → **partie5.ipynb**.

## 📝 **Notes**

- Les scripts **create\_app** et **jeton\_access** sont inclus à titre d'exemple, mais ne doivent pas être exécutés 🚫.
- Les accès Mastodon 🐘 fournis sont déjà prêts à l'emploi 🟢.
- Le fichier tweets_dataset.csv est le fichier d'entrainement qui doit être importer pour pouvoir executer la partie 4.
