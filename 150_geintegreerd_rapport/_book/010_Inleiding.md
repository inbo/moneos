---
params:
  hoofdstuk: "010_inleiding"
knit: (function(inputFile, encoding) {
        rmarkdown::render(inputFile,
                          encoding=encoding,
                          output_dir = {
                            source("../pad.R");
                            maak_pad(rmarkdown::yaml_front_matter(inputFile)$params$hoofdstuk, "output")
                          }
                          )})
title: "moneos inleiding"
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











# Dankwoord/Voorwoord {-}  

Het INBO monitoringsprogramma wordt uitgevoerd met de financiële steun van Waterwegen en Zeekanaal (W&Z) afdeling Zeeschelde, afdeling Maritime Toegang (aMT) en van het Agentschap voor Natuur en Bos (ANB).
De monitoring zou niet mogelijk geweest zijn zonder de bemanning van de schepen SCALDIS I, Scheldewacht II, Veremans en de Parel. Waarvoor dank.

De zoogdierengegevens werden met toestemming ontleend uit de databank van Waarnemingen.be (Natuurpunt VZW).

De superdeluxe dataverzameling en laboratoriumwerk wat betreft watervogels, hyperbenthos en benthos werden uitgevoerd door Olja Bezdenjesnji, Dimitri Buerms, Joram De Beukelaer, Nico De Regge, Kenny Hessel, Charles Lefranc, Jan Soors, Thomas Terrie en Frederic Van Lierop.

Ankerkuilvisserij is een zeer technische visserij.
Er dient met vele factoren rekening gehouden worden zoals stroomsnelheid, wind, bootverkeer enz… Dankzij de professionele vaardigheid van Job en Sjaak Bout zijn de campagnes in 2017 zonder problemen verlopen.
Jullie hebben dat goed gedaan: dank u wel.

Het visbestand in de Zeeschelde bemonsteren met schietfuiken is zwaar en intensief werk. De stroming is sterk en verraderlijk en telkens moet er geploeterd worden in het slib om fuiknetten te plaatsen en op te halen.
Maar dat weerhield onze enthousiaste arbeiders en technici niet om de campagnes met succes uit te voeren.
Dank je wel Danny Bombaerts, Adinda De Bruyn, Jean-Pierre Croonen, Franky Dens, Marc Dewit, Marlies Froidmont, Linde Galle, Isabel Lambeens, Yves Maes, Jan Van Den Houtem en Joris Vernaillen.

De zeer gedreven vrijwilligers zijn we opnieuw zeer erkentelijk voor het aanleveren van extra informatie over het visbestand in de Zeeschelde en Rupel.
De vrijwilligers in 2017 waren (in stroomopwaartse richting): Gie De Beuckelaer, Ludo Declerck, Myriam De Proost, Georges Hofer, Walter Van Ginhoven, Hugo Van Beek, Hubert Dewilde, Mark Staut, Anna Schneider, Marc Deckers, Swa Branders, Marc Van den Neucker, Tom Van den Neucker, François Van den Broeck, Bart Bonte, Serge Loverie en Carl Van den Bogaert.


# Samenvatting {-}  

In 2017 werden verscheidene nieuwe estuariene gebieden gerealiseerd in het kader van het geacutaliseerde SIGMAplan.
Het gecontroleerd gereduceerd getijdengebied (GGG) van Kruibeke, de aantakking van de Kruibeekse kreek en de ontpoldering van de Fasseitpolder waren een feit.
In de benedenloop van de Getijdendijle, nabij de Zennemonding werd het GGG Zennegat gerealiseerd.
Deze realisaties dragen in belangrijke mate bij tot een gunstige habitat oppervlaktebalans in het Schelde-estuarium.

In de Beneden-Zeeschelde nam het zachte laag slik sinds 2012 sterk af.
Tot 2014 sedimenteerde een deel op naar middelhoog slik maar sinds 2014 gaat het vooral verloren aan het ondiep water.
Het areaal zacht middelhoog slik neemt sinds 2014 af.
Dit wijst op een uitruiming van de vaargeul met steiler wordende oevers als gevolg.

Ook in de Boven-zeeschelde zien we gelijkaardige morfologische processen.
Een opvallende toename van diep subtidaal areaal ten koste van het matig diep subtidaal ecotoop vooral in de zone tussen Temse en de Durmemonding.
De laatste 3 jaar blijft deze omzetting doorgaan maar in mindere mate.
Dit wijst op een uitruiming van de vaargeul met steiler wordende oevers als gevolg.
Er is een verlies van middelhoog en hoog slikareaal zichtbaar in de Boven-Zeeschelde dat in de totale oppervlakte balans gecompenseerd worden door de nieuwe ontpolderingen en GGG’s.
Het laag slik met zacht substraat nam toe, vooral in de laatste 3 jaar.
Dit enerzijds door erosie van het middelhoog slik en een beperkte laterale uitbreiding in sommige binnenbochtlocaties doordat zandwinning hier is weggevallen.

De ecotopen van de getij-aantakking van de Ringvaart en tijarm Zwijnaarde worden in deze rapportage voor het eerst gerapporteerd.
De definitieve vegetatiekaart van de Boven-Zeeschelde, Rupel en Durme is gevalideerd en opgeleverd.

Op basis van de eerste dataverkenning toont de sedimentdata verzamelt bij de 283 benthosstalen in 2016 een patroon dat afwijkt van de voorgaande jaartendenzen: het slibrijker worden van de intertidale gebieden in de Boven-Zeeschelde lijkt zich niet door te zetten, ook het slibrijker worden van de zijrivieren zet zich niet door in 2016.
In 2016 werden geen opvallende sedimenttendenzen waargenomen.

In 2016 overschrijdt de intertidale systeembiomassa de 30 ton.
Het herstel van de biomassa van de Durme alsook toenemende waarden in Zeeschelde IV zijn hiervoor verantwoordelijk.
In het subtidaal werd door een toevalstreffer ook de hardsubstraatsoort driehoeksmossel (Dreissena polymorpha) bemonsterd wat resulteerde in een grote biomassa outlier in Zeeschelde I.
De Durme kent opnieuw de hoogste densiteiten aan bodemdieren intertidaal, terwijl subtidaal de grootste biomassa te vinden is in de Nete.
De soortenrijkdom in Zeeschelde IV bleef onveranderd laag.

In 2017 waren de garnalen (Decapoda) over het algemeen iets talrijker als in de voorgaande jaren.
Eenzelfde patroon geldt enigszins voor vis.
Grijze garnalen Crangon crangon werden gevangen op alle meso- en oligohaliene locaties.
Opmerkelijk zijn de hoge aantallen in de Rupel.
Ook werden de grootste aantallen Neomysis integer (eerder een brakwatersoort) totnogtoe waargenomen in de zoete stations.
Deze waarnemingen wijzen op een verdere zoutindringing in het estuarium in 2017.

De vismonitoring met de ankerkuil toonde een vergelijkbare diversiteit aan in de Zeeschelde tegenover de voorgaande jaren (45 vissoorten).
In alle campagnes wordt het hoogste aantal soorten gevangen in de mesohaliene zone.
Op alle locaties stelden we rekrutering vast.
In totaal vingen we met de ankerkuil in de periode 2012-2017 zeven niet-inheemse vissoorten: blauwbandgrondel, regenboogforel, giebel, snoekbaars, zonnebaars, zwartbekgrondel en de reuzenkapiteinvis.
Het relatief aantal exoten vertoont een stijgende trend.

Spiering blijft ook in 2017 de meest abundante soort in de Zeeschelde maar het aandeel van spiering in de totaalvangsten op de verschillende locaties is wel het laagst sinds het begin van de ankerkuilcampagnes.

In 2017 vingen we opnieuw adulte finten.
Ook vingen we in de zomer en het najaar juveniele finten wat erop wijst dat er rekrutering heeft plaatsgevonden.

Op basis van de reguliere fuikvangsten kan de Ecologische KwaliteitsRatio berekend worden.
In 2017 scoort in de zoetwaterzone hoger dan in 2016. De oligohaliene zone blijft ‘ontoereikend’ en de zoetwaterzone en de mesohaliene zone scoren opnieuw ‘matig’.

In 2017 werd er op 10 locaties gevist door vrijwilligers. In 2017 vingen de vrijwilligers in de Zeeschelde 46 soorten en 14 in de Rupel.

Niettegenstaande de gunstige ontwikkeling van het bodemleven, de garnalen en het visbestand vertonen de vogelaantallen op de Zeeschelde een doorgaande dalende trend.

Naarmate meer Sigmagebieden ingericht worden neemt hun belang toe voor broedvogels.
Voor de meeste onderzochte soorten is er dan ook een gunstige evolutie zichtbaar en leveren de gebieden een aanzienlijke bijdrage tot het realiseren van de instandhoudingsdoelstelling van het gehele Schelde-estuarium.
De trends voor bruine kiekendief en tureluur zijn echter doorgaand dalend.
Ook de grote karekiet heeft nog geen vaste voet in de Sigmagebieden.

De detail hoogtemetingen op raaien langsheen de Zeeschelde illustreren en onderbouwen de waargenomen ontwikkelingen in de ecotopenkaarten. 
De algemene erosie van het laag slik in Beneden-Zeeschelde, de opbolling van het middelhoog slik en recent de erosie op verscheidende locaties (uitruiming geul).
De hoogteprofielen tonen op verscheidene locaties de morfologische respons op b.v. baggerwerken in de Durme, Bergenmeersen, traject ringvaart – Heusdenbrug. Op deze locaties vindt doorgaans eerst een erosie van de schorrand plaats gevolgd door versnelde sedimentatie van het slik. 
De eerste opmetingen van de Wijmeers ontpolderingen worden gepresenteerd.


# Inleiding 

MONEOS (= MONitoring Effecten OntwikkelingsSchets 2010) [@meireMONEOSGeintegreerdeMonitoring2008] zorgt voor de aanlevering van basisdata voor de evaluatierapporten over de effecten van de verruiming (aMT) en voor de evaluatie van de evolutie van het systeem [@marisEvaluatiemethodiekScheldeestuariumUpdate2014]. De voorliggende datarapportage omvat een toelichting en eerstelijnsanalyse van de onderdelen van de geïntegreerde systeemmonitoring van het Schelde-estuarium, kortweg MONEOS, uitgevoerd door het INBO in 2016 (voor benthos) en/of 2017 afhankelijk van het thema.

Het onderzoeksteam Estuaria van het INBO staat, voor wat de Zeeschelde betreft, reeds geruime tijd in voor de monitoring van diverse onderdelen die vallen onder de hoofdstukken Morfodynamiek, Diversiteit soorten en Diversiteit Habitats. Het onderzoeksteam Monitoring en herstel Aquatische fauna van het INBO staat in voor de vismonitoring.

Het INBO levert data aan voor volgende thema’s en indicatoren:

Thema Leefomgeving

-	Overzicht Estuariene Natuurontwikkelingsprojecten
-	Sedimentkenmerken
-	Geomorfologie, Fysiotopen, Ecotopen
-	Vegetatiekartering
-	Sedimentatie en erosie op punten en raaien

Thema Fauna & Flora en thema Ecologisch Functioneren

-	Hogere planten
-	Macrozoöbenthos
-	Hyperbenthos
-	Vissen
-	Watervogels
-	Broedvogels
-	Zoogdieren


De aangeleverde data omvatten enkel gegevens van de Zeeschelde en getijgebonden zijrivieren. Tenzij anders vermeld kunnen ze gebruikt worden tot op niveau 3 van de Evaluatiemethodiek wat overeenkomt met de saliniteitszones aangevuld met de getijdenzijrivieren (Durme, Netes, Dijle en Zenne (Tabel \@ref(tab:010-tabel-indeling-schelde-estuarium)[^footnote-010-1]). Deze indeling valt samen met de indeling in waterlichamen van de Kaderrichtlijn Water (KRW) (Figuur \@ref(fig:010-figuur-waterlichamen)).  

[^footnote-010-1]: Het deel van de Zeeschelde niet beschouwd in de Evaluatiemethodiek zou onderdeel kunnen worden van Z7. Ook wordt het traject Melle-Zwijnaarde (getijde Zeeschelde) niet gerekend tot Zeeschelde I in de KRW indeling. Dit zou beter wel deel worden van deze zone.

Bij elk hoofdstuk is er een verwijzing naar de datafiches waarin de metadata beschreven zijn. Zie hiervoor op http://www.scheldemonitor.be/nl.  

Deze INBO MONEOS data is ook de basis voor de ecologische toestandsbepaling van de Zeeschelde in het kader van de Kaderrichtlijn Water ((KRW) hydromorfology, macrobenthos, vis en macrofyten) en voor de vaststelling van staat van Instandhouding en de evaluatie van de Instandhoudingsdoelstellingen van de relevante Natura 2000 gebieden. 



\begin{table}

\caption{(\#tab:010-tabel-indeling-schelde-estuarium)Ruimtelijke indeling van het Schelde-estuarium volgens de Evaluatie methodiek (EM), KRW en saliniteitszones.}
\centering
\resizebox{\linewidth}{!}{
\fontsize{15}{17}\selectfont
\begin{threeparttable}
\begin{tabular}[t]{>{\raggedright\arraybackslash}p{1in}>{\raggedright\arraybackslash}p{1in}>{\raggedright\arraybackslash}p{1in}llll}
\toprule{}
Niveau 2 & Niveau 3 & Niveau 4 & KRW waterlichaam & Saliniteitszone EM & Saliniteitszone Belgische Ecotopen & Model-eenheid\\
\midrule{}
 &  & \textcolor{black}{comp 7b} &  &  &  & \\
\cmidrule{3-3}
 &  & \textcolor{black}{comp 9} &  &  & \multirow{-2}{*}{\raggedright\arraybackslash \textcolor{black}{Mesohalien}} & \\
\cmidrule{3-3}
\cmidrule{6-6}
 &  & \textcolor{black}{comp 10} &  &  &  & \\
\cmidrule{3-3}
 &  & \textcolor{black}{comp 11} &  &  &  & \\
\cmidrule{3-3}
 & \multirow{-5}{1in}{\raggedright\arraybackslash \textcolor{black}{Z4}} & \textcolor{black}{comp 12} & \multirow{-5}{*}{\raggedright\arraybackslash \textcolor{black}{Zeeschelde IV}} & \multirow{-5}{*}{\raggedright\arraybackslash \textcolor{black}{sterke saliniteitsgradiënt}} & \multirow{-3}{*}{\raggedright\arraybackslash \textcolor{black}{sterke saliniteitsgradiënt}} & \\
\cmidrule{2-6}
 &  & \textcolor{black}{comp 13} &  &  &  & \multirow{-6}{*}{\raggedright\arraybackslash \textcolor{black}{Beneden-Zeeschelde}}\\
\cmidrule{3-3}
\cmidrule{7-7}
 & \multirow{-2}{1in}{\raggedright\arraybackslash \textcolor{black}{Z5}} & \textcolor{black}{comp 14} & \multirow{-2}{*}{\raggedright\arraybackslash \textcolor{black}{Zeeschelde III + Rupel}} & \multirow{-2}{*}{\raggedright\arraybackslash \textcolor{black}{Oligohalien}} & \multirow{-2}{*}{\raggedright\arraybackslash \textcolor{black}{Oligohalien}} & \\
\cmidrule{2-6}
 &  & \textcolor{black}{comp 15} &  &  &  & \\
\cmidrule{3-3}
 & \multirow{-2}{1in}{\raggedright\arraybackslash \textcolor{black}{Z6}} & \textcolor{black}{comp 16} & \multirow{-2}{*}{\raggedright\arraybackslash \textcolor{black}{Zeeschelde II}} & \multirow{-2}{*}{\raggedright\arraybackslash \textcolor{black}{Zoet lange verblijftijd}} & \multirow{-2}{*}{\raggedright\arraybackslash \textcolor{black}{Zoet lange verblijftijd}} & \\
\cmidrule{2-6}
 &  & \textcolor{black}{comp 17} &  &  &  & \\
\cmidrule{3-3}
 &  & \textcolor{black}{comp 18} &  &  &  & \\
\cmidrule{3-3}
 &  & \textcolor{black}{comp 19} &  &  &  & \\
\cmidrule{3-3}
\multirow{-13}{1in}{\raggedright\arraybackslash \textcolor{black}{Zeeschelde}} & \multirow{-4}{1in}{\raggedright\arraybackslash \textcolor{black}{Z7}} & \textcolor{black}{comp 19 trGM} & \multirow{-4}{*}{\raggedright\arraybackslash \textcolor{black}{Zeeschelde I}} & \multirow{-4}{*}{\raggedright\arraybackslash \textcolor{black}{Zoet korte verblijftijd}} & \multirow{-4}{*}{\raggedright\arraybackslash \textcolor{black}{Zoet korte verblijftijd}} & \multirow{-7}{*}{\raggedright\arraybackslash \textcolor{black}{Boven-Zeeschelde}}\\
\cmidrule{1-7}
 &  & \textcolor{black}{Rupel} & \textcolor{black}{Zeeschelde III + Rupel} & \textcolor{black}{Oligohalien} & \textcolor{black}{Oligohalien} & \textcolor{black}{Rupel}\\
\cmidrule{3-7}
 &  & \textcolor{black}{Dijle} &  &  &  & \\
\cmidrule{3-3}
 &  & \textcolor{black}{Zenne} & \multirow{-2}{*}{\raggedright\arraybackslash \textcolor{black}{GetijdeDijle + GetijdeZenne}} &  &  & \\
\cmidrule{3-4}
 & \multirow{-4}{1in}{\raggedright\arraybackslash \textcolor{black}{Z8}} & \textcolor{black}{Getijdenetes} & \textcolor{black}{Getijdenetes} & \multirow{-3}{*}{\raggedright\arraybackslash \textcolor{black}{Zoet zijrivier}} & \multirow{-3}{*}{\raggedright\arraybackslash \textcolor{black}{Zoet zijrivier}} & \multirow{-3}{*}{\raggedright\arraybackslash \textcolor{black}{Tijgebonden zijrivieren}}\\
\cmidrule{2-7}
\multirow{-5}{1in}{\raggedright\arraybackslash \textcolor{black}{Zijrivieren}} & \textcolor{black}{Z9} & \textcolor{black}{Durme} & \textcolor{black}{Durme} & \textcolor{black}{Zoet lange verblijftijd} & \textcolor{black}{Zoet lange verblijftijd} & \textcolor{black}{Durme}\\
\cmidrule{1-7}
 &  & \textcolor{black}{Ringvaart} & \textcolor{black}{Zeeschelde I} &  &  & \\
\cmidrule{3-4}
\multirow{-2}{1in}{\raggedright\arraybackslash \textcolor{black}{n.v.t.}\textsuperscript{*}} & \multirow{-2}{1in}{\raggedright\arraybackslash \textcolor{black}{n.v.t.}\textsuperscript{*}} & \textcolor{black}{trMZ} & \textcolor{black}{n.v.t.}\textsuperscript{*} & \multirow{-2}{*}{\raggedright\arraybackslash \textcolor{black}{n.v.t.}\textsuperscript{*}} & \multirow{-2}{*}{\raggedright\arraybackslash \textcolor{black}{Zoet ringvaart \& tijarm}} & \multirow{-2}{*}{\raggedright\arraybackslash \textcolor{black}{Ringvaart \& tijarm}}\\
\bottomrule{}
\end{tabular}
\begin{tablenotes}
\item[*] textcolor{black}{n.v.t. : Deel van Zeeschelde niet beschouwd in Evaluatiemethodiek. Zou onderdeel kunnen worden van Z7. Ook wordt het traject Melle-Zwijnaarde (getijde Zeeschelde) niet gerekend tot Zeeschelde I in de KRW indeling. Dit zou beter wel deel worden van deze zone.}
\end{tablenotes}
\end{threeparttable}}
\end{table}

<br/>  


\begin{figure}

{\centering \includegraphics[width=3.85in]{G:/Mijn Drive/INBODATA/PROJECTEN/PRJ_SCHELDE/VNSC/Rapportage_INBO/2021/010_inleiding/figuren/010_Kaderrichtlijn_water_waterlichamen} 

}

\caption{Overzicht van de Kaderrichtlijn Water waterlichamen.}(\#fig:010-figuur-waterlichamen)
\end{figure}

<br/>  



