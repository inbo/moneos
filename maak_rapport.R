# Je kan het volledige rapport bouwen met de knop 'Build Book' op tab 'Build',
# maar dan wordt het geopend en opgeslagen in de folder op github
# -> output nog aanpassen in _bookdown.yml
# Deze knop instellen (staat er normaal automatisch in dit package):
# - kies in het menu Build > Configure Build Tools
# - kies bij Project build tools 'Website'
# - navigeer bij Site directory naar folder '150_geintegreerd_rapport'
# - na klikken op OK verschijnt er een tab Build met knop 'Build Book'
#   waar je vanaf nu op kan klikken om het hele rapport te maken

# Alternatief kan je onderstaande code runnen, die het rapport wel op de gewenste plaats opslaat

source("../pad.R")

old_wd <- getwd()
setwd("150_geintegreerd_rapport")

default_output <- stringr::str_c("output/moneos_", jaar_moneos, ".pdf") 

# pad_output <- maak_pad("150_geintegreerd_rapport", "output")
pad_output <- stringr::str_c(pad_prj_schelde, pad_moneos, jaar_moneos, "/150_geintegreerd_rapport/")
final_name <- stringr::str_c(pad_output, "moneos_integrale_rapportage_", jaar_moneos, ".pdf")

try({
  # Render the "site" (which now only sees one non-underscored Rmd)
  rmarkdown::render_site(output_format = 'INBOmd::pdf_report', encoding = 'UTF-8')
  
  # Check if the output exists, then rename it
  if (file.exists(default_output)) {
    file.copy(default_output, final_name, overwrite = TRUE)
    message(paste("Successfully created:", final_name))
  } else {
    warning(paste("Could not find default output file:", default_output))
  }
})

setwd(old_wd)
