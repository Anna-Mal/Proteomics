#!/bin/bash
#SBATCH -J kraken_convert
#SBATCH -t 120:00:00


########
mkdir krakenres_co/KrakenCO
~/miniconda3/envs/condiga/bin/convert -i krakenres_co/kraken_res_0.1.txt -t kraken -o krakenres_co/KrakenCO
