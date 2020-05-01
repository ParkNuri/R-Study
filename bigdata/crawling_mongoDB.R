install.packages("mongolite")
library("stringr")
library("mongolite")

####mongodb에 저장하기 위해서는 크롤링해야 한다.####
con <- mongo(collection = "crawl", 
             db = "bigdata", 
             url = "mongodb://127.0.0.1")

####웹크롤링####
url <- "https://www.clien.net/service/group/community?&od=T31&po=0"
url_data <- readLines(url, encoding = "UTF-8")
url_data
#정보확인#
#class(url_data) # character type
#length(url_data) # 2033
#head(url_data)
#tail(url_data)
#url_data[200]

# 조건에 만족하는 데이터 필터링
####크롤링한 데이터 필터링####
####title####
# 1. str_detect(pattern을 검사할  str, pattern) 이용해서 웹페이지 전체에서 필요한 데이터만 먼저 추출
str_detect(url_data,"subject_fixed")
filter_data <- url_data[str_detect(url_data, "subject_fixed")]

filter_data
# 2. 추출한 데이터
title <- str_extract(filter_data, "(?<=\">).*(?=</span>)")
title

####hit####
filter_data <- url_data[str_detect(url_data,"<span class=\"hit\">")]
filter_data

hit <- str_extract(filter_data, "(?<=\">).*(?=</span>)")[-1]
hit
####url####
#which(str_detect(url_data,"subject_fixed")) # true인 위치 값 return
# 위치로 찾아가기
myurl <- url_data[which(str_detect(url_data,"subject_fixed"))-3]
myurl
url_val <- str_extract(myurl, "(?<=href=\").*(?=\" data-role)")
# 필요없는 문자열을 잘라내기
#url_val <- str_sub(url_val,end = -3)
url_val
url_val <- paste0("https://www.clien.net",url_val)
  
####csv파일로 생성####
final_data <- cbind(title,hit,url_val)
write.csv(final_data,"crawl_data.csv")
save(final_data,file="crawl_data.RData") # .Rdata : R에서 사용할때 속도가 훨씬 빠르다.
length(title)
length(hit)

# 개발자도구 > 우클릭 > copy > copy selector
# div_content > div.list_item.notice > div.list_hit
# 사용하기도 함

####mongodb에 저장하기####
class(final_data) # matrix 
# dataframe이어야 사용 가능
final_data <- data.frame(final_data)
if(con$count()>0) {
  con$drop()
}

con$insert(final_data)

