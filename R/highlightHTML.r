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
#' @param browse logical, If TRUE (default) output file opens in default browser, if FALSE, 
#'    file is written, but not opened in browser. 
#' @examples
#' # Example of simple test table
#' # Change background color of table cells
#' require(highlightHTML)
#' 
#' # Setting path for example html files 
#' # To see path where these are saved, type file1 or file2 in the 
#' # r console.
#' file <- system.file('examples', package = 'highlightHTML')
#' file1 <- paste(file, "bgtable.html", sep = "/")
#' 
#' # Creating CSS tags to inject into HTML document
#' tags <- c("#bgred {background-color: #FF0000;}", 
#'   "#bgblue {background-color: #0000FF;}")
#'   
#' # Command to post-process HTML file - Writes to temporary file
#' highlightHTMLcells(input = file1, output = tempfile(fileext = ".html"), updateCSS = TRUE, 
#'   tags = tags, browse = FALSE)
#'   
#' # Change background color and text color with CSS
#' tags <- c("#bgred {background-color: #FF0000; color: white;}", 
#'   "#bgblue {background-color: #0000FF; color: white;}")
#'   
#' # Post-process HTML file
#' highlightHTMLcells(input = file1, output = NULL, updateCSS = TRUE, 
#'   tags = tags, browse = TRUE)
#' 
#' # By default the new file is opened in your default browser, here set to FALSE
#' highlightHTMLcells(input = file1, output = tempfile(fileext = ".html"), updateCSS = TRUE,
#'   tags = tags, browse=FALSE)
#' @export 
highlightHTMLcells <- function(input, output, updateCSS = TRUE, tags, browse=TRUE) {
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

  if(browse)
    browseURL(output)
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

