#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Investing Modalities"),
   
   # Sidebar with a slider input for number of bins 
   fluidRow(
      column(4, 
         sliderInput("initial",
                     "Initial Amount:",
                     min = 0,
                     max = 100000,
                     step = 500,
                     value = 1000), 
         sliderInput('contrib',
                     'Annual Contribution:',
                     min = 0,
                     max = 50000, 
                     step = 500, 
                     value = 2000)
      ),
      column(4, 
         sliderInput('return',
                     'Return Rate:',
                     min = 0,
                     max = 20,
                     step = 0.1,
                     value = 5),
         sliderInput('growth',
                     'Growth Rate:',
                     min = 0,
                     max = 20,
                     step = 0.1,
                     value = 2)
      ),
      column(4, 
         sliderInput('years',
                     'Years:',
                     min = 0, 
                     max = 50,
                     step = 1,
                     value = 20),
         selectInput('facet',
                     'Facet?:',
                     c('No', 'Yes'))
      )
   ),
   hr(),
   h4('Timelines'),
   br(),
      
      # Show a plot of the generated distribution
      mainPanel(
         column(12, offset = 2,
                plotOutput('distPlot')),
         br(),
         hr(),
         h4('Balances'),
         br(),
         column(12, offset = 2, 
                verbatimTextOutput('table'))
      )
)
   


# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$table <- renderPrint({
    
    #Future Value Functions
    
    #' @title: future value
    #' @description: computes the future value of an investment, assuming compound interest
    #' @param: amount initial invested amount
    #' @param: rate annual rate of return
    #' @param: years number of years
    #' @return: value of investment after n years
    future_value <- function(amount = 0, rate = 0, years = 0){
      current_val <- amount
      for (i in seq(1, years, by=1)){
        current_val <- current_val * (1 + rate)
      }
      return(current_val)
    }
    
    #' @title: annuity
    #' @description: computes the future value of annuity
    #' @param: contrib contributed amount
    #' @param: rate annual rate of return
    #' @param: years number of years
    #' @return: future value of annuity
    annuity <- function(contrib = 0, rate = 1, years = 0){
      factor <- 1
      for (i in seq(1, years, by=1)){
        factor <- factor * (1 + rate)
      }
      future_val_annuity <- contrib * ((factor - 1)/rate)
      return(future_val_annuity)
    }
    
    #' @title: growing annuity
    #' @description: computes the future value of growing annuity
    #' @param: contrib contributed amount
    #' @param: rate annual rate of return
    #' @param: growth annual growth rate
    #' @param: years number of years
    #' @return: future value of growing annuity
    growing_annuity <- function(contrib = 0, rate = 1, growth = 0, years = 0) {
      rate_factor <- 1
      growth_factor <- 1
      for (i in seq(1, years, by=1)){
        rate_factor <- rate_factor * (1 + rate)
        growth_factor <- growth_factor * (1 + growth)
      }
      numerator <- rate_factor - growth_factor
      fvga <- contrib * (numerator/(rate - growth))
      return(fvga)
    }
    
    year <- 1:input$years
    init_investment <- input$initial
    
    no_contrib <- c(init_investment)
    fixed_contrib <- c(init_investment)
    growing_contrib <- c(init_investment)
    
    index <- 2
    
    for(i in year) {
      no_contrib[index] <- future_value(amount = init_investment, rate = input$return/100, years = i)
      fixed_contrib[index] <- future_value(amount = init_investment, rate = input$return/100, years = i) + annuity(contrib = input$contrib, rate = input$return/100, years = i)
      growing_contrib[index] <- future_value(amount = init_investment, rate = input$return/100, years = i) + growing_annuity(contrib = input$contrib, rate = input$return/100, growth = input$growth/100, years = i)
      index <- index + 1
    }
    
    modalities <- data.frame('year' = 0:input$years, 
                             'no_contrib' = no_contrib, 
                             'fixed_contrib' = fixed_contrib, 
                             'growing_contrib' = growing_contrib)
    modalities
    }
)

  output$distPlot <- renderPlot({

    #Future Value Functions
    
    #' @title: future value
    #' @description: computes the future value of an investment, assuming compound interest
    #' @param: amount initial invested amount
    #' @param: rate annual rate of return
    #' @param: years number of years
    #' @return: value of investment after n years
    future_value <- function(amount = 0, rate = 0, years = 0){
      current_val <- amount
      for (i in seq(1, years, by=1)){
        current_val <- current_val * (1 + rate)
      }
      return(current_val)
    }
    
    #' @title: annuity
    #' @description: computes the future value of annuity
    #' @param: contrib contributed amount
    #' @param: rate annual rate of return
    #' @param: years number of years
    #' @return: future value of annuity
    annuity <- function(contrib = 0, rate = 1, years = 0){
      factor <- 1
      for (i in seq(1, years, by=1)){
        factor <- factor * (1 + rate)
      }
      future_val_annuity <- contrib * ((factor - 1)/rate)
      return(future_val_annuity)
    }
    
    #' @title: growing annuity
    #' @description: computes the future value of growing annuity
    #' @param: contrib contributed amount
    #' @param: rate annual rate of return
    #' @param: growth annual growth rate
    #' @param: years number of years
    #' @return: future value of growing annuity
    growing_annuity <- function(contrib = 0, rate = 1, growth = 0, years = 0) {
      rate_factor <- 1
      growth_factor <- 1
      for (i in seq(1, years, by=1)){
        rate_factor <- rate_factor * (1 + rate)
        growth_factor <- growth_factor * (1 + growth)
      }
      numerator <- rate_factor - growth_factor
      fvga <- contrib * (numerator/(rate - growth))
      return(fvga)
    }
    
    year <- 1:input$years
    init_investment <- input$initial
    
    no_contrib <- c(init_investment)
    fixed_contrib <- c(init_investment)
    growing_contrib <- c(init_investment)
    
    index <- 2
    
    for(i in year) {
      no_contrib[index] <- future_value(amount = init_investment, rate = input$return/100, years = i)
      fixed_contrib[index] <- future_value(amount = init_investment, rate = input$return/100, years = i) + annuity(contrib = input$contrib, rate = input$return/100, years = i)
      growing_contrib[index] <- future_value(amount = init_investment, rate = input$return/100, years = i) + growing_annuity(contrib = input$contrib, rate = input$return/100, growth = input$growth/100, years = i)
      index <- index + 1
    }
    
    modalities <- data.frame('year' = 0:input$years, 
                             'no_contrib' = no_contrib, 
                             'fixed_contrib' = fixed_contrib, 
                             'growing_contrib' = growing_contrib)
    contribution <- append(append(rep('No Contribution', input$years + 1), 
                                  rep('Fixed Contribution', input$years + 1)), 
                           rep('Growing Contribution', input$years + 1))
    
    accounts <- data.frame('year' = 0:input$years, 
                           'balance'= c(no_contrib, fixed_contrib, growing_contrib), 
                           'contribution' = contribution)
    
    if(input$facet == 'No'){
      modalities_plot <- ggplot(data = modalities) + 
        geom_line(aes(x=year, y=no_contrib, col = 'red')) + 
        geom_line(aes(x=year, y=fixed_contrib, col = 'blue')) + 
        geom_line(aes(x=year, y=growing_contrib, col = 'orange')) +
        labs(x = 'Year', y = 'Investment', title = 'Three Modes of Investing') +
        scale_color_manual(name = 'Legend', labels = c('Fixed Contribution', 'High Contribution', 'Low Contribution'), values = c('red', 'orange', 'blue'))
      modalities_plot
    } else if(input$facet == 'Yes'){
        account_plot <- ggplot(data = accounts) + 
          geom_area(aes(x = year, y = balance, color = contribution, fill = contribution)) +
          facet_grid(.~contribution)
        account_plot
     }
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

