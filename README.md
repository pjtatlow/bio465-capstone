# bio465-capstone

## Alignment

The first step is to align the data to a reference transcriptome and quantify each transcript. The scripts in the `alignment` directory are used to do this, producing SAM files, and in the case of Kallisto and BWA, producing quantifications. We did not quantify the output of Graphmap due to the issues discusses in the paper.

## Data Quality

The scripts in the `data_quality` directory were used to assess the quality of the raw data and of the alignments.
* `fastqStats.py` summarizes the average/standard deviations for length and number of reads of all FASTQ files.
* `getMAPQ.sh` prints the MAPQ score of each alignment in the BWA-MEM filtered alignment file.
* `qualityScores.py` prints the number of bases called with each quality score.
* `readLengths.py` prints the length of each read from each FASTQ on it's own line.
* `PlotAlignmentQuality.R` creates a simple histogram of the MAPQ files, which we used to determine the quality of the alignment (the output of `getMAPQ.sh`).
* `PlotQualityScores.R` creates a histogram of the quality scores of each base (the output of `qualityScores.py`).
* `PlotReadLengths.R` creates a histogram of the read lengths (the output of `readLengths.py`).