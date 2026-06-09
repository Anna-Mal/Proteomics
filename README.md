# 🧪 Project demonstrates construction of a custom protein reference database based on microbiome composition data

## 🎯 Aim

Create a custom reference protein database derived from microbiome sequencing data
             
## ⚙️ Methods

- Custom reference database generation using the Contigs Directed Gene Annotation (ConDiGA, https://github.com/metagentools/ConDiGA) workflow extended with proteomes of the most abundant microbial species.

- Functional annotation using eggNOG-mapper (https://github.com/eggnogdb/eggnog-mapper)
                
## 🔄 Analytical workflow of reference database preparation using shotgun metagenomic sequencing data

- Assembly of raw reads into contigs using MEGAHIT
- Taxonomic annotation using Kraken 2
- Gene coverage estimation with CoverM
- Gene prediction using MetaGeneMark
- Protein inference using the ConDiGA
- Extension of the database with reference proteomes of confidently detected taxa
- Functional annotation using eggNOG-mapper
- Removal of proteins lacking functional annotation
- Changing fasta headers