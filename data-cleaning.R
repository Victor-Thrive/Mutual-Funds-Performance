library(tidyverse)
library(janitor)
category = c(
  rep("Equity Based", 17),
  rep("Money Market", 34),
  rep("Bond Fixed Income", 35),
  rep("Dollar Eurobond", 15),
  rep("Fixed Income", 12),
  rep("Real Estate Investment Trust", 5),
  rep("Balanced", 27),
  rep("Ethical", 3),
  rep("Sharia Equities", 2),
  rep("Sharia Fixed Income", 11),
  rep("Infrastructure", 2),
  rep("ETF", 12)
)


filter_category <- function(data_frame, category_name) {
  filtered_df <- data_frame |>
    filter(category == category_name)
  return(filtered_df)
}

date <- as.Date("2024-06-07")
sec_df <- read_excel("dataset/NAV-as-at-7th-June-2024.xlsx",
                     sheet = 1,
                     skip = 2)
df <-
  sec_df |>
  clean_names() |>
  filter(!grepl("[^0-9]", s_n)) |>
  drop_na(s_n) |>
  mutate(date = date, category = category)





equity <- filter_category(df,"Equity Based")

filter_category(df,"Dollar Eurobond")
filter_category(df,"Fixed Income")
filter_category(df,"Real Estate Investment Trust")
filter_category(df,"Balanced")
filter_category(df,"Ethical")
filter_category(df,"Sharia Equities")
filter_category(df,"Money Market")
filter_category(df,"Sharia Fixed Income")
filter_category(df,"Bond Fixed Income")
