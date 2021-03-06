#'
#' Input API key to be used for the other functions in the tempraturr, API key variable to your global environment
#'
#' @param apikey Copy and paste climacell API key to be used for use in this function
#'
#'
#' @return variable "apikey" is saved to your environment for further usage of this package
#'
#' @export

register_climacell_key <- function(apikey){

  stopifnot(apikey != '')

  assign("apikey", apikey, envir = globalenv())

}


#' Uses googlemap geocoding API to find the lat/lon of the location that would analyze whether for
#' Sets as default in your environmnet for all other functions in this package
#' required a google API Key.
#' Keys have a free trial period and can be acquired at https://developers.google.com/maps/documentation/geocoding/get-api-key
#' Use the ggmap register_google(key) function to register your key  with your R session
#'
#'
#' @importFrom ggmap geocode
#' @importFrom tibble tibble
#' @importFrom dplyr pull
#'
#' @param location The location you would like to set the lat/lon for all other functions passed as string. Be as specific as possible
#'
#' @export
find_loc <- function(location){

  cords <- geocode(location)

  lon <- cords %>%
      pull(lon)

  lat <- cords %>%
      pull(lat)

  assign("lat", lat, envir = globalenv())

  assign("lon", lon, envir = globalenv())
}
