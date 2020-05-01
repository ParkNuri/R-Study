#csv는 기본 패키지로 사용가능
#csv 읽기
mdf <- read.csv("csv_exam.csv")
mdf
mdf[2,]

#dataframe에서 조건에 만족하는 데이터를 조회
m <- matrix(1:20,ncol = 4)
m
d <- data.frame(m)
d
myresult <- d[d$X3>=13,]
myresult

#조건에 만족하는 데이터를 result.csv로 저장
write.csv(myresult,file = "result.csv")
