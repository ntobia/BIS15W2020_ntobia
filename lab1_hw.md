---
title: "Lab 1 Homework"
author: "Nicholas Tobia"
date: "Winter 2020"
output:
  html_document:
    keep_md: yes
    theme: spacelab
---

## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code, keep track of your versions using git, and push your final work to our [GitHub repository](https://github.com/FRS417-DataScienceBiologists). I will randomly select a few examples of student work at the start of each session to use as examples so be sure that your code is working to the best of your ability.  

1. Navigate to the R console and calculate the following expressions.  
  + 5 - 3 * 2 = -1  
  + 8 / 2 ** 2 = 2 
  
2. Did any of the results in #1 surprise you? Write two programs that calculate each expression such that the result for the first example is 4 and the second example is 16.  

```r
x <- (5-3)*2
y <- (8/2)^2
```

3. Make a new object `pi` as 3.14159265359.  

```r
pi <- 3.14159265359
```
4. Is `pi` an integer or numeric? Why? Show your code.  

Pi is numeric because it is not a whole number and therefore cannot be an integer

```r
class(pi)
```

```
## [1] "numeric"
```
5. You have decided to use your new analytical powers in R to become a professional gambler. Here are your winnings and losses this week. Note that you don't gamble on the weekends!  

```r
blackjack <- c(140, -20, 70, -120, 240, NA, NA)
roulette <- c(60, 50, 120, -300, 10, NA, NA)
```

a. Build a new vector called `days` for the days of the week. 

```r
days <- c("Monday", "Tuesday", "Wednesday", "Thrusday", "Friday", "Saturday", "Sunday")
```

We will use `days` to name the elements in the poker and roulette vectors.

```r
names(blackjack) <- days
names(roulette) <- days
```

b. Calculate how much you won or lost in blackjack over the week.  

```r
sum(blackjack)
```

c. What is your interpretation of this result? What do you need to do to address the problem? Recalculate how much you won or lost in blackjack over the week.  

My results were inconclusive because I had the weekend, which I do not gamble giving me NA. Therefore I need to omit saturday and sunday. I won $310.

```r
blackjack1 <- na.omit(blackjack)
sum(blackjack1)
```

d. Calculate how much you won or lost in roulette over the week.  

I lost $60

```r
roulette1 <- na.omit(roulette)
sum(roulette1)
```

e. Build a `total_week` vector to show how much you lost or won on each day over the week. Which days seem lucky or unlucky for you?

Thursday seems to be unlucky, and every other day seems to be lucky.

```r
total_week <- c(blackjack1+roulette1)
```


f. Should you stick to blackjack or roulette? Write a program that verifies this below.  

I should stick to blackjack.

```r
sum(blackjack1) > sum(roulette1)
```

## Push your final code to GitHub
