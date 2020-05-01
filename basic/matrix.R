#행렬
matrix(1:15)
# ?matrix
mymat1 <- matrix(1:15,ncol = 3) # 3열로 표시. default 세로
mymat1
# 1부터 15까지의 값을 3개의 열로 표현. row방향 값ㅇ르 추가
mymat1 <- matrix(1:15,ncol = 3,byrow = T) #가로로
mymat1
mytext # 스크립트들끼리 데이터 공유
# matrix에서 원하는 값을 추출하기
mymat1[2,2] # 행,열
mymat1[3,3] # 행,열
mymat1[1,c(1:3)] # 1행에 1,2,3열
mymat1[1,] # 1행의 모든 열
mymat1[,1] # 1열의 모든 행
# 1행과 3행을 뺀 데이터
mymat1[-c(1,3),]
# 1행과 3행 데이터
mymat1[c(1,3),]
# 미니실습-1 :   2행부터 4행까지 출력 (단, 2,3번컬럼만 출력) <- <- <- <- <- <- <- 
mymat1[c(2:4),c(2,3)]
#cbind : col을 추가하는 함수 - 값이 부족하면 맨 앞의 값이 채워진다.
addmymat1 <- cbind(mymat1,c(1,11,11,111))
addmymat1
addmymat2 <- rbind(mymat1, c(1,2,3,4,5))
addmymat2
colnames(mymat1) <- c("a", "b","c")
mymat1
rownames(mymat1) <- c("r1","r2","r3","r4","r5")
mymat1
mean(mymat1)
