

library(shiny)

shinyUI(fluidPage(
  titlePanel("Vizualize Temp vs. Time"),

  sidebarLayout(
    sidebarPanel(h3("Slope"), 
    textOutput("SlopeOut"),
    h3("Intercept"), 
    textOutput("int")
    ), 

 
    mainPanel(
      plotOutput("distPlot", brush = brushOpts(id = "plotz"
      ))
  )
  )
))
