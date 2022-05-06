library(shiny)
library(shinydashboard)        

# PREAMBLE begins
# READ (FOR REPORTS) https://shiny.rstudio.com/articles/generating-reports.html

# PREAMBLE ends

ui <- fluidPage(
  
  navbarPage(title = "PATSATSYS",
             tabPanel("DataSets", 
                      sidebarLayout(
                        sidebarPanel(
                          fileInput("file1", "Choose CSV File", accept=c('text/csv', 'text/comma-separated-values', 'text/plain', '.csv')),
                          radioButtons("indata", "Choice:", choices = c("full", "cols")),
                          selectInput("cols", "Choose the variable", choices = "", selected = " "), 
                          downloadButton('report')
                          ), 
                        mainPanel(tableOutput("tab1"))
                        )
             ), 
             
             tabPanel("CAEREL", 
                      sidebarLayout(
                        sidebarPanel(uiOutput("var_name")), 
                        mainPanel(plotOutput("plot1"))
                      )
               
             ), 
             
             tabPanel("REPORTS", 
                      sidebarLayout(
                        sidebarPanel("Reports"), 
                        mainPanel(uiOutput("pdfview"))
                      )
             ),        
             
             tabPanel("Contact", 
                      sidebarLayout(
                        sidebarPanel(
                          "Information to contact"
                        ), 
                        mainPanel(htmlOutput("text1"))
                      )
              )
          )
      ) 



server <- function(input, output, session) {
  
  # for DATASET TAB
  
  data_input <- reactive({
    infile <- input$file1
    req(infile)
    data.frame(read.csv(infile$datapath)) 
  })
  
  observeEvent(input$file1,{
    
    updateSelectInput(session,
                        inputId = "cols",
                        choices = names(data_input()))
    }
  )
  
  
 output$tab1 <- renderTable(
   {
     df <- data_input()
     if (input$indata == "full"){
       print(df)
     } else {
       print(df[input$cols])
     }
     
    }
 )

 # FOR CAEREL TAB
 
 output$var_name <- renderUI({
   div(
     textInput("lv", "Define LV:"),
     selectInput("name", 
                 "choose variables", 
                 choices = names(data_input()), 
                 multiple = TRUE), 
                 actionButton("get", "get variables")
                 )
   
 })
 
 output$plot1 <- renderPlot({
   if (!is.null(input$name)){
     plot(df[input$name])
   } else {paste("choose a variable")}
 })
   
 
 # FOR CONTACT TAB
 
 output$text1 <- renderText({
  str1 <- paste("kamakshaiah.m@gmail.com") 
  str2 <- paste("+919177573730")
  str3 <- paste("166, Vayushakti Nagar, Dammaiguda, Hyderabad, Telangana State, India 500083")
  HTML(paste(str1, str2, str3, sep = '<br/>'))
 })
 
 # REPORTS
 
 output$report = downloadHandler(
   
   filename = 'myreport.pdf',
  
   content = function(file) {
     out = knit2pdf('input.Rnw', clean = TRUE)
     #file.rename(out, file) # move pdf to file for downloading
     file.copy(out, file, overwrite = TRUE)
   },
   
   contentType = 'application/pdf'
 )
 
 #if (file.exists("input.pdf")){file.remove("input.pdf")}
   
 output$pdfview <- renderUI({
   tags$iframe(style="height:600px; width:100%", src=browseURL(file.path(paste(getwd(), "/", "input.pdf", sep = ""))))
  })  
 
 
 
 # tags$iframe(src="myreport.pdf", width="600", height="900")
 # browseURL(file.path(paste(getwd(), "/", "input.pdf", sep = "")))
 
}

shinyApp(ui, server)
