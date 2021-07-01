
library(protocolhelper)

convert_docx_to_rmd(from = "090_vissen/templates/hogere planten.docx",
                    to = "150_geintegreerd_rapport/hogere_planten_magweg.Rmd",
                    dir_media = "../090_vissen/templates/figuren_geintegreerd-rapport")

add_captions(from = "150_geintegreerd_rapport/hogere_planten_magweg.Rmd",
             to = "150_geintegreerd_rapport/050_hogere_planten.Rmd")

unlink("150_geintegreerd_rapport/hogere_planten_magweg.Rmd")
