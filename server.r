# Alongside the Regression Models Project on the Motor Trend Magazine study,
# we continue to focus on the mtcars dataset and go on trying to explain and
# predict MPG using the weight (wt) and the cylinders number (cyl) features.


# Loading required libraries for this shiny app on server side
library(shiny)
library(ggplot2)

# Define server logic required to predict the MPG
shinyServer(function(input, output) {
  
  predicted_mpg <- reactive({
    # creating the model
    model <- lm(mpg ~ cyl + wt, data = mtcars)
    # using the user's selections in order to predict using the previous simple model
    x <- predict(model, newdata = data.frame(cyl = input$cyl, wt = input$wt))
    
    return(x[1])    
  })
  
  # format and return the text of our prediction
  output$predicted_mpg <- renderText(sprintf("Prediction: %.1f MPG", predicted_mpg()))
  
  # Plotting of all the motortrend data along with the user's selection and its prediction
  output$mpg_plot <- renderPlot({
    
    tmp_mtcars <- mtcars
    tmp_mtcars$data_source = "Motor Trend"
    
    # create a new car using the User's selections and adding it to the temporary dataset
    user_car <- data.frame(mpg = predicted_mpg(), cyl = input$cyl, disp = 1,
                           hp = 1, drat = 1, wt = input$wt, qsec = 1, vs = 1,
                           am = 1, gear = 1, carb = 1, data_source = "Prediction")
    tmp_mtcars <- rbind(tmp_mtcars, user_car)
    rownames(tmp_mtcars)[nrow(tmp_mtcars)] <- "user"

    # almost dummy variables to outline user's selection
    xfactor <- (max(tmp_mtcars$wt) - min(tmp_mtcars$wt)) * 0.025
    yfactor <- (max(tmp_mtcars$cyl) - min(tmp_mtcars$cyl)) * 0.25
    
    # factorizing the "cyl" feature
    tmp_mtcars$cyl <- as.factor(tmp_mtcars$cyl)
    
    # making the plot to show on the shiny app
    my_plot <- ggplot(tmp_mtcars, aes(x = wt, y = mpg, color = cyl, shape = data_source)) +
      annotate("rect", xmin = user_car$wt - xfactor, ymin = user_car$mpg - yfactor,
               xmax = user_car$wt + xfactor, ymax = user_car$mpg + yfactor,
               alpha = 0.3, fill = "yellow") +
      annotate("text", x = user_car$wt + xfactor, y = user_car$mpg + yfactor, label = "Your car choice") +
      geom_point(size = 5, alpha = 0.75) + xlab("Weight (klbs)") + ylab("MPG") +
      ggtitle("Prediction of MPG\ndata_source Engine Cylinder Count and Weight\n") +
      theme_bw()
    
    print(my_plot)
  })
  
})
