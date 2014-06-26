shinyUI(pageWithSidebar(

  headerPanel("Shiny with mtcars"),

  sidebarPanel(
    conditionalPanel(condition="input.conditionedPanels == 'Tables'",  
           numericInput("obs", "Number of observations to view:", min = 0, max = nrow(mtcars), value = 5),
           selectInput(inputId = "var",
                       label = "Select a variable to display the summary statistics",
                       choices = names(mtcars),
                       selected = "mpg")
    ),                     
    conditionalPanel(condition="input.conditionedPanels == 'Plot'",  
           selectInput(inputId = "color",
                       label = "select the color variable",
                       choices = c("cyl", "gear", "vs", "carb"),
                       selected = "cyl"),
           selectInput(inputId = "x",
                       label = "Select input variables",
                       choices = c("wt", "qsec", "am", "disp"),
                       selected = "wt")
    ),                   
    h5("See pdf documentation and R codes at https://github.com/sandipan/DevelopingDataProducts")
  ),

  mainPanel(
    tabsetPanel(
      tabPanel("Tables",  
               h4("Summary"), 
               verbatimTextOutput("summary"), 
               tableOutput("view")
      ), 
      tabPanel("Plot", plotOutput("plot", width="100%", height="400px")),
      id = "conditionedPanels" 
    )    
  )
))
