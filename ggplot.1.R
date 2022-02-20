#install.packages("tidyverse")
library(tidyverse)

?mpg
str(mpg)
head(mpg)

windows(width=7, height=5)

p <- ggplot(data = mpg,
            mapping = aes(x = displ, y = hwy))
p

p + geom_point()

p + geom_point(mapping = aes(color=class))
head(colors(), 20)

p + geom_point(mapping = aes(color=class,
                             size=class))

p + geom_point(mapping = aes(color=class, 
                             shape=class))

p + geom_point(mapping = aes(color=class, size=class,
                             alpha=0.3))


p + geom_point(color="tomato") +
    facet_wrap(~ class, nrow=2)

?mpg
table(mpg$drv)
table(mpg$cyl)
table(mpg$drv, mpg$cyl)

p + geom_point(color = "orange") +
    facet_grid(drv ~ cyl)

p + geom_point(color = "blue") +
    geom_smooth(color = "cyan")

p + geom_point(mapping = aes(color = class)) +
    geom_smooth(color = "cyan")

library(ggplot2)
data("diamonds")
str(diamonds)
head(diamonds)

p <- ggplot(data = diamonds)
p + geom_bar(mapping = aes(x = cut),
             fill = "steelblue")

p + stat_count(mapping = aes(x = cut),
               fill = "steelblue")

p + geom_bar(mapping = aes(x = cut, 
                           fill = clarity))

p + geom_bar(mapping = aes(x = cut, fill = clarity), 
             position = "fill")

p + geom_bar(mapping = aes(x = cut, fill = clarity), 
             position = "dodge")

ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy, color = class), 
               position = "jitter")

p <- ggplot(data = mpg,
            mapping = aes(x = class, y = hwy))
p + geom_boxplot(fill = "lightyellow")

p + geom_boxplot(fill = "lightyellow") +
    coord_flip()

p <- ggplot(data = diamonds,
            mapping = aes(x = cut, fill = cut))
p + geom_bar(show.legend = F, width = 1)
    

p + geom_bar(show.legend = F, width = 1) +
    labs(x = NULL, y = NULL) +
    theme(aspect.ratio = 1) +
    coord_polar()

world <- map_data("world")
ggplot(world, aes(long, lat, group = group)) +
    geom_polygon(fill = "lightyellow", color = "blue")

