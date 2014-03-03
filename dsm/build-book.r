# borrowed from Hadley Wickham's adv-r book
# github.com/hadley/adv-r

library(devtools)
source("rmd2html.r")

chapters <- dir(".", pattern = "\\.Rmd$")

for (chapter in chapters) {
  out <- cache_file(chapter, rmd2md, ".md")
  file.copy(out, paste0("markeddown/", gsub(".Rmd", ".md", chapter)))
}

system("sh build.sh")
