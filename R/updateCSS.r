#' Update external CSS file
#' 
#' @param input Name of the R object after readLines
#' @param tags Character vector of tags to add to CSS
updateCSS <- function(input, tags) {
  
  location <- grep("</style>", tmp)
  
  ## split file
  tmpA <- input[1:(location-1)]
  tmpB <- input[location:length(input)]
  
  ## adding custom CSS
  tmp <- c(tmpA, tags, tmpB)
  tmp
}