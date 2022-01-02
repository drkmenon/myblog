---
title: "What is p-value and Confidence Interval?"
author: "Kishore Puthezhath"
date: "2022-01-2"
output:
  html_document:
    df_print: paged
draft: yes
categories: Statistics
tags: p and CI
subtitle: ''
summary: ''
authors: []
lastmod: ''
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
slug: p value and Confidence Interval
---

Assume that we have a normally distributed population of males and females with a mean height of 168cms and 158cms respectively.
```{r warning=FALSE}
library(ggplot2)
set.seed(1)
m=rnorm(100,168,5)
f=rnorm(100,158,5)
mf=as.data.frame(m,f)
```

```{r}
library(tidyverse)
mf %>% 
ggplot()+
  geom_histogram(mapping = aes(m
              ),position = 'identity',bins=70, alpha=.5, )+
  geom_histogram(mapping = aes(f
              ),position = 'identity',bins = 70, alpha=.5)+xlab("People")
```
```{r}
htdif=mean(m)-mean(f)
round(htdif,digits = 1)
```

We can see that the mean difference in the height is 10.7 cms.  
**If I measure the entire population in the world, will I find that the mean height for each sex is different?** or  
**would I find that difference between the mean height is zero?**

## How to answer this question?

### Frequentist method
Assume a hypothetical world with no difference in the height between the sexes.Do repeated experiments and find out what `proportion of times` would I obtain a difference between the observed means(ø) in that hypothetical world which is as great as or greater than difference I observed in my real experiment.
**This proportion of time is abbreviated as *p-value* **  

In other words *p-value*=P(ø/H), given the null(H), what is the probability of data(ø)

but *p-value* is an answer to a question we didn't intend to ask. So what to do with it?

# Traditional Answers

## Fisher:

Treat it as a measure of strength of evidence. This is not objectively satisfactory because, *p-value*=P(ø/H)≠P(H/ø)

## Neyman-Pearson decision framework

In each experiment, if you need to choose between the Null and the alternative, then there is possibility for two types of errors

False Positive: Choosing the alternative when Null is true
False Negative: Choosing the Null when the alternative is true

**Control the rate at which you commit decision errors of false positive type by applying a strict procedure to each expiriment:**

 + Compute *p-value*
 + Choose the Null if *p-value* is > α 
 + Choose the alternative if *p-value* is <= α
 + Typically α is set at 0.05

## Confidence Interval

Under repeated sampling in hypothetical world, 95% of confidence intervals constructed the same way will include the true value of the mean difference.
