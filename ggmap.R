# Lab 1. 공공데이터를 위한 지도 시각화

## 1. 주제선정
## 2. 데이터 수집
## 3. 데이터 가공
## 4. 데이터 분석
## 5. 결론 도출

## 2. 데이터 수집

# 공공데이터 포털: https://www.data.go.kr/
# 보건복지부 코로나19 선별진료소 현황

library(readxl)
df <- read_excel("선별진료소_20220216072734.xls")
str(df)
df <- as.data.frame(df)
str(df)

## 3. 데이터 가공

df <- df[, c(2:5)]
str(df)
head(df)

names(df) <- c("city", "sector", "name", "addr")
str(df)

## 4. 데이터 분석

table(df$city)
barplot(table(df$city))

daegu <- df[df$city=="대구", ]
head(daegu)

nrow(daegu)
table(daegu$sector)
barplot(table(daegu$sector))

## 5. 데이터 시각화

# Google MAPs API 키 발급 받기
# https://carrot-woo.tistory.com/15
# https://www.wpgmaps.com/documentation/creating-a-google-maps-api-key/

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
daegu.map <- get_googlemap(c("대구"), maptype = "roadmap", zoom = 11,
                           markers=marker)
ggmap(daegu.map) +
    geom_text(data = daegu.loc, 
              aes(x = lon, y = lat),  
              size = 3, 
              label = daegu.loc$name)

daegu.loc$name
