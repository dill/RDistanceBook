HTML_FILES := $(patsubst %.Rmd, %.html ,$(wildcard *.Rmd)) \
							$(patsubst %.md, %.html ,$(wildcard *.md))   \
							$(patsubst %.Rmd, %.html ,$(wildcard distance/*.Rmd)) \
							$(patsubst %.md, %.html ,$(wildcard distance/*.md))

all: clean html

html: $(HTML_FILES)

%.html: %.Rmd
				R --vanilla --slave -e "rmarkdown::render('$<')"
				mv $@ site/

%.html: %.md
				R --vanilla --slave -e "rmarkdown::render('$<')"
				mv $@ site/

.PHONY: clean
clean:
				$(RM) $(HTML_FILES)

