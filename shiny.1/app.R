#install.packages("shiny")
library(shiny)

getwd()

source("./shiny.1/ui.R")
source("./shiny.1/server.R")

shinyApp(ui = ui, server = server)
