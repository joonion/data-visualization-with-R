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

p + geom_point(color="#FFCC00CC") +
    geom_smooth(color = "#0000FF") +
    scale_x_log10()


p <- ggplot(data = gapminder, 
            mapping = aes(x = gdpPercap, 
                          y = lifeExp,
                          color = continent))
p + geom_point(alpha = 0.5) +
    scale_x_log10(labels = scales::dollar) +
    theme_classic()

ggsave("mywork.png", width=8, height=5)

ggsave("mywork.pdf", width=8, height=5)

p <- ggplot(data = gapminder, 
            mapping = aes(x = gdpPercap, y = lifeExp))
p + geom_point(mapping = aes(color = continent)) +
    geom_smooth(method = "loess") +
    scale_x_log10()

ggsave(filename = "my_figure.png")
ggsave(filename = "my_figure.pdf")
getwd()

install.packages("HistData")
library(HistData)
data(GaltonFamilies)
mydf <- GaltonFamilies

plot(mydf$midparentHeight, 
     mydf$childHeight,
     col="skyblue")

model <- lm(childHeight ~ midparentHeight,
            data = mydf)
abline(model, col="orange", lwd=3)

