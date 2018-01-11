#' Table hash addition for markup
#' 
#' A helper function to include a hashtag id code within a summary table. The summary table 
#' most commonly will take the form of a data frame object. For example,
#' a descriptive summary table coming from the \code{summarise} function from  
#' the dplyr package. Can also specify a count table using the \code{table} function.
#' 
#' The \code{conditions} argument takes the following operators for numeric variables: 
#' \code{>}, \code{>=}, \code{<}, \code{<=}, \code{==}. For character variables, 
#' only \code{==} can be used to specify the text string to match on. Care needs to be 
#' made to wrap ensure the text string is wrapped in quotations. See the examples 
#' for more details on this.
#' 
#' This function can also be part of a chain using the \code{\%>\%} operator from magrittr. 
#' See the examples for more details.
#'  
#' 
#' @param table A summary table object, most commonly will be a data.frame, but can also
#'   be a count table using the \code{table} function.
#' @param id A vector of css id(s) to include
#' @param conditions A character vector of conditions to include id. Must be same length as id. See 
#'   details and examples for more information on how to specify the conditions.
#' @param variable An optional list of column names to specify search of conditions. More
#'      than one variable can be specified in each element of the list. The list must be the 
#'      same length as the conditions or id arguments.
#' @param num_digits A numeric value to specify the number of decimal values to 
#'   include in the final output.
#' @export
#' 
#' @examples 
#' library(dplyr)
#' library(highlightHTML)
#'
#' mtcars %>% 
#'   group_by(cyl) %>% 
#'   summarise(avg_mpg = mean(mpg), sd_mpg = sd(mpg)) %>%
#'   data.frame() %>% 
#'   table_id_inject(id = c('#bgred', '#bgblue', '#bggreen'), 
#'      conditions = c('< 2', '> 16', '== 15.1'))
#'   
#' 
#' mtcars %>% 
#'   group_by(cyl) %>% 
#'   summarise(avg_mpg = mean(mpg), sd_mpg = sd(mpg)) %>%
#'   data.frame() %>%
#'   table_id_inject(id = c('#bgred', '#bgblue'),
#'      conditions = c('<= 2', '< 16'), 
#'      variable = list(c('sd_mpg'), c('avg_mpg')))  
#'   
#' # text example
#' storms %>%
#'   group_by(status) %>%
#'   summarise(avg_wind = mean(wind)) %>%
#'   data.frame() %>%
#'   table_id_inject(id = c('#bgred'),
#'      conditions = c('== "tropical depression"'))
#'      
#'      
#' # Table object
#' table(mtcars$cyl, mtcars$disp) %>%
#'   table_id_inject(id = c('#bgred'), 
#'                 conditions = c('>= 3'))
#'   

table_id_inject <- function(table, id, conditions, variable = NULL, num_digits = NULL) {
  
  if(length(id) != length(conditions)) {
    stop("The arguments id and conditions must be the same length")
  }
  
  if(!is.null(variable)) {
    if(length(id) != length(variable)) {
      stop("The arguments id and variable must be the same length")
    }
  }
  
  if(!is.null(num_digits)) {
    numeric_columns <- unlist(lapply(table, is.numeric))
    table[numeric_columns] <- round(table[numeric_columns], num_digits)
  }
  
  if(is.null(variable)) {
    paste_cond <- lapply(seq_along(conditions), function(xx) 
      paste0('table ', conditions[xx]))
    locations <- lapply(seq_along(id), function(xx) 
      ifelse(eval(parse(text = paste_cond[[xx]])), TRUE, FALSE))
    
    for(xx in seq_along(locations)) {
      table[locations[[xx]] == TRUE] <- paste(table[locations[[xx]] == TRUE], id[xx])
    }
  } else {
    paste_cond <- lapply(seq_along(conditions), function(xx) 
      lapply(seq_along(variable[[xx]]), function(ii) 
        paste0("table['", variable[[xx]][ii], "']", conditions[xx])
      )
    )
    locations <- lapply(seq_along(id), function(xx) 
      lapply(seq_along(variable[[xx]]), function(ii)
        ifelse(eval(parse(text = paste_cond[[xx]][[ii]])), TRUE, FALSE)
      )
    )
    
    for(xx in seq_along(locations)) {
      for(ii in seq_along(locations[[xx]])) {
        if(any(grepl("#", table[locations[[xx]][[ii]] == TRUE, 
                            variable[[xx]][[ii]]]))) {
          table[locations[[xx]][[ii]] == TRUE, variable[[xx]][[ii]]] <-
            gsub("\\s+#.+", "", unlist(table[locations[[xx]][[ii]] == TRUE, 
                                variable[[xx]][[ii]]]))
        }
        table[locations[[xx]][[ii]] == TRUE, variable[[xx]][[ii]]] <- 
          paste(unlist(table[locations[[xx]][[ii]] == TRUE, variable[[xx]][[ii]]]), 
                       id[xx])
      }
    }
  }
  
  return(table)
}
