#!/bin/bash
#SBATCH -J coverm
#SBATCH -t 120:00:00
#SBATCH -p genoa
#SBATCH -N 1
#SBATCH --ntasks 3
#SBATCH --mem=28G


########


coverm contig -c $(awk '{print $1, $2}' coverm_res/pairs.txt) -r coassembly/final.contigs.fa -o coverm_res/contig_coverage_co.tsv -t16