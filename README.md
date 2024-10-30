
<!-- README.md is generated from README.Rmd. Please edit that file -->

# weightedmedian

<!-- badges: start -->
<!-- badges: end -->

The goal of weightedmedian is to provide a function for calculating the
weighted median of a numeric vector. This package allows for custom
weights and handles NA values, offering a flexible tool for statistical
analysis and data processing.

## Installation

You can install the development version of weightedmedian from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2024/assignment-b2-Xpado-star")
```

## Usage

This is a basic example which shows you how to use the weighted_median
function:

``` r
library(weightedmedian)

# weighted_median <- function(x, weights = NULL, na.rm = FALSE)

# Basic usage
weighted_median(c(1, 2, 3, 4, 5))
#> [1] 3

# With custom weights
weighted_median(c(1, 2, 3, 4, 5), weights = c(5, 4, 3, 2, 1))
#> [1] 2

# Handling NA values
weighted_median(c(1, 2, NA, 4, 5), na.rm = TRUE)
#> [1] 3
```

## Function Details

The weighted_median function computes the weighted median of a numeric
vector. It has the following parameters:

x: A numeric vector for which to calculate the weighted median.

weights: An optional numeric vector of weights. Must be the same length
as x. Default is NULL, which assigns equal weights.

na.rm: A logical value indicating whether NA values should be stripped
before the computation proceeds. Default is FALSE.

The function returns a single numeric value representing the weighted
median.

## Examples

Here are some more examples of using the weighted_median function:

``` r
# Vector with even number of elements
weighted_median(c(1, 2, 3, 4))
#> [1] 2.5

# Vector with odd number of elements and custom weights
weighted_median(c(1, 2, 3, 4, 5), weights = c(1, 1, 2, 1, 1))
#> [1] 3

# Handling NA values
weighted_median(c(1, 2, NA, 4, 5, NA), na.rm = TRUE)
#> [1] 3
```

## Contributing

Contributions to improve weightedmedian are welcome. Please submit pull
requests or open issues on the GitHub repository.
