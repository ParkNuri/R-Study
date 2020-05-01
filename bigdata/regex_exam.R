# stringr정규표현식 문자열 관련 lib
library("stringr")
# 패턴
mytext <- "   test$uuu:d"
mytext2 <- "http://cran.r-proj.org"
# str_extract() : 패턴 실행해주는 func
# 기호를 묶어주기 위해 괄호() 사용
# .+()패턴 뒤 제외
str_extract(mytext2,".+(:)")
# ()+.패턴 앞 제외
str_extract(mytext,"(:)+.")
# 패턴과 일치하는 문자를 찾아 일치 문자 바로 전까지 리턴
str_extract(mytext2,".+(?=:)")
# $ : ~로 끝나면. $자체로는 인식 못함. 전방탐색(패턴제외)
str_extract(mytext,".+(?=$)")
# <=\\$로 escape. 전방 탐색 (패턴 포함)
str_extract(mytext,".+(?<=\\$)")

# 후방탐색 (패턴빼고)
str_extract(mytext,"(?<=\\$).*")

# 문자열 관련 함수
# paste - vector를 연결해서 하나의 문자열로 생성
# paste0 - 여러 개를 연결해서
str <- c("java","hadoop", "mongodb")
# paste : 벡터str을 하나의 문자열로 만드는데 collapse로 연결
paste(str, collapse = ",")
# paste0 : 두 문자열 합치기
paste0(mytext,mytext2)
# gsub : 문자열 안의 특정 문자열을 replace
data <- gsub("u"," ",mytext)
data
# str_trim : trim 메소드
str_trim(data)

