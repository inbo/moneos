# templates voor MONEOS dataverwerking en rapportage via Rmarkdown

  - Kopieer de folder ‘moneos_2020_test/src/markdown/000_template’ lokaal
  
  - Self containing : 
    + Alle benodigde files zijn aanwezig
    + Geen git(hub) nodig
    + Code werkt  - mits de vereiste libraries zijn geïnstalleerd in R 
    + Alle output wordt in dezelfde folder bijgehouden
    
  - Integratie met MONEOS resultaten op GDrive
    + Pas het pad aan in de file ‘000_template/src/pad.R’
    
  - Integratie met code op git(hub)
    + maak een lokale versie (Rstudio project) aan van de moneos repository via git
    + Maak een folder aan ‘moneos_2020_test/src/markdown/naam_hoofdstuk’
    + Kopieer hierin enkel de files onder ‘moneos_2020_test/src/markdown/000_template/src/000_template’
    + pas in de lokale versie het pad aan in de file 'moneos_2020_test/src/markdown/pad.R'
    
  - R libraries
    + zorg er voor dat volgende libraries zijn geïnstalleerd:
    + tidyverse, readxl, writexl
    + INBOtheme https://inbo.github.io/INBOtheme/ 
    + tinytex, INBOmd https://inbomd-examples.netlify.app/inbomd_workshop/inbomd_workshop.pdf 
    + magick, webshot https://haozhu233.github.io/kableExtra/save_kable_and_as_image.html 
