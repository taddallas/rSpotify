\name{getRelated}
\alias{getRelated}

\title{ Gets related artists to a single input artist

}
\description{
This function is included in some other functions, but is kind of useful in it's own right. You hand it a band name, it outputs a 4 column edgelist containing band name and Spotify ID for both interactors. 
}
\usage{
getRelated(artistName)
}


\arguments{
  \item{artistName}{
The name of some band you want to query. 
}
}

\value{
A matrix of 4 columns (edgelist) containing band name and Spotify ID for both interactors. 
}

\references{
https://developer.spotify.com/
}

\author{
Tad Dallas
}



\examples{

DefLike=getRelated("Defeater")


}

