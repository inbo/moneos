
# ophalen van topgrafische data uit Raai databank 'SlikSchorProfiel_data.mdb' voor MONEOS rapportage
# Er wordt een tabel aangemaakt met alle data vanaf 2008 voor de MONEOS campagnes (gemeten in nov-maart)
# De tabel wordt weggeschreven in formaat voor aanlevering aan VLIZ (onder "PRJ_SCHELDE/VNSC/Projectgroep_Monitoring&Databeheer/Data_aanleveringen/")


library(tidyverse)
library(janitor)
library(lubridate)
library(DBI)
library(writexl)

#### parameters ####
# jaar van rapportage
jaar <- 2023

# locatie waar file wordt weggeschreven
locatie <- 
  "//Client/G$/Mijn Drive/INBODATA/PROJECTEN/PRJ_SCHELDE/VNSC/Projectgroep_Monitoring&Databeheer/Data_aanleveringen/"
filename <-
  str_c(locatie, jaar, "/130_sedimentatie_erosie/TOPOdata_MONEOSraai_INBO_", jaar, ".xlsx")


#### ophalen gegevens uit databank ####
pad_databank <- "Z:/Topografie/slikschorprofiel/Databank/"
# pad_databank <- "Q:/Projects/PRJ_Schelde/Topografie/slikschorprofiel/Databank/"

conn <- 
  dbConnect(odbc::odbc(),
            Driver = "Microsoft Access Driver (*.mdb, *.accdb)",
            DBQ = str_c(pad_databank, "SlikSchorProfiel_data"))

tblData_Dwarsprofiel <- 
  tbl(conn, "tblData_Dwarsprofiel")
cdeRaai <- 
  tbl(conn, "cdeRaai")
cdeDatumCampagneJaar <-
  tbl(conn, "cdeDatumCampagneJaar")

data_MONEOS_db <- 
  tblData_Dwarsprofiel %>% 
  select(DATUM, REEKSCODE, distance_prof, HOOGTE__MT, ORI_X, ORI_Y, SNAP_X, SNAP_Y, Validatie) %>% 
  inner_join(cdeRaai %>% 
               select(REEKSCODE, Salzone, Omes, Campagne)) %>% 
  left_join(cdeDatumCampagneJaar %>%
              select(DATUM, MeetCampagneJaar)) %>%
  filter(Validatie) %>% 
  arrange(DATUM, REEKSCODE, distance_prof) %>% 
  select(MeetCampagneJaar, Salzone, Omes, DATUM, REEKSCODE, Campagne, distance_prof, HOOGTE__MT, ORI_X, ORI_Y, SNAP_X, SNAP_Y)

data_MONEOS <-
  data_MONEOS_db %>% 
  collect() %>% 
  mutate(Salzone = ifelse(str_starts(Salzone, "Zone grote saliniteitsgradi"), "Zone grote saliniteitsgradient", Salzone),
         DATUM = date(DATUM))

dbDisconnect(conn)


#### controle van de data ####
# controle of alle relevante datums voor MONEOS rapportage zijn opgenomen in de databank tabel 'cdeDatumCampagneJaar'
# => voor relevante datums mag kolom "MeetCampagneJaar" in 'tbl_gemeten_raaien' niet NA zijn
tbl_gemeten_raaien <- 
  data_MONEOS %>% 
  select(REEKSCODE, MeetCampagneJaar, DATUM) %>% 
  distinct() %>% 
  arrange(REEKSCODE, DATUM, MeetCampagneJaar)


#### filteren van de relevante MONEOS data ####
# => enkel metingen in nov-maart 
# cf. datums die zijn opgelijst in de databank tabel 'cdeDatumCampagneJaar'
data_MONEOS <-
  data_MONEOS %>% 
  filter(!is.na(MeetCampagneJaar))


#### wegschrijven van de data naar excel file ####
legende <-
  map_dfr(list(c("MeetCampagneJaar", "Meetperiode binnen MONEOS (standaard nov-maart)"), 
               c("Salzone", "Saliniteitszone en overeenkomstige KRW-zone: mesohaliene zone of KRW IV, oligohaliene zone of KRWIII, zoete zone met lange verblijftijd of KRW II, zoete zone met korte verblijftijd of KRWI, Durme, Rupel of KRWIII en zijrivieren met Nete, Dijle en Zenne"), 
               c("Omes", "Code gegeven aan iedere Omes zone"), 
               c("DATUM", "Datum van inmeting met RTK-GPS"),
               c("REEKSCODE", "Code van de RAAI"),
               c("Campagne"), 
               c("distance_prof", "Afstand tot het referentiepunt op de dijk (meter)"), 
               c("HOOGTE__MT", "Ingemeten Z-coördinaat met RTK-GPS (meter)"), 
               c("ORI_X", "Ingemeten X-coördinaat met RTK-GPS (Belge Lambert 1972)"), 
               c("ORI_Y", "Ingemeten Y-coördinaat met RTK-GPS (Belge Lambert 1972)"),
               c("SNAP_X", "X-coördinaat verkregen na verschuiving naar de raailijn (Belge Lambert 1972)"), 
               c("SNAP_Y", "Y-coördinaat verkregen na verschuiving naar de raailijn (Belge Lambert 1972)")),
          ~tibble(.[1],.[2])) %>% 
  rename(c(veld = `.[1]`, legende = `.[2]`))
write_xlsx(list(Legende = legende, TOPOdata_MONEOSRAAIEN_INBO = data_MONEOS), 
           filename)





