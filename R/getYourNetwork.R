#' Takes a vector of bands and shows their relatedness
#'
#' Only takes a single step away from each artist in the `bands` vector. This is useful for targetting bands that you already like, and determining what bands are one step removed. Highly connected bands not in your `bands` vector may be the ones to check out...or not. Who knows really?
#'
#'
#' @param bands A vector of band names.
#'
#' @return A matrix of 4 columns (edgelist) containing band name and Spotify ID for both interactors.
#' @author Tad Dallas
#' @references https://developer.spotify.com/
#' @export
#'
#' @examples
#'
#' \dontrun{
#' library(networkD3)
#' bands <- c('Andrew Jackson Jihad', 'The Mountain Goats', 'Katy Perry')
#' test <- getYourNetwork(bands)
#'  # This will output an html file that will contain a dynamic network plot
#' bandsPlot <- d3SimpleNetwork(test, textColour="black", linkColour='green',
#'                              nodeColour='blue', charge=-500,fontsize=20,
#'                              linkDistance=100, width=1000, height=1000,
#'                              file="bandsPlot.html", opacity=0.3)}

getYourNetwork <-function(bands){
   start=getRelated(bands[1])
   for(i in 2:length(bands)){
      temp=getRelated(bands[i])
      start=rbind(start, temp)
   }
   edge=start[, c('sourceName', 'names')]

   end=getRelated(edge[1,2])
   end=end[which(end[,'names'] %in% edge[,2]),]
   for(i in 2:length(edge[,2])){
     temptemp=getRelated(edge[i,2])
     cutdown=temptemp[which(temptemp[,'names'] %in% edge[,2]),]
     end=rbind(end, cutdown)
   }
   edge1=end[,c('sourceName', 'names')]
   return(rbind(edge, edge1))
}
