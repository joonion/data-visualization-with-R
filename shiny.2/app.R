#install.packages("shiny")
library(shiny)

getwd()

source("./shiny.2/ui.R")
source("./shiny.2/server.R")

shinyApp(ui = ui, server = server)
