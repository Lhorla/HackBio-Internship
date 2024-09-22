# Load the necessary libraries
library(gplots)       # For creating heatmaps
library(ggplot2)      # For data visualization
library(readr)        # For reading CSV files
library(RColorBrewer) # For color palettes
library(dplyr)        # For data manipulation

# Load the dataset and read it in the form of CSV
glio_url <- "https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/Cancer2024/glioblastoma.csv"
glio_data <- read.csv(glio_url, row.names = 1)

head(glio_data)

View(glio_data)

# Define color palettes
diverging_palette <- colorRampPalette(brewer.pal(11, "RdBu"))(100)
sequential_palette <- colorRampPalette(brewer.pal(9, "Blues"))(100)

# Generate a heat map with samples alone.
heatmap.2(as.matrix(glio_data), trace = 'none', 
          scale ='row', dendrogram = 'none', 
          Colv = TRUE, Rowv = FALSE,
          main = "Heatmap with samples alone",
          col = diverging_palette)


# Generate a heat map with genes alone.
heatmap.2(as.matrix(glio_data), trace = 'none', 
          scale ='row', dendrogram = 'none', 
          Colv = FALSE, Rowv = TRUE,
          main = "Heatmap with genes alone",
          col = sequential_palette)

# Generate a heat map of genes and samples.
heatmap.2(as.matrix(glio_data), trace = 'none', 
          scale ='row', dendrogram = 'none', 
          Colv = FALSE, Rowv = TRUE,
          main = "Heatmap with genes and columns",
          col = diverging_palette)

# Extract column names
colnames(glio_data)

# Select groups by index positions
group1 <- c(1,2,3,4,5)
group2 <- c(6,7,8,9,10)

# Get groups 1 & 2 data 
group1_data <- glio_data[, group1]
group2_data <- glio_data[, group2] 

# Get & view the means
group1_mean <- rowMeans(group1_data)
group2_mean <- rowMeans(group2_data)

group1_mean
group2_mean

# Calculate the fold change
fold_change <- log2(group2_mean) - log2(group1_mean) 

fold_change

# Calculate the p-values
pvalues <- apply(glio_data, 1, function(row) {
  t.test(row[1:5], row[6:10])$p.value
})

pvalues

# Visualize the fold change and negative log of p-values
plot(fold_change, -log10(pvalues))

# Subset upregulated genes
upregulated_genes_1 <- group1_data %>%
  filter(fold_change > 2 & pvalues < 0.2)
upregulated_genes_2 <- group2_data %>%
  filter(fold_change > 2 & pvalues < 0.2)

# Subset downregulated genes
downregulated_genes_1 <- group1_data %>%
  filter(fold_change < -2 & pvalues < 0.2)
downregulated_genes_2 <- group2_data %>%
  filter(fold_change < -2 & pvalues < 0.2)

# Extract row names (gene names)
gene_namesup1 <- rownames(upregulated_genes_1)
gene_namesup2 <- rownames(upregulated_genes_2)
gene_namesdown1 <- rownames(downregulated_genes_1)
gene_namesdown2 <- rownames(downregulated_genes_2)

# Save the row names to a text file
write.table(gene_namesup1, file = "upregulated_genes_1.txt", 
            row.names = FALSE, col.names = FALSE, quote = FALSE)
write.table(gene_namesup2, file = "upregulated_genes_2.txt", 
            row.names = FALSE, col.names = FALSE, quote = FALSE)
write.table(gene_namesdown1, file = "downregulated_genes_1.txt", 
            row.names = FALSE, col.names = FALSE, quote = FALSE)
write.table(gene_namesdown2, file = "downregulated_genes_2.txt", 
            row.names = FALSE, col.names = FALSE, quote = FALSE)


# Create data frame with pathways, number of genes, and FDR
enrichment_results  <- data.frame(
  Pathway = c("RNA Metabolism Regulation", 
              "RNA Biosynthesis Regulation", 
              "Regulation of transcription by RNA polymerase II", 
              "regulation of DNA-templated transcription", 
              "pattern specification process"),
  GeneCount = c(13, 12, 12, 12, 6),  # Number of genes in each pathway
  FDR = c(0.0193, 0.0349, 0.0107, 0.0395, 0.0261)  # FDR values for each pathway
)

# Calculate -log10(FDR)
enrichment_results$neg_log_fdr <- -log10(enrichment_results$FDR)

# Create a dot plot
ggplot(enrichment_results, aes(x = reorder(Pathway, -GeneCount), y = GeneCount, size = neg_log_fdr)) +
  geom_point(aes(size = neg_log_fdr), color = "blue") +
  coord_flip() +
  theme_minimal() +
  labs(x = "Pathway", y = "Number of Genes", size = "-log10(FDR)", title = "Top 5 Enriched Pathways")
