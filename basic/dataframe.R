#dataframe 만들기 -1. matrix를 dataframe으로 변환
dataframeMat1 <- matrix(1:15,ncol=3,byrow = T)
dataframeMat1
mydataframe <- data.frame(dataframeMat1)
mydataframe
dataframeMat1[,1]
mydataframe[,1]

# matrix호 정의된 데이터를 dataframe으로 변경하여 작업하는 경우가 많음
# matrix는 한 타입으로만 선언해야 하므로 한 열의 타입을 변경해도 모든 데이터의 타입이 변경된다.
 
dataframeMat1[,1] <- as.character(dataframeMat1[,1])

str(mydataframe)
#str함수는 dataframe 내부의 데이터형을 볼 수 있는 함수
mydataframe[,1] <- as.character(mydataframe[,1])
str(mydataframe)
mydataframe$X1 # $를 이용해서 열의 이름을 접근할 수 있다.
mydataframe$X2
mydataframe$X3

#dataframe에 열을 추가
col4 <- c(1,1,1,1,1)
mydataframe$X4 <- col4
mydataframe

# 필요한 곳에서 dataframe을 다시 matrix로 변환
dataframeMat2 <- as.matrix(mydataframe)
dataframeMat2




#dataframe 만들기 -2. vector를 여러 개 만들어서 dataframe을 작성
eng <- c(100,99,90)
math <- c(100,99,100)
mydf1 <- data.frame(eng,math)
mydf1
mean(mydf1$eng)
mean(mydf1$math)
#3.dataframe을 직접 정의
mydf2 <- data.frame(eng=c(100,100,100),m=c(90,90,90))
mydf2



m <- matrix(1:15,ncol=3,byrow=T)
m
m <- t(m)
m

d <- data.frame(m)
d
d <- t(d)
d

mydf <- data.frame(제품=c("사과","딸기","수박"),가격=c(1800,1500,3000),판매량=c(24,38,13))
mydf
avgPrice <- mean(mydf$가격)
avgSell <- mean(mydf$판매량)
avgPrice
avgSell
