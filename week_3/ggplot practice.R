install.packages("ggplot2")

library(ggplot2)
mtcars
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_line() + geom_point()

pressure
ggplot(pressure, aes(x=temperature, y=pressure)) + geom_point() + geom_line()

iris
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + geom_point() + geom_line()

diamonds
ggplot(diamonds, aes(x=cut)) + geom_bar()
ggplot(diamonds, aes(x=color)) + geom_bar()
ggplot(diamonds, aes(x=cut, y=depth)) + geom_boxplot()

airquality
hist(airquality$Month, main="Histogram of Month", xlab="Month",  ylab="Frequency")
boxplot(formula = Ozone ~ Month, data = airquality, xlab = "Month", ylab = "Ozone (ppb)", col ="gray")  

getwd()
setwd()
