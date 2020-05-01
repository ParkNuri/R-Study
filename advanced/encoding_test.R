install.packages("data.table")
library("data.table")
# encoding
df <- data.frame(mydata1=1:5,
                 mydata2=letters[1:5],
                 mydata3=c("이민호호","android","R","뉴리","@한글%^&@"))
letters # a~z 모든 값
df
# #### 주석 4개 <- 책갈피

####파일write####
write.csv(df,"encoding_test.csv",row.names = FALSE)
write.csv(df,"encoding_test_euckr.csv",row.names = FALSE, fileEncoding = "euc-kr")
write.csv(df,"encoding_test_utf8.csv",row.names = FALSE, fileEncoding = "utf-8") # csv파일을 액셀로 열때 깨진다.
write.csv(df,"encoding_test_cp949.csv",row.names = FALSE, fileEncoding = "cp949")


####깨진파일 처리하기####
read.csv("encoding_test_utf8.csv")
readLines("encoding_test_utf8.csv") # 깨진 데이터 안보일때 확인
readLines("encoding_test_utf8.csv", encoding = "UTF-8")

#data.table - dataframe보다 강력
dftable <- fread("encoding_test_utf8.csv")
head(dftable) # 문서의 상단 출력. line수 결정 가능

#encoding 함수
Encoding(dftable$mydata3) = "UTF-8"
head(dftable)

