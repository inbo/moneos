
library(tidyverse)
library(lubridate)
library(readxl)
library(writexl)

library(inbodb)

library(rprojroot) ## workaround pad

source(find_root_file("../pad.R", criterion = is_rstudio_project))

hoofdstuk <- "090_vissen"

pad_data <- maak_pad(hoofdstuk, "data")
pad_figuren <- maak_pad(hoofdstuk, "figuren")
pad_tabellen <- maak_pad(hoofdstuk, "tabellen")

VIS <- connect_inbo_dbase("W0001_00_Vis")
taxon_tab <-
  tbl(VIS, "DimTaxon")
taxon_data_tab <-
  tbl(VIS, "DimVisindexTaxon")

func_groepen_tab <-
  taxon_tab %>%
  select(TaxonKey, WetenschappelijkeNaam) %>%
  inner_join(taxon_data_tab,
             by = "TaxonKey") %>%
  select(TaxonKey, Soort, WetenschappelijkeNaam, Exoot,
         Migratie, Bentisch, Invertivoor, Omnivoor, Piscivoor, Water_Anadroom, Water_Brak, Water_Zoet)

func_groepen_VIS <-
  func_groepen_tab %>%
  collect()

dbDisconnect(VIS)


func_groepen_Erika <-
  read_xlsx(str_c(pad_data, "dieet vissen.xlsx"))


func_groepen_EMSE <-
  read_xlsx(str_c(pad_data, "functionele groepen.xlsx"))

species_EMSE <-
  func_groepen_VIS %>%
  mutate(Species_EMSE = map_chr(WetenschappelijkeNaam, function(x) func_groepen_EMSE$Species[str_detect(x, func_groepen_EMSE$Species)][1])) %>%
  # filter(map_lgl(WetenschappelijkeNaam, function(x) any(map_lgl(func_groepen_EMSE$Species, function(y) str_detect(x, y))))) %>%
  filter(!is.na(Species_EMSE)) %>%
  # select(TaxonKey, Soort, WetenschappelijkeNaam, Species_EMSE, everything()) %>%
  select(Soort, WetenschappelijkeNaam, Species_EMSE, Exoot)

func_groepen_EMSE <-
  func_groepen_EMSE %>%
  left_join(species_EMSE, by = c("Species" = "Species_EMSE")) %>% 
  mutate(Soort = str_to_lower(Soort))

func_groepen_EMSE <-
  func_groepen_EMSE %>%
  left_join(func_groepen_Erika %>% 
              mutate(`Nederlandse naam` = str_to_lower(`Nederlandse naam`)) %>% 
              select(`Wetenschappelijke naam`, `Nederlandse naam`, `Estuarien gebruik groep`, `Trofische groep (Juveniel)`, `trofische groep (Adult)`),
            by = c("Soort" = "Nederlandse naam"))


FG <-
  func_groepen_EMSE %>% 
  distinct(Saliniteitsvoorkeur, `Estuarien gebruik groep`) %>% 
  arrange(Saliniteitsvoorkeur)

func_groepen_EMSE %>% 
  distinct(Dieet, `Trofische groep (Juveniel)`) %>% 
  arrange(Dieet)

func_groepen_EMSE %>% 
  distinct(Dieet, `trofische groep (Adult)`) %>% 
  arrange(Dieet)

Dt <- 
  func_groepen_EMSE %>% 
  distinct(Dieet, `trofische groep (Adult)`) %>% 
  arrange(`trofische groep (Adult)`)


# Chelidonichthys lucerna
# Chelidonichthys lucernus
#
# Cottus gobio
# Cottus perifretum  rivierdonderpad
# Cottus poecilopus  Siberische rivierdonderpad
#
# Echiichthys vipera
# Echeiichthys vipera
#
# Gymnocephalus cernuus
# Gymnocephalus cernua L.
#
# Liza ramada
# Chelon ramada  dunlipharder
#
# Platichthys flesus
# Platichtys flesus L.
#
# Scardinius erythrophthalmus
# Scardinius erythrophtalmus L
#
# Squalius cephalus
# Squalus acanthias  doornhaai
# Leuciscus cephalus L.  kopvoorn


# func_groepen_EMSE <-
#   func_groepen_EMSE %>%
#   mutate(SalVIS = case_when(
#     Water_Zoet & !Water_Anadroom ~ "Zoetwatersoorten",
#     Water_Brak & !Water_Zoet & !Water_Anadroom ~ "Estuariene soorten en mariene migranten",
#     Water_Anadroom ~ "Diadromen")) %>%
#   select(TaxonKey, Soort, WetenschappelijkeNaam, Saliniteitsvoorkeur, SalVIS, everything())

# zeebaars
# Dicentrarchus labrax L.
# Mariene migranten
# Zoetwatersoorten
#
# brakwatergrondel
# Pomatoschistus microps Kroyer
# Estuarien residenten
# Zoetwatersoorten
#
# dikkopje
# Pomatoschistus minutus Pallas
# Estuarien residenten
# Zoetwatersoorten

ankerkuil_aantal_historisch <- 
  read_delim(str_c(pad_data, "ankerkuil_aantallen_2012_2021.csv"), delim = ";")


soorten <-
  ankerkuil_aantal_historisch %>%
  pivot_longer(cols = `tiendoornige stekelbaars`:last_col(),
               names_to = "soort",
               values_to = "aantal") %>%
  group_by(soort) %>% 
  mutate(anyN = any(aantal > 0)) %>% 
  ungroup() %>% 
  filter(anyN) %>% 
  filter(!str_detect(soort, "garnaal|garnalen|gammarus|krab|kreeft|inktvis|octopus|zeekat")) %>%
  distinct(soort) %>% 
  mutate(soort = str_to_lower(soort))

soorten <-
  soorten %>% 
  left_join(func_groepen_VIS %>% 
              select(Soort, WetenschappelijkeNaam, Exoot) %>% 
              mutate(Soort = str_to_lower(Soort),
                     WetenschappelijkeNaam = str_to_lower(WetenschappelijkeNaam)), 
            by = c("soort" = "Soort"))

# naakte grondel
# kleine koornaarvis
# groene zeedonderpad
# terapon jarbua
# zeebrasem
# goudharder
# reuzenkapiteinvis

soorten <-
  soorten %>% 
  left_join(func_groepen_EMSE %>% 
              select(soort = Soort, WetenschNaamEMSE = Species,
                     Saliniteitsvoorkeur, Dieet) %>%
              mutate(soort = str_to_lower(soort),
                     WetenschNaamEMSE = str_to_lower(WetenschNaamEMSE))) %>% 
  mutate(inEMSE = !is.na(Dieet)) %>% 
  select(soort, WetenschNaamVIS = WetenschappelijkeNaam, WetenschNaamEMSE, everything())

soorten <-
  soorten %>% 
  left_join(func_groepen_Erika %>% 
              select(soort = `Nederlandse naam`, WetenschNaamErika = `Wetenschappelijke naam`, 
                     saliniteitsgroep = `Estuarien gebruik groep`, trofischegroep = `trofische groep (Adult)`) %>%
              mutate(soort = str_to_lower(soort),
                     WetenschNaamErika = str_to_lower(WetenschNaamErika))) %>% 
  select(soort, WetenschNaamVIS, WetenschNaamEMSE, WetenschNaamErika, inEMSE, Exoot, 
         SalgroepEMSE = Saliniteitsvoorkeur, SalgroepErika = saliniteitsgroep, DieetEMSE = Dieet, DieetErika = trofischegroep)

soorten <-
  soorten %>% 
  mutate(Salgroep =
           case_when(
             # !is.na(SalgroepEMSE) ~ SalgroepEMSE,
             is.na(SalgroepEMSE) & (SalgroepErika == "F" | SalgroepErika == "F*") ~ "Zoetwatersoorten",
             is.na(SalgroepEMSE) & str_detect(SalgroepErika, "A|C") ~ "Diadromen",
             is.na(SalgroepEMSE) & SalgroepErika == "Es" ~ "Estuarien residenten",
             is.na(SalgroepEMSE) & SalgroepErika == "M" ~ "Mariene dwaalgasten",
             is.na(SalgroepEMSE) & (SalgroepErika == "Mj" | SalgroepErika == "Ms") ~ "Mariene migranten"),
         Salgroep = if_else(!is.na(SalgroepEMSE), SalgroepEMSE, Salgroep),
         Dieet = 
           case_when(
             # is.na(DieetEMSE) & str_length(str_squish(DieetErika >= 2)) ~ "Omnivoren",
             is.na(DieetEMSE) & str_detect(DieetErika, "BF|BZ|VF|De|O") ~ "Omnivoren",
             # is.na(DieetEMSE) & DieetErika == "O" ~ "Omnivoren",
             is.na(DieetEMSE) & DieetErika == "B" ~ "Benthivoren",
             is.na(DieetEMSE) & DieetErika == "P" ~ "Planktivoren",
             is.na(DieetEMSE) & DieetErika == "F" ~ "Piscivoren"),
         Dieet = if_else(!is.na(DieetEMSE), DieetEMSE, Dieet)) %>% 
  relocate(Salgroep, .before = DieetEMSE)

soorten %>% 
  writexl::write_xlsx(str_c(pad_data, "soorten_Zeeschelde.xlsx"))

# naakte grondel
# kleine koornaarvis
# groene zeedonderpad
# smelt
# zandspiering
#   kleine zandspiering
#   grote zandspiering
# zwartbekgrondel
# terapon jarbua
# zeebrasem
# goudharder
# reuzenkapiteinvis


