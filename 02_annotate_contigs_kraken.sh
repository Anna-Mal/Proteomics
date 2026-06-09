#!/bin/bash
#SBATCH -J kraken
#SBATCH -t 120:00:00
#SBATCH -p fat_genoa
#SBATCH -N 1
#SBATCH --ntasks 5
#SBATCH --mem=128G

########
mkdir krakenres_co
kraken2 --db kraken2db --use-names --output krakenres_co/kraken_res_0.1.txt --confidence 0.1 --report krakenres_co/kraken_report_0.1.txt coassembly/final.contigs.fa
