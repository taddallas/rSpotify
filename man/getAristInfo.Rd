\name{getArtistInfo}
\alias{getArtistInfo}

\title{ Get artist info

}
\description{
 Returns a vector of artist information, including number of followers, the uri code, genres, and a popularity score.
}
\usage{
getArtistInfo(artistName)
}


\arguments{
  \item{artistName}{
The name of some band you want to query.
}
}

\value{
vector of artist characteristics
}

\references{
https://developer.spotify.com/
}

\author{
Tad Dallas
}



\examples{

# Nobody likes Defeater
defeater <- getArtistInfo("Defeater")

# Everybody loves Kanye
kanye <- getArtistInfo("Kanye West")

}
