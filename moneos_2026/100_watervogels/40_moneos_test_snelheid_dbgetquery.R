library(DBI) 
library(bench)

con <- inbodb::connect_inbo_dbase("W0004_00_Waterbirds")


results <- bench::mark(

# Alternative A
time_a <- system.time({
  WV_DB_a <- dbGetQuery(con, "
  SELECT 
    SU.SurveyCode               AS ProjectCode
    , SU.SurveyNaam             AS Project
    , L.RegioWVCode             AS RegioCode
    , L.RegioWVNaam             AS Regio
    , L.LocationWVCode          AS GebiedsCode
    , L.LocationWVNaam          AS Gebied
    , SS.Seasonname             AS Telseizoen
    , E.EventCode               AS TellingCode
    , E.EventLabel              AS Telling
    , E.SortOrder               AS TellingSortOrder
    , S.sampleDate              AS Teldatum
    , S.CoverageCode            AS Telvolledigheid
    , T.TaxonGroupCode
    , T.TaxonGroupDescription
    , T.Commonname              AS NedNaam
    , T.scientificname          AS WetNaam
    , F.Taxoncount              AS Aantal
  FROM FactAnalyseSetOccurrence F
  
  INNER JOIN DimSurvey SU       ON SU.surveykey = F.surveykey
  --INNER JOIN DimLocationWV L    ON L.locationwvkey = F.locationwvkey    /** ... gedeactiveerd ten voordele van ... **/
  INNER JOIN DimSeason SS       ON SS.Seasonkey = F.seasonkey
  INNER JOIN DimEvent E         ON E.eventkey = F.eventkey
  INNER JOIN DimSample S        ON F.samplekey = S.samplekey
  INNER JOIN DimLocationWV L    ON L.locationwvkey = S.locationwvkey      /** ... deze lijn - dit lost de mismatch in nieuwe gebieden op! **/
  INNER JOIN DimTaxonWV T       ON T.taxonwvkey = F.taxonwvkey
  WHERE 1 = 1
    AND S.samplestatus = 'CHECKED'               /**alleen gevalideerde records**/
    /**AND S.samplestatus <> 'REJECTED'**/       /**inclusief data met status 'NEW' (nog niet gevalideerde tellingen)**/
    AND S.coveragecode not in ('-', 'N')         /**niet getelde tellingen zijn irrelevant**/
    AND F.taxoncount > 0
    /**AND F.Analysesetkey in (1)**/ 
")
}),

# Alternative B
time_b <- system.time({
  WV_DB_b <- dbGetQuery(con, "
  SELECT 
    SU.SurveyCode               AS ProjectCode
    , SU.SurveyNaam             AS Project
    , L.RegioWVCode             AS RegioCode
    , L.RegioWVNaam             AS Regio
    , L.LocationWVCode          AS GebiedsCode
    , L.LocationWVNaam          AS Gebied
    , SS.Seasonname             AS Telseizoen
    , E.EventCode               AS TellingCode
    , E.EventLabel              AS Telling
    , E.SortOrder               AS TellingSortOrder
    , S.sampleDate              AS Teldatum
    , S.CoverageCode            AS Telvolledigheid
    , T.TaxonGroupCode
    , T.TaxonGroupDescription
    , T.Commonname              AS NedNaam
    , T.scientificname          AS WetNaam
    , F.Taxoncount              AS Aantal
  FROM FactAnalyseSetOccurrence F
  
  INNER JOIN DimSurvey SU       ON SU.surveykey = F.surveykey
  INNER JOIN DimLocationWV L    ON L.locationwvkey = F.locationwvkey    /** ... gedeactiveerd ten voordele van ... **/
  INNER JOIN DimSeason SS       ON SS.Seasonkey = F.seasonkey
  INNER JOIN DimEvent E         ON E.eventkey = F.eventkey
  INNER JOIN DimSample S        ON F.samplekey = S.samplekey
  --INNER JOIN DimLocationWV L    ON L.locationwvkey = S.locationwvkey      /** ... deze lijn - dit lost de mismatch in nieuwe gebieden op! **/
  INNER JOIN DimTaxonWV T       ON T.taxonwvkey = F.taxonwvkey
  WHERE 1 = 1
    AND S.samplestatus = 'CHECKED'               /**alleen gevalideerde records**/
    /**AND S.samplestatus <> 'REJECTED'**/       /**inclusief data met status 'NEW' (nog niet gevalideerde tellingen)**/
    AND S.coveragecode not in ('-', 'N')         /**niet getelde tellingen zijn irrelevant**/
    AND F.taxoncount > 0
    /**AND F.Analysesetkey in (1)**/
")
}),
iterations = 5,
check = FALSE)

print(results[, c("expression", "min", "median", "itr/sec", "mem_alloc")])

# A tibble: 2 × 5
# expression                                                                        min median `itr/sec` mem_alloc
# <bch:expr>                                                                      <bch> <bch:>     <dbl> <bch:byt>
# 1 "time_a <- system.time({ WV_DB_a <- dbGetQuery(con, \"\\n  SELECT \\n    SU.Su… 20.3s  21.3s    0.0453     545MB
# 2 "time_b <- system.time({ WV_DB_b <- dbGetQuery(con, \"\\n  SELECT \\n    SU.Su…   23s  23.9s    0.0418     545MB