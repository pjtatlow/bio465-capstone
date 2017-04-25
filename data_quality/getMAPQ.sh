#!/bin/bash

module load samtools/1.2 
for sam in alignments/bwa/*/alignments.filtered.sam; do
    samtools view $sam | awk '{print $5}' >> mapqs.bwa.txt
done
