create_interaction_matrix <- function(data, response_var) {
  predictors <- setdiff(names(data), response_var)
  predictor_matrix <- as.matrix(data[predictors])

  # vectorization for all possible interaction term
  num_predictors <- ncol(predictor_matrix)
  num_combinations <- num_predictors * (num_predictors - 1) / 2


  interaction_matrix <- matrix(nrow = nrow(data), ncol = num_combinations)
  col_names <- vector("list", num_combinations)

  # name col
  col_index <- 1
  for (i in 1:(num_predictors - 1)) {
    for (j in (i + 1):num_predictors) {
      interaction_matrix[, col_index] <- predictor_matrix[, i] * predictor_matrix[, j]
      col_names[[col_index]] <- paste(colnames(predictor_matrix)[i], "*", colnames(predictor_matrix)[j])
      col_index <- col_index + 1
    }
  }

  colnames(interaction_matrix) <- unlist(col_names)
  interaction_matrix
}

