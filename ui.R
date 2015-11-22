library(shiny)

shinyUI(fluidPage(
  titlePanel("WeatherMe App: Bright Sunshine Predictions"),
  
  sidebarPanel(
    numericInput('max_temp', 'Input max temperature in celsius', 33, min = 28, max = 40),
    numericInput('min_temp', 'Input min temperature in celsius', 25,  min = 20, max = 28),
    sliderInput('humidity', 'Humidity (%)', min = 0, max = 100, value = 80, step = 0.1),
    submitButton('Submit')
  ),

  
  mainPanel(
    h4('Given your input basic weather indicators:'), 
    p('Max Temperature'), verbatimTextOutput("max_temp"), 
    p('Min Temperature'), verbatimTextOutput("min_temp"),
    p('Humidity'), verbatimTextOutput("humidity"),
    
    h3 ('Predicted hours of bright sunshine today'),
    strong(verbatimTextOutput("sunshine"))
  )
  
  
))