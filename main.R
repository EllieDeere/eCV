create_pdf_version <- function(input_file = "templates/cv.Rmd") {
  raw_rmd <- readLines(con = input_file)
  pdf_rmd <- gsub('<a href = "/cv.pdf">PDF Version</a>', replacement = '', x = raw_rmd)
  writeLines(text = pdf_rmd, con = "templates/cv_pdf.Rmd")
  closeAllConnections()
}

render_both <- function() {
  rmarkdown::render("templates/cv.Rmd", output_dir = "docs")
  create_pdf_version()
  
  rmarkdown::render("templates/cv_pdf.Rmd")
  pagedown::chrome_print("templates/cv_pdf.html", output = "docs/cv.pdf")
}

render_both()
