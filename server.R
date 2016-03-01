# Two file apps: server.R

if (!require("googleVis")) install.packages('googleVis')
if (!require("shiny")) install.packages('shiny')
if (!require("stationaRy")) install.packages('stationaRy')
if (!require("magrittr")) install.packages('magrittr')
if (!require("dplyr")) install.packages('dplyr')

W <- get_isd_stations()

shinyServer(function(input, output){
  
  data <- eventReactive(input$map,{
    filter(W, country_name==input$country) %>%
      mutate(latlong = paste(lat, lon, sep=":"))
  })  
  
  #output$anzahl <- renderText(nrow(data()))
  output$anzahl <- renderText(paste(nrow(data()),"found"))
  
  output$countryWStations <- renderGvis({
    #print(nrow(data()))
    gvisMap(data(), locationvar="latlong", tipvar = "name", 
      options=list(
        showTip=TRUE, showLine=TRUE, enableScrollWheel=TRUE,
        mapType='terrain', useMapTypeControl=TRUE
    ))
  })
  
})