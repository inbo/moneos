
library(tidyverse)
library(lubridate)
library(readxl)

jr <- 2023
campagne <- 2022
##############


### moneos data ###

data_MONEOS <- 
  write_xlsx(list(Legende = legende, TOPOdata_MONEOSRAAIEN_INBO = data_MONEOS), 
           filename)


# ------TOOL- alle grafieken---------------------------------



plot_raai <- 
  function(dat_raai, pad, prefix = "") {
    
    if(!dir.exists(pad))
      dir.create(pad, recursive = TRUE)
    
    Afst <- 
      Afst %>% 
      merge(OeverRaai, by.x="Raai", by.y="REEKSCODE", all.x=TRUE)
    
    year_colors <-
      tibble(Year = unique(year(MONEOSraai$Datum))) %>% 
      arrange(Year) %>% 
      mutate(Colour = c(rev(terrain.colors(n()+1))[c(-1,-2)], 'red'))
    
    for(i in 1:nrow(Afst)) {
      # for(i in 2) {
      dat <- 
        MONEOSraai %>% 
        # filter(is.na(Campagne) | Campagne != campagne) %>% 
        filter(Raai == Afst[i,"Raai"],
               Afstand > Afst[i,'Afstand']) %>% 
        mutate(Year = year(Datum),
               Month = month(Datum),
               Datum = factor(Datum)) %>% 
        arrange(Datum, Afstand)
      
      if (periode == "winter") {
        dat <- 
          dat %>% 
          filter(Month %in% c(1,2,3,4,11,12))
      }
      
      if(nrow(dat) > 0) {
        dat_last <-
          dat %>%
          filter(!is.na(Campagne) & Campagne == campagne)
        colors <- 
          dat %>% 
          distinct(Year, Datum) %>% 
          arrange(Datum) %>% 
          left_join(year_colors)
        VS <- 
          VastePunten %>% 
          filter(Raai == Afst[i,"Raai"],
                 Afstand > Afst[i,'Afstand'])
        p <- 
          ggplot(dat, aes(Afstand, mTAW, group = Datum, colour = Datum)) +  
          geom_line(size = 1) + 
          geom_point(size = 2) + 
          geom_line(data = dat_last, size = 1) +
          geom_point(data = dat_last, size = 2) +
          geom_point(data= VS, aes(shape = VastPunt), size = 3, colour="black") +
          scale_y_continuous(breaks = pretty(dat$mTAW, 10)) +
          scale_colour_manual(values = colors$Colour) +
          labs(title = dat$Raai,
               x = "Afstand tot de dijk (m)",
               y = " m T.A.W.") + 
          theme_bw() + 
          theme(plot.title = element_text(size = 20, hjust = 0.5),
                axis.title = element_text(size = 18),
                axis.text = element_text(size = 15),
                legend.title = element_text(size = 20), 
                legend.text = element_text(size = 14),
                panel.border = element_blank(),
                panel.grid.minor = element_blank(), 
                panel.grid.major = element_line(colour = "grey")) 
        
        if(Afst[i,"Oever"]) {
          p <- p + scale_x_reverse(breaks = pretty(dat$Afstand,10))
        } else {
          p <- p + scale_x_continuous(breaks = pretty(dat$Afstand,10))
        }
        
        print(p)
        ggsave(p, file=str_c(pad, prefix, Afst[i,'Naam'], "_", periode, ".png"), width=16, height=8, dpi= 350)
      }
    }
  }


# ------------MONEOSPROFIELEN---------------------------

Afst <- 
  data.frame(Raai=c("GBSa","APa","APc","BAL","BM","BOE","BR","BR","DO","ODa","ODa","GBa","GBSb","GBSd","GSb","GSc","GSHb","GSHb","GW","HO","KPe","KPe","KRb","KS","KS","KV","NOTb","PA","TB","LH","MK","PD","VL","LP","LP","DM","DU","KPb","WE","WE","NOTc","HEUc","HEUf"), 
             Naam=c("GBSa","APa","APc","BAL","BM","BOE","BR","BRslik","DO","ODa","ODaslik","GBa","GBSb","GBSd","GSb","GSc","GSHb","GSHbslik","GW","HO","KPe","KPeslik","KRb","KS","KSslik", "KV","NOTb","PA","TB","LH","MK","PD","VL","LP","LPslik","DM","DU","KPb","WE","WEslik","NOTc","HEUc","HEUf"), 
             Afstand=c(25,30,0,102,540,10,5,70,15,15,250,45,25,25,150,205,0,120,50,5,20,205,5,5,37,60,130,5,40,5,5,70,25,20,218,180,0,0,0,130,10,10,10) )

plot_raaien(Afst,
            # periode = "winter",
            folder = "MONEOSDEEL")

# plot_raaien(Afst %>% filter(Raai == "TB"),
#             folder = "MONEOSDEEL")

# -----------------Aanvullende PROFIELEN---------------------------

Afst <- 
  data.frame(Raai=c("HEUa","BS","APd","NOTc","ODNL2","KPb","ZLa","KPo", "KPd","TS","BOEb","FF","BO","UD", "WM","WMa","GSa","GSd","GSd","RH", "RN", "OB1", "OB2", "OB3", "MKb", "DUB", "GBSe", "WMc", "WMb", "OD1", "DL", "NE", "ZN", "FPa", "FPb", "FPc", "FPd"), 
             Naam=c("HEUa","BS","APd","NOTc","ODNL2","KPb","ZLa","KPo", "KPd","TS","BOEb","FF","BO","UD", "WM","WMa","GSa","GSd","GSdslik", "RH", "RN", "OB1", "OB2", "OB3", "MKb","DUB", "GBSe", "WMc", "WMb", "OD1", "DL", "NE", "ZN", "FPa", "FPb", "FPc", "FPd"),
             Afstand=c(15,0,0,0,0,0,0,-50,0,0,0,0,0,0,0,0,10,45,230,7,5,0,0,0,0,180,0,0,0,0,0,0,0,0,0,0,0))

plot_raaien(Afst,
            # periode = "winter", 
            folder = "Aanvullend")

# plot_raaien(Afst %>% filter(Raai == "WMc"),
#             folder = "Aanvullend")


# -----------------Optionele DU_PROFIELEN---------------------------

Afst <- data.frame(Raai=c("DUMREF","DUMP","DUKB","DURIO","DUH","DUOD"), 
                   Naam=c("DUMREF","DUMP","DUKB","DURIO","DUH","DUOD"), 
                   Afstand=c(60,25,42,80,120,40))

plot_raaien(Afst,
            # periode = "winter", 
            folder = "Optioneel_DU")

# plot_raaien(Afst %>% filter(Raai == "DUH"),
#             folder = "Optioneel_DU")

# -----------------FF profielen---------------------------

# Afst <- data.frame(Raai=c("FF1","FF2","FF3","FF4","FF5","FF5", "FF6"), 
#                    Naam=c("FF1","FF2","FF3","FF4","FF5","FF5", "FF6"), 
#                    Afstand=c(0,0,0,0,0,0,0))
# 
# plot_raaien(Afst, 
#             folder = "FF")


# -----------------Benthos profielen---------------------------

# Afst <- data.frame(Raai=c("BALa","BMa","BRa","DKc","HEUg","HOa","NOTc_1","PDa","TBa","WEa","ZGa","ZGb"), 
#                    Naam=c("BALa","BMa","BRa","DKc","HEUg","HOa","NOTc_1","PDa","TBa","WEa","ZGa","ZGb"),
#                    Afstand=c(0,0,0,0,0,0,0,0,0,0,0,0))
# 
# plot_raaien(Afst, 
#             folder = "Benthos",
#             prefix = "Benthos")

# -----------------Groot Schoor Hamme profielen---------------------------

# Afst <- data.frame(Raai=c("GSHc","GSHd","GSHe"),
#                    Naam=c("GSHc","GSHd","GSHe"),
#                    Afstand=c(0,0,0))
# 
# plot_raaien(Afst,
#             folder = "GrootSchoorHamme")

# -----------------Hedwige/Ouden Doel profielen---------------------------

# Afst <- data.frame(Raai=c("ODa"),
#                    Naam=c("ODa"),
#                    Afstand=c(0,0,0))
# 
# plot_raaien(Afst,
#             folder = "Hedwige")



