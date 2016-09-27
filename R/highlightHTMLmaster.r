#' Master highlight HTML function
#' 
#' This function inputs and exports an HTML file.  The HTML file is then processed
#' to search for tags that inject CSS automatically into the HTML file.
#' 
#' A function that allows the alteration of HTML using CSS.  This may be helpful
#' coming from a markdown or R markdown file to alter aspects of the page based on 
#' a specific criteria.  This function handles both tables as well as normal text.  
#' The options are only limited based on your knowledge of CSS.
#' 
#' @param input File name of HTML file to highlight the cells of the table
#' @param output Output file name of highlighted HTML file
#' @param updateCSS TRUE/FALSE variable indicating whether the CSS should be updated.
#' @param tags character vector with CSS tags to be added
#' @param browse logical, If TRUE (default) output file opens in default browser, if FALSE, 
#'    file is written, but not opened in browser. 
#' @param print logical, if TRUE print output to R console, if false (default) output is 
#'    filtered to other methods (see browse or output).
#' 
#' @export
highlightHTML <- function(input, output, updateCSS = TRUE, tags, browse = TRUE, 
                          print = FALSE) {
  
  tmp2 <- readLines(input)
  
  tmp2 <- highlightHTMLcells(input = tmp2, output = output, updateCSS = FALSE, 
                       tags, browse = FALSE, print = TRUE)
  highlightHTMLtext(input = tmp2, output, updateCSS, tags, browse, print)
  
  
}
  