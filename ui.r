# Alongside the Regression Models Project on the Motor Trend Magazine study,
# we continue to focus on the mtcars dataset and go on trying to explain and
# predict MPG using the weight (wt) and the cylinders number (cyl) features.



# Loading required libraries for this shiny app on user interface side
library(shiny)

# Define UI for application to predict the MPG
shinyUI(fluidPage(
  
  # Application title
  titlePanel("MPG Prediction using Motor Trend Magazine Dataset"),
  
  # Sidebar with a helpful prompt, a slider to set cylinder
  # count, a slider to set weight, and an output for the
  # predicted value (which will also be in the plot to the
  # right)
  sidebarLayout(
    sidebarPanel(
      p(
        "Using the mtcars dataset, we have created a Regression Model that helps us to predict MPG wrt user's selection."
      ),
      p(
        "Use the controls below to adjust settings to yoru own selection. The prediction will be displayed within the graph next to this dialog box."
      ),
      br(),
      sliderInput("cyl", "How many cylinders would you like?",
                  min = 1, max = 10, value = 6),
      
      sliderInput("wt", "How heavy would you like your car to be (in thousands of pounds) ?",
                  min = 1, max = 15, value = 4),
      br(),
      textOutput("predicted_mpg")
    ),
    
    mainPanel(
      plotOutput("mpg_plot")
    )
    
  )
  
))
