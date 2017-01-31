## ----function, eval=FALSE------------------------------------------------
#  library(highlightHTML)
#  file <- system.file('examples', 'bgtable.html',
#                      package = 'highlightHTML')
#  tags <- c("#bgred {background-color: #FF0000;}",
#    "#bgblue {background-color: #0000FF;}")
#  highlight_html(input = file,
#                 output = tempfile(fileext = ".html"),
#                 tags = tags,
#                 update_css = TRUE,
#                 browse = TRUE,
#                 print = FALSE)

## ----text, eval = FALSE--------------------------------------------------
#  file <- system.file('examples', 'bgtext.html', package = 'highlightHTML')
#  
#  # Change background color and text color with CSS
#  tags <- c("#bgblack {background-color: black; color: white;}",
#    "#bgblue {background-color: #0000FF; color: white;}",
#    "#colgreen {color: green;}")
#  
#  # Post-process HTML file
#  highlight_html(input = file, output = tempfile(fileext = ".html"),
#                 tags = tags, update_css = TRUE, browse = TRUE)

