#!/usr/bin/env python

import glob

print "id\ttype\ttranscript\ttpm"

for abundance in glob.glob("alignments/bwa/*/quants/abundance.filtered.tsv"):
    path = abundance.split('/')
    sample = path[2].split('_')
    sample_id = sample[0]
    sample_type = sample[1]
    with open(abundance,'r') as in_file:
        for line in in_file:
            line = line.strip().split('\t')
            print "{i}\t{t}\t{tr}\t{tpm}".format(i=sample_id,t=sample_type,tr=line[0],tpm=line[3])

