# myAnswer
csvdf <- read.csv("csv_exam.csv")
cdf <- data.frame(csvdf)
cdf <- cdf[cdf$science>=80,]
score <- cdf[,3:5]
mytotal <- rowSums(score)
myavg <- rowMeans(score)
cdf <- cbind(cdf,mytotal)
cdf <- cbind(cdf,myavg)
cdf


# solution
mydata <- read.csv("csv_exam.csv")
mydata
mydataResult <- mydata[mydata$science>=80,]
mydataResult
mydataResult[]
mydataResult$mytotal <- as.numeric(mydataResult$math+mydataResult$english+mydataResult$science)
mydataResult
mydataResult$myAvg <- as.numeric(mydataResult$mytotal/3)
write.csv(mydataResult,file = "result.csv")
