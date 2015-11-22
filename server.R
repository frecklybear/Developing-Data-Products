library(shiny)
library(caret)

# setwd('~/Documents/datasciencecourse/Shiny/Developing-Data-Products')
rawData <- read.table("weather.csv", header = TRUE, sep =",", stringsAsFactors = FALSE)

# simple prediction model for hours of bright sunshine
modFit <- train(sunshine_hours ~ max_temp + min_temp + humidity, method="glm", data= rawData)

shinyServer(
  
  function(input, output) {
    output$max_temp <- renderPrint({input$max_temp})
    output$min_temp <- renderPrint({input$min_temp})
    output$humidity <- renderPrint({input$humidity})
    
    output$sunshine <- renderPrint ({
      max_temp = input$max_temp
      min_temp = input$min_temp
      humidity = input$humidity
      predict(modFit, data.frame(max_temp, min_temp, humidity))
    })
    
  }
)

