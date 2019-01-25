
library(shiny)


shinyUI(fluidPage(
  tags$style(type="text/css", "h1{text-align:center;}"),
  
  titlePanel(h1("Análisis básico del gasto según variable.")),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("x", "Selección de la variable a cruzar",
                  choices = c(Sexo = "Gender",Edad = "Age", Profesión = "Occupation", 
                              Ciudad = "City_Category", Años_en_la_ciudad = "Stay_In_Current_City_Years", 
                              Estado_Matrimonial = "Marital_Status", Categoría_de_Producto = "Product_Category_1")),
      
      
      textOutput("output_expl")
    ),
    
    mainPanel(
      h3(textOutput("output_text")),
      plotOutput("out_hist")
    )
  )
))

