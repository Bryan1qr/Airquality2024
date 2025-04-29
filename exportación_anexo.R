# Exportación de data procesada a excel de anexos -------------------------

library(tidyverse)
library(openair)
library(openxlsx)
library(zoo)
library(ggthemes)
library(ggforce)
library(patchwork)
library(ggrepel)
library(glue)
library(kableExtra)
source("Scripts/ECA_provisional_mejorado.R")

df <- ECA(meteo = "input/CR1000_ABRIL_ODRIA_2025.csv",
          gases = "input/eca_odria_abril_2025.csv",
          fecha_inicio = "2025-04-11 00:00:00",
          fecha_fin = "2025-04-27 23:00",
          estacion = "Odría",
          tipo = "lista")

df$df %>% 
  select(date, pm25, pm10, pres, pp, temp,
         hr, wd, ws, rad, no, no2, so2, h2s,
         co, o3_8h, co_8h) %>% 
  write.xlsx("data_anexos/ODRIA2025_data_anexo.xlsx")

# experimental:
df$df %>% 
  mutate(hora = format(date, format = "%H:%M"),
         date = format(date, format = "%d/%m/%Y")) %>% 
  select(date, hora, pm25, pm10, pres, pp, temp,
         hr, wd, ws, rad, no, no2, so2, h2s,
         co, o3_8h, co_8h) %>% 
  write.xlsx("data_anexos/ODRIA2025_data_anexoxd.xlsx")

library(openairmaps)
dfm <- df$df %>% mutate(lat = -17.980364, lon = -70.239032, estacion = "ODRIA",
                        referencia = "I.E. Manuel A. Odría")

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
