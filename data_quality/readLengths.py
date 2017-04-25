#!/usr/bin/env python

import sys, glob, json

print "length"
for fastq in glob.glob(sys.argv[1] + "*.fastq"):
    line_num = 1
    with open(fastq,'r') as in_file:
        for line in in_file:
            if (line_num % 4) == 0:
                line = line.strip()
                print len(line) 
            line_num += 1
