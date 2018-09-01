#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
# Define server logic required to draw a histogram and calculate the average value
shinyServer(function(input, output){
  # calculate the average MPG with selected cylinders
  data(mpg)
  cylinders_hwy=reactive({mpg[which(mpg$cyl==input$factor),]$hwy})
  output$inputValue=renderPrint({input$factor})
  output$average_MPG=renderPrint({mean(cylinders_hwy())})
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    bins=seq(min(cylinders_hwy()), max(cylinders_hwy()), length.out=input$bins+1)
    
    # 
    xlab=ifelse(input$show_xlab, "Highway miles per gallon", "")
    ylab=ifelse(input$show_ylab, "Count", "")
    title=ifelse(input$show_title, "Destribution of highway miles per gallon with selected cylinders", "")
    
    # draw the histogram with the specified number of bins
    hist(cylinders_hwy(), breaks = bins, col="green", border="white", xlab=xlab, ylab=ylab, main=title)
    
  })
  
})
