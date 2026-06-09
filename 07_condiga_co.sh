#!/bin/bash
#SBATCH -J condiga
#SBATCH -t 100:00:00
#SBATCH -p genoa
#SBATCH -N 1
#SBATCH --ntasks 4
#SBATCH --mem=28G

########
mkdir condigaco
~/miniconda3/envs/condiga/bin/condiga -c coassembly/final.contigs.fa -ta krakenres_co/KrakenCO/kraken_result.txt -g coassembly/final.contigs.fa.lst -cov coverm_res/contig_coverage_co.tsv -as ./assembly_summary.txt -o condigaco
