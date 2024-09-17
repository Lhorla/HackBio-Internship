## Gene Expression Analysis and Visualization
This project involves the visualization and interpretation of gene expression data from glioblastoma samples. The aim is to generate heatmaps, perform functional enrichment analysis, and interpret the results to understand the biological significance of differentially expressed genes.

We used a glioblastoma dataset (500+ differentially expressed genes under different conditions) - https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/Cancer2024/glioblastoma.csv

### Task
1. Generate a heatmap for the entire dataset. Use a diverging and sequential color palette to generate two color variants of the same heatmap. The importance of color selection in the ease of interpreting plot was considered.
With the same heatmap, generate a variant of your heatmap where you:
- Cluster your genes (rows) alone,
- Cluster your samples (col) alone;
- Cluster both genes and sample together;
2. Subset genes
- significantly upregulated. (Setup your own cut-offs for the fold change and P-values).
- significantly downregulated. (Setup your own cut-offs for the fold change and P-values).
3. Perform functional enrichment analysis with either ShinyGO, GOrilla or PANTHER.
4. Using the top 5 pathways, create a straightforward visualization (such as a lollipop plot, dot plot, lineplot or bubble plot) that displays the number of genes associated with each pathway. The plot should also reflect the significance of each pathway by scaling the points according to the negative log10 of the p-value.
5. Describe the top 3 enriched pathways according to biological process in your report.

### Packages installed in RStudio:
- readr for reading CSV files
- dplyr for data manipulation
- RColorBrewer for color palettes
- gplots for heatmap generation
- ggplot2 for unctional enrichment analysis visualization


