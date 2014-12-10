---
title: Practical Distance Sampling in R
author: David L. Miller
---

This document serves to outline the various chapters of the book *Practical Distance Sampling in R* and structure their content.


# Abstract

**Aim**: the book will explain how to build models of distance sampling data using packages available for the programming language R. It will be assumed that readers have already conducted field work and have data to analyse.

**Audience**: ecology/biology masters and PhD students, field researchers, environmental consultants, wildlife/natural resources scientists.

**Audience background**: "quantitatively minded" but not statisticians by training, (e.g. should be comfortable with fitting and explaining results from a GLM). Assumed that those reading will be familiar with R (know what `data.frame`s are, how to build them, general "data-mudging", though not consider themselves "programmers").

**Format**: the book will be written in `knitr`, so all plots, models and so on will be produced, fitted etc as the book is "built". At least two versions of the book will exist: a website and a PDF. All data sets will be available for readers to investigate.


# 1. Distance sampling

**Overview**: This chapter will introduce the very basics of distance sampling, by no means will it be a full treatment, but does need to present enough information to set terms of reference that'll be used throughout. It will instruct readers how to build detection function models in R, check and discriminate between them. Finally, readers will learn how use these models to estimate abundance/density using Horvitz-Thompson estimators and calculate the uncertainty in those estimates (and see where that uncertainty comes from).


## Outline

  * [*Introduction to distance sampling*](site/distance-intro.html): why do distance sampling? Explanation of survey setup. What do distance sampling data look like?
  * [*Models for detectability*](site/distance-simpledf.html): introduction to the detection function, what makes a good detection function? (Only presenting half-normal and hazard-rate models here.)
  * [*What else affects detectability?*](site/distance-covardf.html): covariate models, selecting covariates, size bias.
  * *Improving the fit of detection functions*: adjustments and mixtures, other key functions. Model selection via AIC.
  * [*Estimating abundance*](site/distance-abundance.html): Horvitz-Thompson estimators, stratification (how and when).
  * *How certain are we in our estimates?*: uncertainty estimation, explanation of variance components (more diagnostics?).


## Code

Examples of using `ds`, `dht` from `Distance`. Additionally diagnostic plotting and goodness-of-fit testing (some of this needs to be written/updated to be user friendly).

Begin by having a vector of distances, make a `data.frame` then add columns as we need to. Not clear if having `flatfile`-style data is better than building separate tables.


## Data sets

Data available (able to be released with the book) which we can do "basic" distance sampling analyses on:

  * already "open" data:
    * ducknests (line transect, binned)
    * amakihi (point transect, exact)
    * pantropical dolphins (line transect, exact)
    * crabeater seals (line transect?, exact) (only if we want to do the MRDS "reveal" at the end, otherwise it's just wrong!)
    * golf tees (line transect, exact) (same problem as crabbies)
  * possibilities (need to check):
    * Rob Williams cetaceans (?)
    * URI seabirds aerial (line transect, binned)
    * URI seabirds boat (line transect, exact)
    * SCANS II ? (line transect, exact)

What would be nice: a data set that fits okay with half-normal/hazard-rate, improves with adjustments/mixtures, has covariates. Need both point and line data.

## Relevant literature

See [distance literature review file](distance/distance-lit.md).



# 2. Spatial models for distance sampling data

**Overview**: Readers will take detection function models and apply them to spatially explicit data. Readers will first learn about requirements that would be useful for a spatial model and what sort of data one might need to collect.


## Outline

  * *Why build spatial models?*: Why use a DSM rather than just Horvitz-Thompson? What are the benefits/costs?
  * *Survey set up*: what does a DSM survey look like? Data setup.
  * *Model formulation*: what do we require from the model, 2-stage modelling, why GAMs? What does the response mean?  _I get lost in the density vs count vs abundance_ nuances.  Encourage simplicity here.
  * *Crash course in GAMs*: What are GAMs? Wigglyness, penalties, "this is just a GLM"
  * *Adding covariates*: static vs. dynamic variables, how does this dichotomy change the response. Term selection, how do we know a term is "useful"? How do we interpret smooth terms? When should we use random effects?
  * *Response distributions*: Relations between distributions, when are particular distributions appropriate? Selecting a distribution, model discrimination.
  * *Estimating and mapping abundance*: Prediction grids: how to build them, what resolutions make sense, extrapolation issues. Making predictions, plotting them.
  * *Uncertainty estimation*: explanation of boostrap and analytical approaches. Uncertainty in point estimates. Uncertainty maps: CV vs. SE vs. confidence intervals. Uncertainty from the detection function.
  * *Advanced DSMs*: autocorrelation, temporal models.

(It seems a little weird to talk about the data setup before the model, but it then allows us to illustrate the models as we explain them mathematically, this seems more appealing than "lots of theory" all at once.)

## Code

Functions from `dsm` and `mgcv` packages, in particular `dsm`, `gam.check`, `rqgam.check`, `dsm.var.*`.

Worth re-visiting the structure of the `dsm` package and making the above as user friendly as possible.

*Note*: it should be possible to use the spatial `data.frame`s created by `sp`/`RGDAL`/etc when importing data from shape files. Perhaps it's good to use this as the simple example since most folks will be importing their data from ArcGIS/QGIS/etc?


## Relevant literature

See [dsm literature review file](dsm/dsm-lit.md).

## Data sets

  * Available:
    * Pantropical spotted dolphins
  * Maybes (check with owners):
    * Minke from Hedley and Buckland? (is this simulated?)  _I believe Japanese hence sensitive_
    * Black bears from AK (Talkeetna/Skwentna)
    * URI seabirds
    * Dubbo weed data used in the `DSPat` paper
    * Abishek Harihar's ungulate data


# 3. Imperfect detection on the line

**Overview**: This chapter introduces the fact that one of the key assumptions of distance sampling -- that all animals on the line/at the point are detected with probability one -- is violated. The main topic will be perception bias, and it's solution via MRDS methods, but will also include information on accounting for availability.

## Subsections

  * *Uncertain detectability on the line/point*: availability versus perception bias; when might you have one, when might you have another.
  * *Addressing perception bias: MRDS*
    * *Two observers are better than one*: correcting estimates via mark-recapture methods (point and full independence with IO mode)
    * *What else affects detectability at zero distance*: including covariates in MRDS models
    * *Estimating abundance and uncertainty*: How do we combine these models with standard DS analyses?
    * *Why do this complicated analysis?*: Re-analyse data without MRDS component, show what goes wrong. Diagnistics and model selection.
    * *Variations on MRDS*: Other observer modes and how to specify them.
  * *Addressing availability bias*
    * *Hide and seek*: how can we account for animals not being available to be observed.
    * *Average behaviour*: using simple multipliers from experimental studies etc.
    * *Additional information collected during the survey*: Hidden Markov models (maybe just an overview? Review other methods?)
  * *Including these incomplete detection at zero distance in other models*: Putting all this into a DSM.


## Code

Need to use whatever comes after `mrds`, perhaps want to develop further diagnostics and diagnostic plots for MRDS analyses? It would be nice to include availability in the model spec (for the simple multiplier).

If HMMs are to be included, this represents a major time investment in coding.

## Relevant literature

See [mrds/availability literature review file](mrds/mrds-lit.md).


## Data sets

  * MRDS
    * Available:
      * stake data from `mrds`
      * Golf tees (NONONO!)
    * Maybe:
      * Black-capped vireo (`lfbcvi` in `mrds`, need to ask or not?) (point transect, binned)
      * Golden-cheeked warbler (`lfgcwa` in `mrds`, need to ask or not?) (point transect, binned)
  * Availability
    * Available:
      * ?
    * Maybe:
      * URI data from Winiarski, Burt etc paper
      * Deb Palka has data on cetaceans with both availability and perception bias data?



# 4. Special cases

**Overview**: What other stuff needs to be included but doesn't easily fit in above and is not essential for most analyses. I don't want to include any of these without an example of an analysis.

## Subsections


  - *Cue counting/indirect sampling*
  - *One-sided transects*
  - *Strip transect and presence/absence models*: aka "salvaging crappy data?"
  - *Combining data from multiple surveys*: specifically "puting many detection functions into one DSM", checks/diagnostics etc.
  * *Other detection functions*: peaks away from zero (gamma/2-part normal detection functions); random effects a la Cornelia?

## Code

Potentially this is fiddly stuff that doesn't fit into the general framework. Probably it's best to show general enough examples of these models so that folks can replicate the analyses for their data.

## Relevant literature

See [special cases literature review file](special/special-lit.md).

## Data sets

  * Maybe:
    * URI data (combination of detection functions, crappy data (some species))
    * Earl's bear data (weird distance data from uphill aerial surveys, one sided transects)


# 5. Appendices

**Overview**: This section collects information somewhat orthogonal to the modelling above, but still necessary for model formulation.

## Subsections

  * *Obtaining, constructing and selecting covariates*: using OBIS, ERDDAP, UK equivalents, ROpenSci data etc.
  * *Getting your data into shape*: this will likely be covered above, but a reference on the `data.frame` specifications for each package (which columns are reserved etc) seems useful.
  * *Projections and other geo-spatial matters*: a brief chat about spatial data, obvious pitfalls, where to seek advice (Roger Bivands book etc)

## Relevant literature

See [appendices literature review file](appendices/appendices-lit.md).

