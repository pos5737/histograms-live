# load packages
library(tidyverse)  # loads readr, ggplot2, and others

# load data
nominate_df <- read_rds("data/nominate.rds")  # data are in the data/ subdirectory

# quick look at the data
glimpse(nominate_df)

# build plot
ggplot(nominate_df, aes(x = ideology, fill = party)) + 
  geom_density(alpha = 0.5) + 
  facet_wrap(vars(congress)) + 
  labs(x = "Ideology Score",
       y = "Density",
       fill = "Party",
       title = "A Density Plot of Ideology Scores for the 100th Congress",
       subtitle = "There Are Fewer and Fewer Moderates in Congress",
       caption = "Data Source: DW-NOMINATE from voteview.com") + 
  theme_bw()

# save last plot as png to the figs subfolder of the doc subfolder
ggsave("histogram.png", height = 5, width = 8)