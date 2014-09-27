---
title: Additional notes for DSM chapter
author: David L Miller
---

# Constructing density surface models

 * Constructing DSMs
    - model construction flow diagram
    - actual model construction stuff
       - assume that detection function stuff already done in previous chapter?
       - how do we account for group size?
       - "knot" selection
       - response distributions (when/why/how) (see section below)
       - smoothing in general
       - fit, select terms, change response? How does response affect fit?
 * Model checking (maybe this should be rolled in with the above?)
    - simple gam.check stuff
    - autocorrelation checks
    - influence checks
    * those neat residual plots we did in the Italy paper
 * Model construction, information theoretic considerations etc
    - http://danieljhocking.wordpress.com/2014/03/25/review-of-an-information-theoretic-approach-to-ecology-and-evolution/
 * Seasonality
    - http://www.fromthebottomoftheheap.net/2014/05/09/modelling-seasonal-data-with-gam/


Notes:

  * Harihar et al 2013 have some stuff about forwards-backwards selection, use F-test of deviance explained.


## Steps to a DSM analysis

 * Detection function
     * fit detection functions
     * check absolute fit by $\chi^2$, if not possible use visual inspection
     * use best model by AIC
     * refer back to distance chapter
 * DSM
     * fit model with all covars (using method="REML")
     * ensure that k~=k'
     * cut covars back using select=TRUE and p-values
     * default use negative binomial for sea birds, can fit theta at the same time as other pars
     * check other response distributions (using qq plot)
     * check for residual autocorrelation (using dsm.cor)
     * check predictive power? (Oppel's test? is this BS?)





## Response distributions

  * compare Poisson/quasi/negbin/Tweedie w. plots
    * If quasi doesn't work then which way do we go? Plots of realisations from different p and theta values etc.
  * Tweedie -- Shono etc
  * counts
  * keep as close to the original measure as possible?

### Negative binomial

   - http://www.unc.edu/courses/2008fall/ecol/563/001/docs/lectures/lecture14.htm
   - http://www.johndcook.com/blog/2009/11/03/negative-binomial-poisson-gamma/


## Smoothing

 * `gam.check` to find $k$, _but_ don't make $k$ too big as this can lead to large predictions (large set of functions!)



## Model discrimination

 * randomised quantile residuals
 * plotting smooth functions
 * using `vis.gam` -- warning about averaging other covariates

## Other stuff

 * Advanced modelling
    - autocorrelation
    - Temporal inference
      - Gavin Simpson's posts interesting?
        - http://www.fromthebottomoftheheap.net/2011/06/12/additive-modelling-and-the-hadcrut3v-global-mean-temperature-series/
        - http://www.fromthebottomoftheheap.net/2014/06/16/simultaneous-confidence-intervals-for-derivatives/
    - incorporating MRDS models
 * Special cases
    - strip transects
    - points?
 * Other (fancy) stuff
    - finite area smoothing (soap/msg/CReSS)
    - markov random fields?
    - general $L_p$ matrix stuff
    - predictions using random effects
       * http://r.789695.n4.nabble.com/mgcv-gamm-predict-to-reflect-random-s-effects-td3622738.html
 * Other methods
    - talk about DSpat etc? -- this is all in the paper anyway...
http://ropensci.org/blog/2014/03/17/spocc/
 * plotting
    - can colour blind people read yr plots? http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/#a-colorblind-friendly-palette
    - rules for colour http://www.perceptualedge.com/articles/visual_business_intelligence/rules_for_using_color.pdf
  * Other modelling http://www.johndcook.com/blog/2011/05/25/crude-models/

# Considerations
\label{aref}

  * Do we call environmental covariates $z_k$ here?

# Predictions and uncertainty

TODO
    - covariate values
    - variance estimation
    - integrating out certain parameters?

delta method http://www.ats.ucla.edu/stat/r/faq/deltamethod.htm

## Obtaining additional covariates

Often environmental covariates that may be useful in the analysis were not collected at the same time as observations of the species in question. There are several large databases of geographically (and temporally) referenced data available. Although it would be impossible to list all such repositories here, some of the more popular databases are listed.

 * [NOAA Environmental Research Division's Data Access Program](http://coastwatch.pfeg.noaa.gov/erddap/index.html) (ERDDAP) -- contains sea surface temperature, chlorophyll-a levels, wind speeds, bathymetry and other variables for the coastlines of the USA.
 * [North Atlantic Oscillation](http://www.cru.uea.ac.uk/~timo/datapages/naoi.htm) -- data from University of East Anglia on pressure differenced between the Azores and Iceland, thought to be a good indicator of Northern Hemisphere climate.
 * [British Oceanographic Data Centre: Numerical model data](https://www.bodc.ac.uk/data/online_delivery/numerical_model_data/request/) -- similar to ERDDAP for UK coastline.
 * [British Oceanographic Data Centre](https://www.bodc.ac.uk/data/online_delivery/gebco/) -- bathymetry data for the UK.
 * [marineexplore.org](http://marineexplore.org) -- a large repository of worldwide oceanographic data from a large number of governmental and academic sources.
 * [LANDSAT data](https://earth.esa.int/web/guest/data-access/browse-data-products/-/asset_publisher/y8Qb/content/landsat-5-thematic-mapper-geolocated-terrain-corrected-systematic-processing-over-kiruna) -- landscape classification data

(TKTKTK more here?)

There are several R packages that allow one to easily import data from these databases:

 * [ROpenSci](https://github.com/ropensci/) -- offer a series of packages that give access to large databases.
 * `marmap` -- NOAA ETOPO1 bathymetry and tpolograph  http://www.plosone.org/article/info:doi%2F10.1371%2Fjournal.pone.0073051

TIP: Having included these variables in the data set, it is worth checking that the values fall in the range that you thought they did (using `range`) and mapping the covariates to ensure that they have been downloaded correctly and allocated to the segments/grid points that you expect. In particular it can be useful to download the values your require for prediction grid at the same time and plot these to check that the distribution is as expected. Additionally, keeping track of the units and scales that covariates are measured on can save confusion in the interpretation of the results.


