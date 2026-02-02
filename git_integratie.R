
# Note: You should be in the root directory of your RStudio project/Git repository

branches <- 
  c("010_inleiding_en_overzicht",
    "030_ecotopen",
    "040_vegetatiekaart",
    "050_hogere_planten",
    "060_sedimentkenmerken",
    "070_macrozoobenthos",
    "080_hyperbenthos",
    "090_vissen",
    "100_watervogels",
    "110_broedvogels",
    "120_zoogdieren",
    "130_raaien",
    "140_slik_schorrand")

update_main <-
  function(branches) {
    current <- system("git branch --show-current", intern = TRUE)
    for(branch in branches) {
      # system("git checkout main")
      system("git pull origin main")
      system(stringr::str_c("git checkout ", branch))
      system(stringr::str_c("git pull origin ", branch))
      system("git merge main")
      system(stringr::str_c("git push origin ", branch))
      system("git checkout main")
      system(stringr::str_c("git merge", branch))
      system("git push origin main")
    }
    system(stringr::str_c("git checkout ", current))
  }

update_main(branches)
# update_main("010_inleiding_en_overzicht")


