library(shiny)

shinyUI(pageWithSidebar(
  
  # title
  headerPanel("RGB to Hexidecimal Color Codes"),
  
  # Inputs of RGB colors
  sidebarPanel(
    numericInput("red", "Red", 255),
    numericInput("green", "Green", 0),
    numericInput("blue", "Blue", 0),
    
    submitButton("Update Color")
    ),
  
  # Showing resulting Hexidecimal Color code and plot of color
  mainPanel(
    h4("Hexidecimal Code"),
    verbatimTextOutput("hex"),
    
    h4("Example of Color:"),
    plotOutput(outputId = "color_plot")
    )
  
  ))