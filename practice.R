library(readxl)
library(ggmap)

xlsdata <- read_excel("D:/download/선별진료소_20231127131449.xls")

daejeon_data <- data_raw[data_raw$state == "대전",]

ggmap_key <- "구글 map API KEY"
register_google(ggmap_key)

daejeon_data <- mutate_geocode(data = daejeon_data,
                               location =addr,
                               source = "google")

daejeon_data_marker <- data.frame(daejeon_data$lon, daejeon_data$lat)

daejeon_map <- get_googlemap("대전", maptype = "roadmap", zoom = 11,
                             markers = daejeon_data_marker)

ggmap(daejeon_map) +
  geom_text(data = daejeon_data,
            aes(x = lon, y = lat),
            size = 3, label = daejeon_data$name)
