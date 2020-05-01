#matrix
score <- c(80,90,70,100,80,99,78,72,90,78,82,78,99,89,78,90)
score <- matrix(score,nrow = 4,byrow = T)
score
colnames(score)<-c("국어","영어","과학","수학")
rownames(score) <- c("kim","lee","hong","jang")
score
m1 <- score
for(i in 1:4){
  avg_name[i] <- mean(score[i,])
}
avg_name

for(i in 1:4){
  avg_subject[i] <- mean(score[,i])
}
avg_subject
m1
