
library(protocolhelper)

convert_docx_to_rmd(from = "090_vissen/templates/template_vissen2.docx",
                    to = "template_vissen.Rmd",
                    dir = "090_vissen/templates")

add_captions(from = "090_vissen/templates/template_vissen.Rmd",
             to = "090_vissen/templates/template_vissen_captions.Rmd")


