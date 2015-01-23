#helpers.R

# get and process data for chosen diet
getdietChoiceData <- function (ChickData, dietchoice) {
  dietChoiceData <- ChickData[ChickData$Diet==dietchoice,] 
  aggregateDietChoiceData <- aggregate(weight ~ Time, data = dietChoiceData, FUN = mean)   
}

# build linear regression model for chosen diet
getDietModel <- function (ChickData, dietchoice) {
  
  dietChoiceData <- getdietChoiceData(ChickData, dietchoice)
  
  fittedModel <- lm (weight ~ Time, data= dietChoiceData)
  
}

# plot regression model
plotDietModel <- function(ChickData, dietchoice, x=0, y=0) {
  dietChoiceData <- getdietChoiceData(ChickData, dietchoice)
  
  dietText <- paste ("Sample Linear Regression Model for Chosen diet \n", "Chicken on Diet", dietchoice, ": \n")
  
  mainTitleText <- ""    #Average Increase in Chicken Weight over Time "
  
  plotTitle <- paste(dietText, mainTitleText)
  
  plot(dietChoiceData$Time, dietChoiceData$weight, 
       xlab = "Number Of Days Since Birth",
       ylab= "Average Chicken Weight in grams",
       main = plotTitle, pch=16, col = "blue", cex = 2)
 
  fittedModel <- getDietModel(ChickData, dietchoice)
  abline(fittedModel, col="red", lty=1, lwd =2)
  points(x,y, pch=3, col = "red", cex=6)
}

