
library(protocolhelper)

# convert_docx_to_rmd(from = "120_zoogdieren/120_Zoogdieren_20-07-2021.docx",
#                     to = "150_geintegreerd_rapport/120_Zoogdieren_magweg.Rmd",
#                     dir_media = "../120_zoogdieren/figuren_zoogdieren")
# 
# add_captions(from = "150_geintegreerd_rapport/120_Zoogdieren_magweg.Rmd",
#              to = "150_geintegreerd_rapport/120_Zoogdieren.Rmd")
# 
# unlink("150_geintegreerd_rapport/120_Zoogdieren_magweg.Rmd")

convert_docx_to_rmd(from = "050_hogere_planten/BV_Hogereplanten.docx",
                    to = "150_geintegreerd_rapport/050_hogere_planten_magweg.Rmd",
                    dir_media = "../050_hogere_planten/figuren")

add_captions(from = "150_geintegreerd_rapport/140_Monitoring_slik_schorrand_magweg.Rmd",
             to = "150_geintegreerd_rapport/140_Monitoring_slik_schorrand.Rmd")

unlink("150_geintegreerd_rapport/050_hogere_planten_magweg.Rmd")
