## this code makes figure captions work in HTML output

# adapted from http://gforge.se/2014/01/fast-track-publishing-using-knitr-part-iii/
library(knitr)
options(figure_counter = TRUE)

# Evaluate the figure caption after the chunk,
# sometimes you want to calculate stuff inside the
# chunk that you want to include in the caption and
# it is therefore useful to evaluate it afterwards.
opts_knit$set(eval.after='fig.cap')

# hack default
knit_hooks$set(plot = function(x, options) {

  fig.cap <- knitr:::.img.cap(options)
  "%n%" <- knitr:::"%n%"
  # pull out all the relevant plot options
  fig.num = options$fig.num = options$fig.num %n% 1L
  fig.cur = options$fig.cur %n% 1L

  if (options$fig.show == 'animate') {
    # Don't print out intermediate plots if we're animating
    return(if (fig.cur < fig.num) '' else opts_knit$get('animation.fun')(x, options))
  }
  ai = options$fig.show == 'asis'
  plot1 = ai || fig.cur <= 1L; plot2 = ai || fig.cur == fig.num
  d1 = if (plot1) paste0(if (knitr:::out_format('html')) '</div>',
                        sprintf('<div class="rimage %s">', options$fig.align))
  d2 = if (plot2) paste0('</div>', if (knitr:::out_format('html')) '<div class="rcode">')

  # Add counter if wanted
  fig_number_txt <- ""
  cntr <- getOption("figure_counter", FALSE)
  if (cntr != FALSE){
    if (is.logical(cntr))
      cntr <- 1
    # The figure_counter_str allows for custom
    # figure text, you may for instance want it in
    # bold: <b>Figure %s:</b>
    # The %s is so that you have the option of setting the
    # counter manually to 1a, 1b, etc if needed
    fig_number_txt <-
      sprintf(getOption("figure_counter_str", "Figure %s: "),
              ifelse(getOption("figure_counter_roman", FALSE),
                     as.character(as.roman(cntr)), as.character(cntr)))

    if (is.numeric(cntr))
      options(figure_counter = cntr + 1)
  }

  paste0(
    d1, knitr:::.img.tag(
      knitr:::.upload.url(x), options$out.width, options$out.height, knitr:::.img.cap(options),
      paste(c(options$out.extra, 'class="plot"'), collapse = ' ')
    ), d2, '\n',
    '<figcaption>', fig_number_txt, fig.cap, '</figcaption><br/>')
})

