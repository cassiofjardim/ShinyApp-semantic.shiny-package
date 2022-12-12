library(shiny)
library(shiny.semantic)
library(fomantic.plus)
library(semantic.dashboard)

source('R/modules/continents_modules.R')



ui <-
  dashboardPage(

    dashboardHeader(color = "black", inverted = TRUE),
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

      tabItems(
        tabItem(
          tabName = 'panel_2',
          tabBox(
            collapsible = FALSE,
            title = "Americas",
            color = "black",
            width = 16,

            tabs = continents_UI('africa'))),

        tabItem(
          tabName = 'panel_3',

          tabBox(
            collapsible = FALSE,
            title = "Americas",
            color = "black",
            width = 16,
            tabs = list()
            # tabs = continents_UI('americas')

            # africa_UI('africa')
          )),

        tabItem(
          tabName = 'panel_4',

          tabBox(
            collapsible = FALSE,
            title = "Asia",
            color = "black",
            width = 16,

            tabs = continents_UI('asia')

            # africa_UI('africa')
          )),

        tabItem(
          tabName = 'panel_5',

          tabBox(
            collapsible = FALSE,
            title = "Europe",
            color = "black",
            width = 16,

            tabs = continents_UI('europe')

          )),

        tabItem(
          tabName = 'panel_6',

          tabBox(
            collapsible = FALSE,
            title = "Oceania",
            color = "black",
            width = 16,

            tabs = continents_UI('oceania')


          )),
        tabItem(
          tabName = 'overview',

          tabBox(
            collapsible = FALSE,
            title = "General Overview",
            color = "black",
            width = 16,

            tabs = continents_UI('general_overview')


          ))


      ))
  )

server <- function(input, output) {

  continents_Server('africa')
  continents_Server('americas')
  continents_Server('asia')
  continents_Server('europe')
  continents_Server('oceania')
  continents_Server('general_overview')



}

shinyApp(ui, server)
