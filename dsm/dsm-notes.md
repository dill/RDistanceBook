---
title: Additional notes for DSM chapter
author: David L Miller
---


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
     * check other response distributions (using qq plot)
     * check for residual autocorrelation (using dsm.cor)
     * check predictive power? (Oppel's test? is this BS?)


### Negative binomial

   - http://www.unc.edu/courses/2008fall/ecol/563/001/docs/lectures/lecture14.htm
   - http://www.johndcook.com/blog/2009/11/03/negative-binomial-poisson-gamma/

## Smoothing

 * `gam.check` to find $k$, _but_ don't make $k$ too big as this can lead to large predictions (large set of functions!)

### Bases

 * cyclic splines as a way of getting around the "humpbacks don't know when mothers' day is" problem


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

# Predictions and uncertainty

TODO
    - covariate values
    - variance estimation
    - integrating out certain parameters?

delta method http://www.ats.ucla.edu/stat/r/faq/deltamethod.htm

Ferrier S, Watson G, Pearce J, Drielsma M. 2002. Extended statistical approaches to modelling spatial pattern in biodiversity: the north-east New South Wales experience. I. Species-level modelling. Biodivers. Conserv. 11:2275–307


# GAMs in context stuff


- is everything a GAM?
- point processes




