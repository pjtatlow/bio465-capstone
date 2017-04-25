#!/usr/bin/env python3

import statistics, glob

lengths = []
numSeqs = []
for fastq in glob.glob("fastq/*.fastq"):
    seqs = 0
    with open(fastq,'r') as in_file:
        line_num = 0
        for line in in_file:
            line_num += 1
            if (line_num % 4) == 2:
                line = line.strip()
                lengths.append(len(line))
                seqs += 1
    numSeqs.append(seqs)

print("Avg Length: ", statistics.mean(lengths))
print("Std Dev: ", statistics.stdev(lengths))
print("Avg reads: ", statistics.mean(numSeqs))
print("Std Dev: ", statistics.stdev(numSeqs))
