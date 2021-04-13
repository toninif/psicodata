# Datos de caras -----------

# Paquetes

library(tidyverse)

# readxl para leer la tabla

# Cargando datos -----------------

big5 <- readxl::read_xls("data-raw/bigFIVE.xls")

# Preparando la base ------------

big5 <- big5 %>%  rename(Edad = age, Genero = gender,
               Lateralidad = hand, Pais = country,
               Extraversion_1= E1,
               Extraversion_2= E2,
               Extraversion_3= E3,
               Extraversion_4= E4,
               Extraversion_5= E5,
               Extraversion_6= E6,
               Extraversion_7= E7,
               Extraversion_8= E8,
               Extraversion_9= E9,
               Extraversion_10= E10,
               Neuroticismo_1 = N1,
               Neuroticismo_2 = N2,
               Neuroticismo_3 = N3,
               Neuroticismo_4 = N4,
               Neuroticismo_5 = N5,
               Neuroticismo_6 = N6,
               Neuroticismo_7 = N7,
               Neuroticismo_8 = N8,
               Neuroticismo_9 = N9,
               Neuroticismo_10 = N10,
               Agradabilidad_1 = A1,
               Agradabilidad_2 = A2,
               Agradabilidad_3 = A3,
               Agradabilidad_4 = A4,
               Agradabilidad_5 = A5,
               Agradabilidad_6 = A6,
               Agradabilidad_7 = A7,
               Agradabilidad_8 = A8,
               Agradabilidad_9 = A9,
               Agradabilidad_10 = A10,
               Responsabilidad_1 = C1,
               Responsabilidad_2 = C2,
               Responsabilidad_3 = C3,
               Responsabilidad_4 = C4,
               Responsabilidad_5 = C5,
               Responsabilidad_6 = C6,
               Responsabilidad_7 = C7,
               Responsabilidad_8 = C8,
               Responsabilidad_9 = C9,
               Responsabilidad_10 = C10,
               Apertura_Experiencia_1 = O1,
               Apertura_Experiencia_2 = O2,
               Apertura_Experiencia_3 = O3,
               Apertura_Experiencia_4 = O4,
               Apertura_Experiencia_5 = O5,
               Apertura_Experiencia_6 = O6,
               Apertura_Experiencia_7 = O7,
               Apertura_Experiencia_8 = O8,
               Apertura_Experiencia_9 = O9,
               Apertura_Experiencia_10 = O10)

big5$Genero < factor(big5$Genero, levels = c("1", "2"), labels = c("Hombre", "Mujer"))

big5$Lateralidad <- factor(big5$Lateralidad, levels = c("1", "2", "3"), labels = c("Derecha", "Izquierda", "Ambas"))


usethis::use_data(big5)
