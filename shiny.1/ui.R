# ./shiny.1/ui.R

ui <- fluidPage(
    selectInput("dataset", 
                label = "Dataset", 
                choices = ls("package:datasets")),
    verbatimTextOutput("summary"),
    tableOutput("table")
)
