library(readr)

mapq.bwa <- read_csv("mapqs.bwa.txt")
hist(mapq.bwa$MAPQ, breaks=0:max(mapq.bwa))