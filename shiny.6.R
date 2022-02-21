library(shiny)
library(ggplot2)

ui <- pageWithSidebar(
    headerPanel(h1("데이터테이블 예제")),
    sidebarPanel(
        checkboxGroupInput("showvars",
                           "컬럼을 선택해보세요:",
                           names(diamonds),
                           selected = names(diamonds)),
        helpText("오른쪽에서 탭을 선택하면 다른 데이터도 볼 수 있음.")
    ),
    mainPanel(
        tabsetPanel(
            tabPanel("diamonds", 
                     dataTableOutput("mytable1")),
            tabPanel("mtcars", 
                     dataTableOutput("mytable2")),
            tabPanel("iris", 
                     dataTableOutput("mytable3")),
        )
    )
)

server <- function (input, output) {
    output$mytable1 <- renderDataTable({
        diamonds[, input$showvars, drop = FALSE]
    })
    output$mytable2 <- renderDataTable({
        mtcars
    }, options = list(bSortClasses = TRUE))
    output$mytable3 <- renderDataTable({
        iris
    }, options = list(aLengthMenu = c(5, 30, 50),
                      iDisplayLength = 5))
}

shinyApp(ui = ui, server = server)
