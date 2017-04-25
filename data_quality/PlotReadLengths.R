library(ggplot2)
library(readr)
library(dplyr)

data <- read_csv('readLengths.txt')
data <- filter(data, length < 10000)
ggplot(data, aes(length)) + 
  geom_histogram(bins = 50) + 
  geom_vline(xintercept = mean(data$length), color = "red") +
  labs(x="Read Length", y="Frequency", title = "Length of MinION Reads")
