library(shiny)
library(shinydashboard)

ui <- shinyUI (fluidPage(
      titlePanel("ABC Analysis"),
      sidebarLayout(
        sidebarPanel(
          fileInput('file1', 'Choose CSV File', accept=c('text/csv', 'text/comma-separated-values', 'text/plain', '.csv')),
          selectInput ("rev_col","Choose column with revenue entries", choices=" ",    selected=" ")
          ),
        mainPanel = tableOutput("table")
        )
      )
      )

server <- function (input, output,session){
  
  ## reactive value to read the csv file in ----------
  ABC_Input <- reactive({
    req(input$file1)
    data.frame(read.csv(input$file1$datapath))
  })
  
  ## observe input$file1 to update the input$rev_col ------------
  observeEvent(input$file1,{
    updateSelectInput(session,
                      inputId = "rev_col",
                      choices = names(ABC_Input()))
  }
  )
  
  ## Data_new as reactive (could be used in other chuncks)---------------
  Data_new <- reactive({
    req(input$rev_col)
    # now ABC_Input is reactive, so you need to call ABC_Input()
    Data_new <- ABC_Input()[order(ABC_Input()[input$rev_col], decreasing = T),]
    # Create cumsum variable
    Data_new$Rev_CumSum = cumsum(Data_new[input$rev_col])
    #Create Percentages of CumSum
    Data_new$Percent_Rev_Cum <- Data_new$Rev_CumSum / sum(Data_new[input$rev_col])
    
    return(Data_new)
  })
  
  ## render table of Data_new() -------------------
  output$table <- renderTable({
    req(input$rev_col)
    Data_new()
  })
  
}

shinyApp(ui, server)


