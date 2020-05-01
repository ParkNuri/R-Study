#### apply ####

data(package="MASS")
library(MASS)
data("Boston")
head(Boston)
t(t(colnames(Boston)))
df <- head(Boston[,1:7])
df

# 반복작업을 할 때 사용할 수 있도록 함수를 지원
# margin :1 => 행방향, 2:열방향
df[,"total"] <- apply(X = df, MARGIN = 1, FUN = "sum")
df[,"avg"] <- apply(X = df, MARGIN = 1, FUN = "mean")

df

round(apply(X = df, MARGIN = 2, FUN = "sum"),4)
round(apply(X = df, MARGIN = 2, FUN = "mean"),4)

# sapply : apply의 margin속성을 2로 정의
sapply(X = df, FUN = "mean")
t(t(sapply(X = df, FUN = "class"))) # 모든 열의 class출력


# crawl
# - 웹페이지에서 데이터를 추출()