#' Examines all bands related from a central band
#'
#' For any number of `steps`, this function finds a set of related artists that are `steps` links away in related artist space
#'
#'
#' A `steps` value of 0 just finds the most related bands of the input band, while a `steps` value of 1 would examine the most related bands of the input band, and the most related bands of those bands. This gets out of control pretty quickly, so I recommend having some patience and selecting a `steps` value less than 5.
#' The number of related bands for a given artist is controlled by `perStep`, which defaults at the max number of bands that Spotify gives you (`perStep = 20`)'
#'
#' @param   startNode The artist to start with, and radiate out from
#' @param steps Number of layers to go outward from the input band.
#' @param perStep The number of related bands to examine per artist of interest. See `details` for more information
#' @param igraphObj Boolean. Do you want the output as an edgelist or an igraph object?
#'
#' @return An igraph network object or an edgelist. The choice between the two really depends on how you want to visualize/analyze the graph. Check out the `getYourNetwork()` function examples for some cool dynamic network plotting.
#'
#' @author Tad Dallas
#' @references https://developer.spotify.com/
#' @export
#' @examples
#'
#' library(igraph)
#' hs <- getPath("The Hold Steady", steps=0, perStep=15, igraphObj=TRUE)
#' plot(hs)

getPath <-function(startNode, steps=100, perStep=20, igraphObj=TRUE){
  flag <- 0
  branch <- getRelated(startNode)
  edge <- data.frame(sourceID=branch[,'sourceName'], id=branch[,'names'])[1:perStep,]
  nodes  <- branch[,'names']

 while(flag < steps){
    for(i in 1:length(nodes)){
      temp <- getRelated(nodes[i])
      newleaf <- data.frame(sourceID=temp[,'sourceName'], id=temp[,'names'])[1:perStep,]
      edge <- rbind(edge, newleaf[-which(newleaf[,'id'] %in% edge[,'sourceID']),])
     }
    toss <- which(newleaf[,'id'] %in% edge[,'sourceID'])
    if(length(toss)>1){
      newnodes <- newleaf[-which(newleaf[,'id'] %in% edge[,'sourceID']), 'id']
      }else{
        newnodes=newleaf[,'id']
      }
    nodes <-newnodes
  flag <-flag+1
  }
	if(igraphObj){
    network  <- graph.edgelist(as.matrix(edge));
    return(network)
  }
	if(igraphObj==FALSE){return(edge)}
}
