#' Calculate Weighted Median
#'
#' This function computes the weighted median of a numeric vector, allowing for
#' custom weights and handling of NA values.
#'
#' @param x A numeric vector for which to calculate the weighted median. Named 'x'
#'   as it's a common convention for the main input in R functions.
#' @param weights An optional numeric vector of weights, must be the same length
#'   as x. Default is NULL, which assigns equal weights. Named 'weights' for
#'   clarity and consistency with other R functions.
#' @param na.rm A logical value indicating whether NA values should be stripped
#'   before the computation proceeds. Named 'na.rm' to be consistent with base R
#'   functions and for its clear meaning (remove NA).
#'
#' @return A single numeric value representing the weighted median.
#'
#' @examples
#' # Example 1: Basic usage
#' result1 <- weighted_median(c(1, 2, 3, 4, 5))
#' print(paste("Basic usage result:", result1))
#'
#' # Example 2: With custom weights
#' result2 <- weighted_median(c(1, 2, 3, 4, 5), weights = c(5, 4, 3, 2, 1))
#' print(paste("Custom weights result:", result2))
#'
#' # Example 3: Handling NA values
#' result3 <- weighted_median(c(1, 2, NA, 4, 5), na.rm = TRUE)
#' print(paste("NA handling result:", result3))
#'
#' # Example 4: Demonstrating an error
#' \dontrun{
#' weighted_median(c("a", "b", "c"))
#' }
#'
#' @export
weighted_median <- function(x, weights = NULL, na.rm = FALSE) {
  if (!is.numeric(x)) {
    stop("Input 'x' must be a numeric vector.")
  }

  if (is.null(weights)) {
    weights <- rep(1, length(x))
  } else if (!is.numeric(weights) || length(weights) != length(x)) {
    stop("Weights must be numeric and the same length as the input vector.")
  }

  if (na.rm) {
    na_indices <- is.na(x) | is.na(weights)
    x <- x[!na_indices]
    weights <- weights[!na_indices]
  } else if (any(is.na(x)) || any(is.na(weights))) {
    return(NA)
  }

  if (length(x) == 0) return(NA)

  # Sort x and weights
  order <- order(x)
  x <- x[order]
  weights <- weights[order]

  # Calculate cumulative weights
  cum_weights <- cumsum(weights)
  total_weight <- sum(weights)

  if (total_weight == 0) return(NA)

  # Find the weighted median
  median_index <- which(cum_weights >= total_weight / 2)[1]

  # Check if we need to interpolate
  if (cum_weights[median_index] == total_weight / 2 && median_index < length(x)) {
    return((x[median_index] + x[median_index + 1]) / 2)
  } else {
    return(x[median_index])
  }
}
