# Primeros datos -----------------

# Paquetes

library(tidyverse)
library(here)
library(readxl)

# Descargando datos de la web -----------------

# Prestadores 2018
prestadores_2018 <- read.csv("http://datos.salud.gob.ar/dataset/1e7d12d4-d097-4f17-8277-fd671361f3db/resource/533e2c11-c921-409f-8e84-405d031b8414/download/registro-nacional-de-prestadores-profesionales-inscriptos-en-la-sss-sistema-historico-20181217.csv")

# Prestadores 2019
url <- "http://datos.salud.gob.ar/dataset/1e7d12d4-d097-4f17-8277-fd671361f3db/resource/4774343d-1c03-49fe-87bb-4da5d5957dfa/download/registro_profesionales_historico_sss_20190826.xls"
destfile <- "registro_profesionales_historico_sss_20190826.xls"
curl::curl_download(url, destfile)
registro_profesionales_historico_sss_20190826 <- read_excel(destfile)


# Uniendo y organizando datos

prestadores_2018 <- prestadores_2018 %>% select(-fecha_de_vigencia)

prestadores_2019 <- registro_profesionales_historico_sss_20190826 %>% select(-fecha_vigencia)

prestadores <- bind_rows(prestadores_2018, prestadores_2019)

prestadores <- prestadores %>% rename(Apellido = apellido, Nombre = nombre, Numero_de_Documento = numero_documento, Numero_de_Certificado = certificado_numero, Profesion = profesion)

usethis::use_data(prestadores)
