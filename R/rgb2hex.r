#' Convert RGB to hex
#' 
#' Enter a list of RGB color codes, or R colors, and get the appropriate hex color code.
#' 
#' @param rgbcode List of rgb color codes, each list must be a vector of three objects representing
#'   the three components of rgb color code from 0 - 255. This can be a named list where the name
#'   represents the name of the color to be used.
#' @param rcolor An unnamed list of R color names.
#' @examples 
#' rgb2hex(rcolor = list("sienna2", "thistle1"))
#' rgb2hex(rcolor = list("sienna2", "thistle1"), rgbcode = list('orange' = c(238, 74, 24), 
#' 'raw umber' = c(113, 75, 35)))
#' rgb2hex(rgbcode = list('orange' = c(238, 74, 24), 'raw umber' = c(113, 75, 35)))
#' @importFrom grDevices col2rgb 
#' @export 
rgb2hex <- function(rgbcode = NULL, rcolor = NULL) {
  
  if(is.null(rgbcode) && is.null(rcolor)) {
    stop("Must specify at least one RGB Code or an R color name")
  }
  
  if(!is.null(rcolor)){
    if(!is.list(rcolor)) { rcolor <- as.list(rcolor) }
    rgb_codes <- lapply(lapply(rcolor, col2rgb), as.numeric)
  }
  
  if(is.null(rcolor) && !is.null(rgbcode)){ 
    rgb_codes <- rgbcode 
  }
  
  if(is.null(names(rgbcode))) {
    namescol <- paste("Color ", 1:length(rgbcode), sep = "")
  } else {
    namescol <- names(rgbcode)
  }
  
  if(!is.null(rcolor) && !is.null(rgbcode)){
    rgb_codes <- c(rgbcode, rgb_codes)
    namescol <- c(names(rgbcode), rcolor)
  }
  
  if(!is.null(rcolor) && is.null(rgbcode)){
    namescol <- rcolor
  }  
  
  names(rgb_codes) <- namescol

  hex <- sapply(lapply(rgb_codes, sprintf, fmt = "%02X"), paste, collapse = "")
  hexP <- data.frame(HexCodes = hex)
  hexP
}
