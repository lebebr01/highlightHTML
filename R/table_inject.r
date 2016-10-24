#' Table hash addition
#' 
#' A helper function to include a hashtag id code within an R table.
#' 
#' @param x A table object
#' @param id A vector of css id(s) to include
#' @param conditions A vector of conditions to include id. Must be same length as id
#' @param variable An optional vector of column names to specify search of conditions.
#' @export
#' 
#' @examples 
#' library(dplyr)
#' library(highlightHTML)
#'
#' summ_table <- mtcars %>% 
#'   group_by(cyl) %>% 
#'   summarise(avg_mpg = mean(mpg), sd_mpg = sd(mpg)) %>%
#'   data.frame()
#'   
#'   table_id_inject(summ_table, id = c('#bgred', '#bgblue'), 
#'   conditions = c('< 2', '> 16'))
#'   

table_id_inject <- function(x, id, conditions, variable = NULL) {
  
  if(is.null(variable)) {
    paste_cond <- lapply(seq_along(conditions), function(xx) 
      paste0('x ', conditions[xx]))
  } else {
    paste_cond <- lapply(seq_along(conditions), function(xx) 
      paste0(x, "['", variable[xx], "']", conditions[xx]))
  }
  
  locations <- lapply(seq_along(id), function(xx) 
    ifelse(eval(parse(text = paste_cond[[xx]])), TRUE, FALSE))
  
  x2 <- x
  for(xx in seq_along(locations)) {
    x2[locations[[xx]] == TRUE] <- paste(x2[locations[[xx]] == TRUE], id[xx])
  }
  # lapply(seq_along(locations), function(xx) 
  #     x2[locations[[xx]] == TRUE] <- paste(x2[locations[[xx]] == TRUE], id[xx])
  #   )
  
  return(x2)
}
