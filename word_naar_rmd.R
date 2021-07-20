
library(protocolhelper)

convert_docx_to_rmd(from = "090_vissen/templates/template_vissen2.docx",
                    to = "090_vissen/templates/template_vissen2_magweg.Rmd",
                    dir_media = "figuren_geintegreerd-rapport")

add_captions(from = "090_vissen/templates/template_vissen2_magweg.Rmd",
             to = "090_vissen/templates/template_vissen2.Rmd")

unlink("090_vissen/templates/template_vissen2_magweg.Rmd")
