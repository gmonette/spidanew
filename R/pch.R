#' Easy to remember pch characters
#'
#' Fifteen pch symbols can be generated with 5 different shapes and 3 different types of fill.
#'
#' @param shape square, circle, triangle, diamond, ltriangle (or 1,2,3,4,5)
#' @param fill empty, filled, filled with different color (or 1,2,3)
#' @export
pch <- function(shape=1,fill=1){
  shapenames <- c('square','circle','triangle','diamond','ltriangle')
  fillnames <- c('empty','filled','fill')
  if(!is.numeric(shape)) shape <- grep(shape,shapenames)
  if(!is.numeric(fill)) fill <- grep(fill,fillnames)
  mat <- t(rbind( c(0,1,2,5,6), c(15,16,17,18,25),c(22,21,24,23,25)))
  mat[cbind(shape,fill)]
}
