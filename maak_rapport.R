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

old_wd <- getwd()

setwd("150_geintegreerd_rapport")
source("../pad.R")
pad_output <- maak_pad("150_geintegreerd_rapport", "output")

bookdown::render_book("index.Rmd", output_dir = pad_output)

setwd(old_wd)
