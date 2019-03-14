#title: Shot Chart
#description: Created shot charts using the x and y points given from the original data set. Modified the data set to look more appealing by adding a basketball court background. 
#input(s): The data frames for each player and the combined data frame of all the players
#output(s): Shot charts for each individual player as well as the facetted shot chart for all the players

#Klay Thompson Shot Chart Scatterplot 
klay_scatterplot <- ggplot(data = klay) + geom_point(aes(x = x, y = y, color = shot_made_flag))

#court image
court_file <- '../images/nba-court.jpg'
court_image <- rasterGrob(readJPEG(court_file), width = unit(1, 'npc'), height = unit(1, 'npc'))

#shot charts
thompson_shot_chart <- ggplot(data = thompson) + annotation_custom(court_image, -250, 250, -5, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Klay Thompson (2016 season)') + theme_minimal()
curry_shot_chart <- ggplot(data = curry) + annotation_custom(court_image, -250, 250, -5, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Stephen Curry (2016 season)') + theme_minimal()
iguodala_shot_chart <- ggplot(data = iguodala) + annotation_custom(court_image, -250, 250, -5, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Andre Iguodala (2016 season)') + theme_minimal()
green_shot_chart <- ggplot(data = green) + annotation_custom(court_image, -250, 250, -5, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Draymond Green (2016 season)') + theme_minimal()
durant_shot_chart <- ggplot(data = durant) + annotation_custom(court_image, -250, 250, -5, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Kevin Durant (2016 season)') + theme_minimal()

#shot chart pdf
ggsave(filename = '../images/andre-iguodala-shot-chart.pdf', plot = iguodala_shot_chart, width = 6.5, height = 5, unit = 'in')
ggsave(filename = '../images/draymond-green-shot-chart.pdf', plot = green_shot_chart, width = 6.5, height = 5, unit = 'in')
ggsave(filename = '../images/kevin-durant-shot-chart.pdf', plot = durant_shot_chart, width = 6.5, height = 5, unit = 'in')
ggsave(filename = '../images/klay-thompson-shot-chart.pdf', plot = thompson_shot_chart, width = 6.5, height = 5, unit = 'in')
ggsave(filename = '../images/stephen-curry-shot-chart.pdf', plot = curry_shot_chart, width = 6.5, height = 5, unit = 'in')

#facetted shot chart
combined_shot_chart <- ggplot(data = combined_shots) + annotation_custom(court_image, -250, 250, -5, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Starting Five (2016 season)') + facet_wrap(~ name)
ggsave(filename = '../images/gsw-shot-charts.pdf', plot = combined_shot_chart, width = 8, height = 7, unit = 'in')
ggsave(filename = '../images/gsw-shot-charts.png', plot = combined_shot_chart, width = 8, height = 7, unit = 'in')

