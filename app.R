library(shiny)
library(shiny.semantic)
library(shinyWidgets)
library(semantic.dashboard)
library(reactable)
library(purrr)
library(highcharter)

source(file = 'R/main.R')

source(file = 'R/modules/continents_module_main.R')
source(file = 'R/modules/general_overview_semantic.R')

source(file = 'R/charts/charts_functions.R')
source(file = 'R/charts/splits_charts.R')

ui <- dashboardPage(
  dashboardHeader(color = "black",
                  center = tags$img(src = 'img/gapminder-logo.svg', width = '224px', height  ='24px')),
  dashboardSidebar(
    side = "left",
    size = "thin",
    color = "teal",
    sidebarMenu(
      menuItem(
        text = p(
          tags$img(
            src = paste0('img/icons_flags/', 'Africa', '.png'),
            width = '18px',
            height = '18px',
            style = 'margin-right: .25em;'
          ),
          "Africa",
          style = '    text-decoration: none;font-style: normal;
                                              font-size: 1em; margin-left: 1em;font-weight: 600;'
        ),
        tabName = "panel_2"
      ),

      menuItem(
        text = p(
          tags$img(
            src = paste0('img/icons_flags/', 'Americas', '.png'),
            width = '18px',
            height = '18px',
            style = 'margin-right: .25em;'
          ),
          "Americas",
          style = '    text-decoration: none;font-style: normal;
                                              font-size: 1em; margin-left: 1em;font-weight: 600;'
        ),
        tabName = "panel_3"
      ),

      menuItem(
        text = p(
          tags$img(
            src = paste0('img/icons_flags/', 'Asia', '.png'),
            width = '18px',
            height = '18px',
            style = 'margin-right: .25em;'
          ),
          "Asia",
          style = '    text-decoration: none;font-style: normal;
                                              font-size: 1em; margin-left: 1em;font-weight: 600;'
        ),
        tabName = "panel_4"
      ),

      menuItem(
        text = p(
          tags$img(
            src = paste0('img/icons_flags/', 'Europe', '.png'),
            width = '18px',
            height = '18px',
            style = 'margin-right: .25em;'
          ),
          "Europe",
          style = '    text-decoration: none;font-style: normal;
                                              font-size: 1em; margin-left: 1em;font-weight: 600;'
        ),
        tabName = "panel_5"
      ),

      menuItem(
        text = p(
          tags$img(
            src = paste0('img/icons_flags/', 'Oceania', '.png'),
            width = '18px',
            height = '18px',
            style = 'margin-right: .25em;border-radius: 50%;'
          ),
          "Oceania",
          style = '    text-decoration: none;font-style: normal;
                                              font-size: 1em; margin-left: 1em;font-weight: 600;'
        ),
        tabName = "panel_6"
      ),
      menuItem(
        text =  p(
          "General Overview - by Years",
          style = '    text-decoration: none;font-style: normal;
                                              font-size: .95em; margin-left: .25em;font-weight: 600;'
        ),
        tabName = "overview"
      )


    )
  ),
  dashboardBody(
    includeCSS(path = 'www/css/style.css'),
    tabItem(
      tabName = 'panel_2',
      tabBox(
        collapsible = FALSE,
        title = "Africa",
        color = "black",
        width = 16,
        tabs = continents_UI(
          'africa',
          countries_selected_df = countries_selected_africa,
          cards_info = growth_cards_info_africa,
          continent_df_names = names_africa,
          richest_country = 'Egypt'
        )
      )),

    tabItem(
      tabName = 'panel_3',
      tabBox(
        collapsible = FALSE,
        title = "Americas",
        color = "black",
        width = 16,

        tabs = continents_UI('americas',
                             countries_selected_df = countries_selected_americas,
                             cards_info = growth_cards_info_americas,
                             continent_df_names =  names_americas,
                             richest_country = 'United States')


      )),

    tabItem(
      tabName = 'panel_4',
      tabBox(
        collapsible = FALSE,
        title = "Asia",
        color = "black",
        width = 16,
        tabs = continents_UI('asia',
                             countries_selected_df = countries_selected_asia,
                             cards_info = growth_cards_info_asia,
                             continent_df_names =  names_asia,
                             richest_country = 'Kuwait')


      )),

    tabItem(
      tabName = 'panel_5',
      tabBox(
        collapsible = FALSE,
        title = "Europe",
        color = "black",
        width = 16,
        tabs = continents_UI('europe',
                             countries_selected_df = countries_selected_europe,
                             cards_info = growth_cards_info_europe,
                             continent_df_names =  names_europe,
                             richest_country = 'United Kingdom')


      )),

    tabItem(
      tabName = 'panel_6',
      tabBox(
        collapsible = FALSE,
        title = "Oceania",
        color = "black",
        width = 16,
        tabs = continents_UI('oceania',
                             countries_selected_df = countries_selected_oceania,
                             cards_info = growth_cards_info_oceania,
                             continent_df_names =  names_oceania,
                             richest_country = 'Australia')


      )),

    tabItem(
      tabName = 'overview',
      general_overview_UI('overview'))

    ))

server <- function(input, output) {

  lixo_Server("africa",continent_richeste_country = 'Egypt',
              countries_selected_df = countries_selected_africa,
              countries_names = names_africa)

  lixo_Server("americas",continent_richeste_country = 'United States',
              countries_selected_df = countries_selected_americas,
              countries_names = names_americas)

  lixo_Server("asia",continent_richeste_country = 'Japan',
              countries_selected_df = countries_selected_asia,
              countries_names = names_asia)

  lixo_Server("europe",continent_richeste_country = 'United Kingdom',
              countries_selected_df = countries_selected_europe,
              countries_names = names_europe)

  lixo_Server("oceania",continent_richeste_country = 'Australia',
              countries_selected_df = countries_selected_oceania,
              countries_names = names_oceania)


  general_overview_Server('overview')
}

shinyApp(ui, server)


