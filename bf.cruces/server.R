
library(shiny)
library(ggplot2)

#Se crea este vector para poder mostrar tanto en el text como en las etiquetas de los gráficos el nombre de la variable en español.
eleccion = c(Sexo = "Gender",Edad = "Age", Profesión = "Occupation", 
             Ciudad = "City_Category", Años_en_la_ciudad = "Stay_In_Current_City_Years", 
             Estado_Matrimonial = "Marital_Status", Categoría_de_Producto = "Product_Category_1")
#Creo esta otra variable para mostrar una explicación de la comparación
explicacion = c("Los hombres realizaron un gasto considerablemente mayor al de las mujeres." = "Gender", 
                "La franja de edad que realizó el mayor gasto, con mucha diferencia, fue de los 26 a los 35 años." = "Age", 
                "Las profesiones con mayor gasto el black friday fueron la 0, 4 y 7 
                (No se ha conseguido encontrar a que profesión corresponde cada numero)" = "Occupation", 
                "En este caso las tres variables de ciudad (Tampoco se ha conseguido su correspondencia) tienen gastos cercanos, siendo la categoría B la que más ha gastado y la categoría A la que menos." = "City_Category", 
                "Las personas que llevan un año en la ciudad actual han realizado mayor gasto que el resto." = "Stay_In_Current_City_Years", 
                "Aún sin haber conseguido información sobre esta variable se supondrá que 0 es soltero y 1 es casado.
                Siendo así, se puede ver que las personas solteras han realizado un gasto mayor que las personas casadas." = "Marital_Status", 
                "La categoría de producto con mayor venta es la 1, seguida muy de lejos por la 5 y la 8.
                (Esta es otra variable de la cual no se ha conseguido más información)" = "Product_Category_1")

shinyServer(function(input, output) {
  output$output_text = renderText(paste("Gasto por ", names(eleccion)[eleccion == input$x]))
  output$out_hist <- renderPlot(ggplot(bf.df, aes(x = bf.df[[input$x]], y = Purchase, color = bf.df[[input$x]])) + geom_bar(show.legend = F, stat = "identity") 
                                + xlab(names(eleccion)[eleccion == input$x]) + ylab("Gasto"))
  output$output_expl = renderText(paste(names(explicacion)[explicacion == input$x]))
})
