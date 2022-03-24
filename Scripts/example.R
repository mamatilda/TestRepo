# Filler R script

library(ggplot2)

rm(list = ls())

data<-read.csv("Data/Cosmo_WGS_metadata.csv")

counts<-data.frame(subclade=unique(data$assignment), count=NA)

for (i in 1:length(counts$subclade)) {
  counts$count[i]<-length(which(data$assignment == counts$subclade[i]))
}

p<-ggplot(data=counts, aes(x=count, y=subclade)) +
  geom_bar(stat="identity")
p

AF1b<-data[which(data$assignment == "Cosmopolitan AF1b"),]

ggsave("Figures/barplot.png", p)
write.csv(AF1b, "Outputs/AF1b.csv", row.names = F)
