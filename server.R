library(shiny)
library(datasets)

# Define server logic required to summarize and view the selected
# dataset
shinyServer(function(input, output) {
  
  # Return the requested dataset
  datasetInput <- reactive({
    switch(input$dataset,
           "iris" = iris,
           "pressure" = pressure,
           "cars" = cars)
  })
  
  # Generate a summary of the dataset
  #output$summary <- renderPrint({
  #  dataset <- datasetInput()
  #  summary(dataset)
  #})
  
  # Show the first "n" observations
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
  
  
  # 
  output$distPlot <- renderPlot({
    #x    <- faithful[, 2]  # Old Faithful Geyser data
    #bins <- seq(min(x), max(x), length.out = input$obs + 1)
    
    # draw the histogram with the specified number of bins
    #hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
    plot(iris[input$obs,])
  })
  
})
