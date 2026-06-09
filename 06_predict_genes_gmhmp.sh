#!/bin/bash
#SBATCH -J gmhmp
#SBATCH -t 120:00:00
#SBATCH -p genoa
#SBATCH -N 1
#SBATCH --ntasks 3
#SBATCH --mem=28G

########

gmhmmp -a -d -m /MetaGeneMark/mgm/MetaGeneMark_v1.mod coassembly/final.contigs.fa