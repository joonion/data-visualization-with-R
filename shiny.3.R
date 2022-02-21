library(shiny)

ui <- pageWithSidebar(
    
    # 1. 헤더 패널
    headerPanel(
        h1("Hello, Shiny!")),
    
    # 2. 사이드바 패널
    sidebarPanel(
        h3("Sidebar is Here...")),
    
    # 3. 메인 패널    
    mainPanel(
        h3("Main is Here..."))
)

server <- function(input, output) {
    output$distPlot <- renderPlot({
        dist <- rnorm(input$count)
        hist(dist, col = "steelblue", breaks = 50)
    })
}

shinyApp(ui, server)

