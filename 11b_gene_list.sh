#!/bin/bash
#SBATCH -J prot_database
#SBATCH -t 12:00:00
#SBATCH -p genoa
#SBATCH -N 1
#SBATCH --ntasks 3


########

module load 2024
module load R/4.4.2-gfbf-2024a

Rscript /scripts/11a_gene_list.R

cd /eggnog/gene_lists_for_prot/
dos2unix gene_queries_prot.txt
sed -i 's/[[:space:]]*$//' gene_queries_prot.txt
