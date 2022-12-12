library(tidyverse)
library(gapminder)


dash_df <- gapminder %>% group_split(continent) %>%
                  purrr::map(~ .x %>% filter(year == last(year)) %>%
                        arrange(-gdpPercap) %>% head(10)) %>%
  purrr::set_names(sort(unique(factor(gapminder$continent))))

# United States: Richest Country World
us_df <- gapminder %>% filter(country == 'United States') %>%
  rename(lifeExp_us = lifeExp,pop_us = pop,gdp_us = gdpPercap)

#*******************************************************************************
#*************************** CONTINENTS ****************************************
#*#*****************************************************************************

#********************
#******** AFRICA ****
#********************

names_africa <- str_replace(dash_df$Africa$country," ","-")

richest_africa <- gapminder %>%
               filter(country == 'Egypt') %>%
               rename(richest_country = country,
                      richest_LifeExp = lifeExp,
                      richest_pop = pop,richest_gdp = gdpPercap)%>%
               select(year, richest_country,richest_LifeExp:last_col())

countries_selected_africa <- gapminder %>%
  mutate(lifeExp = round(lifeExp,0),pop = round(pop,0),gdpPercap = round(gdpPercap,0))%>%

  filter(country %in% dash_df$Africa$country)%>%
  group_split(country) %>%
  purrr::map(~ .x %>% left_join(richest_africa,by = 'year') %>%
        mutate(diff_lifeExp = round(lifeExp-richest_LifeExp,0),
               diff_pop = round(pop-richest_pop,0),
               diff_gdp = round(gdpPercap-richest_gdp,0)
        )) %>% purrr::set_names(sort(names_africa))


growth_cards_info_africa <- gapminder %>%
  mutate(lifeExp = round(lifeExp,0),pop = round(pop,0),gdpPercap = round(gdpPercap,0)) %>%
  filter(country %in% dash_df$Africa$country) %>%
  group_split(country) %>%
  map(~ .x %>% filter(year %in% c('1952','2007')) %>%

  summarise(life_growth = round(((last(lifeExp)-first(lifeExp))/first(lifeExp))*100,0),
                         pop_growth = round(((last(pop)-first(pop))/first(pop))*100,0),
                         gdp_growth = round(((last(gdpPercap)-first(gdpPercap))/first(gdpPercap))*100,0),
            .groups = 'pop'))%>%

  purrr::set_names(sort(names_africa))



#********************
#******** AMERICAS ****
#********************
names_americas <- str_replace_all(dash_df$Americas$country," ","-")

richest_americas <- gapminder::gapminder %>%
  filter(country == 'United States') %>%
  rename(richest_country = country,
         richest_LifeExp = lifeExp,
         richest_pop = pop,richest_gdp = gdpPercap)%>%
  select(year, richest_country,richest_LifeExp:last_col())

countries_selected_americas <- gapminder::gapminder %>%
  mutate(lifeExp = round(lifeExp,0),pop = round(pop,0),gdpPercap = round(gdpPercap,0))%>%

  filter(country %in% dash_df$Americas$country)%>%
  group_split(country) %>%
  purrr::map(~ .x %>% left_join(richest_americas,by = 'year') %>%
        mutate(diff_lifeExp = round(lifeExp-richest_LifeExp,0),
               diff_pop = round(pop-richest_pop,0),
               diff_gdp = round(gdpPercap-richest_gdp,0)
        )) %>% purrr::set_names(sort(names_americas))

growth_cards_info_americas <- gapminder %>%
  mutate(lifeExp = round(lifeExp,0),pop = round(pop,0),gdpPercap = round(gdpPercap,0)) %>%
  filter(country %in% dash_df$Americas$country) %>%
  group_split(country) %>%
  map(~ .x %>% filter(year %in% c('1952','2007')) %>%

        summarise(life_growth = round(((last(lifeExp)-first(lifeExp))/first(lifeExp))*100,0),
                  pop_growth = round(((last(pop)-first(pop))/first(pop))*100,0),
                  gdp_growth = round(((last(gdpPercap)-first(gdpPercap))/first(gdpPercap))*100,0),
                  .groups = 'pop'))%>%

  purrr::set_names(sort(names_americas))
#********************
#******** ASIA ****
#********************
names_asia <- str_replace(dash_df$Asia$country," ","-")

richest_asia <- gapminder::gapminder %>%
  filter(country == 'Japan') %>%
  rename(richest_country = country,
         richest_LifeExp = lifeExp,
         richest_pop = pop,richest_gdp = gdpPercap)%>%
  select(year, richest_country,richest_LifeExp:last_col())

countries_selected_asia <- gapminder::gapminder %>%
  mutate(lifeExp = round(lifeExp,0),pop = round(pop,0),gdpPercap = round(gdpPercap,0))%>%

  filter(country %in% dash_df$Asia$country)%>%
  group_split(country) %>%
  purrr::map(~ .x %>% left_join(richest_asia,by = 'year') %>%
        mutate(diff_lifeExp = round(lifeExp-richest_LifeExp,0),
               diff_pop = round(pop-richest_pop,0),
               diff_gdp = round(gdpPercap-richest_gdp,0)
        ))%>% purrr::set_names(sort(names_asia))

growth_cards_info_asia <- gapminder %>%
  mutate(lifeExp = round(lifeExp,0),pop = round(pop,0),gdpPercap = round(gdpPercap,0)) %>%
  filter(country %in% dash_df$Asia$country) %>%
  group_split(country) %>%
  map(~ .x %>% filter(year %in% c('1952','2007')) %>%

        summarise(life_growth = round(((last(lifeExp)-first(lifeExp))/first(lifeExp))*100,0),
                  pop_growth = round(((last(pop)-first(pop))/first(pop))*100,0),
                  gdp_growth = round(((last(gdpPercap)-first(gdpPercap))/first(gdpPercap))*100,0),
                  .groups = 'pop'))%>%

  purrr::set_names(sort(names_asia))

#********************
#******** EUROPE ****
#********************
names_europe <- str_replace(dash_df$Europe$country," ","-")

richest_europe <- gapminder::gapminder %>%
  filter(country == 'United Kingdom') %>%
  rename(richest_country = country,
         richest_LifeExp = lifeExp,
         richest_pop = pop,richest_gdp = gdpPercap)%>%
  select(year, richest_country,richest_LifeExp:last_col())

countries_selected_europe <- gapminder::gapminder %>%
  mutate(lifeExp = round(lifeExp,0),pop = round(pop,0),gdpPercap = round(gdpPercap,0))%>%

  filter(country %in% dash_df$Europe$country)%>%
  group_split(country) %>%
  purrr::map(~ .x %>% left_join(richest_europe,by = 'year') %>%
        mutate(diff_lifeExp = round(lifeExp-richest_LifeExp,0),
               diff_pop = round(pop-richest_pop,0),
               diff_gdp = round(gdpPercap-richest_gdp,0)
        )) %>% purrr::set_names(sort(names_europe))

growth_cards_info_europe <- gapminder %>%
  mutate(lifeExp = round(lifeExp,0),pop = round(pop,0),gdpPercap = round(gdpPercap,0)) %>%
  filter(country %in% dash_df$Europe$country) %>%
  group_split(country) %>%
  map(~ .x %>% filter(year %in% c('1952','2007')) %>%

        summarise(life_growth = round(((last(lifeExp)-first(lifeExp))/first(lifeExp))*100,0),
                  pop_growth = round(((last(pop)-first(pop))/first(pop))*100,0),
                  gdp_growth = round(((last(gdpPercap)-first(gdpPercap))/first(gdpPercap))*100,0),
                  .groups = 'pop'))%>%

  purrr::set_names(sort(names_europe))

#********************
#******** OCEANIA ****
#********************
names_oceania <- str_replace(dash_df$Oceania$country," ","-")

richest_oceania <- gapminder::gapminder %>%
  filter(country == 'Australia') %>%
  rename(richest_country = country,
         richest_LifeExp = lifeExp,
         richest_pop = pop,richest_gdp = gdpPercap)%>%
  select(year, richest_country,richest_LifeExp:last_col())

countries_selected_oceania <- gapminder::gapminder %>%
  mutate(lifeExp = round(lifeExp,0),pop = round(pop,0),gdpPercap = round(gdpPercap,0))%>%

  filter(country %in% dash_df$Oceania$country)%>%
  group_split(country) %>%
  purrr::map(~ .x %>% left_join(richest_oceania,by = 'year') %>%
        mutate(diff_lifeExp = round(lifeExp-richest_LifeExp,0),
               diff_pop = round(pop-richest_pop,0),
               diff_gdp = round(gdpPercap-richest_gdp,0)
        )) %>% purrr::set_names(sort(names_oceania))


growth_cards_info_oceania <- gapminder %>%
  mutate(lifeExp = round(lifeExp,0),pop = round(pop,0),gdpPercap = round(gdpPercap,0)) %>%
  filter(country %in% dash_df$Oceania$country) %>%
  group_split(country) %>%
  map(~ .x %>% filter(year %in% c('1952','2007')) %>%

        summarise(life_growth = round(((last(lifeExp)-first(lifeExp))/first(lifeExp))*100,0),
                  pop_growth = round(((last(pop)-first(pop))/first(pop))*100,0),
                  gdp_growth = round(((last(gdpPercap)-first(gdpPercap))/first(gdpPercap))*100,0),
                  .groups = 'pop'))%>%

  purrr::set_names(sort(names_oceania))
