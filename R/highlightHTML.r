#' Highlights HTML table cells
#' 
#' Inputs an HTML file and outputs a new HTML file that adds css to highlight background of table cells.
#' 
#' A function that allows the alteration of cells in an HTML table using CSS.  This may be helpful
#' coming from a markdown or R markdown file to highlight certain cells based on a specific criteria,
#' such as values greater than 85 should be highlighted as blue or text color changed to green.
#' 
#' @param input File name of HTML file to highlight the cells of the table
#' @param output Output file name of highlighted HTML file
#' @param customStylesheet TRUE/FALSE variable indicating whether a custom stylesheet was used
#' @param updateCSS TRUE/FALSE variable indicating whether the CSS should be updated.
#' @parm tags character vector with CSS tags to be added
#' @export 
highlightHTMLcells <- function(input, output, customStylesheet = TRUE, updateCSS = FALSE, tags) {
  ## read in html file
  tmp <- readLines(input)
  
  if(customStylesheet == TRUE){  # remove this in the future as the function will inject custom css
    locations <- grep("(#bgred)", tmp)[-1]  ## remove the first one if using custom css as it is in the css file
  } else {
    locations <- grep("(#bgred)", temp)
  }

  tmp[locations] <- gsub("<td>", '<td id="bgred">', tmp[locations], fixed = TRUE)
  tmp[locations] <- gsub("(#bgred)", "", tmp[locations], fixed = TRUE)
  
  if(is.null(output) == TRUE){
    output <- input
  }
  
  write(tmp, file = output)
}
