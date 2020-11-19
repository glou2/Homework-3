
# Author: Grace Lou
# Assignment: Homework 3
# Class: Business Analtics
# Date: 11/19/20

###############################################################################

# 1a

install.packages(c("coronavirus", "tidyverse"))
library(coronavirus)
library(ggplot2)
library(dplyr)
update_dataset()
y # next line is my input, accpet updated dataset

###############################################################################

# 1b

head(coronavirus, n = 100L)

###############################################################################

# 1c

# column 1 is the date of summary
# column 2 is the province
# column 3 is the country
# column 4 is the latitude
# column 5 is the longitude
# column 6 is the type of case (positive/confirmed or death)
# column 7 is the number of cases of each type

###############################################################################

# 2a

summary_df <- coronavirus %>% 
  filter(type == "confirmed") %>%
  group_by(country) %>%
  summarise(total_cases = sum(cases)) %>%
  arrange(-total_cases)

summary_df %>% head(20) 

###############################################################################

# 2b 

Top_cases <- summary_df %>% head(5) 

ggplot(Top_cases, aes(x = country, y = total_cases)) +
   geom_bar(stat = "identity",
            color = "black", fill = "blue") + 
  # I've made the outline of the bars black
  # and the fill of the bars blue
  labs(x = "Country",
       y = "Number of Total Cases") # I've also added axis labels

###############################################################################

# 2c

ggplot(Top_cases, aes(x = country, y = total_cases)) +
  geom_bar(stat = "identity", width = 0.5) + 
  # I've set the width of the bars to be smaller
  coord_flip() +
  labs(x = "Country",
       y = "Number of Total Cases") +
  theme(axis.title = element_text(color = "red", face = "italic", size = 12)) 
# I chanced the label color to red, italicized them, and increased their font size to 12


###############################################################################

# 2d

ggplot(Top_cases, aes(x = country, y = total_cases, fill = country)) +
  # I filled each country with a unique color
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Top 5 countries by total cases",
       x = "Country",
       y = "Number of Total Cases")
  
       

###############################################################################

# 3a

recent_cases <- coronavirus %>% 
  filter(type == "confirmed") %>%
  group_by(date) %>%
  summarise(total_cases = sum(cases)) %>%
  arrange(-total_cases)

###############################################################################

# 3b

ggplot(recent_cases, aes(x = date, y = total_cases)) +
        geom_line() +
  labs(title = "Number of Recent Cases Sorted by Date",
       x = "Date",
       y = "Number of Cases") # I added labels 

###############################################################################

# Thanks for reading my code! :)
      