# Clasificación taxonómica ------------------------------------------------


# 03 al 09 de agosto         Vigil                                                                 --- EMCA02
# 14 al 20 de agosto         odría                                                                 --- EMCA03
# 05 al 11 de setiembre      DM hoteles                                                             --- EMCA04
# 29 de setiembre al 05 oct  sggrd                                                             --- EMCA05
# 09 al 15 de octubre        unjbg                                                             --- EMCA06
# noviembre - diciembre      unanue (1 al 31 de diciembre; 1 al 30 de noviembre)              --- EMCA01

library(tidyverse)
library(openair)
library(zoo)
source("Scripts/ECA2023.R")

gases <-  read.csv("2023/eca_2024_julio.csv")
gases[6612:6635, 20] <- NA
write.csv(gases, "2023/eca_2024_julio2.csv", row.names = F)

df2023_1 <- ECA(meteo = "2023/GR_TACNA_CR1000_Table1-DIC_2023_2024.xls",
                 gases = "2023/eca_2024_julio2.csv",
                 pm = "2023/DIC 2023 1405A227561402_2024-01-03_12-18-16.xls",
                 fecha_inicio = "2023-08-03",
                 fecha_fin = "2023-08-09",
                 estacion = "vigil2023",
                 tipo = "lista")

df2023_2 <- ECA(meteo = "2023/GR_TACNA_CR1000_Table1-DIC_2023_2024.xls",
           gases = "2023/eca_2024_julio.csv",
           pm = "2023/DIC 2023 1405A227561402_2024-01-03_12-18-16.xls",
           fecha_inicio = "2023-08-14",
           fecha_fin = "2023-08-20",
           estacion = "vigil2023",
           tipo = "lista")

df2023_3 <- ECA(meteo = "2023/GR_TACNA_CR1000_Table1-DIC_2023_2024.xls",
           gases = "2023/eca_2024_julio.csv",
           pm = "2023/DIC 2023 1405A227561402_2024-01-03_12-18-16.xls",
           fecha_inicio = "2023-09-05",
           fecha_fin = "2023-09-11",
           estacion = "vigil2023",
           tipo = "lista")

df2023_4 <- ECA(meteo = "2023/GR_TACNA_CR1000_Table1-DIC_2023_2024.xls",
           gases = "2023/eca_2024_julio.csv",
           pm = "2023/DIC 2023 1405A227561402_2024-01-03_12-18-16.xls",
           fecha_inicio = "2023-09-29",
           fecha_fin = "2023-10-05",
           estacion = "vigil2023",
           tipo = "lista")

df2023_5 <- ECA(meteo = "2023/GR_TACNA_CR1000_Table1-DIC_2023_2024.xls",
           gases = "2023/eca_2024_julio.csv",
           pm = "2023/DIC 2023 1405A227561402_2024-01-03_12-18-16.xls",
           fecha_inicio = "2023-10-09",
           fecha_fin = "2023-10-15",
           estacion = "vigil2023",
           tipo = "lista")

df2023_6 <- ECA(meteo = "2023/GR_TACNA_CR1000_Table1-DIC_2023_2024.xls",
           gases = "2023/eca_2024_julio.csv",
           pm = "2023/DIC 2023 1405A227561402_2024-01-03_12-18-16.xls",
           fecha_inicio = "2023-11-01",
           fecha_fin = "2023-12-31",
           estacion = "vigil2023",
           tipo = "lista")


# 8846
# data 2024 --------------------------------------------------------------

source("Scripts/ECA.R")

# Cargando datos del punto de hipólito unanue:
df <- ECA(meteo = "input/CR1000_JULIO_2024.csv",
          gases = "input/eca_2024_julio.csv",
          pm = "input/pm_junio.csv",
          fecha_inicio = "2024-06-21",
          fecha_fin = "2024-06-30",
          estacion = "Unanue",
          tipo = "lista")

df1 <- ECA(meteo = "input/CR1000_JULIO_2024.csv",
           gases = "input/eca_2024_julio.csv",
           pm = "input/1405A227561402_2024-08-01_09-11-26.csv",
           fecha_inicio = "2024-07-17",
           fecha_fin = "2024-07-31",
           estacion = "Vigil",
           tipo = "lista")

df2 <- ECA(meteo = "input/CR1000_AGOSTO_2024.csv",
           gases = "input/gases_odria_agosto.csv",
           pm = "input/pm_agosto_odria.csv",
           fecha_inicio = "2024-08-08",
           fecha_fin = "2024-08-18",
           estacion = "Odría",
           tipo = "lista")

source("Scripts/ECA_mejorado.R")
df3 <- ECA(meteo = "input/CR1000_AGOSTO_UNJBG_2024.csv",
           gases = "input/GASES_AGOSTO_EPSG-UNJBG_2024.csv",
           pm = "input/pm_agosto_epsg_unjbg.csv",
           fecha_inicio = "2024-08-23",
           fecha_fin = "2024-08-31",
           estacion = "epsg_unjbg",
           tipo = "lista")

df4 <- ECA(meteo = "input/CR1000_SETIEMBRE_JCHAVEZ_2024.csv",
           gases = "input/GASES_SETIEMBRE_JCHAVEZ_2024.csv",
           pm = "input/jorge_chavez_pm_emca05.csv",
           fecha_inicio = "2024-09-12",
           fecha_fin = "2024-09-24",
           estacion = "JCHAVEZ",
           tipo = "lista")

df5 <- ECA(meteo = "input/CR1000_OCTUBRE_2024.csv",
           gases = "input/gases_unjbg_octubre.csv",
           pm = "input/pm_octubre_unjbg.csv",
           fecha_inicio = "2024-09-27",
           fecha_fin = "2024-10-08",
           estacion = "unjbg2",
           tipo = "lista")


a1 <- df2023_6$df %>% mutate(lat = -18.004275, lon = -70.257304, estacion = "EMCA - 01",
                         referencia = "Prolongación Hipólito Unanue")

a2 <- df2023_1$df %>% mutate(lat = -17.993250, lon = -70.243305, estacion = "EMCA - 02", 
                          referencia = "Instituto Vigil")

a3 <- df2023_2$df %>% mutate(lat = -17.980364, lon = -70.239032, estacion = "EMCA - 03",
                          referencia = "I.E. Manuel A. Odría")

a4 <- df2023_3$df %>% mutate(lat = -18.01436, lon = -70.24899, estacion = "EMCA - 04",
                          referencia = "DM Hoteles")

a5 <- df2023_4$df %>% mutate(lat = -18.0418, lon = -70.25123, estacion = "EMCA - 05",
                          referencia = "Sub Gerencia de Gestión de Riesgo de Desastres")


a6 <- df2023_5$df %>% mutate(lat = -18.02685, lon = -70.2507, estacion = "EMCA - 06",
                          referencia = "Universidad Nacional Jorge Basadre Grohmann")



b1 <- df$df %>% mutate(lat = -18.004275, lon = -70.257304, estacion = "EMCA - 01",
                        referencia = "Prolongación Hipólito Unanue")

b2 <- df1$df %>% mutate(lat = -17.993250, lon = -70.243305, estacion = "EMCA - 02", 
                          referencia = "Instituto Vigil")

b3 <- df2$df %>% mutate(lat = -17.980364, lon = -70.239032, estacion = "EMCA - 03",
                          referencia = "I.E. Manuel A. Odría")

b4 <- df3$df %>% mutate(lat = -18.00676, lon = -70.23816, estacion = "EMCA - 04",
                          referencia = "Escuela de Posgrado UNJBG")

b5 <- df4$df %>% mutate(lat = -18.03961, lon = -70.25581, estacion = "EMCA - 05",
                          referencia = "I.E. Jorge Chávez")

b6 <- df5$df %>% mutate(lat = -18.02685, lon = -70.2507, estacion = "EMCA - 06",
                          referencia = "Universidad Nacional Jorge Basadre Grohmann")

dfm <- rbind(a1,a2,a3,a4,a5,a6,b1,b2,b3,b4,b5,b6)


names(dfm) <- c("FECHA", "HR", "PM25", "PM10", "PRESION", "PRECIPITACION", "TEMPERATURA",
                "DIRECCION_VIENTO", "VELOCIDAD_VIENTO", "RADIACION", "NO", "NO2", "NOX",
                "SO2", "H2S", "CO", "O3", "O3_8H", "CO_8H", "LAT", "LON", "ESTACION", "REFERENCIA")

x <- dfm %>% select(FECHA, PM25, PM10, NO2, NO, NOX, SO2, H2S, CO, O3, O3_8H, CO_8H, HR,
                     PRESION, PRECIPITACION, TEMPERATURA, DIRECCION_VIENTO, VELOCIDAD_VIENTO,
                     RADIACION, ESTACION, LAT, LON, REFERENCIA) %>% 
  arrange(FECHA) %>% 
   mutate(FECHA = format.POSIXct(FECHA, format = "%Y-%m-%d %H:%M"))


openxlsx::write.xlsx(x %>% arrange(FECHA), "dataset_actualizado_2023_2024.xlsx")
