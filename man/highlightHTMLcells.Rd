\name{highlightHTMLcells}
\alias{highlightHTMLcells}
\title{Highlights HTML table cells}
\usage{
  highlightHTMLcells(input, output, updateCSS = TRUE, tags,
    browse = TRUE)
}
\arguments{
  \item{input}{File name of HTML file to highlight the
  cells of the table}

  \item{output}{Output file name of highlighted HTML file}

  \item{updateCSS}{TRUE/FALSE variable indicating whether
  the CSS should be updated.}

  \item{tags}{character vector with CSS tags to be added}

  \item{browse}{logical, If TRUE (default) output file
  opens in default browser, if FALSE, file is written, but
  not opened in browser.}
}
\description{
  Inputs an HTML file and outputs a new HTML file that adds
  css to highlight background of table cells.
}
\details{
  A function that allows the alteration of cells in an HTML
  table using CSS.  This may be helpful coming from a
  markdown or R markdown file to highlight certain cells
  based on a specific criteria, such as values greater than
  85 should be highlighted as blue or text color changed to
  green.
}
\examples{
# Example of simple test table
# Change background color of table cells
require(highlightHTML)

# Setting path for example html files
# To see path where these are saved, type file1 or file2 in the
# r console.
file <- system.file('examples', package = 'highlightHTML')
file1 <- paste(file, "bgtable.html", sep = "/")
file2 <- paste(file, "bgtable2.html", sep = "/")

# Creating CSS tags to inject into HTML document
tags <- c("#bgred {background-color: #FF0000;}",
  "#bgblue {background-color: #0000FF;}")

# Command to post-process HTML file
highlightHTMLcells(input = file1, output = file2, updateCSS = TRUE,
  tags = tags)

# Change background color and text color with CSS
tags <- c("#bgred {background-color: #FF0000; color: white;}",
  "#bgblue {background-color: #0000FF; color: white;}")

# Post-process HTML file
highlightHTMLcells(input = file1, output = file2, updateCSS = TRUE,
  tags = tags)

# By default the new file is opened in your default browser, herer set to FALSE
highlightHTMLcells(input = file1, output = file2, updateCSS = TRUE,
  tags = tags, browse=FALSE)
}

