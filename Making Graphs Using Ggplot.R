
###Ggplot - Using geometries###

install.packages('ggplot2')
library(ggplot2)
library(tidyverse)
View(mtcars)

##Scatterplot for two continous variables or numeric variables

mtcars %>%
  ggplot(aes(x = wt, y = mpg)) +
  geom_point(size = 3, colour = "steelblue", alpha = 0.6)+
  labs(title = "Weight vs Miles per Gallon",
       x = "Weight",
       y = "Miles per Gallon")+
  theme_bw()

##line graph 
View(Orange)

Orange %>%
  ggplot(aes(x = age,
             y = circumference,
             color = Tree)) +
  geom_line()+
  labs(title = "Circumference as a function of age",
       x = "Age",
       y = "Circumference") + 
  theme_bw()

##Barchart for a categorical or factor
View(mpg)

mpg %>%
  ggplot(aes(x = class)) +
  geom_bar(fill = "steelblue",
           alpha = 0.8)+
  labs(title = "Number of cars in each class",
       x = "",
       y = "")+
  theme_bw()

##Histogram for a continous variable
mpg %>%
  ggplot(aes(x = cty)) +
  geom_histogram(binwidth = 2, fill = "steelblue",
                 alpha = 0.8) +
  labs(title = "Fuel efficiency of cars in the city",
       x = "Miles per gallon",
       y = "Number of cars")+
  theme_bw()

##Density Plot
mpg %>%
  ggplot(aes(x = cty)) + 
  geom_density(fill = "steelblue", alpha = 0.8) +
  labs(title = "Fuel efficiency of cars in the city",
       x = "Miles per gallon",
       y = "") +
  theme_bw()

#density plot for multiple different categories so in this case
mpg %>%
  filter(drv %in% c("f","r")) %>%
  ggplot(aes(x = cty , 
             fill = drv,
             color = drv)) +
  geom_density(alpha = 0.3) +
  labs(title = "Fuel efficiency of cars in the city",
       x = "Miles per gallon",
       y = "") +
  theme_bw()

##Boxplot for a numeric variable
mpg %>%
  filter(cty < 25) %>%
  ggplot(aes(x = cty,
             fill = drv)) +
  geom_boxplot(alpha = 0.5) +
  labs(title = "Fuel Efficiency of cars in the city",
       x = "Miles per gallon",
       fill = "Drive") +
  theme_bw()

##Area plots
mpg %>%
  ggplot(aes(x = displ)) +
  geom_area(aes(y = hwy, fill = "Highway")) +
  geom_area(aes(y = cty, fill = "City")) +
  labs(title = "Highway vs city driving",
       x = "Engine Displacement (L)",
       y = "Miles per Gallon",
       fill = "") +
  theme_bw()

#Ratser Plots
View(faithfuld)

faithfuld %>%
  ggplot(aes(x = waiting , y = eruptions, fill = density)) +
  geom_raster() +
  labs(title = "Old Faithful Geyser",
       x = "Waiting time between erruptions",
       y = "Duration of erruptions",
       fill = "Density") +
  theme_bw()
-----------------------------------------------------------------------------------------------------