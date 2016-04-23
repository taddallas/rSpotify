#' Control volume from R
#'
#' This function alters the computer speaker volume, by making a call to amixer. The value `mag` is the percent change you'd like,
#' so a 5% decrease (increase) in volume would correspond to a mag = 0.95 (1.05).
#'
#' @param  mag factor by which to increase or decrease the speaker volume by
#'
#' @return nothing
#' @author Tad Dallas
#' @export
#' @examples
#' \dontrun{
#' #pump up the jams!!
#' vol(2)
#' #mute your garbage music when your advisor walks in
#' vol(0)
#' }

vol <- function(mag=1.05){
    perc <- 100*(1 - mag)
    if(perc > 0){ dir <- "-"}
    if(perc <= 0){dir <- "+"}
    system(paste("amixer -D pulse sset Master ", abs(perc),"%", dir, sep=''))
}
