## rSpotify

[![Build Status](https://travis-ci.org/taddallas/rSpotify.svg)](https://travis-ci.org/taddallas/rSpotify)

> This package is no longer maintained, since Spotify now requires auth to get any artist information, or do pretty much anything. This is now essentially only a wrapper for the `sp` functionality, which itself is limited to changing tracks, pausing/playing, and volume control. 






rSpotify is an R interface to Spotify's API, allowing for the programmatic searching of artist info and connections between artists, as well as providing an R interface to control a local Spotify instance (i.e., you can use the `control` function to play, pause, skip tracks, and get artist info for the playing track from the R console).


### Installation

```r
# From GitHub
# install.packages("devtools")
devtools::install_github("taddallas/rSpotify")
library("rSpotify")
```
