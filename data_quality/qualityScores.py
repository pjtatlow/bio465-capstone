#!/usr/bin/env python

import sys, glob

scores = {}
for fastq in glob.glob(sys.argv[1] + "*.fastq"):
    line_num = 1
    with open(fastq,'r') as in_file:
        for line in in_file:
            if (line_num % 4) == 0:
                line = line.strip()
                for char in line:
                    ascii = ord(char)
                    if ascii not in scores:
                        scores[ascii] = 0
                    scores[ascii] += 1
            line_num += 1
    
print "score,count"
for qual in scores:
    count = scores[qual]
    print "{q},{c}".format(q=qual,c=count)
