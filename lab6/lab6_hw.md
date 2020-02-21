---
title: "Lab 6 Homework"
author: "Nicholas Tobia"
date: "02/20/2020"
output:
  html_document: 
    keep_md: yes
    theme: spacelab
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for any included code chunks to run.  

## Libraries

```r
library(tidyverse)
```

## Resources
The idea for this assignment came from [Rebecca Barter's](http://www.rebeccabarter.com/blog/2017-11-17-ggplot2_tutorial/) ggplot tutorial so if you get stuck this is a good place to have a look.  

## Gapminder
For this assignment, we are going to use the dataset [gapminder](https://cran.r-project.org/web/packages/gapminder/index.html). Gapminder includes information about economics, population, and life expectancy from countries all over the world. You will need to install it before use. This is the same data that we used for the practice midterm. You may want to load that assignment for reference.  

```r
#install.packages("gapminder")
library("gapminder")
```

## Questions
The questions below are open-ended and have many possible solutions. Your approach should, where appropriate, include numerical summaries and visuals. Be creative; assume you are building an analysis that you would ultimately present to an audience of stakeholders. Feel free to try out different `geoms` if they more clearly present your results.  

**1. Use the function(s) of your choice to get an idea of the overall structure of the data frame, including its dimensions, column names, variable classes, etc. As part of this, determine how NAs are treated in the data.**  

```r
glimpse(gapminder)
```

```
## Observations: 1,704
## Variables: 6
## $ country   <fct> Afghanistan, Afghanistan, Afghanistan, Afghanistan, Afgha...
## $ continent <fct> Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asi...
## $ year      <int> 1952, 1957, 1962, 1967, 1972, 1977, 1982, 1987, 1992, 199...
## $ lifeExp   <dbl> 28.801, 30.332, 31.997, 34.020, 36.088, 38.438, 39.854, 4...
## $ pop       <int> 8425333, 9240934, 10267083, 11537966, 13079460, 14880372,...
## $ gdpPercap <dbl> 779.4453, 820.8530, 853.1007, 836.1971, 739.9811, 786.113...
```

```r
anyNA(gapminder)
```

```
## [1] FALSE
```


**2. Among the interesting variables in gapminder is life expectancy. How has global life expectancy changed between 1952 and 2007?**
The global life expectancy has increased between 1952 and 2007


```r
global_life_exp <- gapminder %>% 
  select(country, year, lifeExp) %>% 
  filter(year >= 1952 & year <=2007) %>% 
  group_by(year) %>% 
  summarise(lifeExp_avg = mean(lifeExp)) %>% 
  ggplot(aes(x= year, y= lifeExp_avg))+
  geom_bar(stat = "identity")+
  labs(title = "Global Life Expectancy [1952 and 2007]",
       x = "Years",
       y = "Global Life Expectancy")+
  theme(plot.title = element_text(size = 20, hjust = .5, face = "bold"))

global_life_exp
```

![](lab6_hw_files/figure-html/unnamed-chunk-4-1.png)<!-- -->


**3. How do the distributions of life expectancy compare for the years 1952 and 2007? _Challenge: Can you put both distributions on a single plot?_**


```r
gapminder %>% 
  group_by(year) %>% 
  filter(year == "1952" | year == "2007") %>% 
  ggplot(aes(x= year, y = lifeExp, group = year))+
  geom_boxplot()+
  labs(title = "Global Life Expectancy in 1952 and 2007",
       x = "Year",
       y = "Life Expectancy")+
  theme(plot.title = element_text(size = rel(1.5), hjust = 0.5))
```

![](lab6_hw_files/figure-html/unnamed-chunk-5-1.png)<!-- -->


**4. Your answer above doesn't tell the whole story since life expectancy varies by region. Make a summary that shows the min, mean, and max life expectancy by continent for all years represented in the data.**

```r
lifeExp_region <- gapminder %>% 
  select(continent, country,year,lifeExp) %>% 
  group_by(continent, year) %>% 
  summarise(lifeExp_min = min(lifeExp),
            lifeExp_mean = mean(lifeExp),
            lifeExp_max = max(lifeExp))
```


```r
gapminder %>% 
  ggplot(aes(x = continent, y = lifeExp, group=continent, fill = continent))+
  geom_boxplot()+
  labs(title = "Global Life Expectancy [Continent]",
       x = "Continent",
       y = "Life Expectancy")+
  theme(plot.title = element_text(size = rel(2), hjust = 0.5))
```

![](lab6_hw_files/figure-html/unnamed-chunk-7-1.png)<!-- -->


**5. How has life expectancy changed between 1952-2007 for each continent? Try using `geom_line()` for this, including all continents on the same  plot.**

```r
lifeExp_region %>% 
  ggplot(aes(x = year, y = lifeExp_mean, color = continent))+
  geom_line()+
  labs(title = "Group Life Expectancy [Continent]",
       x = "Year",
       y = "Life Expectancy")+
  scale_x_continuous(breaks = seq(1950, 2010, by = 5), limits = c(1950,2010))+
  scale_y_continuous(breaks= seq(30,85, by=10), limits = c(30,85))+
  
  theme(plot.title = element_text(size = 20, face="bold", vjust = 3.5, margin = margin(t=15)))
```

![](lab6_hw_files/figure-html/unnamed-chunk-8-1.png)<!-- -->

**6. We are interested in the relationship between per capita GDP and life expectancy; i.e. does having more money help you live longer?**

```r
gapminder %>% 
  select(country, continent, year, lifeExp, gdpPercap) %>%
  ggplot(aes(x=gdpPercap, y=lifeExp, color = continent))+
  geom_jitter()+
  labs(
    title= "GDP Per Capita vs Life Expectancy",
    x= "Countries GDP per capita",
    y= "Life Expectancy (years)")
```

![](lab6_hw_files/figure-html/unnamed-chunk-9-1.png)<!-- -->



**7. There is extreme disparity in per capita GDP. Rescale the x axis to make this easier to interpret. How would you characterize the relationship?**

```r
gapminder %>% 
  select(country, continent, year, lifeExp, gdpPercap,) %>%
  ggplot(aes(x=gdpPercap, y=lifeExp, color = continent))+geom_point()+
  labs(
    title= "GDP Per Capita vs Life Expectancy",
    x= "log(GDP Per Capita)",
    y= "Life Expectancy (years)")+
  scale_x_log10()
```

![](lab6_hw_files/figure-html/unnamed-chunk-10-1.png)<!-- -->


**8. Which countries have had the largest population growth since 1952?**

```r
country_pop_growth <- gapminder %>% 
  filter(year >= 1952) %>% 
  group_by(country) %>% 
  summarise(min_pop = min(pop),
            max_pop = max(pop),
            pop_growth = max_pop-min_pop) %>% 
  arrange(desc(pop_growth)) %>% 
  head(n = 5)
```


**9. Use your results from the question above to plot population growth for the top five countries since 1952.**

```r
gapminder %>% 
  filter(country == "China" | country == "India" | country == "United States" | country == "Indonesia" | country == "Brazil" ) %>% 
  ggplot(aes(x = year, y = pop, color = country))+
  geom_line()+
  labs(title = "Countries with Largest Population Growth since 1952",
       x = "Year",
       y = "population")+
  theme(plot.title = element_text(size = rel(1.5), hjust = 0.5))
```

![](lab6_hw_files/figure-html/unnamed-chunk-12-1.png)<!-- -->


**10. How does per capita GDP growth compare between these same five countries?**

```r
gapminder %>% 
  filter(country == "China" | country == "India" | country == "United States" | country == "Indonesia" | country == "Brazil" ) %>% 
  ggplot(aes(x = year, y = gdpPercap, color = country)) +
  geom_line() +
  labs(title = "GDP of Countries with Largest Population Growth since 1952",
       x = "Year",
       y = "GDP Per Capita")+ 
  theme(plot.title = element_text(size = rel(1.5), hjust = 0.5))
```

![](lab6_hw_files/figure-html/unnamed-chunk-13-1.png)<!-- -->


## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences. 
