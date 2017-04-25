#!/bin/bash

#SBATCH --time=01:00:00   # walltime
#SBATCH --ntasks=4   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=4096M   # memory per CPU core

# Load Samtools Module
module load samtools/1.2

# Set necessary variables and create output directory
filename=$(basename $1)
id=${filename/%\.fastq/}
mkdir -p alignments/bwa/$id/quants/
dir=alignments/bwa/$id

# Run BWA-MEM with the option for Oxford Nanopore Reads
bwa mem -x ont2d \
    references/gencode.v25.transcripts.fa \
    $1 > $dir/alignments.sam 2> $dir/stdout.log

# Remove low quality alignments
samtools view -h $dir/alignments.sam | awk '$5 != 0' > $dir/alignments.filtered.sam

# Quantify alignment with Salmon
salmon quant -t references/gencode.v25.transcripts.fa -l SF \
    -a $dir/alignments.filtered.sam \
    -o $dir/quants &> $dir/quants/stdout.log
