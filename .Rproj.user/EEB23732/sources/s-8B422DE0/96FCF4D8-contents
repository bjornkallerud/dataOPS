###########################################################################################################################################################
#' Rank to Paygrades
#'
#' @param df a dataframe of ranks and possibly services
#' @param service either "Multi", in which case columns "service" and "rank" must be present in df, or one of "Army", "Air Force", "Navy", "Coast Guard", in which case column rank must be present in df 
#'
#' @return This function returns a vector of correctly formatted meter sizes
#'
#' @author Bjorn Kallerud
#'
#' @import dplyr
#'
#' @export

rank_to_pg <- function(df, service) {
  
  if (service != "Multi") {
    
    df_out <- df %>% 
      left_join(df_rank_pg %>% filter(service == service) %>% select(-service), by = c("rank"))
    
  }

  if (service == "Multi") {
    
    df_out <- df %>% 
      left_join(df_rank_pg, by = c("service", "rank"))
    
  }
  
  return(df_out)

}
