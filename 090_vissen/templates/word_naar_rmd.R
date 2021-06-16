
library(protocolhelper)

convert_docx_to_rmd(from = "090_vissen/templates/broedvogels.docx")

add_captions(from = "090_vissen/templates/broedvogels.Rmd",
             to = "090_vissen/templates/broedvogels_captions.Rmd")


