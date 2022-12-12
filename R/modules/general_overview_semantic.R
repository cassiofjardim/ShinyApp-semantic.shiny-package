general_overview_UI <- function(id) {
  ns <- NS(id)
  tagList(segment(
    class = "ui raised segment general_overview",
    style = 'width: 100%;',
    label(class = "ui black ribbon", "General Overview"),
    div(
      id = 'panel_controls',
      selectInput(
        ns("select_country"),
        "Continents:",
        width = 'fit-content',
        choices = c('Africa', 'Americas', 'Asia', 'Europe', 'Oceania')
      ),

      shiny.semantic::multiple_radio(
        input_id = ns('vars_choice'),
        label = 'Main Variables',
        position = 'inline',
        choices = c('lifeExp','pop','gdpPercap')
      ),

      shinyWidgets::sliderTextInput(
        inputId =  ns("slider_new"),
        label = "Projections Range",

        choices = c(seq(1952, 2007, 5)),
        selected = '2007'

      )

    ),

    segment(
      class = "ui raised segment general_overview",
      style = 'width: 100%;',
      label(class = "ui black ribbon", "General Overview"),
      div(
        id = 'panel_charts',

        htmlOutput(ns('chart_1'))


      ))




  ))
}

general_overview_Server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {

      data_chart <- reactive({
        if (input$select_country == 'Africa') {
          continents_charts_list$Africa[[input$vars_choice]]

        } else{
          if (input$select_country == 'Americas') {
            continents_charts_list$Americas[[input$vars_choice]]

          } else{
            if (input$select_country == 'Asia') {
              continents_charts_list$Asia[[input$vars_choice]]

            } else{
              if (input$select_country == 'Europe') {
                continents_charts_list$Europe[[input$vars_choice]]


              } else{
                if (input$select_country == 'Oceania'){
                continents_charts_list$Oceania[[input$vars_choice]]}

              }
            }
          }


        }
      })

      output$chart_1 <- renderUI({

        if (input$slider_new[1] == "1952") {
          #
          div(style = 'display: flex;     flex-wrap: wrap;     justify-content: center;',
              h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}' ),
                 tags$img(src = paste0("img/",input$vars_choice,".svg"))),

              data_chart()[1])
        } else{
          if (input$slider_new[1] == "1957") {
            div(style = 'display: flex;     flex-wrap: wrap;     justify-content: center;',
                h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                   tags$img(src = paste0("img/",input$vars_choice,".svg"))),

                data_chart()[1:2])

          } else{
            if (input$slider_new[1] == "1962") {
              div(style = 'display: flex;     flex-wrap: wrap;     justify-content: center;',
                  h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                     tags$img(src = paste0("img/",input$vars_choice,".svg"))),
                  data_chart()[1:3])

            } else{
              if (input$slider_new[1] == "1967") {
                div(style = 'display: flex;     flex-wrap: wrap;',
                    h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                       tags$img(src = paste0("img/",input$vars_choice,".svg"))),
                    data_chart()[1:4])

              } else{
                if (input$slider_new[1] == "1972") {
                  div(style = 'display: flex;     flex-wrap: wrap;  ',
                      h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                         tags$img(src = paste0("img/",input$vars_choice,".svg"))),
                      data_chart()[1:5])

                } else{
                  if (input$slider_new[1] == "1977") {
                    div(style = 'display: flex;     flex-wrap: wrap;   ',
                        h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                           tags$img(src = paste0("img/",input$vars_choice,".svg"))),
                        data_chart()[1:6])

                  } else{
                    if (input$slider_new[1] == "1982") {
                      div(style = 'display: flex;     flex-wrap: wrap; ',
                          h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                             tags$img(src = paste0("img/",input$vars_choice,".svg"))),
                          data_chart()[1:7])

                    } else{
                      if (input$slider_new[1] == "1987") {
                        div(style = 'display: flex;     flex-wrap: wrap;  ',
                            h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                               tags$img(src = paste0("img/",input$vars_choice,".svg"))),
                            data_chart()[1:8])

                      } else{
                        if (input$slider_new[1] == "1992") {
                          div(style = 'display: flex;     flex-wrap: wrap;  ',
                              h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                                 tags$img(src = paste0("img/",input$vars_choice,".svg"))),
                              data_chart()[1:9])

                        } else{
                          if (input$slider_new[1] == "1997") {
                            div(style = 'display: flex;     flex-wrap: wrap; ',
                                h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                                   tags$img(src = paste0("img/",input$vars_choice,".svg"))),
                                data_chart()[1:10])

                          } else{
                            if (input$slider_new[1] == "2002") {
                              div(style = 'display: flex;     flex-wrap: wrap;     ',
                                  h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                                     tags$img(src = paste0("img/",input$vars_choice,".svg"))),
                                  data_chart()[1:11])

                            } else{
                              div(style = 'display: flex;     flex-wrap: wrap;   ',
                                  h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                                     tags$img(src = paste0("img/",input$vars_choice,".svg"))),
                                  data_chart()[1:12])

                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      })

    }
  )
}
