Authors: Nour Nahtay (@NourNahtay), Merylin Ogunlola (@MerylinO), Igwebuike Oluchukwu Vivian (@igwebuikevee0000), Titilola Shittu (@lola), Princess Beatrice Sunday-Jimmy (@LaidyCharm), Onare Opeyemi Mary (@Onare)

## Heatmap Generation
Color selection is important for interpreting plots in R because it helps communicate data patterns, trends, and differences clearly and effectively. It also makes it easier to differentiate between categories or data groups, reducing confusion and allowing viewers to grasp key information quickly. In addition, considering that a significant portion of the population experiences colorblindness, using colorblind-friendly palettes ensures that visualizations remain clear and interpretable for everyone. 
![image](https://github.com/user-attachments/assets/6661ae2d-12c7-44e5-a196-fef20c5ee9e7)
Fig 1: Heatmap of samples alone

![image](https://github.com/user-attachments/assets/b2c00d6e-41fc-4912-b3e1-9fc73f11e1a6)
Fig 2: Heatmap of genes alone

![image](https://github.com/user-attachments/assets/a6adba0a-e030-47fe-b365-fd99a56b6531)
Fig 3: Heatmap of genes and samples


## Functional Enrichment Analysis
To prepare the data for functional enrichment analysis, we began by splitting the data into two groups, then getting the mean for each data in order to calculate the fold changes. We then calculated the P-values and used them - along with the fold changes - to subset the upregulated and down regulated genes. 

Upregulated: (fold change > 2 & P-Values < 0.2) & Downregulated: (fold change < -2 & p values < 0.2)

For this analysis, we decided to focus on the upregulated genes, and to perform functional enrichment analysis using ShinyGo (Ge, Jung & Yao). We used the GO database and an FDR of <0.05 for both databases to ensure consistency and significance.

![image](https://github.com/user-attachments/assets/7240baa0-1732-45e6-b25d-4aecc2f6dd95)
Table 1: Functional Enrichment Analysis Using ShinyGO
              
The top 5 pathways, number of genes involved, and the negative log 10 of FDR were extracted and used for visualization in the form of a bubble plot

![image](https://github.com/user-attachments/assets/92eb28b5-e865-467a-b64a-0f229c09035c)

Table 2: Top 5 pathways

![image](https://github.com/user-attachments/assets/26c360a5-199b-4d36-a774-22d6c5b71007)
Figure 4: Dot plot of the data

## Top 3 pathways
### Pathway 1: RNA Metabolism Regulation
In glioblastoma, RNA metabolism is notably disrupted, impacting tumor growth and treatment resistance. Abnormal RNA processing, including faulty splicing and modifications, results in defective proteins that drive tumor progression. GBM cells often exhibit abnormal alternative splicing, which affects crucial cellular processes and promotes malignancy. Additionally, altered RNA modifications can influence mRNA stability and translation, further contributing to tumor aggressiveness. Non-coding RNAs, such as microRNAs and long non-coding RNAs, are also deregulated, affecting gene expression and chromatin structure. _(Dong & Cui, 2019)_

### Pathway 2: RNA Biosynthesis Regulation
RNA biosynthesis involves transcription of pre-mRNA, which undergoes multiple post-transcriptional modifications, including splicing. Splicing removes introns and joins exons, resulting in mature mRNA that is translated into proteins. Kim et al. highlight aberrant RNA splicing in glioblastoma, focusing on the role of the SON protein, which influences the splicing machinery—an essential component of RNA biosynthesis. _(Kim et al., 2021)_

### Pathway 3: Regulation of Transcription by RNA Polymerase II
RNA Polymerase II transcribes DNA into mRNA in eukaryotic cells, and its regulation ensures genes are expressed appropriately. In glioblastoma, G9a enhances the transcription of the TCF12 gene by activating p-STAT3, which recruits RNA Polymerase II to its target promoters. This boosts the transcription of genes involved in tumor progression and radio-resistance. By modulating chromatin accessibility via histone modification, G9a indirectly controls Pol II's efficiency in transcribing oncogenic genes, contributing to glioblastoma's aggressive nature and linking epigenetic regulation to Pol II-driven gene expression. _(Li et al., 2023)_


#### **Citations:**
1. Ge SX, Jung D, Yao R. ShinyGO: a graphical gene-set enrichment tool for animals and plants. Bioinformatics. 2020 Apr 15;36(8):2628-2629. doi: 10.1093/bioinformatics/btz931. PMID: 31882993; PMCID: PMC7178415.
   
2. Dong, Z., & Cui, H. (2019). Epigenetic modulation of metabolism in glioblastoma. Seminars in Cancer Biology, 57, 45–51.
https://doi.org/10.1016/j.semcancer.2018.09.002

3. Kim, J.-H., Jeong, K., Li, J., Murphy, J. M., Vukadin, L., Stone, J. K., Richard, A., Tran, J., Gillespie, G. Y., Flemington, E. K., Sobol, R. W., Lim, S.-T. S., & Ahn, E.-Y. E. 
(2021). SON drives oncogenic RNA splicing in glioblastoma by regulating PTBP1/PTBP2 switching and RBFOX2 activity. Nature Communications, 12(1), 5551. https://doi.org/10.1038/s41467-021-25892-x

4. Li, X.-L., Xie, Y., Chen, Y.-L., Zhang, Z.-M., Tao, Y.-F., Li, G., Wu, D., Wang, H.-R., Zhuo, R., Pan, J.-J., Yu, J.-J., Jia, S.-Q., Zhang, Z., Feng, C.-X., Wang, J.-W., Fang, F., Qian, G.-H., Lu, J., Hu, S.-Y., ... Pan, J. (2023). The RNA polymerase II subunit B (RPB2) functions as a growth regulator in human glioblastoma. Biochemical and Biophysical Research Communications, 674, 170–182. https://doi.org/10.1016/j.bbrc.2023.06.088
