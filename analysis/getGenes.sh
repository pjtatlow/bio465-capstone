#!/bin/bash

# Creates new TSV file with only sequenced trancsripts for each sample

for path in alignments/bwa/*/quants; do
    cat $path/quant.sf | grep "protein_coding" | grep -E "\|EGFR\||\|BRAF\||\|MET\||\|ERBB2\|" > $path/abundance.filtered.tsv
done
