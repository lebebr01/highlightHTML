#' Convert RGB to hex
#' 
#' Enter a list of RGB color codes, or R colors, and get the appropriate hex color code.
#' 
#' @param rgbcode List of rgb color codes, each list must be a vector of three objects representing
#'   the three components of rgb color code from 0 - 255.
#' @param rcolor A list of R color names
#' @examples 
#' rgb2hex(rcolor = list("sienna2", "thistle1"))
#' rgb2hex(rcolor = list("sienna2", "thistle1"), rgbcode = list('orange' = c(238, 74, 24), 
#' 'raw umber' = c(113, 75, 35)))
#' rgb2hex(rgbcode = list('orange' = c(238, 74, 24), 'raw umber' = c(113, 75, 35)))
#' @export 
rgb2hex <- function(rgbcode = NULL, rcolor = NULL) {
  
  if(is.null(rcolor) == FALSE){
    if(is.list(rcolor) == FALSE) { rcolor <- as.list(rcolor) }
    tmp <- lapply(lapply(rcolor, col2rgb), as.numeric)
  }
  
  if(is.null(rcolor) == TRUE & is.null(rgbcode) == FALSE){ 
    tmp <- rgbcode 
  }
  
  if(is.null(names(rgbcode)) == TRUE) {
    namescol <- paste("Color ", 1:length(rgbcode), sep = "")
  } else {
    namescol <- names(rgbcode)
  }
  
  if(is.null(rcolor) == FALSE & is.null(rgbcode) == FALSE){
    tmp <- c(rgbcode, tmp)
    namescol <- c(names(rgbcode), rcolor)
  }
  
  if(is.null(rcolor) == FALSE & is.null(rgbcode) == TRUE){
    namescol <- rcolor
  }  
  
  names(tmp) <- namescol

  hex <- sapply(lapply(tmp, sprintf, fmt = "%02X"), paste, collapse = "")
  hexP <- data.frame(HexCodes = hex)
  hexP
}
