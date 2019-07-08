# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required for barplot output
shinyServer(function(input, output) {
  
  #Text output
  output$text_calc <- renderText({
    P <- input$P
    r <- input$r
    t <- input$t
    
    if(input$n=="yearly"){
      n <- 1
    } else if(input$n=="semi-annually"){
      n <- 2
    } else if(input$n=="quarterly"){
      n <- 4
    } else if(input$n=="monthly"){
      n <- 12
    }
    
    paste("The result is $", round(P * ((1 + (r/n))^(n/t)),2),".")
  })
  
  #Graph output
  output$barplot <- renderPlot({ 
    
    P <- input$P
    r <- input$r
    t <- input$t
    
    if(input$n=="yearly"){
      n <- 1
    } else if(input$n=="semi-annually"){
      n <- 2
    } else if(input$n=="quarterly"){
      n <- 4
    } else if(input$n=="monthly"){
      n <- 12
    }
    
    A    <- P * ((1 + (r/n))^(n/t))  #calculate final amount (A)
    
    df <- data.frame("ID"=c("Beginning","Final"),
                     "amount"=c(P,A))
    
    ggplot(data=df, aes(x=ID, y=amount )) +
      geom_bar(stat="identity", fill="steelblue") +
      geom_text(aes(label=paste("$",round(amount,2))), vjust=1.6, color="white", size=3.5) +
      theme_minimal() + xlab("") + ylab("Amount") + ggtitle("Results")
  })
  
})
