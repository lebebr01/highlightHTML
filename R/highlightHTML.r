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
#' @param updateCSS TRUE/FALSE variable indicating whether the CSS should be updated.
#' @param tags character vector with CSS tags to be added
#' @examples
#' # Example of simple test table
#' # Change background color of table cells
#' require(highlightHTML)
#' tags <- c("#bgred {background-color: #FF0000;}", "#bgblue {background-color: #0000FF;}")
#' highlightHTMLcells(input = "bgtable.html", output = "bgtable2.html", updateCSS = TRUE, tags = tags)
#' # Change background color and text color
#' tags <- c("#bgred {background-color: #FF0000; color: white;}", "#bgblue {background-color: #0000FF; color: white;}")
#' highlightHTMLcells(input = "bgtable.html", output = "bgtable2.html", updateCSS = TRUE, tags = tags)
#' @export 
highlightHTMLcells <- function(input, output, updateCSS = TRUE, tags) {
  tmp <- readLines(input)
  
  CSSid <- gsub("\\{.+", "", tags)
  CSSid <- gsub("^[\\s+]|\\s+$", "", CSSid)
  CSSidPaste <- gsub("#", "", CSSid)
  CSSid2 <- paste(" ", CSSid, sep = "")
  
  ids <- paste("<td id='", CSSidPaste, "'>", sep = "")
  
  for(i in 1:length(CSSid)){
    locations <- grep(CSSid[i], tmp)  # finds locations to add id values
    tmp[locations] <- gsub("<td>", ids[i], tmp[locations])  # adds the id values
    tmp[locations] <- gsub(CSSid2[i], "", tmp[locations], fixed = TRUE)
  }
  
  if(updateCSS == TRUE){
    tmp <- updateCSS(tmp, tags)
  }
  
  if(is.null(output) == TRUE){
    output <- input
  }
  
  write(tmp, file = output)
}


#' Update external CSS file
#' 
#' @param input Name of the R object after readLines
#' @param tags Character vector of tags to add to CSS
updateCSS <- function(input, tags) {
  
  location <- grep("</style>", input)
  
  # # split file
  tmpA <- input[1:(location-1)]
  tmpB <- input[location:length(input)]
  
  ## adding custom CSS
  tmp <- c(tmpA, tags, tmpB)
  tmp
}

