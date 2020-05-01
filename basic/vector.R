# =, <- 같은것처름 보이지만 <- 를 이용해서 변수에 데이터 할당
a = 100
b <- 100
a
b
sqrt(9) #절대값
sqrt(x=9) #x는 함수의 매개변수로 인식
x #에러: 객체 'x'를 찾을 수 없습니다
sqrt(x <- 9) #x라는 변수로 활용
x
?c
myvector1 <- c(100,200,300)
myvector1
myvector1[1]
myvector1[2]
myvector1[3]
myvector2 <- c(10,20,30)
myvector2
myvector1+20 # 일괄적으로 더함
myvector2 <- c(10,20,30)
myvector2
myvector1*10
myvector1+myvector2
mytext <- c("java", "R", "hadoop", "android")
mytext[1]
mytext[1,2] #matrix에 사용하므로 벡터에서 쓸 수 없다.
mytext[c(1,2)] #벡터의 1번 요소와 2번요소만 출력
mytext[1:3] #1번~3번까지의 요소 선택
mytext[c(1:3)] # == mytext[1:3]
1:3 # 1~3
1:100 #1~100`
mytext[-1] #1번 빼고 다 출력
mytext[c(-1,-3)] #1번 3번번 빼고 다 출력
mytext[c(-1:-3)] #1~3번 빼고
mytext[-c(1:3)] #==mytext[c(-1:-3)]

#TRUe와 FALSE를 이용해서 작업하기
mytext[c(T,T,F,F)] # 1, 2 출력 true자리만 출력

mytext[mytext=="java"]
numlist <- 1:100
numlist
numlist %%2==0 #%%가 나머지 구하기
numlist[numlist %%2==0] #짝수 구하기
numlist[numlist %%2==1] #홀수 구하기
numlist2 <- seq(1,10) #1~10
numlist2
numlist2 <- seq(1,10,by=2) # 2간격으로
numlist2

v1 <- c(70,80,90,100)
names(v1) # vector의 이름 출력
names(v1) <- c("국어","수학","영어","자바")
v1
length(v1) # 요소의 갯수
mean(v1) #평균리턴
max(v1) #최대
min(v1) #최소

