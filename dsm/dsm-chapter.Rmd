# What is density surface modelling?


## Introduction

When surveying biological populations it is increasingly common to record spatially referenced data, for example: coordinates of observations, habitat type, elevation or (if at sea) bathymetry. Spatial models allow for vast databases of spatially-referenced data \citep[e.g. OBIS-SEAMAP,][]{Halpin:2009je} to be harnessed, enabling investigation of interactions between environmental covariates and population densities. Here we use "spatial model" to refer to any model that includes any spatially referenced covariates, not only those models that include explicit location terms. 

Models built using spatially-referenced data can be extremely useful in a number of different ways. 

  * Mapping the spatial distribution of a population can be extremely useful, especially when communicating results to non-experts.
  * Animal populations may vary spatially, according to some environmental factors: they may avoid certain habitats or be attracted to others. These effects remain unmodelled when Horvitz-Thompson-type methods are used, including environmental covariates may improve prediction accuracy and reduce uncertainty.
  * Aside from improvements in point and interval estimates, we may also wish to discover or confirm the relationship between a biological population and a particular environmental feature. For example: black bears prefer lower or higher altitudes? Are common loon distributions driven by primary production?
  * Following from the above, it is also possible to formulate models to test for the effect of anthropogenic interventions on a population's habitat.

The major contrast between the approach detailed in this chapter and that of the previous chapters is that we now consider *model*-based inference about the biological populations in question rather than *design*-based inference. This has some advantages and some disadvantages. A spatially-explicit model can explain the between-transect variation (which is often a large component of the variance in design-based estimates) and so using a model-based approach can lead to smaller variance in estimates of abundance than design-based estimates. Model-based inference also enables the use of data from opportunistic surveys, for example, incidental data arising from "ecotourism" cruises \citep{Williams:2006tz}. As usual, we are "trading assumptions for data" when building a density surface model, we remove the assumption that animals are distributed uniformly with respect to the transects, but in order to remove this assumption we must include additional data in the model.



When we talk about "density surface models" (or DSMs), we are referring to the "count model" of \cite{Hedley:2004et}. Modelling proceeds in two steps: a detection function is fitted to the distance data to obtain detection probabilities for clusters (flocks, pods, etc.) or individuals. Counts are then summarised per segment (point or contiguous transect section). A generalised additive model \cite[GAM; e.g.][]{Wood:2006wz} is then constructed with the per-segment counts as the response with either counts or segment areas corrected for detectability.

TKTKTK modelling flow diagram here?

\ref{aref}

## Segments

TKTKTK include a forward reference to segment size stuff

Both line and point transects survey data can be used in a DSM analysis. If lines are used then they are are split into contiguous \textit{segments} (indexed by $j$), which are of length $l_j$. Segments should be small enough such that neither density of objects nor covariate values vary appreciably within a segment. Usually, making segments approximately square ($2w\times 2w$, where $w$ is the truncation distance) is sufficient as usually sighting distances are usually on a much smaller scale than the scale on whcih covariates vary (TKTKTK this is discussed futher in SECTIONXXX). The area of each segment enters the model as (or as part of) an offset: the area of segment $j$ is $A_j = 2wl_j$ and for point $j$ is $A_j=\pi w^2$. We simply refer to "segments" to refer to both split lines and points and disambiguate when necessary.

Count or estimated abundance per  segment is modelled as a sum of smooth functions of covariates ($z_{jk}$ with $k$ indexing the covariates, e.g., location, sea surface temperature, weather conditions; measured at the segment/point level) using a generalized additive model. Smooth functions are modelled as splines, providing flexible unidimensional (and higher-dimensional) curves (and surfaces, etc) that describe the relationship between the covariates and response. \cite{Wood:2006wz} and \cite{ruppert2003semiparametric} provide more in-depth introductions to smoothing and generalized additive models.

TKTKTK diagram of the bears in boxes here?

We begin by describing a formulation where only covariates measured per-segment (e.g. habitat, Beaufort sea state) are included in the detection function. We later expand this simple formulation to include observation level covariates (e.g., cluster size, species) in the detection function.


## Count as response

The model for the count per segment is:
$$
\mathbb{E}(n_j) = \hat{p}_j A_j \exp\left[ \beta_0 + \sum_k f_k\left(z_{jk}\right) \right],
$$
where the $f_k$s are smooth functions of the covariates and $\beta_0$ is an intercept term. Multiplying the segment area ($A_j$) by the probability of detection ($\hat{p}_j$) gives the \textit{effective area} for segment $j$. If there are no covariates other than distance in the detection function then the probability of detection is constant for all segments (i.e., $\hat{p}_j=\hat{p}$, $\forall j$). The distribution of $n_j$ can be modelled as an overdispersed Poisson, negative binomial, or Tweedie distribution (TKTKTK see section on response distributions). 

As well as simply calculating abundance estimates, relationships between covariates and abundance can be illustrated via plots of marginal smooths. The effect of depth on abundance (on the scale of the link function) for the dolphin data can be seen in Fig. \ref{depth-gamplot}. 

An alternative to modelling counts is to use the per-segment/circle abundance using distance sampling estimates as the response. In this case we replace $n_j$ by:
$$
\hat{N}_j = \sum_{r=1}^{R_j} \frac{s_{jr}}{\hat{p}_j},
$$
where $R_j$ is the number observations in segment $j$ and $s_{jr}$ is the size of the $r^\text{th}$ cluster in segment $j$ (if the animals occur individually then $s_{jr}=1$, $\forall j,r$). 

The following model is then fitted:
$$
\mathbb{E}(\hat{N}_j) = A_j \exp\left[ \beta_0 + \sum_k f_k\left(\mathbf{z}_{jk}\right) \right],
$$
where $\hat{N}_j$, as with $n_j$, is assumed to follow an overdispersed Poisson, negative binomial, or Tweedie distribution (see \textit{Recent developments}, below). Note that the offset ($A_j$) is now the area of segment/point rather than effective area of the segment/point. Although $\hat{N}_j$ can always be modelled instead of $n_j$, it seems preferable to use $n_j$ when possible, as one is then modelling actual (integer) counts as the response rather than estimates. Note that although $\hat{N}_j$ may take non-integer values, this does not present an estimation problem for the response distributions covered here.

## Covariates at the observation level

The above models consider the case where the covariates are measured at the segment/point level. Often covariates ($z_{ij}$, for individual/cluster $i$ and segment/point $j$) are collected on the level of observations; for example sex or cluster size of the observed object or identity of the observer. In this case the probability of detection is a function of the object (individual or cluster) level covariates $\hat{p}(z_i)$. Object level covariates can be incorporated into the model by adopting the following estimator of the per-segment/point abundance:
$$
\hat{N}_j = \sum_{r=1}^{R_j} \frac{s_{jr}}{\hat{p}(z_{rj})}.
$$
Density, rather than abundance, can be modelled by excluding the offset and instead dividing the count (or estimated abundance) by the area of the segment/point (and weighting observations by the segment/point areas). We concentrate on abundance here; see \cite{Hedley:2004et} for further details on modelling density.






## Two-stage models (TKTKTK does this go here?)

Generally very little information is lost by taking a two-stage approach. This is because transects are typically very narrow compared with the width of the study area so, provided no significant density variation takes place "across" the width of the lines or within the point, there is no information in the distances about the spatial distribution of animals (this is an assumption of two-stage approaches). 

Two-stage approaches are effectively "divide and conquer" techniques: concentrating on the detection function first, and then, given the detection function, fitting the spatial model. One-stage models are more difficult to both estimate and check as both steps occur at once; models are potentially simpler from the perspective of the user and perhaps more mathematically elegant.

Two-stage models have the disadvantage that to accurately quantify model uncertainty one must appropriately combine uncertainty from the detection function and spatial models. This can be challenging; however, the alternative of ignoring uncertainty from the detection process \cite[e.g.][]{Niemi:2010kx} can produce confidence or credible intervals for abundance estimates that have coverage below the nominal level.







