Sys.setenv("plotly_username"="your_plotly_username")
Sys.setenv("plotly_api_key"="your_api_key")

install.packages("plotly")
library(plotly)

str(midwest)
head(midwest)
fig <- plot_ly(midwest, x = ~percollege, color = ~state, type = "box")
fig


#install.packages("gapminder")
library(ggplot2)
library(plotly)
library(gapminder)

p <- gapminder %>%
    filter(year==1977) %>%
    ggplot( aes(gdpPercap, lifeExp, size = pop, color=continent)) +
    geom_point() +
    theme_bw()

ggplotly(p)

library(ggplot2)
library(plotly)
library(gapminder)

p <- ggplot(gapminder, aes(gdpPercap, lifeExp)) +
    geom_point(aes(color = continent, 
                   size = pop,
                   alpha = 0.5)) +
    geom_smooth(se = F) +
    scale_x_log10(label = scales::dollar)

ggplotly(p)



