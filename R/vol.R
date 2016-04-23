#' Control volume from R
#'
#' This function alters the computer speaker volume, by making a call to amixer. The value `mag` is the percent change you'd like,
#' so a 5% decrease (increase) in volume would correspond to a mag = 0.95 (1.05).
#'
#' @param  x this value is either the factor with which to increase or decrease the
#' speaker volume, or is an absolute volume. If x = "5+", it will increase volume
#' by 5%, if x = 50, the volume will be set at 50, on a scale from 0-100. Note
#' the difference in inputs. Incremental increases to volume are specified with
#' character arguments, absolute values (between 0 and 100) are given as numeric
#' values.
#'
#'
#' @author Tad Dallas
#' @export
#' @examples
#' \dontrun{
#' #pump up the jams!!
#' vol(100)
#' #mute your garbage music when your advisor walks in
#' vol(0)
#' #increase your speaker volume by 10%
#' vol("10+")
#' }

vol <- function(x = 50){
    if(is.character(x)){
      tmp <- unlist(strsplit(x,''))
      dir <- tmp[nchar(x)]
      perc <- paste(tmp[-nchar(x)], collapse='')
      system(paste("amixer -D pulse sset Master ", perc,"%", dir, sep=''))
    }

    if(!is.character(x)){
      system(paste("amixer -D pulse sset Master ", x,"%", sep=''))
    }
}
