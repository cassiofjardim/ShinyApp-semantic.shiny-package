

countries_charts <- function(data,var){

  data %>%


    hchart(
      "areaspline",

      hcaes(x = year, y = .data[[var]]),
      visible = TRUE,
      showInLegend = TRUE,
      name  = paste0(var),
      zIndex = 9999999,
      zoneAxis = 'x',
      color = 'black'

      # backgroundColor = NULL,
      # margins = c(-1, 0, 0, 1),
      # spacingTop = 0,
      # spacingRight = 0,
      # spacingBottom = 0,
      #
      # spacingLeft = 0,
      # plotBorderWidth = 0,
      # borderWidth = 0

    ) %>%

    # hc_size(height = 200) %>%



    hc_xAxis(

      title = list(text = "Years",
                   style = list(fontWeight = "bold",
                                color = "black")),

      plotLines = list(
        list(
          # value = ymd(first_forecasting_date) %>% datetime_to_timestamp(),

          width= 2,
          color = "black",
          dashStyle = "longdashdot",

          label = list(
            text = "",
            align = "right",
            verticalAlign = "middle",
            rotation=0,
            x= 180,
            y= 100,
            style = list(color = "black",fontWeight = "bold")
          )
        )
      ),

      plotBands = list(
        list(
          # from = ymd(first_forecasting_date) %>% datetime_to_timestamp(),                      # Start of the plotband (first game # of injury)
          # to = ymd(last_forecasting_month_date) %>% datetime_to_timestamp(),                         # End of the plotband (last game missed)
          # color = "#333F47", # RGB specification of the lakers purple color with a 30% alpha (transparency)
          label = list(
            dashStyle = "longdashdot",

            text = "",          # Text for the plotBand
            style = list(fontWeight = "bold", color = "black", fontSize = "12px")
          )
        )
      )


    ) %>%

    hc_yAxis(
      title = list(
        text = paste0(var),
        # text = paste0(model_name," x ",dash_config_file_json$SourceName),
        style = list(fontWeight = "bold",
                     color = "black")),

      style = list(fontSize = "16px",
                   color =  "black",
                   fontWeight = "900",
                   fontFamily = "Roboto Condensed"),

      plotLines = list(
        list(
          # value = ymd(first_forecasting_date) %>% datetime_to_timestamp(),
          color = "black",
          dashStyle = "longdashdot",

          label = list(
            text = "Forecasting",
            align = "right",
            verticalAlign = "middle",
            rotation=0,
            x= 180,
            y= 50,
            style = list(color = "black",fontWeight = "bold")
          )
        )
      ),
      gridLineWidth = 0.5,
      gridLineColor = 'black',
      gridLineDashStyle = "longdash") %>%

    hc_tooltip(
      outside = TRUE,
      shadow = TRUE,
      borderColor = "lightgray",
      botderWidth = 0,
      backgroundColor = "whitesmoke", # background do tooltip!
      style = list(textOutline = "5px white")
    )%>%

    hc_plotOptions(
      series = list(
        marker = list(enabled = TRUE,
                      radius=  2.5),
        lineWidth = .25,
        shadow = TRUE,
        fillOpacity = 0.025,
        color = "lightblue",
        fillColor = list(
          linearGradient = list(
            x1 = 0,
            y1 = 0,
            x2 = 1,
            y2 = 1
          ),
          stops = list(
            list(0.10, "#BBDBBE"),list(.5, "#DEEBDD"))
        )
      )

    )

}







table_style <- function(dataframe, height = NULL, fontsize = NULL, cellPadding = NULL){
  dataframe%>%
    reactable(
      style = list(fontFamily =glue::glue("{}")),
      pagination = FALSE,
      height = height,

      # style = list(fontFamily = "Roboto, sans-serif", fontSize = "0.75rem"),
      striped = TRUE,
      highlight = TRUE,
      bordered = TRUE,
      theme = reactableTheme(
        borderColor = "lightgray",
        borderWidth = 1.5,
        stripedColor = "#f6f8fa",
        highlightColor = "#f0f5f9",
        cellPadding = cellPadding,
        style = list(fontFamily = glue::glue("{}")),
        searchInputStyle = list(width = "100%")
      ),
      defaultColDef = colDef(
        vAlign = "center",
        headerVAlign = "bottom",
        align = 'center',
        style  =list(fontWeight = "bold"),

        footerStyle = list(fontWeight = "bold")
      ),
      columns = list(
        country = colDef(name = "Country",
                         style = list(fontSize = fontsize,fontWeight = "bold",
                                      background = "rgba(0, 0, 0, 0.05)"),
                         # headerStyle = list(position = "sticky", left = 0,
                         #                    background = "#fff", zIndex = 1),
                         sticky = "left"

        ),
        # Trucks = colDef(name = "Trucks"),
        continent = colDef(name = "Continent",
                           style = list(fontSize = fontsize,fontWeight = "bold",
                                        background = "rgba(0, 0, 0, 0.05)")),
        lifeExp = colDef(name = "Life Expectancy",
                         style = list(fontSize = fontsize,fontWeight = "bold",
                                      background = "rgba(0, 0, 0, 0.05)")),
        pop = colDef(name = "Population",
                     style = list(fontSize = fontsize,fontWeight = "bold",
                                  background = "rgba(0, 0, 0, 0.05)")),
        gdpPercap = colDef(name = "GDP Percap.",
                           style = list(fontSize = fontsize,fontWeight = "bold",
                                        background = "rgba(0, 0, 0, 0.05)")),

        year = colDef(name = "Years",

                      width = 100,

                      format = colFormat(
                        # suffix = " (un)",
                        separators = FALSE),
                      style = list(fontSize = fontsize,fontWeight = "bold",
                                   background = "whitesmoke")


        )

      ))
}











countries_x_richest_function <- function(data, var,var_rich,var_diff, country_name, richest_country_name)  {



  highchart(type = 'chart')%>%

    # hchart(marginLeft = 0) %>%

    # hc_size(height = 200) %>%

    ############### Adicionar Serie Trucks ##########################################

  hc_add_series(data =  data,
                "line",
                # margin = list(0, 0, 0, 0),

                hcaes( x = year, y = .data[[var]]),
                lineWidth = 2,
                # showInLegend = TRUE,
                color = '#254948',
                name = country_name) %>%

    hc_add_series(data = data ,
                  "line",
                  # margin = list(0, 0, 0, 0),

                  hcaes( x = year, y = .data[[var_rich]]),
                  lineWidth = 2,
                  color = 'blue',
                  # showInLegend = TRUE,
                  name = richest_country_name) %>%

    hc_add_yAxis(title = list(text = paste0(country_name," x ",richest_country_name,": ",var),
                              rotation = 270,
                              margin =  50,
                              offset = 100),
                 style = list(fontWeight = "bold"),
                 opposite = FALSE,
                 relative = 3,

                 gridLineWidth = 0.5,
                 gridLineColor = 'black',
                 gridLineDashStyle = "longdash",  # Light blue long dashed gridlines

                 labels = list(style = list(color =  'black',
                                            fontWeight = "bold",
                                            fontFamily = "Roboto Condensed")),
                 lineWidth = 0) %>%

    # #############################################################################
  # # Abrir Espaço para Serie de Erros e Adicionar Serie de Erros
  # #############################################################################
  hc_add_yAxis(title = list(text = "Difference in Time:",
                            style = list(fontWeight = "bold",
                                         color = "black"),
                            rotation = 270,
                            margin =  50,
                            offset = 100),
               # tickInterval = 2000,
               relative = 1,
               opposite = FALSE,
               gridLineWidth = 0.5,
               gridLineColor = '#73BB91',
               gridLineDashStyle = "longdash",  # Light blue long dashed gridlines
               #
               labels = list(style = list(color =  'black',
                                          fontWeight = "bold",
                                          fontFamily = "Roboto Condensed"))) %>%

    hc_add_series(data = data,
                  "column",
                  hcaes(x = year, y = .data[[var_diff]] ),
                  yAxis = 1,
                  showInLegend = T,
                  name = "Difference In Time",
                  color = "#82b2b0") %>%

    hc_chart(zoomType = "x") %>%

    hc_exporting (
      enabled = TRUE,
      filename = "chart_data",
      style = list(fontSize = "14px",
                   color =  "black",
                   fontWeight = "700",
                   fontFamily = "Roboto Condensed"),
      buttons = list(
        contextButton = list(menuItems = list(
          'downloadSVG','downloadXLS',
          'separator', 'label')))
    )%>%
    hc_plotOptions(
      series = list(

        lineWidth = 3,
        marker = list(
          enabled = TRUE
        ),
        borderRadius = 1

      )
    )

}

################################################################################
############### BAR CHART ######################################################
################################################################################

function_us_chart <- function(data, var,var_us,country_name){

  highchart(type = 'chart')%>%

    # hc_size(height = 200) %>%

    ############### Adicionar Serie Trucks ##########################################

  hc_add_series(data =  data,
                "column",

                hcaes( x = year, y = .data[[var]]),
                lineWidth = 2,
                # showInLegend = TRUE,
                color = '#254948',
                name = country_name) %>%

    hc_add_series(data = us_df ,
                  "column",color = 'red',

                  hcaes( x = year, y = .data[[var_us]]),
                  lineWidth = 2,
                  # showInLegend = TRUE,
                  name = "United States")

}



#
#   hc_title(
#     text = paste0(input$select_models),
#     margin = 20,
#     align = "center",
#     style = list(color = "black",fontSize = "12px",
#                  fontWeight = "bold",
#                  useHTML = TRUE,
#                  fontFamily =glue::glue("{}")))%>%
#   hc_xAxis(labels = list(style = list(color =  'black',
#                                       fontWeight = "bold",
#                                       fontFamily =glue::glue("{}"))),
#            title = list(text = "Years (Splits)",
#                         align = "high",
#                         style = list(fontSize = "12px",
#                                      color =  "black",
#                                      fontWeight = "bold",
#                                      fontFamily =glue::glue("{}"))))%>%
#
#   hc_yAxis(
#     gridLineWidth = 0.5,
#     gridLineColor = 'black',
#     gridLineDashStyle = "longdash",
#
#     title = list(
#       text = "",
#       align = "high",
#       style = list(fontSize = "8px",
#                    color =  "black",
#                    fontWeight = "bold",
#                    fontFamily =glue::glue("{}"))),
#
#     labels = list(style = list(color =  'black',
#                                fontWeight = "bold",
#                                fontFamily =glue::glue("{}")),
#                   format = "{value}%")) %>%
#   #
#   hc_plotOptions(series = list(
#     dataLabels = list(enabled = TRUE,
#                       shape = 'callout',
#                       backgroundColor = 'rgba(0, 0, 0, 0.75)',
#                       color = "whitesmoke",
#                       format= '{y}%',
#                       y= -5 )
#   ))%>%
#   hc_size(height = 300)

################################################################################
############################# GENERAL OVERVIEW #################################
################################################################################

general_overview_charts <- function(data, var, year) {
  highchart(type = 'chart') %>%
    hc_add_series(data = data,
                  showInLegend = FALSE,
                  hcaes(x = year, y = .data[[var]], group = country),
                  type = 'column') %>%
    hc_title(text = paste0(unique(data$year)),
             margin = 20,
             align = "center",
             style = list(color = "black",fontWeight = 'bold', useHTML = TRUE)) %>%
    hc_size(height = 200, width = 250) %>% hc_boost(enabled = FALSE)
}
