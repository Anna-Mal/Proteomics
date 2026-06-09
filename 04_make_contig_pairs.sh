#!/bin/bash
#SBATCH -J make_pairs
#SBATCH -t 120:00:00
#SBATCH -p genoa


# Define output path
output_dir="coverm_res"
output_file="$output_dir/pairs.txt"

# Clear the file if it exists
> "$output_file"

# Loop through all R1 files
for r1 in *_R1.fastq.gz; do
    r2="${r1/_R1.fastq.gz/_R2.fastq.gz}"

    if [[ -f "$r2" ]]; then
        echo -e "$PWD/$r1\t$PWD/$r2" >> "$output_file"
    else
        echo "??  WARNING: No R2 pair found for $r1"
    fi
done

echo "? Pairs file saved to: $output_file"
echo "?? Contains $(wc -l < "$output_file") read pairs."