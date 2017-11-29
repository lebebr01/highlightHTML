highlight_html_cells <- function(input, output, tags, update_css = TRUE, 
                                 browse = TRUE, print = FALSE) {
  
  CSSid <- gsub("\\{.+", "", tags)
  CSSid <- gsub("^[\\s+]|\\s+$", "", CSSid)
  CSSidPaste <- gsub("#", "", CSSid)
  CSSid2 <- paste(" ", CSSid, sep = "")
  
  ids <- paste("<td id='", CSSidPaste, "'", sep = "")
  
  for(i in seq_along(CSSid)){
    locations <- grep(CSSid[i], input)  # finds locations to add id values
    input[locations] <- gsub("<td", ids[i], input[locations])  # adds the id values
    input[locations] <- gsub(CSSid2[i], "", input[locations], fixed = TRUE)
  }
  
  if(update_css){
    input <- update_css(input, tags)
  }
  
  if(print) {
    input
  } else {
    write(input, file = output)
    if(browse) {
      browseURL(output)
    } 
  }   
}

#' @importFrom utils browseURL
highlight_html_text <- function(input, output, tags, update_css = TRUE, 
                                browse = TRUE, print = FALSE){
  
  CSSid <- gsub("\\{.+", "", tags)
  CSSid <- gsub("^[\\s+]|\\s+$", "", CSSid)
  CSSidPaste <- gsub("#", "", CSSid)
  CSSid2 <- paste(" ", CSSid, sep = "")
  
  ids <- paste("<span id='", CSSidPaste, "'>", sep = "")
  
  for(i in seq_along(CSSid)){
    locations <- grep(CSSid[i], input)  # finds locations to add id values
    input[locations] <- gsub(paste("\\{", CSSid[i], sep = ''), ids[i], input[locations])  # adds the id values
    input[locations] <- gsub("\\}", "</span>", input[locations])
  }
  
  if(update_css){
    input <- update_css(input, tags)
  }
  
  if(print) {
    input
  } else {
    write(input, file = output)
    if(browse) {
      browseURL(output)
    } 
  }  
}

