# Nguyen Hoang Anh
# John Abbott College, Montreal, CANADA.
# Github: https://github.com/hirumaakane-ha/r-project-2019
# License: MIT License
# Course: Statistics
# Instructor: Luiz T. Kazuo
# This R program and its repository on Github is a course project. This project is built upon the MRCA (Most Recent Common Ancestors) paper by Dr. Chang (Yale University) et al. 
# A copy of Dr. Chang's paper could also be found in this repository.

# Prerequisites
## Details can be found in README.md

# Install & load pacman
install.packages("pacman")
require(pacman)
# Use pacman to install and require other packages
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, 
               ggvis, httr, lubridate, plotly, rio, rmarkdown, shiny, 
               stringr, tidyr) 

### Exercise 1: Simulating Probabilities

# (a) Rolling a die
#(i) 12-sided die, 500 times, pie chart 

die <- (1:12)
dieRoll <- sample(die, 500, replace=TRUE)
tb <- table(dieRoll)
piepercent <- round(100*dieRoll/sum(dieRoll), 1)
pie(tb, labels=(1:12), radius=1, col=rainbow(12))
barplot(tb, xlab="Roll", ylab="Freq")

# (ii) 12-sided die, 500 times, pie chart, 1 is x3 more likely

die <- (1:12)
probability <- c(0.3, rep(0.1, 11))
dieRoll <- sample(die,500,replace=TRUE, prob=probability)
tb <- table(dieRoll)
pie(tb, labels=(1:12), radius=1, col=rainbow(12))          

# (iii) 2x(12-sided dice), 10000 times, P(sum=10)=?

die <- (1:12)
fair_prob <- rep(0.1,12)
dieRoll1 <- sample(die, 10000, replace=TRUE, prob=fair_prob)
dieRoll2 <- sample(die, 10000, replace=TRUE, prob=fair_prob)
sumn <- function(){
  counter <- 0
  for (i in 1:10000){
    if ((dieRoll1[i] + dieRoll2[i]) == 10){
      counter = counter + 1
    }
    i = i + 1
  }
  return(counter)
}
desiredoutcomes <- sumn()
estprob <- c(desiredoutcomes/10000)
estprob

# (b) Playing the lottery

# 4
play_lotto <- function(){
  n <- 0
  ticket <- c(6,9,4,2,1,24) # here
  draw <- c(0,0,0,0,0,0) # init vect that will contain the numbers drawn
  while (!all(ticket==draw)){
    n <- n+1
    draw <- sample(1:49, 6, replace=FALSE)
    print(draw)
  }
  return(n)
}
play_lotto()
###########
# 6
play_lotto <- function(){
  n <- 0
  ticket <- c(6,9,4,2) # here
  draw <- c(0,0,0,0) # init vect that will contain the numbers drawn
  while (!all(ticket==draw)){
    n <- n+1
    draw <- sample(1:49, 4, replace=FALSE)
    print(draw)
  }
  return(n)
}
play_lotto()

##########

### Exercise 1: Simulating Probabilities

# Clear screen
cat('\014')
