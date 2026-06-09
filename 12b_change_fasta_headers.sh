#!/bin/bash
#SBATCH -J change_fasta_headers
#SBATCH -t 12:00:00
#SBATCH -p genoa
#SBATCH -N 1
#SBATCH --ntasks 3


module load 2024
module load R/4.4.2-gfbf-2024a

Rscript 12a_change_fasta_headers.R

cd /eggnog/gene_lists_for_prot/

dos2unix header_mapping_any.tsv
sed -i 's/[[:space:]]*$//' header_mapping_any.tsv

cd /condigaco/

awk 'BEGIN {
    while ((getline line < "../eggnog/gene_lists_for_prot/header_mapping_any.tsv") > 0) {
        split(line, fields, "\t")
    old2new[fields[1]] = fields[2]
    }
}
/^>/ {
    match($0, /^>[^\t >]+/)
    base = substr($0, RSTART, RLENGTH)
    if (base in old2new)
        print old2new[base]
    else
        print $0
    next
}
{ print }' Reference_Sequences/ref_proteomes/prot_database_clustered_filtered_any_annot.faa >prot_database_clustered_filtered_any_annot_renamed_headers.faa