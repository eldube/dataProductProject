shinyUI(fluidPage (
  #application Title
  title = "Projected Chicken Weight Calculator",
  
  titlePanel(h1("The Effect of Diet on Chicken Weight in the first 21 days", style="color:green")),
  
  sidebarLayout (
    
    sidebarPanel(
      
      fixedRow(
        
        column(12, offset=1,
               selectInput("var", 
                           label = h4("Select Chicken Diet"),
                           choices = c("Diet 1", "Diet 2",
                                       "Diet 3", "Diet 4"),
                           selected = "Diet 1")
        )
        
        
        
      ),
      fixedRow(
        
        
        column(12,offset=1,
               br(),
               numericInput("birthWeight", 
                            label = h4("Enter Birth Weight"), 
                            value = 40,
                            min=30, max =60, step=0.5
               ),
               p ("weight of chicken in grams (g)")
        )
        
      ),
      
      fixedRow(
        column(12, offset=1,
               br(),
               sliderInput("day", label = h4("Select Age (Number of Days since Birth)" ),
                           min = 0, max = 21, value = 0)
        )
        
        
      ),
      fixedRow(
        
        column(12, offset=3,
               
               br(),
               br(),
               actionButton("getProjectedWeight", label = h3("Submit", style="color:green"))
               
               
        ), 
        br(),
        p ("Click Submit button to view the projected weight of chicken for the inputs given above")
      ),
      fixedRow (
        column (12, offset=2,
                img (src = "RedChick.jpg", height=84, width=144)
          )
        )
        
      
      
      
    ), # end sidebarpanel 
     
    
    ## bein main panel
    mainPanel(
      fixedRow(
        column(12, offset=1,
                              
               h3(textOutput("projectionHeaderText"), style= "color:blue"),
               
               h1(textOutput("projectedWeightText"))
               
        )
        
      ),
      fixedRow(
        column(12, offset=0,
               br(),
               br(),
               br(),
               br(),
               #h5 ("    Sample Linear Regression Model for Chosen diet"),  
               plotOutput("modelPlot")
        )
        
      )
      
      
      
      
      
      )
    
    )
))