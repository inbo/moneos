
library(protocolhelper)

source("../pad.R")

hoofdstuk <- "040_vegetatiekaart"
pad_data <- maak_pad(hoofdstuk, "data")
pad_figuren <- maak_pad(hoofdstuk, "figuren")
pad_tabellen <- maak_pad(hoofdstuk, "tabellen")


# convert_docx_to_rmd(from = "120_zoogdieren/120_Zoogdieren_20-07-2021.docx",
#                     to = "150_geintegreerd_rapport/120_Zoogdieren_magweg.Rmd",
#                     dir_media = "../120_zoogdieren/figuren_zoogdieren")
# 
# add_captions(from = "150_geintegreerd_rapport/120_Zoogdieren_magweg.Rmd",
#              to = "150_geintegreerd_rapport/120_Zoogdieren.Rmd")
# 
# unlink("150_geintegreerd_rapport/120_Zoogdieren_magweg.Rmd")

convert_docx_to_rmd(from = "040_vegetatiekaart/040_vegetatiekaart.docx",
                    to = "150_geintegreerd_rapport/040_vegetatiekaart_magweg.Rmd",
                    dir_media = pad_figuren)

add_captions(from = "150_geintegreerd_rapport/040_vegetatiekaart_magweg.Rmd",
             to = "150_geintegreerd_rapport/040_vegetatiekaart.Rmd")

unlink("150_geintegreerd_rapport/040_vegetatiekaart_magweg.Rmd")


