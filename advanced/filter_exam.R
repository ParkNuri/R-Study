# Q1
mpg %>% 
  group_by(class) %>% 
  summarise(class_avg = mean(cty))

# Q2
mpg %>% 
  group_by(class) %>% 
  summarise(class_avg = mean(cty)) %>% 
  arrange(desc(class_avg))

# Q3
mpg %>% 
  group_by(hwy) %>% 
  summarise(hwy_avg = mean(hwy)) %>% 
  arrange(desc(hwy_avg)) %>%
  head(3)

# Q4
filter(mpg, class=="compact") %>% 
                 group_by(manufacturer) %>% 
  summarise(carnum=n()) %>% 
  arrange(desc(carnum))
  
