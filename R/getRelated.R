getRelated <-function(artistName){
  info=fromJSON(getURL(paste("https://api.spotify.com/v1/search?q=", gsub(' ', '+', artistName),"&type=artist", sep='')))$artists$items
  name=info$name[1]
  id=unlist(strsplit(info$uri[1],':'))[3]

  #Then it finds related artists
  site=paste("https://api.spotify.com/v1/artists/",id,"/related-artists", sep='')
  
  relArtists=as.data.frame(fromJSON(getURL(site, httpheader = c(Accept = "application/json"))))
  relatedName=relArtists[,7]
  relatedID= matrix(unlist(strsplit(relArtists[,10], ":")), byrow=TRUE,ncol=3)[,3]
  return(data.frame(sourceID=id, sourceName=name, names=relatedName, id=relatedID))
}
