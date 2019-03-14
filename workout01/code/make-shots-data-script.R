#title: Shot Data Preparation
#description: Creating a table of shot attempts in a table format that can be used and analyzed
#input(s): 

library(readr)
library(dplyr)


curry <- read.csv('../data/stephen-curry.csv', stringsAsFactors = FALSE)
iguodala <- read.csv('../data/andre-iguodala.csv', stringsAsFactors = FALSE)
green <- read.csv('../data/draymond-green.csv', stringsAsFactors = FALSE)
durant <- read.csv('../data/kevin-durant.csv', stringsAsFactors = FALSE)
thompson <- read.csv('../data/klay-thompson.csv', stringsAsFactors = FALSE)

