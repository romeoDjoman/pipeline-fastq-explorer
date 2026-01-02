#!/usr/bin/env bash

# Récupérer le nom du fichier passé en arguement
FASTQ_FILE=$1

# Vérifier si le fichier a été fourni 
if [ -z "$FASTQ_FILE" ]; then 
	echo "Usage: $0 nom_du_fichier.fastq"
	exit 1
fi 

# Vérifier si le fichier existe 
if [ ! -f "$FASTQ_FILE" ]; then
	echo "Le fichier $FASTQ_FILE n'existe pas"
	exit 1
fi

echo "Le fichier FASTQ fourni est : $FASTQ_FILE"

# Compter le nombre total de lignes du fichier
nombre_lignes=`wc -l < $FASTQ_FILE`

# Calculer le nombre de séquences
nombre_sequence=$((nombre_lignes / 4))

echo "Le fichier $FASTQ_FILE contient $nombre_sequence séquences."
