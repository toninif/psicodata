# Datos de caras -----------

# Paquetes

library(tidyverse) #practicamente dplyr

library(synthpop) # Para generar base sintetica

# readxl para leer la tabla

# Cargando datos -----------------

emociones_raw <- readxl::read_xlsx("data-raw/anexo.xlsx")


# Preparando la base ------------

emociones_general <- emociones_raw %>%
  select(Numero_imagen = id, Numero_set = set,
         Descripcion = desc,
         Valencia_media = valM, Valencia_DE = valds,
         Activacion_media = aroM, Activacion_DE = arods,
         Dominancia_media = conM, Dominancia_DE = conds) %>%
  mutate(muestra = "general")

emociones_mujeres <- emociones_raw %>%
  select(Numero_imagen = id, Numero_set = set,
         Descripcion = desc,
         Valencia_media = valM_m, Valencia_DE = valds_m,
         Activacion_media = aroM_m, Activacion_DE = arods_m,
         Dominancia_media = conM_m, Dominancia_DE = conds_m) %>%
  mutate(muestra = "mujeres")

emociones_hombres <- emociones_raw %>%
  select(Numero_imagen = id, Numero_set = set,
         Descripcion = desc,
         Valencia_media = valM_h, Valencia_DE = valds_h,
         Activacion_media = aroM_h, Activacion_DE = arods_h,
         Dominancia_media = conM_h, Dominancia_DE = conds_h) %>%
  mutate(muestra = "hombres")


emociones_original <- bind_rows(emociones_general, emociones_mujeres,
          emociones_hombres)


# Haciendo una base "generica"

info_set <- emociones_original %>% select(Numero_imagen,
                                          Numero_set,
                                          Descripcion,
                                          Muestra = muestra)

datos_sinteticos<- emociones_original %>% select(-Numero_imagen,
                                               -Numero_set,
                                               -Descripcion,
                                               -muestra)

datos_sinteticos <- syn(datos_sinteticos, m = 1, seed = 1993)

datos_sinteticos <- datos_sinteticos$syn

emociones <- bind_cols(info_set, datos_sinteticos)


usethis::use_data(emociones)
