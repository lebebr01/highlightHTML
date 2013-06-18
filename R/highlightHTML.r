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
#' @parm tags character vector with CSS tags to be added
#' @importFrom stringr str_replace_all
#' @examples
#' tmp <- c("<td> 100 #bgred </td>", "<td> 67 </td>", "<td> 32 #bgblue </td>", "<td> 12 #bgblue </td>", "<td> 55 </td>")
#' tags <- c("#bgred {background-color: #FF0000;}", "#bgblue {background-color: #0000FF;}")
#' @export 
highlightHTMLcells <- function(input, output, updateCSS = TRUE, tags) {
  ## read in html file
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
