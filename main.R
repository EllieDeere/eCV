create_pdf_version <- function(input_file = "docs/cv.Rmd") {
  raw_rmd <- readLines(con = "docs/cv.Rmd")
  pdf_rmd <- gsub('<a href = "/cv.pdf">PDF Version</a>', replacement = '', x = raw_rmd)
  writeLines(text = pdf_rmd, con = "docs/cv_pdf.Rmd")
  closeAllConnections()
}

render_both <- function() {
  rmarkdown::render("docs/cv.Rmd")
  create_pdf_version()
  
  rmarkdown::render("docs/cv_pdf.Rmd")
  pagedown::chrome_print("docs/cv_pdf.html", output = "docs/cv.pdf")
}

render_both()