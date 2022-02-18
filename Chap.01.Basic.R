install.packages("ggplot2")
install.packages("gapminder")
library(ggplot2)
library(gapminder)

p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p
p + geom_point()









p + geom_smooth()






p + geom_point() + geom_smooth()

p + geom_point() + geom_smooth(method = "gam")

p + geom_point() + 
    geom_smooth(method = "lm")

p + geom_point() + 
    geom_smooth(method = "gam") +
    scale_x_log10()







p + geom_point() + 
    geom_smooth(method = "gam") +
    scale_x_log10(labels = scales::dollar)





p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp,
                          color = "purple"))
p + geom_point() +
    geom_smooth(method = "loess") +
    scale_x_log10()

p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
            
p + geom_point(color="purple") +
    geom_smooth(color = "orange") +
    scale_x_log10()


p <- ggplot(data = gapminder, 
            mapping = aes(x = gdpPercap, y=lifeExp))
p + geom_point(alpha = 0.3) +
    geom_smooth(method = "gam") +
    scale_x_log10(labels = scales::dollar) +
    labs(x = "GDP Per Capita", 
         y = "Life Expectancy in Years",
         title = "Economic Growth and Life Expectancy",
         subtitle = "Data points are country-years",
         caption = "Source: Gapminder.")

p <- ggplot(data = gapminder, 
            mapping = aes(x = gdpPercap, y = lifeExp))
p + geom_point(mapping = aes(color = continent)) +
    geom_smooth(method = "loess") +
    scale_x_log10()

ggsave(filename = "my_figure.png")
ggsave(filename = "my_figure.pdf")
getwd()
