#' Prints highlightHTML object
#' 
#' Prints highlightHTML object
#' 
#' @param x The highlightHTML object
#' @method print highlightHTML
#' @export print highlightHTML
print.highlightHTML <- function(x, ...) {
  cat(paste(x, collapse = "\n"), "\n")
}
