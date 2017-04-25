#!/bin/bash

#total_unmapped=0
total_mapped=0
total_reads=0

# $1 is the path to the directory with the alignment output
# $2 is the name of the sam files to count

for sam in $1/*/$2; do
    mapped=$(samtools view $sam | awk '$4 != 0' | awk '{print $1}' | uniq | wc -l)
    reads=$(samtools view $sam | awk '{print $1}' | uniq | wc -l)
    total_reads=$(expr $total_reads + $reads)
    total_mapped=$(expr $total_mapped + $mapped)
done

echo $total_mapped
echo $total_reads
