---
title: Practical Distance Sampling in R
author: David L. Miller
bibliography: full.bib
---

# Abstract

This document serves to outline the various chapters of the book *Practical Distance Sampling in R* and structure their content.

The book will be written in `knitr`, so all plots, models and so on will be produced, fitted etc as the book is "built".


# 1. Distance sampling (Distance)

**Overview**: This chapter introduces the very basics of distance sampling, by no means is it a full treatment as in Buckland et al (2001, 2004), but does need to present enough information to set terms of reference that'll be used throughout.



## Subsections

  * *Sampling biological populations*: why are we doing this? What can we hope to know?
  * *Strip transects to line transects*: why is distance sampling a good idea?
  * *Models for detectability*: introduction to the detection function, what makes a good detection function? (Only presenting half-normal and hazard rate models here.)
  * *What else affects detectability?*: covariate models.
  * *Improving the fit of detection functions*: adjustments and mixtures, other key functions etc.
  * *Estimating abundance*: Horvitz-Thompson estimators, stratification.
  * *How certain are we in our estimates?*: More diagnostics, uncertainty estimation.

## Code

Examples of using `ds`, `dht` from `Distance`.

Additionally diagnostic plotting and goodness-of-fit testing.

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


## Relevant literature

  * Buckland, ST, DR Anderson, KP Burnham, JL Laake, DL Borchers, and L Thomas. Introduction to Distance Sampling, Oxford University Press, 2001.
  * Buckland, ST, DR Anderson, KP Burnham, JL Laake, DL Borchers, and L Thomas. Advanced Distance Sampling, Oxford University Press, 2004.
  * Marques, TA, L Thomas, SG Fancy, and ST Buckland. “Improving Estimates of Bird Density Using Multiple-Covariate Distance Sampling.” The Auk 124, no. 4 (2007): 1229–43.



# 2. Spatial models for distance sampling data

## Subsections

- Accounting for detectability in spatial models
- A crash course in GAM(M)s
- GAM model selection, diagnostics and checking
- Prediction
- Uncertainty estimation
- Spatio-temporal models
- Random effects


## Code


## References

## Data sets



# 3. Double observer detection function models (mrds)

## Subsections

- Uncertain detectability on the line
- Observer modes
- Fitting double observer models (ddf)
- Diagnostics
- Estimating abundance and uncertainty

## Code


## References

## Data sets


# 4. Special cases

## Subsections

- Availability (multipliers/HMM)
- Cue counting/indirect sampling
- One-sided transects
- Strip transect and presence/absence models (salvaging data)

## Code


## References

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



