library(shiny)



fluidPage(
  wellPanel(
    sliderInput("slider1","Date Range", 
              min = as.Date("2015-01-01", "%Y-%m-%d"),
              max = as.Date("2015-12-31", "%Y-%m-%d"),
              value = c(as.Date("2015-01-01", "%Y-%m-%d"), as.Date("2015-12-31", "%Y-%m-%d")),
              timeFormat = "%Y-%m-%d"),
  selectInput("ycol","Y Input",
              choices= as.character(unique(unlist(crimeDf[["Primary.Type"]])))),
  tags$hr(),
  tags$p("The plot listed below graphs the number of occurrences of a given crime type over a trended period of time. The type of crime can be selected using the ",
         tags$strong("Y Input"),
         " drop down. The range of dates can also be adjusted be using the ",
         tags$strong("Date Range"),
         " slider listed above. The data for this plot can be found ",
         tags$a("here", href="https://data.cityofchicago.org/api/views/vwwp-7yr9/rows.csv?accessType=DOWNLOAD&bom=true&format=true"),
         ".")
  ),
  plotOutput("crime_plot")
  # , # Used if we wanted to include an image within the ShinyApp
  # fluidRow(
  #   column(8, align="center",
  #   tags$img(height = 220, width = 333,
  #          src = "chicago_image.jpg")
  #   )
  # )
)