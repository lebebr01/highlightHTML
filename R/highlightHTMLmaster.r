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
#' @param input File name of HTML file to highlight the cells of the table or text
#' @param output Output file name of highlighted HTML file
#' @param tags character vector with CSS tags to be added
#' @param update_css TRUE/FALSE variable indicating whether the CSS should be updated
#' @param browse logical, If TRUE (default) output file opens in default browser, if FALSE, 
#'    file is written, but not opened in browser. 
#' @param print logical, if TRUE print output to R console, if false (default) output is 
#'    filtered to other methods (see browse or output).
#' @examples
#' \donttest{
#' # Example of simple test table
#' # Change background color of table cells
#' library(highlightHTML)
#' 
#' # Setting path for example html files 
#' # To see path where these are saved, type file or file1 in the 
#' # r console.
#' file <- system.file('examples', 'bgtable.html', package = 'highlightHTML')
#' 
#' # Creating CSS tags to inject into HTML document
#' tags <- c("#bgred {background-color: #FF0000;}", 
#'   "#bgblue {background-color: #0000FF;}")
#'   
#' # Command to post-process HTML file - Writes to temporary file
#' highlight_html(input = file, output = tempfile(fileext = ".html"),  
#'   tags = tags, update_css = TRUE, browse = FALSE)
#'   
#' # Change background color and text color with CSS
#' tags <- c("#bgred {background-color: #FF0000; color: white;}", 
#'   "#bgblue {background-color: #0000FF; color: white;}")
#'   
#' # Post-process HTML file
#' highlight_html(input = file, output = tempfile(fileext = ".html"),  
#'   tags = tags, update_css = TRUE, browse = TRUE, print = FALSE)
#' 
#' # By default the new file is opened in your default browser, here set to FALSE
#' highlight_html(input = file, output = tempfile(fileext = ".html"), 
#'   tags = tags, update_css = TRUE, browse = FALSE, print = FALSE)
#'   
#' # Setting path for example html files 
#' # To see path where these are saved, type file or file1 in the 
#' # r console.
#' file <- system.file('examples', 'bgtext.html', package = 'highlightHTML')
#' 
#' # Change background color and text color with CSS
#' tags <- c("#bgblack {background-color: black; color: white;}", 
#'   "#bgblue {background-color: #0000FF; color: white;}",
#'   "#colgreen {color: green;}")
#'   
#' # Post-process HTML file
#' highlight_html(input = file, output = tempfile(fileext = ".html"), 
#'   tags = tags, update_css = TRUE, browse = TRUE)
#' }
#'   
#' @export
highlight_html <- function(input, output, tags, update_css = TRUE, 
                           browse = TRUE, print = FALSE) {
  
  tmp2 <- readLines(input)
  
  tmp2 <- highlight_html_cells(x = tmp2, output = output, tags,
                               update_css = FALSE, 
                             browse = FALSE, print = TRUE)
  highlight_html_text(x = tmp2, output, tags, update_css, browse, print)
  
}
  