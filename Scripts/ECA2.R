polar <- function(tabla, location){
  df <- tabla
  a <- polarPlot(
    df, pollutant = "pm10", key.position = "bottom",
    main = "A)")
  
  b <- polarPlot(
    df, pollutant = "pm25", key.position = "bottom",
    main = "C)")
  
  c <- polarPlot(
    df, pollutant = "no2", key.position = "bottom",
    main = "B)")
  
  d <- polarPlot(
    df, pollutant = "o3", key.position = "bottom",
    main = "D)")
  
  # Primeros plots:
  png(filename = paste0("polares",location, ".png"),
      width = 15, height = 18,
      units = "cm", res = 500)
  print(a, split = c(1, 1,2, 2))
  print(b, split = c(2, 1, 2, 2), newpage = FALSE)
  print(c, split = c(1, 2, 2, 2), newpage = FALSE)
  print(d, split = c(2, 2, 2, 2), newpage = FALSE)
  dev.off()
  # e <- polarPlot(
  #   df, pollutant = "co", key.position = "bottom",
  #   main = "C)")
  # 
  # f <- polarPlot(
  #   df, pollutant = "so2", key.position = "bottom",
  #   main = "A)")
  # 
  # g <- polarPlot(
  #   df, pollutant = "h2s", key.position = "bottom",
  #   main = "B)")
  # 

  
  # 
  # # Siguientes plots:
  # png(filename = paste0(ruta2, ".png"),
  #     width = 15, height = 18,
  #     units = "cm", res = 500)
  # print(e, split = c(1, 1,2, 2))
  # print(f, split = c(2, 1, 2, 2), newpage = FALSE)
  # print(g, split = c(1, 2, 2, 2), newpage = FALSE)
  # dev.off()
}
