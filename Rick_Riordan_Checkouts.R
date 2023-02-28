library(ggplot2)
library(tidyverse)
library(plotly)
library(scales)

# Filter Data for Rick Riordan

rick_riordan_checkouts <- data_for_2022 %>% group_by(Month) %>% summarize(total_checkouts = sum(Checkouts[grepl("Rick Riordan| Riordan, Rick", Creator)]))

# Order the Months
rick_riordan_checkouts$Month <- factor(rick_riordan_checkouts$Month, levels = order_month)
DrSeuss_per_month$Month <- factor(DrSeuss_per_month$Month, levels = order_month)

#Combine Datasets
DrSeuss_per_month <- DrSeuss_per_month %>% rename(total_checkouts = "total_dr_seuss")
DrSeuss_RickRiordan_combined <- rbind(rick_riordan_checkouts %>% mutate(Creator = "Rick Riodan"), DrSeuss_per_month %>% mutate(Creator = "Dr. Seuss"))

# Create Graph
drseuss_vs_rick <- ggplot(DrSeuss_RickRiordan_combined, aes(x = Month, y = total_checkouts, color = Creator, group = Creator)) +
  geom_line() +
  labs(title = "Rick Riordan Books versus Dr. Seuss Books Checked Out \n per Month in 2022", x = "Month", y = "Total Checkouts per Month") +
  theme_bw() + theme(panel.grid.major=element_line(colour="black"), axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme(panel.grid.minor=element_line(colour="black")) +
  scale_y_continuous(breaks = seq(50, 950, 100)) +
  scale_color_discrete(name = "Author") +
  scale_color_brewer(palette = "Dark2")

show(drseuss_vs_rick)
