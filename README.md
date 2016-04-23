## rSpotify

[![Build Status](https://travis-ci.org/taddallas/rSpotify.svg)](https://travis-ci.org/taddallas/rSpotify)

rSpotify is an R interface to Spotify's API, allowing for the programmatic searching of artist info and connections between artists, as well as providing an R interface to control a local Spotify instance (i.e., you can use the `control` function to play, pause, skip tracks, and get artist info for the playing track from the R console).

This is a completely `just for fun` project. It initially started as a joking conversation betwee Tom (our computer guru in the Drake lab) and myself, where I said it would be funny to have a Spotify app that calculates a "Nickelback number". This would be the number of steps along an undirected graph before you reach Nickelback, and would be a way to shame people for liking garbage music. It would also serve to shame people for being super pretentious. However, I abandoned this project so that I could work on my science.

Feel free to fork and contribute, or just steal the idea and make a Spotify App. After all, almost all of what I have done here is just utilizing the functionality added by other folks.


### Installation

```r
# From GitHub
# install.packages("devtools")
devtools::install_github("taddallas/rSpotify")
library("rSpotify")
```
