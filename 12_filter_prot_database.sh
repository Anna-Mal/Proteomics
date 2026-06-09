#!/bin/bash
#SBATCH -J prot_database_filter
#SBATCH -t 12:00:00
#SBATCH -p genoa
#SBATCH -N 1
#SBATCH --ntasks 3

########
cd /gpfs/work3/0/prjs1358/data/fucoquest/condigaco/Reference_Sequences/ref_proteomes/

awk 'BEGIN {
    # Load wanted keys from query file
    while ((getline < "/eggnog/gene_lists_for_prot/gene_queries_prot.txt") > 0) {
        wanted[$0] = 1
    }
}
# For each header line in fasta
/^>/ {
    split($0, parts, " ")               # split only on space
    header_id = substr(parts[1], 2)    # remove leading ">" from first part
    keep = (header_id in wanted)
}
# Print header and following lines if keep is true
keep { print }

' prot_database_clustered.faa > prot_database_clustered_filtered_any_annot.faa
