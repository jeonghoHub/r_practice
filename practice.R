library(readxl)
library(descr)

forest_example_data <- read_excel("D:/download/forest_example_data.xls")

colnames(forest_example_data) <- c("name", "city", "gubun", "area",
                                   "number", "stay", "city_new",
                                   "code", "codename")

stem(forest_example_data$number, scale = 2)

