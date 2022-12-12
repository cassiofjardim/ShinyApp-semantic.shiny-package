continents_UI <- function(id,countries_selected_df,cards_info, continent_df_names, richest_country) {
  ns <- NS(id)

  countries_names<- continent_df_names

  do.call("tagList",

          1:length(countries_names) %>% map(~ list(
            menu = list(tags$img(src = paste0('img/icons_flags/',countries_names[.x],'.png'),
                                 p(countries_names[.x], style  ='color: black;padding-left:.25em; font-weight:900;'))),

            content = list(
              cards(
                class = "top_cards",
                h1(
                  class = 'cards_title',
                  'Country growth rate for: Life Expectancy, Population and GDP per Capita. (Considering all sample: 1952 - 2007)'
                ),




                card(div(
                  class = "content",
                  div(class = "header", p(glue::glue("Country: {str_to_upper(countries_names[.x])}"), style  ='font-size: 1.15em;'), tags$span('2007', style = 'font-weight:800;')),
                  # div(class = "meta", "Name"),
                  div(class = "description_country",
                      tags$img(src = paste0('img/icons_flags/',countries_names[.x],'.png'), width = '100px', height = '100px'),
                      div(class = 'info',
                          h6(paste0('Life Expectancy: ',last(countries_selected_df[[countries_names[.x]]][['lifeExp']]),' years')),
                          h6(paste0('Population: ',last(countries_selected_df[[countries_names[.x]]][['pop']]))),
                          h6(paste0('GDP per Capita: $',last(countries_selected_df[[countries_names[.x]]][['gdpPercap']])))


                      )
                      )
                )),

                card(div(
                  class = "content",
                  div(class = "header", "Life Expectancy Growth (%) - Historical"),
                  # div(class = "meta", "Growth in Life Expectancy"),
                  div(class = "description_life", tags$span(cards_info[[countries_names[.x]]]$life_growth[1],'%', style = 'font-size: 4rem; font-weight: 900; font-family: Lato;'))
                )),

                card(div(
                  class = "content",
                  div(class = "header", "Population Growth (%) - Historical"),
                  # div(class = "meta", "Increasing in Population"),
                  div(class = "description_pop", tags$span(cards_info[[countries_names[.x]]]$pop_growth[1],'%', style = 'font-size: 4rem; font-weight: 900; font-family: Lato;'))
                )),

                card(div(
                  class = "content",
                  div(class = "header", "GDP Percapita Growth (%) - Historical"),
                  # div(class = "meta", "GDP Percapita Growth"),
                  div(class = "description_gdp", tags$span(cards_info[[countries_names[.x]]]$gdp_growth[1],'%', style = 'font-size: 4rem; font-weight: 900; font-family: Lato;'))
                ))
              ),



              segment(
                style = 'display: flex; gap: .5em; padding: 1em;',
                tabBox(
                  id = 'top_left',
                  title = 'Life Expectancy, Population Growth and GDP Percapita evolution',
                  color = 'black',
                  width = 5,
                  tabs = list(
                    list(
                      menu = list(
                        tags$img(
                          "Life Expectancy",
                          src = 'img/exp_life.svg',
                          width = '26px',
                          height = '26px'
                        )
                      ),
                      content = list(highchartOutput(ns(
                        paste0('chart_1', countries_names[.x])
                      )),
                      sliderTextInput(
                        width = '100%',
                        inputId =  ns(paste0("slider_years_life", countries_names[.x])),
                        label = "Years Range",

                        choices = c(as.character(seq(1952, 2007, 5))),
                        selected = '2007'
                        # '2007-2021'
                      )
                      )
                    ),

                    list(
                      menu = list(
                        tags$img(
                          "Population",
                          src = 'img/pop.svg',
                          width = '26px',
                          height = '26px'
                        )
                      ),
                      content = list(highchartOutput(ns(
                        paste0('chart_2', countries_names[.x])
                      )),
                      sliderTextInput(
                        width = '100%',
                        inputId =  ns(paste0("slider_years_pop", countries_names[.x])),
                        label = "Years Range",

                        choices = c(as.character(seq(1952, 2007, 5))),
                        selected = '2007'
                        # '2007-2021'
                      )

                      )
                    ),

                    list(
                      menu = list(
                        tags$img(
                          "GDP Percapita",
                          src = 'img/gdp.svg',
                          width = '26px',
                          height = '26px'
                        )
                      ),
                      content = list(highchartOutput(ns(
                        paste0('chart_3', countries_names[.x])
                      )),
                      sliderTextInput(
                        width = '100%',
                        inputId =  ns(paste0("slider_years_gdp", countries_names[.x])),
                        label = "Years Range",

                        choices = c(as.character(seq(1952, 2007, 5))),
                        selected = '2007'
                        # '2007-2021'
                      )
                      )
                    )



                  )
                ),

                tabBox(
                  id = 'top_left',
                  title =  paste0('Comparing with Richest Country in Continent: ',richest_country),

                  color = 'black',
                  width = 5,
                  tabs = list(
                    list(
                      menu = list(
                        tags$img(
                          "Life Expectancy",
                          src = 'img/exp_life.svg',
                          width = '26px',
                          height = '26px'
                        )
                      ),
                      content = list(highchartOutput(ns(
                        paste0('difference_life_chart_', countries_names[.x])
                      )))
                    ),

                    list(
                      menu = list(
                        tags$img(
                          "Population",
                          src = 'img/pop.svg',
                          width = '26px',
                          height = '26px'
                        )
                      ),
                      content = list(highchartOutput(ns(
                        paste0('difference_pop_chart_', countries_names[.x])
                      )))
                    ),

                    list(
                      menu = list(
                        tags$img(
                          "GDP Percapita",
                          src = 'img/gdp.svg',
                          width = '26px',
                          height = '26px'
                        )
                      ),
                      content = list(highchartOutput(ns(
                        paste0('difference_gdp_chart_', countries_names[.x])
                      )))
                    )



                  )
                )
              ),

              segment(
                style = 'display: flex; gap: .5em; padding: 1em; ',
                tabBox(
                  id = 'top_left',
                  title = 'Life Expectancy, Population Growth and GDP Percapita evolution',
                  color = 'black',
                  width = 5,
                  tabs = list(
                    list(
                      menu = list(
                        tags$img(
                          "Life Expectancy",
                          src = 'img/exp_life.svg',
                          width = '26px',
                          height = '26px'
                        )
                      ),
                      content = list(highchartOutput(ns(
                        paste0('country_us_chart_life', countries_names[.x])
                      )))
                    ),

                    list(
                      menu = list(
                        tags$img(
                          "Population",
                          src = 'img/pop.svg',
                          width = '26px',
                          height = '26px'
                        )
                      ),
                      content = list(highchartOutput(ns(
                        paste0('country_us_chart_pop', countries_names[.x])
                      )))
                    ),

                    list(
                      menu = list(
                        tags$img(
                          "GDP Percapita",
                          src = 'img/gdp.svg',
                          width = '26px',
                          height = '26px'
                        )
                      ),
                      content = list(highchartOutput(ns(
                        paste0('country_us_chart_gdp', countries_names[.x])
                      )))
                    )



                  )
                ),

                tabBox(
                  id = 'top_left',
                  title = paste0(
                    countries_names[.x],
                    ' - Dataset'
                  ),
                  color = 'black',
                  width = 5,
                  tabs = list(
                    list(
                      menu = list(

                        tags$img(
                          "Dataset",
                          src = 'img/exp_life.svg',
                          width = '26px',
                          height = '26px'
                        )
                      ),
                      content = list(


                        reactableOutput(ns(paste0(
                          'tabel_country_',  countries_names[.x]
                        ))),

                       div( downloadButton(
                          ns(glue::glue("download_country{.x}")),
                          class = 'download_table_btn',
                          icon = NULL,
                          label = 'Download(.xlsx)'
                        ))
                      )
                    )



                  )
                )
              )



            )
          )))



}





lixo_Server <- function(id,countries_names,countries_selected_df,
                        continent_richeste_country) {
  moduleServer(id,
               function(input, output, session) {

                 charts_output_life <- function(x) {
                   output[[paste0("chart_1", countries_names[x])]] <-
                     renderHighchart({
                       countries_selected_df[[countries_names[x]]] %>%
                         filter(year <= input[[paste0('slider_years_life', countries_names[x])]])%>%
                         countries_charts(var = 'lifeExp')

                     })

                   output[[paste0("chart_2", countries_names[x])]] <-
                     renderHighchart({
                       countries_selected_df[[countries_names[x]]] %>%
                         filter(year <= input[[paste0('slider_years_pop', countries_names[x])]])%>%
                         countries_charts(var = 'pop')

                     })

                   output[[paste0("chart_3", countries_names[x])]] <-
                     renderHighchart({
                       countries_selected_df[[countries_names[x]]] %>%
                         filter(year <= input[[paste0('slider_years_gdp', countries_names[x])]])%>%
                         countries_charts(var = 'gdpPercap')

                     })


                 }

                 1:length(countries_names) %>% map(~ charts_output_life(.x))

#*******************************************************************************
#*****************Countries Comparision CHARTS: TOP RIGHT **********************
#*******************************************************************************
                 charts_difference <- function(x) {
                   output[[paste0("difference_life_chart_", countries_names[x])]] <-
                     renderHighchart({
                       countries_x_richest_function(
                         data = countries_selected_df[[countries_names[x]]],
                         var = 'lifeExp',
                         var_rich = 'richest_LifeExp',
                         var_diff = 'diff_lifeExp',
                         richest_country_name = continent_richeste_country,
                         country_name = countries_names[x]
                       )

                     })

                   output[[paste0("difference_pop_chart_", countries_names[x])]] <-
                     renderHighchart({
                       countries_x_richest_function(
                         data = countries_selected_df[[countries_names[x]]],
                         var = 'pop',
                         var_rich = 'richest_pop',
                         var_diff = 'diff_pop',
                         richest_country_name = continent_richeste_country,
                         country_name = countries_names[x]
                       )

                     })

                   output[[paste0("difference_gdp_chart_", countries_names[x])]] <-
                     renderHighchart({
                       countries_x_richest_function(
                         data = countries_selected_df[[countries_names[x]]],
                         var = 'gdpPercap',
                         var_rich = 'richest_gdp',
                         var_diff = 'diff_gdp',
                         richest_country_name = continent_richeste_country,
                         country_name = countries_names[x]
                       )

                     })


                 }

                 1:length(countries_names) %>% map(~ charts_difference(.x))

##******************************************************************************
##*****************Countries TABLE DOWNLOAD*************************************
##******************************************************************************

                 tables_output_function <- function(x) {
                   output[[paste0("tabel_country_",  countries_names[x])]] <-
                     renderReactable({
                       countries_selected_df[[countries_names[x]]] %>%
                         select(country,-continent,  year, lifeExp, pop, gdpPercap) %>%

                         table_style(height = 'auto',
                                     fontsize = '12px',
                                     cellPadding = '3px 6px')
                     })

                 }


                 1:length(countries_names) %>% map( ~ tables_output_function(.x))

                 tables_download_function <- function(x) {
                   output[[paste0('download_country', x)]] <- downloadHandler(
                     filename = function() {
                       paste0(countries_names[x], ".xlsx")
                     },
                     content = function(file) {
                       writexl::write_xlsx(
                         countries_selected_df[[x]] %>%
                           select(country,-continent,  year, lifeExp, pop, gdpPercap),
                         file
                       )
                     }
                   )

                 }

                 1:length(countries_names) %>% map( ~ tables_download_function(.x))
                 #


##******************************************************************************
##*****************Countries CHARTS UNITED STATES X COUNTRY*********************
##******************************************************************************
                 ##*
                 ##*
                 charts_us_comparision <- function(x) {

                   output[[paste0("country_us_chart_life", countries_names[x])]] <-

                     renderHighchart({
                       function_us_chart(
                         data = countries_selected_df[[countries_names[x]]],
                         var = 'lifeExp', var_us = 'lifeExp_us',
                         country_name = countries_names[x]
                       )

                     })

                   output[[paste0("country_us_chart_pop", countries_names[x])]] <-
                     renderHighchart({
                       function_us_chart(
                         data = countries_selected_df[[countries_names[x]]],
                         var = 'pop', var_us = 'pop_us',
                         country_name = countries_names[x]
                       )

                     })

                   output[[paste0("country_us_chart_gdp", countries_names[x])]] <-
                     renderHighchart({
                       function_us_chart(
                         data = countries_selected_df[[countries_names[x]]],
                         var = 'gdpPercap', var_us = 'gdp_us',
                         country_name = countries_names[x]
                       )

                     })




                 }

                 1:length(countries_names) %>% map( ~ charts_us_comparision(.x))


               })





}
