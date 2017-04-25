#!/bin/bash

#SBATCH --time=01:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=4096M   # memory per CPU core

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE

module load python/3/5

filename=$(basename $1)
id=${filename/%\.fastq/}

output=alignments/kallisto-v2/$id

mkdir -p $output

avg_length=$( python3 avg-length.py $1 )
std_dev=$( python3 std-dev.py $1 )

/fslgroup/fslg_capstone/compute/kallisto/kallisto quant \
    -i references/gencode.v25.transcripts.kallisto.index \
    -o $output/ \
    --single \
    -s $std_dev \
    -l $avg_length \
    --bias \
    --pseudobam \
    $1 2> $output/stdout.log 1> $output/alignments.sam

