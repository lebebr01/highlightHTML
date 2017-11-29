update_css <- function(html_file, tags) {
  
  location_css <- max(grep("</style>", html_file, ignore.case = TRUE))
  
  # # split file
  html_preamble <- html_file[1:(location_css - 1)]
  html_main <- html_file[location_css:length(html_file)]
  
  ## adding custom CSS
  updated_html <- c(html_preamble, tags, html_main)
  updated_html
}
