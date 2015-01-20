\name{getYourNetwork}
\alias{getYourNetwork}

\title{
Takes a vector of bands and shows their relatedness
}
\description{
Only takes a single step away from each artist in the `bands` vector. This is useful for targetting bands that you already like, and determining what bands are one step removed. Highly connected bands not in your `bands` vector may be the ones to check out...or not. Who knows really?
}

\usage{
getYourNetwork(bands)
}

\arguments{
  \item{bands}{
A vector of band names. 
}
}

\details{
This is similar to `getPath`, but it only takes a single step away from each of the elements in `bands`. 
}

\value{
Outputs an edgelist containing
}

\author{
Tad Dallas
}

\examples{
	library(d3Network)
	bands=c('Andrew Jackson Jihad', 'The Mountain Goats', 'Katy Perry')
	test=getYourNetwork(bands)
	
	#This will output an html file that will contain a dynamic network plot	
	bandsPlot=d3SimpleNetwork(test, textColour="black", linkColour='green', nodeColour='blue', charge=-500, fontsize=20, linkDistance=100, width=1000, height=1000, file="bandsPlot.html", opacity=0.3)

}

