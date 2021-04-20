---
params:
  hoofdstuk: "100_watervogels"
knit: (function(inputFile, encoding) {
        rmarkdown::render(inputFile,
                          encoding=encoding,
                          output_dir = {
                            source("../pad.R");
                            maak_pad(rmarkdown::yaml_front_matter(inputFile)$params$hoofdstuk, "output")
                          }
                          )})
title: "moneos hoofdstuk watervogels"
output:
  bookdown::pdf_book:
    base_format: INBOmd::inbo_rapport
    style: INBO
    tocdepth: 2
    lof: TRUE
    lot: TRUE
    floatbarrier: subsection
bibliography: references.bib
link-citations: TRUE
---














# watervogels

Fichenummer: FICHE S-DS-V-007a – Maandelijkse vogeltellingen

Fichenummer: FICHE S-DS-V-007b – Vogeltellingen zijrivieren 

__Gunther Van Ryckegem__

## Inleiding

Het voorkomen van watervogels kan indicatief zijn voor het estuarien ecosysteemfunctioneren. Aantalsveranderingen kunnen zowel door factoren van buiten (bijvoorbeeld klimaatverandering, Europese populatietrends,…) als van binnen het estuarium gestuurd worden. Dit betekent dat trends steeds in een ruimer kader en met de nodige omzichtigheid geëvalueerd moeten worden. Interne factoren kunnen bijvoorbeeld een gewijzigd voedselaanbod, foerageerareaal of een gewijzigde verstoringinvloed zijn. 

De eerstelijnsrapportage beschrijft de aangeleverde watervogeldata van de Zeeschelde en de zijrivieren met een focus op de verzamelde tellingen tot de winter van 2019 (eindigend in maart 2020). De data werden gefilterd uit de Watervogeldatabank van het INBO.

Beide fiches werden in één excel bestand aangeleverd: “DataMONEOSWatervogels-Zeeschelde_zijrivieren_totwinter**XXX**.xlsx”

De evaluatie heeft volgende informatie nodig: aantallen vogels per soort per maand per segment op niveau 2 en 3 (niveau 2 is som van de waterlichamen; niveau 3 heeft betrekking op het waterlichaam of de saliniteitszone) [@marisEvaluatiemethodiekScheldeestuariumUpdate2014]. 

De dataset bevat volgende informatievelden: riviernaam, telseizoen, maand, jaar, krw, soort en aantal, waarbij:

- riviernaam: het naamveld van de rivier (Zeeschelde, Durme, Rupel, Zenne, Dijle)
- telseizoen: een vogeltelseizoen loopt van juli jaar x tot juni jaar x+1. 
- krw: indeling volgens Figuur **XXX**.
- aantal: de aantallen omvatten de som van de getelde vogels per soort, per maand, per rivier en krwzone. 


## Materiaal en methode

Sinds oktober 1991 tellen medewerkers van het INBO maandelijks het aantal watervogels langs de Zeeschelde vanaf de Belgisch-Nederlandse grens tot Gent. De trajecten op Nederlands grondgebied werden niet opgenomen. De aangeleverde data lopen van oktober 1991 tot en met maart 2020. Oorspronkelijk werd enkel tijdens de winter (oktober – maart) geteld, vanaf 1993 wordt ook tijdens de zomer geteld. Deze zomertellingen (april (behalve juni) - september) werden stopgezet tussen Antwerpen en Gent sinds het telseizoen 2018/19. In de zomer wordt enkel nog gebiedsdekkend geteld in juni. Sinds de winter van 1995/1996 wordt ook geteld langsheen de Rupel (Rupelmonding – sas van Wintam). De tellingen gebeuren vanaf een boot en bij laag tij. Omdat het niet haalbaar is om het volledige onderzoeksgebied grondig te tellen tijdens de periode van één laag tij, worden de telling gespreid over drie dagen. De dagen worden steeds gegroepeerd in het midden van de maand. Alle watervogelsoorten (en steltlopers) worden tijdens de boottellingen geteld sinds het begin van de tellingen, de meeuwen en sternen worden geteld sinds oktober 1999. De tellingen langsheen de zijrivieren (behalve het deel tussen de Rupelmonding tot Wintam) worden geteld vanop de rivieroever door vrijwilligers.De meeuwen, sternen, wulp, kievit en waterhoen worden langs de zijrivieren geteld sinds oktober 1999.In de exploratieve analyse werden de meeuwen en sternen uit de dataset gelaten.

__Ruimtelijke en temporele afbakening data__

_Boottellingen_

De data omvatten de aantallen watervogels op de Zeeschelde, geteld vanop de boot. Dit is inclusief deze op het traject Melle-Gentbrugge dat geteld wordt vanaf de dijk (in de databank als traject Tijgebonden oude Schelde Gent - tot aan monding Ringvaart (2050810)) en deze op het gedeelte van de Rupel dat vanop de boot wordt geteld. Om de data voor het waterlichaam ZSIII+Rupel compleet te maken wordt de dataset aangevuld met tellingen van de Rupel die zijn geteld vanaf de dijk. De dijktellingen gaan enkel door in de winter. De teltrajecten (9999999 en 9999998) gelegen op Nederlands grondgebied werden niet in rekening gebracht voor de data analyse.

_Zijrivieren_

De geselecteerde teltrajecten van de zijrivieren (Watervogeldatabank, INBO) zijn weergegeven in Tabel \@ref(:100-tabel-teltrajecten). Voor de Getijdenetes zijn geen afzonderlijke riviertellingen beschikbaar; voor de Getijdedijle is een beperkte dataset beschikbaar (1996, 1999 en verder vanaf 2008). Eén teltraject in de Durme (Durmemonding tot Mirabrug) werd niet geteld in 2007-2008.

_Ontbrekende data telseizoen 2018/19 en 2019/20_:

**2018/19**

INBO Zeeschelde tellingen zijn volledig
Eerste jaar met geen tellingen bij start zomerseizoen (april en mei)

MIDMA ontbrekende data:
Zenne Zennegat - Hombeekbrug MECHELEN - geen telling in maart 2019
Tijgebonden Oude Schelde Gent - monding Ringvaart- ontbrekende telling oktober en november 2018
Rupel Wintam-sas tot brug Boom
Rupel Wintam-sas tot brug Boom
Rupel Wintam-sas tot brug Boom - ontbrekende telling oktober 2018 & maart 2019
Dijle Netemonding - Mechelen - ontbrekende tellingen jan, feb, maart 2019


**2019/20** 


INBO Zeeschelde tellingen zijn volledig

MIDMA ontbrekende data:
Zenne Zennegat - Hombeekbrug MECHELEN - geen telling in okt 2019 en februari 2020
Tijgebonden Oude Schelde Gent - monding Ringvaart- ontbrekende telling februari 2020
Dijle Netemonding - Mechelen - ontbrekende telling maart 2020


_Winterkarakteristiek telseizoen 2018/19 en 2019/20_:

De winter van 2018/19 [^footnote-100-2] was klimatologisch een zachte winter. Warme temperatuur, relatief veel zon en gemiddelde neerslag. De langste koudeperiode was van 18-25 januari 2019 en enkele dagen begin februari 2019.Er waren 22 vorstdagen en 2 winterse dagen (max <0°C).  De winter van 2019/20 was klimatologisch een warme winter.De seizoensgemiddelde temperatuur was 6.3°C (normaal 3.6°C). Er waren slechts 14 vorstdagen en er waren geen winterse dagen (max<0°C) http://www.meteo.be/. Er werden ook ten noorden van België geen lange vorstperiodes genoteerd waardoor geen opvallende winterinflux van vogels naar de Zeeschelde optrad.

[^footnote-100-2]: KMI winter 2020 (dec 2019 - feb 2020) ~= wintervogeljaar (telseizoen 2019/20).



<!--  | -->
<!-- -|- -->
<!-- : Geselecteerde teltrajecten opgenomen in de exploratieve data-analyse en in de data-aanlevering. {#tbl:100-tabel-teltrajecten} -->

\begin{table}

\caption{(\#tab:100-tabel-teltrajecten)Geselecteerde teltrajecten opgenomen in de exploratieve data-analyse en in de data-aanlevering.}
\centering
\resizebox{\linewidth}{!}{
\fontsize{15}{17}\selectfont
\begin{threeparttable}
\begin{tabular}[t]{llll}
\toprule{}
Bovenloop & Beschikbaar vanaf datum & Code & Gebiedsnaam\\
\midrule{}
\textcolor{black}{Dijle} & \textcolor{black}{1996/3} & \textcolor{black}{3121003} & \textcolor{black}{Dijle Netemonding – Mechelen}\\
\textcolor{black}{Durme} & \textcolor{black}{1990/11} & \textcolor{black}{2080605} & \textcolor{black}{Durmemonding - Mira-brug Tielrode}\\
\textcolor{black}{Durme} & \textcolor{black}{1994/10 tot 2012/10} & \textcolor{black}{2091301} & \textcolor{black}{Oude Durme + Durme HAMME}\textsuperscript{1}\\
\textcolor{black}{Durme} & \textcolor{black}{2012/10} & \textcolor{black}{2091305} & \textcolor{black}{Durme-brug Waasmunster tot Mira-brug Tielrode}\\
\textcolor{black}{Rupel} & \textcolor{black}{1995/10} & \textcolor{black}{4140205 (parentcode)} & \textcolor{black}{Rupelmonding tot Wintam-sas}\\
\addlinespace
\textcolor{black}{} & \textcolor{black}{} & \textcolor{black}{4140216 (LO) en 4140217 (RO)} & \textcolor{black}{}\\
\textcolor{black}{Rupel} & \textcolor{black}{1984/11} & \textcolor{black}{4140206} & \textcolor{black}{Wintam-sas tot brug Boom}\\
\textcolor{black}{Rupel} & \textcolor{black}{1992/10} & \textcolor{black}{3121303} & \textcolor{black}{brug Boom - monding Dijle/Nete}\\
\textcolor{black}{Zenne} & \textcolor{black}{1979/11} & \textcolor{black}{3120101} & \textcolor{black}{ZEMST(brug Brusselse Steenweg) - HOMBEEK (Eglegemvijver)}\\
\textcolor{black}{Zenne} & \textcolor{black}{1999/12} & \textcolor{black}{3121412} & \textcolor{black}{Zennegat - Hombeekbrug MECHELEN}\\
\bottomrule{}
\end{tabular}
\begin{tablenotes}
\item[1] textcolor{black}{Opgelet dit teltraject omvat data van zowel de getijgebonden Durme als van de afgesneden ‘oude’ Durme-arm. Sinds oktober 2012 wordt de getijgebonden Durme afzonderlijk geteld.}
\end{tablenotes}
\end{threeparttable}}
\end{table}
<!-- **XXX**voetnoot -->

<br/>  

## Exploratieve data-analyse watervogelaantallen

De globale patronen in de maandelijkse wintervogelaantallen langsheen de Zeeschelde blijven afnemend (Figuur \@ref(fig:100_figuur_maandelijkse_totalen_ZSwinter)). De wintermaxima[^footnote-100-1] laten zich tellen in de maanden december en januari en bereikten opnieuw een historisch dieptepunt van minder dan 6000 watervogels langsheen de volledige Zeeschelde (Figuur \@ref(fig:100_figuur_wintermaxima_Zeeschelde)). De laagste aantallen worden doorgaans geteld in maart. De vogelaantallen namen sterk af tussen 2002 en 2007. Tussen 2008 en 2010 was er een klein herstel maar sinds 2012 zijn de vogelaantallen verder afnemend.De proportionele verdeling van de watervogels in de verschillende waterlichamen (zie waterlichamen in Figuur **XXXfigrefXXX**) toont na de sterke afname van de watervogels in winter 2006/07 vooral in Zeeschelde III + Rupel een geleidelijke toename van het aandeel vogels dat verblijft in Zeeschelde IV (Beneden-Zeeschelde), Zeeschelde I en de zijrivieren. Vanaf 2010 neemt het aandeel watervogels ook af in Zeeschelde IV terwijl het aandeel in Zeeschelde I en zijrivieren constant blijft. Het aandeel vogels dat geteld wordt in de Durme neemt tussen 2007/08 en 2016/17 toe en neemt de laatste jaren terug af (Figuur \@ref(fig:100-figuur-verhouding-aantallen)). 

[^footnote-100-1]: Maximum van de som van alle vogels per wintermaand (oktober tot en met maart).

Per deelgebied (Figuur \@ref(fig:100-figuur-aantallen-KRWzones)):

In __Zeeschelde I__ (Gentbrugge – Dendermonde) was er een duidelijke terugval in het overwinterend aantal watervogels in de winter van 2017/18. Een beperkt herstel was zichtbaar de laatste twee winterperiodes maar de overwinterende watervogelaantallen blijven bij de laagste geteld sinds begin jaren '90. 

In __Zeeschelde II__ (Dendermonde – Durmemonding) is na de sterk dalende trend tussen 2001/02 en 2006/07. Tussen 2006/07 en 2015/16 zijn de aantallen relatief stabiel. Net zoals in Zeeschelde I was er ook een terugval in de aantallen in de winter van 2017/18. De aantallen blijven ook de laatste seizoenen afnemen. Gedurende winterseizoen 2019/20 was ook in deze zone het aantal watervogels historisch laag. 

__Zeeschelde III__ (Durmemonding - Kennedytunnel) __+ Rupel__ kende proportioneel de grootste afname in watervogelaantallen tussen 2006 en 2010. Deze afname zet zich nog steeds verder. 

In __Zeeschelde IV__ (Kennedytunnel – Grens) vertonen de winteraantallen tussen 1999 en 2007 een dalende trend. In de periode 2008-2013 lijken de aantallen zich te stabiliseren. Sinds 2013 zijn de vogelaantallen afnemend. De terugval is vooral waarneembaar in een sterke afname van de aantallen smient, wintertaling en grauwe gans (zie Van Ryckegem, 2013). De watervogelaantallen zijn in het winterseizoen 2019/20 opnieuw lager dan vorige winterseizoen.

De __Zenne__ (Figuur \@ref(fig:100-figuur-aantallen-zijrivieren)) was tot 2007 nagenoeg ‘vogeldood’. Sinds de waterkwaliteitsverbetering 2006/27 zijn er hoge aantallen overwinteraars. De hoogste aantallen werden geteld in de winter 2007-2008 en zijn sindsdien afnemend met de laagste aantallen geteld de laatste twee seizoenen sindsdien.

De trends in de  __Getijdedurme__ zijn enigszins moeilijker te interpreteren omdat de afbakening van het telgebied veranderde. Tot oktober 2012 werden de vogelaantallen van de Oude Durme en de Getijdendurme opgeteld. Sindsdien worden de vogelaantallen afzonderlijk geteld. Bovendien is er een datahiaat in de winter van 2007-2008. Dit verklaart de lage aantallen in deze periode (Figuur \@ref(fig:100-figuur-aantallen-KRWzones)). Na een periode met hogere aantallen (2013-2017) is het aantal overwinterende watervogels op de Durme afnemend. 

Op de __Dijle__ (Figuur \@ref(fig:100-figuur-aantallen-zijrivieren)) was de piek van vogelaantallen van korte duur. Terwijl gemiddeld in de periode 2007-2009 nog meer dan 1200 watervogels per winter werden geteld, is het aantal de laatste jaren slechts enkele tientallen vogels per winter.


\begin{figure}

{\centering \includegraphics[width=5.63in]{G:/Mijn Drive/INBODATA/PROJECTEN/PRJ_SCHELDE/VNSC/Rapportage_INBO/2021/100_watervogels/figuren/100_figuur_maandelijkse_totalen_ZSwinter} 

}

\caption{Maandelijkse wintertotalen van de watervogels langsheen de Zeeschelde sinds oktober 1991 tot 2020 (exclusief zijrivieren; exclusief meeuwen en sternen).}(\#fig:100-figuur-maandelijkse-totalen-winter-Zeeschelde)
\end{figure}

<br/>  

\begin{figure}

{\centering \includegraphics[width=5.63in]{G:/Mijn Drive/INBODATA/PROJECTEN/PRJ_SCHELDE/VNSC/Rapportage_INBO/2021/100_watervogels/figuren/100_figuur_wintermaxima_Zeeschelde} 

}

\caption{Wintermaxima van de watervogels langsheen de Zeeschelde sinds oktober 1991 tot 2020 (exclusief zijrivieren; exclusief meeuwen en sternen).}(\#fig:100-figuur-wintermaxima-Zeeschelde)
\end{figure}

<br/> 
\begin{figure}

{\centering \includegraphics[width=5.63in]{G:/Mijn Drive/INBODATA/PROJECTEN/PRJ_SCHELDE/VNSC/Rapportage_INBO/2021/100_watervogels/figuren/100_figuur_verhouding_aantallen} 

}

\caption{De verhouding van de totale aantallen watervogels in de waterlichamen (winter 1991 - 2020) (winterdata okt – mrt).}(\#fig:100-figuur-verhouding-aantallen)
\end{figure}

<br/>  

\begin{figure}

{\centering \includegraphics[width=5.63in]{G:/Mijn Drive/INBODATA/PROJECTEN/PRJ_SCHELDE/VNSC/Rapportage_INBO/2021/100_watervogels/figuren/100_figuur_aantallen_KRWzones} 

}

\caption{De wintervogelaantallen in de verschillende KRW-zones (gemiddelde per winter 1991/92 – 2019/20).}(\#fig:100-figuur-aantallen-KRWzones)
\end{figure}

<br/>  

\begin{figure}

{\centering \includegraphics[width=12.6in]{G:/Mijn Drive/INBODATA/PROJECTEN/PRJ_SCHELDE/VNSC/Rapportage_INBO/2021/100_watervogels/figuren/100_figuur_aantallen_zijrivieren} 

}

\caption{De wintervogelaantallen in de Dijle, Rupel en Zenne (gedeelte onder getijde-invloed) (gemiddelde per winter 1991/92 – 2019/20).}(\#fig:100-figuur-aantallen-zijrivieren)
\end{figure}

<br/>  

De trends in de wintervogelaantallen opgedeeld volgens de trofische indicatorgroepen is weergegeven in Figuur \@ref(fig:100-figuur-aantallen-trofische-groep). 

Winter 2019/20 is de dalende trend in het aantal benthivore overwinteraars (voornamelijk steltlopers) in Zeeschelde IV en III gestopt. Dit is volledig te wijten aan de iets hogere aantallen kievit in 2019/20. De negatieve trend bij kluut en wulp (Figuur \@ref(fig:100-figuur-aantallen-visetend-en-steltlopers)) zet zich echter verder door. Deze tendens lijkt op het eerste zicht niet gecorreleerd met een kleiner voedselaanbod (Figuur **XXX**). Het gemiddeld aantal visetende vogels in Zeeschelde II (vooral aalscholver) schommelt en correspondeert relatief goed met de trends van vis in deze zone van de Zeeschelde (Figuur **XXX**).

Van een aantal algemenere soorten worden de trends in de periode 2010-2020 getoond in Figuur \@ref(fig:100-figuur-aantallen-abundante-soorten) en Figuur \@ref(fig:100-figuur-aantallen-visetend-en-steltlopers).

De bergeend neemt voor het 6de jaar in rij af. Deze afname is opvallend in Zeeschelde IV. Ook de wilde eend en wintertaling namen verder af. De krakeend nam opvallend af **XXX**2019/20 na een periode van een toename in Zeeschelde III en IV. De aalscholveraantallen schommelen en volgen in de toename in vis vooral in de Boven-Zeeschelde. Echter de fuut, ook een viseter is quasi volledig verdwenen langs alle teltrajecten. Tureluur zet zijn stijgende trend niet verder. De gemiddelde wulpaantallen bereiken een historisch dieptepunt. In Zeeschelde IV is er een toename in bodemdierbiomassa vastgesteld (Hoofdstuk **XXX**) (vooral dan _Corophium_, _Hediste_ en _Cyathura_). De negatieve trends van de overwinterende benthivore en omnivore vogels lijken dus niet sterk gecorreleerd met de ontwikkeling van het voedselaanbod, behalve voor tureluur. Het onderzoeken van deze watervogeltrends vereist een integrerende tweedelijnsanalyse van regionale trends (vallei, Vlaanderen, Westerschelde, ... tot het bekijken van de Europese trends), voedselaanbod en beschikbaarheid en mogelijke verstoringseffecten.

De trends van de meest talrijke exotische overwinterende vogelsoorten is weergegeven in Figuur \@ref(fig:100_figuur_aantallen_exoten). De hoogste aantallen worden geteld in Zeeschelde III + Rupel en de aantallen zijn toenemend vooral voor Canadese gans en nijlgans. De boerengans en soepeend komen in relatief kleine aantallen voor en zijn stabiel tot afnemend. 

De dichtheden van de overwinterende watervogels per KRW-zone op het oppervlakte zacht substraat slik in de Zeeschelde is weergegeven in Figuur \@ref(fig:100_figuur_dichtheid). Voor de figuur werd een selectie gemaakt van alle omnivore en benthivore soorten en werden kuifeend en tafeleend uitgesloten omdat beide soorten vooral afhankelijk zijn van het voedselaanbod in de ondiepe waterzones. In 2001 was de vogeldichtheid in Zeeschelde III en Rupel en Zeeschelde II rond de 140 vogels per ha. In 2016 daalde deze dichtheid in Zeeschelde III + Rupel tot ongeveer 20 vogels per hectare. In Zeeschelde II bleef dit aantal ongeveer 80 vogels per ha. De dichtheid in Zeeschelde IV schommelt rond de 10 vogels per hectare. Dit is heel wat lager dan in andere zones nochtans dat het voedselaanbod als biomassa bodemdieren per oppervlakte eenheid hier niet significant lager is dan in andere zones. De oppervlakte zacht substraat in de verschillende zones is maar in beperkte mate veranderd (Hoofdstuk **XXXX**) en heeft hierdoor een beperkte invloed, tot nu toe, op de berekende dichtheden. 

\begin{figure}

{\centering \includegraphics[width=12.6in]{G:/Mijn Drive/INBODATA/PROJECTEN/PRJ_SCHELDE/VNSC/Rapportage_INBO/2021/100_watervogels/figuren/100_figuur_aantallen_trofische_groep} 

}

\caption{Trends in gemiddelde wintervogelaantallen per KRW-zone (gemiddelde per winter 2009/10 – 2019/20) opgedeeld volgens de trofische indicatorgroepen (Nbenth: benthivoren, Nherb: herbivoren, Nomn: omnivoren en Npisc: piscivoren).}(\#fig:100-figuur-aantallen-trofische-groep)
\end{figure}

<br/>  

\begin{figure}

{\centering \includegraphics[width=12.6in]{G:/Mijn Drive/INBODATA/PROJECTEN/PRJ_SCHELDE/VNSC/Rapportage_INBO/2021/100_watervogels/figuren/100_figuur_aantallen_abundante_soorten} 

}

\caption{Trends in het gemiddelde aantal wintervogels (okt.-mrt.) voor 4 abundante soorten in de 4 KRW-zones van de Zeeschelde+Rupel.}(\#fig:100-figuur-aantallen-abundante-soorten)
\end{figure}

<br/>  

\begin{figure}

{\centering \includegraphics[width=12.6in]{G:/Mijn Drive/INBODATA/PROJECTEN/PRJ_SCHELDE/VNSC/Rapportage_INBO/2021/100_watervogels/figuren/100_figuur_aantallen_visetend_en_steltlopers} 

}

\caption{Trends in het gemiddeld aantal getelde wintervogels (okt.-mrt.) voor 2 abundante visetende (piscivore) en twee abundante steltlopers in de 4 KRW-zones van de Zeeschelde+Rupel.}(\#fig:100-figuur-aantallen-visetend-en-steltlopers)
\end{figure}

<br/>  

\begin{figure}

{\centering \includegraphics[width=5.63in]{G:/Mijn Drive/INBODATA/PROJECTEN/PRJ_SCHELDE/VNSC/Rapportage_INBO/2021/100_watervogels/figuren/100_figuur_aantallen_exoten} 

}

\caption{Trends in het gemiddeld aantal getelde wintervogels (okt.-mrt.) voor 4 abundante exoten in de 4 KRW-zones van de Zeeschelde+Rupel.}(\#fig:100-figuur-exotentrends)
\end{figure}

<br/> 

\begin{figure}

{\centering \includegraphics[width=12.6in]{G:/Mijn Drive/INBODATA/PROJECTEN/PRJ_SCHELDE/VNSC/Rapportage_INBO/2021/100_watervogels/figuren/100_figuur_dichtheid} 

}

\caption{Vogeldichtheid (aantallen per ha zacht substraat slik) van getelde wintervogels (okt.-mrt.) in de 4 KRW-zones van de Zeeschelde+Rupel. Data gepresenteerd voor de jaren overeenkomstig de beschikbare ecotopenkaart}(\#fig:100-figuur-dichtheden-watervogels-per-zone)
\end{figure}

<br/> 
**Algemene conclusie**

De vogelaantallen op de Zeeschelde vertonen een doorgaande dalende trend. Deze trends lijken ondertussen al niet meer gerelateerd aan de systeemshift die er kwam door de verbeterende waterkwaliteit. Deze trend vraagt om bijkomende inzichten zodat eventueel maatregelen kunnen getroffen worden om de negatieve trend om te buigen. 




