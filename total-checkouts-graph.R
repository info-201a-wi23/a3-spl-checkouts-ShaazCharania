library(ggplot2)
library(tidyverse)
library(plotly)
library(scales)

# Create a dataset that lists the total amount of checkouts at SPL in 2022
total_checkouts_per_month_SPL <- data_for_2022 %>% group_by(Month) %>% summarize(total_checkouts = sum(Checkouts))

#Order the Months
total_checkouts_per_month_SPL$Month <- factor(total_checkouts_per_month_SPL$Month, levels = order_month)

# Create a bar chart
total_checkouts_graph <- ggplot(total_checkouts_per_month_SPL, aes(x = Month, y = total_checkouts, fill = "red")) +
  geom_col() +
  labs(title = "Total Amount of Checkouts each Month in 2022 at the SPL", x = "Month", y = "Total Checkouts per Month") +
  scale_y_continuous(labels = label_number_si(), breaks = seq(0, 750000, 200000)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "none")

show(total_checkouts_graph)