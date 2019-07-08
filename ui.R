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
  
  titlePanel("Compound Interest with Shiny"),
  
  sidebarPanel(numericInput("P", "Principal Amount ($):", 10000 ,min = 0),
               numericInput("r", "Interest rate (0-1):", 0.34, min = 0, max = 1),
               numericInput("t", "Time (years):", 1, min = 0.000001),
               selectInput('n', 'How often interest is compounded',
                           c("yearly","semi-annually","quarterly","monthly"))),
  
  mainPanel(
    textOutput("text_calc"),
    plotOutput("barplot")
  )
))
