#!/usr/bin/env bash

# 1. On récupère l'argument
INPUT_FILE=$1

# 2. Vérifications de sécurité
if [ -z "$INPUT_FILE" ]; then 
    echo "Usage: $0 data/nom_du_fichier.fastq"
    exit 1
fi 

if [ ! -f "$INPUT_FILE" ]; then
    echo "Erreur : Le fichier $INPUT_FILE n'existe pas"
    exit 1
fi

# Préparation du dossier de sortie
mkdir -p outputs

echo "================================================="
echo ">>> Démarrage du pipeline FastQ-Explorer"
echo ">>> Fichier : $INPUT_FILE"
echo "================================================="

# Étape 1 : Comptage
echo "[1/3] Comptage des séquences..."
./scripts/01_count_reads.sh $INPUT_FILE
if [ $? -ne 0 ]; then
    echo "Erreur lors du comptage !"
    exit 1
fi

# Étape 2 : Extraction (Appel du script externe AVEC l'argument)
echo "[2/3] Extraction des longueurs..."
./scripts/02_extract_lengths.sh $INPUT_FILE
if [ $? -ne 0 ]; then
    echo "Erreur lors de l'extraction des longueurs !"
    exit 1
fi

# Étape 3 : Visualisation
echo "[3/3] Génération du graphique..."
Rscript scripts/03_plot_lengths.R
if [ $? -ne 0 ]; then
    echo "Erreur lors de la génération du graphique R !"
    exit 1
fi

echo "================================================="
echo "✅ Pipeline terminé avec succès !"
echo "📊 Résultats disponibles dans : outputs/length_dist.png"
echo "================================================="
