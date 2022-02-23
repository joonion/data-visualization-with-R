# https://www.datanovia.com/en/blog/gganimate-how-to-create-plots-with-beautiful-animation-in-r/

library(gapminder)
library(ggplot2)
library(gganimate)
library(gifski)

theme_set(theme_bw())

p <- ggplot(
    gapminder, 
    aes(x = gdpPercap, y=lifeExp, size = pop, colour = country)) +
    geom_point(show.legend = FALSE, alpha = 0.7) +
    scale_color_viridis_d() +
    scale_size(range = c(2, 12)) +
    scale_x_log10() +
    labs(x = "GDP per capita", y = "Life expectancy")
p

p + transition_time(year) +
    labs(title = "Year: {frame_time}")

p + transition_time(year) +
    labs(title = "Year: {frame_time}") +
    view_follow(fixed_y = TRUE)



p <- ggplot(
    airquality,
    aes(Day, Temp, group = Month, color = factor(Month))) +
    geom_line() +
    scale_color_viridis_d() +
    labs(x = "Day of Month", y = "Temperature") +
    theme(legend.position = "top")
p

p + 
    geom_point(aes(group = seq_along(Day))) +
    transition_reveal(Day)


library(dplyr)
mean.temp <- airquality %>%
    group_by(Month) %>%
    summarise(Temp = mean(Temp))
mean.temp

p <- ggplot(mean.temp, aes(Month, Temp, fill = Temp)) +
    geom_col() +
    scale_fill_distiller(palette = "Reds", direction = 1) +
    theme_minimal() +
    theme(
        panel.grid = element_blank(),
        panel.grid.major.y = element_line(color = "white"),
        panel.ontop = TRUE
    )
p

p + transition_states(Month, wrap = FALSE) +
    shadow_mark() +
    enter_grow() +
    enter_fade()
