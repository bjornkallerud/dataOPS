###########################################################################################################################################################
#' Gather BAH data
#'
#' @param mha string of MHA code, ie "AK400"
#' @param years numeric series of years, default is 2015:2022
#' @param dependency dependency status, either "With Dependents" or "Without Dependents", default is "With Dependents"
#' @param paygrades either "Limited", which exludes enlisted and warrant officers or "All", default is "Limited"
#' 
#' @return This function returns a dataframe of BAH rates
#'
#' @author Bjorn Kallerud
#'
#' @import tidyverse
#'
#' @export

collect_bah <- function(mha, years = 2015:2022, dependency = "With Dependents", paygrades = "Limited") {
  
  df_out <- bah_data %>% 
    filter(MHA == mha & dep == dependency & year %in% years) %>% 
    select(-c(MHA, dep)) %>% 
    {if (paygrades == "Limited") filter(., ! pg %in% c(paste0("O0", 1:3, "E"), paste0("W0", 1:5))) else if (paygrades == "All") .} %>% 
    spread(year, bah_rate)
  
  return(df_out)

}
