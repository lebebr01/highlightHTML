# Entering in small test example
tmp <- c("<td> 100 #bgred </td>", "<td> 67 </td>", "<td> 32 #bgblue </td>", "<td> 12 #bgblue </td>", "<td> 55 </td>")
tags <- c("#bgred {background-color: #FF0000;}", "#bgblue {background-color: #0000FF;}")

# Extracting CSS id values
CSSid <- gsub("\\{.+", "", tags)
CSSid <- gsub("^\\s+|\\s+$", "", CSSid)

# Pasting CSS id values into HTML <td> tag - the for loop below does not include the CSSid part
ids <- vector(mode = "character", length = length(CSSid))
for(t in 1:length(CSSid)){
  ids[t] <- paste("<td id=\'", CSSid[t], "\'>", sep = "")
}


#locations <- grep("#", tmp)

for(p in 1:length(CSSid)){
  locations <- grep(CSSid[p], tmp) # identifies location to place CSS id tag
  
  tmp[locations] <- gsub("<td>", ids[p], tmp[locations]) # replaces the HTML tag with CSS id included
}

#tmp[locations] <- gsub(CSSid[p], "", tmp[locations], fixed = TRUE)

ids   # printing what the replacement should have been
tmp   # Notice the blank part between the the single quotes, any idea why this didn't paste?

# --------------------------------
# This does work however

# Entering in small test example
tmp <- c("<td> 100 #bgred </td>", "<td> 67 </td>", "<td> 32 #bgblue </td>", "<td> 12 #bgblue </td>", "<td> 55 </td>")
tags <- c("#bgred {background-color: #FF0000;}", "#bgblue {background-color: #0000FF;}")

CSSid <- gsub("\\{.+", "", tags)
CSSid <- gsub("^\\s+|\\s+$", "", CSSid)
CSSid2 <- paste(" ", CSSid, sep = "")

ids <- paste('<td id=', CSSid, '>', sep = "")

for(i in 1:length(CSSid)){
  locations <- grep(CSSid[i], tmp)  # finds locations to add id values
  tmp[locations] <- gsub("<td>", ids[i], tmp[locations])  # adds the id values
  tmp[locations] <- gsub(CSSid2[i], "", tmp[locations], fixed = TRUE)
}

ids 
tmp