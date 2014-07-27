---
title       : MPG Prediction
subtitle    : Dumb linear model mpg ~ cyl + wt (just for creating a funny Shiny App !)
author      : A random Coursera Student
job         : Lifelong Learner
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Available Data

Comparing fuel consumption of an automatic and manual transmission car in relation to Miles Per Gallon (MPG). The data source for this excercise is primarily from the 1974 Motor Trend US magazine "mtcars" dataset.
<p>
A regressiona model is applied to determine a better fuel efficiency transmission between a manual and automatic car.:
* wt: weight of the car in thousands of pounds 
* cyl: number of cylinders in the car's engine
* mpg: gas mileage in miles per gallon

--- .class #id 

## The Model

Linear regression model based on the number of cylinders and weight of cars for MPG prediction:
```{r}
model <- lm(mpg ~ wt + cyl, data = mtcars)
model
```

--- .class #id 

## Results

```{r}
model.summary <- summary(model)
model.summary[4]  # coefficients
model.summary[8]  # r-squared
```
