# highlightHTML

The aim of the `highlightHTML` package is to make it easy for users to customize HTML tables by using a single function that adds an `id` selector to the table cell tag.  The ability to customize the HTML table is limited the functionality of CSS and the user knowledge of CSS.   This package was motivated by latest push of using markdown documents which allow the user to focus on content instead of using something like LaTeX where choices between fonts and styling may take a larger role.  This package is motivated by that in that it allows a seemless way to interact with an HTML file to add table decoration.

## Usage
Installing the package:

```r
library(devtools)
install_github(repo = "highlightHTML", username = "lebebr01")
```


This package post processes the html file produced from a markdown document.  Suppose you have a table like the following:

Color Name | Number
----------- | ------------
Blue | 5
Green | 35
Orange | 100
Red | 200

To use this package there are two steps, first indicate which cells you would like to change the appearance using CSS (i.e. background color, text color, etc.) by including the name of the id value to pass that cell or cells.  Using the above table example suppose we want to change the number column to blue and red for numbers less than 10 and greater than 150 respectively:

Color Name | Number
----------- | ------------
Blue | 5 #bgblue
Green | 35
Orange | 100
Red | 200 #bgred

The addition of the *#bgblue* and *#bgred* indicates which cells will be changed.  After turning the markdown document into an html file, this package can now be used to post-process the html file.  The post-processing will add an id value for each cell with the *#bgblue* or *#bgred* and remove those from the table.  This will look something like:


```r
library(hightlightHTML)
highlightHTMLcells(input = "path/to/file", output = "path/to/saved/file", updateCSS = TRUE, 
    tags = c("Vector of CSS code here"))
```


This function should read in the html file to process.  Then it processes the file add the id tags to the specific cells identified.  Lastly if **updateCSS = TRUE**, then the tags will be added to the CSS of the document, otherwise if **FALSE** that will need to be added manually to the html file.  The file is then save to the output location, if no output location is given, the input file will be overwritten.
