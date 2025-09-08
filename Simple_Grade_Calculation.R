install.packages('dplyr')
install.packages('ggplot2')


students <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David", "Eva"),
  Marks = c(87, 54, 72, 43, 65)
)

a <- ifelse(students$Marks >= 80, "A", 
            ifelse(60 <= students$Marks & students$Marks < 80, "B", 
                   ifelse(50 <= students$Marks & students$Marks < 60, "C", "D")
                   )
            
)

b <- ifelse(students$Marks >= 50, "Pass", "Fail")

students$Grade <- a

students$Result <- b

students


library(ggplot2)
library(dplyr)

grade_counts <- students %>%
  count(Grade)

ggplot(grade_counts, aes(x = Grade, y = n, fill = Grade)) +
  geom_col(colour = "blue") +
  ggtitle("Students Exam Results") +
  xlab("Grade") +
  ylab("Count") +
  theme(
    axis.title.x = element_text(size = 15, colour = "darkblue"),
    axis.title.y = element_text(size = 15, colour = "blue"),
    plot.title = element_text(size = 20, colour = "black", hjust = 0.5),
    legend.title = element_text(size = 15, colour = "orange")
  )

