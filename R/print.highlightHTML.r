#' Prints highlightHTML object
#' 
#' Prints highlightHTML object
#' 
#' @param x An object from highlightHTML function.
#' @param ... Additional arguments passed to function.
#' 
print.highlightHTML <- function(x, ...) {
  cat(format(x, ...), sep = "\n")
}
