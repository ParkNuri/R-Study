library("dplyr")
exam <- read.csv("csv_exam.csv")
exam
# %>% : chaining method. 연산 결과를 바로 가공. 연산 결과를 바로 보여줌. 전체보기에서 조건 적용
# chaining 결과를 grouping 할때 문제가 발생할 수 있다.
# ctrl + shift + m

# filter : 조건을 정의
exam %>% 
  filter(class==1) %>% 
  filter(math>=50)

exam %>% 
  filter(class==1) %>% 
  select(math,id,english)
  
# select
# math 컬럼 제외
exam %>% select(-math)
exam %>% select(id,math)

# arrange
# id 순으로 정렬
exam %>% arrange(id)
exam %>% arrange(desc(id))
exam %>% arrange(class,desc(english))

# mutate - 파생변수 추가하기 (원본에 없는 컬럼 추가)
exam %>% 
  mutate(total=math+english+science) %>% 
  head()

# 여러 컬럼 추가
exam %>% 
  mutate(total=math+english+science, mean = total/3) %>%
  head()

# ifelse 사용 가능
exam %>% 
  mutate(total=math+english+science, 
         mean = total/3,
         info = ifelse(science>=70,"통과","재시험")) %>%
  head()

exam %>% 
  group_by(class) %>% 
  summarise(math_sum = sum(math),
            math_mean = mean(math),
            math_median = median(math),
            math_count = n())

test1 <- data.frame(id=c(1,2,3,4,5), mid_jumsu=c(77,56,99,100,99))
test2 <- data.frame(id=c(1,2,3,4,5), final_jumsu=c(77,56,99,100,99))

test1
test2

namedata <- data.frame(class=c(1,2,3,4,5), teacher=c("kim","lee","park","jang","hong"))
str(namedata)
exam

# columns join
exam_new <- left_join(exam, namedata, by="class")
exam_new

# exam_new2 <- bind_cols()

# rows join 
# usecase : 매일매일 가져오는 크롤링 데이터
groupA <- data.frame(id=c(1,2,3,4,5), mid_jumsu=c(77,56,99,100,99))
groupB <- data.frame(id=c(6,7,8,9,10), mid_jumsu=c(77,56,99,100,99))

group_total <- bind_rows(groupA,groupB)
group_total
