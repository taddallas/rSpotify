#' Control your Spotify instance through R
#'
#' play, pause, jump between playing tracks, and get track info from your R console. The
#' control function takes a single argument, which relate to track skipping (`next`, `prev`),
#' stopping and starting playback (`play`, `pause`), and obtaining track information (`info`)
#'
#' @param action the action that the user would like to take (described in description above).
#'
#' @author Tad Dallas
#' @export
#' @seealso vol
#' @examples
#' \dontrun{
#' #next track
#' control('next')
#' # who sings this?
#' control('info')
#'}
#'
control <- function(action='next'){
    ##check to see if sp is installed
    if(inherits(try(system("sp version", intern=TRUE)), 'try-error')){
        system('bash getSp.sh')
    }
    if(action=='next'){system('sp next &')}
    if(action=='play'){system('sp play &')}
    if(action=='pause'){system('sp pause &')}
    if(action=='prev'){system('sp prev &')}
    if(action=='info'){
      tmp <- system('sp current &', intern=TRUE)
      vec <- sapply(strsplit(tmp, '  '), function(x){f<-trimws(x); x[which(nchar(x)>1)]})
      TrackInfo <- vec[2,]
      names(TrackInfo) <- vec[1,]
      return(as.data.frame(TrackInfo, logical=FALSE))
    }
}
