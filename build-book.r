# borrowed from Hadley Wickham's adv-r book
# github.com/hadley/adv-r

library(devtools)
source("rmd2html.r")

# what Hadley calls "chapters" we might call "sections"...
#chapters <- dir(".", pattern = "\\.Rmd$")

# full names of chapters
chapters.f <- c(dir(c("dsm","distance"), pattern = "\\.Rmd$",full.names=TRUE),
                "rversions.Rmd")
chapters <- c(dir(c("dsm","distance"), pattern = "\\.Rmd$"),
              "rversions.Rmd")

# remove the old markdown files
system("rm markeddown/rversions.md")
system("rm markeddown/dsm-*")
system("rm markeddown/distance-*")

# Rmd -> md with custom knitr
for(i in seq_along(chapters)){
  out <- cache_file(chapters.f[i], rmd2md, ".md")
  file.copy(out, paste0("markeddown/", gsub(".Rmd", ".md", chapters[i])))
}

# actually call pandoc
system("sh build.sh")
