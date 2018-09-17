# load packages
library(tidyverse)  # loads readr, ggplot2, and others

# load data
nominate_df <- read_rds("data/nominate.rds")  # data are in the data/ subdirectory

# quick look at the data
glimpse(nominate_df)

# draw a histogram
ggplot(nominate_df, aes(x = ideology,
                        y = ..density..,
                        color = party,
                        fill = party)) + 
  geom_density(alpha = 0.25) + 
  facet_wrap(vars(congress)) + 
  labs(x = "Ideology",
       y = "Density",
       color = "Party",
       fill = "Party",
       title = "An Amazing Series of Density Plots",
       subtitle = "An Amazing Subtitle",
       caption = "Data from voteview.com") + 
  scale_color_manual(values = c("blue", "red")) + 
  scale_fill_manual(values = c("blue", "red")) + 
  theme_bw()

# save plot
ggsave("density.png", height = 6, width = 6)

# mutate data (we'll talk about this code later)
nominate2_df <- mutate(nominate_df, 
                       congress_factor = as.factor(congress))

# ohhh joy
library(ggridges)
ggplot(nominate_df, mapping = aes(x = ideology, 
                                  y = as.factor(congress),
                                  fill = party)) + 
  geom_density_ridges(alpha = 0.5)
                     