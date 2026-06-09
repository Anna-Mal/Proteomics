#!/bin/bash
#SBATCH -J proteomes_combine_cluster
#SBATCH -t 12:00:00
#SBATCH -p genoa
#SBATCH -N 1
#SBATCH --ntasks 3
#SBATCH --mem=28G


########

cd /condigaco/Reference_Sequences/ref_proteomes/

cat *.fasta > all_ref_proteomes.fasta

cat all_ref_proteomes.fasta ../../condigaco/all_genes.faa > prot_database.faa

~/miniconda3/bin/cd-hit -i prot_database.faa -o prot_database_clustered.faa -c 0.98 -T 6 -d 500 -M 0