
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
    for(branch in branches) {
      system("git checkout main")
      system("git pull origin main")
      system(stringr::str_c("git checkout ", branch))
      system(stringr::str_c("git pull origin ", branch))
      system("git merge main")
      system(stringr::str_c("git push origin ", branch))
      system("git push origin main")
    }
  }

update_main(branches)




system("git checkout 010_inleiding_en_overzicht")
system("git merge main")
system("git push origin 010_inleiding_en_overzicht")

system("git checkout main")
system("git merge 010_inleiding_en_overzicht")
system("git push origin main")


system("git checkout 030_ecotopen")
system("git pull origin 030_ecotopen")
system("git merge main")
system("git push origin 030_ecotopen")

system("git checkout main")
system("git merge 030_ecotopen")
system("git push origin main")


system("git checkout 040_vegetaatiekaart")
system("git merge main")
system("git push origin 040_vegetaatiekaart")

system("git checkout main")
system("git merge 040_vegetaatiekaart")
system("git push origin main")


system("git checkout 050_hogere_planten")
system("git merge main")
system("git push origin 050_hogere_planten")

system("git checkout main")
system("git merge 050_hogere_planten")
system("git push origin main")


system("git checkout 060_sedimentkenmerken")
system("git merge main")
system("git push origin 060_sedimentkenmerken")

system("git checkout main")
system("git merge 060_sedimentkenmerken")
system("git push origin main")


system("git checkout 070_macrozoobenthos")
system("git merge main")
system("git push origin 070_macrozoobenthos")

system("git checkout main")
system("git merge 070_macrozoobenthos")
system("git push origin main")


system("git checkout 080_hyperbenthos")
system("git merge main")
system("git push origin 080_hyperbenthos")

system("git checkout main")
system("git merge 080_hyperbenthos")
system("git push origin main")


system("git checkout 090_vissen")
system("git merge main")
system("git push origin 090_vissen")

system("git checkout main")
system("git merge 090_vissen")
system("git push origin main")


system("git checkout 100_watervogels")
system("git merge main")
system("git push origin 100_watervogels")

system("git checkout main")
system("git merge 100_watervogels")
system("git push origin main")


system("git checkout 110_broedvogels")
system("git merge main")
system("git push origin 110_broedvogels")

system("git checkout main")
system("git merge 110_broedvogels")
system("git push origin main")


system("git checkout 120_zoogdieren")
system("git merge main")
system("git push origin 120_zoogdieren")

system("git checkout main")
system("git merge 120_zoogdieren")
system("git push origin main")


system("git checkout 130_raaien")
system("git merge main")
system("git push origin 130_raaien")

system("git checkout main")
system("git merge 130_raaien")
system("git push origin main")


system("git checkout 140_slik_schorrand")
system("git merge main")
system("git push origin 140_slik_schorrand")

system("git checkout main")
system("git merge 140_slik_schorrand")
system("git push origin main")

