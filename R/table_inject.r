#' Table hash addition
#' 
#' A helper function to include a hashtag id code within an R table.
#' 
#' @param x A table object
#' @param id A vector of css id(s) to include
#' @param conditions A vector of conditions to include id. Must be same length as id
#' @param variable An optional list of column names to specify search of conditions. More
#'      than one variable can be specified in each element of the list. The list must be the 
#'      same length as the conditions or id arguments.
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
#' table_id_inject(summ_table, id = c('#bgred', '#bgblue'), 
#'   conditions = c('< 2', '> 16'))
#'   
#' table_id_inject(summ_table, id = c('#bgred', '#bgblue'),
#'   conditions = c('< 2', '< 16'), 
#'   variable = list(c('sd_mpg'), c('avg_mpg')))  
#'   

table_id_inject <- function(x, id, conditions, variable = NULL) {
  
  if(is.null(variable)) {
    paste_cond <- lapply(seq_along(conditions), function(xx) 
      paste0('x ', conditions[xx]))
    locations <- lapply(seq_along(id), function(xx) 
      ifelse(eval(parse(text = paste_cond[[xx]])), TRUE, FALSE))
    
    for(xx in seq_along(locations)) {
      x[locations[[xx]] == TRUE] <- paste(x[locations[[xx]] == TRUE], id[xx])
    }
  } else {
    paste_cond <- lapply(seq_along(conditions), function(xx) 
      lapply(seq_along(variable[[xx]]), function(ii) 
        paste0("x['", variable[[xx]][ii], "']", conditions[xx])
      )
    )
    locations <- lapply(seq_along(id), function(xx) 
      lapply(seq_along(variable[[xx]]), function(ii)
        ifelse(eval(parse(text = paste_cond[[xx]][[ii]])), TRUE, FALSE)
      )
    )
    
    for(xx in seq_along(locations)) {
      for(ii in seq_along(locations[[xx]])) {
        x[locations[[xx]][[ii]] == TRUE, variable[[xx]][[ii]]] <- 
          paste(x[locations[[xx]][[ii]] == TRUE, variable[[xx]][[ii]]], id[xx])
      }
    }
  }
  
  return(x)
}
