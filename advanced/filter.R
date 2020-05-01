# filter
# : 주어진 데이터에서 원하는 데이터만 추출
# - 데이터 정제
# - 이상데이터 잘라내기
# dplyr : 문자열에 대한 작엄에 특화된 기능이 많은 패키지
# => c++로 구현되어 있어 가장 빠르다.
# dplyr 라이브러리는 실행할때 코드 전체를 범위지정해서 실행
library("dplyr")
data("airquality")
head(airquality)
df2 <- airquality
df2

# filtering - 벡터 연산
head(df2[,1:4])
df2_data1 <- df2[1:5,]
df2_data1
# df2$Day==1 을 행에 적으면 해당 조건을 만족하는 행만 보겠다. 열은 모든열
df2[df2$Day==1,]
df2[df2$Day!=1,]
df2[df2$Day<=2,]
df2[df2$Day==1 & df2$Day==2,] # 모순되는 조건
df2[df2$Day==1 | df2$Day==2,]

# %는 or. day가 1~3
df2$Day %in% 1:3

# day가 1~3인 데이터 갯수
sum(df2$Day %in% 1:2)

df2_data2 <- df2[df2$Day %in% 1:2,]
nrow(df2_data2)

# dplyr 패키지에서 지원하는 필터 관련 함수
# Day가 1이면서 Month가 5인 data
filter(df2, Day==1 & Month==5)

filter(df2, Day %in% c(1,3,5))
