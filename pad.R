
pad_prj_schelde <- Sys.getenv("pad_prj_schelde")
if (pad_prj_schelde == "") {
  stop("Maak een bestand .Renviron aan met het pad waar PRJ_SCHELDE staat, zie de instructies voor deze repo.")
}
# indien het bestand .Renviron nog niet bestaat, maak dit dan aan in de lokale moneos folder en voeg de volgende lijnen toe:
# pad_prj_schelde="G:/Mijn Drive/INBODATA/PROJECTEN/PRJ_SCHELDE/"
# basis_pad="//Client/G$/Mijn Drive/INBODATA/PROJECTEN/PRJ_SCHELDE/"


pad_moneos <- "/VNSC/Rapportage_INBO/"
pad_jaar <- "2021/"

maak_pad <- function(hoofdstuk, onderdeel = NULL) {
  pad <- paste0(pad_prj_schelde, pad_moneos, pad_jaar, hoofdstuk, "/")
  if (!is.null(onderdeel))
    pad <- paste0(pad, onderdeel, "/")
  if (!dir.exists(pad))
    dir.create(pad, recursive = TRUE)
  return(pad)
}

