prepare_data <- function(data, response_var) {

  if (!response_var %in% names(data)) {
    stop("The response variable is not found in the dataset.")
  }

  # keep all binary variables
  binary_vars <- sapply(data, function(x) all(x %in% c(0, 1)))
  data[, c(response_var, names(binary_vars[binary_vars]))]
}
