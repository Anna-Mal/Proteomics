#!/bin/bash
#SBATCH -J megahit
#SBATCH -t 120:00:00
#SBATCH -p himem_4tb
#SBATCH -N 1
#SBATCH --ntasks 1
#SBATCH --cpus-per-task=48
#SBATCH --mem=768G

########

megahit -1 s1_R1.fastq.gz,s2_R1.fastq.gz,s3_R1.fastq.gz,s4_R1.fastq.gz,s5_R1.fastq.gz,s6_R1.fastq.gz,s7_R1.fastq.gz,s8_R1.fastq.gz,s9_R1.fastq.gz,s10_R1.fastq.gz,s11_R1.fastq.gz,s12_R1.fastq.gz,s13_R1.fastq.gz,s14_R1.fastq.gz,s15_R1.fastq.gz -2 s1_R2.fastq.gz,s2_R2.fastq.gz,s3_R2.fastq.gz,s4_R2.fastq.gz,s5_R2.fastq.gz,s6_R2.fastq.gz,s7_R2.fastq.gz,s8_R2.fastq.gz,s9_R2.fastq.gz,s10_R2.fastq.gz,s11_R2.fastq.gz,s12_R2.fastq.gz,s13_R2.fastq.gz,s14_R2.fastq.gz,s15_R2.fastq.gz -t 48 -o coassembly

