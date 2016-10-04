context('test structure')

test_that('correct print structure', {
  file <- system.file('examples', 'bgtext.html', package = 'highlightHTML')
  
  # Change background color and text color with CSS
  tags <- c("#bgblack {background-color: black; color: white;}", 
            "#bgblue {background-color: #0000FF; color: white;}",
            "#colgreen {color: green;}")
  
  # Post-process HTML file
  tmp <- highlight_html(input = file, output = tempfile(fileext = ".html"), update_css = TRUE, 
                 tags = tags, browse = FALSE, print = TRUE)
  expect_true(is.character(tmp))
})
