setwd("K:/IR&D/IR21-03 HMA Improvements/R/dataOPS")

# paygrade data
df_rank_pg <- readxl::read_xlsx("data-raw/paygrades.xlsx")
usethis::use_data(df_rank_pg, overwrite = T, internal = T)

# bah data
bah_data <- read.csv("bah-data/bah.csv") %>% 
  select(MHA, pg, dep, year, bah_rate = value)
usethis::use_data(bah_data, overwrite = T, internal = T)
