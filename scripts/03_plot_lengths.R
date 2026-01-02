#!/usr/bin/env Rscript

library(ggplot2)

# 1. Lire le CSV
input_file <- "outputs/read_lengths.csv"
if (!file.exists(input_file)) {
  stop("Erreur : Le fichier outputs/read_lengths.csv est introuvable.")
}

data <- read.table(
  input_file,
  header = TRUE,
  sep = ",",
  stringsAsFactors = FALSE
)

# Sécurisation du type numérique
data$Length <- as.numeric(data$Length)

# 2. Calculs statistiques pour l'annotation
mean_len <- round(mean(data$Length), 1)
nb_reads <- nrow(data)

# 3. Préparation de la sauvegarde
png("outputs/length_dist.png", width=800, height=600) # On augmente la résolution

# 4. Création du graphique Pro
plot <- ggplot(data, aes(x = Length)) +
  
  
  geom_histogram(binwidth = 5, fill = "steelblue", color = "white", alpha = 0.8) +
  
  geom_vline(aes(xintercept = mean(Length)), color = "red", linetype = "dashed", size = 1) +
  
  annotate("text", x = mean_len + 15, y = 50, label = paste("Moyenne :", mean_len, "pb"), color = "red") +
  
  theme_classic() +
  
  labs(
    title = "Distribution des longueurs de séquences (Quality Control)",
    subtitle = paste("Analyse effectuée sur", nb_reads, "séquences"),
    x = "Longueur des reads (paires de bases)",
    y = "Fréquence",
    caption = "Généré par FastQ-Explorer"
  ) +
  
  
  theme(
    plot.title = element_text(size = 20, face = "bold"),
    axis.title = element_text(size = 14),
    axis.text = element_text(size = 12)
  )

print(plot)
dev.off()

message("Graphique généré avec succès : outputs/length_dist.png")