#' Highlights HTML table cells
#' 
#' Inputs an HTML file and outputs a new HTML file that adds css to highlight background of table cells.
#' 
#' A function that allows the alteration of cells in an HTML table using CSS.  This may be helpful
#' coming from a markdown or R markdown file to highlight certain cells based on a specific criteria,
#' such as values greater than 85 should be highlighted as blue or text color changed to green.
#' 
#' @param x File name of HTML file to highlight the cells of the table
#' @param output Output file name of highlighted HTML file
#' @param update_css TRUE/FALSE variable indicating whether the CSS should be updated.
#' @param tags character vector with CSS tags to be added
#' @param browse logical, If TRUE (default) output file opens in default browser, if FALSE, 
#'    file is written, but not opened in browser. 
#' @param print locical, if TRUE print output to R console, if false (default) output is 
#'    filtered to other methods (see browse or output).
#' @importFrom utils browseURL
#' @export 
highlight_html_cells <- function(x, output, update_css = TRUE, tags, browse = TRUE, 
                               print = FALSE) {
  
  CSSid <- gsub("\\{.+", "", tags)
  CSSid <- gsub("^[\\s+]|\\s+$", "", CSSid)
  CSSidPaste <- gsub("#", "", CSSid)
  CSSid2 <- paste(" ", CSSid, sep = "")
  
  ids <- paste("<td id='", CSSidPaste, "'", sep = "")
  
  for(i in 1:length(CSSid)){
    locations <- grep(CSSid[i], x)  # finds locations to add id values
    x[locations] <- gsub("<td", ids[i], x[locations])  # adds the id values
    x[locations] <- gsub(CSSid2[i], "", x[locations], fixed = TRUE)
  }
  
  if(update_css){
    x <- update_css(x, tags)
  }
  
  if(print) {
    x
  } else {
    write(x, file = output)
    if(browse) {
      browseURL(output)
    } 
  }   
}


#' Highlights HTML text
#' 
#' Inputs a HTML file and outputs the same HTML file, but now with injected CSS to 
#' change the appearance of text.
#' 
#' A function that allows the alteration of text in a HTML file using CSS. This can be most helpful
#' when converting a markdown file to a HTML file to display as a webpage.  The function 
#' will post process the HTML file to add additional formatting without editing the raw HTML file.
#' 
#' @param x File name of HTML file to highlight the cells of the table
#' @param output Output file name of highlighted HTML file
#' @param update_css TRUE/FALSE variable indicating whether the CSS should be updated.
#' @param tags character vector with CSS tags to be added
#' @param browse logical, If TRUE (default) output file opens in default browser, if FALSE, 
#'    file is written, but not opened in browser. 
#' @param print locical, if TRUE print output to R console, if false (default) output is 
#'    filtered to other methods (see browse or output).
#' @importFrom utils browseURL
#' @export 
highlight_html_text <- function(x, output, update_css = TRUE, tags, browse = TRUE, 
                              print = FALSE){
  
  CSSid <- gsub("\\{.+", "", tags)
  CSSid <- gsub("^[\\s+]|\\s+$", "", CSSid)
  CSSidPaste <- gsub("#", "", CSSid)
  CSSid2 <- paste(" ", CSSid, sep = "")
  
  ids <- paste("<span id='", CSSidPaste, "'>", sep = "")
  
  for(i in 1:length(CSSid)){
    locations <- grep(CSSid[i], x)  # finds locations to add id values
    x[locations] <- gsub(paste("\\{", CSSid[i], sep = ''), ids[i], x[locations])  # adds the id values
    x[locations] <- gsub("\\}", "</span>", x[locations])
  }
  
  if(update_css){
    x <- update_css(x, tags)
  }
  
  if(print) {
    x
  } else {
    write(x, file = output)
    if(browse) {
      browseURL(output)
    } 
  }  
}


#' Update external CSS file
#' 
#' @param x Name of the R object after readLines
#' @param tags Character vector of tags to add to CSS
#' @export
update_css <- function(x, tags) {
  
  location <- max(grep("</style>", x, ignore.case = TRUE))
  
  # # split file
  tmpA <- x[1:(location - 1)]
  tmpB <- x[location:length(x)]
  
  ## adding custom CSS
  tmp <- c(tmpA, tags, tmpB)
  tmp
}

