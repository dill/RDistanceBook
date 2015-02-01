---
title: Practical distance sampling in R
---

Welcome to the *Practical distance sampling in R* "book" webpage. You can use the drop-down menus above to read the book, if you don't know what that might entail, read on...

## A book about distance sampling...

During 2014-2015, I ([Dave Miller](http://converged.yt)) am writing a book about how to use R to estimate animal abundance, in particular using distance sampling methods. An outline...

**Aim**: the book will explain how to build models of distance sampling data using packages available for the programming language R. It will be assumed that readers have already conducted field work and have data to analyse.

**Audience**: ecology/biology masters and PhD students, field researchers, environmental consultants, wildlife/natural resources scientists.

**Audience background**: "quantitatively minded" but not statisticians by training, (e.g. you should be comfortable with fitting and explaining results of a GLM in R). It'll be assumed that those reading will be familiar with R (i.e. know what `data.frame`s are, how to build them, general "data-mudging", though not consider themselves "programmers").

Initially the book will consist of two parts, though this may well get expanded to further parts:

  1. Distance sampling
    * *Introduction to distance sampling*: why do distance sampling? Explanation of survey setup. What does distance sampling data look like?
    * *Models for detectability*: introduction to the detection function, what makes a good detection function?
    * *What else affects detectability?*: covariate models, selecting covariates, size bias.
    * *Improving the fit of detection functions*: adjustments and mixtures, other key functions. Model selection via AIC.
    * *Estimating abundance*: Horvitz-Thompson estimators, stratification (how and when).
    * *How certain are we in our estimates?*: uncertainty estimation, explanation of variance components.
  2. Spatial models for distance sampling data
    * *Why build spatial models?*: Why use a DSM rather than just Horvitz-Thompson? What are the benefits/costs?
    * *Survey set up*: what does a DSM survey look like? Data setup.
    * *Model formulation*: what do we require from the model, 2-stage modelling, why GAMs? What does the response mean?
    * *Crash course in GAMs*: What are GAMs? Wigglyness, penalties, "this is just a GLM"
    * *Adding covariates*: static vs. dynamic variables, how does this dichotomy change the response. Term selection, how do we know a term is "useful"? How do we interpret smooth terms? When should we use random effects?
    * *Response distributions*: Relations between distributions, when are particular distributions appropriate? Selecting a distribution, model discrimination.
    * *Estimating and mapping abundance*: Prediction grids: how to build them, what resolutions make sense, extrapolation issues. Making predictions, plotting them.
    * *Uncertainty estimation*: explanation of bootstrap and analytical approaches. Uncertainty in point estimates. Uncertainty maps: CV vs. SE vs. confidence intervals. Uncertainty from the detection function.
    * *Advanced DSMs*: autocorrelation, temporal models.
  3. Appendices
    * *Data format*: A guide to getting your data into the right format for distance sampling analyses.


## A book using R...

The aim of the book is to introduce researchers to performing analyses of distance sampling data in R. Though there will be some coverage of more conceptual and field methods, the focus will be analysis in R. Therefore, it's recommended that readers are already fairly familiar with R.

The book is written in `knitr`, so all plots, models and so on will be produced, fitted etc as the book is "built". All data sets will be available for readers to investigate independently.

Most quantities that appear in the book are computed during book "compilation", so if you're unsure where a number (or figure) came from, you can look [at the source of the chapter and see what code generated that result](http://github.com/dill/RDistanceBook).

## A book written in the open...

I'm writing the book "in the open" in the hope that those interested will contribute suggestions as I'm going. All content will be available on this website, as well as the files used to generate the figures and models referenced in the book.

A `git` repository containing the text of the book [can be found on github](http://github.com/dill/RDistanceBook). You can use github's [Issues](https://github.com/dill/RDistanceBook/issues) to submit suggestions, or (if you're more `git` savvy) you can [submit pull requests](https://help.github.com/articles/using-pull-requests/) to alter the content.


## A book without a publisher...

If you're a publisher and you'd like to print a dead tree version of these pages, I'd be very interested in talking to you.

If you are interested in obtaining a dead tree copy of these pages, then please let me know by [filling in this Google Form](https://docs.google.com/forms/d/1z5bFFd_GpUXeVzbr5wuwoUKT5wvhNizrGpEOiCZik58/viewform); having evidence of demand will make it more likely that paper copy will exist. If you fill in the form, I'll e-mail you if a paper copy becomes available but won't use your address for any other reason.


