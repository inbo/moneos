
chapters <- list.files(path = "150_geintegreerd_rapport/", pattern = "^[0-9].*\\.Rmd$", full.names = TRUE) # Matches 01-intro.Rmd, etc.

for (chap in chapters[c(4)]) {
  rmarkdown::render(
    input = chap,
    output_format = "INBOmd::pdf_report"
    # , # Or your preferred blog format
    # output_dir = "output/"
  )
}
