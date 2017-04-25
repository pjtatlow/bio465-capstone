#!/bin/bash

#SBATCH --time=01:00:00   # walltime
#SBATCH --ntasks=4   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=4096M   # memory per CPU core

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE

filename=$(basename $1)
id=${filename/%\.fastq/}
mkdir -p alignments/graphmap/$id/quants/

/fslgroup/fslg_capstone/compute/graphmap/bin/Linux-x64/graphmap align \
    -r references/GRCh38.primary_assembly.genome.fa \
    --gtf references/gencode.v25.annotation.gtf \
    -d $1 \
    -o alignments/graphmap/$id/alignments.sam

