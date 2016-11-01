highlight_html_cells <- function(x, output, tags, update_css = TRUE, 
                                 browse = TRUE, print = FALSE) {
  
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


highlight_html_text <- function(x, output, tags, update_css = TRUE, 
                                browse = TRUE, print = FALSE){
  
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

