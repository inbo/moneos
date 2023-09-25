
library(protocolhelper)

source("../pad.R")

hoofdstuk <- "040_vegetatiekaart"
pad_data <- maak_pad(hoofdstuk, "data")
pad_figuren <- maak_pad(hoofdstuk, "figuren")
pad_tabellen <- maak_pad(hoofdstuk, "tabellen")

convert_docx_to_rmd(from = "040_vegetatiekaart/vegetatiekaart.docx",
                    to = "150_geintegreerd_rapport/040_vegetatiekaart_magweg.Rmd",
                    dir_media = pad_figuren)

add_captions(from = "150_geintegreerd_rapport/040_vegetatiekaart_magweg.Rmd",
             to = "150_geintegreerd_rapport/040_vegetatiekaart.Rmd")

unlink("150_geintegreerd_rapport/040_vegetatiekaart_magweg.Rmd")

