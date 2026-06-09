#!/bin/bash
#SBATCH -J eggnog
#SBATCH -t 48:00:00
#SBATCH -p genoa


source ~/miniconda3/etc/profile.d/conda.sh
conda activate /envs/eggnog_env

cd /eggnog

mkdir -p results

python /envs/eggnog_env/bin/emapper.py -i /condigaco/Reference_Sequences/ref_proteomes/prot_database_clustered.faa \
  -o annot_ref \
  --output_dir results/ \
  --itype proteins \
  --cpu 8 \
  --override \
  --data_dir ~/eggnog_db