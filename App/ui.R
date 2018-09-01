#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Destribution of highway miles per gallon"),
  
  sidebarLayout(
    sidebarPanel(
        # Sidebar with a select input for the number of cylinders
        selectInput("factor",
                   label="Choose the number of cylinders",
                   choices=list(4,5,6,8),
                   selected=4),
       
       # Sidebar with a slider input for number of bins
       sliderInput("bins",
                   "Number of bins:",
                   min = 1,
                   max = 10,
                   value = 5),
       
       # Sidebar with a checkbox input for labels
       checkboxInput("show_xlab","Show/Hide X Axis Label", value=TRUE),
       checkboxInput("show_ylab","Show/Hide Y Axis Label", value=TRUE),
       checkboxInput("show_title","Show/Hide Title")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       h3("Results of highway MPG of different cylinders"),
       h4("The number of cylinders you entered"),
       verbatimTextOutput("inputValue"),
       h4("The average MPG of"),
       verbatimTextOutput("average_MPG"),
       plotOutput("distPlot")
    )
  )
))
