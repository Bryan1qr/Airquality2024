source("Scripts/ECA_mejorado.R")

library(tidyverse)
library(openair)


diciembre <- read.csv("input/eca_2024_diciembre.csv")
diciembre[c(7520,7834), 20] <- NA
write.csv(diciembre, "input/eca_mod_2024diciembre.csv", row.names = F)


ECA(meteo = "input/meteodiciembre2024.csv",
    gases = "input/eca_mod_2024diciembre.csv",
    pm = "input/pm_diciembre2024.csv",
    fecha_inicio = "2024-12-01 00:00:00",
    fecha_fin = "2025-01-01 23:00",
    estacion = "Unanue",
    tipo = "lista") -> dfx


openxlsx::write.xlsx(dfx$df %>% mutate(date = format.POSIXct(date)), "data_unanue2025.xlsx")
dfx$df %>% View()


dfm %>% select(TIMESTAMP, AirTC_Avg) %>% 
  filter(TIMESTAMP >= "2024-12-01") %>% 
  ggplot(aes(TIMESTAMP, as.numeric(AirTC_Avg))) +
  geom_line(color = "gray40") -> xd


plotly::ggplotly(xd + theme_wsj())

dfm <- rbind(df1, df3)


dfn <- openxlsx::read.xlsx("dataset_actualizado_2023_2024.xlsx")


openxlsx::write.xlsx(dfx$df %>% mutate(date = format.POSIXct(date)), "data_unanue2025.xlsx")
