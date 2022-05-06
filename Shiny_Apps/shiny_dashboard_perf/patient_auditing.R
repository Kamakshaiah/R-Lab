library(shinydashboard)
library(shiny)

ui <- dashboardPage(
  
  dashboardHeader(title = "SECQUABEH"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Datasets", tabName = "DataDash", icon = icon("th", lib = "glyphicon")),
      menuItem("Patient-Satisfaction-Dash", tabName = "PatSatDash", icon = icon("user", lib = "glyphicon")),
      menuItem("Revenue-Dash", tabName = "RevDash", icon = icon("euro", lib = "glyphicon")),
      menuItem("Performance-Dash", tabName = "PerfDash", icon = icon("thumbs-up", lib = "glyphicon"))
    )
  ),
  
  dashboardBody(
    # Boxes need to be put in a row (or column)
    tabItems(
      # First tab content
      tabItem(tabName = "DataDash",
        fluidRow(
          box(
            title = "Data",
            fileInput('datafile', 'Choose CSV File',
                      accept=c('text/csv', 
                               'text/comma-separated-values,text/plain', 
                               '.csv')),
            tags$hr(),
            checkboxInput('header', 'Header', TRUE),
            radioButtons('sep', 'Separator',
                         c(Comma=',',
                           Semicolon=';',
                           Tab='\t'),
                         ','),
            radioButtons('quote', 'Quote',
                         c(None='',
                           'Double Quote'='"',
                           'Single Quote'="'"),
                         '"')
          ),
          mainPanel(
            uiOutput("toCol"), 
            verbatimTextOutput("sum")
          )
        )
      ),
      
      tabItem(tabName = "PatSatDash",
              fluidRow(
                box(plotOutput("plot1", height = 250)),
                
                box(
                  title = "Controls",
                  sliderInput("slider1", "Number of observations:", 1, 100, 50)
                )
              ),
              fluidRow(
                box(plotOutput("plot2", height = 250)),
                
                box(
                  title = "controls",
                  sliderInput("slider2", "Number of observations:", 1, 100, 50)
                )
              )
      ),
      
      # Second tab content
      tabItem(tabName = "RevDash",
              h2("Revenue tab content")
      ),
      
      # third tab
      tabItem(tabName = "PerfDash",
              h2("Performance tab content")
      )
    )
  )
)

server <- function(input, output) {
  
  filedata <- reactive({
    infile <- input$datafile
    # require that infile is not NULL (?req)
    # it will prevent propagating errors 
    req(infile) 
    
    read.csv(infile$datapath, header = TRUE)
    #as.data.frame(infile)
  })
  
  output$toCol <- renderUI({
    df <- filedata()
    
    # as.character: to get names of levels and not a numbers as choices in case of factors
    items <- as.character(names(df))
    
    selectInput("var", label = "Names:", choices = c(items))
    # summary(df["var"])
  })
  
  output$sum <- renderPrint({
    print(df)
    summary(df)
  })
  
   # here on UI elements for II, III, IV tabs
  
  set.seed(122)
  data <- rnorm(500)
  
  output$plot1 <- renderPlot({
    histdata <- data[seq_len(input$slider1)]
    hist(histdata)
  })
  
  output$plot2 <- renderPlot({
    boxdata <- data[seq_len(input$slider2)]
    boxplot(boxdata)
  })
}

shinyApp(ui, server)