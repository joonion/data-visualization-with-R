library(ggplot2)
library(grid)
library(gridExtra)
library(stargazer)

?stargazer

anscombe
summary(anscombe)
stargazer(anscombe, type="text",
          title = "Descriptive Statistics")

corr <- function(x) {
    cor(anscombe[,x], anscombe[,x+4])
}
stargazer(sapply(1:4, corr), type="text",
          title = "Correlations")

lm.1 <- lm(y1 ~ x1, data = anscombe)
lm.2 <- lm(y2 ~ x2, data = anscombe)
lm.3 <- lm(y3 ~ x3, data = anscombe)
lm.4 <- lm(y4 ~ x4, data = anscombe)
stargazer(lm.1, lm.2, lm.3, lm.4, type="text",
          title = "Linear Regression Models")

p <- ggplot(anscombe) +
    scale_x_continuous(breaks = seq(4, 20, 2)) +
    scale_y_continuous(breaks = seq(4, 14, 2)) +
    expand_limits(x = c(3,21), y = c(3, 15)) +
    theme_bw()

p1 <- p + 
    geom_point(aes(x1, y1), color="tomato", size=2) +
    geom_abline(intercept = coef(lm.1)[1], 
                slope = coef(lm.1)[2], 
                color = "blue") +
    labs(x = "x1", y = "y1", title = "Data I")
    
p2 <- p + 
    geom_point(aes(x2, y2), color="tomato", size=2) +
    geom_abline(intercept = coef(lm.2)[1], 
                slope = coef(lm.2)[2], 
                color = "blue") +
    labs(x = "x2", y = "y2", title = "Data II")

p3 <- p + 
    geom_point(aes(x3, y3), color="tomato", size=2) +
    geom_abline(intercept = coef(lm.3)[1], 
                slope = coef(lm.3)[2], 
                color = "blue") +
    labs(x = "x3", y = "y3", title = "Data III")

p4 <- p + 
    geom_point(aes(x4, y4), color="tomato", size=2) +
    geom_abline(intercept = coef(lm.4)[1], 
                slope = coef(lm.4)[2], 
                color = "blue") +
    labs(x = "x4", y = "y4", title = "Data IV")

grid.arrange(grobs = list(p1, p2, p3, p4), 
             ncol = 2, 
             top = "Anscombe's Quartet")

