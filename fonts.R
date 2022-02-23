library(extrafont)
loadfonts(device = "win")
??extrafont
fonts()
fonttable()
loadfonts()

?theme
windows()
ggplot(mtcars, aes(x=wt, y=mpg)) + 
    geom_point() +
    ggtitle("Fuel Efficiency of 32 Cars") +
    xlab("Weight (x1000 lb)") + 
    ylab("Miles per Gallon") +
    theme(text=element_text(size=32,
                            family="Impact"))


windows()

myFont1 <- "Montserrat"
myFont2 <- "Roboto"
myFont3 <- "Palatino"

library(ggplot2)

a <- ggplot(mtcars, aes(x = wt, y = mpg)) + 
    geom_point() +
    ggtitle("Fuel Efficiency of 32 Cars") +
    xlab("Weight (x1000 lb)") + ylab("Miles per Gallon") +
    theme(text = element_text(size = 16, family = myFont1)) +
    annotate("text", 4, 30, label = 'Palatino Linotype',
             family = myFont3, size = 10) +
    annotate("text", 1, 11, label = 'Roboto', hjust = 0,
             family = myFont2, size = 10) 

## On-screen device
print(a) 


library(extrafont)

font_import()
font_install()
loadfonts(device = "win")
Graph2 +
    ggtitle("LaTex Fonts") +
    theme(
        axis.text.x = element_text(size = 10,family="SpoqaHanSans-Bold"),
        axis.text.y = element_text(size = 12,family = "LM Roman 10"),
        axis.title.x = element_text(size = 14),
        plot.title = element_text(size = 20,family = "LM Roman 10"),
        legend.title = element_text(size = 10,family = "SpoqaHanSans-Bold"),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()
    )

postscriptFonts()

pdf.options(family="Korea1deb")

ggplot(data = mtcars, aes(x=cyl, y=mpg)) +
    geom_point() +
    ggtitle("헬로 한글!")
