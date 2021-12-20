
pad_prj_schelde <- Sys.getenv("pad_prj_schelde")
pad_moneos <- Sys.getenv("pad_moneos")
jaar_moneos <- Sys.getenv("jaar_moneos")
if (pad_prj_schelde == "") {
  stop("Maak een bestand .Renviron aan met het pad waar PRJ_SCHELDE staat, zie de instructies voor deze repo.")
}
if (pad_moneos == "") {
  stop("Maak een bestand .Renviron aan met het pad waar pad_moneos staat, zie de instructies voor deze repo.")
}
if (jaar_moneos == "") {
  stop("Maak een bestand .Renviron aan met jaar_moneos, zie de instructies voor deze repo.")
}
# indien het bestand .Renviron nog niet bestaat, maak dit dan aan in de lokale moneos_XX (XX = jaar) folder en voeg de volgende lijnen toe:
# pad_prj_schelde="G:/Mijn Drive/INBODATA/PROJECTEN/PRJ_SCHELDE/"
# basis_pad="//Client/G$/Mijn Drive/INBODATA/PROJECTEN/PRJ_SCHELDE/"
# pad_moneos="VNSC/Rapportage_INBO/"
# pad_jaar=XX # XX = rapportagejaar 


maak_pad <- function(hoofdstuk, onderdeel = NULL) {
  pad <- paste0(pad_prj_schelde, pad_moneos, jaar_moneos, "/", hoofdstuk, "/")
  if (!is.null(onderdeel))
    pad <- paste0(pad, onderdeel, "/")
  if (!dir.exists(pad))
    dir.create(pad, recursive = TRUE)
  return(pad)
}

