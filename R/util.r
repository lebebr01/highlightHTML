update_css <- function(x, tags) {
  
  location <- max(grep("</style>", x, ignore.case = TRUE))
  
  # # split file
  tmpA <- x[1:(location - 1)]
  tmpB <- x[location:length(x)]
  
  ## adding custom CSS
  tmp <- c(tmpA, tags, tmpB)
  tmp
}
