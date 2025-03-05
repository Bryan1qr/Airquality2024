# Exportación de data procesada a excel de anexos -------------------------

library(tidyverse)
library(openair)
library(openxlsx)
library(zoo)
library(glue)
source("Scripts/ECA_mejorado.R")

df <- ECA(meteo = "input/CR1000_FEBRERO_DM_2025.csv",
          gases = "input/eca_2025_febrero.csv",
          pm = "input/pm_DM_HOTELES2025_acumulado.csv",
          fecha_inicio = "2025-02-20 00:00",
          fecha_fin = "2025-02-27 23:00",
          estacion = "DM",
          tipo = "lista")

df$df %>% 
  select(date, pm25, pm10, pres, pp, temp,
         hr, wd, ws, rad, no, no2, so2, h2s,
         co, o3_8h, co_8h) %>% 
  write.xlsx("data_anexos/DM_HOTELES_data_anexo.xlsx")


library(openairmaps)
dfm <- df$df %>% mutate(lat = -18.01429, lon = -70.24903,
                        estacion = "DM HOTELES",
                        XD = "Av. Francisco Bolognesi 300")

windroseMap(data = dfm,
            latitude = "lat",
            longitude = "lon",
            paddle = F,
            d.icon = 180, popup = "estacion",
            breaks = c(0,0.2,1.5,3.3,5.4),
            include.lowest = FALSE,
            cols = "viridis",
            provider = c("OpenStreetMap", "Esri.WorldImagery"),
            legend.title = "Velocidad<br>del viento (m/s)",
            control.collapsed = TRUE, legend)