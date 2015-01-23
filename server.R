# server.R

#read data
data <- read.csv("data/ChickWeight.csv")  

source("helpers.R")

shinyServer(
  function(input, output) {
    
    #determine selected diet
    diet <- reactive (switch(input$var, 
                   "Diet 1" = 1,
                   "Diet 2" = 2,
                   "Diet 3" = 3,
                   "Diet 4" = 4))
    
    #compute projected weight
    projectedWeight <- reactive (
      {
      model <-  getDietModel(ChickData = data, dietchoice = diet())
      startWeight = input$birthWeight  
      growthRatePerDay = model$coef[2]  # slope of regression model
      time = input$day
      if (startWeight <= 0)
        return (0)                      # no growth if initial weight is 0
      else ({ 
        projectedWeight = startWeight + growthRatePerDay * time
        return (round(projectedWeight, digit=1))
        })
       }
      
      )
    
    # plot sample regression model - based on ChickWeight dataset
    output$modelPlot <- renderPlot({
      input$getProjectedWeight         
      isolate (plotDietModel(ChickData = data, dietchoice = diet(), x=input$day, y=projectedWeight()))
    })
    
   
    #compute projected weight, for given age
    
    output$projectedWeightText <- renderText({   
      input$getProjectedWeight
      isolate({ 
        
          projectedWeight()
        })
      
    })
   
    #display projected weight 
    output$projectionHeaderText <- renderText({
      input$getProjectedWeight
      
      isolate(paste("The projected weight of the chicken on ", input$var, "after" , input$day, "days is :"))
    }) 
   
    
    
    
    
  }
)
