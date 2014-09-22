---
title: Practical Distance Sampling in R
author: David L. Miller
bibliography: full.bib
---

This document serves to outline the various chapters of the book *Practical Distance Sampling in R* and structure their content.


# Abstract

**Aim**: the book will explain how to build models for distance sampling data using packages available for the programming language R. It will be assumed that readers have already conducted field work and have data to analyse.

**Audience**: ecology/biology masters and PhD students, field researchers, environmental consultants, wildlife/natural resources scientists.

**Audience background**: "quantitatively minded" but not statisticians by training, should be comfortable with explaining a fitted GLM. Assumed that those reading will be familiar with R, though not consider themselves "programmers".

**Format**: the book will be written in `knitr`, so all plots, models and so on will be produced, fitted etc as the book is "built". At least two versions of the book will exist: a website and a PDF.


# 1. Distance sampling

**Overview**: This chapter introduces the very basics of distance sampling, by no means is it a full treatment as in Buckland et al (2001, 2004), but does need to present enough information to set terms of reference that'll be used throughout.



## Subsections

  * *Sampling biological populations*: why are we doing this? What can we hope to know?
  * *Strip transects to line transects*: why is distance sampling a good idea?
  * *Models for detectability*: introduction to the detection function, what makes a good detection function? (Only presenting half-normal and hazard-rate models here.)
  * *What else affects detectability?*: covariate models.
  * *Improving the fit of detection functions*: adjustments and mixtures, other key functions etc.
  * *Estimating abundance*: Horvitz-Thompson estimators, stratification.
  * *How certain are we in our estimates?*: uncertainty estimation (more diagnostics?).

## Code

Examples of using `ds`, `dht` from `Distance`. Additionally diagnostic plotting and goodness-of-fit testing.

Begin by having a vector of distances, make a `data.frame` then add columns as we need to. Not clear if having `flatfile`-style data is better than building tables.


## Data sets

Data available (able to be released with the book) which we can do "basic" distance sampling analyses on:

  * already "open" data:
     * ducknests (line transect, binned)
     * amakihi (point transect, exact)
     * crabeater seals (line transect?, exact)
     * pantropical dolphins (line transect, exact)
  * possibilities (need to check):
     * Rob Williams cetaceans (?)
     * URI seabirds aerial (line transect, binned)
     * URI seabirds boat (line transect, exact)
     * SCANS II ? (line transect, exact)

What would be nice: a data set that fits okay with half-normal/hazard-rate, improves with adjustments/mixtures, has covariates.

## Relevant literature

See [distance literature review file](distance/distance-lit.md).

# 2. Spatial models for distance sampling data

## Subsections

  * *Why build spatial models?*: What do we get on top of using Horvitz-Thompson? What are the benefits/costs?
  * *Survey set up*: what does a DSM survey look like? Data setup.
  * *Model formulation*: what do we require from the model, 2-stage models, why GAMs?
  * *Crash course in GAMs*: What are GAMs? Wigglyness, penalties, "this is just a GLM"
  * *Adding covariates*: term selection, how do we know a term is "useful"? How do we interpret smooth terms? Random effects?
  * *Response distributions*: Relations between distributions, when are particular distributions appropriate? Selecting a distribution.



- Prediction
- Uncertainty estimation
- Spatio-temporal models
- Random effects


## Code

Functions from `dsm` and `mgcv` packages, in particular `dsm`, `gam.check`, `rqgam.check`

*Note*: it should be possible to use the spatial `data.frame`s created by `sp`/`RGDAL`/etc when importing data from shape files. Perhaps it's good to use this as the simple example since most folks will be importing their data from ArcGIS/QGIS/etc?


## Relevant literature

See [distance literature review file](distance/distance-lit.md).

## Data sets

  * Available:
    * Pantropical spotted dolphins
    * Minke (though this is simulated)
  * Maybes (need to check with owners):
    * Black bears from Talkeetna/Skewntna
    * URI seabirds
    * Dubbo weed data used in the `DSPat` paper





# 3. Imperfect detection on the line

## Subsections

- Uncertain detectability on the line
- Observer modes
- Fitting double observer models (ddf)
- Diagnostics
- Estimating abundance and uncertainty
- Availability (multipliers/HMM)

## Code


## Relevant literature

## Data sets


# 4. Special cases

## Subsections

- Cue counting/indirect sampling
- One-sided transects
- Strip transect and presence/absence models (salvaging data)
- Combining data from multiple surveys



## Code


## Relevant literature

  * Winiarski, Kristopher J, M Louise Burt, Eric Rexstad, David Lawrence Miller, Carol L Trocki, Peter W C Paton, and Scott R McWilliams. “Integrating Aerial and Ship Surveys of Marine Birds Into a Combined Density Surface Model: a Case Study of Wintering Common Loons.” The Condor 116, no. 2 (February 5, 2014): 149–61. doi:10.1650/CONDOR-13-085.1.s1.
  * Fletcher, David, and Philip M Dixon. “Modelling Data From Different Sites, Times or Studies: Weighted vs. Unweighted Regression.” Methods in Ecology and Evolution 3, no. 1 (July 29, 2011): 168–76. doi:10.1111/j.2041-210X.2011.00140.x.
  * Bishop, Tom R, Marc S Botham, Richard Fox, Simon R Leather, Daniel S Chapman, and Tom H Oliver. “The Utility of Distribution Data in Predicting Phenology.” Edited by Robert Freckleton. Methods in Ecology and Evolution 4, no. 11 (October 16, 2013): 1024–32. doi:10.1111/2041-210X.12112.
  * Sólymos, Péter, Steven M Matsuoka, Erin M Bayne, Subhash R Lele, Patricia Fontaine, Steve G Cumming, Diana Stralberg, Fiona K A Schmiegelow, and Samantha J Song. “Calibrating Indices of Avian Density From Non-Standardized Survey Data: Making the Most of a Messy Situation.” Edited by Robert B O'Hara. Methods in Ecology and Evolution 4, no. 11 (September 4, 2013): 1047–58. doi:10.1111/2041-210X.12106.

## Data sets


# 5. Appendices

## Subsections

  * Obtaining, constructing and selecting covariates
  * Getting your data into shape (for Distance/mrds/dsm)
  * Projections and other geo-spatial matters
  * Simulating distance sampling data


## Code


## References

## Data sets



