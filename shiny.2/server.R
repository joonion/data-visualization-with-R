# shiny.2/server.R

server <- function(input, output) {

    # Create a reactive expression
    dataset <- reactive({
        get(input$dataset, "package:datasets")
    })
    
    output$summary <- renderPrint({
        # Use a reactive expression by calling it like a function
        summary(dataset())
    })
    
    output$table <- renderTable({
        dataset()
    })
}