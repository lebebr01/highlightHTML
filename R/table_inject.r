#' Table hash addition
#' 
#' A helper function to include a hashtag id code within an R table.
#' 
#' @param x A table object
#' @param id A vector of css id(s) to include
#' @param conditions A vector of conditions to include id. Must be same length as id
#' @param variable An optional vector of column names to specify search of conditions.
#' @export
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
  lapply(seq_along(locations), function(xx) 
      x2[locations[[xx]] == TRUE] <- paste(x2[locations[[xx]] == TRUE], id[xx])
    )
  
  list(x, x2)
}
