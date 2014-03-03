# borrowed from Hadley Wickham's adv-r book
# github.com/hadley/adv-r

library(devtools)
source("rmd2html.r")

# what Hadley calls "chapters" we might call "sections"...
chapters <- dir(".", pattern = "\\.Rmd$")

# remove the old markdown files
system("rm markeddown/dsm-*")

# Rmd -> md with custom knitr
for (chapter in chapters) {
  out <- cache_file(chapter, rmd2md, ".md")
  file.copy(out, paste0("markeddown/", gsub(".Rmd", ".md", chapter)))
}

# actually call pandoc
system("sh build.sh")
