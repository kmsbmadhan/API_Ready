library(caret)
library(shiny)
library(LiblineaR)
library(readr)
library(ggplot2)

load("GBM.rda")    # Load saved model

source("featureMapping.R")                         #  a function for feature engineering. 

shinyServer(function(input, output) {
  
  options(shiny.maxRequestSize = 800*1024^2)   # This is a number which specifies the maximum web request size, 
  # which serves as a size limit for file uploads. 
  # If unset, the maximum request size defaults to 5MB.
  # The value I have put here is 80MB
  
  
  output$sample_input_data_heading = renderUI({   # show only if data has been uploaded
    inFile <- input$file1
    
    if (is.null(inFile)){
      return(NULL)
    }else{
      tags$h4('Sample data')
    }
  })
  
  output$sample_input_data = renderTable({    # show sample of uploaded data
    inFile <- input$file1
    
    if (is.null(inFile)){
      return(NULL)
    }else{
      input_data =  readr::read_csv(input$file1$datapath, col_names = TRUE)
      
      colnames(input_data) = c('AccidentArea','Sex','MaritalStatus', 'Age', 'Fault', 'VehicleCategory', 'Deductible', 'AgentType', 
                               'AddressChange_Claim', 'BasePolicy', 'FraudFound_P')
      
      input_data$Label = as.factor(input_data$FraudFound_P )
      
      levels(input_data$Label) <- c("NotFraud", "Fraud")
      head(input_data)
    }
  })
  

  
