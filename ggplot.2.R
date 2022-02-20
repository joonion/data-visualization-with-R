library(tidyverse)

p <- ggplot(mpg, aes(displ, hwy)) +
    geom_point(aes(color = class)) +
    geom_smooth(se = FALSE)

p + labs(title = "Fuel efficiency .vs. engine size")

p + labs(title = "Fuel efficiency .vs. engine size",
         subtitle = "Two seaters are exceptional",
         caption = "Data from fueleconomy.gov")

p + labs(x = "Engine displacement (L)",
         y = "Highway fuel economy (mpg)", 
         color = "Car Type")


best_in_class <- mpg %>%
    group_by(class) %>%
    filter(row_number(desc(hwy)) == 1)

p + geom_text(aes(label = model), 
              data = best_in_class)

p + geom_label(aes(label = model), 
               data = best_in_class,
               nudge_y = 2, alpha = 0.5)

p + ggrepel::geom_label_repel(aes(label = model), 
                              data = best_in_class)

label <- tibble(
    displ = Inf, hwy = Inf,
    label = "Increasing engine size is \n related to decreasing fuel economy."
    )

p + geom_text(aes(label = label), 
              data = label, 
              vjust = "top", 
              hjust = "right")

p + theme(legend.position = "top")
p + theme(legend.position = "bottom")
p + theme(legend.position = "left")
p + theme(legend.position = "right")

p + theme(legend.position = "bottom") +
    guides(color = guide_legend(nrow = 1, 
                                override.aes = list(size = 4)))

p + theme_classic()
p + theme_bw()
p + theme_light()
p + theme_linedraw()
p + theme_dark()
p + theme_minimal()
p + theme_gray()
p + theme_void()

ggsave("myplot.pdf")
?ggsave

ggsave(file="myplot.png", 
       width = 1920, height = 1080, units = "px")




