# KoNLP : 한글 형태소 분리 라이브러리(지원되지 않는 라이브러리 -> )
install.packages("KoNLP") # 지원 안됨
#### self 추가한 library들 ####
install.packages("Sejong")
install.packages("hash")
install.packages("rJava")
install.packages("tau")
install.packages("RSQLite")
install.packages("devtools")
###############################

library(KoNLP) # install을 사용하지 않았기 때문에 의존모듈을 수동으로 설치해주어야 한다.
library(stringr)

####KoNLP의 함수 테스트 ####
extractNoun("롯데마트가 판매하고 있는 흑마늘 양념 치킨이 논란이 되고 있다.")
SimplePos09("롯데마트가 판매하고 있는 흑마늘 양념 치킨이 논란이 되고 있다.")

convertHangulStringToJamos("롯데마트가 판매하고 있는 흑마늘 양념 치킨이 논란이 되고 있다.")
####분석할 샘플 데이터 로딩####
load("comments.RData")
load("score.RData")

length(comments)
length(score)
head(comments, 10)
head(score, 10)

sampledata <- comments[1:1000]
class(sampledata)

####형태소분석을 하기 위해서 명사 분리####
# 댓글을 분리하면 분리된 명사의 사이즈가 다르므로 list 이용
data_list = list()
for(i in 1:length(sampledata)){
  data <- SimplePos09(sampledata[i])
  data_list[[i]] <- data # 2차원배열
}
data_list[[2]]

# /로 분할 - list의 모든 요소에 저장된 문자열을 /로 분리
#          => n이 있는 문자열의 첫번째 요소 가져오기
# sapply를 이용하면 반복작업을 할 수 있다
sapply(data.frame(test=c(1,2,3,4,5,6),
                  test2=c(3,4,5,6,7,8)), # 반복작업할 데이더
                  function(x){
                    x[1]
                    
                  } # 반복해서 적용할 함수
                  )

# 리스트를 해제
class(unlist(data_list))
wordlist <- sapply(str_split(unlist(data_list), "/"),function(x){
  x[1]
  }) #분리된 단어의 첫번째 글자만

head(wordlist,20)
head(data_list,20)

#table함수를 이용해서 단어의 빈도수를 구하기
#table함수는 vector에 저장되어 있는 모든 단어들의 빈도수를 계산해서 변환 - 단어를 이용해서 변수명으로 사용
tablewordlist <- table(wordlist)
tablewordlist[1]
tablewordlist[89]
names(tablewordlist)

# 분석한 데이터를 이용해서 sort (상위100개)
sort(tablewordlist, decreasing = T)[1:100]
# 분석결과를 가지고 기준을 적용새어 정리 - 한 글자짜리를 빼고
# nchar : 글자수 세는 함수
nchar("글자수")
tablewordlist_result <- tablewordlist[nchar(names(tablewordlist))>1]

tablewordlist_result <- sort(tablewordlist_result, decreasing = T)[1:100]
tablewordlist_result
