library(shiny)

ui <- pageWithSidebar(
    headerPanel(h1("Hello, Shiny!")),
    sidebarPanel(
        sliderInput("count", 
                    "Number of values: ",
                    min = 1, 
                    max = 10000,
                    value = 5000)),
    mainPanel(
        plotOutput("distPlot"))
)

server <- function(input, output) {
    output$distPlot <- renderPlot({
        dist <- rnorm(input$count)
        hist(dist, col = "steelblue", breaks = 50)
    })
}

shinyApp(ui, server)