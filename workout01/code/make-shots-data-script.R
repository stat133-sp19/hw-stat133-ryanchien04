#title: Shot Data Preparation
#description: Creating a table of shot attempts in a table format that can be used and analyzed.
#input(s): the csv files for Stephen Curry, Andre Iguodala, Draymond Green, Kevin Durant, and Klay Thompson.
#output(s): summaries of mutated tables of the players and a summary of a binded table of all the players.

library(readr)
library(dplyr)

setwd("~/Desktop/hw-stat133/workout01/code")

#downloading the files
curry <- read.csv('../data/stephen-curry.csv', stringsAsFactors = FALSE)
iguodala <- read.csv('../data/andre-iguodala.csv', stringsAsFactors = FALSE)
green <- read.csv('../data/draymond-green.csv', stringsAsFactors = FALSE)
durant <- read.csv('../data/kevin-durant.csv', stringsAsFactors = FALSE)
thompson <- read.csv('../data/klay-thompson.csv', stringsAsFactors = FALSE)

#add name column
curry$name <- rep('Stephen Curry', length = length(curry$team_name))
curry <- curry[c(14, 1:13)]

iguodala$name <- rep('Andre Iguodala', length = length(iguodala$team_name))
iguodala <- iguodala[c(14, 1:13)]

green$name <- rep('Draymond Green', length = length(green$team_name))
green <- green[c(14, 1:13)]

durant$name <- rep('Kevin Durant', length = length(durant$team_name))
durant <- durant[c(14, 1:13)]

thompson$name <- rep('Klay Thompson', length = length(thompson$team_name))
thompson <- thompson[c(14, 1:13)]

#modifying shot_made_flag values
curry$shot_made_flag[curry$shot_made_flag == 'y'] <- 'shot_yes'
curry$shot_made_flag[curry$shot_made_flag == 'n'] <- 'shot_no'

iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] <- 'shot_yes'
iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] <- 'shot_no'

green$shot_made_flag[green$shot_made_flag == 'y'] <- 'shot_yes'
green$shot_made_flag[green$shot_made_flag == 'n'] <- 'shot_no'

durant$shot_made_flag[durant$shot_made_flag == 'y'] <- 'shot_yes'
durant$shot_made_flag[durant$shot_made_flag == 'n'] <- 'shot_no'

thompson$shot_made_flag[thompson$shot_made_flag == 'y'] <- 'shot_yes'
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] <- 'shot_no'

#Create minute column
curry$minute <- 12*(curry$period - 1) + (12 - curry$minutes_remaining)
iguodala$minute <- 12*(iguodala$period - 1) + (12 - iguodala$minutes_remaining)
green$minute <- 12*(green$period - 1) + (12 - green$minutes_remaining)
durant$minute <- 12*(durant$period - 1) + (12 - durant$minutes_remaining)
thompson$minute <- 12*(thompson$period - 1) + (12 - thompson$minutes_remaining)

#sink the files summarize the output of each imported data frame
sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()

sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()

#stack the tables into a single data frame
combined_shots <- rbind(iguodala, green, durant, thompson, curry)

#create csv file
write.csv(x = combined_shots, file = '../data/shots-data.csv')

#sink the file
sink(file = '../output/shots-data-summary.txt')
summary(combined_shots)
sink()

