## rSpotify

[![Build Status](https://travis-ci.org/taddallas/rSpotify.svg)](https://travis-ci.org/taddallas/rSpotify)

rSpotify is an R interface to Spotify's API. This is a completely `just for fun` project. It initially started as a joking conversation betwee Tom (our computer guru in the Drake lab) and myself, where I said it would be funny to have a Spotify app that calculates a "Nickelback number". This would be the number of steps along an undirected graph before you reach Nickelback, and would be a way to shame people for liking garbage music. It would also serve to shame people for being super pretentious. However, I abandoned this idea when I couldn't write the code to search Spotify's network extensively. This seems like a pretty easy barrier, but it was enough for me to visualize some small networks of artist relationships. 

Feel free to fork and contribute, or just steal the idea and make a Spotify App. After all, almost all of what I have done here is just utilizing the functionality added by other folks. 


### Installation

```r
# From GitHub
# install.packages("devtools")
devtools::install_github("taddallas/rSpotify")
library("rSpotify")

```

<iframe src='bandsPlot.html' height=500px width=500px></iframe>
