install.packages("tidyverse")
library(tidyverse)


my_data_frame <- 
  read_csv("data.csv") %>% 
select(county, trap, sample_num, sample_date, mosq_count, temp) %>% 
arrange(county, trap, sample_num, sample_date, mosq_count, temp) %>%
  print()
 

my_data_frame <- 
  read_csv("data.csv") %>%
  #select(county) %>% 
  print()

by_mos <- group_by(my_data_frame,mosq_count )
mos <- summarise(by_mos,
                 count = n(),
                 number = mean(mosq_count, na.rm = TRUE)
)
print(mos)



ggplot(data = my_data_frame) +
  geom_histogram(mapping = aes(x = mosq_count), binwidth = 0.5)


ggplot(data = my_data_frame) + 
  geom_point(mapping = aes(x = mosq_count, y = temp)) +
xlab("Mosquito count") +
  ylab("temperature")



 
               
                   