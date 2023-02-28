library(ggplot2)
library(tidyverse)
library(plotly)
library(scales)

# Create a visualization that compares the number of e-book vs paper books checkout each month in 2022

books_vs_ebooks <- data_for_2022 %>% filter(MaterialType %in% c("EBOOK", "BOOK")) %>% group_by(Month, MaterialType) %>% summarise(checkouts_per_month = sum(Checkouts))

# Ordering the Months
order_month <- c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")

# Applying order_month list to data
books_vs_ebooks$Month <- factor(books_vs_ebooks$Month, levels = order_month)

# Plot the graph
Ebook_vs_book_graph <- ggplot(books_vs_ebooks, aes(x = Month, y = checkouts_per_month, color = MaterialType, group = MaterialType)) + 
  geom_line() +
  labs(title = "The number of Paper Books vs the number of E-Books checked \n out each month in 2022", x = "Month", y = "Checkouts Per Month") +
  theme_bw() + theme(panel.grid.major=element_line(colour="black"), axis.text.x = element_text(angle = 45, hjust = 1)) + 
  theme(panel.grid.minor=element_line(colour="black")) +
  scale_y_continuous(labels = label_number_si(), breaks = seq(200000, 270000, 10000)) +   scale_color_discrete(name = "Medium", labels = c("Paper Books", "E-Books"))

show(Ebook_vs_book_graph)
