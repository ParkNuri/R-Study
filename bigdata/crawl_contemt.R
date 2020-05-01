load(file = "crawl_data.RData")
final_data
final_data[,3]

library("stringr")
library("mongolite")

#url <- "https://www.clien.net/service/board/park/14745739?combine=true&q=%EA%B0%90%EC%9F%88&p=0&sort=recency&boardCd=&isBoard=false"
url <- "https://www.clien.net/service/board/park/14746011?od=T31&po=0&category=&groupCd=community"

url_data <- readLines(url, encoding = "UTF-8")
url_data

filter_data <- url_data[str_detect(url_data,"<p>")]
filter_data <- filter_data[-which(str_detect(filter_data, "<img")|str_detect(filter_data, "class=\"video\"")|str_detect(filter_data, "<br>"))]
filter_data <- str_extract(filter_data, "(?<=<p>).*(?=</p>)")
filter_data



####answer####



library(stringr)
load(file = "crawl_data.RData")
final_data
url_list <- final_data[,3]
class(url_list)
contentdata <- readLines(url_list[1],encoding = "UTF-8")
class(contentdata)

#원하는 데이터 가져오기
start =which(str_detect(contentdata,"post_content"))
end =which(str_detect(contentdata,"post_ccls"))
content_filter_data <- contentdata[start:end]
content_filter_data

# 데이터 정제하기
# 1. 벡터로 리턴하므로 한 개로 합치기
content_filter_data <- paste(content_filter_data, collapse = "")
content_filter_data

# 2. 불필요한 기호나 태그 없애기
# 태그 없애기
content_filter_data <- gsub(pattern = "<.*?>","",content_filter_data)
content_filter_data

content_filter_data <- gsub("\t|&nbsp;","",content_filter_data)
