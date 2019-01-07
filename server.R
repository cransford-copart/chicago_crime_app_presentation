library(shiny); library(dplyr); library(ggplot2)



function(input, output){
  
  output$crime_plot <- renderPlot({
    
    df <- crimeDf %>%
      select(Date, Primary.Type) %>%
      filter(Date >= input$slider1[1] & 
               Date <= input$slider1[2] & 
               Primary.Type == input$ycol) %>%
      group_by(as.Date(cut(Date, breaks = "weeks"), "%Y-%m-%d")) %>%
      summarize(event_count = n())
    
    names(df) <- c("event_date","event_count")
    
    ggplot(df, aes(x = event_date, y = event_count)) + 
      geom_bar(stat="identity") + 
      xlab("Reported Date") + 
      ylab(input$ycol)
    
  })
  
}