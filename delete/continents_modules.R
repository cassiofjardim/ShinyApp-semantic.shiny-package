continents_UI <- function(id) {
  ns <- NS(id)
  tagList(list(
    menu = tags$img(
      'Algeria',
      src = paste0('img/icons_flags/', paste0(names_africa[1]), '.png'),
      width = '18px',
      height = '18px',
      style = 'margin-right: .25em; border-radius: 50%'
    ),

    content =

      list(
        cards(
          class = "top_cards",
          h1(
            class = 'cards_title',
            'Country growth rate for: Life Expectancy, Population and GDP per Capita. (Considering all sample: 1952 - 2007)'),


          card(div(
            class = "content",
            div(class = "header", "Country"),
            div(class = "meta", "Name"),
            div(class = "description", "Elliot Fu is a film-maker from New York.")
          )),

          card(div(
            class = "content",
            div(class = "header", "Life Expectancy Growth (%)"),
            div(class = "meta", "Growth in Life Expectancy"),
            div(class = "description", "John Bean is a film-maker from London.")
          )),

          card(div(
            class = "content",
            div(class = "header", "Population Growth (%)
"),
            div(class = "meta", "Increasing in Population"),
            div(class = "description", "John Bean is a film-maker from London.")
          )),

          card(div(
            class = "content",
            div(class = "header", "GDP Percapita Growth (%)
"),
            div(class = "meta", "GDP Percapita Growth"),
            div(class = "description", "John Bean is a film-maker from London.")
          ))
        ),
        segment(
          style = 'display: flex; gap: .5em; padding: 1em;',

          tabBox(
            id = ns('top_left'),
            title_side = 'top_left',
            title = 'C-O-U-N-T-R-Y Life Expectancy, Population Growth and GDP Percapita evolution',
            collapsible = FALSE,
            color = 'black',
            width = 5,
            tabs = list(
              list(
                menu = tags$img(
                  "Life Expectancy",
                  src = 'img/exp_life.svg',
                  width = '26px',
                  height = '26px'
                ),
                content = div(
                  id = 'chart11',
                  highchartOutput(ns('chart_1')),
                  shiny.semantic::sliderInput(
                    inputId = 'input_top',
                    label = 'Select',
                    min = 0,
                    max = 10,
                    value = 5
                  )
                )
              ),
              list(
                menu = tags$img(
                  "Population",
                  src = 'img/population.svg',
                  width = '26px',
                  height = '26px'
                ),
                content =
                  highchartOutput(ns('chart_2'))
              ),
              list(
                menu = tags$img(
                  "GDP PErcapita",
                  src = 'img/gdp.svg',
                  width = '26px',
                  height = '26px'
                ),
                content =
                  highchartOutput(ns('chart_3'))
              )

            )
          ),

          tabBox(
            id = ns('top_right'),
            title_side = 'top_right',
            title = 'C-O-U-N-T-R-Y Life Expectancy, Population Growth and GDP Percapita evolution',
            collapsible = FALSE,
            color = 'black',
            width = 5,
            tabs = list(
              list(
                menu = tags$img(
                  "Life Expectancy - (Continent)",
                  src = 'img/exp_life.svg',
                  width = '26px',
                  height = '26px'
                ),
                content = div(
                  id = 'chart4',
                  highchartOutput(ns('chart_4')),
                  shiny.semantic::sliderInput(
                    inputId = 'input_top',
                    label = 'Select',
                    min = 0,
                    max = 10,
                    value = 5
                  )
                )
              ),
              list(
                menu = tags$img(
                  "Population - (Continent)",
                  src = 'img/population.svg',
                  width = '26px',
                  height = '26px'
                ),
                content =
                  highchartOutput(ns('chart_5'))
              ),
              list(
                menu = tags$img(
                  "GDP PErcapita - (Continent)",
                  src = 'img/gdp.svg',
                  width = '26px',
                  height = '26px'
                ),
                content =
                  highchartOutput(ns('chart_6'))
              )

            )
          )
        ),
        ################################################################################

        segment(
          style = 'display: flex;
                          gap: .5em;',
          tabBox(
            id = 'bottom_left',
            title_side = 'bottom_left',
            title = 'C-O-M-P-A-R-I-S-I-O-N Life Expectancy, Population Growth and GDP Percapita evolution',
            collapsible = FALSE,
            color = 'black',
            width = 5,
            tabs = list(
              list(
                menu = tags$img(
                  "Life Expectancy",
                  src = 'img/exp_life.svg',
                  width = '26px',
                  height = '26px'
                ),
                content = div(
                  id = 'chart11',
                  highchartOutput(ns('chart_7')),
                  shiny.semantic::sliderInput(
                    inputId = 'input_top',
                    label = 'Select',
                    min = 0,
                    max = 10,
                    value = 5
                  )
                )
              ),
              list(
                menu = tags$img(
                  "Population",
                  src = 'img/population.svg',
                  width = '26px',
                  height = '26px'
                ),
                content =
                  highchartOutput(ns('chart_8'))
              ),
              list(
                menu = tags$img(
                  "GDP PErcapita",
                  src = 'img/gdp.svg',
                  width = '26px',
                  height = '26px'
                ),
                content =
                  highchartOutput(ns('chart_9'))
              )

            )
          ),

          tabBox(
            id = 'bottom_right',
            title = "Dataset - Country",
            collapsible = FALSE,
            color = "black",
            width = 5,
            tabs = list(list(
              menu = "First Tab",
              content = div(
                id = 'table',
                highchartOutput(ns('table')),
                shiny.semantic::sliderInput(
                  inputId = 'input1',
                  label = 'Select',
                  min = 0,
                  max = 10,
                  value = 5
                )
              )
            ))
          )
        )
      )


  ),

  list(menu = 'Menu 2',
       content = 'Content 2')
  )


}


continents_Server <- function(id) {
  moduleServer(id,
               function(input, output, session) {
                 observeEvent(input$top_left , {
                   shiny.semantic::update_tabset(session,
                                                 input_id = 'top_right',
                                                 selected = input$top_left)
                 })


                 output$chart_1 <- renderHighchart({
                   mtcars %>%
                     hchart(type = 'spline', hcaes(data = mtcars, x = mpg, y = cyl))
                 })
                 #
                 output$chart_2 <- renderHighchart({
                   mtcars %>%
                     hchart(type = 'spline', hcaes(data = mtcars, x = mpg, y = cyl))
                 })
                 #
                 output$chart_3 <- renderHighchart({
                   mtcars %>%
                     hchart(type = 'spline', hcaes(data = mtcars, x = mpg, y = cyl))
                 })
                 #
                 output$chart_4 <- renderHighchart({
                   mtcars %>%
                     hchart(type = 'spline', hcaes(data = mtcars, x = mpg, y = cyl))
                 })

                 output$chart_5 <- renderHighchart({
                   mtcars %>%
                     hchart(type = 'spline', hcaes(data = mtcars, x = mpg, y = cyl))
                 })

                 output$chart_6 <- renderHighchart({
                   mtcars %>%
                     hchart(type = 'spline', hcaes(data = mtcars, x = mpg, y = cyl))
                 })
                 #




               })
}
