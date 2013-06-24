#' Run shiny app
#' 
#' Function that automatically opens shiny app to convert rgb codes to hexidecimal codes
#' 
#' @param ... Other arguments to pass, currently does nothing.
#' @export 
shinyRGB2hex <- function(...) {
  shiny::runApp(system.file('shiny', package = 'highlightHTML'))
}
