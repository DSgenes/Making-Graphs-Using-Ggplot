
###Facet###
#Facets are used to create multiple plots, each showing a subset of your data.These plots are
#arranged in a grid, with each plot showing a different subset of the data, based on the values
#of one or more variables.

# install.packages("gapminder")
install.packages("ggplot2")
library(gapminder)
library(ggplot2)
library(tidyverse)
View(gapminder)

gapminder %>%
  filter(gdpPercap < 40000 &
           continent != "Oceania") %>%
  ggplot(mapping = aes(x = gdpPercap,
                       y = lifeExp,
                       colour = continent))+
  geom_point(shape = "square",
             alpha = 0.4,
             size = 2)+
  labs(title = "Life Expectancy as a function of Wealth",
       x = "GDP per Capita",
       y = "Life Expectancy",
       colour = "Region")+
  theme_bw()

###facet_wrap
#A simple solution is to plot each of the continents of interest on a separate but adjacent
#graph so that we can more clearly see the difference between them. To do this we use the
#face_wrap() function and specify which categorical variable to facet by using the ~ symbol.

gapminder %>%
  filter(gdpPercap < 40000 &
           continent != "Oceania") %>%
  ggplot(mapping = aes(x = gdpPercap,
                       y = lifeExp,
                       colour = year))+
  geom_jitter(shape = "square",
              alpha = 0.4,
              size = 2)+
  geom_smooth()+
  facet_wrap(~continent)+
  labs(title = "Life Expectancy as a function of Wealth",
       x = "GDP per Capita",
       y = "Life Expectancy")+
  theme_bw()

install.packages('forcats')
library(forcats)

View(gss_cat)
gss_cat %>%
  filter(partyid %in% c("Strong democrat",
                        "Strong republican",
                        "Independent")) %>%
  ggplot(aes(x = age))+
  geom_histogram(binwidth = 5,
                 fill = "steelblue",
                 alpha = .8)+
  facet_wrap(~partyid,
             nrow = 1,
             ncol = 3,
             strip.position = "bottom")+
  labs(title = "Age distribution by political affiliation",
       x = "",
       y = "")+
  theme_bw()

##facet_grid
gss_cat %>%
  mutate(relig = recode(relig,
                        "Moslem/islam" = "Muslim")) %>%
  filter(relig %in% c("Christian",
                      "Muslim") &
           partyid %in% c("Strong democrat",
                          "Strong republican",
                          "Independent")&
           tvhours<10) %>%
  ggplot(aes(x = tvhours,
             color = partyid,
             fill = partyid))+
  geom_density(alpha = 0.3, show.legend = F)+
  facet_grid(relig ~ partyid)+
  labs(title = "TV watching by political and religious affiliation",
       x = "Hour spent watching TV",
       y = "")+
  theme_bw()
------------------------------------------------------------------------------------------------------