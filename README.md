# Projet de Data Warehouse

## Description du Projet

Ce projet consiste à créer un entrepôt de données (Data Warehouse) en utilisant SQL Server 2022 et Visual Studio 2022. L'objectif est de centraliser et d'organiser les données provenant de différentes sources pour faciliter l'analyse et la génération de rapports.

## Étapes du Projet

### 1. Création des Tables de Dimensions et de Faits

Les tables de dimensions et de faits ont été créées pour stocker les différentes entités et les transactions de vente. Les tables de dimensions incluent des informations sur le calendrier, le temps, les caisses, les magasins, les promotions, les produits, les clients et les modes de paiement. La table de faits enregistre les transactions de vente de produits.

### 2. Création des Tables de Staging

Des tables de staging ont été créées pour permettre le chargement initial des données avant leur transformation et leur insertion dans les tables de dimensions et de faits. Ces tables de staging facilitent le nettoyage et la préparation des données.

### 3. Chargement des Données

Les données ont été chargées dans les tables de staging à partir de fichiers CSV. Ensuite, les données ont été transformées et insérées dans les tables de dimensions et de faits.

### 4. Génération des Rapports KPI

Des requêtes SQL ont été écrites pour générer des rapports de performance clés (KPI). Ces rapports incluent des informations telles que le montant total des ventes, la quantité totale vendue, le montant moyen des ventes par transaction, le nombre de clients uniques, les produits les plus vendus, et le chiffre d'affaires par magasin et par mois.

### 5. Organisation du Projet

Le projet est organisé de manière à séparer les scripts SQL, les données sources et les scripts Python. Les scripts SQL sont placés dans le dossier `Scripts`, les fichiers de données sources dans le dossier `first_data`, et les scripts Python dans le dossier `python_scripts`.
