#' Data preparation -- keep response variable(continuous) and all other binary variables
#'
#' @param data - original data
#' @param response_var - response variable y
#'
#' @return cleaned data
#' @export this function is available/exported to the user
#'
#' @examples
#'
#' set.seed(1234)
#' n <- 100
#' v1 = rbinom(n, 1, 0.4)
#' v2 <- rbinom(n, 1, 0.5)
#' v3 <- rbinom(n, 1, 0.6)
#' v4 = rnorm(n)
#' v5 = rbinom(n, 1, 0.6)
#' interaction_effect1 <- v2 * v3
#' interaction_effect2 <- v1 * v3
#' y1 <- 2 * v1 + 2 * v2 + 2 * v3 + 4 * v4 + 3 * v5 + 100 * interaction_effect1 + 100 * interaction_effect2 + rnorm(n,mean=0,sd=1)
#' data <- data.frame(y = y1, v1 = v1, v2 = v2, v3 = v3, v4 = v4, v5 = v5)
#' prepared_data <- prepare_data(data, "y")
#' print(head(prepared_data))

prepare_data <- function(data, response_var) {

  # check if response variable exists
  if (!response_var %in% names(data)) {
    stop("The response variable is not found in the dataset.")
  }

  # keep all binary variables
  binary_vars <- sapply(data, function(x) all(x %in% c(0, 1)))
  data[, c(response_var, names(binary_vars[binary_vars]))]
}
