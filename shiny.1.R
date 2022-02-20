#install.packages("shiny")
library(shiny)

# shiny.1.R

ui <- fluidPage(
    tags$h1("Hello, Shiny!"),
    tags$img(src="https://shiny.rstudio.com/gallery/images/screenshots/superzip-example.png")
)

server <- function (input, output, session) {
    # Do something here!
}

shinyApp(ui = ui, server = server)
