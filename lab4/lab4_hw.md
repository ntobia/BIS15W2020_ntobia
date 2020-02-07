---
title: "Lab 4 Homework"
author: "Please Add Your Name Here"
date: "Please Add the Date Here"
output:
  html_document: 
    keep_md: yes
    theme: spacelab
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove any `#` for included code chunks to run.  

## Load the tidyverse




```r
library(tidyverse)
```

For this assignment we are going to work with a large dataset from the [United Nations Food and Agriculture Organization](http://www.fao.org/about/en/) on world fisheries. First, load the data.  

1. Load the data `FAO_1950to2012_111914.csv` as a new object titled `fisheries`.

```r
fisheries <- readr::read_csv("data/FAO_1950to2012_111914.csv")
```

```
## Parsed with column specification:
## cols(
##   .default = col_character(),
##   `ISSCAAP group#` = col_double(),
##   `FAO major fishing area` = col_double()
## )
```

```
## See spec(...) for full column specifications.
```

```r
fisheries
```

```
## # A tibble: 17,692 x 71
##    Country `Common name` `ISSCAAP group#` `ISSCAAP taxono~ `ASFIS species#`
##    <chr>   <chr>                    <dbl> <chr>            <chr>           
##  1 Albania Angelsharks,~               38 Sharks, rays, c~ 10903XXXXX      
##  2 Albania Atlantic bon~               36 Tunas, bonitos,~ 1750100101      
##  3 Albania Barracudas n~               37 Miscellaneous p~ 17710001XX      
##  4 Albania Blue and red~               45 Shrimps, prawns  2280203101      
##  5 Albania Blue whiting~               32 Cods, hakes, ha~ 1480403301      
##  6 Albania Bluefish                    37 Miscellaneous p~ 1702021301      
##  7 Albania Bogue                       33 Miscellaneous c~ 1703926101      
##  8 Albania Caramote pra~               45 Shrimps, prawns  2280100117      
##  9 Albania Catsharks, n~               38 Sharks, rays, c~ 10801003XX      
## 10 Albania Common cuttl~               57 Squids, cuttlef~ 3210200202      
## # ... with 17,682 more rows, and 66 more variables: `ASFIS species name` <chr>,
## #   `FAO major fishing area` <dbl>, Measure <chr>, `1950` <chr>, `1951` <chr>,
## #   `1952` <chr>, `1953` <chr>, `1954` <chr>, `1955` <chr>, `1956` <chr>,
## #   `1957` <chr>, `1958` <chr>, `1959` <chr>, `1960` <chr>, `1961` <chr>,
## #   `1962` <chr>, `1963` <chr>, `1964` <chr>, `1965` <chr>, `1966` <chr>,
## #   `1967` <chr>, `1968` <chr>, `1969` <chr>, `1970` <chr>, `1971` <chr>,
## #   `1972` <chr>, `1973` <chr>, `1974` <chr>, `1975` <chr>, `1976` <chr>,
## #   `1977` <chr>, `1978` <chr>, `1979` <chr>, `1980` <chr>, `1981` <chr>,
## #   `1982` <chr>, `1983` <chr>, `1984` <chr>, `1985` <chr>, `1986` <chr>,
## #   `1987` <chr>, `1988` <chr>, `1989` <chr>, `1990` <chr>, `1991` <chr>,
## #   `1992` <chr>, `1993` <chr>, `1994` <chr>, `1995` <chr>, `1996` <chr>,
## #   `1997` <chr>, `1998` <chr>, `1999` <chr>, `2000` <chr>, `2001` <chr>,
## #   `2002` <chr>, `2003` <chr>, `2004` <chr>, `2005` <chr>, `2006` <chr>,
## #   `2007` <chr>, `2008` <chr>, `2009` <chr>, `2010` <chr>, `2011` <chr>,
## #   `2012` <chr>
```


2. What are the names of the columns? Do you see any potential problems with the column names?

Some of the names are easy to mess up.
Some of the column names are variables, specifically 1950 -> 2012


```r
colnames(fisheries)
```

```
##  [1] "Country"                 "Common name"            
##  [3] "ISSCAAP group#"          "ISSCAAP taxonomic group"
##  [5] "ASFIS species#"          "ASFIS species name"     
##  [7] "FAO major fishing area"  "Measure"                
##  [9] "1950"                    "1951"                   
## [11] "1952"                    "1953"                   
## [13] "1954"                    "1955"                   
## [15] "1956"                    "1957"                   
## [17] "1958"                    "1959"                   
## [19] "1960"                    "1961"                   
## [21] "1962"                    "1963"                   
## [23] "1964"                    "1965"                   
## [25] "1966"                    "1967"                   
## [27] "1968"                    "1969"                   
## [29] "1970"                    "1971"                   
## [31] "1972"                    "1973"                   
## [33] "1974"                    "1975"                   
## [35] "1976"                    "1977"                   
## [37] "1978"                    "1979"                   
## [39] "1980"                    "1981"                   
## [41] "1982"                    "1983"                   
## [43] "1984"                    "1985"                   
## [45] "1986"                    "1987"                   
## [47] "1988"                    "1989"                   
## [49] "1990"                    "1991"                   
## [51] "1992"                    "1993"                   
## [53] "1994"                    "1995"                   
## [55] "1996"                    "1997"                   
## [57] "1998"                    "1999"                   
## [59] "2000"                    "2001"                   
## [61] "2002"                    "2003"                   
## [63] "2004"                    "2005"                   
## [65] "2006"                    "2007"                   
## [67] "2008"                    "2009"                   
## [69] "2010"                    "2011"                   
## [71] "2012"
```


3. What is the structure of the data? Show the classes of each variable.

```r
str(fisheries)
```

```
## Classes 'spec_tbl_df', 'tbl_df', 'tbl' and 'data.frame':	17692 obs. of  71 variables:
##  $ Country                : chr  "Albania" "Albania" "Albania" "Albania" ...
##  $ Common name            : chr  "Angelsharks, sand devils nei" "Atlantic bonito" "Barracudas nei" "Blue and red shrimp" ...
##  $ ISSCAAP group#         : num  38 36 37 45 32 37 33 45 38 57 ...
##  $ ISSCAAP taxonomic group: chr  "Sharks, rays, chimaeras" "Tunas, bonitos, billfishes" "Miscellaneous pelagic fishes" "Shrimps, prawns" ...
##  $ ASFIS species#         : chr  "10903XXXXX" "1750100101" "17710001XX" "2280203101" ...
##  $ ASFIS species name     : chr  "Squatinidae" "Sarda sarda" "Sphyraena spp" "Aristeus antennatus" ...
##  $ FAO major fishing area : num  37 37 37 37 37 37 37 37 37 37 ...
##  $ Measure                : chr  "Quantity (tonnes)" "Quantity (tonnes)" "Quantity (tonnes)" "Quantity (tonnes)" ...
##  $ 1950                   : chr  NA NA NA NA ...
##  $ 1951                   : chr  NA NA NA NA ...
##  $ 1952                   : chr  NA NA NA NA ...
##  $ 1953                   : chr  NA NA NA NA ...
##  $ 1954                   : chr  NA NA NA NA ...
##  $ 1955                   : chr  NA NA NA NA ...
##  $ 1956                   : chr  NA NA NA NA ...
##  $ 1957                   : chr  NA NA NA NA ...
##  $ 1958                   : chr  NA NA NA NA ...
##  $ 1959                   : chr  NA NA NA NA ...
##  $ 1960                   : chr  NA NA NA NA ...
##  $ 1961                   : chr  NA NA NA NA ...
##  $ 1962                   : chr  NA NA NA NA ...
##  $ 1963                   : chr  NA NA NA NA ...
##  $ 1964                   : chr  NA NA NA NA ...
##  $ 1965                   : chr  NA NA NA NA ...
##  $ 1966                   : chr  NA NA NA NA ...
##  $ 1967                   : chr  NA NA NA NA ...
##  $ 1968                   : chr  NA NA NA NA ...
##  $ 1969                   : chr  NA NA NA NA ...
##  $ 1970                   : chr  NA NA NA NA ...
##  $ 1971                   : chr  NA NA NA NA ...
##  $ 1972                   : chr  NA NA NA NA ...
##  $ 1973                   : chr  NA NA NA NA ...
##  $ 1974                   : chr  NA NA NA NA ...
##  $ 1975                   : chr  NA NA NA NA ...
##  $ 1976                   : chr  NA NA NA NA ...
##  $ 1977                   : chr  NA NA NA NA ...
##  $ 1978                   : chr  NA NA NA NA ...
##  $ 1979                   : chr  NA NA NA NA ...
##  $ 1980                   : chr  NA NA NA NA ...
##  $ 1981                   : chr  NA NA NA NA ...
##  $ 1982                   : chr  NA NA NA NA ...
##  $ 1983                   : chr  NA NA NA NA ...
##  $ 1984                   : chr  NA NA NA NA ...
##  $ 1985                   : chr  NA NA NA NA ...
##  $ 1986                   : chr  NA NA NA NA ...
##  $ 1987                   : chr  NA NA NA NA ...
##  $ 1988                   : chr  NA NA NA NA ...
##  $ 1989                   : chr  NA NA NA NA ...
##  $ 1990                   : chr  NA NA NA NA ...
##  $ 1991                   : chr  NA NA NA NA ...
##  $ 1992                   : chr  NA NA NA NA ...
##  $ 1993                   : chr  NA NA NA NA ...
##  $ 1994                   : chr  NA NA NA NA ...
##  $ 1995                   : chr  "0 0" "1" NA "0 0" ...
##  $ 1996                   : chr  "53" "2" NA "3" ...
##  $ 1997                   : chr  "20" "0 0" NA "0 0" ...
##  $ 1998                   : chr  "31" "12" NA NA ...
##  $ 1999                   : chr  "30" "30" NA NA ...
##  $ 2000                   : chr  "30" "25" "2" NA ...
##  $ 2001                   : chr  "16" "30" NA NA ...
##  $ 2002                   : chr  "79" "24" NA "34" ...
##  $ 2003                   : chr  "1" "4" NA "22" ...
##  $ 2004                   : chr  "4" "2" "2" "15" ...
##  $ 2005                   : chr  "68" "23" "4" "12" ...
##  $ 2006                   : chr  "55" "30" "7" "18" ...
##  $ 2007                   : chr  "12" "19" NA NA ...
##  $ 2008                   : chr  "23" "27" NA NA ...
##  $ 2009                   : chr  "14" "21" NA NA ...
##  $ 2010                   : chr  "78" "23" "7" NA ...
##  $ 2011                   : chr  "12" "12" NA NA ...
##  $ 2012                   : chr  "5" "5" NA NA ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   Country = col_character(),
##   ..   `Common name` = col_character(),
##   ..   `ISSCAAP group#` = col_double(),
##   ..   `ISSCAAP taxonomic group` = col_character(),
##   ..   `ASFIS species#` = col_character(),
##   ..   `ASFIS species name` = col_character(),
##   ..   `FAO major fishing area` = col_double(),
##   ..   Measure = col_character(),
##   ..   `1950` = col_character(),
##   ..   `1951` = col_character(),
##   ..   `1952` = col_character(),
##   ..   `1953` = col_character(),
##   ..   `1954` = col_character(),
##   ..   `1955` = col_character(),
##   ..   `1956` = col_character(),
##   ..   `1957` = col_character(),
##   ..   `1958` = col_character(),
##   ..   `1959` = col_character(),
##   ..   `1960` = col_character(),
##   ..   `1961` = col_character(),
##   ..   `1962` = col_character(),
##   ..   `1963` = col_character(),
##   ..   `1964` = col_character(),
##   ..   `1965` = col_character(),
##   ..   `1966` = col_character(),
##   ..   `1967` = col_character(),
##   ..   `1968` = col_character(),
##   ..   `1969` = col_character(),
##   ..   `1970` = col_character(),
##   ..   `1971` = col_character(),
##   ..   `1972` = col_character(),
##   ..   `1973` = col_character(),
##   ..   `1974` = col_character(),
##   ..   `1975` = col_character(),
##   ..   `1976` = col_character(),
##   ..   `1977` = col_character(),
##   ..   `1978` = col_character(),
##   ..   `1979` = col_character(),
##   ..   `1980` = col_character(),
##   ..   `1981` = col_character(),
##   ..   `1982` = col_character(),
##   ..   `1983` = col_character(),
##   ..   `1984` = col_character(),
##   ..   `1985` = col_character(),
##   ..   `1986` = col_character(),
##   ..   `1987` = col_character(),
##   ..   `1988` = col_character(),
##   ..   `1989` = col_character(),
##   ..   `1990` = col_character(),
##   ..   `1991` = col_character(),
##   ..   `1992` = col_character(),
##   ..   `1993` = col_character(),
##   ..   `1994` = col_character(),
##   ..   `1995` = col_character(),
##   ..   `1996` = col_character(),
##   ..   `1997` = col_character(),
##   ..   `1998` = col_character(),
##   ..   `1999` = col_character(),
##   ..   `2000` = col_character(),
##   ..   `2001` = col_character(),
##   ..   `2002` = col_character(),
##   ..   `2003` = col_character(),
##   ..   `2004` = col_character(),
##   ..   `2005` = col_character(),
##   ..   `2006` = col_character(),
##   ..   `2007` = col_character(),
##   ..   `2008` = col_character(),
##   ..   `2009` = col_character(),
##   ..   `2010` = col_character(),
##   ..   `2011` = col_character(),
##   ..   `2012` = col_character()
##   .. )
```


```r
lapply(fisheries,class)
```

```
## $Country
## [1] "character"
## 
## $`Common name`
## [1] "character"
## 
## $`ISSCAAP group#`
## [1] "numeric"
## 
## $`ISSCAAP taxonomic group`
## [1] "character"
## 
## $`ASFIS species#`
## [1] "character"
## 
## $`ASFIS species name`
## [1] "character"
## 
## $`FAO major fishing area`
## [1] "numeric"
## 
## $Measure
## [1] "character"
## 
## $`1950`
## [1] "character"
## 
## $`1951`
## [1] "character"
## 
## $`1952`
## [1] "character"
## 
## $`1953`
## [1] "character"
## 
## $`1954`
## [1] "character"
## 
## $`1955`
## [1] "character"
## 
## $`1956`
## [1] "character"
## 
## $`1957`
## [1] "character"
## 
## $`1958`
## [1] "character"
## 
## $`1959`
## [1] "character"
## 
## $`1960`
## [1] "character"
## 
## $`1961`
## [1] "character"
## 
## $`1962`
## [1] "character"
## 
## $`1963`
## [1] "character"
## 
## $`1964`
## [1] "character"
## 
## $`1965`
## [1] "character"
## 
## $`1966`
## [1] "character"
## 
## $`1967`
## [1] "character"
## 
## $`1968`
## [1] "character"
## 
## $`1969`
## [1] "character"
## 
## $`1970`
## [1] "character"
## 
## $`1971`
## [1] "character"
## 
## $`1972`
## [1] "character"
## 
## $`1973`
## [1] "character"
## 
## $`1974`
## [1] "character"
## 
## $`1975`
## [1] "character"
## 
## $`1976`
## [1] "character"
## 
## $`1977`
## [1] "character"
## 
## $`1978`
## [1] "character"
## 
## $`1979`
## [1] "character"
## 
## $`1980`
## [1] "character"
## 
## $`1981`
## [1] "character"
## 
## $`1982`
## [1] "character"
## 
## $`1983`
## [1] "character"
## 
## $`1984`
## [1] "character"
## 
## $`1985`
## [1] "character"
## 
## $`1986`
## [1] "character"
## 
## $`1987`
## [1] "character"
## 
## $`1988`
## [1] "character"
## 
## $`1989`
## [1] "character"
## 
## $`1990`
## [1] "character"
## 
## $`1991`
## [1] "character"
## 
## $`1992`
## [1] "character"
## 
## $`1993`
## [1] "character"
## 
## $`1994`
## [1] "character"
## 
## $`1995`
## [1] "character"
## 
## $`1996`
## [1] "character"
## 
## $`1997`
## [1] "character"
## 
## $`1998`
## [1] "character"
## 
## $`1999`
## [1] "character"
## 
## $`2000`
## [1] "character"
## 
## $`2001`
## [1] "character"
## 
## $`2002`
## [1] "character"
## 
## $`2003`
## [1] "character"
## 
## $`2004`
## [1] "character"
## 
## $`2005`
## [1] "character"
## 
## $`2006`
## [1] "character"
## 
## $`2007`
## [1] "character"
## 
## $`2008`
## [1] "character"
## 
## $`2009`
## [1] "character"
## 
## $`2010`
## [1] "character"
## 
## $`2011`
## [1] "character"
## 
## $`2012`
## [1] "character"
```


4. Think about the classes. Will any present problems? Make any changes you think are necessary below.

The Years columns should be numeric, but is currently characters.


```r
fisheries <- fisheries %>% 
  mutate_at(vars(starts_with("19")),as.numeric) %>%
  mutate_at(vars(starts_with("2")),as.numeric) %>% 
  mutate_if(is.character,as.factor)
```

```
## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion
```

```r
lapply(fisheries, class)
```

```
## $Country
## [1] "factor"
## 
## $`Common name`
## [1] "factor"
## 
## $`ISSCAAP group#`
## [1] "numeric"
## 
## $`ISSCAAP taxonomic group`
## [1] "factor"
## 
## $`ASFIS species#`
## [1] "factor"
## 
## $`ASFIS species name`
## [1] "factor"
## 
## $`FAO major fishing area`
## [1] "numeric"
## 
## $Measure
## [1] "factor"
## 
## $`1950`
## [1] "numeric"
## 
## $`1951`
## [1] "numeric"
## 
## $`1952`
## [1] "numeric"
## 
## $`1953`
## [1] "numeric"
## 
## $`1954`
## [1] "numeric"
## 
## $`1955`
## [1] "numeric"
## 
## $`1956`
## [1] "numeric"
## 
## $`1957`
## [1] "numeric"
## 
## $`1958`
## [1] "numeric"
## 
## $`1959`
## [1] "numeric"
## 
## $`1960`
## [1] "numeric"
## 
## $`1961`
## [1] "numeric"
## 
## $`1962`
## [1] "numeric"
## 
## $`1963`
## [1] "numeric"
## 
## $`1964`
## [1] "numeric"
## 
## $`1965`
## [1] "numeric"
## 
## $`1966`
## [1] "numeric"
## 
## $`1967`
## [1] "numeric"
## 
## $`1968`
## [1] "numeric"
## 
## $`1969`
## [1] "numeric"
## 
## $`1970`
## [1] "numeric"
## 
## $`1971`
## [1] "numeric"
## 
## $`1972`
## [1] "numeric"
## 
## $`1973`
## [1] "numeric"
## 
## $`1974`
## [1] "numeric"
## 
## $`1975`
## [1] "numeric"
## 
## $`1976`
## [1] "numeric"
## 
## $`1977`
## [1] "numeric"
## 
## $`1978`
## [1] "numeric"
## 
## $`1979`
## [1] "numeric"
## 
## $`1980`
## [1] "numeric"
## 
## $`1981`
## [1] "numeric"
## 
## $`1982`
## [1] "numeric"
## 
## $`1983`
## [1] "numeric"
## 
## $`1984`
## [1] "numeric"
## 
## $`1985`
## [1] "numeric"
## 
## $`1986`
## [1] "numeric"
## 
## $`1987`
## [1] "numeric"
## 
## $`1988`
## [1] "numeric"
## 
## $`1989`
## [1] "numeric"
## 
## $`1990`
## [1] "numeric"
## 
## $`1991`
## [1] "numeric"
## 
## $`1992`
## [1] "numeric"
## 
## $`1993`
## [1] "numeric"
## 
## $`1994`
## [1] "numeric"
## 
## $`1995`
## [1] "numeric"
## 
## $`1996`
## [1] "numeric"
## 
## $`1997`
## [1] "numeric"
## 
## $`1998`
## [1] "numeric"
## 
## $`1999`
## [1] "numeric"
## 
## $`2000`
## [1] "numeric"
## 
## $`2001`
## [1] "numeric"
## 
## $`2002`
## [1] "numeric"
## 
## $`2003`
## [1] "numeric"
## 
## $`2004`
## [1] "numeric"
## 
## $`2005`
## [1] "numeric"
## 
## $`2006`
## [1] "numeric"
## 
## $`2007`
## [1] "numeric"
## 
## $`2008`
## [1] "numeric"
## 
## $`2009`
## [1] "numeric"
## 
## $`2010`
## [1] "numeric"
## 
## $`2011`
## [1] "numeric"
## 
## $`2012`
## [1] "numeric"
```


5. How many countries are represented in the data? Provide a count.

```r
nlevels(fisheries$Country)
```

```
## [1] 204
```


6. What are the names of the countries?

```r
levels(fisheries$Country)
```

```
##   [1] "Albania"                   "Algeria"                  
##   [3] "American Samoa"            "Angola"                   
##   [5] "Anguilla"                  "Antigua and Barbuda"      
##   [7] "Argentina"                 "Aruba"                    
##   [9] "Australia"                 "Bahamas"                  
##  [11] "Bahrain"                   "Bangladesh"               
##  [13] "Barbados"                  "Belgium"                  
##  [15] "Belize"                    "Benin"                    
##  [17] "Bermuda"                   "Bonaire/S.Eustatius/Saba" 
##  [19] "Bosnia and Herzegovina"    "Brazil"                   
##  [21] "British Indian Ocean Ter"  "British Virgin Islands"   
##  [23] "Brunei Darussalam"         "Bulgaria"                 
##  [25] "C<f4>te d'Ivoire"          "Cabo Verde"               
##  [27] "Cambodia"                  "Cameroon"                 
##  [29] "Canada"                    "Cayman Islands"           
##  [31] "Channel Islands"           "Chile"                    
##  [33] "China"                     "China, Hong Kong SAR"     
##  [35] "China, Macao SAR"          "Colombia"                 
##  [37] "Comoros"                   "Congo, Dem. Rep. of the"  
##  [39] "Congo, Republic of"        "Cook Islands"             
##  [41] "Costa Rica"                "Croatia"                  
##  [43] "Cuba"                      "Cura<e7>ao"               
##  [45] "Cyprus"                    "Denmark"                  
##  [47] "Djibouti"                  "Dominica"                 
##  [49] "Dominican Republic"        "Ecuador"                  
##  [51] "Egypt"                     "El Salvador"              
##  [53] "Equatorial Guinea"         "Eritrea"                  
##  [55] "Estonia"                   "Ethiopia"                 
##  [57] "Falkland Is.(Malvinas)"    "Faroe Islands"            
##  [59] "Fiji, Republic of"         "Finland"                  
##  [61] "France"                    "French Guiana"            
##  [63] "French Polynesia"          "French Southern Terr"     
##  [65] "Gabon"                     "Gambia"                   
##  [67] "Georgia"                   "Germany"                  
##  [69] "Ghana"                     "Gibraltar"                
##  [71] "Greece"                    "Greenland"                
##  [73] "Grenada"                   "Guadeloupe"               
##  [75] "Guam"                      "Guatemala"                
##  [77] "Guinea"                    "GuineaBissau"             
##  [79] "Guyana"                    "Haiti"                    
##  [81] "Honduras"                  "Iceland"                  
##  [83] "India"                     "Indonesia"                
##  [85] "Iran (Islamic Rep. of)"    "Iraq"                     
##  [87] "Ireland"                   "Isle of Man"              
##  [89] "Israel"                    "Italy"                    
##  [91] "Jamaica"                   "Japan"                    
##  [93] "Jordan"                    "Kenya"                    
##  [95] "Kiribati"                  "Korea, Dem. People's Rep" 
##  [97] "Korea, Republic of"        "Kuwait"                   
##  [99] "Latvia"                    "Lebanon"                  
## [101] "Liberia"                   "Libya"                    
## [103] "Lithuania"                 "Madagascar"               
## [105] "Malaysia"                  "Maldives"                 
## [107] "Malta"                     "Marshall Islands"         
## [109] "Martinique"                "Mauritania"               
## [111] "Mauritius"                 "Mayotte"                  
## [113] "Mexico"                    "Micronesia, Fed.States of"
## [115] "Monaco"                    "Montenegro"               
## [117] "Montserrat"                "Morocco"                  
## [119] "Mozambique"                "Myanmar"                  
## [121] "Namibia"                   "Nauru"                    
## [123] "Netherlands"               "Netherlands Antilles"     
## [125] "New Caledonia"             "New Zealand"              
## [127] "Nicaragua"                 "Nigeria"                  
## [129] "Niue"                      "Norfolk Island"           
## [131] "Northern Mariana Is."      "Norway"                   
## [133] "Oman"                      "Other nei"                
## [135] "Pakistan"                  "Palau"                    
## [137] "Palestine, Occupied Tr."   "Panama"                   
## [139] "Papua New Guinea"          "Peru"                     
## [141] "Philippines"               "Pitcairn Islands"         
## [143] "Poland"                    "Portugal"                 
## [145] "Puerto Rico"               "Qatar"                    
## [147] "R<e9>union"                "Romania"                  
## [149] "Russian Federation"        "Saint Barth<e9>lemy"      
## [151] "Saint Helena"              "Saint Kitts and Nevis"    
## [153] "Saint Lucia"               "Saint Vincent/Grenadines" 
## [155] "SaintMartin"               "Samoa"                    
## [157] "Sao Tome and Principe"     "Saudi Arabia"             
## [159] "Senegal"                   "Serbia and Montenegro"    
## [161] "Seychelles"                "Sierra Leone"             
## [163] "Singapore"                 "Sint Maarten"             
## [165] "Slovenia"                  "Solomon Islands"          
## [167] "Somalia"                   "South Africa"             
## [169] "Spain"                     "Sri Lanka"                
## [171] "St. Pierre and Miquelon"   "Sudan"                    
## [173] "Sudan (former)"            "Suriname"                 
## [175] "Svalbard and Jan Mayen"    "Sweden"                   
## [177] "Syrian Arab Republic"      "Taiwan Province of China" 
## [179] "Tanzania, United Rep. of"  "Thailand"                 
## [181] "TimorLeste"                "Togo"                     
## [183] "Tokelau"                   "Tonga"                    
## [185] "Trinidad and Tobago"       "Tunisia"                  
## [187] "Turkey"                    "Turks and Caicos Is."     
## [189] "Tuvalu"                    "Ukraine"                  
## [191] "Un. Sov. Soc. Rep."        "United Arab Emirates"     
## [193] "United Kingdom"            "United States of America" 
## [195] "Uruguay"                   "US Virgin Islands"        
## [197] "Vanuatu"                   "Venezuela, Boliv Rep of"  
## [199] "Viet Nam"                  "Wallis and Futuna Is."    
## [201] "Western Sahara"            "Yemen"                    
## [203] "Yugoslavia SFR"            "Zanzibar"
```



7. Use `rename()` to rename the columns and make them easier to use. The new column names should be:  
+ country
+ commname
+ ASFIS_sciname
+ ASFIS_spcode
+ ISSCAAP_spgroup
+ ISSCAAP_spgroupname
+ FAO_area
+ unit


```r
New_fisheries <- (fisheries) %>% 
  rename(country="Country", commname="Common name", ISSCAAP_spgroup="ISSCAAP group#",  "ISSCAAP_spgroupname"="ISSCAAP taxonomic group" , "ASFIS_spcode"="ASFIS species#", ASFIS_sciname="ASFIS species name", FAO_area="FAO major fishing area", unit="Measure")
```


8. Are these data tidy? Why or why not, and, how do you know? Use the appropriate pivot function to tidy the data. Remove the NA's. Put the tidy data frame into a new object `fisheries_tidy`.  

```r
fisheries_tidy <- New_fisheries %>% 
  pivot_longer(-c("country", "commname", "ISSCAAP_spgroup", "ISSCAAP_spgroupname", "ASFIS_spcode", "ASFIS_sciname", "FAO_area","unit"),
               names_to = "Year",
               values_to = "catch",
               values_drop_na = TRUE)
fisheries_tidy
```

```
## # A tibble: 342,121 x 10
##    country commname ISSCAAP_spgroup ISSCAAP_spgroup~ ASFIS_spcode ASFIS_sciname
##    <fct>   <fct>              <dbl> <fct>            <fct>        <fct>        
##  1 Albania Angelsh~              38 Sharks, rays, c~ 10903XXXXX   Squatinidae  
##  2 Albania Angelsh~              38 Sharks, rays, c~ 10903XXXXX   Squatinidae  
##  3 Albania Angelsh~              38 Sharks, rays, c~ 10903XXXXX   Squatinidae  
##  4 Albania Angelsh~              38 Sharks, rays, c~ 10903XXXXX   Squatinidae  
##  5 Albania Angelsh~              38 Sharks, rays, c~ 10903XXXXX   Squatinidae  
##  6 Albania Angelsh~              38 Sharks, rays, c~ 10903XXXXX   Squatinidae  
##  7 Albania Angelsh~              38 Sharks, rays, c~ 10903XXXXX   Squatinidae  
##  8 Albania Angelsh~              38 Sharks, rays, c~ 10903XXXXX   Squatinidae  
##  9 Albania Angelsh~              38 Sharks, rays, c~ 10903XXXXX   Squatinidae  
## 10 Albania Angelsh~              38 Sharks, rays, c~ 10903XXXXX   Squatinidae  
## # ... with 342,111 more rows, and 4 more variables: FAO_area <dbl>, unit <fct>,
## #   Year <chr>, catch <dbl>
```



9. Refocus the data only to include country, ISSCAAP_spgroupname, ASFIS_spcode, ASFIS_sciname, year, and catch.

```r
fisheries_tidy2 <- fisheries_tidy %>% 
  select(country,ISSCAAP_spgroupname,ASFIS_spcode,ASFIS_sciname, Year, catch)
fisheries_tidy2
```

```
## # A tibble: 342,121 x 6
##    country ISSCAAP_spgroupname     ASFIS_spcode ASFIS_sciname Year  catch
##    <fct>   <fct>                   <fct>        <fct>         <chr> <dbl>
##  1 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   1996     53
##  2 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   1997     20
##  3 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   1998     31
##  4 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   1999     30
##  5 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   2000     30
##  6 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   2001     16
##  7 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   2002     79
##  8 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   2003      1
##  9 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   2004      4
## 10 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   2005     68
## # ... with 342,111 more rows
```


10. Re-check the classes of `fisheries_tidy2`. Notice that "catch" is shown as a character! This is a problem because we will want to treat it as a numeric. How will you deal with this?

```r
lapply(fisheries_tidy2,class)
```

```
## $country
## [1] "factor"
## 
## $ISSCAAP_spgroupname
## [1] "factor"
## 
## $ASFIS_spcode
## [1] "factor"
## 
## $ASFIS_sciname
## [1] "factor"
## 
## $Year
## [1] "character"
## 
## $catch
## [1] "numeric"
```


```r
fisheries_tidy2$catch <- as.numeric(fisheries_tidy2$catch,Na.RM = T)
class(fisheries_tidy2$catch)
```

```
## [1] "numeric"
```

11. Based on the ASFIS_spcode, how many distinct taxa were caught as part of these data?
1553 distinct taxa were caught as part of these data.


```r
nlevels(fisheries_tidy2$ASFIS_spcode)
```

```
## [1] 1553
```


12. Which country had the largest overall catch in the year 2000?
Peru had the largest overall catch in the year 2000 [106250101 fish]


```r
fisheries_tidy2 %>% 
  filter(Year=="2000") %>% 
  select(country,Year,catch) %>% 
  group_by(country) %>% 
  summarise(catch = sum(catch, na.rm = TRUE)) %>% 
  arrange(desc(catch,by.group = True))
```

```
## # A tibble: 173 x 2
##    country                     catch
##    <fct>                       <dbl>
##  1 Peru                     10625010
##  2 Japan                     4921013
##  3 United States of America  4692229
##  4 Chile                     4297928
##  5 Indonesia                 3761769
##  6 Russian Federation        3678828
##  7 Thailand                  2795719
##  8 India                     2760632
##  9 Norway                    2698506
## 10 Iceland                   1982369
## # ... with 163 more rows
```



13. Which country caught the most sardines (_Sardina_) between the years 1990-2000?
Morocco caught the most sardines between the years 1990 -> 2000 [5785190 sardines]


```r
fisheries_tidy2 %>% 
  select(country,catch,Year,ASFIS_sciname) %>% 
  filter(str_detect(ASFIS_sciname,"Sardina")) %>% 
  filter(Year>= 1990 & Year <= 2000) %>% 
  group_by(country) %>% 
  summarise(catch = sum(catch,na.rm = TRUE)) %>% 
  arrange(desc(catch, by.group = TRUE))
```

```
## # A tibble: 36 x 2
##    country              catch
##    <fct>                <dbl>
##  1 Morocco            4785190
##  2 Spain              1425317
##  3 Russian Federation 1035139
##  4 Portugal            926318
##  5 Ukraine             784730
##  6 Italy               377907
##  7 Algeria             311733
##  8 Turkey              273565
##  9 France              263871
## 10 Denmark             242017
## # ... with 26 more rows
```



14. Which five countries caught the most cephalopods between 2008-2012?
China, Peru, Korea, Japan, and chile caught the most cephalopds between 2008 -> 2012


```r
fisheries_tidy2 %>% 
  filter(str_detect(ISSCAAP_spgroupname,"Squids"))%>%
  filter(Year >=2008 & Year <= 2012) %>% 
  group_by(country) %>% 
  summarise(catch=sum(catch,na.rm = TRUE)) %>% 
  arrange(desc(catch, by.group = TRUE))
```

```
## # A tibble: 112 x 2
##    country                    catch
##    <fct>                      <dbl>
##  1 China                    4785139
##  2 Peru                     2274232
##  3 Korea, Republic of       1535454
##  4 Japan                    1394041
##  5 Chile                     723186
##  6 Indonesia                 684567
##  7 United States of America  613400
##  8 Thailand                  603529
##  9 Taiwan Province of China  593638
## 10 Argentina                 587238
## # ... with 102 more rows
```


15. Given the top five countries from question 12 above, which species was the highest catch total? The lowest?
Dosidicus gigas	was the highest catch total
Todarodes filippovae was the lowest catch total


```r
fisheries_tidy2 %>% 
  filter(str_detect(ISSCAAP_spgroupname,"Squids"))%>%
  filter(Year >=2008 & Year <= 2012) %>% 
  group_by(ASFIS_sciname) %>% 
  summarise(catch_total = sum(catch, na.rm = TRUE)) %>% 
  arrange(desc(catch_total))
```

```
## # A tibble: 31 x 2
##    ASFIS_sciname               catch_total
##    <fct>                             <dbl>
##  1 Dosidicus gigas                 4211138
##  2 Loliginidae, Ommastrephidae     2822078
##  3 Illex argentinus                1834620
##  4 Todarodes pacificus             1767506
##  5 Octopodidae                     1458746
##  6 Sepiidae, Sepiolidae            1331357
##  7 Loligo spp                      1291035
##  8 Cephalopoda                      735839
##  9 Loligo opalescens                477536
## 10 Loligo gahi                      317535
## # ... with 21 more rows
```


```r
fisheries_tidy2 %>% 
  filter(str_detect(ISSCAAP_spgroupname,"Squids"))%>%
  filter(Year >=2008 & Year <= 2012) %>% 
  group_by(ASFIS_sciname) %>% 
  summarise(catch_total = sum(catch, na.rm = TRUE)) %>% 
  arrange((catch_total))
```

```
## # A tibble: 31 x 2
##    ASFIS_sciname           catch_total
##    <fct>                         <dbl>
##  1 Todarodes filippovae              1
##  2 Martialia hyadesi                 4
##  3 Moroteuthis ingens              194
##  4 Loligo vulgaris                 398
##  5 Eledone cirrhosa                920
##  6 Loligo duvauceli               1843
##  7 Loligo forbesi                 2567
##  8 Todarodes sagittatus           5073
##  9 Illex coindetii               20209
## 10 Sepioteuthis lessoniana       28547
## # ... with 21 more rows
```


16. In some cases, the taxonomy of the fish being caught is unclear. Make a new data frame called `coastal_fish` that shows the taxonomic composition of "Miscellaneous coastal fishes" within the ISSCAAP_spgroupname column.

```r
coastal_fish <- fisheries_tidy2 %>% 
  filter(str_detect(ISSCAAP_spgroupname,"Miscellaneous coastal fishes"))
coastal_fish
```

```
## # A tibble: 63,236 x 6
##    country ISSCAAP_spgroupname          ASFIS_spcode ASFIS_sciname Year  catch
##    <fct>   <fct>                        <fct>        <fct>         <chr> <dbl>
##  1 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1983    559
##  2 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1984    392
##  3 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1985    406
##  4 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1986    499
##  5 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1987    564
##  6 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1988    724
##  7 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1989    583
##  8 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1990    754
##  9 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1991    283
## 10 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1992    196
## # ... with 63,226 more rows
```


17. Use the data to do at least one exploratory analysis of your choice. What can you learn?
I wanted to  see which country caught the most costal fishes
I learned the country was India, which caught 28060848


```r
coastal_fish %>% 
  group_by(country) %>% 
  select(country,catch) %>% 
  summarise(catch = sum(catch, na.rm = TRUE)) %>%
  arrange(desc(catch,by.group = True))
```

```
## # A tibble: 150 x 2
##    country               catch
##    <fct>                 <dbl>
##  1 India              28060848
##  2 Denmark            24371336
##  3 China              24179487
##  4 Japan              22074106
##  5 Indonesia          18979007
##  6 Philippines        16273590
##  7 Korea, Republic of  9919627
##  8 Brazil              8052684
##  9 Thailand            7948087
## 10 Un. Sov. Soc. Rep.  7305555
## # ... with 140 more rows
```


## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.   
