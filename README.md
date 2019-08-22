
<!-- README.md is generated from README.Rmd. Please edit that file - rmarkdown::render('README.Rmd', output_format = 'github_document', output_file = 'README.md') -->

# Geocomputation with R: Royal Geographic Society workshop

<!-- badges: start --> [![Launch Rstudio
Binder](http://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/geocompr/RGSWorkshop/master?urlpath=rstudio)
[![Build
Status](https://travis-ci.org/Robinlovelace/geocompr.svg?branch=master)](https://travis-ci.org/Robinlovelace/geocompr)
[![](https://img.shields.io/docker/automated/robinlovelace/geocompr.svg)](https://hub.docker.com/r/robinlovelace/geocompr/builds/)
<!-- badges: end -->

This repo contains a workbook to work through the [Geocomputation with R
pre-conference
workshop](https://www.rgs.org/events/summer-2019/geocomputation-with-r-%E2%80%93-free-workshop-and-reproduc/),
an event sponsored by the
[QMRG](https://quantile.info/geocomputation-with-r-book-demo-and-reproducible-map-competition/).

It is based on Geocomputation with R, a book by [Robin
Lovelace](https://www.robinlovelace.net/), [Jakub
Nowosad](https://nowosad.github.io/), and [Jannes
Muenchow](http://www.geographie.uni-jena.de/en/Muenchow.html):

> Lovelace, Robin, Jakub Nowosad and Jannes Muenchow (2019).
> Geocomputation with R. The R Series. CRC Press.

This book has been published by [CRC
Press](https://www.crcpress.com/9781138304512) in the [R
Series](https://www.crcpress.com/Chapman--HallCRC-The-R-Series/book-series/CRCTHERSER).
The online version of this book is free to read at
<https://geocompr.robinlovelace.net/>.

## Getting started

This tutorial assumes you have installed a recent version of R, an
editor you’re comfortable with (we recommend RStudio), and the necessary
packages. If you have not, check out the guidance here:
<https://geocompr.robinlovelace.net/spatial-class.html#prerequisites>
The packages we’ll can be installed as follows\[1\]:

``` r
install.packages("sf")
install.packages("spData")
```

All the packages needed to reproduce the contents of the book can be
installed with the following command:
`devtools::install_github("geocompr/geocompkg")`. The necessary packages
can be ‘loaded’ (technically they are attached) with the `library()`
function as follows:

``` r
library(sf)          # classes and functions for vector data
library(spData)      # contains example data
```

## What is geographic data in R?

In R geographic data is just an object like any other. R’s basic data
analysis object type is the data frame, which looks like this:

``` r
world
#> Simple feature collection with 177 features and 10 fields
#> geometry type:  MULTIPOLYGON
#> dimension:      XY
#> bbox:           xmin: -180 ymin: -90 xmax: 180 ymax: 83.64513
#> epsg (SRID):    4326
#> proj4string:    +proj=longlat +datum=WGS84 +no_defs
#> First 10 features:
#>    iso_a2        name_long     continent region_un          subregion
#> 1      FJ             Fiji       Oceania   Oceania          Melanesia
#> 2      TZ         Tanzania        Africa    Africa     Eastern Africa
#> 3      EH   Western Sahara        Africa    Africa    Northern Africa
#> 4      CA           Canada North America  Americas   Northern America
#> 5      US    United States North America  Americas   Northern America
#> 6      KZ       Kazakhstan          Asia      Asia       Central Asia
#> 7      UZ       Uzbekistan          Asia      Asia       Central Asia
#> 8      PG Papua New Guinea       Oceania   Oceania          Melanesia
#> 9      ID        Indonesia          Asia      Asia South-Eastern Asia
#> 10     AR        Argentina South America  Americas      South America
#>                 type    area_km2       pop  lifeExp gdpPercap
#> 1  Sovereign country    19289.97    885806 69.96000  8222.254
#> 2  Sovereign country   932745.79  52234869 64.16300  2402.099
#> 3      Indeterminate    96270.60        NA       NA        NA
#> 4  Sovereign country 10036042.98  35535348 81.95305 43079.143
#> 5            Country  9510743.74 318622525 78.84146 51921.985
#> 6  Sovereign country  2729810.51  17288285 71.62000 23587.338
#> 7  Sovereign country   461410.26  30757700 71.03900  5370.866
#> 8  Sovereign country   464520.07   7755785 65.23000  3709.082
#> 9  Sovereign country  1819251.33 255131116 68.85600 10003.089
#> 10 Sovereign country  2784468.59  42981515 76.25200 18797.548
#>                              geom
#> 1  MULTIPOLYGON (((180 -16.067...
#> 2  MULTIPOLYGON (((33.90371 -0...
#> 3  MULTIPOLYGON (((-8.66559 27...
#> 4  MULTIPOLYGON (((-122.84 49,...
#> 5  MULTIPOLYGON (((-122.84 49,...
#> 6  MULTIPOLYGON (((87.35997 49...
#> 7  MULTIPOLYGON (((55.96819 41...
#> 8  MULTIPOLYGON (((141.0002 -2...
#> 9  MULTIPOLYGON (((141.0002 -2...
#> 10 MULTIPOLYGON (((-68.63401 -...
```

To plot geographic data, do:

``` r
plot(world)
```

![A spatial plot of the world using the sf package, with a facet for
each attribute.](figures/world-all-1.png)

1.   If you’re running Mac or Linux, the previous command to install
    **sf** may not work first time. These operating systems (OSs) have
    ‘systems requirements’ that are described in the package’s
    [README](https://github.com/r-spatial/sf). Various OS-specific
    instructions can be found online, such as the article *Installation
    of R 3.5 on Ubuntu 18.04* on the blog
    [rtask.thinkr.fr](https://rtask.thinkr.fr/blog/installation-of-r-3-5-on-ubuntu-18-04-lts-and-tips-for-spatial-packages/).
