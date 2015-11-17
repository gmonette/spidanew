#' Create a longitudinal file from a wide file
#'
#' Uses a minimal set of arguments to create a long file using \link{\code{stats::reshape}}.
#'
#' @param data wide data frame
#' @param sep (default '_') single character separator between long names and 'time' value.
#'        Variable names with this separator are transformed to long variables.
#' @param timevar (default 'time') names of variable in long file to identify occasions. Its values are taken from the suffix following
#'        the 'sep' character in each time-varying variable.
#' @param idvar  (default: 'id') variable name in wide file to identify source row in wide file. Its values must be unique for each row.
#' @param ids  (default \code{1:nrow(data)}) values for idvar in long file if the variable 'idvar' does not exist in in the wide file. Ignored
#'        if \code{idvar} exists in \code{data}.
#' @param expand (default TRUE): if 'time' values are inconsistent, fill in missing 'time's with NAs.
#' @param safe_sep temporary safe? separator
#' @return 'long' file with each wide row repeated as many times as there are distinct values for the 'timevar' variable.
#' @examples
#' z <- data.frame(id =letters[1:10], id2= 11:20, v_L = 1:10, v_R = 11:20)
#' long(z)
#' long(z, timevar = 'Side', idvar = 'idn', ids = LETTERS[1:10])
#' long(z, timevar = 'Side', idvar = 'idn', ids = z$id2)
#'
#' # unbalanced times
#' z <- data.frame(id =letters[1:10], id2= 11:20, v_L = 1:10, v_R = 11:20, z_L = 21:30)
#' long(z)
#' @export
long <- function (data, sep = "_",  timevar = 'time',
                  idvar = 'id', ids = 1:nrow(data),
                  expand = TRUE, safe_sep = "#%@!", ...)
{
  if (timevar %in% names(data)) warning(paste("Variable",timevar, "in data is replaced by a variable to mark occasions"))
  if (expand) {
    namessafe <- sub(sep, safe_sep, names(data), fixed = TRUE)
    varnames <- grep(safe_sep, namessafe, value = TRUE, fixed = TRUE)
    names <- unique(sub(paste(safe_sep, ".*$", sep = ""),
                        "", varnames))
    times <- unique(sub(paste("^.*", safe_sep, sep = ""),
                        "", varnames))
    allnames <- paste(rep(names, each = length(times)), sep,
                      rep(times, length(names)), sep = "")
    z <- data
    for (nn in allnames) {
      z[[nn]] <- if (is.null(data[[nn]]))
        NA
      else data[[nn]]
    }
    data <- z
  }
  namessafe <- sub(sep, safe_sep, names(data), fixed = TRUE)
  namestimes <- sub(paste("^.*", safe_sep, sep = ""), "ZZZZZ",
                    namessafe)
  ord <- order(namestimes)
  data <- data[, ord]
  stats::reshape(data, direction = "long", sep = sep,
          varying = grep(sep, names(data), fixed = TRUE),
          timevar = timevar, idvar = idvar,
          ids = ids, ...)
}

#
#  z <- data.frame(id =letters[1:10], id2= 11:20, v_L = 1:10, v_R = 11:20)
#  long(z)
#  long(z, timevar = 'Side', idvar = 'idn', ids = LETTERS[1:10])
#  long(z, timevar = 'Side', idvar = 'idn', ids = z$id2)
#
#  # unbalanced times
#  z <- data.frame(id =letters[1:10], id2= 11:20, v_L = 1:10, v_R = 11:20, z_L = 21:30)
#  long(z)

