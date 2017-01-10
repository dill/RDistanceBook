# Contents for a Distance Sampling in R book


  1. Distance sampling
    * *Introduction to distance sampling*: Why do distance sampling? Explanation of survey setup. What does distance sampling data look like?
    * *Models for detectability*: Introduction to the detection function, what makes a good detection function?
    * *What else affects detectability?*: Covariate models, selecting covariates, size bias.
    * *Improving the fit of detection functions*: Adjustments and mixtures, other key functions. Model selection via AIC.
    * *Estimating abundance*: Horvitz-Thompson estimators, stratification (how and when).
    * *How certain are we in our estimates?*: Uncertainty estimation, explanation of variance components.
  2. Spatial models for distance sampling data
    * *Why build spatial models?*: Why use a DSM rather than just Horvitz-Thompson? What are the benefits/costs?
    * *Overiew of density surface models*: What do we require from the model, 2-stage modelling, why GAMs? What does the response mean?
    * *Survey data setup*: What does a DSM survey look like? Data setup.
    * *Crash course in GAMs*: What are GAMs? Wigglyness, penalties, "this is just a GLM"
    * *Building models that describe nature*: Adding environmental covariates to a model, static vs. dynamic variables, scale/resolution. How do we interpret smooth terms? Relations between response distributions, when are particular distributions appropriate?
    * *Model checking and validation*: How do we know the model we fitted is "right"? How do we check our assumptions? What do we do when there are problems?
    * *Selecting between models*: What are sensible criteria for selection? Do we need to choose only one model? What can different models tell us?
    * *Where are the animals and how many are there?*: Making maps and estimates of abundance. Prediction grids: how to build them, extrapolation issues. Making predictions, plotting them.
    * *Do we trust our estimates?*: mapping uncertainty, uncertainty in total abundance. Incorporating uncertainty from the detection function.
    * *Advanced spatial modelling topics*: availability of animals, uncertain detection at zero ditance, autocorrelation, temporal models, distance sampling experiments (before-after comparison; designs etc).
  3. Appendices
    * *Data format*: A guide to getting your data into the right format for distance sampling analyses.
    * *Spatial modelling in a wider context*: How do density surface models compare to other techniques for spatial modelling of distance sampling data?


