# 🧬 Pipeline FastQ-Explorer

![Bash](https://img.shields.io/badge/Language-Bash-4EAA25?style=flat-square)
![R](https://img.shields.io/badge/Statistics-R-276DC3?style=flat-square)
![Bioinformatics](https://img.shields.io/badge/Domain-Bioinformatics-ff69b4?style=flat-square)

**Un pipeline automatisé pour le Contrôle Qualité (QC) rapide des données de séquençage NGS.**

J'ai conçu et développé FastQ-Explorer avec un objectif précis : combler le fossé entre la donnée brute et son interprétation biologique.
En tant qu'Ingénieur Biologiste devenu Développeur, j'ai voulu démontrer comment l'automatisation (Bash) et la visualisation statistique (R) peuvent transformer une tâche de contrôle qualité fastidieuse en un processus instantané et reproductible. Ce projet est la mise en pratique de ma double compétence : appliquer la rigueur du développement logiciel (gestion d'erreurs, modularité) aux problématiques concrètes du séquençage NGS.

---

## 📊 Aperçu du Résultat

Voici le type de rapport graphique généré automatiquement par le pipeline à partir d'un fichier de séquençage brut :

<img width="800" height="600" alt="length_dist" src="https://github.com/user-attachments/assets/d6b08703-edb4-402a-83a3-4175c8c7c351" />

---

## 🚀 Fonctionnalités Clés

*   **Orchestration Bash :** Script maître (`run_pipeline.sh`) gérant les dépendances et les erreurs (Exit codes).
*   **Data Mining (awk) :** Extraction haute performance des métadonnées sans charger tout le fichier en mémoire.
*   **Visualisation (ggplot2) :** Génération automatique d'histogrammes avec lignes de moyenne et annotations dynamiques.
*   **Programmation défensive :** Vérification des arguments, existence des fichiers et gestion des exceptions.

## 🛠️ Stack Technique

*   **Langages :** Shell Scripting (Bash), R.
*   **Librairies :** `ggplot2` (Visualisation), `awk` (Traitement de texte).
*   **Données :** Format FASTQ (Illumina/Sanger).

## 📂 Structure du Projet

```text
FastQ-Explorer/
├── assets/            
├── data/              # Fichiers bruts
├── outputs/           # Résultats générés (CSV & PNG)
├── scripts/           # Code source
│   ├── 01_count_reads.sh      # Comptage des entrées
│   ├── 02_extract_lengths.sh  # Parsing via awk
│   └── 03_plot_lengths.R      # Génération du plot R
└── run_pipeline.sh    # 🏁 Script Maître (Point d'entrée)
```

## 💻 Installation et Utilisation

1. **Cloner le projet :**
   ```bash
   git clone https://github.com/romeoDjoman/pipeline-fastq-explorer.git
   cd pipeline-fastq-explorer
   ```

2. **Rendre le script exécutable :**
   ```bash
   chmod +x run_pipeline.sh
   ```

3. **Lancer l'analyse :**
   ```bash
   ./run_pipeline.sh data/sample.fastq
   ```

4. **Consulter les résultats :**
   Les fichiers seront générés dans le dossier `outputs/`.

---

## 👨‍💻 Auteur

**Roméo Djoman**  
Ingénieur Biologiste & Développeur Full-Stack.  
*Projet réalisé dans le cadre d'un portfolio technique démontrant l'automatisation de flux NGS.*

[Mon Profil GitHub](https://github.com/romeoDjoman)
```
