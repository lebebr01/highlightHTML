library(shiny)
library(ggplot2)
library(highlightHTML)

shinyServer(function(input, output) {
  
  # compile red, green, and blue inputs into a vector
  dataInput <- reactive({
    c(input$red, input$green, input$blue) 
  })
  datasetP <- data.frame(x = c(0), y = c(0))
  
  output$hex <- renderPrint({
    rgbCode <- dataInput()
    hex <- rgb2hex(rgbcode = list(rgbCode))
    hex2 <- paste("#", hex$HexCodes, sep = "")
    print(hex2)
  })
  
  output$color_plot <- renderPlot({
    rgbCode <- dataInput()
    hex <- rgb2hex(rgbcode = list(rgbCode))
    hex2 <- paste("#", hex$HexCodes, sep = "")
    p <- ggplot(datasetP, aes(x = x, y = y)) + 
      geom_point(color = hex2, size = 1000) + theme_bw() +
      theme(line = element_blank(), text = element_blank(),
            rect = element_blank())
    print(p)
  })
  
})
