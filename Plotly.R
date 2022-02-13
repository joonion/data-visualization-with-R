Sys.setenv("plotly_username"="your_plotly_username")
Sys.setenv("plotly_api_key"="your_api_key")


library(plotly)



midwest
str(midwest)
head(midwest)
fig <- plot_ly(midwest, x = ~percollege, color = ~state, type = "box")
fig


