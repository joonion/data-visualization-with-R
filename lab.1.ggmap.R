install.packages("xlsx")
library(xlsx)
mydf <- read.xlsx("선별진료소_20220216072734.xls", 1)
str(mydf)

mydf <- mydf[, c(2, 3, 4, 5)]
head(mydf)
tail(mydf)

names(mydf) <- c("city", "sector", "name", "addr")
str(mydf)

daegu <- mydf[mydf$city=="대구", ]
head(daegu)

nrow(daegu)
table(daegu$sector)
barplot(table(daegu$sector), col = "steelblue")

library(ggmap)

ggmap_key <- "your API key here"
register_google(ggmap_key)

## geocode 가져오기
daegu.loc <- mutate_geocode(data=daegu,
                            location=addr,
                            source="google")

daegu.loc[, c("lon", "lat", "name")]
daegu.loc <- na.omit(daegu.loc)
daegu.loc[, c("lon", "lat", "name")]

# 지도정보 표시하기
daegu.map <- get_googlemap(c("대구"), maptype = "roadmap", zoom = 11)
ggmap(daegu.map)

ggmap(daegu.map) +
    geom_point(data = daegu.loc, 
               aes(x = lon, y = lat, color = factor(name)), 
               size = 3)

# 지도 위에 마커 표시하기
marker <- data.frame(daegu.loc$lon, daegu.loc$lat)
daegu.map <- get_googlemap(c("대구"), 
                           maptype = "roadmap", 
                           zoom = 11,
                           markers=marker)
ggmap(daegu.map) +
    geom_text(data = daegu.loc, 
              aes(x = lon, y = lat),  
              size = 3, 
              label = daegu.loc$name)

daegu.loc$name


