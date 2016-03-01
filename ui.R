# Two file apps: ui.R

if (!require("shiny")) install.packages('shiny')
if (!require("stationaRy")) install.packages('stationaRy')

W <- get_isd_stations()

shinyUI(fixedPage(
  fixedRow(
    column(3,
           h1("NCDC"),
           selectInput(inputId = "country", label = "Weather Stations", sort(unique(W$country_name))),
           actionButton(inputId = "map", label = "Go"),
           tags$hr(),
           verbatimTextOutput("anzahl")
    ),
    column(9,
           htmlOutput("countryWStations")#, width="50%", height="30%")
    )
  )
))