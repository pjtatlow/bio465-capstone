#!/bin/bash

# $1 is the alignment script to use

for fastq in fastq/*.fastq; do
    sbatch $1 $fastq
done
