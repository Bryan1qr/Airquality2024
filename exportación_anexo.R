# Exportación de data procesada a excel de anexos -------------------------

library(tidyverse)
library(openair)
library(openxlsx)
library(zoo)
library(glue)
source("Scripts/ECA_mejorado.R")

df <- ECA(meteo = "input/meteodiciembre2024.csv",
          gases = "input/eca_mod_2024diciembre.csv",
          pm = "input/pm_diciembre2024.csv",
          fecha_inicio = "2024-12-01 00:00:00",
          fecha_fin = "2024-12-31 23:00",
          estacion = "Unanue",
          tipo = "lista")

df$df %>% 
  select(date, pm25, pm10, pres, pp, temp,
         hr, wd, ws, rad, no, no2, so2, h2s,
         co, o3_8h, co_8h) %>% 
  write.xlsx("data_anexos/unanue_data_anexo.xlsx")
