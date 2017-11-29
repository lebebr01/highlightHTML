context('test tag insertion')

test_that('correct print structure', {
  file <- system.file('examples', 'bgtext.html', package = 'highlightHTML')
  
  # Change background color and text color with CSS
  tags <- c("#bgblack {background-color: black; color: white;}", 
            "#bgblue {background-color: #0000FF; color: white;}",
            "#colgreen {color: green;}")
  
  # Post-process HTML file
  text_output <- highlight_html(input = file, output = tempfile(fileext = ".html"), 
                 tags = tags, browse = FALSE, print = TRUE, render = FALSE)
  
  expect_true(any(grepl("#bgblack", text_output)))
  expect_true(any(grepl("#bgblue", text_output)))
  expect_true(any(grepl("#colgreen", text_output)))
  
  expect_true(any(grepl("id='bgblack'", text_output)))
  expect_true(any(grepl("id='bgblue'", text_output)))
  expect_true(any(grepl("id='colgreen'", text_output)))
})
