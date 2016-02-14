library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Homework10"),
  
  # Sidebar with controls to select a dataset and specify the
  # number of observations to view
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset:", 
                  choices = c("iris", "pressure", "cars")),
      
      numericInput("obs", "Number of observations to view:", 10)
    ),
    
    # Show a summary of the dataset and an HTML table with the 
    # requested number of observations
    mainPanel(
      # verbatimTextOutput("summary"),
      
      tableOutput("view"),
      plotOutput("distPlot")
    )
  )
))
