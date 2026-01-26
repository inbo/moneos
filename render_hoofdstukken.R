
# library(INBOmd)

chapters <- 
  c("ecotopen",
    "vegetatie",
    "sediment",
    "macrozoobenthos",
    "hyperbenthos",
    "vissen",
    "watervogels",
    "broedvogels",
    "zoogdieren",
    "sedimentatie_erosie",
    "slik_schorrand")


render_chapters <-
  function(chap_list, w_dir = "150_geintegreerd_rapport", out_dir = "output/") {
   
    require(tidyverse)
    source("../pad.R")
    
    mask_chapters <-
      function(chp_list) {
        for(chp in chp_list) {
          file.rename(chp, str_c("_", chp))
        }
      }
    unmask_chapters <-
      function(chp_list) {
        for(chp in chp_list) {
          file.rename(str_c("_", chp), chp)
        }
      }
    
    # set working dirctory
    old_wd <- getwd()
    setwd(w_dir)
    
    if (!file.exists(out_dir)) {
      dir.create(out_dir)
    }
      
    # Define the expected output name (the default book name)
    # Check your _bookdown.yml for 'book_filename'; default is often "_main"
    default_output <- str_c("output/moneos_", jaar_moneos, ".pdf") 
    
    all_chapter_files <- 
      list.files(pattern = "^[0-9].*\\.Rmd$") # Matches 01-intro.Rmd, etc.
    
    for(chap_name in chap_list) {
      
      # Define your desired final filename
      final_name <- str_c(out_dir, "moneos_", chap_name, "_", jaar_moneos, ".pdf")

      chap_files <- str_subset(all_chapter_files, chap_name)
      mask_files <- str_subset(all_chapter_files, chap_name, negate = TRUE)
      
      mask_chapters(mask_files)
      
      try({
        # Render the "site" (which now only sees one non-underscored Rmd)
        rmarkdown::render_site(output_format = 'INBOmd::pdf_report', encoding = 'UTF-8')
        
        # Check if the output exists, then rename it
        if (file.exists(default_output)) {
          file.rename(default_output, final_name)
          message(paste("Successfully created:", final_name))
        } else {
          warning(paste("Could not find default output file:", default_output))
        }
      })
      
      unmask_chapters(mask_files)
      
    }
    
    # restore working directory
    setwd(old_wd)
  }


# render_chapters(c("macrozoobenthos"))
# render_chapters(c("hyperbenthos"), out_dir = str_c(pad_prj_schelde, pad_moneos, jaar_moneos, "/150_geintegreerd_rapport/hoofdstukken/"))
render_chapters(chapters, out_dir = str_c(pad_prj_schelde, pad_moneos, jaar_moneos, "/150_geintegreerd_rapport/hoofdstukken/"))



##### rescue on error

# unmask_chapters <-
#   function(chp_list) {
#     for(chp in chp_list) {
#       file.rename(stringr::str_c("_", chp), chp)
#     }
#   }
# setwd("150_geintegreerd_rapport")
# all_chapter_files <- 
#   list.files(pattern = "^_[0-9].*\\.Rmd$") # Matches 01-intro.Rmd, etc.
# unmask_chapters(stringr::str_remove(all_chapter_files, "^_"))
# setwd("C:/Users/joost_vanoverbeke/Documents/moneos/moneos_2025")



