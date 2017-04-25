library(ggplot2)
library(readr)

scores <- read_csv("qualityCounts.csv")
scores$quality = scores$quality - 33
ggplot(scores, aes(quality, count)) + 
  geom_col() + 
  theme_minimal() + 
  labs(x="Quality Score", y="Frequency") + 
  geom_vline(xintercept = c(3.5))
