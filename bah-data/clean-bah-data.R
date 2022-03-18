library(readxl)
setwd("K:/IR&D/IR21-03 HMA Improvements/R/dataOPS/bah-data")

# function to pull data from K Drive
collect_bah <- function(yr, dep = "With") {
  
  # xls before 2016, xlsx after
  if (yr < 2016) {
    tmp <- read_xls(paste0("K:/DATA/BAH Rates and RMC Tables/", yr, " BAH Rates and Info/", yr, " BAH rates for tables.xls"), sheet = if (dep == "With") 1 else if (dep == "Without") 2 )
  }
  
  if (yr >= 2016) {
    tmp <- read_xlsx(paste0("K:/DATA/BAH Rates and RMC Tables/", yr, " BAH Rates and Info/", yr, " BAH rates for tables.xlsx"), sheet = if (dep == "With") 1 else if (dep == "Without") 2 )
  }
  
  tmp <- tmp %>% 
    select(3:ncol(.)) %>% 
    gather(pg, value, -MHA) %>% 
    mutate(year = yr, dep = if (dep == "With") "With Dependents" else if (dep == "Without") "Without Dependents") %>% 
    # make sure paygrades aren't comments
    filter(pg %in% c(paste0("E0", 1:9), paste0("O0", 1:9), paste0("W0", 1:5), paste0("O0", 1:3, "E")))
  
  return(tmp)
  
}

years <- 2008:2022 # years of data

# combine all years/dep status
bah <- bind_rows(do.call(rbind, lapply(years, collect_bah, dep = "With")),
                 do.call(rbind, lapply(years, collect_bah, dep = "Without")))

write.csv(bah, "bah.csv", row.names = F)
