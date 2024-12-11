
library(protocolhelper)

source("../pad.R")

hoofdstuk <- "050_hogere_planten"
pad_data <- maak_pad(hoofdstuk, "data")
pad_figuren <- maak_pad(hoofdstuk, "figuren")
pad_tabellen <- maak_pad(hoofdstuk, "tabellen")

convert_docx_to_rmd(from = "050_hogere_planten/INBO.MONEOS_sjabloonT2023_BV_hogereplanten.docx",
                    to = "150_geintegreerd_rapport/050_hogere_planten_magweg.Rmd",
                    dir_media = pad_figuren)

add_captions(from = "150_geintegreerd_rapport/050_hogere_planten_magweg.Rmd",
             to = "150_geintegreerd_rapport/050_hogere_planten.Rmd")

unlink("150_geintegreerd_rapport/050_hogere_planten_magweg.Rmd")

