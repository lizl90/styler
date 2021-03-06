#' Communicate a warning if necessary
#'
#' If roundtrip verification was not possible, issue a warning to review the
#' changes carefully.
#' @param changed Boolean with indicating for each file whether or not it has
#'   been changed.
#' @inheritParams can_verify_roundtrip
communicate_warning <- function(changed, transformers) {
  if (any(changed, na.rm = TRUE) && !can_verify_roundtrip(transformers)) {
    cat("Please review the changes carefully!")
  }
}

#' Communicate the summary of styling
#'
#' @param changed Boolean with indicating for each file whether or not it has
#'   been changed.
#' @param ruler_width Integer used to determine the width of the ruler.
communicate_summary <- function(changed, ruler_width) {
  cli::cat_rule(width = max(40, ruler_width))
  cat("Status\tCount\tLegend \n")
  cli::cat_bullet("\t", sum(!changed, na.rm = TRUE), "\tFile unchanged.", bullet = "tick")
  cli::cat_bullet("\t", sum(changed, na.rm = TRUE), "\tFile changed.", bullet = "info")
  cli::cat_bullet(bullet = "cross", "\t", sum(is.na(changed)), "\tStyling threw an eror.")
  cli::cat_rule(width = max(40, ruler_width))
}
