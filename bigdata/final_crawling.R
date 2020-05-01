####모두의 광장의 1페이지 : 10페이지의 모든 게시글 크롤링####
# 1. 모든 페이지의 title,hit,url,content 추출하기
# 2. crawl_result.csv, crawl_result.RDate
# 3. mongodb 저장 (300개 저장)
# 4. for, if문 활용

library("stringr")
library("mongolite")

con <- mongo(collection = "crawl",
             db = "bigdata",
             url = "mongodb://127.0.0.1")
contents <- data.frame()
final_data_list = NULL
for (i in 0:9) {
  #페이지마다 연결할 주소가 달라지므로 변수로 처리
  url <-
    paste0("https://www.clien.net/service/group/community?&od=T31&po=",
           i)
  url
  
  url_data <- readLines(url, encoding = "UTF-8")
  url_data
  
  str_detect(url_data, "subject_fixed")
  filter_data <- url_data[str_detect(url_data, "subject_fixed")]
  
  ####title####
  filter_data
  title <- str_extract(filter_data, "(?<=\">).*(?=</span>)")
  title
  
  ####hit####
  filter_data <-
    url_data[str_detect(url_data, "<span class=\"hit\">")]
  filter_data
  
  hit <- str_extract(filter_data, "(?<=\">).*(?=</span>)")[-1]
  hit
  ####url####
  #which(str_detect(url_data,"subject_fixed")) # true인 위치 값 return
  # 위치로 찾아가기
  myurl <- url_data[which(str_detect(url_data, "subject_fixed")) - 3]
  myurl
  url_val <- str_extract(myurl, "(?<=href=\").*(?=\" data-role)")
  # 필요없는 문자열을 잘라내기
  #url_val <- str_sub(url_val,end = -3)
  url_val
  url_val <- paste0("https://www.clien.net", url_val)
  
  content_list = NULL
  for (url_row in 1:length(url_val)) {
    contentdata <- readLines(url_val[url_row], encoding = "UTF-8")
    class(contentdata)
    
    #원하는 데이터 가져오기
    start = which(str_detect(contentdata, "post_content"))
    end = which(str_detect(contentdata, "post_ccls"))
    content_filter_data <- contentdata[start:end]
    content_filter_data
    
    # 데이터 정제하기
    # 1. 벡터로 리턴하므로 한 개로 합치기
    content_filter_data <- paste(content_filter_data, collapse = "")
    content_filter_data
    
    # 2. 불필요한 기호나 태그 없애기
    # 태그 없애기
    content_filter_data <- gsub(pattern = "<.*?>", "", content_filter_data)
    content_filter_data
    
    content_filter_data <- gsub("\t|&nbsp;", "", content_filter_data)
    
    #기존에 저장되어 있는 contentlist의 내용에 추가
    content_list <- c(content_list,content_filter_data)
    #cat("\n",url_row)
    }
  final_data <- cbind(title, hit, url_val, content_list)
  final_data_list <- rbind(final_data_list, final_data)
 #cat("\n outer : ",i)
}


####csv파일로 생성####
write.csv(final_data_list, "page_crawl_data.csv")
save(final_data_list,file="page_crawl_data.RData") # .Rdata : R에서 사용할때 속도가 훨씬 빠르다.
# 개발자도구 > 우클릭 > copy > copy selector
# div_content > div.list_item.notice > div.list_hit
# 사용하기도 함

####mongodb에 저장하기####
class(final_data) # matrix
# dataframe이어야 사용 가능
final_mongo_data <- data.frame(final_data)
if(con$count()>0) {
  con$drop()
}

con$insert(final_mongo_data)