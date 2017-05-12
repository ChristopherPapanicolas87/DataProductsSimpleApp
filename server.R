


library(shiny)

shinyServer(function(input, output) {
  model <- reactive({
    beav<- brushedPoints(beaver1, input$plotz, xvar = "time", yvar = "temp")
    if(nrow(beav) <2) {return(NULL)
      }
    lm(temp ~ time, data = beav)
    })

  output$SlopeOut <- renderText({
    if(is.null(model())){"NA"} else { 
    model()[[1]][2]
    }
})
  output$int <- renderText({
    if(is.null(model())){"NA"} else {
    model()[[1]][1]
      }
    })
output$distPlot <- renderPlot({
  plot(beaver1$time, beaver1$temp, xlab ="time", ylab= "Temp", main ="Beaver Dynamics", 
cex = 1.5, pch=16, bty = "n")

if(!is.null(model())) 
{abline(model(), col="red", lwd = 2)
 
   }

})


})



