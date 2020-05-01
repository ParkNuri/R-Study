####외부데이터 읽어오기####
####csv파일읽기####
# readLines를 이용하면 데이터가 커도 어떤 구성인지 확인하기 편하다
dfimport <- readLines("01_csv.csv",n=3)
dfimport

# csv 파일이므로 ,로 구분이 되어 있지만 사용자가 원하는 구분자를 적용해서 작성한 문자열인 경우
# 01_csv.csv읽은 내용을 가공해서 dataframe 작성
install.packages("splitstackshape")
library("splitstackshape")
dfcsv <- data.frame(num=1:3, 
                    mydata=dfimport, 
                    stringsAsFactors = F)
dfcsv
dfcsv$mydata #컬럼안의 문자열이 ,가 추가
strsplit(dfcsv$mydata,split = ",")[[1]] # ,로 분리는 되지만 list로 결과가 리턴되어 불편
strsplit(dfcsv$mydata,split = ",")[[2]]

# 하나의 컬럼안에 구분자로 텍스트가 구성된 경우
dfcsv2 <- cSplit(indt = dfcsv, splitCols = "mydata", sep = ",")
dfcsv2
class(dfcsv2)

# 타입 변경
# as의 함수들을 이용해서 변경 as는 ~~~가 아닌 것을 ~~~로 변경한다는 의미 - data.table과 data.frame의 속성을 갖고 있는 dfcsv2를 dataframe으로 변경
dfcsv2 <- as.data.frame(dfcsv2)
class(dfcsv2) #타입을 확인
class(dfcsv2$num)
class(dfcsv2$mydata_1)
class(dfcsv2$mydata_2)
class(dfcsv2$mydata_3)
class(dfcsv2$mydata_4)
class(dfcsv2$mydata_5)
str(dfcsv2) # 전체 데이터의 구조를 확인
# 변환한 데이터들의 타입이 Factor
# Factor는 순서와 명목형
# 1,2,3,.....의 값이 어떤 순서를 의미하는 경우 : 컬럼의 데이터가 순서형
# class 컬럼 1,2,3,4,...:순서를 의미하지 않고 1반,2반,3반,...
# 순서가 적용되도록 정의된 Factor타입을 char로 변경

# 1번 컬럼을 뺀 나머지 컬럼의 타입을 char로 변환
for(i in 2:ncol(dfcsv2)){
  dfcsv2[,i] = as.character(dfcsv2[,i])
}
str(dfcsv2)

####tsv파일읽기####
# tab으로 구분된 파일(\t)
df3 <- read.delim("02_tsv.txt",sep = "\t")
head(df3)

####xml파일읽기####
install.packages("XML")
library("XML")
dfxml <- xmlTreeParse("03_xml.xml")
dfxml

# root element만 추출
dfxml <- xmlRoot(dfxml) # xml태그만 추출

# xml에 있는 모든 태그의 name과 value를 추출
# xxxApply : for func / xmls : xml들을 반복작업 (2회)
dfxml <- xmlSApply(dfxml,function(x){xmlSApply(x,xmlValue)})
dfxml
dfxml <- data.frame(t(dfxml),row.names = NULL)
dfxml

####xlsx파일읽기####
install.packages("readxl")
library("readxl")
dfxlsx <- read_xlsx("07_xlsx.xlsx")
dfxlsx #tibble -> data.frame과 비슷한 다른 종류의 library

####sample####
set.seed(1222) # 1222는 발생된 랜덤수의 키값 정의(사용자 정의)
a <- sample(1:10,size = 3, replace = T) # random 숫자 생성. sample(범위, 갯수, 중복허용)
a


set.seed(1221)
ifdf <- data.frame(mynum=1:6,myval=sample(c("spring","bigdata","android"),size = 6, replace = T))
ifdf

# myVal의 값이 spring이면 프로젝트 완료, bigdata이면 할꺼야
for (i in 1:nrow(ifdf)) {
  if(ifdf[i,"myval"]=="spring"){
    ifdf[i,"info"] <- "프로젝트 완료"
  }else{
    ifdf[i,"info"] <- "할꺼야"
  }
}
ifdf
# => 데이터 양이 많을땐 속도가 느려져 성능이 저하됨
# 그래서 제공하는 함수!
# 함수를 이용해서 작업하기 - info2
ifdf$info2 <- ifelse(test = ifdf$myval=="spring", yes = "쉽다",no = "어렵다")# 삼항연산자 느낌쓰
ifdf

# 조건이 2개 이상일 경우 처리
ifdf[,"info3"] <- ifelse(test = ifdf$myval=="spring",yes = "쉽다", no = ifelse(test = ifdf$myval=="bigdata",yes = "머신셋팅", no="device셋팅완료"))
ifdf



b <- sample(1:10,size = 3, replace = T) # random 숫자 생성. sample(범위, 갯수, 중복허용)
b
