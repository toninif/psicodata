# Datos de caras -----------

# Paquetes

library(tidyverse)


# Cargando datos -----------------



caras <- read_csv("data-raw/data_agg_sim.csv") # Obtenido de https://osf.io/ybws4/download


# Preparando la base ------------

caras <- caras %>% select(Region = region, Edad = stim_age, Sexo = stim_sex,
                          Agresividad = aggressive, Atractividad = attractive,
                          Amabilidad = caring, Seguridad = confident,
                          Dominancia = dominant, Emocionalidad = emostable,
                          Inteligencia = intelligent, Maldad = mean, Vejez = old,
                          Responsabilidad = responsible, Sociabilidad = sociable,
                          Confiable = trustworthy, Infelicidad = unhappy, Raro = weird)

caras$Sexo[caras$Sexo == "male"] <- "Hombre"
caras$Sexo[caras$Sexo == "female"] <- "Mujer"
caras$Edad <- round(caras$Edad)
caras$Region[caras$Region == "Australia & New Zealand"] <- "Australia y Nueva Zelanda"
caras$Region[caras$Region == "Central America & Mexico"] <- "America Central y Mexico"
caras$Region[caras$Region == "Eastern Europe"] <- "Europa Oriental"
caras$Region[caras$Region == "Middle East"] <- "Medio Oriente"
caras$Region[caras$Region == "Scandanavia"] <- "Escandinavia"
caras$Region[caras$Region == "South America"] <- "America del Sur"
caras$Region[caras$Region == "UK"] <- "Reino Unido"
caras$Region[caras$Region == "USA & Canada"] <- "EE.UU y Canada"
caras$Region[caras$Region == "Western Europe"] <- "Europa Occidental"


usethis::use_data(caras)
