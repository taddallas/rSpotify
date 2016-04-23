#' Get artist info
#'
#' Returns a vector of artist information, including number of followers, the uri code, genres, and a popularity score.
#'
#' @param   artistName The name of some band you want to query.
#'
#' @return named vector of artist characteristics
#'
#' @author Tad Dallas
#' @references https://developer.spotify.com/
#' @export
#' @examples
#'
#' ## Nobody loves AJJ
#' ajj <- getArtistInfo('AJJ')
#'
#'  ## Everybody loves Kanye
#' kanye <- getArtistInfo("Kanye West")



getArtistInfo=function(artistName){
	info=fromJSON(getURL(paste("https://api.spotify.com/v1/search?q=", gsub(' ', '+', artistName),"&type=artist", sep='')))$artists$items
	if(length(info) > 1){info <- info[[1]]}
   uri <- info$id[1]
   follows <- info$followers$total[1]
	 pop <- info$popularity[1]
	 picture <- info$images[[1]]$url[1]
	 genre <- paste(info$genres, collapse = ' , ')
   return(c(uri=uri, followers=follows, popularity=pop, genre = genre,  imageURL=picture))
}
