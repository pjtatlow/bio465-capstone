#!/usr/bin/env python3

import sys, statistics

lengths = []
with open(sys.argv[1],'r') as in_file:
    line_num = 0
    for line in in_file:
        line_num += 1
        if (line_num % 4) == 2:
            line = line.strip()
            lengths.append(len(line))


print(statistics.mean(lengths))
