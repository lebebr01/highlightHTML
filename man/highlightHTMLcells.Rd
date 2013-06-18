\name{highlightHTMLcells}
\alias{highlightHTMLcells}
\title{Highlights HTML table cells}
\usage{
  highlightHTMLcells(input, output, updateCSS = TRUE, tags)
}
\arguments{
  \item{input}{File name of HTML file to highlight the
  cells of the table}

  \item{output}{Output file name of highlighted HTML file}

  \item{updateCSS}{TRUE/FALSE variable indicating whether
  the CSS should be updated.}

  \item{tags}{character vector with CSS tags to be added}
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
tags <- c("#bgred {background-color: #FF0000;}", "#bgblue {background-color: #0000FF;}")
highlightHTMLcells(input = "bgtable.html", output = "bgtable2.html", updateCSS = TRUE, tags = tags)
# Change background color and text color
tags <- c("#bgred {background-color: #FF0000; color: white;}", "#bgblue {background-color: #0000FF; color: white;}")
highlightHTMLcells(input = "bgtable.html", output = "bgtable2.html", updateCSS = TRUE, tags = tags)
}

