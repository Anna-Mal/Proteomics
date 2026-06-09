#!/bin/bash
#SBATCH -J ref_proteomes
#SBATCH -t 12:00:00
#SBATCH -p genoa
#SBATCH -N 1
#SBATCH --ntasks 3
#SBATCH --mem=28G

######## file species_prot.txt consists of proteome ids of confidently detected taxa shown by kraken tool

cd /condigaco/Reference_Sequences/

while read -r id; do
    echo "?? Downloading proteome: $id"
    curl -s -G "https://rest.uniprot.org/uniprotkb/stream" \
        --data-urlencode "query=proteome:$id" \
        --data-urlencode "format=fasta" \
        -H "Accept: text/x-fasta" \
        -o "ref_proteomes/${id}.fasta"

    if [[ $? -eq 0 && -s "ref_proteomes/${id}.fasta" ]]; then
        echo "? Saved to ref_proteomes/${id}.fasta"
    else
        echo "? Failed to download or empty file for $id"
        rm -f "ref_proteomes_new/${id}.fasta"
    fi
done < species_prot.txt