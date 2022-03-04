setwd("K:/IR&D/IR21-03 HMA Improvements/R/dataOPS")

df_rank_pg <- readxl::read_xlsx("data-raw/paygrades.xlsx")

usethis::use_data(df_rank_pg, overwrite = T)
