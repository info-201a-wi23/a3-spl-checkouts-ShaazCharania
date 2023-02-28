# Read in the SPL Data
df <- read.csv("2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

#Load in Packages
library(dplyr)
library(stringr)

# Which month had the highest amount of checkouts total in 2022?
df$Month <- month.name[df$CheckoutMonth]
data_for_2022 <- df %>% filter(CheckoutYear == 2022)
highest_amount_of_checkouts_month_data <- data_for_2022 %>% group_by(Month) %>% summarize(total_checkouts = sum(Checkouts))
highest_checkout_month <- highest_amount_of_checkouts_month_data %>% filter(total_checkouts == max(total_checkouts)) %>% pull(Month)

# Which month in 2022 had the most checkouts for E-Books?
EBook_df <- data_for_2022 %>% filter(MaterialType == "EBOOK")
Ebook_checkouts_per_month <- EBook_df %>% group_by(Month) %>% summarise(ebook_checkouts_total = sum(Checkouts))
Month_highest_ebook_checkouts <- Ebook_checkouts_per_month %>% filter(ebook_checkouts_total == max(ebook_checkouts_total)) %>% pull(Month)

# Which month had the highest amount of Dr. Seuss books in 2022?
DrSeuss_df <- data_for_2022 %>% filter(Creator == "Dr. Seuss")
DrSeuss_per_month <- DrSeuss_df %>% group_by(Month) %>% summarise(total_dr_seuss = sum(Checkouts))
Month_highest_dr_seuss <- DrSeuss_per_month %>% filter(total_dr_seuss == max(total_dr_seuss)) %>% pull(Month)

# What was the highest amount of Dr. Seuss books checked out in a single month?
Highest_number_of_dr_seuss_books <- DrSeuss_per_month %>% summarise(Amount_of_books = max(total_dr_seuss)) %>% pull(Amount_of_books)

# Which month had the lowest amount of checkouts in 2022?
Lowest_amount_of_checked_books_month <- data_for_2022 %>% group_by(Month) %>% summarize(total_checkouts = sum(Checkouts))
lowest_checkout_month <- Lowest_amount_of_checked_books_month %>% filter(total_checkouts == min(total_checkouts)) %>% pull(Month)
